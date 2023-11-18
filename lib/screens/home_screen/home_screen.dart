import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/articles_responce.dart';
import 'package:news_app/model/categeories_dm.dart';
import 'package:news_app/screens/home_screen/animated_search_bar/animated_search_bar.dart';
import 'package:news_app/screens/home_screen/tabs/categories/category_tab.dart';
import 'package:news_app/screens/home_screen/tabs/news_tab/news_details_screen.dart';
import 'package:news_app/screens/home_screen/tabs/news_tab/news_tab.dart';
import 'package:news_app/screens/home_screen/tabs/settings/settings.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/api_manager.dart';
import '../../model/sources_response.dart';

class HomeScreen extends StatefulWidget {
   static String routeName = 'home_Screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryDM? selectedCategory = null;
  late Widget selectedTab;

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    selectedTab = CateogriesTab(onCategoryClicked: setSelectedCateogrie);
  }
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () {
        if(selectedTab is CateogriesTab)
          {
            return Future.value(true);
          }
        else{
          selectedTab = CateogriesTab(onCategoryClicked: setSelectedCateogrie);
          setState(() {});
          return Future.value(false);
        }
      },
      child: Scaffold(
         
         appBar: AppBar(
           toolbarHeight: 100,
           shape: const RoundedRectangleBorder(
             borderRadius: BorderRadius.only(
                 bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50))
           ),
           title:  Text(AppLocalizations.of(context)!.newsApp,
             style: GoogleFonts.poppins(
                 fontSize: 22,
                 fontWeight: FontWeight.w400),),
                 centerTitle: true,
                 backgroundColor: const Color(0xFF39A552),

           actions: [
             IconButton(onPressed: (){
               showSearch(context: context, delegate: NewsSearch());
             }, icon: const Icon(Icons.search_sharp,size: 30,))
           ],


         ),

          body: Container(
            decoration:const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/pattern.png"))
            ) ,
            child: selectedTab,
          ),
          // selectedCategory == null ?
          // CateogriesTab(onCategoryClicked:setSelectedCateogrie) :
          // NewsTab(selectedCategory: selectedCategory),

          drawer: buildDrawer(),
      ),
    );
  }

  void setSelectedCateogrie(CategoryDM category){
      selectedCategory = category;
      selectedTab = NewsTab(selectedCategory: selectedCategory,);
      setState(() {});
  }

    Widget buildDrawer(){
    return Container(
     decoration:
         const  BoxDecoration(
        color: Colors.white,
      ),
     width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFF39A552),
            child:  Center(
              child:  Text(AppLocalizations.of(context)!.newsApp,
                textAlign: TextAlign.center,
                style:const  TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),),
            ),
          ),
           const SizedBox(height: 24,),
          InkWell(
              onTap: (){
                selectedCategory = null;
                selectedTab = CateogriesTab(onCategoryClicked: setSelectedCateogrie);
                Navigator.pop(context);
                setState(() {});
              },
              child: buildDrawerContent(AppLocalizations.of(context)!.category, Icons.menu)),
          const SizedBox(height: 24,),
          InkWell(
              onTap: (){
                selectedTab = const Settings();
                setState(() {});
                Navigator.pop(context);
              },
              child: buildDrawerContent(AppLocalizations.of(context)!.settings, Icons.settings))
        ],
      ),
    );
  }
   
    Widget buildDrawerContent( String text , IconData icon ){
    return Row(
      children: [
        const SizedBox(width:24),
        Icon(icon,size: 28,color: const Color(0xFF303030),),
        const SizedBox(width: 20,),
        Text(text,style:const TextStyle(fontSize: 28,color: Color(0xFF303030),fontWeight: FontWeight.bold),)
        ,const SizedBox(width: 20,),
        
      ],
    );
    }
}

class NewsSearch extends SearchDelegate {


  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(onPressed: (){},icon: const Icon(Icons.search),)
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){
      Navigator.pop(context);
    },icon: const Icon(Icons.clear),);
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return FutureBuilder(
        future: ApiManager.getArticle(searchKeyword :query),
        builder: (context,snapshot) {
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          else if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (context,index) {
                  return buildNewsWidget(snapshot.data!.articles![index],context);
                });
          }
          else{
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }
  Widget buildNewsWidget(ArticleDM articleDM,context){
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
                const CircularProgressIndicator(color: Color(0xFF39A552)),
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(articleDM.urlToImage ?? "assets/images/news_image.png")),
              ],
            ),
            const SizedBox(height: 4),
            Text(articleDM.author??"",
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color:const Color(0xFF79828B),
                )),
            const SizedBox(height: 8),
            Text(articleDM.title??"",textAlign: TextAlign.start,style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color:const Color(0xFF42505C))),
            const SizedBox(height:8),
            Text(articleDM.publishedAt??"",textAlign: TextAlign.end,style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color:const Color(0xFFA3A3A3))),


          ],
        ),
      ),
    );

  }
}

