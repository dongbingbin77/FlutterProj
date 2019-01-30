// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:meta/meta.dart';


@immutable
class AppState {
  final int count;

  AppState(
      {this.count=0});


  factory AppState.init() => AppState(count: 20);

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
