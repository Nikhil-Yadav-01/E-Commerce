import 'package:flutter/material.dart';

import 'curved_edges.dart';

class RCurvedEdgesWidget extends StatelessWidget {
  const RCurvedEdgesWidget({
    super.key,
    required this.isDark, this.child,
  });

  final bool isDark;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: RCurvedEdges(),
        child: child
    );
  }
}