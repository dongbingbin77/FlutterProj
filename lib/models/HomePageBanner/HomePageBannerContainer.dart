library homepagebannercontainer;

import 'package:json_annotation/json_annotation.dart';
import 'package:my_flutter/models/HomePageBanner/HomePageBanner.dart';


part 'package:my_flutter/models/HomePageBanner/HomePageBannerContainer.g.dart';




@JsonSerializable()
@JsonSerializable()
class HomePageBannerContainer {
  HomePageBanner data;

  factory HomePageBannerContainer.fromJson(Map<String, dynamic> json) =>
      _$HomePageBannerContainerFromJson(json);

  Map<String, dynamic> toJson(HomePageBannerContainer instance) =>
      _$HomePageBannerContainerToJson(instance);

  HomePageBannerContainer(this.data);


}