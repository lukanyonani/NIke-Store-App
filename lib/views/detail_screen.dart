// 🧠 Rewritten DetailScreen using o3d package instead of flutter_3d_controller
import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final O3DController o3dController = O3DController();
  bool isModelLoading = true;

  int selectedColorIndex = 1; // 🖤 Black selected by default
  String selectedSize = '9.5';
  String selectedSizeSystem = 'US';

  final List<Color> colors = [
    const Color(0xFFBDBDBD),
    Colors.black,
    const Color(0xFF757575),
    const Color(0xFFE0E0E0),
  ];

  final List<String> sizes = ['8.5', '9', '9.5', '10', '10.5'];
  final List<String> sizeSystems = ['UK', 'US', 'EU'];

  @override
  void initState() {
    super.initState();
    print("📦 Initializing DetailScreen...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // 🔙 Back and Favorite buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconBox(
                    Icons.arrow_back_ios_new,
                    () => Navigator.of(context).pop(),
                  ),
                  _buildIconBox(Icons.favorite_border),
                ],
              ),
            ),

            // 👟 3D Product Viewer
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      const Positioned(
                        top: 20,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Text(
                            '✓',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF757575),
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        top: 50,
                        child: O3D(
                          controller: o3dController,
                          src: 'assets/images/nike.glb',
                          autoPlay: true,
                          autoRotate: true,
                          cameraControls: true,
                          backgroundColor: Colors.transparent,
                          // onLoaded: () {
                          //   print("✅ 3D Model Loaded!");
                          //   setState(() {
                          //     isModelLoading = false;
                          //   });
                          // },
                        ),
                      ),
                      // if (isModelLoading)
                      //   Positioned.fill(
                      //     child: Center(
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: const [
                      //           CircularProgressIndicator(
                      //             strokeWidth: 2,
                      //             color: Colors.black,
                      //           ),
                      //           SizedBox(height: 12),
                      //           Text(
                      //             'Loading 3D Model...',
                      //             style: TextStyle(color: Colors.black54),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      if (!isModelLoading)
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: _buildInfoTag("360° View"),
                        ),
                      if (!isModelLoading)
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Row(
                            children: [
                              _buildActionButton(Icons.refresh, () {
                                print("🔄 Resetting camera");
                                o3dController.resetCameraOrbit();
                              }),
                              const SizedBox(width: 8),
                              _buildActionButton(Icons.play_arrow, () {
                                print("▶️ Playing animations");
                                o3dController.play();
                              }),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 🧾 Product Details
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 30,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Men's Shoes",
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'NIKE AIR MAX',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Color',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: colors
                          .asMap()
                          .entries
                          .map(
                            (entry) => _buildColorDot(entry.key, entry.value),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 24),
                    _buildSizeHeader(),
                    const SizedBox(height: 12),
                    Row(
                      children: sizes
                          .map((size) => _buildSizeOption(size))
                          .toList(),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '\R 2999.99',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print(
                              "🛍️ Added to bag: Size $selectedSize $selectedSizeSystem",
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Added Nike Air Zoom S 23 (Size $selectedSize $selectedSizeSystem) to bag!',
                                ),
                                backgroundColor: Colors.black,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 0,
                          ),
                          child: const Text('Add to Bag'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconBox(IconData icon, [VoidCallback? onTap]) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 20, color: Colors.black54),
      ),
    );
  }

  Widget _buildColorDot(int index, Color color) {
    bool isSelected = selectedColorIndex == index;
    return GestureDetector(
      onTap: () => setState(() => selectedColorIndex = index),
      child: Container(
        width: 36,
        height: 36,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: isSelected
            ? Icon(
                Icons.check,
                size: 20,
                color: color == Colors.black ? Colors.white : Colors.black,
              )
            : null,
      ),
    );
  }

  Widget _buildSizeHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Size',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Row(
          children: sizeSystems.map((system) {
            bool isSelected = selectedSizeSystem == system;
            return GestureDetector(
              onTap: () => setState(() => selectedSizeSystem = system),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                margin: const EdgeInsets.only(left: 8),
                child: Text(
                  system,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: isSelected ? Colors.black : Colors.grey[600],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSizeOption(String size) {
    bool isSelected = selectedSize == size;
    return GestureDetector(
      onTap: () => setState(() => selectedSize = size),
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }

  Widget _buildInfoTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }
}
