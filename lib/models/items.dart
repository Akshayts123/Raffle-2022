import 'package:flutter/material.dart';
import 'dart:convert';

// List<Unicorn> unicornFromJson(String str) => List<Unicorn>.from(json.decode(str).map((x) => Unicorn.fromJson(x)));
//
// String unicornToJson(List<Unicorn> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Dog DogFromJson(String str) => Dog.fromJson(json.decode(str));
//
// String DogToJson(Dog data) => json.encode(data.toJson());

// To parse this JSON data, do
//
//     final random = randomFromJson(jsonString);



class Plane {
  int? userId;
  int? id;
  String? title;
  String? body;

  Plane({this.userId, this.id, this.title, this.body});

  Plane.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}

class Dog {
  Data? data;
  Support? support;

  Dog({this.data, this.support});

  Dog.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    support =
    json['support'] != null ? new Support.fromJson(json['support']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.support != null) {
      data['support'] = this.support!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}
class Product {
  Product({
    required this.code,
    required this.meta,
    required this.data,
  });

  int code;
  Meta meta;
  List<Datum> data;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    code: json["code"],
    meta: Meta.fromJson(json["meta"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "meta": meta.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.discountAmount,
    required this.status,
    required this.categories,
  });

  int id;
  String name;
  String description;
  String image;
  String price;
  String discountAmount;
  bool status;
  List<Category> categories;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    price: json["price"],
    discountAmount: json["discount_amount"],
    status: json["status"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "price": price,
    "discount_amount": discountAmount,
    "status": status,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Meta {
  Meta({
    required this.pagination,
  });

  Pagination pagination;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "pagination": pagination.toJson(),
  };
}

class Pagination {
  Pagination({
    required this.total,
    required this.pages,
    required this.page,
    required this.limit,
  });

  int total;
  int pages;
  int page;
  int limit;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    pages: json["pages"],
    page: json["page"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "pages": pages,
    "page": page,
    "limit": limit,
  };
}

// class Unicorn {
//   Unicorn({
//     required this.id,
//     required this.name,
//     required this.age,
//     required this.colour,
//   });
//
//   String id;
//   String name;
//   int age;
//   String colour;
//
//   factory Unicorn.fromJson(Map<String, dynamic> json) => Unicorn(
//     id: json["_id"],
//     name: json["name"],
//     age: json["age"],
//     colour: json["colour"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "name": name,
//     "age": age,
//     "colour": colour,
//   };
// }


List<Todo> todoFromJson(String str) =>
    List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoToJson(List<Todo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {
  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  int userId;
  int id;
  String title;
  bool completed;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
class Shopitem extends ChangeNotifier {
  String? Name;
  String? img;
  String? ban;
  String? btndesc;
  String? game;
  String? title;
  String? backimg;
  String? movie;
  String? gif;
  String? no;
  String? offer;
  String? no2;

  Shopitem({
    this.Name,
    this.img,
    this.ban,
    this.btndesc,
    this.game,
    this.title,
    this.backimg,
    this.movie,
    this.gif,
    this.offer,
    this.no2,
  });

  Shopitem.fromJson(Map<String, dynamic> json) {
    Name = json['Name'];
    img = json['img'];
    ban = json['ban'];
    btndesc = json['btndesc'];
    game = json['game'];
    title = json['title'];
    backimg = json['backimg'];
    movie = json['movie'];
    gif = json['gif'];
    no = json['no'];
    offer = json['offer'];
    no2 = json['no2'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['Name'] = this.Name;
    data['img'] = this.img;
    data['ban'] = this.ban;
    data['btndesc'] = this.btndesc;
    data['title'] = this.title;
    data['backimg'] = this.backimg;
    data['movie'] = this.movie;
    data['gif'] = this.gif;
    data['no'] = this.no;
    data['offer'] = this.offer;
    data['no2'] = this.no2;

    return data;
  }
}

class Coloritem extends ChangeNotifier {
  String? backimg;
  String? bis;

  Coloritem({
    this.backimg,
    this.bis,
  });

  Coloritem.fromJson(Map<String, dynamic> json) {
    backimg = json['backimg'];
    bis = json['bis'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['backimg'] = this.backimg;
    data['bis'] = this.bis;
    return data;
  }
}

class Homes {
  late final String game;
  late final String? Name;
  late final String? img;
  late final String? ban;
  late final String? people;
  late final String? btndesc;
  late final String? title;
  late final String? backimg;
  late final String? movie;
  late final String? gif;
  late final String? no;
  late final String? no2;
  late final String? bis;
  late final String? music;
  late final String? offer;
  late final String? news;
  late final String? banner;
  late final String? help;
  late final String? coupen;
  late final String? feature;
  late final String? vector;
  late final String? cources;
  late final String? courcesub;
  late final String? percent;
  late final String? reward;
  late final String? scrach;
  late final DateTime? date;
  late final String? tab;
  late final String? category;



  Homes({
    required this.Name,
    required this.img,
    required this.ban,
    required this.people,
    required this.btndesc,
    required this.title,
    required this.backimg,
    required this.movie,
    required this.gif,
    required this.no,
    required this.no2,
    required this.game,
    required this.bis,
    required this.music,
    required this.offer,
    required this.news,
    required this.banner,
    required this.help,
    required this.coupen,
    required this.feature,
    required this.vector,
    required this.cources,
    required this.courcesub,
    required this.percent,
    required this.reward,
    required this.scrach,
    required this.date,
    required this.tab,
    required this.category,
  });
  Homes.fromJson(
      Map<String, dynamic> json,
      this.game,
      this.Name,
      this.img,
      this.ban,
      this.people,
      this.btndesc,
      this.title,
      this.backimg,
      this.movie,
      this.gif,
      this.no,
      this.no2,
      this.news,
      this.music,
      this.banner,
      this.offer,
      this.coupen,
      this.help,
      this.vector,
      this.feature,
      this.cources,
      this.courcesub,
      this.percent,
      this.reward,
      this.scrach,
      this.date,
      this.tab,
      this.category,
      this.bis) {
    Name = json['Name'];
    img = json['img'];
    ban = json['ban'];
    people = json['people'];
    btndesc = json['btndesc'];
    game = json['game'];
    title = json['title'];
    backimg = json['backimg'];
    movie = json['movie'];
    gif = json['gif'];
    no = json['no'];
    no2 = json['no2'];
    bis = json['bis'];
    music = json['music'];
    offer = json['offer'];
    news = json['news'];
    banner = json['banner'];
    help = json['help'];
    coupen = json['coupen'];
    feature = json['feature'];
    vector = json['vector'];
    cources = json['cources'];
    courcesub = json['courcesub'];
    percent = json['percent'];
    reward = json['reward'];
    scrach = json['scrach'];
    date = json['date'];
    tab = json['tab'];
    category = json['category'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['Name'] = this.Name;
    data['img'] = this.img;
    data['ban'] = this.ban;
    data['people'] = this.people;
    data['btndesc'] = this.btndesc;
    data['title'] = this.title;
    data['backimg'] = this.backimg;
    data['movie'] = this.movie;
    data['gif'] = this.gif;
    data['no'] = this.no;
    data['no2'] = this.no2;
    data['music'] = this.music;
    data['offer'] = this.offer;
    data['news'] = this.news;
    data['banner'] = this.banner;
    data['help'] = this.help;
    data['coupen'] = this.coupen;
    data['feature'] = this.feature;
    data['vector'] = this.vector;
    data['cources'] = this.cources;
    data['courcesub'] = this.courcesub;
    data['percent'] = this.percent;
    data['reward'] = this.reward;
    data['scrach'] = this.scrach;
    data['date'] = this.date;
    data['tab'] = this.tab;
    data['category'] = this.category;

    return data;
  }
}
class Welcome {
  Welcome({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  int userId;
  int id;
  String title;
  bool completed;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
