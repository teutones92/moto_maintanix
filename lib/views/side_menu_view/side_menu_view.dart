import 'package:flutter/material.dart';
import 'package:moto_maintanix/models/app/side_menu_model/side_menu_model.dart';
import 'package:moto_maintanix/service/app_version_service/app_version_service.dart';
import 'package:moto_maintanix/service/url_navigation_service/url_navigation_service.dart';

class SideMenuView extends StatelessWidget {
  const SideMenuView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Card(
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/icons/avatar.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8, left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'User Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('example@example.com'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(flex: 1),
              Flexible(
                flex: 8,
                child: ListView.builder(
                  itemCount: SideMenuModel.sideMenuList.length,
                  itemBuilder: (context, index) {
                    final item = SideMenuModel.sideMenuList[index];
                    return ListTile(
                      leading: Icon(SideMenuModel.sideMenuList[index].icon),
                      title: Text(SideMenuModel.sideMenuList[index].title),
                      onTap: () async {
                        if (item.available == false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                '🛑 Not available yet! Working for next version! 🚀',
                              ),
                            ),
                          );
                          return;
                        }
                        if (item.route != null) {
                          if (!await UrlNavigationService.navigateTo(
                              item.route!)) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Could not navigate to route!'),
                                ),
                              );
                            }
                          }
                        } else {
                          // Navigate to route
                        }
                      },
                    );
                  },
                ),
              ),
              const Spacer(),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Text('Version: ${AppVersionService.appVersion}'))
            ],
          ),
        ),
      ),
    );
  }
}
