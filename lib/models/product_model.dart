class Products {
  Result? result;

  Products({this.result});

  Products.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  Status? status;
  Settings? settings;
  Base? base;
  List<ResultList>? resultList;

  Result({this.status, this.settings, this.base, this.resultList});

  Result.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
    base = json['base'] != null ? new Base.fromJson(json['base']) : null;
    if (json['resultList'] != null) {
      resultList = <ResultList>[];
      json['resultList'].forEach((v) {
        resultList!.add(new ResultList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    if (this.base != null) {
      data['base'] = this.base!.toJson();
    }
    if (this.resultList != null) {
      data['resultList'] = this.resultList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  String? data;
  int? code;
  String? executionTime;
  String? requestTime;
  String? endpoint;
  String? requestId;
  String? apiVersion;
  String? functionsVersion;
  String? la;
  int? pmu;
  int? mu;

  Status(
      {this.data,
        this.code,
        this.executionTime,
        this.requestTime,
        this.endpoint,
        this.requestId,
        this.apiVersion,
        this.functionsVersion,
        this.la,
        this.pmu,
        this.mu});

  Status.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    code = json['code'];
    executionTime = json['executionTime'];
    requestTime = json['requestTime'];
    endpoint = json['endpoint'];
    requestId = json['requestId'];
    apiVersion = json['apiVersion'];
    functionsVersion = json['functionsVersion'];
    la = json['la'];
    pmu = json['pmu'];
    mu = json['mu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['code'] = this.code;
    data['executionTime'] = this.executionTime;
    data['requestTime'] = this.requestTime;
    data['endpoint'] = this.endpoint;
    data['requestId'] = this.requestId;
    data['apiVersion'] = this.apiVersion;
    data['functionsVersion'] = this.functionsVersion;
    data['la'] = this.la;
    data['pmu'] = this.pmu;
    data['mu'] = this.mu;
    return data;
  }
}

class Settings {
  String? q;
  String? catId;
  String? brandId;
  String? loc;
  String? attr;
  String? switches;
  String? sort;
  String? page;
  String? startPrice;
  String? endPrice;
  String? region;
  String? locale;
  String? currency;

  Settings(
      {this.q,
        this.catId,
        this.brandId,
        this.loc,
        this.attr,
        this.switches,
        this.sort,
        this.page,
        this.startPrice,
        this.endPrice,
        this.region,
        this.locale,
        this.currency});

  Settings.fromJson(Map<String, dynamic> json) {
    q = json['q'];
    catId = json['catId'];
    brandId = json['brandId'];
    loc = json['loc'];
    attr = json['attr'];
    switches = json['switches'];
    sort = json['sort'];
    page = json['page'];
    startPrice = json['startPrice'];
    endPrice = json['endPrice'];
    region = json['region'];
    locale = json['locale'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['q'] = this.q;
    data['catId'] = this.catId;
    data['brandId'] = this.brandId;
    data['loc'] = this.loc;
    data['attr'] = this.attr;
    data['switches'] = this.switches;
    data['sort'] = this.sort;
    data['page'] = this.page;
    data['startPrice'] = this.startPrice;
    data['endPrice'] = this.endPrice;
    data['region'] = this.region;
    data['locale'] = this.locale;
    data['currency'] = this.currency;
    return data;
  }
}

class Base {
  String? totalResults;
  String? pageSize;
  String? q;
  List<String>? sortValues;
  List<SwitchesList>? switchesList;
  List<Null>? brandList;

  Base(
      {this.totalResults,
        this.pageSize,
        this.q,
        this.sortValues,
        this.switchesList,
        this.brandList});

  Base.fromJson(Map<String, dynamic> json) {
    totalResults = json['totalResults'];
    pageSize = json['pageSize'];
    q = json['q'];
    sortValues = json['sortValues'].cast<String>();
    if (json['switchesList'] != null) {
      switchesList = <SwitchesList>[];
      json['switchesList'].forEach((v) {
        switchesList!.add(new SwitchesList.fromJson(v));
      });
    }
    // if (json['brandList'] != null) {
    //   brandList = <Null>[];
    //   json['brandList'].forEach((v) {
    //     brandList!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalResults'] = this.totalResults;
    data['pageSize'] = this.pageSize;
    data['q'] = this.q;
    data['sortValues'] = this.sortValues;
    if (this.switchesList != null) {
      data['switchesList'] = this.switchesList!.map((v) => v.toJson()).toList();
    }
    // if (this.brandList != null) {
    //   data['brandList'] = this.brandList!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class SwitchesList {
  String? id;
  String? name;
  String? desc;
  String? selected;

  SwitchesList({this.id, this.name, this.desc, this.selected});

  SwitchesList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['selected'] = this.selected;
    return data;
  }
}

class ResultList {
  Item? item;
  Delivery? delivery;
  List<SellingPoints>? sellingPoints;

  ResultList({this.item, this.delivery, this.sellingPoints});

  ResultList.fromJson(Map<String, dynamic> json) {
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
    delivery = json['delivery'] != null
        ? new Delivery.fromJson(json['delivery'])
        : null;
    if (json['sellingPoints'] != null) {
      sellingPoints = <SellingPoints>[];
      json['sellingPoints'].forEach((v) {
        sellingPoints!.add(new SellingPoints.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    if (this.delivery != null) {
      data['delivery'] = this.delivery!.toJson();
    }
    if (this.sellingPoints != null) {
      data['sellingPoints'] =
          this.sellingPoints!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  String? itemId;
  String? title;
  int? sales;
  String? itemUrl;
  String? image;
  Sku? sku;
  double? averageStarRate;
  String? type;

  Item(
      {this.itemId,
        this.title,
        this.sales,
        this.itemUrl,
        this.image,
        this.sku,
        this.averageStarRate,
        this.type});

  Item.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    title = json['title'];
    sales = json['sales'];
    itemUrl = json['itemUrl'];
    image = json['image'];
    sku = json['sku'] != null ? new Sku.fromJson(json['sku']) : null;
    averageStarRate = json['averageStarRate'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;
    data['title'] = this.title;
    data['sales'] = this.sales;
    data['itemUrl'] = this.itemUrl;
    data['image'] = this.image;
    if (this.sku != null) {
      data['sku'] = this.sku!.toJson();
    }
    data['averageStarRate'] = this.averageStarRate;
    data['type'] = this.type;
    return data;
  }
}

class Sku {
  Def? def;

  Sku({this.def});

  Sku.fromJson(Map<String, dynamic> json) {
    def = json['def'] != null ? new Def.fromJson(json['def']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.def != null) {
      data['def'] = this.def!.toJson();
    }
    return data;
  }
}

class Def {
  Null? price;
  double? promotionPrice;

  Def({this.price, this.promotionPrice});

  Def.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    promotionPrice = json['promotionPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['promotionPrice'] = this.promotionPrice;
    return data;
  }
}

class Delivery {
  bool? freeShipping;
  int? shippingFee;

  Delivery({this.freeShipping, this.shippingFee});

  Delivery.fromJson(Map<String, dynamic> json) {
    freeShipping = json['freeShipping'];
    shippingFee = json['shippingFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['freeShipping'] = this.freeShipping;
    data['shippingFee'] = this.shippingFee;
    return data;
  }
}

class SellingPoints {
  String? name;
  String? id;

  SellingPoints({this.name, this.id});

  SellingPoints.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}