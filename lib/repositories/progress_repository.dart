import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ProgressRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  
  Future<double> getModuleProgress(String userId, String moduleId) async {
  try {
    final doc = await _firestore
        .collection('users')
        .doc(userId)
        .collection('progress')
        .doc(moduleId)
        .get();

    if (!doc.exists) return 0.0;

    final data = doc.data();
    final value = data?['progress'];

    return (value is num) ? value.toDouble() : 0.0;
  } catch (e) {
    print('Error fetching progress: $e');
    return 0.0;
  }
}
Future<void> setModuleProgress({
  required String userId,
  required String moduleId,
  required int completed,
  required int total,
}) async {
  try {
    final progress = total == 0 ? 0.0 : completed / total;

    await _firestore
        .collection('users')
        .doc(userId)
        .collection('progress')
        .doc(moduleId)
        .set({
      'completedLessons': completed,
      'totalLessons': total,
      'progress': progress,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  } catch (e) {
    print('Error saving progress: $e');
  }
}
}