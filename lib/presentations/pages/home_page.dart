import 'package:flutter/material.dart';

import '../widgets/customeTileWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.aspectRatio * 50),
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Science",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.aspectRatio * 10,
          ),
          const Text(
            "Here is your Science news",
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 20), // Adjust the spacing as needed
                child: CustomTileWidget(),
              ),
              itemCount: 5,
              itemExtent: 150, // Adjust the item height as needed
            ),
          )
        ],
      ),
    );
  }
}
