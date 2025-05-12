import 'package:flutter/material.dart';

/// {@template primary_spacer}
/// PrimarySpacer widget.
/// {@endtemplate}
class PrimarySpacer extends StatelessWidget {
  /// {@macro primary_spacer}
  const PrimarySpacer({
    this.height,
    this.width,
    super.key, // ignore: unused_element
  });

  final double? height;

  final double? width;

  factory PrimarySpacer.w10() {
    return PrimarySpacer(width: 10);
  }
  factory PrimarySpacer.h20() {
    return PrimarySpacer(height: 20);
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }

  void wrap() {}
}

/// {@template primary_spacer}
/// PaddingWrapper widget.
/// {@endtemplate}
class UIPadding extends StatelessWidget {
  /// {@macro primary_spacer}
  const UIPadding({
    this.useSliver = false,
    this.edgeInsets,
    this.child,
    super.key, // ignore: unused_element
  });

  final EdgeInsets? edgeInsets;

  final bool useSliver;

  final Widget? child;

  factory UIPadding.h10({Widget? chlid}) {
    return UIPadding(edgeInsets: EdgeInsets.symmetric(horizontal: 10), child: chlid);
  }

  factory UIPadding.h20({Widget? chlid}) {
    return UIPadding(edgeInsets: EdgeInsets.symmetric(horizontal: 20), child: chlid);
  }

  factory UIPadding.h10v20({Widget? child}) {
    return UIPadding(edgeInsets: EdgeInsets.symmetric(horizontal: 10, vertical: 20), child: child);
  }

  @override
  Widget build(BuildContext context) {
    final defaultPadding = edgeInsets ?? EdgeInsets.zero;
    if (useSliver) {
      return SliverPadding(padding: defaultPadding, sliver: child);
    } else {
      return Padding(padding: defaultPadding, child: child);
    }
  }
}

/// {@template primary_spacer}
/// MockList widget.
/// {@endtemplate}
class MockList extends StatelessWidget {
  /// {@macro primary_spacer}
  const MockList({
    super.key, // ignore: unused_element
  });

  @override
  Widget build(BuildContext context) {
    // return ListView.separated(
    //   itemBuilder: (context, index) {},
    //   separatorBuilder: (context, index) => PrimarySpacer.w10(),
    //   itemCount: 100,
    // );
    return Column(
      children: [
        TextField(),
        PrimarySpacer.h20(),
        TextField(),
        Container(padding: UIPadding.h10().edgeInsets),
        UIPadding.h10(chlid: TextField()),
      ],
    );
  }
}
