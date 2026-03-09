import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:security_awareness_app/auth/auth_block.dart';
import 'package:security_awareness_app/controller/module_controller.dart';
import 'package:security_awareness_app/core/contains.dart';
import 'package:security_awareness_app/widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ModuleController moduleController = ModuleController();

  @override
  Widget build(BuildContext context) {
    final categories = moduleController.getCategories();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthNotAuth) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.lightBackground,
        body: SafeArea(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is AuthSuccess) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 840),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),

                          Row(
                            children: [
                              Container(
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF7C3AED),
                                      Color(0xFF4F46E5),
                                    ],
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 14,
                                      color: Color(0x22000000),
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.shield_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 14),

                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'CloudZenn',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16,
                                        color: AppColors.textDark,
                                      ),
                                    ),
                                    Text(
                                      'Hey Justine! 👋',
                                      style: TextStyle(
                                        color: AppColors.textMuted,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              IconButton(
                                tooltip: 'Logout',
                                icon: const Icon(Icons.logout),
                                onPressed: () {
                                  context.read<AuthBloc>().logout();
                                },
                              ),
                            ],
                          ),

                          const SizedBox(height: 26),

                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              gradient: AppGradients.blue,
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your Learning Journey',
                                  style: TextStyle(color: Colors.white70),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '0%',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Overall Progress',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: 20),
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: LinearProgressIndicator(
                                    value: 0,
                                    minHeight: 6,
                                    backgroundColor: Color(0x55FFFFFF),
                                    valueColor:
                                        AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 30),

                          const Text(
                            'Choose Learning Path',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Select a category to explore modules',
                            style: TextStyle(color: AppColors.textMuted),
                          ),
                          const SizedBox(height: 20),

                          ...categories.map(
                            (category) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: CategoryCard(
                                category: category,
                                progress: 0,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/modules',
                                    arguments: category.id,
                                  );
                                },
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          Row(
                            children: [
                              Expanded(
                                child: _statCard(
                                  value:
                                      '${moduleController.getTotalModules()}',
                                  label: 'Total Modules',
                                  valueColor: const Color(0xFF2563FF),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: _statCard(
                                  value:
                                      '${moduleController.getCompletedModules()}',
                                  label: 'Completed',
                                  valueColor: const Color(0xFF16A34A),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: _statCard(
                                  value:
                                      '${moduleController.getTotalLessons()}',
                                  label: 'Total Lessons',
                                  valueColor: const Color(0xFFA855F7),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Not authenticated'),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (_) => false,
                        );
                      },
                      child: const Text('Go to Login'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _statCard({
    required String value,
    required String label,
    required Color valueColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 21,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}