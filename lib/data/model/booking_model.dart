class BookingModel {
  String? bookingId;
  String? itemsId;
  String? usersId;
  String? hour;
  String? date;
  String? createAt;
  String? note;
  String? price;
  String? address;
  String? location;
  String? status;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsActive;
  String? itemsDescount;
  String? itemsDate;
  String? itemsCat;
  String? usersName;
  String? usersEmail;
  String? usersPassword;
  String? usersPhone;
  String? usersVerfiycode;
  String? usersApprove;
  String? usersCreate;
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressCityid;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  BookingModel(
      {this.bookingId,
        this.itemsId,
        this.usersId,
        this.hour,
        this.date,
        this.createAt,
        this.note,
        this.price,
        this.address,
        this.location,
        this.status,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDesc,
        this.itemsDescAr,
        this.itemsImage,
        this.itemsActive,
        this.itemsDescount,
        this.itemsDate,
        this.itemsCat,
        this.usersName,
        this.usersEmail,
        this.usersPassword,
        this.usersPhone,
        this.usersVerfiycode,
        this.usersApprove,
        this.usersCreate,
        this.addressId,
        this.addressUsersid,
        this.addressName,
        this.addressCityid,
        this.addressStreet,
        this.addressLat,
        this.addressLong});

  BookingModel.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    itemsId = json['bookingitems_id'];
    usersId = json['users_id'];
    hour = json['hour'];
    date = json['date'];
    createAt = json['createAt'];
    note = json['note'];
    price = json['price'];
    address = json['address'];
    location = json['location'];
    status = json['status'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsActive = json['items_active'];
    itemsDescount = json['items_descount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPassword = json['users_password'];
    usersPhone = json['users_phone'];
    usersVerfiycode = json['users_verfiycode'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
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
    data['booking_id'] = this.bookingId;
    data['bookingitems_id'] = this.itemsId;
    data['users_id'] = this.usersId;
    data['hour'] = this.hour;
    data['date'] = this.date;
    data['createAt'] = this.createAt;
    data['note'] = this.note;
    data['price'] = this.price;
    data['address'] = this.address;
    data['location'] = this.location;
    data['status'] = this.status;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_active'] = this.itemsActive;
    data['items_descount'] = this.itemsDescount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['users_name'] = this.usersName;
    data['users_email'] = this.usersEmail;
    data['users_password'] = this.usersPassword;
    data['users_phone'] = this.usersPhone;
    data['users_verfiycode'] = this.usersVerfiycode;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
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


class ItemsTopSellingModel {
  String? countitems;
  String? bookingId;
  String? bookingitemsId;
  String? usersId;
  String? hour;
  String? date;
  String? createAt;
  String? note;
  String? price;
  String? address;
  String? location;
  String? status;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsActive;
  String? itemsDescount;
  String? itemsDate;
  String? itemsCat;

  ItemsTopSellingModel(
      {this.countitems,
        this.bookingId,
        this.bookingitemsId,
        this.usersId,
        this.hour,
        this.date,
        this.createAt,
        this.note,
        this.price,
        this.address,
        this.location,
        this.status,
        this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDesc,
        this.itemsDescAr,
        this.itemsImage,
        this.itemsActive,
        this.itemsDescount,
        this.itemsDate,
        this.itemsCat});

  ItemsTopSellingModel.fromJson(Map<String, dynamic> json) {
    countitems = json['countitems'];
    bookingId = json['booking_id'];
    bookingitemsId = json['bookingitems_id'];
    usersId = json['users_id'];
    hour = json['hour'];
    date = json['date'];
    createAt = json['createAt'];
    note = json['note'];
    price = json['price'];
    address = json['address'];
    location = json['location'];
    status = json['status'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsActive = json['items_active'];
    itemsDescount = json['items_descount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countitems'] = this.countitems;
    data['booking_id'] = this.bookingId;
    data['bookingitems_id'] = this.bookingitemsId;
    data['users_id'] = this.usersId;
    data['hour'] = this.hour;
    data['date'] = this.date;
    data['createAt'] = this.createAt;
    data['note'] = this.note;
    data['price'] = this.price;
    data['address'] = this.address;
    data['location'] = this.location;
    data['status'] = this.status;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_active'] = this.itemsActive;
    data['items_descount'] = this.itemsDescount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    return data;
  }
}
