import 'dart:io';

class DiaryEntity {
  final List<File> photos;
  final String comment;
  final String date;
  final String area;
  final String category;
  final String tags;
  final String event;

  DiaryEntity({
    this.photos = const [],
    this.comment = '',
    this.date = '',
    this.area = '',
    this.category = '',
    this.tags = '',
    this.event = '',
  });
}
