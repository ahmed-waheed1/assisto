import 'package:assisto/pages/app_drawer.dart';
import 'package:assisto/pages/widgets/contact_info_row.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController _bannerController;
  late AnimationController _profileImageController;
  late AnimationController _userInfoController;
  late AnimationController _contactCardsController;

  late Animation<double> _bannerOpacity;
  late Animation<Offset> _bannerSlide;
  late Animation<double> _profileImageScale;
  late Animation<double> _profileImageOpacity;
  late Animation<double> _userInfoOpacity;
  late Animation<Offset> _userInfoSlide;
  late Animation<double> _contactCardsOpacity;
  late Animation<Offset> _contactCardsSlide;

  @override
  void initState() {
    super.initState();

    _bannerController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _profileImageController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _userInfoController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _contactCardsController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    _bannerOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _bannerController, curve: Curves.easeOut),
    );

    _bannerSlide = Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _bannerController,
            curve: Curves.easeOutCubic,
          ),
        );

    _profileImageScale = Tween<double>(begin: 0.3, end: 1).animate(
      CurvedAnimation(
        parent: _profileImageController,
        curve: Curves.elasticOut,
      ),
    );

    _profileImageOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _profileImageController, curve: Curves.easeOut),
    );

    _userInfoOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _userInfoController, curve: Curves.easeOut),
    );

    _userInfoSlide =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _userInfoController,
            curve: Curves.easeOutCubic,
          ),
        );

    _contactCardsOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _contactCardsController, curve: Curves.easeOut),
    );

    _contactCardsSlide =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _contactCardsController,
            curve: Curves.easeOutCubic,
          ),
        );
    _startStaggeredAnimations();
  }

  void _startStaggeredAnimations() async {
    _bannerController.forward();

    await Future.delayed(const Duration(milliseconds: 300));
    _profileImageController.forward();

    await Future.delayed(const Duration(milliseconds: 300));
    _userInfoController.forward();

    await Future.delayed(const Duration(milliseconds: 300));
    _contactCardsController.forward();
  }

  @override
  void dispose() {
    _bannerController.dispose();
    _profileImageController.dispose();
    _userInfoController.dispose();
    _contactCardsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 280,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    AnimatedBuilder(
                      animation: _bannerController,
                      builder: (context, child) {
                        return SlideTransition(
                          position: _bannerSlide,
                          child: FadeTransition(
                            opacity: _bannerOpacity,
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.deepPurple.shade400,
                                    Colors.deepPurple.shade700,
                                    Colors.indigo.shade800,
                                  ],
                                  stops: const [0.0, 0.7, 1.0],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.deepPurple.withOpacity(0.3),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    Positioned(
                      top: 60,
                      left: 20,
                      right: 20,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(0.4),
                                Colors.black.withOpacity(0.6),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 12,
                                spreadRadius: 2,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.person_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'My Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 6,
                                      color: Colors.black87,
                                    ),
                                    Shadow(
                                      offset: Offset(-1, -1),
                                      blurRadius: 3,
                                      color: Colors.black45,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.center,
                        child: AnimatedBuilder(
                          animation: _profileImageController,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _profileImageScale.value,
                              child: Opacity(
                                opacity: _profileImageOpacity.value,
                                child: Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 5,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 15,
                                        spreadRadius: 3,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: const CircleAvatar(
                                    radius: 60,
                                    backgroundImage: NetworkImage(
                                      'https://randomuser.me/api/portraits/lego/7.jpg',
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () =>
                            _scaffoldKey.currentState?.openDrawer(),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Row(
                                children: [
                                  Icon(Icons.edit, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text('Edit profile feature coming soon!'),
                                ],
                              ),
                              backgroundColor: Colors.deepPurple,
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.9),
                                Colors.white.withOpacity(0.7),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.8),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                spreadRadius: 1,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.edit_rounded,
                                color: Colors.deepPurple.shade700,
                                size: 18,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Edit',
                                style: TextStyle(
                                  color: Colors.deepPurple.shade700,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              AnimatedBuilder(
                animation: _userInfoController,
                builder: (context, child) {
                  return SlideTransition(
                    position: _userInfoSlide,
                    child: FadeTransition(
                      opacity: _userInfoOpacity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            const Text(
                              'Ahmed Waheed',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.deepPurple.shade100,
                                    Colors.deepPurple.shade50,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Flutter Developer & Mobile App Designer',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: theme.brightness == Brightness.dark
                                    ? Colors.blue.shade900.withOpacity(0.3)
                                    : Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: theme.brightness == Brightness.dark
                                      ? Colors.blue.shade700
                                      : Colors.blue.shade100,
                                ),
                              ),
                              child: Text(
                                'Passionate Flutter developer from Egypt, creating innovative mobile solutions with beautiful user interfaces and seamless user experiences',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.4,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 28),

              AnimatedBuilder(
                animation: _contactCardsController,
                builder: (context, child) {
                  return SlideTransition(
                    position: _contactCardsSlide,
                    child: FadeTransition(
                      opacity: _contactCardsOpacity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_phone,
                                  color: Colors.deepPurple,
                                  size: 24,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Contact Information',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: theme.brightness == Brightness.dark
                                      ? [
                                          Colors.grey.shade800,
                                          Colors.grey.shade900,
                                        ]
                                      : [Colors.white, Colors.grey.shade50],
                                ),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: theme.brightness == Brightness.dark
                                      ? Colors.grey.shade600
                                      : Colors.grey.shade200,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        (theme.brightness == Brightness.dark
                                                ? Colors.black
                                                : Colors.grey)
                                            .withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  ContactInfoRow(
                                    icon: Icons.email_rounded,
                                    text: 'ahm761171@gmail.com',
                                    label: 'Email',
                                  ),
                                  const SizedBox(height: 20),
                                  ContactInfoRow(
                                    icon: Icons.phone_android_rounded,
                                    text: '+20 1148234944',
                                    label: 'Phone',
                                  ),
                                  const SizedBox(height: 20),
                                  ContactInfoRow(
                                    icon: Icons.location_city_rounded,
                                    text: 'Zagazig, Egypt',
                                    label: 'Location',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: const Row(
                                            children: [
                                              Icon(
                                                Icons.mark_email_read,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                'Email copied to clipboard!',
                                              ),
                                            ],
                                          ),
                                          backgroundColor: Colors.green,
                                          duration: const Duration(seconds: 3),
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepPurple,
                                      foregroundColor: Colors.white,
                                      minimumSize: const Size(0, 56),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      elevation: 6,
                                      shadowColor: Colors.deepPurple
                                          .withOpacity(0.4),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.email_rounded, size: 20),
                                        SizedBox(width: 8),
                                        Text(
                                          'Email Me',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: const Row(
                                            children: [
                                              Icon(
                                                Icons.phone,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 8),
                                              Text('Phone number copied!'),
                                            ],
                                          ),
                                          backgroundColor: Colors.blue,
                                          duration: const Duration(seconds: 3),
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                      minimumSize: const Size(0, 56),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      elevation: 6,
                                      shadowColor: Colors.blue.withOpacity(0.4),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.phone_rounded, size: 20),
                                        SizedBox(width: 8),
                                        Text(
                                          'Call Me',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
