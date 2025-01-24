import 'package:flutter/material.dart';

class FlightBookingPage extends StatefulWidget {
  @override
  _FlightBookingPageState createState() => _FlightBookingPageState();
}

class _FlightBookingPageState extends State<FlightBookingPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Colombo to Tokyo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              stretchModes: const <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              background: Image.asset(
                'assets/images/images.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                color: Colors.white,
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  tabs: const [
                    Tab(text: 'Best'),
                    Tab(text: 'Cheapest'),
                    Tab(text: 'Fastest'),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                FlightListView(flightType: 'Best'),
                FlightListView(flightType: 'Cheapest'),
                FlightListView(flightType: 'Fastest'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FlightListView extends StatelessWidget {
  final String flightType;

  FlightListView({required this.flightType});

  final List<Map<String, String>> flights = [
    {'airline': 'SriLankan Airlines', 'time': '12:00 - 09:10', 'seats': '2 seats left', 'price': 'LKR 7,032.112'},
    {'airline': 'Qatar Airways', 'time': '14:00 - 11:10', 'seats': '5 seats left', 'price': 'LKR 6,500.000'},
    {'airline': 'Emirates', 'time': '16:00 - 13:10', 'seats': '3 seats left', 'price': 'LKR 8,000.000'},
    {'airline': 'Singapore Airlines', 'time': '18:00 - 15:10', 'seats': '4 seats left', 'price': 'LKR 7,500.000'},
    {'airline': 'Cathay Pacific', 'time': '20:00 - 17:10', 'seats': '1 seat left', 'price': 'LKR 7,800.000'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: flights.length,
      itemBuilder: (context, index) {
        return FlightCard(
          airline: flights[index]['airline']!,
          time: flights[index]['time']!,
          seats: flights[index]['seats']!,
          price: flights[index]['price']!,
        );
      },
    );
  }
}

class FlightCard extends StatelessWidget {
  final String airline;
  final String time;
  final String seats;
  final String price;

  FlightCard({
    required this.airline,
    required this.time,
    required this.seats,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image.asset('assets/srilankan_airlines_logo.png', width: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(airline, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(time, style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(seats, style: TextStyle(color: Colors.redAccent)),
                Text(price, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
