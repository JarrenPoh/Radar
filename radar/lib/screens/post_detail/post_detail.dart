import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overscroll_pop/overscroll_pop.dart';
import 'package:radar/providers/post_detail/post_detail_bloc.dart';
import 'package:radar/valueNotifier/int_value_notifier.dart';
import 'package:radar/screens/post_detail/comment.dart';
import 'package:radar/screens/post_detail/detail_picture.dart';
import 'package:radar/screens/post_detail/information.dart';
import 'package:radar/screens/post_detail/version.dart';
import '../../global/dimension.dart';
import 'detail_appbar.dart';
import 'detail_navigation_bar.dart';

class PostDetail extends StatefulWidget {
  final String heroTag;
  final bool isMan;
  final List imgUrl;
  final IntValueNotifier rateValueNotifier;
  const PostDetail({
    super.key,
    required this.heroTag,
    required this.isMan,
    required this.imgUrl,
    required this.rateValueNotifier,
  });

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> with TickerProviderStateMixin {
  final PostDetailBloc _bloc = PostDetailBloc();
  @override
  void initState() {
    super.initState();
    print('init');
    _bloc.tabController = TabController(
      length: _bloc.tabList.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;

    return OverscrollPop(
      scrollToPopOption: ScrollToPopOption.start,
      dragToPopDirection: DragToPopDirection.horizontal,
      child: Scaffold(
        bottomNavigationBar: DetailNavigationBar(
          isMan: true,
          commentDismissible: makeDismissible(
            color_onPrimary,
            Comment(
              bloc: _bloc.commentBloc,
            ),
          ),
          versionDismissible: makeDismissible(
            color_onPrimary,
            Version(
              bloc: _bloc.versionBloc,
            ),
          ),
          bloc: _bloc,
          rateValueNotifier: widget.rateValueNotifier,
        ),
        body: Container(
          color: color_onPrimary,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    DetailPicture(
                      heroTag: widget.heroTag,
                      imgUrl: widget.imgUrl,
                      bloc: _bloc,
                    ),
                    Information(
                      bloc: _bloc.informationBloc,
                    ),
                  ],
                ),
              ),
              DetailAppBar(
                isMan: widget.isMan,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeDismissible(color_onPrimary, child) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.85,
        minChildSize: 0.4,
        maxChildSize: 1,
        builder: (BuildContext context, ScrollController scrollController) =>
            Container(
          decoration: BoxDecoration(
            color: color_onPrimary,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          padding: EdgeInsets.all(Dimensions.width2 * 3),
          child: child,
        ),
      ),
    );
  }
}
