import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/sources_response.dart';
import 'package:news_app/model/articles_responce.dart';

import '../../../../data/api_manager.dart';
import '../news_tab/news_details_screen.dart';

class TabContent  extends StatefulWidget {
  SourceDM? sourceDM;

   TabContent ({super.key,this.sourceDM});

  @override
  State<TabContent> createState() => _TabContentState();
}

class _TabContentState extends State<TabContent> {
  @override
  Widget build(BuildContext context) {
    int page = 1;
    late ScrollController controller;
    List<ArticleDM> allArticle = [];

   void initState() {
     super.initState();
     controller = ScrollController();
     controller.addListener(() {
       if (controller.position.atEdge) {
         if (controller.offset != 0) {
           setState(() {
             page ++;
             controller.jumpTo(0);
           });
         }
       }
     });
   }
  void dispose(){
     super.dispose();
     controller.dispose();
  };
    return FutureBuilder(

          future: ApiManager.getArticle(sourceId: widget.sourceDM?.id ?? "",),
          builder: (context,snapshot) {
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            else if(snapshot.hasData){
              return ListView.builder(
                  controller: controller,
                  itemCount: snapshot.data!.articles!.length,
                  itemBuilder: (context,index) {
                    //allArticle.addAll(snapshot.data!.articles);
                    return buildNewsWidget(snapshot.data!.articles![index]);
                  });
            }
            else{
              return const Center(child: CircularProgressIndicator());
            }
          });
    }

      Widget buildNewsWidget(ArticleDM articleDM){
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetailsScreen.routeName,
          arguments: articleDM,);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(color: Color(0xFF39A552)),
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(articleDM.urlToImage ?? "assets/images/news_image.png")),
              ],
            ),
            SizedBox(height: 4),
            Text(articleDM.author??"",
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF79828B),
                )),
            SizedBox(height: 8),
            Text(articleDM.title??"",textAlign: TextAlign.start,style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF42505C))),
            SizedBox(height:8),
            Text(articleDM.publishedAt??"",textAlign: TextAlign.end,style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xFFA3A3A3))),


          ],
        ),
      ),
    );

  }
}

