import 'package:flutter/material.dart';

class FlutterIndexDrawer extends StatelessWidget {
  const FlutterIndexDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Text(
              'Flutter Index',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).textTheme.bodyMedium!.color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ExpansionTile(
            title: Text(
              'Flutter Packages',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              ListTile(
                title: Text(
                  'State Management',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 14),
                ),
                subtitle: Text(
                  'Provider, Riverpod, BLoC',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                onTap: () {
                  _showInfoDialog(
                    context,
                    'State Management Packages',
                    'Provider: Simple and lightweight, ideal for small to medium apps.\n'
                        'Riverpod: Type-safe, scalable, and avoids Provider’s limitations.\n'
                        'BLoC: Reactive and robust, best for complex state management.',
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Networking',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 14),
                ),
                subtitle: Text(
                  'Dio, http, GraphQL',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                onTap: () {
                  _showInfoDialog(
                    context,
                    'Networking Packages',
                    'Dio: Feature-rich HTTP client with interceptors and caching.\n'
                        'http: Lightweight HTTP client for basic requests.\n'
                        'GraphQL: Efficient for complex APIs with real-time updates.',
                  );
                },
              ),
              ListTile(
                title: Text(
                  'UI/UX',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 14),
                ),
                subtitle: Text(
                  'Flutter Hooks, GetX',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                onTap: () {
                  _showInfoDialog(
                    context,
                    'UI/UX Packages',
                    'Flutter Hooks: Functional programming for reusable UI logic.\n'
                        'GetX: Simplifies navigation, state, and dependency injection.',
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'Common Issues & Solutions',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              ListTile(
                title: Text(
                  'Performance Optimization',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 14),
                ),
                subtitle: Text(
                  'Reduce rebuilds, optimize images',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                onTap: () {
                  _showInfoDialog(
                    context,
                    'Performance Optimization',
                    'Use const constructors to reduce widget rebuilds.\n'
                        'Optimize images with compression and caching.\n'
                        'Leverage ListView.builder for efficient scrolling.',
                  );
                },
              ),
              ListTile(
                title: Text(
                  'State Management Errors',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 14),
                ),
                subtitle: Text(
                  'Provider not found, BLoC issues',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                onTap: () {
                  _showInfoDialog(
                    context,
                    'State Management Errors',
                    'ProviderNotFound: Ensure Provider is above the widget tree.\n'
                        'BLoC issues: Verify Stream subscriptions and disposals.',
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showInfoDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
        content: Text(
          content,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
