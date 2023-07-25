part of 'diary_bloc.dart';

final class DiaryState extends Equatable {
  const DiaryState({
    this.status = DiaryStatus.initial,
    this.photos = const [],
    this.comment = '',
    this.date = '',
    this.area = '',
    this.category = '',
    this.tags = '',
    this.event = '',
  });

  final DiaryStatus status;
  final List<File> photos;
  final String comment;
  final String date;
  final String area;
  final String category;
  final String tags;
  final String event;

  DiaryState copyWith({
    DiaryStatus? status,
    List<File>? photos,
    String? comment,
    String? date,
    String? area,
    String? category,
    String? tags,
    String? event,
  }) {
    return DiaryState(
      status: status ?? this.status,
      photos: photos ?? this.photos,
      comment: comment ?? this.comment,
      date: date ?? this.date,
      area: area ?? this.area,
      category: category ?? this.category,
      tags: tags ?? this.tags,
      event: event ?? this.event,
    );
  }

  @override
  List<Object?> get props => [
        status,
        photos,
        comment,
        date,
        area,
        category,
        tags,
        event,
      ];
}
