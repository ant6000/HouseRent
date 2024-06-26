// class HouseModel {
//     List<HouseModelDatum> data;
//     Meta meta;

//     HouseModel({
//         required this.data,
//         required this.meta,
//     });

//     factory HouseModel.fromJson(Map<String, dynamic> json) => HouseModel(
//         data: List<HouseModelDatum>.from(json["data"].map((x) => HouseModelDatum.fromJson(x))),
//         meta: Meta.fromJson(json["meta"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "meta": meta.toJson(),
//     };
// }

// class HouseModelDatum {
//     int id;
//     PurpleAttributes attributes;

//     HouseModelDatum({
//         required this.id,
//         required this.attributes,
//     });

//     factory HouseModelDatum.fromJson(Map<String, dynamic> json) => HouseModelDatum(
//         id: json["id"],
//         attributes: PurpleAttributes.fromJson(json["attributes"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "attributes": attributes.toJson(),
//     };
// }

// class PurpleAttributes {
//     String houseTitle;
//     List<Description> description;
//     int ownerPhone;
//     String location;
//     int price;
//     String ownerName;
//     int bed;
//     int bath;
//     int kitchen;
//     DateTime createdAt;
//     DateTime updatedAt;
//     DateTime publishedAt;
//     Images images;

//     PurpleAttributes({
//         required this.houseTitle,
//         required this.description,
//         required this.ownerPhone,
//         required this.location,
//         required this.price,
//         required this.ownerName,
//         required this.bed,
//         required this.bath,
//         required this.kitchen,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.publishedAt,
//         required this.images,
//     });

//     factory PurpleAttributes.fromJson(Map<String, dynamic> json) => PurpleAttributes(
//         houseTitle: json["HouseTitle"],
//         description: List<Description>.from(json["Description"].map((x) => Description.fromJson(x))),
//         ownerPhone: json["OwnerPhone"],
//         location: json["Location"],
//         price: json["Price"],
//         ownerName: json["OwnerName"],
//         bed: json["Bed"],
//         bath: json["Bath"],
//         kitchen: json["Kitchen"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         publishedAt: DateTime.parse(json["publishedAt"]),
//         images: Images.fromJson(json["Images"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "HouseTitle": houseTitle,
//         "Description": List<dynamic>.from(description.map((x) => x.toJson())),
//         "OwnerPhone": ownerPhone,
//         "Location": location,
//         "Price": price,
//         "OwnerName": ownerName,
//         "Bed": bed,
//         "Bath": bath,
//         "Kitchen": kitchen,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "publishedAt": publishedAt.toIso8601String(),
//         "Images": images.toJson(),
//     };
// }

// class Description {
//     DescriptionType type;
//     List<Child> children;

//     Description({
//         required this.type,
//         required this.children,
//     });

//     factory Description.fromJson(Map<String, dynamic> json) => Description(
//         type: descriptionTypeValues.map[json["type"]]!,
//         children: List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "type": descriptionTypeValues.reverse[type],
//         "children": List<dynamic>.from(children.map((x) => x.toJson())),
//     };
// }

// class Child {
//     ChildType type;
//     String text;

//     Child({
//         required this.type,
//         required this.text,
//     });

//     factory Child.fromJson(Map<String, dynamic> json) => Child(
//         type: childTypeValues.map[json["type"]]!,
//         text: json["text"],
//     );

//     Map<String, dynamic> toJson() => {
//         "type": childTypeValues.reverse[type],
//         "text": text,
//     };
// }

// enum ChildType {
//     TEXT
// }

// final childTypeValues = EnumValues({
//     "text": ChildType.TEXT
// });

// enum DescriptionType {
//     PARAGRAPH
// }

// final descriptionTypeValues = EnumValues({
//     "paragraph": DescriptionType.PARAGRAPH
// });

// class Images {
//     List<ImagesDatum> data;

//     Images({
//         required this.data,
//     });

//     factory Images.fromJson(Map<String, dynamic> json) => Images(
//         data: List<ImagesDatum>.from(json["data"].map((x) => ImagesDatum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

// class ImagesDatum {
//     int id;
//     FluffyAttributes attributes;

//     ImagesDatum({
//         required this.id,
//         required this.attributes,
//     });

//     factory ImagesDatum.fromJson(Map<String, dynamic> json) => ImagesDatum(
//         id: json["id"],
//         attributes: FluffyAttributes.fromJson(json["attributes"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "attributes": attributes.toJson(),
//     };
// }

// class FluffyAttributes {
//     String name;
//     dynamic alternativeText;
//     dynamic caption;
//     int width;
//     int height;
//     String hash;
//     double size;
//     String url;
//     dynamic previewUrl;
//     dynamic providerMetadata;
//     DateTime createdAt;
//     DateTime updatedAt;

//     FluffyAttributes({
//         required this.name,
//         required this.alternativeText,
//         required this.caption,
//         required this.width,
//         required this.height,
//         required this.hash,
//         required this.size,
//         required this.url,
//         required this.previewUrl,
//         required this.providerMetadata,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     factory FluffyAttributes.fromJson(Map<String, dynamic> json) => FluffyAttributes(
//         name: json["name"],
//         alternativeText: json["alternativeText"],
//         caption: json["caption"],
//         width: json["width"],
//         height: json["height"],
//         hash: json["hash"],
//         size: json["size"]?.toDouble(),
//         url: json["url"],
//         previewUrl: json["previewUrl"],
//         providerMetadata: json["provider_metadata"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "alternativeText": alternativeText,
//         "caption": caption,
//         "width": width,
//         "height": height,
//         "hash": hash,
//         "size": size,
//         "url": url,
//         "previewUrl": previewUrl,
//         "provider_metadata": providerMetadata,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//     };
// }

// class Meta {
//     Pagination pagination;

//     Meta({
//         required this.pagination,
//     });

//     factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         pagination: Pagination.fromJson(json["pagination"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "pagination": pagination.toJson(),
//     };
// }

// class Pagination {
//     int page;
//     int pageSize;
//     int pageCount;
//     int total;

//     Pagination({
//         required this.page,
//         required this.pageSize,
//         required this.pageCount,
//         required this.total,
//     });

//     factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//         page: json["page"],
//         pageSize: json["pageSize"],
//         pageCount: json["pageCount"],
//         total: json["total"],
//     );

//     Map<String, dynamic> toJson() => {
//         "page": page,
//         "pageSize": pageSize,
//         "pageCount": pageCount,
//         "total": total,
//     };
// }

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//             reverseMap = map.map((k, v) => MapEntry(v, k));
//             return reverseMap;
//     }
// }
// To parse this JSON data, do
//
//     final houseModel = houseModelFromJson(jsonString);

import 'dart:convert';

HouseModel houseModelFromJson(String str) =>
    HouseModel.fromJson(json.decode(str));

String houseModelToJson(HouseModel data) => json.encode(data.toJson());

class HouseModel {
  int id;
  Attributes attributes;

  HouseModel({
    required this.id,
    required this.attributes,
  });

  factory HouseModel.fromJson(Map<String, dynamic> json) => HouseModel(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  String houseTitle;
  List<Description> description;
  int ownerPhone;
  String location;
  int price;
  String ownerName;
  int bed;
  int bath;
  int kitchen;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;

  Attributes({
    required this.houseTitle,
    required this.description,
    required this.ownerPhone,
    required this.location,
    required this.price,
    required this.ownerName,
    required this.bed,
    required this.bath,
    required this.kitchen,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        houseTitle: json["HouseTitle"],
        description: List<Description>.from(
            json["Description"].map((x) => Description.fromJson(x))),
        ownerPhone: json["OwnerPhone"],
        location: json["Location"],
        price: json["Price"],
        ownerName: json["OwnerName"],
        bed: json["Bed"],
        bath: json["Bath"],
        kitchen: json["Kitchen"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "HouseTitle": houseTitle,
        "Description": List<dynamic>.from(description.map((x) => x.toJson())),
        "OwnerPhone": ownerPhone,
        "Location": location,
        "Price": price,
        "OwnerName": ownerName,
        "Bed": bed,
        "Bath": bath,
        "Kitchen": kitchen,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
      };
}

class Description {
  String type;
  List<Child> children;

  Description({
    required this.type,
    required this.children,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        type: json["type"],
        children:
            List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
      };
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

  Map<String, dynamic> toJson() => {
        "type": type,
        "text": text,
      };
}
