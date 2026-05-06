import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: 'Workshop Kampus',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      useMaterial3: true,
    ),
    home: const WorkshopCampusScreen(),
    debugShowCheckedModeBanner: false,
  ),
);

class WorkshopCampusScreen extends StatefulWidget {
  const WorkshopCampusScreen({Key? key}) : super(key: key);

  @override
  State<WorkshopCampusScreen> createState() => _WorkshopCampusScreenState();
}

class _WorkshopCampusScreenState extends State<WorkshopCampusScreen> {
  int _selectedIndex = 1;

  final List<Map<String, dynamic>> workshops = [
    {
      'title': 'Workshop Flutter',
      'date': '10 Juni 2026',
      'location': 'Lab Komputer',
      'quota': 30,
      'icon': Icons.computer,
    },
    {
      'title': 'UI/UX Design',
      'date': '12 Juni 2026',
      'location': 'Aula Kampus',
      'quota': 25,
      'icon': Icons.edit,
    },
    {
      'title': 'Mobile Development',
      'date': '15 Juni 2026',
      'location': 'Ruang 101',
      'quota': 20,
      'icon': Icons.smartphone,
    },
    {
      'title': 'Data Science',
      'date': '18 Juni 2026',
      'location': 'Ruang 202',
      'quota': 15,
      'icon': Icons.bar_chart,
    },
    {
      'title': 'Cybersecurity',
      'date': '20 Juni 2026',
      'location': 'Lab Jaringan',
      'quota': 18,
      'icon': Icons.security,
    },
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showRegistrationSnackBar(String workshopTitle) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Berhasil mendaftar: $workshopTitle!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showNotificationSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tidak ada notifikasi baru'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Menu icon tapped'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
        title: const Text('Workshop Kampus'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: _showNotificationSnackBar,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Text(
              'Daftar Workshop',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: workshops.length,
              itemBuilder: (context, index) {
                final workshop = workshops[index];
                return _buildWorkshopCard(workshop);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Workshop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: 'Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget _buildWorkshopCard(Map<String, dynamic> workshop) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // TOP ROW: icon box + info column
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT: rounded square icon container
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: Center(
                    child: Icon(
                      workshop['icon'] as IconData,
                      color: Colors.indigo,
                      size: 32,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // RIGHT: Column with workshop info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        workshop['title'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Date row
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 14,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Tanggal: ${workshop['date']}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),

                      // Location row
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Lokasi: ${workshop['location']}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),

                      // Quota row
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 14,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Kuota: ${workshop['quota']} Peserta',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // BOTTOM: Daftar button aligned to RIGHT
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () =>
                    _showRegistrationSnackBar(workshop['title'] as String),
                child: const Text('Daftar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
