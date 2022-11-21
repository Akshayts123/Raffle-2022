import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/items.dart';

class Api extends ChangeNotifier {
  List<Shopitem> cartitems = [];
  List<Coloritem> coloritems = [];


  setcartitem() async {
    var cartarray = [
      {
        "Name": 'Home ',
        "img": "assets/telegram.png",
        "ban":"assets/ban1.png",
        "btndesc":"Recharge for others",
        "game":"assets/game1.png",
        "title":"Super mario",
        "backimg":"assets/yellow.jpg",
        "movie":"assets/movie1.jpg",
        "gif":"assets/gif1.gif",
        "no":"assets/1.png",
        "no2":"assets/11.png",

      },
      {
        "Name": 'Fashion ',
        "img": "assets/fashion.png",
        "ban":"assets/ban2.png",
        "btndesc":"Help & Support",
        "game":"assets/game2.png",
        "title":"Super sonic",
        "backimg":"assets/meroon.jpg",
        "movie":"assets/movie2.jpg",
        "gif":"assets/gif2.gif",
        "no":"assets/2.png",
        "no2":"assets/22.png",
      },
      {
        "Name": 'Game ',
        "img": "assets/joystick.png",
        "ban":"assets/ban3.png",
        "btndesc":"Order new vip number ",
        "game":"assets/game3.png",
        "title":"Pokeymon",
        "backimg":"assets/black.jpg",
        "movie":"assets/movie4.png",
        "gif":"assets/gif3.gif",
        "no":"assets/3.png",
        "no2":"assets/33.png",

      },
      {
        "Name": 'Food ',
        "img": "assets/salad.png",
        "ban":"assets/ban4.png",
        "btndesc":"Jobs & Education",
        "game":"assets/game4.png",
        "title":"Clash of clans",
        "movie":"assets/movie5.jpeg",
        "gif":"assets/gif4.gif",
        "no":"assets/4.png",
        "no2":"assets/44.png",
      },
      {
        "Name": 'Bar ',
        "img": "assets/beer.png",
        "ban":"assets/ban5.png",
        "btndesc":"Recharge for others",
        "game":"assets/game5.png",
        "title":"Dragon ball z",
        "movie":"assets/movie7.jpg",
        "gif":"assets/gif5.gif",
        "no":"assets/5.png",
        "no2":"assets/55.png",
      },
      {
        "Name": 'Home ',
        "img": "assets/telegram.png",
        "ban":"assets/ban6.png",
        "btndesc":"Recharge for others",
        "game":"assets/game1.png",
        "title":"Super sonic",
        "movie":"assets/movie8.jpeg",
        "gif":"assets/gif1.gif",
        "no":"assets/6.png",
        "no2":"assets/66.png",
      },
      {
        "Name": 'Fashion ',
        "img": "assets/fashion.png",
        "ban":"assets/ban2.png",
        "btndesc":"Recharge for others",
        "game":"assets/game4.png",
        "title":"Super sonic",
        "movie":"assets/movie9.jpg",
        "gif":"assets/gif2.gif",
        "no":"assets/7.png",
        "no2":"assets/77.png",
      },
      {
        "Name": 'Game ',
        "img": "assets/joystick.png",
        "ban":"assets/ban1.png",
        "btndesc":"Recharge for others",
        "game":"assets/game2.png",
        "title":"Super sonic",
        "movie":"assets/movie1.jpg",
        "gif":"assets/gif3.gif",
        "no":"assets/8.png",
        "no2":"assets/88.png",
      },
      {
        "Name": 'Food ',
        "img": "assets/salad.png",
        "ban":"assets/ban4.png",
        "btndesc":"Recharge for others",
        "game":"assets/game5.png",
        "title":"Super sonic",
        "movie":"assets/movie2.jpg",
        "gif":"assets/gif4.gif",
        "no":"assets/9.png",
        "no2":"assets/99.png",
      },
      {
        "Name": 'Bar ',
        "img": "assets/beer.png",
        "ban":"assets/ban2.png",
        "btndesc":"Recharge for others",
        "game":"assets/game3.png",
        "title":"Super sonic",
        "movie":"assets/movie4.png",
        "gif":"assets/gif5.gif",
        "no":"assets/10.png",
        "no2":"assets/10.png",
      },

    ];
    cartarray.forEach((v) {
      cartitems.add(new Shopitem.fromJson(v));
    });
    notifyListeners();
    return true;
  }

  setcoloritem() async {
    var colorarray = [
      {

        "backimg":"assets/yellow.jpg",
        "bis":"assets/bis1.jpg"
      },
      {

        "backimg":"assets/meroon.jpg",
        "bis":"assets/bis2.jpg"
      },
      {

        "backimg":"assets/black.jpg",
        "bis":"assets/bis3.jpg"
      },

    ];
    colorarray.forEach((v) {
      coloritems.add(new Coloritem.fromJson(v));
    });
    notifyListeners();
    return true;
  }
}
