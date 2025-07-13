import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/text_size_manager.dart';

class PublishedMediaSection extends StatelessWidget {
  PublishedMediaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Published Media',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = _getCrossAxisCount(constraints.maxWidth);
              double cardWidth = _getCardWidth(
                constraints.maxWidth,
                crossAxisCount,
              );
              return Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: mediaItems.asMap().entries.map((entry) {
                  return SizedBox(
                    width: cardWidth,
                    child: ContentItem(
                      title: entry.value['title']!,
                      thumbnail: entry.value['thumbnail']!,
                      url: entry.value['url']!,
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  int _getCrossAxisCount(double screenWidth) {
    if (screenWidth > 1200) return 4; // Up to 4 cards
    if (screenWidth > 900) return 3;
    return 2; // Minimum 2 cards
  }

  double _getCardWidth(double screenWidth, int crossAxisCount) {
    double cardWidth =
        (screenWidth - (20 * (crossAxisCount + 1))) / crossAxisCount;
    return cardWidth.clamp(150.0, 300.0); // Min 150px, max 300px
  }

  final List<Map<String, String>> mediaItems = [
    {
      'title': 'Suvidha E-Commerce Demo',
      'thumbnail': 'assets/video_thumbnail.jpg',
      'url': 'https://youtube.com/watch?v=your_video_id',
    },
    {
      'title': 'Flutter Tutorial: Building a Booking App',
      'thumbnail': 'assets/video_thumbnail.jpg',
      'url': 'https://youtube.com/watch?v=another_video_id',
    },
    {
      'title': 'Flutter Tutorial: Building a Booking App',
      'thumbnail': 'assets/video_thumbnail.jpg',
      'url': 'https://youtube.com/watch?v=another_video_id',
    },
    {
      'title': 'Flutter Tutorial: Building a Booking App',
      'thumbnail': 'assets/video_thumbnail.jpg',
      'url': 'https://youtube.com/watch?v=another_video_id',
    },
    {
      'title': 'Flutter Tutorial: Building a Booking App',
      'thumbnail': 'assets/video_thumbnail.jpg',
      'url': 'https://youtube.com/watch?v=another_video_id',
    },
    {
      'title': 'Flutter Tutorial: Building a Booking App',
      'thumbnail': 'assets/video_thumbnail.jpg',
      'url': 'https://youtube.com/watch?v=another_video_id',
    },
  ];
}

class ContentItem extends StatelessWidget {
  final String title;
  final String thumbnail;
  final String url;

  const ContentItem({
    super.key,
    required this.title,
    required this.thumbnail,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(
              Uri.parse(url),
              mode: LaunchMode.externalApplication,
            );
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.1),
                Theme.of(context).cardColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    thumbnail,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 120,
                      width: double.infinity,
                      color: Theme.of(context).cardColor,
                      child: Icon(
                        Icons.error,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Icon(
                        Icons.play_circle_fill,
                        size: 40,
                        color: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.color!.withOpacity(0.8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: TextSizeManager.getDynamicTextSize(
                      context,
                      baseSize: 16.0,
                    ),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
