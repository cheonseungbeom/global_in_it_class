import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/assistant_methods/address_changer.dart';
import 'package:user_app/mainScreens/placed_order_screen.dart';

import 'package:user_app/models/address.dart';

import '../maps/maps.dart';

class AddressDesign extends StatefulWidget {
  final Address? model;
  final int? curretIndex;
  final int? value;
  final String? addressID;
  final double? totolAmmount;
  final String? sellerUID;

  const AddressDesign(
      {super.key,
      this.model,
      this.curretIndex,
      this.value,
      this.addressID,
      this.totolAmmount,
      this.sellerUID});

  @override
  State<AddressDesign> createState() => _AddressDesignState();
}

class _AddressDesignState extends State<AddressDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<AddressChanger>(context, listen: false)
            .displayResult(widget.value);
      },
      child: Card(
        color: const Color.fromARGB(255, 131, 172, 175).withOpacity(0.4),
        child: Column(
          children: [
            Row(
              children: [
                Radio(
                  value: widget.value!,
                  groupValue: widget.curretIndex!,
                  activeColor: Colors.cyan,
                  onChanged: (val) {
                    Provider.of<AddressChanger>(context, listen: false)
                        .displayResult(val);
                    print(val);
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Table(
                        children: [
                          TableRow(
                            children: [
                              const Text(
                                "이름 ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.name.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                "연락처 ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.phoneNumber.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                "주소 ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.flatNumber.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                "도 ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.city.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                "나라 ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.state.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                "상세 주소 ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.fullAddress.toString()),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // MapsUtils.openMapWithAddress(widget.model!.fullAddress!);
                MapsUtils.openMapWithPosition(
                    widget.model!.lat!, widget.model!.lng!);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black54),
              child: const Text("지도에서 확인하기"),
            ),
            widget.value == Provider.of<AddressChanger>(context).count
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlacedOrderScreen(
                                    addressID: widget.addressID,
                                    totolAmmount: widget.totolAmmount,
                                    sellerUID: widget.sellerUID,
                                  )));
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                    child: const Text('설정'),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
