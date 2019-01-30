// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.


// We create the State reducer by combining many smaller reducers into one!
import 'package:my_flutter/models/app_state.dart';
import 'package:my_flutter/reducers/addReducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    count:addReducer(state.count,action),
  );
}
