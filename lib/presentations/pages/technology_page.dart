import 'package:flutter/material.dart';

import '../widgets/callingWidget.dart';

class TechnologyPage extends StatelessWidget {
  const TechnologyPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return CallingWidgets(
      newsType: "technology",
      title: 'Technology',
    );
  }
}
