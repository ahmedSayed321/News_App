import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen/tabs/categories/categories.dart';

import '../../../../model/categeories_dm.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CateogriesTab extends StatelessWidget {
    Function(CategoryDM) onCategoryClicked ;
   CateogriesTab({super.key,required this.onCategoryClicked});

  @override
  Widget build(BuildContext context) {
    return  Column(

      children: [
        const SizedBox(height: 30,),
         Padding(padding: const EdgeInsets.all(8),
        child: Text(AppLocalizations.of(context)!.pick_your_category_of_interest,
          textAlign: TextAlign.start,
          style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.black),),
        ),
         const SizedBox(height: 40,),
         Expanded(
             child: Padding(
                 padding: const EdgeInsets.all(18),
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8

                    ),
                      itemCount: 6,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            onCategoryClicked(CategoryDM.categories[index]);
                          },
                          child: Category(CategoryDM.categories[index]),

                        );
                      }

                  ),))
      ],
    );
  }
}
