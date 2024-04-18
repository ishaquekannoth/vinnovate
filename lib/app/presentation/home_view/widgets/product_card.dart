import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vinnovate/app/data/product_model.dart';
import 'package:vinnovate/app/presentation/home_view/widgets/image_widget.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final void Function(ProductModel productModel)? onTap;
  const ProductCard({
    super.key,
    required this.product, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap!=null?()=>onTap!(product):null ,
      child: Card(
        elevation: 0.5.h,
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 90.h,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          width: ScreenUtil().screenWidth,
          child: Row(
            children: [
              ImageWidget(
                borderRadius: BorderRadius.circular(4.r),
                imageUrl: product.image,
                height: 70.h,
                width: 70.h,
              ),
              SizedBox(
                width: 6.w,
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: 170.w,
                      child: Text(
                        product.title,
                        maxLines: 2,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      width: 170.w,
                      child: Text(
                        product.category,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        style: const TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 170.w,
                      child: Row(
                        children: [
                          ...List.generate(
                              product.rating.toInt(),
                              (index) => Icon(
                                    Icons.star,
                                    size: 12.h,
                                    color: Colors.amber,
                                  )),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            "(${product.rating}) (${product.count})",
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.w200,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          Text(
                            "${product.price}  \$",
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
