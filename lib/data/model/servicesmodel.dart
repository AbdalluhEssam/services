class ServicesModel {
  String? servicesId;
  String? servicesName;
  String? servicesNameAr;
  String? servicesImage;
  String? servicesData;

  ServicesModel(
      {this.servicesId,
      this.servicesName,
      this.servicesNameAr,
      this.servicesImage,
      this.servicesData});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    servicesId = json['services_id'];
    servicesName = json['services_name'];
    servicesNameAr = json['services_name_ar'];
    servicesImage = json['services_image'];
    servicesData = json['services_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['services_id'] = this.servicesId;
    data['services_name'] = this.servicesName;
    data['services_name_ar'] = this.servicesNameAr;
    data['services_image'] = this.servicesImage;
    data['services_data'] = this.servicesData;
    return data;
  }
}
