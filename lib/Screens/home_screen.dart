import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_recipe_app/SharedComponents/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          onActionPressed: () {
            // TODO: Implement action when the icon is pressed
          },
          searchController: TextEditingController(),
          logoAsset: 'assets/logo.png', // Replace with your logo asset path
          actionIcon: Icons.settings_rounded,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: [
              Text(
                "Quick Actions",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              // customrow
              Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final double cardSize =
                        constraints.maxWidth / 3 - 12; // 3 cards, 12px spacing
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        QuickActionsCard(
                          bgColor: Colors.blue[100]!,
                          lblColor: Colors.blue[700]!,
                          lbl: "What's in my fridge?",
                          icon: Icons.dashboard_customize_rounded,
                          size: cardSize,
                        ),
                        QuickActionsCard(
                          bgColor: Colors.purple[100]!,
                          lblColor: Colors.purple[700]!,
                          lbl: "Find a Recipes",
                          icon: Icons.menu_book_rounded,
                          size: cardSize,
                        ),
                        QuickActionsCard(
                          bgColor: Colors.yellow[100]!,
                          lblColor: Colors.yellow[700]!,
                          lbl: "My Favorites",
                          icon: Icons.favorite_outline_rounded,
                          size: cardSize,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuickActionsCard extends StatefulWidget {
  const QuickActionsCard({
    super.key,
    required this.lbl,
    required this.icon,
    required this.lblColor,
    required this.bgColor,
    this.onTap,
    this.size = 100,
  });

  final String lbl;
  final IconData icon;
  final VoidCallback? onTap;
  final double size;
  final Color lblColor;
  final Color bgColor;

  @override
  State<QuickActionsCard> createState() => _QuickActionsCardState();
}

class _QuickActionsCardState extends State<QuickActionsCard> {
  bool _zoomed = false;

  void _handleTap() async {
    setState(() => _zoomed = true);
    await Future.delayed(const Duration(milliseconds: 150));
    setState(() => _zoomed = false);
    if (widget.onTap != null) widget.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: widget.size,
      child: GestureDetector(
        onTap: _handleTap,
        child: Card(
          color: widget.bgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(widget.icon, size: widget.size * 0.5, color: widget.lblColor),
              Text(
                widget.lbl,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: widget.lblColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ).animate(target: _zoomed ? 1 : 0)
         .scaleXY(begin: 1.0, end: 1.05, duration: 150.ms, curve: Curves.easeInOut),
      ),
    );
  }
}
