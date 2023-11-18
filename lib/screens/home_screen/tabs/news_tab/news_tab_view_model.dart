import 'package:flutter/material.dart';
import 'package:news_app/data/api_manager.dart';
import 'package:news_app/model/sources_response.dart';

class NewsTabViewModel extends ChangeNotifier{

  List<SourceDM> sources = [];
  bool isLoading = false;
  String? errorText;
  String? categoryId;

  void getSources(String categoryId) async {
     isLoading = true;
     notifyListeners();
    try {
      sources = await ApiManager.getSource(id: categoryId) as List<SourceDM>;
      isLoading = false;
      notifyListeners();
    }
    catch(error){
        errorText = error.toString();
        notifyListeners();
    }


  }


}