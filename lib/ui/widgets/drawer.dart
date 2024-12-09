import 'package:flutter/material.dart';
import 'package:hall_management_client/utils/context_extensions.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 170,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: context.theme.secondaryHeaderColor,
                shape: BoxShape.rectangle,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: context.theme.primaryColorLight,
                    child: const Text(
                      '241',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0,horizontal: 8),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User Name',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'anujitbestbd@gmail.com',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
