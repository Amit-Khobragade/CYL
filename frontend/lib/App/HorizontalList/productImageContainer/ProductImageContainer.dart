import 'package:flutter/material.dart';
import '../../Variables/Size.dart';
import '../../Variables/WidgetVariables.dart';
import '../../CodeAssets/boxShimmer.dart';

class ProductImageClass extends StatefulWidget {
  final String? url;
  final double width, height;
  const ProductImageClass({super.key, this.url, this.height = SizeVariables.smallSquareCard, this.width = SizeVariables.smallSquareCard});

  @override
  State<ProductImageClass> createState() => _ProductImageClass();
}

class _ProductImageClass extends State<ProductImageClass> {
  bool _loaded = false;
  Image? _image;

  @override
  void initState() {
    super.initState();
    if (widget.url == null) {
      throw Exception("null ptr");
    }
    _image = Image.network(widget.url!);
    _image!.image.resolve(const ImageConfiguration()).addListener(ImageStreamListener((image, synchronousCall) {
      onImage:
      () => setState(() {
            _loaded = true;
          });
    }));
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      return ShimmerWidget(height: widget.height, width: widget.width);
    }
    return (Container(
        width: widget.width, height: widget.height, decoration: const BoxDecoration(borderRadius: WidgetVariables.borderRadiusSmall), child: _image));
  }
}
