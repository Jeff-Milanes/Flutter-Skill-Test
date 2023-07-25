import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:xam_consulting_exam/domain/entity/diary_entity.dart';
import 'package:xam_consulting_exam/domain/services/diary_service.dart';
import 'package:xam_consulting_exam/presentation/models/diary_status_model.dart';

part 'diary_event.dart';
part 'diary_state.dart';

@injectable
class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  DiaryBloc(this._diaryService) : super(const DiaryState()) {
    on<AddPhoto>(_addPhoto);
    on<OnChangeComment>(_onChangeComment);
    on<OnChangeDate>(_onChangeDate);
    on<OnChangeArea>(_onChangeArea);
    on<OnChangeCategory>(_onChangeCategory);
    on<OnChangeTags>(_onChangeTags);
    on<OnChangeEvent>(_onChangeEvent);
    on<AddDiary>(_addDiary);
  }

  final IDiaryService _diaryService;

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _addPhoto(AddPhoto event, Emitter<DiaryState> emit) async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      emit(state.copyWith(photos: [...state.photos, File(pickedFile.path)]));
    }
  }

  void _onChangeComment(OnChangeComment event, Emitter<DiaryState> emit) {
    emit(state.copyWith(comment: event.comment));
  }

  void _onChangeDate(OnChangeDate event, Emitter<DiaryState> emit) {
    emit(state.copyWith(date: event.date));
  }

  void _onChangeArea(OnChangeArea event, Emitter<DiaryState> emit) {
    emit(state.copyWith(area: event.area));
  }

  void _onChangeCategory(OnChangeCategory event, Emitter<DiaryState> emit) {
    emit(state.copyWith(category: event.category));
  }

  void _onChangeTags(OnChangeTags event, Emitter<DiaryState> emit) {
    emit(state.copyWith(tags: event.tags));
  }

  void _onChangeEvent(OnChangeEvent event, Emitter<DiaryState> emit) {
    emit(state.copyWith(event: event.event));
  }

  Future<void> _addDiary(AddDiary event, Emitter<DiaryState> emit) async {
    emit(state.copyWith(status: DiaryStatus.loading));

    try {
      final entity = DiaryEntity(
          photos: state.photos,
          comment: state.comment,
          date: state.date,
          area: state.area,
          category: state.category,
          tags: state.tags,
          event: state.event);

      await _diaryService.upload(entity);
      emit(state.copyWith(status: DiaryStatus.success));
    } catch (_) {
      emit(state.copyWith(status: DiaryStatus.failure));
    }
  }
}
