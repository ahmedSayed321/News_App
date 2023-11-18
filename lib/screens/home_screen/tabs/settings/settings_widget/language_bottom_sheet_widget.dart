import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen/tabs/settings/settings_widget/selected_language_widget.dart';
import 'package:news_app/screens/home_screen/tabs/settings/settings_widget/unselected_option_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../app_provider/app_provider.dart';

class LanguageBottomSheetWidget extends StatelessWidget {
  const LanguageBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    return Container(
       color: Colors.green.withOpacity(0.3),
       child: Container(
         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
         decoration: BoxDecoration(
           color: Colors.green.withOpacity(0.3),
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             InkWell(
                 onTap: () {
                   appProvider.changeLocal("en");
                   Navigator.pop(context);
                 },
                 //If I choose English, I show English, or if I don't select English, I don't show it
                 child: appProvider.currentLocale == "en"
                     ? const SelectedLanguageWidget(selectedTitle: "English",)
                     : const UnSelectedOptionWidget(titleUnselectedOption: "English")),

             //const SizedBox(height: 5,),

             InkWell(
                 onTap: () {
                   appProvider.changeLocal("ar");
                   Navigator.pop(context);
                 },
                 child: appProvider.currentLocale == "ar"
                     ? const SelectedLanguageWidget(selectedTitle: "عربي",)
                     : const UnSelectedOptionWidget(titleUnselectedOption: "عربي"))
           ],
         ),
       )
     );

  }
}
