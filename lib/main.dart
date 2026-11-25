import 'package:flutter/material.dart';

void main() => runApp(const ProfileApp());

const ink = Color(0xFF0D0B12);
const panel = Color(0xFF17141E);
const violet = Color(0xFF9A70FF);
const muted = Color(0xFFAAA5B5);

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Profil Putra',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ink,
      colorScheme: ColorScheme.fromSeed(
        seedColor: violet,
        brightness: Brightness.dark,
        surface: panel,
      ),
      fontFamily: 'Roboto',
      useMaterial3: true,
    ),
    home: const ProfileShell(),
  );
}

class ProfileShell extends StatefulWidget {
  const ProfileShell({super.key});

  @override
  State<ProfileShell> createState() => _ProfileShellState();
}

class _ProfileShellState extends State<ProfileShell> {
  int selected = 0;
  final pages = const [HomePage(), SkillsPage(), ContactPage()];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      bottom: false,
      child: IndexedStack(index: selected, children: pages),
    ),
    bottomNavigationBar: NavigationBar(
      height: 72,
      backgroundColor: const Color(0xFF121017),
      indicatorColor: violet.withValues(alpha: .18),
      selectedIndex: selected,
      onDestinationSelected: (value) => setState(() => selected = value),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.auto_awesome_outlined),
          selectedIcon: Icon(Icons.auto_awesome),
          label: 'Skills',
        ),
        NavigationDestination(
          icon: Icon(Icons.mail_outline_rounded),
          selectedIcon: Icon(Icons.mail_rounded),
          label: 'Contact',
        ),
      ],
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => ProfilePageFrame(
    eyebrow: 'PERSONAL PROFILE',
    title: 'Home',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 14),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(22, 25, 22, 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF282036), Color(0xFF17141E), Color(0xFF121017)],
            ),
            border: Border.all(color: Colors.white.withValues(alpha: .08)),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [violet, Color(0xFFD1B8FF)],
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 53,
                      backgroundColor: panel,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=400&fit=crop&crop=faces',
                      ),
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: const Color(0xFF45D69A),
                      shape: BoxShape.circle,
                      border: Border.all(color: panel, width: 4),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Text(
                'Putra',
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 7),
              const Text(
                'Mahasiswa • Calon Developer',
                style: TextStyle(color: muted, fontSize: 14),
              ),
              const SizedBox(height: 20),
              const Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  _Chip(label: 'INFORMATIKA'),
                  _Chip(label: 'CREATIVE MIND'),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(color: Color(0xFF34303C), height: 1),
              const SizedBox(height: 18),
              const Row(
                children: [
                  Expanded(
                    child: _Stat(value: '01', label: 'NBI'),
                  ),
                  _StatDivider(),
                  Expanded(
                    child: _Stat(value: 'IT', label: 'STUDY'),
                  ),
                  _StatDivider(),
                  Expanded(
                    child: _Stat(value: '∞', label: 'IDEAS'),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        const SectionHeading(
          title: 'Tentang Saya',
          subtitle: 'Sedikit cerita tentang saya',
        ),
        const SizedBox(height: 12),
        const Text(
          'Saya adalah mahasiswa yang tertarik pada teknologi dan desain. Senang mengubah ide menjadi pengalaman digital yang sederhana, bermanfaat, dan menyenangkan.',
          style: TextStyle(color: muted, height: 1.65, fontSize: 14),
        ),
        const SizedBox(height: 23),
        const SectionHeading(
          title: 'Di luar layar',
          subtitle: 'Hal yang saya nikmati',
        ),
        const SizedBox(height: 13),
        const Wrap(
          spacing: 9,
          runSpacing: 9,
          children: [
            _Hobby(icon: Icons.headphones_rounded, label: 'Musik'),
            _Hobby(icon: Icons.camera_alt_outlined, label: 'Fotografi'),
            _Hobby(icon: Icons.sports_esports_outlined, label: 'Gaming'),
            _Hobby(icon: Icons.travel_explore_rounded, label: 'Eksplorasi'),
          ],
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) => const ProfilePageFrame(
    eyebrow: 'WHAT I DO',
    title: 'Skills',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 14),
        const Text(
          'Belajar, bereksperimen, dan terus berkembang.',
          style: TextStyle(color: muted, fontSize: 15, height: 1.5),
        ),
        const SizedBox(height: 25),
        const SectionHeading(
          title: 'Keahlian',
          subtitle: 'Teknologi yang sedang saya dalami',
        ),
        const SizedBox(height: 13),
        const _SkillCard(
          icon: Icons.phone_android_rounded,
          name: 'Flutter & Dart',
          level: 'INTERMEDIATE',
          progress: .72,
        ),
        const _SkillCard(
          icon: Icons.web_rounded,
          name: 'UI / UX Design',
          level: 'INTERMEDIATE',
          progress: .66,
        ),
        const _SkillCard(
          icon: Icons.data_object_rounded,
          name: 'Web Development',
          level: 'FUNDAMENTAL',
          progress: .48,
        ),
        const _SkillCard(
          icon: Icons.palette_outlined,
          name: 'Visual Design',
          level: 'INTERMEDIATE',
          progress: .62,
        ),
        const SizedBox(height: 24),
        const SectionHeading(
          title: 'Pendidikan',
          subtitle: 'Perjalanan akademik saya',
        ),
        const SizedBox(height: 13),
        _InfoCard(
          icon: Icons.school_outlined,
          title: 'Universitas',
          detail: 'Universitas Anda',
        ),
        _InfoCard(
          icon: Icons.menu_book_rounded,
          title: 'Program Studi',
          detail: 'Program studi Anda • NBI Anda',
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) => ProfilePageFrame(
    eyebrow: 'LET’S CONNECT',
    title: 'Contact',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 14),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [violet.withValues(alpha: .23), const Color(0xFF211B2D)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: violet.withValues(alpha: .22)),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.waving_hand_rounded,
                color: Color(0xFFD2BFFF),
                size: 28,
              ),
              SizedBox(height: 16),
              Text(
                'Punya ide menarik?',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 8),
              Text(
                'Saya terbuka untuk ngobrol, kolaborasi, dan kesempatan baru.',
                style: TextStyle(color: muted, height: 1.55),
              ),
            ],
          ),
        ),
        const SizedBox(height: 27),
        const SectionHeading(
          title: 'Temukan saya',
          subtitle: 'Mari tetap terhubung',
        ),
        const SizedBox(height: 13),
        const _ContactTile(
          icon: Icons.mail_outline_rounded,
          title: 'Email',
          value: 'halo@contoh.com',
        ),
        const _ContactTile(
          icon: Icons.camera_alt_outlined,
          title: 'Instagram',
          value: '@username',
        ),
        const _ContactTile(
          icon: Icons.code_rounded,
          title: 'GitHub',
          value: 'github.com/username',
        ),
        const _ContactTile(
          icon: Icons.location_on_outlined,
          title: 'Lokasi',
          value: 'Surabaya, Indonesia',
        ),
        const SizedBox(height: 24),
        Center(
          child: Text(
            'DIBUAT DENGAN ✦ DI SURABAYA',
            style: TextStyle(
              color: muted.withValues(alpha: .65),
              fontSize: 10,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}

class ProfilePageFrame extends StatelessWidget {
  const ProfilePageFrame({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.child,
  });
  final String eyebrow;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final maxWidth = constraints.maxWidth > 620
          ? 620.0
          : constraints.maxWidth;
      return Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: maxWidth,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(22, 20, 22, 0),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eyebrow,
                        style: const TextStyle(
                          color: violet,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.1,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -.7,
                        ),
                      ),
                      child,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 4),
      Text(subtitle, style: const TextStyle(color: muted, fontSize: 12)),
    ],
  );
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label});
  final String label;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
    decoration: BoxDecoration(
      color: violet.withValues(alpha: .13),
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: violet.withValues(alpha: .2)),
    ),
    child: Text(
      label,
      style: const TextStyle(
        color: Color(0xFFD3C4FF),
        fontSize: 9,
        letterSpacing: .8,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label});
  final String value;
  final String label;
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 17,
          color: Color(0xFFD6C8FF),
        ),
      ),
      const SizedBox(height: 5),
      Text(
        label,
        style: const TextStyle(color: muted, fontSize: 9, letterSpacing: 1),
      ),
    ],
  );
}

class _StatDivider extends StatelessWidget {
  const _StatDivider();
  @override
  Widget build(BuildContext context) =>
      Container(height: 30, width: 1, color: const Color(0xFF34303C));
}

class _Hobby extends StatelessWidget {
  const _Hobby({required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
    decoration: BoxDecoration(
      color: panel,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: Colors.white.withValues(alpha: .06)),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: violet),
        const SizedBox(width: 7),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFFE7E4EC)),
        ),
      ],
    ),
  );
}

class _SkillCard extends StatelessWidget {
  const _SkillCard({
    required this.icon,
    required this.name,
    required this.level,
    required this.progress,
  });
  final IconData icon;
  final String name;
  final String level;
  final double progress;
  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: panel,
      borderRadius: BorderRadius.circular(17),
      border: Border.all(color: Colors.white.withValues(alpha: .055)),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: violet.withValues(alpha: .13),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: violet, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              level,
              style: const TextStyle(
                color: muted,
                fontSize: 8,
                letterSpacing: .7,
              ),
            ),
          ],
        ),
        const SizedBox(height: 13),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 4,
            backgroundColor: const Color(0xFF302B38),
            color: violet,
          ),
        ),
      ],
    ),
  );
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.title,
    required this.detail,
  });
  final IconData icon;
  final String title;
  final String detail;
  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: panel,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        Icon(icon, color: violet),
        const SizedBox(width: 13),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: muted, fontSize: 11)),
              const SizedBox(height: 4),
              Text(
                detail,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    required this.icon,
    required this.title,
    required this.value,
  });
  final IconData icon;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
    decoration: BoxDecoration(
      color: panel,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white.withValues(alpha: .05)),
    ),
    child: Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: violet.withValues(alpha: .12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: violet, size: 19),
        ),
        const SizedBox(width: 13),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: muted, fontSize: 11)),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const Icon(Icons.arrow_outward_rounded, color: muted, size: 16),
      ],
    ),
  );
}
