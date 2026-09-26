import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class SupabaseKeys {
  static final url = dotenv.get('SB_URL');
  static final publicKey = dotenv.get('SB_PUBLISH_KEY');

  static const success = 'success';
  static const data = 'data';
  static const message = 'message';

  static const name = 'fullName';
  static const courseId = 'course_id';
  static const courseName = 'course_name';
  static const price = 'price';
  static const description = 'description';
  static const imageUrl = 'image_url';
  static const lessons = 'lessons';
  static const lessonId = 'lesson_id';
  static const lessonName = 'lesson_name';
  static const lessonOrder = 'lesson_order';
  static const videoUrl = 'video_url';

}