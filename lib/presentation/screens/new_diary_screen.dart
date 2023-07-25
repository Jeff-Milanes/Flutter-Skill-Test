import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:xam_consulting_exam/core/dependency_injection.dart';
import 'package:xam_consulting_exam/presentation/bloc/diary_bloc.dart';
import 'package:xam_consulting_exam/presentation/models/diary_status_model.dart';
import 'package:xam_consulting_exam/presentation/widgets/custom_button.dart';
import 'package:xam_consulting_exam/presentation/widgets/custom_card.dart';
import 'package:xam_consulting_exam/presentation/widgets/custom_textfield.dart';
import 'package:xam_consulting_exam/presentation/widgets/photo.dart';

class NewDiaryScreen extends StatelessWidget {
  const NewDiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceLocator.instance<DiaryBloc>(),
      child: const _NewDiaryScreen(),
    );
  }
}

class _NewDiaryScreen extends StatefulWidget {
  const _NewDiaryScreen();

  @override
  State<_NewDiaryScreen> createState() => _NewDiaryScreenState();
}

class _NewDiaryScreenState extends State<_NewDiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.grey,
        leading: const Icon(Icons.close),
        title: const Text('New Diary'),
      ),
      body: BlocListener<DiaryBloc, DiaryState>(
        listener: (context, state) {
          if (state.status == DiaryStatus.success) {
            Alert(
              context: context,
              type: AlertType.success,
              title: "Success",
              desc: "Diary successfully created.",
              buttons: [
                DialogButton(
                  onPressed: () => Navigator.pop(context),
                  width: 120,
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ).show();
          }

          if (state.status == DiaryStatus.failure) {
            Alert(
              context: context,
              type: AlertType.error,
              title: "Error",
              desc: "There is an error occured.",
              buttons: [
                DialogButton(
                  onPressed: () => Navigator.pop(context),
                  width: 120,
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ).show();
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey[700],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '20041075 | TAP-NS TAP-North Strathfield',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Add to site diary',
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(
                          Icons.help,
                          color: Colors.grey[500],
                        ),
                      ],
                    ),
                    CustomCard(
                      title: 'Add Photos to site diary',
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              BlocBuilder<DiaryBloc, DiaryState>(
                                builder: (context, state) {
                                  return Wrap(
                                      children: state.photos.map(
                                    (file) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                        ),
                                        child: Photo(
                                          file: file,
                                        ),
                                      );
                                    },
                                  ).toList());
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                title: 'Add a photo',
                                onPressed: () => context.read<DiaryBloc>().add(const AddPhoto()),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Include in photo gallery',
                                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 20, height: 20, child: Checkbox(value: true, onChanged: (_) {})),
                            ],
                          )
                        ],
                      ),
                    ),
                    CustomCard(
                      title: 'Comments',
                      child: CustomTextfield(
                        hintText: 'Comments',
                        onChanged: (comment) => context.read<DiaryBloc>().add(OnChangeComment(comment)),
                      ),
                    ),
                    CustomCard(
                      title: 'Details',
                      child: Column(
                        children: [
                          CustomTextfield(
                            hintText: '2020-06-29',
                            isDropdownButtonEnabled: true,
                            onChanged: (date) => context.read<DiaryBloc>().add(OnChangeDate(date)),
                          ),
                          CustomTextfield(
                            hintText: 'Select Area',
                            isDropdownButtonEnabled: true,
                            onChanged: (area) => context.read<DiaryBloc>().add(OnChangeArea(area)),
                          ),
                          CustomTextfield(
                            hintText: 'Task Category',
                            isDropdownButtonEnabled: true,
                            onChanged: (category) => context.read<DiaryBloc>().add(OnChangeCategory(category)),
                          ),
                          CustomTextfield(
                            hintText: 'Tags',
                            onChanged: (tags) => context.read<DiaryBloc>().add(OnChangeTags(tags)),
                          )
                        ],
                      ),
                    ),
                    CustomCard(
                      title: 'Link to existing event?',
                      isHighlight: true,
                      child: CustomTextfield(
                        hintText: 'Select an event',
                        isDropdownButtonEnabled: true,
                        onChanged: (event) => context.read<DiaryBloc>().add(OnChangeEvent(event)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<DiaryBloc, DiaryState>(builder: (context, state) {
                      return CustomButton(
                        title: 'Next',
                        isLoading: state.status == DiaryStatus.loading ? true : false,
                        onPressed: () => context.read<DiaryBloc>().add(const AddDiary()),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
