import 'package:flutter/material.dart';
import 'package:shoe_app/views/detail_screen.dart';

// 🚀 WELCOME TO THE MOST ANIMATED SHOE DISCOVERY EXPERIENCE! 🚀
// Buckle up for some smooth animations and delightful micro-interactions!
class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with TickerProviderStateMixin {
  // 🎭 Animation master class!

  // 📊 State variables (the brain of our animated beast!)
  int selectedCategoryIndex = 0;
  int selectedBottomNavIndex = 0;
  bool _isSearchFocused = false;

  // 🎬 Animation controllers (our animation directors!)
  late AnimationController _headerAnimationController;
  late AnimationController _productAnimationController;
  late AnimationController _navAnimationController;
  late AnimationController _searchAnimationController;
  late AnimationController _categoryAnimationController;

  // ✨ Animation objects (the magic makers!)
  late Animation<double> _headerSlideAnimation;
  late Animation<double> _headerFadeAnimation;
  late Animation<double> _searchScaleAnimation;
  late Animation<double> _searchGlowAnimation;
  late Animation<Offset> _productSlideAnimation;
  late Animation<double> _productFadeAnimation;
  late Animation<double> _navBounceAnimation;
  late Animation<double> _categorySlideAnimation;

  // 📝 Data arrays (our product catalog!)
  final List<String> categories = ['New Release', 'Men', 'Women', 'Kids'];

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Nike Air Zoom S 23',
      'category': "Men's Shoes",
      'price': 1499.99,
      'image': 'assets/images/aiir.png',
      'backgroundColor': const Color(0xFF2C2C2C),
    },
    {
      'name': 'Nike Air Max',
      'category': "Men's Shoes",
      'price': 2999.99,
      'image': 'assets/images/nikke.png',
      'backgroundColor': const Color(0xFFF5F5F5),
    },
  ];

  @override
  void initState() {
    super.initState();
    print('🎉 DISCOVER SCREEN INITIALIZING - GET READY FOR SOME MAGIC!');
    _initializeAnimations();
    _startEntryAnimations();
  }

  // 🎭 Initialize all our animation controllers (Setting up the stage!)
  void _initializeAnimations() {
    print('🎬 Setting up animation controllers...');

    // Header animation (dramatic entrance!)
    _headerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Product animation (smooth product reveals!)
    _productAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Navigation animation (bouncy nav interactions!)
    _navAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    // Search animation (focused search experience!)
    _searchAnimationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    // Category animation (smooth category transitions!)
    _categoryAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // 🎨 Create beautiful animation curves!
    _headerSlideAnimation = Tween<double>(begin: -100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _headerAnimationController,
        curve: Curves.elasticOut, // Bouncy entrance!
      ),
    );

    _headerFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _headerAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _searchScaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: _searchAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    _searchGlowAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _searchAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _productSlideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _productAnimationController,
            curve: Curves.fastOutSlowIn,
          ),
        );

    _productFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _productAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _navBounceAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _navAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    _categorySlideAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _categoryAnimationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    print('✅ All animations locked and loaded!');
  }

  // 🚀 Start the grand entrance animations!
  void _startEntryAnimations() async {
    print('🎊 SHOWTIME! Starting entry animations...');

    // Stagger animations for a dramatic effect!
    _headerAnimationController.forward();

    await Future.delayed(const Duration(milliseconds: 300));
    _categoryAnimationController.forward();

    await Future.delayed(const Duration(milliseconds: 200));
    _productAnimationController.forward();

    print('🌟 All animations launched successfully!');
  }

  // 🎯 Handle search focus with delightful animation
  void _handleSearchFocus(bool focused) {
    setState(() {
      _isSearchFocused = focused;
    });

    if (focused) {
      print('🔍 Search activated - Time to find those perfect kicks!');
      _searchAnimationController.forward();
    } else {
      print('😴 Search deactivated - Back to browsing mode');
      _searchAnimationController.reverse();
    }
  }

  // 🎪 Handle category selection with smooth animation
  void _handleCategorySelection(int index) {
    print(
      '🏷️ Category "${categories[index]}" selected - Loading fresh kicks!',
    );
    setState(() {
      selectedCategoryIndex = index;
    });

    // Add a subtle pulse animation to the selected category
    _categoryAnimationController.reset();
    _categoryAnimationController.forward();
  }

  // 🎵 Handle navigation with bouncy feedback
  void _handleNavigation(int index) {
    print('🧭 Navigation item $index selected - Bouncing to new section!');
    setState(() {
      selectedBottomNavIndex = index;
    });

    // Trigger bounce animation
    _navAnimationController.forward().then((_) {
      _navAnimationController.reverse();
    });
  }

  @override
  void dispose() {
    print('👋 Disposing animation controllers - Thanks for the smooth ride!');
    _headerAnimationController.dispose();
    _productAnimationController.dispose();
    _navAnimationController.dispose();
    _searchAnimationController.dispose();
    _categoryAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('🏗️ Building the most animated shoe discovery screen ever!');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 🎭 ANIMATED HEADER SECTION (The grand entrance!)
            AnimatedBuilder(
              animation: _headerAnimationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _headerSlideAnimation.value),
                  child: Opacity(
                    opacity: _headerFadeAnimation.value,
                    child: _buildHeaderSection(),
                  ),
                );
              },
            ),

            // 🎪 ANIMATED PRODUCTS LIST (The main attraction!)
            Expanded(
              child: AnimatedBuilder(
                animation: _productAnimationController,
                builder: (context, child) {
                  return SlideTransition(
                    position: _productSlideAnimation,
                    child: FadeTransition(
                      opacity: _productFadeAnimation,
                      child: _buildProductsList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // 🎵 ANIMATED BOTTOM NAVIGATION (The rhythm section!)
      bottomNavigationBar: _buildAnimatedBottomNav(),
    );
  }

  // 🎭 Build the spectacular header section
  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🎪 Animated title and menu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Animated title with letter spacing magic!
              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 1500),
                tween: Tween(begin: 0.0, end: 1.2),
                builder: (context, letterSpacing, child) {
                  return Text(
                    'DISCOVER',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      letterSpacing: letterSpacing,
                    ),
                  );
                },
              ),

              // Animated menu button with rotation!
              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 800),
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.more_horiz, size: 24),
                    ),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 24),

          // 🔍 MAGICAL SEARCH BAR (With glow effects!)
          AnimatedBuilder(
            animation: _searchAnimationController,
            builder: (context, child) {
              return Transform.scale(
                scale: _searchScaleAnimation.value,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: _isSearchFocused
                          ? Colors.blue.withOpacity(_searchGlowAnimation.value)
                          : Colors.grey[200]!,
                      width: _isSearchFocused ? 2 : 1,
                    ),
                    boxShadow: _isSearchFocused
                        ? [
                            BoxShadow(
                              color: Colors.blue.withOpacity(
                                0.3 * _searchGlowAnimation.value,
                              ),
                              blurRadius: 20,
                              offset: const Offset(0, 0),
                            ),
                          ]
                        : null,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            onTap: () => _handleSearchFocus(true),
                            onEditingComplete: () => _handleSearchFocus(false),
                            decoration: const InputDecoration(
                              hintText: 'Search for your dream kicks...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.search,
                          color: _isSearchFocused ? Colors.blue : Colors.grey,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 24),

          // 🏷️ ANIMATED CATEGORY PILLS (Smooth transitions!)
          AnimatedBuilder(
            animation: _categoryAnimationController,
            builder: (context, child) {
              return SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedCategoryIndex == index;

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastOutSlowIn,
                      margin: const EdgeInsets.only(right: 12),
                      transform: Matrix4.identity()
                        ..scale(isSelected ? 1.05 : 1.0),
                      child: GestureDetector(
                        onTap: () => _handleCategorySelection(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.black
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey[600],
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // 👟 Build the animated products list (Where the magic happens!)
  Widget _buildProductsList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        // Stagger the animation delay for each product
        return TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 600 + (index * 200)),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, animationValue, child) {
            return Transform.translate(
              offset: Offset(0, 50 * (1 - animationValue)),
              child: Opacity(
                opacity: animationValue,
                child: _buildProductCard(product, index),
              ),
            );
          },
        );
      },
    );
  }

  // 🎨 Build individual product card with hover animations
  Widget _buildProductCard(Map<String, dynamic> product, int index) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 200),
      tween: Tween(begin: 1.0, end: 1.0),
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: InkWell(
            onTap: () {
              print(
                '🚀 Navigating to product: ${product['name']} - Buckle up!',
              );
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      DetailScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                          position:
                              Tween<Offset>(
                                begin: const Offset(1.0, 0.0),
                                end: Offset.zero,
                              ).animate(
                                CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.fastOutSlowIn,
                                ),
                              ),
                          child: child,
                        );
                      },
                ),
              );
            },
            onHover: (isHovering) {
              // Add subtle hover effect (if on web/desktop)
              print(
                isHovering
                    ? '👆 Hovering over ${product['name']}'
                    : '👋 Left ${product['name']}',
              );
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 280,
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: product['backgroundColor'],
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Product content with animations
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Animated price with currency formatting
                        TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 800),
                          tween: Tween(begin: 0.0, end: product['price']),
                          builder: (context, animatedPrice, child) {
                            return Text(
                              'R ${animatedPrice.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color:
                                    product['backgroundColor'] ==
                                        const Color(0xFF2C2C2C)
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: 'Roboto',
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 12),

                        // Animated product image with rotation!
                        Expanded(
                          child: Center(
                            child: TweenAnimationBuilder<double>(
                              duration: const Duration(milliseconds: 1200),
                              tween: Tween(begin: -0.5, end: -0.2),
                              curve: Curves.elasticOut,
                              builder: (context, rotation, child) {
                                return Transform.rotate(
                                  angle: rotation,
                                  child: Container(
                                    width: 220,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(product['image']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Animated product info
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:
                                product['backgroundColor'] ==
                                    const Color(0xFF2C2C2C)
                                ? Colors.white
                                : Colors.black,
                            fontFamily: 'Roboto',
                          ),
                          child: Text(product['name']),
                        ),

                        const SizedBox(height: 4),

                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                product['backgroundColor'] ==
                                    const Color(0xFF2C2C2C)
                                ? Colors.grey[300]
                                : Colors.grey[600],
                            fontFamily: 'Roboto',
                          ),
                          child: Text(product['category']),
                        ),
                      ],
                    ),
                  ),

                  // Animated favorite button with pulse effect!
                  Positioned(
                    top: 20,
                    right: 20,
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 600),
                      tween: Tween(begin: 0.0, end: 1.0),
                      builder: (context, scale, child) {
                        return Transform.scale(
                          scale: scale,
                          child: GestureDetector(
                            onTap: () {
                              print(
                                '💖 Added ${product['name']} to favorites - Love at first sight!',
                              );
                              // Add heart animation here
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color:
                                    product['backgroundColor'] ==
                                        const Color(0xFF2C2C2C)
                                    ? Colors.white
                                    : Colors.black,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.favorite_border,
                                color:
                                    product['backgroundColor'] ==
                                        const Color(0xFF2C2C2C)
                                    ? Colors.black
                                    : Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // 🎵 Build the bouncy bottom navigation
  Widget _buildAnimatedBottomNav() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildAnimatedNavItem(Icons.home_filled, 0),
          _buildAnimatedNavItem(Icons.explore_outlined, 1),
          _buildAnimatedNavItem(Icons.search_outlined, 2),
          _buildAnimatedNavItem(Icons.shopping_bag_outlined, 3),
          _buildAnimatedNavItem(Icons.person_outline, 4),
        ],
      ),
    );
  }

  // 🎪 Build individual animated navigation item
  Widget _buildAnimatedNavItem(IconData icon, int index) {
    bool isSelected = selectedBottomNavIndex == index;

    return AnimatedBuilder(
      animation: _navAnimationController,
      builder: (context, child) {
        double scale = isSelected && _navAnimationController.isAnimating
            ? _navBounceAnimation.value
            : 1.0;

        return GestureDetector(
          onTap: () => _handleNavigation(index),
          child: Transform.scale(
            scale: scale,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(25),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey[600],
                size: 24,
              ),
            ),
          ),
        );
      },
    );
  }
}
