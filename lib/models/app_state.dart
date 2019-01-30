// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:meta/meta.dart';
import 'package:my_flutter/models/HomePageBanner/BannerItem.dart';
import 'package:my_flutter/models/HomePageBanner/HomePageBanner.dart';
import 'package:my_flutter/models/HomePageBanner/HomePageBannerContainer.dart';


@immutable
class AppState {
  final int count;

  final HomePageBannerContainer banner;


  AppState(this.count, this.banner);

  factory AppState.init() => AppState(20,new HomePageBannerContainer(new HomePageBanner("100","",new List<BannerItem>())));

//  AppState copyWith({
//    bool isLoading,
//    List<Todo> todos,
//    AppTab activeTab,
//    VisibilityFilter activeFilter,
//  }) {
//    return AppState(
//      isLoading: isLoading ?? this.isLoading,
//      todos: todos ?? this.todos,
//      activeTab: activeTab ?? this.activeTab,
//      activeFilter: activeFilter ?? this.activeFilter,
//    );
//  }

//  @override
//  int get hashCode =>
//      isLoading.hashCode ^
//      todos.hashCode ^
//      activeTab.hashCode ^
//      activeFilter.hashCode;

//  @override
//  bool operator ==(Object other) =>
//      identical(this, other) ||
//      other is AppState &&
//          runtimeType == other.runtimeType &&
//          isLoading == other.isLoading &&
//          todos == other.todos &&
//          activeTab == other.activeTab &&
//          activeFilter == other.activeFilter;

//  @override
//  String toString() {
//    return 'AppState{isLoading: $isLoading, todos: $todos, activeTab: $activeTab, activeFilter: $activeFilter}';
//  }
}
