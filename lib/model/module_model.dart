class ModuleModel {
  final String id;
 final String title;
 final String subtitle;
  final int modules;
  final String route;
   final progress;
 
  const ModuleModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.modules,
    required this.route,
    this.progress= 0.0,
  });
}