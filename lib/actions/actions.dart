// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:my_flutter/models/HomePageBanner/HomePageBannerContainer.dart';

class AddAction {

  int count;

  AddAction(this.count);


}


class GetBannerAction{
  HomePageBannerContainer banner;

  GetBannerAction(this.banner);

}
