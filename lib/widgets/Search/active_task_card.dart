import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskez/Values/values.dart';

class ActiveTaskCard extends StatelessWidget {
  final String header;
  final String subHeader;
  final ValueNotifier<bool> notifier;
  final String date;
  const ActiveTaskCard(
      {Key? key,
      required this.header,
      required this.notifier,
      required this.subHeader,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
