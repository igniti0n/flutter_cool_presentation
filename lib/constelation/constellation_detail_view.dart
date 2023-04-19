import 'package:flutter/material.dart';

import 'constellation_title_card.dart';
import 'demo_data.dart';
import 'main.dart';
import 'styles.dart';

class ConstellationDetailView extends StatefulWidget {
  static const route = "ConstellationDetailView";

  final ConstellationData data;
  final bool redMode;
  final int contentDelay;
  final Function onBackTap;

  const ConstellationDetailView(
      {Key? key,
      required this.data,
      required this.redMode,
      this.contentDelay = 1000,
      required this.onBackTap})
      : super(key: key);

  @override
  _ConstellationDetailViewState createState() =>
      _ConstellationDetailViewState();
}

class _ConstellationDetailViewState extends State<ConstellationDetailView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _contentScaleTween;
  late Animation<double> _textAlphaTween;

  @override
  void initState() {
    _animController = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.contentDelay))
      ..addListener(() {
        setState(() {});
      });
    _contentScaleTween = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animController,
          curve: const Interval(.4, .8, curve: Curves.easeOutQuad)),
    );
    _textAlphaTween = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animController,
          curve: const Interval(.6, 1, curve: Curves.easeOutQuad)),
    );
    _animController.forward(from: 0);
    super.initState();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          children: <Widget>[
            ConstellationTitleCard(
              data: widget.data,
              redMode: widget.redMode,
            ),
            Expanded(
              child: Transform.scale(
                scale: _contentScaleTween.value,
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      "images/${widget.data.image}-Constellation@2x.png",
                      filterQuality: FilterQuality.high,
                    ),
                    Opacity(
                      opacity: _textAlphaTween.value,
                      child: Image.asset(
                        "images/${widget.data.image}-Text@2x.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
              splashColor: Colors.white24,
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: const BorderSide(color: Color(0xffc9c9c9))),
              //Dispatch our tap event to the parent of this widget, and let them handle it.
              onPressed: () => widget.onBackTap(),
              child: Text("Return to List",
                  style: TextStyle(
                      fontFamily: Fonts.Content,
                      color: Colors.white,
                      package: App.pkg)),
            ),
            const SizedBox(
              height: 36,
            )
          ],
        ));
  }
}
