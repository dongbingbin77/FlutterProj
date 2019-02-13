
import 'package:my_flutter/actions/actions.dart';
import 'package:my_flutter/models/HomePageBanner/HomePageBannerContainer.dart';
import 'package:redux/redux.dart';

final homePageBannerReducer = combineReducers<HomePageBannerContainer>([
  TypedReducer<HomePageBannerContainer, GetBannerAction>(getBanner),
]);

HomePageBannerContainer getBanner(HomePageBannerContainer state, action) {
  print("dongbingbin getBanner");
  return action.banner;
}

