class OrderModel {
  String? orderId;
  String? usersId;
  String? delivery;
  String? totalPrice;
  String? ordersAddressid;
  String? ordersCoupon;
  String? orderDate;
  String? orderApprove;
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressCityid;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  OrderModel(
      {this.orderId,
        this.usersId,
        this.delivery,
        this.totalPrice,
        this.ordersAddressid,
        this.ordersCoupon,
        this.orderDate,
        this.orderApprove,
        this.addressId,
        this.addressUsersid,
        this.addressName,
        this.addressCityid,
        this.addressStreet,
        this.addressLat,
        this.addressLong});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    usersId = json['users_id'];
    delivery = json['delivery'];
    totalPrice = json['total_price'];
    ordersAddressid = json['orders_addressid'];
    ordersCoupon = json['orders_coupon'];
    orderDate = json['order_date'];
    orderApprove = json['order_approve'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCityid = json['address_cityid'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['users_id'] = this.usersId;
    data['delivery'] = this.delivery;
    data['total_price'] = this.totalPrice;
    data['orders_addressid'] = this.ordersAddressid;
    data['orders_coupon'] = this.ordersCoupon;
    data['order_date'] = this.orderDate;
    data['order_approve'] = this.orderApprove;
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_name'] = this.addressName;
    data['address_cityid'] = this.addressCityid;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    return data;
  }
}
