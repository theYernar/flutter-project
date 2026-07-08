import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project/src/core/theme/resources.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RefreshController _refreshController = RefreshController();

  Future<void> _onRefresh() async {
    await Future<void>.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    // Здесь в будущем будет вызов обновления данных через кубиты / блоки

    if (mounted) {
      _refreshController.refreshCompleted();
    }
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ///
            /// AppBar
            ///
            const SizedBox(),

            ///
            /// Body
            ///
            Expanded(
              child: SmartRefresher(
                controller: _refreshController,
                onRefresh: _onRefresh,
                header: const ClassicHeader(),
                child: const SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
