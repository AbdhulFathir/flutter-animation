import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    super.key,
    required this.press,
  });

  final ValueChanged<int> press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth! * 0.8, // 80%
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DefaultTabController(
        length: 2,
        child: TabBar(
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          dividerHeight: 0,
          onTap: press,
          tabs: const [Tab(text: "Morning Login"), Tab(text: "Night Login")],
        ),
      ),
    );
  }
}
