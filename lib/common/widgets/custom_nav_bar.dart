import 'package:bites_assignment/common/helper/assets_helper.dart';
import 'package:bites_assignment/common/theme/app_styles.dart';
import 'package:bites_assignment/common/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final Key calenderKey;
  final Key clockKey;
  final Key notificationKey;
  final Key profileKey;
  // ignore: use_key_in_widget_constructors
  const CustomBottomNavBar(
      {required this.calenderKey,
      required this.clockKey,
      required this.notificationKey,
      required this.profileKey});
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color getTintColor(int index) {
    return _selectedIndex == index ? kPrimaryColor : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    final addFabButton = Positioned(
        top: 28,
        left: (MediaQuery.of(context).size.width / 2) - (60 / 2),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: kPrimaryColor,
          child: Image.asset(
            AssetsHelper.plusIcon,
            width: 20,
          ),
          onPressed: () => _onItemTapped(4),
        ));

    final extraSpaceToCoverBottom = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 39.9,
        color: Colors.white,
      ),
    );

    final makeBitesStyledCurve = Container(
        alignment: Alignment.topCenter,
        child: CustomPaint(
          painter: CurvedStylePainter(),
          child: Container(
            height: 100, // Adjust the height as needed
          ),
        ));

    return SizedBox(
        height: 140,
        child: Stack(children: [
          extraSpaceToCoverBottom,
          makeBitesStyledCurve,
          Positioned(
              top: 70,
              child: SizedBox(
                width: UiUtils.getScreenWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      key: widget.calenderKey,
                      iconSize: 18,
                      icon: ImageIcon(
                        const AssetImage(AssetsHelper
                            .calendarIcon), // Replace with your asset path
                        color: getTintColor(0),
                      ),
                      onPressed: () => _onItemTapped(0),
                    ),
                    IconButton(
                      key: widget.clockKey,
                      iconSize: 18,
                      icon: ImageIcon(
                        const AssetImage(AssetsHelper
                            .clockIcon), // Replace with your asset path
                        color: getTintColor(1),
                      ),
                      onPressed: () => _onItemTapped(1),
                    ),
                    const SizedBox(width: 48), // Space for the floating button
                    IconButton(
                      key: widget.notificationKey,
                      iconSize: 18,
                      icon: ImageIcon(
                        const AssetImage(AssetsHelper
                            .bellIcon), // Replace with your asset path
                        color: getTintColor(2),
                      ),
                      onPressed: () => _onItemTapped(2),
                    ),
                    IconButton(
                      key: widget.profileKey,
                      iconSize: 18,
                      icon: ImageIcon(
                        const AssetImage(AssetsHelper
                            .profileIcon), // Replace with your asset path
                        color: getTintColor(3),
                      ),
                      onPressed: () => _onItemTapped(3),
                    ),
                  ],
                ),
              )),
          addFabButton
        ]));
  }
}

class CurvedStylePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height * 0.68); // Start higher for more depth

    // Adjust the control points to minimize center distance
    path.cubicTo(
      size.width * 0.49,
      size.height * 0.01, // First control point (left side)
      size.width * 0.35,
      size.height * 1.09, // Second control point (bottom-left dip)
      size.width * 0.5, size.height + 0, // End point (bottom of the wave)
    );

    path.cubicTo(
      size.width * 0.65,
      size.height * 1.1, // First control point (bottom-right dip)
      size.width * 0.49,
      size.height * 0.01, // Second control point (right side)
      size.width, size.height * 0.68, // End point (right side top)
    );

    path.lineTo(size.width, size.height); // Move to bottom-right
    path.lineTo(0, size.height); // Move to bottom-left
    path.close(); // Close the path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
