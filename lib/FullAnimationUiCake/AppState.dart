import 'package:flutter/cupertino.dart';
import 'package:speedcode_flutter/functions.dart';

import 'data.dart' as data;
import 'data.dart';
import 'model.dart';


class AppState extends ChangeNotifier{
  notify()=>notifyListeners();

  AnimationController controller;

  PageName page=PageName.Shops;
  Tabs tab=Tabs.home;
  Shop shop;
  Food food;

  double begin=doubleHeight(5);
  double end=doubleHeight(5);

  CategoryType categoryType = CategoryType.All;
  List<FoodCount> cart=[];
  addCart(Food food){
    //todo
    int index = cart.indexWhere((element) => element.food==food);
    if(index!=-1)
      addCountItem(index: index);
    else
      cart.add(FoodCount(1, food));
    notifyListeners();
  }
  removeCartIndex({int index,FoodCount foodCount,Food food}){
    if(index!=null)
      cart.removeAt(index);
    else if(foodCount!=null)
      cart.remove(foodCount);
    else if(food!=null)
      cart.removeWhere((element) => element.food==food);
    notifyListeners();
  }
  addCountItem({int index,FoodCount foodCount,Food food}){
    if(index!=null)
      cart[index].count++;
    else if(foodCount!=null)
      cart.singleWhere((element) => element==foodCount).count++;
    else if(food!=null)
      cart.singleWhere((element) => element.food==food).count++;

    notifyListeners();
  }
  lessCart(FoodCount foodCount){
    if(foodCount.count==1)
      cart.remove(foodCount);
    else
      cart.singleWhere((element) => element==foodCount).count--;
    notifyListeners();
  }


  List<Shop> getShopItem(){
    if(categoryType == CategoryType.All)
      return allShops;
      return allShops.where((e) => e.category==categoryType).toList();
  }

  void setCategoryType(CategoryType categoryType){
    this.categoryType=categoryType;
    notifyListeners();
  }
  void setTab(Tabs tab){
    this.tab=tab;
    notifyListeners();
  }

  void likeShop(int id,bool like){
    int index = allShops.indexWhere((e) => e.id==id);
    allShops[index].like=like;
    notifyListeners();
  }

  void likeFood(int id,bool like){
    int index = listAllFoods.indexWhere((e) => e.id==id);
    listAllFoods[index].like=like;
    notifyListeners();
  }

  void changePage(PageName newPage){
    controller.animateTo(1.0,duration: mil700,curve: Curves.easeOutQuad).then((value) {
      page=newPage;
      controller.animateTo(0.0,duration: sec1,curve: Curves.easeInSine);
      notifyListeners();
    });
    }

  }





