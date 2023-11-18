import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/data/api_manager.dart';
import 'package:news_app/model/articles_responce.dart';
import 'package:news_app/model/categeories_dm.dart';
import 'package:news_app/model/sources_response.dart';
import 'package:news_app/screens/home_screen/tabs/news_tab/news_details_screen.dart';
import 'package:news_app/screens/home_screen/tabs/news_tab/news_tab_view_model.dart';
import 'package:news_app/screens/home_screen/tabs/tab_content/tab_content.dart';
import 'package:provider/provider.dart';

class NewsTab extends StatefulWidget {
  CategoryDM? selectedCategory;
  ArticleDM? article;

   //CategotryDM? categoryDM;
   //final String categoryId;
    NewsTab({
   this.selectedCategory, this.article
     });

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
     int currentIndex = 0;
    late NewsTabViewModel viewModal;

@override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     viewModal.getSources(widget.categoryId);
  //   });
  //
  // }
  @override
  Widget build(BuildContext context) {

  return FutureBuilder<SourcesResponseDM> (
      future: ApiManager.getSource(id: widget.selectedCategory!.id),
      builder:  (context,snapshot) {
        if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }
        else if(snapshot.hasData){
          return getScreenBody(snapshot.data!.sources!);
        }
        else{
          return const Center(child: CircularProgressIndicator());
        }
      });

       // Widget current;
  // viewModal = Provider.of(context);
  // if (viewModal.isLoading){
  //   current = LoadingWidget();
  // }else if (viewModal.sources.isNotEmpty){
  //   current = getScreenBody(viewModal.sources);
  // }else {
  //   current = ErrorWidget(viewModal.errorText ?? "");
  // }
  // return current;
  }

    Widget getScreenBody(List<SourceDM> sources){
     return DefaultTabController(
         length: sources.length,
         child: Column(
           children: [
             const SizedBox(height:15),
             TabBar(tabs: sources.map((source) {
               return getTab(source , currentIndex == sources.indexOf(source));
             },).toList(),
               onTap: (index){
               currentIndex = index;
               setState(() {});
               },
               isScrollable: true,
               indicatorColor: Colors.transparent,
             ),
             Expanded(
               child: TabBarView(children: sources.map((source) {
                   return TabContent(sourceDM: source,);
                 }).toList(),

               ),

             ),
             
           ],
         ));
    }

    Widget getTab(SourceDM source,bool isSelected){
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF39A552) : Colors.white,
        border: Border.all(color: const Color(0xFF39A552),
        width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(source.name??"",style: TextStyle(
          color: isSelected ? Colors.white:const Color(0xFF39A552),
          fontSize: 20),),
    );
    }

    Widget buildNewsWidget(ArticleDM articleDM){
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetailsScreen.routeName);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(articleDM.urlToImage ?? "assets/images/news_image.png"),
          const SizedBox(height: 4),
          Text(articleDM.author??"",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF79828B),
              )),
          const SizedBox(height: 4),
          Text(articleDM.title??"",textAlign: TextAlign.center,style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color:const Color(0xFF42505C))),
          const SizedBox(height: 4),
          Text(articleDM.publishedAt??"",textAlign: TextAlign.end,style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFA3A3A3))),


        ],
      ),
    );

  }


}

Widget LoadingWidget() {
  return CircularProgressIndicator();
}
