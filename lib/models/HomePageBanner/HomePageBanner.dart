library homepagebanner;

import 'package:json_annotation/json_annotation.dart';

import 'package:my_flutter/models/HomePageBanner/BannerItem.dart';
part 'HomePageBanner.g.dart';



@JsonSerializable()
class HomePageBanner {
  String code;

  factory HomePageBanner.fromJson(Map<String, dynamic> json) =>
      _$HomePageBannerFromJson(json);

  Map<String, dynamic> toJson(HomePageBanner instance) =>
      _$HomePageBannerToJson(instance);


  HomePageBanner(this.code, this.message, this.head);

  String message;
  List<BannerItem> head;

}