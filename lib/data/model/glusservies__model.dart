class GlusServiesModel {
  String? glusId;
  String? glusName;
  String? glusNameAr;
  String? glusImage;
  String? glusservicesData;

  GlusServiesModel(
      {this.glusId,
        this.glusName,
        this.glusNameAr,
        this.glusImage,
        this.glusservicesData});

  GlusServiesModel.fromJson(Map<String, dynamic> json) {
    glusId = json['glus_id'].toString();
    glusName = json['glus_name'];
    glusNameAr = json['glus_name_ar'];
    glusImage = json['glus_image'];
    glusservicesData = json['glusservices_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['glus_id'] = this.glusId;
    data['glus_name'] = this.glusName;
    data['glus_name_ar'] = this.glusNameAr;
    data['glus_image'] = this.glusImage;
    data['glusservices_data'] = this.glusservicesData;
    return data;
  }
}