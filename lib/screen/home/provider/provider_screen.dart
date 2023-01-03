import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jsondata/screen/home/modal/modal_screen.dart';

import '../modal/ProductClass.dart';

class HomeProvider extends ChangeNotifier
{

  int i = 0;

  List jsonlist = [];
  List<ModalScreen> multipledata = [];

  List<dynamic> productlist = [];

  List<dynamic> filterlist1 = [];
  List<dynamic> filterlist2 = [];
  List<dynamic> filterlist3 = [];

  List<dynamic> category1 = [];
  List<dynamic> category2 = [];
  List<dynamic> category3 = [];
  List<dynamic> category4 = [];

  List<dynamic> rate1 = [];
  List<dynamic> rate2 = [];
  List<dynamic> rate3 = [];
  List<dynamic> rate4 = [];

  void getjsondata()async {
    String jsonFile = await rootBundle.loadString("assets/json/data.json");
    jsonlist = jsonDecode(jsonFile);
    
    multipledata = jsonlist.map((e) => ModalScreen().userfromJson(e)).toList();

    notifyListeners();

  }

  void ProductDetail()async{
    productlist.clear();
    String data =await rootBundle.loadString('assets/json/productData.json');
    var json = jsonDecode(data);

    productlist = json.map((e) => ProductClass.fromJson(e)).toList();
    notifyListeners();
  }

  void filterPrice1(){
    for(i = 0;i<productlist.length;i++)
      {
        if(productlist[i].price! >= 10 && productlist[i].price! <= 50)
          {
            filterlist1.add(productlist[i]);
          }
      }
    productlist = filterlist1;
    notifyListeners();
  }

  void filterPrice2(){
    for(i = 0;i<productlist.length;i++)
      {
        if(productlist[i].price! >= 50 && productlist[i].price! <= 100)
          {
            filterlist2.add(productlist[i]);
          }
      }
    productlist = filterlist2;
    notifyListeners();
  }

  void filterPrice3(){
    for(i = 0;i<productlist.length;i++)
      {
        if(productlist[i].price! >= 100 && productlist[i].price! <= 1000)
          {
            filterlist3.add(productlist[i]);
          }
      }
    productlist = filterlist3;
    notifyListeners();
  }

  void Category1() {
    for(i = 0;i<productlist.length;i++)
    {
      if(productlist[i].category! == "men's clothing")
      {
        category1.add(productlist[i]);
      }
    }
    productlist = category1;
    notifyListeners();
  }

  void Category2() {
    for(i = 0;i<productlist.length;i++)
    {
      if(productlist[i].category! == "jewelery")
      {
        category2.add(productlist[i]);
      }
    }
    productlist = category2;
    notifyListeners();
  }

  void Category3() {
    for(i = 0;i<productlist.length;i++)
    {
      if(productlist[i].category! == "electronics")
      {
        category3.add(productlist[i]);
      }
    }
    productlist = category3;
    notifyListeners();
  }

  void Category4() {
    for(i = 0;i<productlist.length;i++)
    {
      if(productlist[i].category! == "women's clothing")
      {
        category4.add(productlist[i]);
      }
    }
    productlist = category4;
    notifyListeners();
  }

  void Rate1() {
    for(i = 0;i<productlist.length;i++)
    {
      if(productlist[i].rating.rate >= 1 && productlist[i].rating.rate <= 2 )
      {
        rate1.add(productlist[i]);
      }
    }
    productlist = rate1;
    notifyListeners();
  }
  void Rate2() {
    for(i = 0;i<productlist.length;i++)
    {
      if(productlist[i].rating.rate >= 2 && productlist[i].rating.rate <= 3 )
      {
        rate2.add(productlist[i]);
      }
    }
    productlist = rate2;
    notifyListeners();
  }
  void Rate3() {
    for(i = 0;i<productlist.length;i++)
    {
      if(productlist[i].rating.rate >= 3 && productlist[i].rating.rate <= 4 )
      {
        rate3.add(productlist[i]);
      }
    }
    productlist = rate3;
    notifyListeners();
  }
  void Rate4() {
    for(i = 0;i<productlist.length;i++)
    {
      if(productlist[i].rating.rate >= 4 && productlist[i].rating.rate <= 5)
      {
        rate4.add(productlist[i]);
      }
    }
    productlist = rate4;
    notifyListeners();
  }
}