class OrderGlusModel {
  String? orderGlusId;
  String? usersId;
  String? totalPriceOrder;
  String? address;
  String? location;
  String? countR;
  String? countRoom;
  String? countK;
  String? countB;
  String? countBalcony;
  String? note;
  String? orderDate;
  String? orderApprove;
  String? gId;
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

  OrderGlusModel(
      {this.orderGlusId,
        this.usersId,
        this.totalPriceOrder,
        this.address,
        this.location,
        this.countR,
        this.countRoom,
        this.countK,
        this.countB,
        this.countBalcony,
        this.note,
        this.orderDate,
        this.orderApprove,
        this.gId,
        this.idGluspro,
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
        this.glusSer});

  OrderGlusModel.fromJson(Map<String, dynamic> json) {
    orderGlusId = json['order_glus_id'];
    usersId = json['users_id'];
    totalPriceOrder = json['total_price_order'];
    address = json['address'];
    location = json['location'];
    countR = json['count_r'];
    countRoom = json['count_room'];
    countK = json['count_k'];
    countB = json['count_b'];
    countBalcony = json['count_balcony'];
    note = json['note'];
    orderDate = json['order_date'];
    orderApprove = json['order_approve'];
    gId = json['g_id'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_glus_id'] = this.orderGlusId;
    data['users_id'] = this.usersId;
    data['total_price_order'] = this.totalPriceOrder;
    data['address'] = this.address;
    data['location'] = this.location;
    data['count_r'] = this.countR;
    data['count_room'] = this.countRoom;
    data['count_k'] = this.countK;
    data['count_b'] = this.countB;
    data['count_balcony'] = this.countBalcony;
    data['note'] = this.note;
    data['order_date'] = this.orderDate;
    data['order_approve'] = this.orderApprove;
    data['g_id'] = this.gId;
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
    return data;
  }
}