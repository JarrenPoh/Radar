// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:radar/global/colors.dart';
// import 'package:radar/global/medium_text.dart';
// import 'package:radar/global/scroll_things_provider.dart';
// import 'package:radar/providers/post_detail_bloc.dart';

// import '../global/bold_text.dart';
// import '../global/dimension.dart';

// class PostDetail extends StatefulWidget {
//   String heroTag;
//   bool isMan;
//   String imgUrl;
//   PostDetail({
//     super.key,
//     required this.heroTag,
//     required this.isMan,
//     required this.imgUrl,
//   });

//   @override
//   State<PostDetail> createState() => _PostDetailState();
// }

// class _PostDetailState extends State<PostDetail> with TickerProviderStateMixin {
//   final PostDetailBloc _bloc = PostDetailBloc();
//   @override
//   void initState() {
//     super.initState();
//     _bloc.tabController = TabController(
//       length: _bloc.tabList.length,
//       vsync: this,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     Color color_onPrimary = Theme.of(context).colorScheme.onPrimary;
//     Color color_onSecondary = Theme.of(context).colorScheme.onSecondary;
//     Color color_title = Theme.of(context).colorScheme.primary;
//     Color color_sub_title = Theme.of(context).colorScheme.secondary;
//     Color _color_arrow = widget.isMan ? color_man_opacity : color_woman_opacity;
//     return Scaffold(
//       backgroundColor: color_onPrimary,
//       body: Hero(
//         tag: widget.heroTag,
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               backgroundColor: color_onPrimary,
//               expandedHeight: 650,
//               pinned: true,
//               stretch: true,
//               elevation: 0,
//               leading: IconButton(
//                 onPressed: () => Navigator.pop(context),
//                 icon: Container(
//                   decoration: BoxDecoration(
//                     color: color_onPrimary,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Icon(
//                     Icons.chevron_left_outlined,
//                     size: 34,
//                     color: color_onSecondary,
//                   ),
//                 ),
//               ),
//               flexibleSpace: LayoutBuilder(
//                 builder: ((context, constraints) {
//                   var top = constraints.biggest.height;
//                   return Stack(
//                     alignment: Alignment.bottomCenter,
//                     children: [
//                       FlexibleSpaceBar(
//                         // collapseMode: CollapseMode.pin,
//                         stretchModes: const <StretchMode>[
//                           StretchMode.blurBackground
//                         ],
//                         background: Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: NetworkImage(widget.imgUrl),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         title: AnimatedOpacity(
//                           opacity: top <= 150 ? 1.0 : 0.0,
//                           duration: const Duration(milliseconds: 1),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               MediumText(
//                                 color: color_title,
//                                 size: 16,
//                                 text: 'this is text',
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: Dimensions.screenWidth,
//                         height: 20,
//                         decoration: BoxDecoration(
//                           color: color_onPrimary,
//                           borderRadius: BorderRadius.vertical(
//                             top: Radius.circular(30),
//                           ),
//                         ),
//                         child: Container(
//                           width: 45,
//                           height: 8,
//                           decoration: BoxDecoration(
//                             color: Colors.grey[350],
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 }),
//               ),
//             ),
//             SliverPersistentHeader(
//               pinned: true,
//               delegate: MySliverDelegate(
//                 minHeight: 50,
//                 maxHeight: 50,
//                 child: TabBar(
//                   overlayColor: null,
//                   labelColor: color_title,
//                   labelStyle: const TextStyle(fontWeight: FontWeight.w600),
//                   unselectedLabelColor: color_sub_title,
//                   indicatorSize: TabBarIndicatorSize.tab,
//                   indicator: BoxDecoration(
//                       color: color_woman,
//                       borderRadius: BorderRadius.circular(10)),
//                   indicatorPadding: EdgeInsets.only(
//                     bottom: Dimensions.height2 * 4,
//                     top: Dimensions.height2 * 18.5,
//                     left: Dimensions.width5 * 17,
//                     right: Dimensions.width5 * 17,
//                   ),
//                   onTap: (value) {
//                     _bloc.tabController.index = value;
//                   },
//                   controller: _bloc.tabController,
//                   tabs: List.generate(
//                     _bloc.tabList.length,
//                     (index) => Tab(
//                       child: Text(_bloc.tabList[index]),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SliverList(
//                 delegate: SliverChildListDelegate([
//               CustomScrollProvider(
//                 tabController: _bloc.tabController,
//                 parent: PrimaryScrollController.of(context),
//                 child: TabBarView(
//                   physics: NeverScrollableScrollPhysics(),
//                   controller: _bloc.tabController,
//                   children: [
//                     ListView(
//                       shrinkWrap: true,
//                       children: [],
//                     ),
//                     ListView(
//                       shrinkWrap: true,
//                       children: [],
//                     ),
//                     ListView(
//                       shrinkWrap: true,
//                       children: [],
//                     ),
//                   ],
//                 ),
//               ),
//             ]))
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MySliverDelegate extends SliverPersistentHeaderDelegate {
//   MySliverDelegate({
//     required this.minHeight,
//     required this.maxHeight,
//     required this.child,
//   });

//   final double minHeight; //最小高度
//   final double maxHeight; //最大高度
//   final Widget child; //子Widget布局

//   @override
//   double get minExtent => minHeight;

//   @override
//   double get maxExtent => (maxHeight);

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return SizedBox.expand(child: child);
//   }

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     // TODO: implement shouldRebuild
//     return true;
//   }
// }
