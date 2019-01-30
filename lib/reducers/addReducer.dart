
import 'package:my_flutter/actions/actions.dart';
import 'package:redux/redux.dart';

final addReducer = combineReducers<int>([
  TypedReducer<int, AddAction>(add),
]);

int add(int state, action) {
  print("dongbingbin add");
  state = state+1;
  return state;
}
