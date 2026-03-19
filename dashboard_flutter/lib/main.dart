import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard Responsivo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  int getCrossAxisCount(double width) {
    if (width < 600) return 1;
    if (width < 900) return 2;
    return 4;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final List<Map<String, dynamic>> cards = [
      {
        'icon': Icons.attach_money,
        'title': 'Faturamento',
        'value': 'R\$ 6.000',
        'color': Colors.green,
      },
      {
        'icon': Icons.shopping_cart,
        'title': 'Vendas',
        'value': '120',
        'color': Colors.blue,
      },
      {
        'icon': Icons.people,
        'title': 'Clientes',
        'value': '80',
        'color': Colors.orange,
      },
      {
        'icon': Icons.warning,
        'title': 'Alertas',
        'value': '5',
        'color': Colors.red,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard De Vendas'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Relatórios'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Visão Geral',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cards.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: getCrossAxisCount(width),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.3,
              ),
              itemBuilder: (context, index) {
                final card = cards[index];
                return DashboardCard(
                  icon: card['icon'],
                  title: card['title'],
                  value: card['value'],
                  color: card['color'],
                );
              },
            ),
            const SizedBox(height: 24),
            const SimpleChart(),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => scale = 0.96),
      onTapUp: (_) => setState(() => scale = 1.0),
      onTapCancel: () => setState(() => scale = 1.0),
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 150),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: widget.color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 42, color: widget.color),
              const SizedBox(height: 12),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleChart extends StatelessWidget {
  const SimpleChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<double> values = [50, 80, 30, 70, 90];
    final List<String> labels = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex'];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gráfico de Desempenho',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 180,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(values.length, (index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 28,
                      height: values[index] + 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(labels[index]),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}