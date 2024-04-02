import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;

  const CustomAppBar({
    Key? key,
    required this.titleAppBar,
    this.onPressedIcon,
    this.onPressedSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            onTap: onPressedSearch,
            // keyboardType: TextInputType.none,
            readOnly: true,

            decoration: InputDecoration(
                isDense: true,
                prefixIcon: const Icon(Icons.search, size: 25),
                hintText: titleAppBar,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.grey[200]),
          )),
          const SizedBox(
            width: 10,
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20)),
            width: 60,
            // height: 60,
            child: IconButton(
              onPressed: onPressedIcon,
              icon: Icon(
                Icons.notifications_active_outlined,
                size: 30,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
