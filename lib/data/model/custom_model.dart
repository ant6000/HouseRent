class CustomModel {
  int? id;
  Attributes? attributes;
  CustomModel({this.id, this.attributes});

  factory CustomModel.fromJson(Map<String, dynamic> json) => CustomModel(
        id: json['id'],
        attributes: json['attributes'] != null
            ? Attributes.fromJson(json['attributes'])
            : null,
      );
}

class Attributes {
  String? houseTitle;
  List<Description>? description;
  int? ownerPhone;
  String? location;
  int? price;
  String? ownerName;
  int? bed;
  int? bath;
  int? kitchen;
  Images? images;
  Attributes(
      {this.houseTitle,
      this.description,
      this.ownerPhone,
      this.ownerName,
      this.bath,
      this.bed,
      this.kitchen,
      this.location,
      this.price,
      this.images});
  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
      houseTitle: json['HouseTitle'],
      description: List<Description>.from(
            json["Description"].map((x) => Description.fromJson(x))),
      ownerPhone: json['OwnerPhone'],
      ownerName: json['OwnerName'],
      location: json['Location'],
      price: json['Price'],
      bed: json['Bed'],
      bath: json['Bath'],
      kitchen: json['Kitchen'],
      images: Images.fromJson(json['Images']));
}

class Images {
  List<ImagesData>? data;
  Images({this.data});
  factory Images.fromJson(Map<String, dynamic> json) => Images(
      data: List<ImagesData>.from(
          json['data'].map((x) => ImagesData.fromjson(x))));
}

class ImagesData {
  int? id;
  ImageAttribute? attributes;
  ImagesData({this.id, this.attributes});
  factory ImagesData.fromjson(Map<String, dynamic> json) => ImagesData(
      id: json['id'], attributes: ImageAttribute.fomjson(json['attributes']));
}

class ImageAttribute {
  String? url;
  ImageAttribute({this.url});
  factory ImageAttribute.fomjson(Map<String, dynamic> json) =>
      ImageAttribute(url: json['url']);
}

class Description {
  List<Child> children;

  Description({
    required this.children,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        children:
            List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
      );
}

class Child {
  String type;
  String text;
  Child({
    required this.type,
    required this.text,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        type: json["type"],
        text: json["text"],
      );
}
