import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../global/colors.dart';
import '../../global/dimension.dart';
import '../../providers/post_detail_bloc.dart';
import '../../widgets/heart_animation_widget.dart';

class DetailPicture extends StatefulWidget {
  final String heroTag;
  final List imgUrl;
  final PostDetailBloc bloc;
  const DetailPicture({
    super.key,
    required this.heroTag,
    required this.imgUrl,
    required this.bloc,
  });

  @override
  State<DetailPicture> createState() => _DetailPictureState();
}

class _DetailPictureState extends State<DetailPicture> {
  bool isLike = false;
  bool isHeartAnimating = false;
  final PageController _pageController = PageController();
  var currPageValue = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          isHeartAnimating = true;
          isLike = true;
          widget.bloc.isLikeProvider.isLikeChage(isLike);
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: Dimensions.height5 * 140,
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: widget.heroTag,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.imgUrl.length,
                    onPageChanged: (value) {
                      setState(() {
                        currPageValue = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.network(
                        widget.imgUrl[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.height5 * 2),
                child: DotsIndicator(
                  dotsCount: widget.imgUrl.length,
                  position: currPageValue,
                  decorator: DotsDecorator(
                    activeColor: color_man,
                    color: Colors.white.withOpacity(0.5),
                    size: Size.square(Dimensions.width5 * 2),
                    activeSize:
                        Size(Dimensions.width5 * 4, Dimensions.height5 * 2),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Opacity(
            opacity: isHeartAnimating ? 1 : 0,
            child: HeartAnimationWidget(
              isAnimating: isHeartAnimating,
              child: Icon(
                Icons.favorite,
                color: color_woman,
                size: Dimensions.height5 * 20,
              ),
              onEnd: () => setState(() => isHeartAnimating = false),
            ),
          ),
        ],
      ),
    );
  }
}
