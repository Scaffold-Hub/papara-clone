import 'package:flutter/material.dart';
import 'package:papara/constants/strings.dart';
import '../constants/strings_to_other.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuild(context),
      body: Column(
        children: [
          const SizedBox(height: 10),
          moneyTypeBuild(),
          const MoneyPayOrTakeWidget(),
          sonIslemlerTitle(),
          const SizedBox(height: 10),
          BuildListTileGenerator(),
          cashbackTitle(),
        ],
      ),
    );
  }
}

class MoneyPayOrTakeWidget extends StatelessWidget {
  const MoneyPayOrTakeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: PayOrTakeRow(
              title: 'Çek',
              changIcon: Icons.remove_circle_outline,
              changColor: Colors.red,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                const Text(
                  '573,43',
                  style: TextStyle(
                      fontSize: 45,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Papara Numaran:',
                      style: accountNameStyle,
                    ),
                    Text(
                      '1234567890',
                      style: passwordActionTextStyle2,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: PayOrTakeRow(
              title: 'Yatır',
              changIcon: Icons.add_circle_outline_outlined,
              changColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

Row moneyTypeBuild() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text(
        'Türk Lirası',
        style: accountNameStyle,
      ),
      Icon(
        Icons.flag,
        color: Colors.grey,
      ),
      Text('TL', style: accountNameStyle),
      Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Colors.grey,
      ),
    ],
  );
}

AppBar appBarBuild(BuildContext context) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    leading: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          InkWell(
            child:
                const Icon(Icons.menu_rounded, color: Colors.black, size: 30.0),
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          Container(
            height: 12,
            width: 12,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 1.0),
                child: Text(
                  '4',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    ),
    centerTitle: true,
    title: SizedBox(
      height: 75.0,
      width: 50.0,
      child: Image.network(paparaLogo),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 15, top: 7),
        child: Column(
          children: [
            Container(
              height: 30.0,
              width: 30.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: const Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(height: 5),
            const Text('Hesabım', style: accountNameStyle)
          ],
        ),
      )
    ],
  );
}

class PayOrTakeRow extends StatelessWidget {
  final String title;
  final IconData changIcon;
  final Color changColor;
  PayOrTakeRow(
      {required this.title, required this.changIcon, required this.changColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          changIcon,
          size: 55.0,
          color: changColor,
        ),
        Text(
          title,
          style: accountNameStyle2,
        ),
      ],
    );
  }
}

Padding sonIslemlerTitle() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: const [
        Text('SON İŞLEMLER', style: accountNameStyle3),
        Icon(Icons.arrow_forward_rounded, color: Colors.grey, size: 15),
      ],
    ),
  );
}

class BuildListTileGenerator extends StatelessWidget {
  final List<Map<String, dynamic>> _items = List.generate(
      10,
      (index) =>
          {"id": index, "title": "Item $index", "subtitle": "Subtitle $index"});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 400.0,
        child: ListView(
            children: ListTile.divideTiles(
                color: Colors.grey,
                tiles: _items.map((item) => ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.amber,
                        child: Text(item['id'].toString()),
                      ),
                      title: Text(item['title']),
                      subtitle: Text(item['subtitle']),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {},
                      ),
                    ))).toList()));
  }
}

Padding cashbackTitle() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: const [
        Text('CASHBACK', style: accountNameStyle3),
        Icon(Icons.arrow_forward_rounded, color: Colors.grey, size: 15),
      ],
    ),
  );
}
