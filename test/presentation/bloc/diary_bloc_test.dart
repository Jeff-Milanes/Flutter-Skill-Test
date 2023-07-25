import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xam_consulting_exam/domain/entity/diary_entity.dart';
import 'package:xam_consulting_exam/domain/services/diary_service.dart';
import 'package:xam_consulting_exam/presentation/bloc/diary_bloc.dart';
import 'package:xam_consulting_exam/presentation/models/diary_status_model.dart';

class MockIDiaryService extends Mock implements IDiaryService {}

class DiaryEntityFake extends Fake implements DiaryEntity {}

void main() {
  late IDiaryService mockDiaryService;

  setUp(() {
    mockDiaryService = MockIDiaryService();
    registerFallbackValue(DiaryEntityFake());
  });

  group(
    'DiaryBloc',
    () {
      test('initial state is DiaryBloc', () {
        final diaryBloc = DiaryBloc(
          mockDiaryService,
        );
        expect(diaryBloc.state, const DiaryState());
      });

      group(
        'AddDiary',
        () {
          blocTest(
            'emits [loading, success]',
            setUp: () {
              when(
                () => mockDiaryService.upload(any()),
              ).thenAnswer((_) async => Future.value());
            },
            build: () => DiaryBloc(mockDiaryService),
            act: (bloc) => bloc
              ..add(const OnChangeComment('comment'))
              ..add(const OnChangeDate('date'))
              ..add(const OnChangeArea('area'))
              ..add(const OnChangeCategory('category'))
              ..add(const OnChangeTags('tags'))
              ..add(const OnChangeEvent('event'))
              ..add(const AddDiary()),
            expect: () => [
              const DiaryState(
                status: DiaryStatus.initial,
                comment: 'comment',
                date: '',
                area: '',
                category: '',
                tags: '',
                event: '',
                photos: [],
              ),
              const DiaryState(
                status: DiaryStatus.initial,
                comment: 'comment',
                date: 'date',
                area: '',
                category: '',
                tags: '',
                event: '',
                photos: [],
              ),
              const DiaryState(
                status: DiaryStatus.initial,
                comment: 'comment',
                date: 'date',
                area: 'area',
                category: '',
                tags: '',
                event: '',
                photos: [],
              ),
              const DiaryState(
                status: DiaryStatus.initial,
                comment: 'comment',
                date: 'date',
                area: 'area',
                category: 'category',
                tags: '',
                event: '',
                photos: [],
              ),
              const DiaryState(
                status: DiaryStatus.initial,
                comment: 'comment',
                date: 'date',
                area: 'area',
                category: 'category',
                tags: 'tags',
                event: '',
                photos: [],
              ),
              const DiaryState(
                status: DiaryStatus.initial,
                comment: 'comment',
                date: 'date',
                area: 'area',
                category: 'category',
                tags: 'tags',
                event: 'event',
                photos: [],
              ),
              const DiaryState(
                status: DiaryStatus.loading,
                comment: 'comment',
                date: 'date',
                area: 'area',
                category: 'category',
                tags: 'tags',
                event: 'event',
                photos: [],
              ),
              const DiaryState(
                status: DiaryStatus.success,
                comment: 'comment',
                date: 'date',
                area: 'area',
                category: 'category',
                tags: 'tags',
                event: 'event',
                photos: [],
              ),
            ],
          );

          blocTest(
            'emits [loading, failure]',
            setUp: () {
              when(
                () => mockDiaryService.upload(any()),
              ).thenThrow(Exception());
            },
            build: () => DiaryBloc(mockDiaryService),
            act: (bloc) => bloc
              ..add(const OnChangeComment('comment'))
              ..add(const OnChangeDate('date'))
              ..add(const OnChangeArea('area'))
              ..add(const OnChangeCategory('category'))
              ..add(const OnChangeTags('tags'))
              ..add(const OnChangeEvent('event'))
              ..add(const AddDiary()),
            expect: () => [
              const DiaryState(
                status: DiaryStatus.initial,
                comment: 'comment',
                date: '',
                area: '',
                category: '',
                tags: '',
                event: '',
                photos: [],
              ),
              const DiaryState(
                status: DiaryStatus.initial,
                comment: 'comment',
                date: 'date',
                area: '',
                category: '',
                tags: '',
                event: '',
                photos: [],
              ),
              const DiaryState(
                status: DiaryStatus.initial,
                comment: 'comment',
                date: 'date',
                area: 'area',
                category: '',
                tags: '',
                event: '',
                photos: [],
              ),
              const DiaryState(
                status: DiaryStatus.initial,
                comment: 'comment',
                date: 'date',
                area: 'area',
                category: 'category',
                tags: '',
                event: '',
                photos: [],
              ),
              const DiaryState(
                status: DiaryStatus.initial,
                comment: 'comment',
                date: 'date',
                area: 'area',
                category: 'category',
                tags: 'tags',
                event: '',
                photos: [],
              ),
              const DiaryState(
                status: DiaryStatus.initial,
                comment: 'comment',
                date: 'date',
                area: 'area',
                category: 'category',
                tags: 'tags',
                event: 'event',
                photos: [],
              ),
              const DiaryState(
                status: DiaryStatus.loading,
                comment: 'comment',
                date: 'date',
                area: 'area',
                category: 'category',
                tags: 'tags',
                event: 'event',
                photos: [],
              ),
              const DiaryState(
                status: DiaryStatus.failure,
                comment: 'comment',
                date: 'date',
                area: 'area',
                category: 'category',
                tags: 'tags',
                event: 'event',
                photos: [],
              ),
            ],
          );
        },
      );
    },
  );
}
