import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskez/Values/values.dart';

class PrimaryTabButton extends StatelessWidget {
  final String buttonText;
  final int itemIndex;
  final ValueNotifier<int> notifier;
  final VoidCallback? callback;
  const PrimaryTabButton(
      {Key? key, this.callback, required this.notifier, required this.buttonText, required this.itemIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (BuildContext context, _, __) {
            return ElevatedButton(
                onPressed: () {
                  notifier.value = itemIndex;
                  if (callback != null) {
                    callback!();
                  }
                },
                child: Text(buttonText, style: GoogleFonts.lato(fontSize: 16, color: Colors.white)));
          }),
    );
  }
}
