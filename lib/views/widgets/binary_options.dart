import 'package:flutter/material.dart';

class BinaryOption extends StatefulWidget {
  // const BinaryOption({super.key});
  BinaryOption({
    Key? key,
    this.textLeft = 'Profile Info',
    this.textRight = 'Repositories',
  }) : super(key: key);
  String textRight;
  String textLeft;

  @override
  State<BinaryOption> createState() => _BinaryOptionState();
}

class _BinaryOptionState extends State<BinaryOption> {
  bool lr = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        color: Colors.white70,
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    lr = false;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.textLeft,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: lr == false ? Colors.black : Colors.grey),
                    ),
                    Container(
                      height: lr == false ? 3 : 1,
                      color: lr == false ? Color(0xffc8e6c9) : Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    lr = true;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.textRight,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: lr == true ? Colors.black : Colors.grey),
                    ),
                    Container(
                      height: lr == true ? 3 : 1,
                      color: lr == true ? Color(0xffc8e6c9) : Colors.white70,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
