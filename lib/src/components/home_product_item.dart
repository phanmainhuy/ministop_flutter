import 'package:flutter/material.dart';
import 'package:ministop/src/models/product_model.dart';
import 'package:ministop/src/resources/app_color.dart';
import 'package:ministop/src/utils/money_format.dart';

class HomeProductItem extends StatelessWidget {
  final ProductModel data;
  final VoidCallback? onAddCart;

  const HomeProductItem({Key? key, required this.data, this.onAddCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyFormat format = MoneyFormat();
    String _money = "";
    _money = format.moneyFormat('${data.price.toString()} ')!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Image.network(
              data.image,
              width: 70,
              height: 70,
            ),
            const SizedBox(width: 8),
            Expanded(
                child: Text(
              data.name,
              style: const TextStyle(fontSize: 17, color: AppColor.blue),
            )),
            IconButton(
              onPressed: onAddCart,
              icon: const Icon(
                Icons.add_shopping_cart,
                color: AppColor.blue,
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "$_money đ",
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: AppColor.red),
        )
      ],
    );
  }
}
