import 'package:elearning/core/network/supabase/supabase_keys.dart';
import 'package:elearning/features/course/data/model/lesson_model.dart';

class CourseModel {

  int? id;
  String? name;
  int? price;
  String? description;
  String? imageUrl;
  List<LessonModel>? lessons;

  CourseModel.fromJson(Map<String, dynamic> json){
    id = json[SupabaseKeys.courseId];
    name = json[SupabaseKeys.courseName];
    price = json[SupabaseKeys.price];
    description = json[SupabaseKeys.description];
    imageUrl = json[SupabaseKeys.imageUrl];
    if(json[SupabaseKeys.lessons] != null){
      lessons = [];
      json[SupabaseKeys.lessons].forEach(
        (json) => lessons!.add(LessonModel.fromJson(json))
      );
    }
  }

  Map<String, dynamic> toMap() => {
    SupabaseKeys.courseId: id,
    SupabaseKeys.courseName: name,
    SupabaseKeys.price: price,
    SupabaseKeys.description: description,
    SupabaseKeys.imageUrl: imageUrl,
    SupabaseKeys.lessons: lessons?.map((lesson) => lesson.toMap()).toList(),
  };
}