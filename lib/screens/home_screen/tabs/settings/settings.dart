import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/screens/home_screen/tabs/settings/settings_widget/language_bottom_sheet_widget.dart';
import 'package:news_app/screens/home_screen/tabs/settings/settings_widget/selected_language_widget.dart';
import 'package:provider/provider.dart';

import '../../../../app_provider/app_provider.dart';

class Settings extends StatefulWidget {

  const Settings();

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final  String selectedOption ;
    var appProvider = Provider.of<AppProvider>(context);

    return Container(
      decoration:const  BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/pattern.png")
            ,fit: BoxFit.cover),
      ),
      child:  Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(AppLocalizations.of(context)!.language,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  color: Colors.black,
                   fontSize: 25,
              fontWeight: FontWeight.w700),),
            const SizedBox(height: 15,),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 2,color: const Color(0xFF39A552))
                //
              ),
              child: InkWell (
                  onTap: (){
                    showBottomSheetOptions(context);
                  },
                child:  Padding(
                  padding:  EdgeInsets.all(8.0),
                  child:  Row(
                    children: [
                      Text(appProvider.currentLocale == "en"? "English" : "عربي",
                        style: const TextStyle(
                            color: Color(0xFF39A552),
                           fontSize: 25,
                          fontWeight: FontWeight.w700
                        ),),
                      const Spacer(),
                      const Icon(Icons.arrow_drop_down_sharp,
                          color:  Color(0xFF39A552))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showBottomSheetOptions(context) {
  showModalBottomSheet(context: context,
 builder: (context) => LanguageBottomSheetWidget());
     //Container());
     //LanguageBottomSheetWidget());
}
