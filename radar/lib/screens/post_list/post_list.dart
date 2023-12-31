import 'package:flutter/material.dart';
import 'package:radar/global/dimension.dart';
import 'package:radar/screens/post_detail/post_detail.dart';
import 'package:radar/screens/post_list/post_card.dart';
import '../../global/scroll_things_provider.dart';
import '../../providers/post_list/post_list_bloc.dart';

class PostList extends StatefulWidget {
  final PostListBloc bloc;
  final int index;
  const PostList({
    super.key,
    required this.bloc,
    required this.index,
  });

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList>
    with AutomaticKeepAliveClientMixin {
  @override
  final bool wantKeepAlive = true;

  Widget build(BuildContext context) {
    super.build(context);

    final scrollProvider = CustomScrollProviderData.of(context);
    widget.bloc.scrollController =
        scrollProvider.scrollControllers[widget.index];

    return CustomScrollView(
      controller: widget.bloc.scrollController,
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding:
              EdgeInsets.symmetric(horizontal: Dimensions.width2, vertical: 0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: widget.bloc.imgList.length,
              (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostDetail(
                        heroTag: widget.bloc.heroTagList[index],
                        isMan: widget.bloc.isManList[index],
                        imgUrl: widget.bloc.imgList,
                        rateValueNotifier: widget.bloc.postCardBlocs[index].rateValueNotifier,
                      ),
                    ),
                  ),
                  child: PostCard(
                    key: widget.bloc.cardKeyList[index],
                    imgUrl: widget.bloc.imgList[index],
                    isMan: widget.bloc.isManList[index],
                    bloc: widget.bloc.postCardBlocs[index],
                    heroTag: widget.bloc.heroTagList[index],
                  ),
                );
              },
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 1.5,
              childAspectRatio: 0.45,
            ),
          ),
        ),
      ],
    );
  }
}
