import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'app_models.freezed.dart';
part 'app_models.g.dart';

@freezed
class Book with _$Book {
  const Book._();

  const factory Book({
    String? author,
    String? title,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}