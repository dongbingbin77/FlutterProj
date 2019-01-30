
import 'package:my_flutter/actions/actions.dart';
import 'package:redux/redux.dart';

final addReducer = combineReducers<int>([
  TypedReducer<int, AddAction>(add),
]);

int add(int state, action) {
  print("dongbingbin add");
  print("dongbin state:$state");

  int temp = action.count;
  print("dongbingbin action:$temp");

  state = state+1;
  return state;
}
