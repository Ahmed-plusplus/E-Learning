import 'package:elearning/core/network/supabase/supabase_keys.dart';

class LessonModel {

  int? id;
  int? courseId;
  String? name;
  int? order;
  String? videoUrl;

  LessonModel.fromJson(Map<String, dynamic> json){
    id = json[SupabaseKeys.lessonId];
    courseId = json[SupabaseKeys.courseId];
    name = json[SupabaseKeys.lessonName];
    order = json[SupabaseKeys.lessonOrder];
    videoUrl = json[SupabaseKeys.videoUrl];
  }

  Map<String, dynamic> toMap() => {
    SupabaseKeys.lessonId: id,
    SupabaseKeys.courseId: courseId,
    SupabaseKeys.lessonName: name,
    SupabaseKeys.lessonOrder: order,
    SupabaseKeys.videoUrl: videoUrl,
  };
}