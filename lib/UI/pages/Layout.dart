import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar_pro/curved_navigation_bar_pro.dart';
import 'Home.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _index = 1;
  final PageController _pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      Center(
        child: Text(
          '🔍 Storico Esami', 
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold, 
            color: Theme.of(context).colorScheme.onSurface, 
          ),
        ),
      ),
      const Home(), // Indice 1
      Center(
        child: Text(
          '⚙️ Impostazioni', 
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold, 
            color: Theme.of(context).colorScheme.onSurface, 
          ),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, 
      extendBody: true, 
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(), 
        onPageChanged: (index) {
          setState(() {
            _index = index; 
          });
        },
        children: bottomBarPages,
      ),
      bottomNavigationBar: CurvedNavigationBarPro(
        currentIndex: _index, 
        navbarStyle: CNBPStyles.deepSpaceDark, 
        backgroundColor: Colors.transparent, 
        
        inactiveColor: Colors.white,

        elevation: 22, 
        shadowColor: Theme.of(context).brightness == Brightness.dark 
            ? const Color(0xFF00E5FF).withValues(alpha: 0.2) 
            : Colors.black38,                               

        items: const [
          CurvedNavigationItemPro(
            inactiveIcon: Icons.list_alt_rounded,
            activeIcon: Icons.list_alt_rounded,
            label: 'Esami',
          ),
          CurvedNavigationItemPro(
            inactiveIcon: CupertinoIcons.house,
            activeIcon: CupertinoIcons.house_fill,
            label: 'Home',
          ),
          CurvedNavigationItemPro(
            inactiveIcon: Icons.settings_outlined,
            activeIcon: Icons.settings,
            label: 'Settings',
          ),
        ],
        onTap: (i) {
          setState(() {
            _index = i;
          }); 
          _pageController.animateToPage(
            i,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}