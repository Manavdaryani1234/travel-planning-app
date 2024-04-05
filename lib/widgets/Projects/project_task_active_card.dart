import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskez/Values/values.dart';
import 'package:taskez/widgets/dummy/profile_dummy.dart';

class ProjectTaskActiveCard extends StatelessWidget {
  final String header;
  final String backgroundColor;
  final ValueNotifier<bool> notifier;
  final String image;
  final String date;
  const ProjectTaskActiveCard(
      {Key? key,
      required this.header,
      required this.notifier,
      required this.backgroundColor,
      required this.image,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        notifier.value = !notifier.value;
      },
      child: Container()
    );
  }
}
