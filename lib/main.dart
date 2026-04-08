import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slicing UI Sister',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> jadwalHariIni = [
      {
        'time': '07:00 - 09:40 WIB',
        'duration': '2 h 40 min',
        'courseName': 'Jaringan Syaraf Tiruan (Kelas B)',
        'room': 'Ruang Kuliah Cdast 2 (Lantai 4)',
        'building': 'Gedung Cdast (ILMU KOMPUTER)',
        'presenceTime': 'Waktu Presensi : -',
        'journal': 'Jurnal : Radial basis function dan Recurrent perceptron',
      },
      {
        'time': '12:30 - 14:10 WIB',
        'duration': '1 h 40 min',
        'courseName': 'Manajemen dan Kewirausahaan (Kelas E)',
        'room': 'Ruang Kuliah A3.2',
        'building': 'Gedung 24A (ILMU KOMPUTER)',
        'presenceTime': 'Waktu Presensi : 12:35:25',
        'journal': 'Jurnal : Translasi model bisnis ke solusi tenknologi, penjelasan model bisnis canvas',
      },
      {
        'time': '14:20 - 16:00 WIB',
        'duration': '1 h 40 min',
        'courseName': 'Riset Operasi (Kelas B)',
        'room': 'Ruang Kuliah A3.3',
        'building': 'Gedung 24A (ILMU KOMPUTER)',
        'presenceTime': 'Waktu Presensi : 15:05:19',
        'journal': 'Jurnal : Metode Transport Stepping Stone',
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildProfileCard(),
              _buildMenuGrid(),
              _buildScheduleHeader('Jadwal', 'Kalender Akademik'),
              _buildCalendarWeek(),
              _buildScheduleHeader('Jadwal Hari Ini', 'Semua Jadwal'),

              ...jadwalHariIni.map((jadwal) {
                return _buildClassCard(
                  time: jadwal['time']!,
                  duration: jadwal['duration']!,
                  courseName: jadwal['courseName']!,
                  room: jadwal['room']!,
                  building: jadwal['building']!,
                  presenceTime: jadwal['presenceTime']!,
                  journal: jadwal['journal']!,
                );
              }).toList(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Akun',
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 24),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.school, color: Colors.blue, size: 30),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF007BFF), Color(0xFF00B4DB)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.account_balance, color: Colors.white, size: 16),
              SizedBox(width: 8),
              Text(
                'Universitas Jember',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white54, thickness: 1, height: 20),
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red.shade900,
                child: const Icon(Icons.person, color: Colors.white, size: 40),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'DARREL FAWWAZ AGATHON',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '242410103077',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.qr_code, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuGrid() {
    final List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.auto_graph, 'label': 'Milestone', 'color': Colors.blue},
      {'icon': Icons.cast_for_education, 'label': 'MMP', 'color': Colors.blue},
      {'icon': Icons.grading, 'label': 'Hasil Studi', 'color': Colors.blue},
      {'icon': Icons.receipt_long, 'label': 'Transkrip', 'color': Colors.blue},
      {
        'icon': Icons.fact_check_outlined,
        'label': 'Kehadiran',
        'color': Colors.blue,
      },
      {
        'icon': Icons.wifi_tethering,
        'label': 'Cek Kuota',
        'color': Colors.blue,
      },
      {
        'icon': Icons.hub_outlined,
        'label': 'Event-Ormawa',
        'color': Colors.blue,
      },
      {'icon': Icons.grid_view, 'label': 'Lainnya', 'color': Colors.grey},
    ];
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: menuItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 8,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: menuItems[index]['color'].withOpacity(0.1),
                ),
                child: Icon(
                  menuItems[index]['icon'],
                  color: menuItems[index]['color'],
                  size: 28,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                menuItems[index]['label'],
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildScheduleHeader(String title, String actionText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            actionText,
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarWeek() {
    final List<Map<String, dynamic>> days = [
      {'day': 'SEN', 'date': '6', 'isActive': false, 'isSunday': false},
      {'day': 'SEL', 'date': '7', 'isActive': false, 'isSunday': false},
      {'day': 'RAB', 'date': '8', 'isActive': true, 'isSunday': false},
      {'day': 'KAM', 'date': '9', 'isActive': false, 'isSunday': false},
      {'day': 'JUM', 'date': '10', 'isActive': false, 'isSunday': false},
      {'day': 'SAB', 'date': '11', 'isActive': false, 'isSunday': false},
      {'day': 'MIN', 'date': '12', 'isActive': false, 'isSunday': true},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'April, 2026',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: days.map((day) {
              return Column(
                children: [
                  Text(
                    day['day'],
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: day['isActive']
                          ? Colors.blue.withOpacity(0.2)
                          : Colors.transparent,
                    ),
                    child: Text(
                      day['date'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: day['isActive']
                            ? Colors.blue
                            : (day['isSunday'] ? Colors.red : Colors.black),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildClassCard({
    required String time,
    required String duration,
    required String courseName,
    required String room,
    required String building,
    required String presenceTime,
    required String journal,
  }) {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.schedule, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    time,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                duration,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('📚', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildClassDetail(Icons.location_on, room, Colors.red),
                    _buildClassDetail(Icons.business, building, Colors.grey),
                    _buildClassDetail(
                      Icons.access_time,
                      presenceTime,
                      Colors.red,
                    ),
                    _buildClassDetail(Icons.description, journal, Colors.grey),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {}, child: const Text('Zoom')),
              TextButton(onPressed: () {}, child: const Text('Materi Kuliah')),
              TextButton(onPressed: () {}, child: const Text('Link MMP')),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade50,
                  foregroundColor: Colors.blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Presensi'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildClassDetail(IconData icon, String text, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: iconColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}