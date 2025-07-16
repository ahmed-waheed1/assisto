# Assisto - Flutter Profile Application

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/Material_Design-0081CB?style=for-the-badge&logo=material-design&logoColor=white" alt="Material Design" />
</p>

A beautiful and modern Flutter application showcasing a developer profile with stunning animations, custom transitions, and dynamic theming. This project demonstrates advanced Flutter development techniques including staggered animations, custom page transitions, and comprehensive theme management.

## 🎥 Demo Video

https://github.com/user-attachments/assets/demo.mp4

> **📹 Watch the full demonstration** showcasing all features including staggered animations, custom page transitions, and dynamic theme switching between light and dark modes.

## ✨ Features

### 🎨 **Beautiful UI/UX**

- **Material Design 3** implementation with modern design principles
- **Glassmorphism effects** and gradient backgrounds
- **Responsive layout** that adapts to different screen sizes
- **Custom icons and illustrations** for enhanced visual appeal

### 🎭 **Advanced Animations**

- **Staggered animations** with carefully timed delays between UI elements
- **Smooth page transitions** using custom PageRouteBuilder implementations
- **Interactive animations** on user interactions
- **Multiple animation types**: fade, slide, scale, and combined effects

### 🌙 **Dynamic Theming**

- **Light/Dark mode** toggle with smooth transitions
- **Theme-aware components** that adapt colors automatically
- **System UI overlay** styling that matches the current theme
- **Persistent theme state** using ChangeNotifier pattern

### 🚀 **Custom Page Transitions**

- **5 different transition types**:
  - Slide from right
  - Slide from bottom
  - Fade transition
  - Scale transition
  - Combined slide and fade
- **Configurable durations** and animation curves
- **Smooth navigation** between screens

### 📱 **Screens & Components**

- **Welcome Screen**: Animated introduction with call-to-action
- **Profile Screen**: Comprehensive developer profile with contact information
- **App Drawer**: Navigation sidebar with theme switching
- **Reusable Widgets**: Modular components for maintainable code

## 🏗️ Project Structure

```
lib/
├── main.dart                    # App entry point with theme management
├── pages/
│   ├── welcome_screen.dart      # Landing page with animations
│   ├── profile_screen.dart      # Main profile display
│   ├── app_drawer.dart         # Navigation drawer
│   └── widgets/
│       ├── theme_switch.dart    # Theme toggle component
│       ├── contact_info_row.dart # Contact information widget
│       └── drawer_item.dart     # Drawer navigation items
└── utils/
    └── page_transitions.dart    # Custom transition animations
```

## 🎯 Key Technical Implementations

### Animation System

- **Multiple AnimationControllers** for independent timing control
- **Staggered timing** with delays between elements (200-600ms)
- **Custom curves** including `easeInOutCubic`, `elasticOut`, and `bounceOut`
- **Smooth opacity and transform animations**

### Theme Management

```dart
class ThemeNotifier extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
```

### Custom Transitions

```dart
// Example: Slide and Fade combination
static Route<T> slideAndFade<T extends Object?>(Widget page) {
  return PageRouteBuilder<T>(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Combined slide and fade effects
    },
  );
}
```

## 🛠️ Installation & Setup

### Prerequisites

- Flutter SDK (≥3.8.1)
- Dart SDK
- Android Studio / VS Code
- Git

### Steps

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd assisto
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the application**

   ```bash
   flutter run
   ```

4. **Build for production**

   ```bash
   # Android
   flutter build apk --release

   # iOS
   flutter build ios --release

   # Web
   flutter build web --release
   ```

## 📱 Supported Platforms

- ✅ **Android** (API 21+)
- ✅ **iOS** (iOS 12.0+)
- ✅ **Web** (Chrome, Firefox, Safari, Edge)
- ✅ **Windows** (Windows 10+)
- ✅ **macOS** (macOS 10.14+)
- ✅ **Linux** (GTK 3.0+)

## 🎨 Design Philosophy

This application follows modern mobile design principles:

- **Minimalist approach** with focus on content
- **Consistent spacing** using 8dp grid system
- **Accessibility-first** design with proper contrast ratios
- **Performance-optimized** animations and transitions
- **Platform-adaptive** components that respect OS conventions

## 🔧 Configuration

### Theme Customization

Modify the theme colors in `main.dart`:

```dart
final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.light,
  ),
);
```

### Animation Timing

Adjust animation durations in respective widget files:

```dart
_controller = AnimationController(
  duration: const Duration(milliseconds: 800), // Customize timing
  vsync: this,
);
```

## 🚀 Performance Optimizations

- **Efficient widget rebuilding** using `const` constructors
- **Animation disposal** to prevent memory leaks
- **Optimized image loading** with proper caching
- **Minimal dependency usage** for smaller bundle size
- **Lazy loading** of heavy components

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Ahmed Waheed** - [@ahmed-waheed1](https://github.com/ahmed-waheed1)

- 📧 **Email**: [Contact Me](mailto:your-email@example.com)
- 💼 **LinkedIn**: [Ahmed Waheed](https://linkedin.com/in/ahmed-waheed1)
- 🐱 **GitHub**: [@ahmed-waheed1](https://github.com/ahmed-waheed1)
- Flutter Developer from Egypt
- Creating innovative mobile solutions with beautiful UIs
- Passionate about animations and user experience

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design team for design guidelines
- Open source community for inspiration and resources

---

<p align="center">
  Built with ❤️ by <a href="https://github.com/ahmed-waheed1">Ahmed Waheed</a> using Flutter & Dart
</p>
