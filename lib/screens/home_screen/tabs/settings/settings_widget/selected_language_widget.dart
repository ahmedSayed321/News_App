import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen/tabs/settings/settings_widget/unselected_option_widget.dart';

class SelectedLanguageWidget extends StatelessWidget {
  final String selectedTitle;

  const SelectedLanguageWidget({super.key,required this.selectedTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black,width: 2)),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(selectedTitle,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
            const Icon(
              Icons.check,
              color: Colors.black,
            )
          ],
        ),
      ),
    );


  }
}
