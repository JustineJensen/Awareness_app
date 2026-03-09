import 'package:flutter/material.dart';
import 'package:security_awareness_app/controller/lesson_controller.dart';
import 'package:security_awareness_app/model/phishing_step_model.dart';

class PhishingLessonScreen extends StatefulWidget {
  const PhishingLessonScreen({super.key});

  @override
  State<PhishingLessonScreen> createState() => _PhishingLessonScreenState();
}

class _PhishingLessonScreenState extends State<PhishingLessonScreen> {
  final LessonController _controller = LessonController();

  int _currentStep = 0;
  int? _selectedOptionIndex;
  bool _submitted = false;

  void _goNext() {
    if (_currentStep < _controller.getPhishingStepsCount() - 1) {
      setState(() {
        _currentStep++;
        _selectedOptionIndex = null;
        _submitted = false;
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final step = _controller.getPhishingStep(_currentStep);
    final progressPercent = (step.progress * 100).round();

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 18),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const Text(
                        'Back to Hub',
                        style: TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      Text(
                        'Lesson ${step.lessonIndex} of ${step.totalLessons}',
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'Phishing Detection',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '$progressPercent%',
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: LinearProgressIndicator(
                      value: step.progress,
                      minHeight: 8,
                      backgroundColor: const Color(0xFFE7E7FB),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF5B61F6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: _buildStep(step),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(PhishingStepModel step) {
    switch (step.type) {
      case PhishingStepType.tip:
        return _buildTipStep(step);
      case PhishingStepType.scenario:
        return _buildScenarioStep(step);
      case PhishingStepType.summary:
        return _buildSummaryStep(step);
    }
  }

  Widget _buildTipStep(PhishingStepModel step) {
    return Column(
      children: [
        Text(
          step.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10),
        _badge(step.badgeText, const Color(0xFFEAF2FF), const Color(0xFF2563FF)),
        const SizedBox(height: 28),
        _contentCard(
          sectionTitle: step.sectionTitle,
          points: step.points ?? [],
          icon: Icons.lightbulb_outline,
        ),
        const SizedBox(height: 26),
        _primaryButton(
          text: 'Continue',
          onTap: _goNext,
        ),
      ],
    );
  }

  Widget _buildSummaryStep(PhishingStepModel step) {
    return Column(
      children: [
        Text(
          step.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 28),
        _contentCard(
          sectionTitle: step.sectionTitle,
          points: step.points ?? [],
          icon: Icons.lightbulb_outline,
          bulletIcon: '🚩',
        ),
        const SizedBox(height: 26),
        _primaryButton(
          text: 'Complete Module',
          onTap: _goNext,
          icon: Icons.emoji_events_outlined,
        ),
      ],
    );
  }

  Widget _buildScenarioStep(PhishingStepModel step) {
    final options = step.options ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            children: [
              Text(
                step.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              _badge(
                step.badgeText,
                const Color(0xFFF4EAFE),
                const Color(0xFFA020F0),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFF9F2FF),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFE7C9FF)),
          ),
          child: Text(
            step.scenarioEmail ?? '',
            style: const TextStyle(
              fontSize: 16,
              height: 1.7,
            ),
          ),
        ),
        const SizedBox(height: 28),
        const Text(
          'Choose your response:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF64748B),
          ),
        ),
        const SizedBox(height: 14),
        ...List.generate(options.length, (index) {
          final option = options[index];
          final isSelected = _selectedOptionIndex == index;
          final showFeedback = _submitted && isSelected;

          Color borderColor = const Color(0xFFE5E7EB);
          Color bgColor = Colors.white;

          if (showFeedback && option.isCorrect) {
            borderColor = const Color(0xFF00C853);
            bgColor = const Color(0xFFEFFBF3);
          } else if (showFeedback && !option.isCorrect) {
            borderColor = Colors.redAccent;
            bgColor = const Color(0xFFFFF1F1);
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: borderColor, width: 1.5),
              ),
              child: InkWell(
                onTap: _submitted
                    ? null
                    : () {
                        setState(() {
                          _selectedOptionIndex = index;
                        });
                      },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      isSelected
                          ? (showFeedback && option.isCorrect
                              ? Icons.check_circle
                              : Icons.radio_button_checked)
                          : Icons.radio_button_unchecked,
                      color: showFeedback && option.isCorrect
                          ? const Color(0xFF00C853)
                          : const Color(0xFFD1D5DB),
                      size: 28,
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            option.text,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          if (showFeedback) ...[
                            const SizedBox(height: 12),
                            Text(
                              option.feedback,
                              style: TextStyle(
                                color: option.isCorrect
                                    ? const Color(0xFF0A8F3D)
                                    : Colors.redAccent,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
        const SizedBox(height: 14),
        _primaryButton(
          text: _submitted ? 'Continue' : 'Submit Answer',
          onTap: () {
            if (_submitted) {
              _goNext();
              return;
            }

            if (_selectedOptionIndex == null) return;

            setState(() {
              _submitted = true;
            });
          },
        ),
      ],
    );
  }

  Widget _badge(String text, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.lightbulb_outline, size: 18, color: fg),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: fg,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentCard({
    required String sectionTitle,
    required List<String> points,
    required IconData icon,
    String? bulletIcon,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFF2196F3), Color(0xFF00BCD4)],
                  ),
                ),
                child: Icon(icon, color: Colors.white, size: 30),
              ),
              const SizedBox(width: 16),
              Text(
                sectionTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          ...points.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bulletIcon == null
                      ? const Icon(
                          Icons.check_circle_outline,
                          color: Color(0xFF2563FF),
                          size: 24,
                        )
                      : Text(
                          bulletIcon,
                          style: const TextStyle(fontSize: 22),
                        ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      point,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF64748B),
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _primaryButton({
    required String text,
    required VoidCallback onTap,
    IconData? icon,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: double.infinity,
        height: 58,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF2563FF), Color(0xFF0891B2)],
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: Colors.white),
              const SizedBox(width: 10),
            ],
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (icon == null) ...[
              const SizedBox(width: 10),
              const Icon(Icons.chevron_right, color: Colors.white),
            ],
          ],
        ),
      ),
    );
  }
}