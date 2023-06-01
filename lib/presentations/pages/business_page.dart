import 'package:flutter/material.dart';

import '../widgets/callingWidget.dart';

class BusinessPage extends StatelessWidget {
  const BusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CallingWidgets(
      newsType: "business",
      title: 'Business',
    );
  }
}
