import 'package:security_awareness_app/model/module_model.dart';
import 'package:security_awareness_app/repositories/progress_repository.dart';

class ModuleController {

  final ProgressRepository _progressRepository = ProgressRepository();

  List<ModuleModel> modules = [
    ModuleModel(
      id: 'infosec',
      title: 'Protecting Your Personal Information',
      subtitle: 'Learn to identify and avoid phishing scams.',
      modules: 4,
      route: '/modules/phishing',
    ),
    ModuleModel(
      id: 'cyber',
      title: 'Password Security',
      subtitle: 'Best practices for creating and managing passwords.',
      modules: 6,
      route: '/modules/password',
    ),
    ModuleModel(
      id: 'ai',
      title: 'Social Engineering',
      subtitle: 'Understand social engineering tactics and how to protect against them.',
      modules: 5,
      route: '/modules/social_engineering',
    ),
     ModuleModel(
      id: 'ethics',
      title: 'Your Rights & Responsibilities Online',
      subtitle: 'Understand privacy and legal issues online.',
      modules: 7,
      route: '/modules/ethics',
    ),
  ];
  Future<List<ModuleModel>> loadProgress(String userId) async {
    List<ModuleModel> updatedModules = [];
    for (var module in modules) {
      double progress = await _progressRepository.getModuleProgress(userId, module.id);
      updatedModules.add(ModuleModel(
        id: module.id,
        title: module.title,
        subtitle: module.subtitle,
        modules: module.modules,
        route: module.route,
        progress: progress,
      ));
    }
    return updatedModules;
  }
}