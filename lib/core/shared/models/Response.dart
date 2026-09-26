import 'package:elearning/core/network/supabase/supabase_keys.dart';

class Response<T> {
  bool? success;
  T? data;
  String? message;

  Response.fromJsonList({
    required Map<String, dynamic> json,
    required T Function(List<dynamic> json)? parser,
  }) {
    success = json[SupabaseKeys.success] ?? false;
    data = parser?.call(json[SupabaseKeys.data]);
    message = json[SupabaseKeys.message];
  }

  Response.fromJsonObject({
    required Map<String, dynamic> json,
    required T Function(Map<String, dynamic> json)? parser,
  }) {
    success = json[SupabaseKeys.success] ?? false;
    data = parser?.call(json[SupabaseKeys.data]);
    message = json[SupabaseKeys.message];
  }

  Map<String, dynamic> toMap() => {
    SupabaseKeys.success: success,
    SupabaseKeys.data: data,
    SupabaseKeys.message: message,
  };
}