import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CategoryDM{

  String id ;
  String title;
  String imagePath;
  bool isLeftedSided;
  Color backgroundColor;


  CategoryDM( {required this.id,
    required this.title,
    required this.imagePath,
    required this.isLeftedSided,
    required this.backgroundColor}
      );


   static List<CategoryDM> categories = [

     CategoryDM(
         id: "sports",
         title: "Sports",
         imagePath: "assets/images/sports.png",
         isLeftedSided:true,
          backgroundColor: Color(0xFFC91C22)),
     CategoryDM(
         id: "technology",
         title: "Technology",
         imagePath: "assets/images/technology.png",
         isLeftedSided:false,
         backgroundColor: Color(0xFF003E90)),
     CategoryDM(
         id: "health",
         title: "Health",
         imagePath: "assets/images/health.png",
         isLeftedSided:true,
         backgroundColor: Color(0xFFED1E79)),
     CategoryDM(
         id: "business",
         title: "Business",
         imagePath: "assets/images/business.png",
         isLeftedSided:false,
         backgroundColor: Color(0xFFCF7E48)),
     CategoryDM(
         id: "environment",
         title: "Environment",
         imagePath: "assets/images/environment.png",
         isLeftedSided:true,
         backgroundColor: Color(0xFF4882CF)),
     CategoryDM(
         id: "sceince",
         title: "Sceince",
         imagePath: "assets/images/sceience.png",
         isLeftedSided:false,
         backgroundColor: Color(0xFFF2D352)),


   ];



}