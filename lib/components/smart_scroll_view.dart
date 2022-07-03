import 'package:flutter/material.dart';

class SmartScrollView extends StatefulWidget {
  final Widget child;
  final Function onListReached;
  final Axis scrollDirection;

  SmartScrollView(
      {required this.child,
      required this.onListReached,
      this.scrollDirection = Axis.vertical});

  @override
  State<SmartScrollView> createState() => _SmartScrollViewState();
}

class _SmartScrollViewState extends State<SmartScrollView> {
  var _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          this.widget.onListReached();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: this.widget.scrollDirection,
      child: this.widget.child,
    );
  }
}
