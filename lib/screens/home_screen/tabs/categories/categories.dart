import 'package:flutter/material.dart';

import '../../../../model/categeories_dm.dart';

class Category extends StatelessWidget {
    CategoryDM? cagegoryDM ;
    Category(this.cagegoryDM);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: cagegoryDM!.isLeftedSided ? const Radius.circular(12) : Radius.zero,
            bottomRight: cagegoryDM!.isLeftedSided ? Radius.zero : const Radius.circular(12),

        )
            ,color: cagegoryDM!.backgroundColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
         //Spacer(),
         Image.asset(cagegoryDM!.imagePath),
         //Spacer(),
         Text(cagegoryDM!.title,
           style: const TextStyle(
               color: Colors.white,
               fontSize: 18),)
          
        ],
      ),
    );
  }
}
