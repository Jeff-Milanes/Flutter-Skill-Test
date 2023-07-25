part of 'diary_bloc.dart';

sealed class DiaryEvent {
  const DiaryEvent();
}

final class AddPhoto extends DiaryEvent {
  const AddPhoto();
}

final class AddDiary extends DiaryEvent {
  const AddDiary();
}

final class OnChangeComment extends DiaryEvent {
  const OnChangeComment(this.comment);

  final String comment;
}

final class OnChangeDate extends DiaryEvent {
  const OnChangeDate(this.date);

  final String date;
}

final class OnChangeArea extends DiaryEvent {
  const OnChangeArea(this.area);

  final String area;
}

final class OnChangeCategory extends DiaryEvent {
  const OnChangeCategory(this.category);

  final String category;
}

final class OnChangeTags extends DiaryEvent {
  const OnChangeTags(this.tags);

  final String tags;
}

final class OnChangeEvent extends DiaryEvent {
  const OnChangeEvent(this.event);

  final String event;
}
