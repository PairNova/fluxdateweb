import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/constants.dart';
import 'widgets/widgets.dart';

void main() {
  usePathUrlStrategy();
  runApp(const FluxDateApp());
}

/// Main FluxDate landing page application
class FluxDateApp extends StatelessWidget {
  const FluxDateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FluxDate - Rastlantıdan Bilinçli Seçime',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.interTextTheme(),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/privacy-policy': (context) => const PrivacyPolicyPage(),
      },
    );
  }
}

/// Landing page with all sections
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: const Column(
              children: [
                NavBar(),
                HeroSection(),
                ProblemSection(),
                SolutionSection(),
                FeaturesSection(),
                HowItWorksSection(),
                CTASection(),
                FooterSection(),
              ],
            ),
          ),
          const FloatingSocialBar(),
        ],
      ),
    );
  }
}
