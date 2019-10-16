
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class IconTitleWidget extends StatelessWidget{
  String icon;
  String name;

  final ValueChanged<String> onChanged;
  // ignore: invalid_required_param
  IconTitleWidget(this.icon, this.name,@required this.onChanged);
  void _handleTap() {
    onChanged(name);
  }
  @override
  Widget build(BuildContext context) {
      return GestureDetector(
          onTap: _handleTap,
          child:Column(
            children: <Widget>[
              Image.asset(
                  icon,
                  height:25,
                  width: 25,
              ),
              Text(name)
        ],
      )
      );
  }
}