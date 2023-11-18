// import 'package:flutter/material.dart';
// import 'package:news_app/data/api_manager.dart';
// import 'package:news_app/model/sources_response.dart';
//
// class NewsSearch extends SearchDelegate{
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     // TODO: implement buildActions
//     return [
//       IconButton(onPressed: (){},icon: Icon(Icons.search),)
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     return FutureBuilder<SourcesResponseDM> (
//         future: ApiManager.getSource(),
//         builder:  (context,snapshot) {
//           if(snapshot.hasError){
//             return Text(snapshot.error.toString());
//           }
//           else if(snapshot.hasData){
//             return getScreenBody(snapshot.data!.sources!);
//           }
//           else{
//             return const Center(child: CircularProgressIndicator());
//           }
//         });;
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     throw UnimplementedError();
//   }
//
// }