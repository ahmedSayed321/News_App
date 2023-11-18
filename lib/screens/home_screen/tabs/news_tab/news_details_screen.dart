import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/articles_responce.dart';
import 'package:news_app/screens/home_screen/tabs/news_tab/news_tab.dart';
import 'package:news_app/screens/home_screen/tabs/news_tab/news_tab_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const routeName = "newsDetailsScreen";
  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as ArticleDM;


    return Scaffold(
      appBar: AppBar(
          title: Text("News Details"),
          centerTitle: true,
          backgroundColor: Color(0xFF39A552),

      ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(args.urlToImage ?? "assets/images/news_image.png"),

          const SizedBox(height: 4),

          Text(args.author??"",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF79828B),
              )),

          const SizedBox(height: 4),

          Text(args.title??"",textAlign: TextAlign.center,style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF42505C))),

          const SizedBox(height: 10),

          Text(args.publishedAt??"",
              textAlign: TextAlign.end,style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFA3A3A3))),

          const SizedBox(height:20),

          Text(args.description??"",textAlign: TextAlign.center,style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF42505C))),

          const SizedBox(height:20),

          Row(
         mainAxisAlignment: MainAxisAlignment.end,
            children:[
              TextButton.icon(
                  onPressed: (){
                   openUrl(args.url) ;
                  },
                  icon: const Text("View Full Article",textAlign: TextAlign.end,style: TextStyle(color: Color(0xFF39A552)),),
                  label:const  Icon(Icons.arrow_forward_sharp,color: Color(0xFF39A552),)),
            ]
          )
        ],
      ),
    );
  }
}

void openUrl(String? url) async{
    if(url == null)
      return;
    var uri =Uri.parse(url);
    if(await canLaunchUrl(uri))
      {
        launchUrl(uri);
      };
}
