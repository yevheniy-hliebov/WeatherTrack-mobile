import 'package:flutter/material.dart';
import 'package:weather_track/styles/border_styles.dart';
import 'package:weather_track/utils/constants/constants.dart';
import 'package:weather_track/widgets/common/common.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;

  final void Function()? onFocused;
  final void Function(String value)? onChangeInputText;
  final void Function(String value)? onSubmit;

  final bool isLoading;

  final int resultCount;
  final Widget Function(BuildContext context, int index)?
      separatorResultBuilder;
  final Widget Function(BuildContext context, int index) itemResultBuilder;
  final void Function(int index)? onTapedItemResult;

  const CustomSearchBar({
    super.key,
    this.controller,
    this.hintText,
    this.onFocused,
    this.onChangeInputText,
    this.onSubmit,
    this.isLoading = false,
    this.resultCount = 0,
    required this.itemResultBuilder,
    this.separatorResultBuilder,
    this.onTapedItemResult,
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
        if (widget.onFocused != null && _focusNode.hasFocus) {
          widget.onFocused!();
        }
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
    return TapRegion(
      onTapOutside: (_) => _focusNode.unfocus(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomContainer(
            padding: const EdgeInsets.symmetric(
                vertical: Sizes.xs, horizontal: Sizes.md2),
            border: isFocused
                ? BorderStyles.defaultBorder
                : BorderStyles.transparent,
            child: TextField(
              controller: widget.controller,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.bodyLarge,
                border: InputBorder.none,
                suffixIcon: getIconOrLoader(),
              ),
              style: Theme.of(context).textTheme.bodyLarge,
              cursorColor: AppColors.text,
              onSubmitted: onSubmitted,
              onChanged: onChanged,
            ),
          ),
          if (widget.resultCount > 0) getResultList(),
        ],
      ),
    );
  }

  Widget getIconOrLoader() {
    if (widget.isLoading) {
      return const Loader(
        color: AppColors.text,
        padding: EdgeInsets.all(Sizes.sm),
      );
    }
    return AnimatedRotation(
      turns: isFocused ? 0.25 : -0.25,
      duration: const Duration(milliseconds: 250),
      child: const Icon(
        Icons.arrow_back_ios_new_outlined,
        color: AppColors.text,
      ),
    );
  }

  void onSubmitted(String value) {
    widget.onSubmit?.call(value);
  }

  void onChanged(String value) {
    widget.onChangeInputText?.call(value);
  }

  Widget getResultList() {
    if (isFocused == false) {
      return const SizedBox();
    }
    return Positioned(
      left: 0,
      right: 0,
      top: Sizes.customSearchBarHeight,
      child: CustomContainer(
        width: double.infinity,
        border: BorderStyles.defaultBorder,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int index = 0; index < widget.resultCount; index++) ...[
              Material(
                color: AppColors.transparent,
                child: InkWell(
                  onTap: () {
                    widget.onTapedItemResult?.call(index);
                    _focusNode.unfocus();
                  },
                  splashColor: AppColors.splashColor,
                  child: widget.itemResultBuilder(context, index),
                ),
              ),
              if (widget.separatorResultBuilder != null &&
                  index < widget.resultCount - 1)
                widget.separatorResultBuilder!(context, index),
            ]
          ],
        ),
      ),
    );
  }
}
