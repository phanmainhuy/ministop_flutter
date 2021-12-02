import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ministop/src/components/my_button.dart';
import 'package:ministop/src/models/cart_product_model.dart';
import 'package:ministop/src/pages/cart/cart_provider.dart';
import 'package:ministop/src/resources/app_color.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartProvider>(
        create: (context) => CartProvider(), child: const _CartPage());
  }
}

class _CartPage extends StatelessWidget {
  const _CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng'),
        backgroundColor: AppColor.blue,
      ),
      body: Column(
        children: [
          Expanded(child: _buildCard),
          _buildButton(context),
        ],
      ),
    );
  }

  Widget get _buildCard => Selector<CartProvider, List<CartProductModel>>(
        shouldRebuild: (v1, v2) => true,
        selector: (context, provider) => provider.products,
        builder: (context, products, _) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          child: Card(
            elevation: 4.0,
            child: ListView.separated(
              itemCount: products.length,
              separatorBuilder: (_, index) => const SizedBox(height: 15),
              itemBuilder: (_, index) => ListTile(
                leading: Image.network(
                  products[index].image,
                  width: 70,
                  height: 70,
                ),
                title: Text(products[index].name),
                subtitle: Text(products[index].price?.toString() ?? ''),
                trailing: IconButton(
                  onPressed: () {
                    context.read<CartProvider>().removeCart(index);
                  },
                  icon: const Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  Widget _buildButton(BuildContext context) => Column(
        children: [
          const SizedBox(height: 10),
          _buildTotal,
          const SizedBox(height: 10),
          MyButton(
            name: "Thanh toán",
            onPressed: () => {},
          ),
          const SizedBox(height: 10),
          MyButton(
            name: "Quay về trang chủ",
            onPressed: Navigator.of(context).pop,
          ),
        ],
      );

  Widget get _buildTotal => Selector<CartProvider, double>(
        selector: (context, provider) => provider.totalPrice,
        builder: (context, totalPrice, _) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                totalPrice.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red),
              ),
            ],
          ),
        ),
      );
}
