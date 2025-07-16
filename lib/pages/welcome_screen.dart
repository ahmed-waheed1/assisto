import 'package:flutter/material.dart';

import '../utils/page_transitions.dart';
import 'profile_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _subtitleController;
  late AnimationController _iconController;
  late AnimationController _buttonController;

  late Animation<double> _titleOpacity;
  late Animation<double> _titleScale;
  late Animation<double> _subtitleOpacity;
  late Animation<Offset> _iconSlide;
  late Animation<double> _iconOpacity;
  late Animation<double> _buttonOpacity;
  late Animation<double> _buttonScale;

  @override
  void initState() {
    super.initState();
    _titleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _subtitleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _iconController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _titleOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _titleController, curve: Curves.easeOut));

    _titleScale = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(parent: _titleController, curve: Curves.elasticOut),
    );

    _subtitleOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _subtitleController, curve: Curves.easeOut),
    );

    _iconSlide = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _iconController, curve: Curves.elasticOut),
        );

    _iconOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _iconController, curve: Curves.easeOut));

    _buttonOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeOut),
    );

    _buttonScale = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.bounceOut),
    );

    _startStaggeredAnimations();
  }

  void _startStaggeredAnimations() async {
    _titleController.forward();
    await Future.delayed(const Duration(milliseconds: 400));
    _subtitleController.forward();
    await Future.delayed(const Duration(milliseconds: 400));
    _iconController.forward();
    await Future.delayed(const Duration(milliseconds: 400));
    _buttonController.forward();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    _iconController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _titleController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _titleOpacity.value,
                    child: Transform.scale(
                      scale: _titleScale.value,
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: theme.brightness == Brightness.dark
                              ? Colors.deepPurple.shade300
                              : Colors.deepPurple,
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              AnimatedBuilder(
                animation: _subtitleController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _subtitleOpacity.value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - _subtitleOpacity.value)),
                      child: Text(
                        'Your personal assistant app',
                        style: TextStyle(
                          fontSize: 16,
                          color: theme.brightness == Brightness.dark
                              ? Colors.grey.shade400
                              : Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 40),

              AnimatedBuilder(
                animation: _iconController,
                builder: (context, child) {
                  return SlideTransition(
                    position: _iconSlide,
                    child: FadeTransition(
                      opacity: _iconOpacity,
                      child: Transform.rotate(
                        angle: (1 - _iconOpacity.value) * 0.5,
                        child: Icon(
                          Icons.assistant,
                          size: 60,
                          color: theme.brightness == Brightness.dark
                              ? Colors.deepPurple.shade300
                              : Colors.deepPurple,
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 60),

              AnimatedBuilder(
                animation: _buttonController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _buttonOpacity.value,
                    child: Transform.scale(
                      scale: _buttonScale.value,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            PageTransitions.slideAndFade(const ProfileScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.brightness == Brightness.dark
                              ? Colors.deepPurple.shade400
                              : Colors.deepPurple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 8,
                          shadowColor: Colors.deepPurple.withOpacity(0.4),
                        ),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(fontSize: 18),
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
