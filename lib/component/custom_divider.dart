import 'package:flutter/material.dart';

///CustomDivider
///담당자 : ---

class CustomDivider extends StatefulWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  State<CustomDivider> createState() => _CustomDividerState();
}

class _CustomDividerState extends State<CustomDivider> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
            thickness: 1,
            height: 1,
            color: Color(0xFFececec)

        ),
        Divider(
            thickness: 6,
            height: 6,
            color: Color(0xFFf5f5f5)
        ),
      ],
    );
  }
}
