import 'package:cached_network_image/cached_network_image.dart';
import 'package:data/models/review_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv/pages/detail/tv_detail_controller.dart';

class TvDetailPage extends GetView<TvDetailController> {
  const TvDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tv = controller.tvModel;
    return Scaffold(
      appBar: AppBar(title: Text(tv.title)),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 0.66,
                  child: CachedNetworkImage(
                    imageUrl: tv.thumbnailUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(tv.title),
                Text('${tv.firstAirDate.year}'),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('Reviews'),
            ),
          ),
          controller.reviewsState.obx(
            (state) => SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _ReviewItem(state[index]),
                childCount: state!.length,
              ),
            ),
            onLoading: const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            onEmpty: const SliverFillRemaining(
              child: Center(
                child: Text('No Reviews.'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewItem extends StatelessWidget {
  const _ReviewItem(
    this.review, {
    Key? key,
  }) : super(key: key);

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(review.author),
          Text(review.content),
        ],
      ),
    );
  }
}
