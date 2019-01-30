library banneritem;

import 'package:json_annotation/json_annotation.dart';

part 'BannerItem.g.dart';



@JsonSerializable()
class BannerItem {
  String resourceId;

  factory BannerItem.fromJson(Map<String, dynamic> json) =>
      _$BannerItemFromJson(json);

  Map<String, dynamic> toJson(BannerItem instance) =>
      _$BannerItemToJson(instance);


  BannerItem(this.resourceId, this.pageURL, this.bannerImage,
      this.promotionImage, this.programType, this.pageTitle, this.validateFrom,
      this.validateTo);

  String pageURL;
  String bannerImage;
  String promotionImage;
  String programType;
  String pageTitle;
  String validateFrom;
  String validateTo;
}