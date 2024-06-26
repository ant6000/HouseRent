
class BannerModel {
  Attributes? attributes;
  BannerModel({this.attributes});
  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    attributes: Attributes.fromJson(json['attributes'])
  );
}

class Attributes {
  Image? image;
  Attributes({this.image});
  factory Attributes.fromJson(Map<String, dynamic> json) =>
      Attributes(image: Image.fromJson(json['image']));
}

class Image {
  List<ImageAttributes>? attributes;
  Image({this.attributes});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
      attributes: List<ImageAttributes>.from(
          json['attributes'].map((x) => ImageAttributes.fromJson(x))));
}

class ImageAttributes {
  String? url;
  ImageAttributes({this.url});
  factory ImageAttributes.fromJson(Map<String, dynamic> json) =>
      ImageAttributes(url: json['url']);
}
