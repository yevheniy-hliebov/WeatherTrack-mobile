import 'package:flutter/material.dart';
import 'package:weather_track/config/app_colors.dart';
import 'package:weather_track/styles/app_text_styles.dart';
import 'package:weather_track/widgets/custom_container.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final void Function(String value)? onSubmit;
  final int resultCount;
  final Widget Function(BuildContext context, int index)?
      separatorResultBuilder;
  final Widget Function(BuildContext context, int index) itemResultBuilder;

  const CustomSearchBar({
    super.key,
    this.controller,
    this.hintText,
    this.onSubmit,
    this.resultCount = 0,
    required this.itemResultBuilder,
    this.separatorResultBuilder,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late FocusNode _focusNode;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomContainer(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 19),
          border: isFocused ? CustomContainer.defaultBorder : null,
          child: TextField(
            controller: widget.controller,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: AppTextStyles.searchTextHint,
              border: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: () => onSubmitted(widget.controller?.text ?? ''),
                icon: const Icon(
                  Icons.search,
                  color: AppColors.textColor,
                ),
              ),
            ),
            style: AppTextStyles.searchText,
            cursorColor: AppColors.textColor,
            onTapOutside: (_) => _focusNode.unfocus(),
            onSubmitted: onSubmitted,
          ),
        ),
        if (widget.resultCount > 0) getResultList(),
      ],
    );
  }

  void onSubmitted(String value) {
    widget.onSubmit?.call(value);
  }

  Widget getResultList() {
    return Positioned(
      top: MediaQuery.of(context).padding.top + kToolbarHeight,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: CustomContainer(
          width: double.infinity,
          border: CustomContainer.defaultBorder,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int index = 0; index < widget.resultCount; index++) ...[
                widget.itemResultBuilder(context, index),
                if (widget.separatorResultBuilder != null &&
                    index < widget.resultCount - 1)
                  widget.separatorResultBuilder!(context, index),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
