import 'package:flutter/material.dart';
import 'package:ministop/src/components/my_button.dart';
import 'package:ministop/src/pages/cart/cart_page.dart';
import 'package:ministop/src/pages/home/home_page.dart';
import 'package:ministop/src/pages/home/product_provider.dart';

class DetailPage extends StatefulWidget {
  final String image;
  final String name;
  final double price;

  const DetailPage(
      {required this.image, required this.name, required this.price, Key? key})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int count = 1;

  final TextStyle myStyle = const TextStyle(
    fontSize: 18,
  );

  Widget _buildImage() {
    return Center(
      child: SizedBox(
        width: 380,
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(13),
            child: Container(
              height: 260,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.image),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameToDescriptionPart() {
    return SizedBox(
      height: 100,
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.name, style: myStyle),
              Text(
                "\$ ${widget.price.toString()}",
                style: const TextStyle(
                    color: Color(0xff9b96d6),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text("Description", style: myStyle),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return SizedBox(
      height: 170,
      child: Wrap(
        children: const <Widget>[
          Text(
            "Discription build",
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget _buildQuentityPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        Text(
          "Quentity",
          style: myStyle,
        ),
        const SizedBox(height: 10),
        Container(
          height: 40,
          width: 130,
          decoration: const BoxDecoration(
            color: Color(0xff746bc9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    if (count > 1) {
                      count--;
                    }
                  });
                },
              ),
              Text(
                count.toString(),
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              GestureDetector(
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtonPart(ProductProvider productProvider) {
    return SizedBox(
      height: 60,
      child: MyButton(
        name: "Add To Cart",
        onPressed: () {
          productProvider.getCheckOutData(
            image: widget.image,
            name: widget.name,
            price: widget.price,
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => const CartPage(),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => const HomePage(),
          ),
        );

        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              const Text("Detail Page", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const HomePage(),
                ),
              );
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            _buildImage(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildNameToDescriptionPart(),
                  _buildDescription(),
                  //_buildSizePart(),
                  //_buildColorPart(),
                  _buildQuentityPart(),
                  const SizedBox(height: 15),
                  //_buildButtonPart(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
