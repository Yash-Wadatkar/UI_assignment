import 'package:demo_ui/features/complete/presentation/pages/complete_screen.dart';
import 'package:demo_ui/features/received/presentation/pages/received_screen.dart';
import 'package:demo_ui/features/schedule/presentation/pages/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int currentIndex = 0;
  final List<Widget> _screens = [
    const ReceivedScreen(),
    const ScheduleScreen(),
    const CompleteScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[currentIndex],
        bottomNavigationBar: Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          child: Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 7, offset: Offset(4, 4))
            ]),
            height: 90,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              child: BottomNavigationBar(
                  selectedItemColor: const Color(0xff0f20a0),
                  selectedFontSize: 18,
                  unselectedFontSize: 18,
                  selectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.w800),
                  unselectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.w500),
                  iconSize: 30,
                  backgroundColor: Colors.white,
                  currentIndex: currentIndex,
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/icons/files.svg',
                          height: 32,

                          // ignore: deprecated_member_use
                          color: currentIndex == 0
                              ? const Color(0xff0f20a0)
                              : Colors.grey,
                        ),
                        label: 'Received'),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/icons/schedule.svg',
                          height: 32,
                          // ignore: deprecated_member_use
                          color: currentIndex == 1
                              ? const Color(0xff0f20a0)
                              : Colors.grey,
                        ),
                        label: 'Scheduled'),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/icons/complete.svg',
                          height: 32,
                          // ignore: deprecated_member_use
                          color: currentIndex == 2
                              ? const Color(0xff0f20a0)
                              : Colors.grey,
                        ),
                        label: 'Complete'),
                  ]),
            ),
          ),
        ));
  }
}
