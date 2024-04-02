class OrderDetModel {
  String? cartId;
  String? itemsId;
  String? usersId;
  String? quantity;
  String? orderId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDescount;
  String? itemsDate;
  String? itemsCat;

  OrderDetModel(
      {this.cartId,
        this.itemsId,
        this.usersId,
        this.quantity,
        this.orderId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDesc,
        this.itemsDescAr,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDescount,
        this.itemsDate,
        this.itemsCat});

  OrderDetModel.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'].toString();
    itemsId = json['items_id'].toString();
    usersId = json['users_id'];
    quantity = json['quantity'];
    orderId = json['order_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDescount = json['items_descount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['items_id'] = this.itemsId;
    data['users_id'] = this.usersId;
    data['quantity'] = this.quantity;
    data['order_id'] = this.orderId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_descount'] = this.itemsDescount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    return data;
  }
}