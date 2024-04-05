import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskez/Values/values.dart';

class InactiveProjectSelectableContainer extends StatelessWidget {
  final String header;
  final ValueNotifier<bool> notifier;
  const InactiveProjectSelectableContainer({
    Key? key,
    required this.header,
    required this.notifier,
  }) : super(key: key);

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
