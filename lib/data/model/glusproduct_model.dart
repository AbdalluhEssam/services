class GlusProductModel {
  String? idGluspro;
  String? productName;
  String? productNameAr;
  String? productDesc;
  String? productDescAr;
  String? productImage;
  String? receptionPrice;
  String? productPrice;
  String? bathroomPrice;
  String? kitchenPrice;
  String? priceBalcony;
  String? totalPrice;
  String? productDescount;
  String? productDate;
  String? glusSer;
  String? typesId;

  GlusProductModel(
      {this.idGluspro,
        this.productName,
        this.productNameAr,
        this.productDesc,
        this.productDescAr,
        this.productImage,
        this.receptionPrice,
        this.productPrice,
        this.bathroomPrice,
        this.kitchenPrice,
        this.priceBalcony,
        this.totalPrice,
        this.productDescount,
        this.productDate,
        this.typesId,
        this.glusSer});

  GlusProductModel.fromJson(Map<String, dynamic> json) {
    idGluspro = json['id_gluspro'];
    productName = json['product_name'];
    productNameAr = json['product_name_ar'];
    productDesc = json['product_desc'];
    productDescAr = json['product_desc_ar'];
    productImage = json['product_image'];
    receptionPrice = json['reception_price'];
    productPrice = json['product_price'];
    bathroomPrice = json['bathroom_price'];
    kitchenPrice = json['kitchen_price'];
    priceBalcony = json['price_balcony'];
    totalPrice = json['total_price'];
    productDescount = json['product_descount'];
    productDate = json['product_date'];
    glusSer = json['glus_ser'];
    typesId = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_gluspro'] = this.idGluspro;
    data['product_name'] = this.productName;
    data['product_name_ar'] = this.productNameAr;
    data['product_desc'] = this.productDesc;
    data['product_desc_ar'] = this.productDescAr;
    data['product_image'] = this.productImage;
    data['reception_price'] = this.receptionPrice;
    data['product_price'] = this.productPrice;
    data['bathroom_price'] = this.bathroomPrice;
    data['kitchen_price'] = this.kitchenPrice;
    data['price_balcony'] = this.priceBalcony;
    data['total_price'] = this.totalPrice;
    data['product_descount'] = this.productDescount;
    data['product_date'] = this.productDate;
    data['glus_ser'] = this.glusSer;
    data['type_id'] = this.typesId;
    return data;
  }
}


class AdditionsGlusModel {
  String? id;
  String? name;
  String? typesId;
  String? createAt;

  AdditionsGlusModel({this.id, this.name, this.typesId, this.createAt});

  AdditionsGlusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    typesId = json['types_id'];
    createAt = json['createAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['types_id'] = this.typesId;
    data['createAt'] = this.createAt;
    return data;
  }
}
