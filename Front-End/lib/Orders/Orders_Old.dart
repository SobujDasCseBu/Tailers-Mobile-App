// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:nuriya_tailers/constants/colors.dart';

// class Orders extends StatefulWidget {
//   const Orders({super.key});

//   @override
//   State<Orders> createState() => _OrdersState();
// }

// class Order {
//   final String id;
//   final String orderId;
//   final String orderNote;
//   final String clothName;
//   final Customer customer;
//   // final String clothType;
//   // final String customerName;
//   // final String customerPhone;

//   Order({
//     required this.id,
//     required this.orderId,
//     required this.orderNote,
//     required this.clothName,
//     // required this.customerName,
//     // required this.customerPhone,
//     required this.customer,
//   });
// }

// class Customer {
//   final String id;
//   final String customerName;
//   final String customerPhone;
//   final String customerLocation;

//   Customer({
//     required this.id,
//     required this.customerName,
//     required this.customerPhone,
//     required this.customerLocation,
//   });
// }

// class _OrdersState extends State<Orders> {
//   List<Order> orders = [];
// //my variables starts
//   final _formKey = GlobalKey<FormState>();
//   String selectedCustomerId = '64ae9f6d559978be96f6c33b';
//   String _selectedCustomer = 'Sujan';
//   String _orderNote = '';
//   String _clothName = '';
//   String _clothType = 'Cotton';
//   double _price = 40.0;
//   DateTime _estimatedDeliveryTime = DateTime.now();
//   String _lomba = '';
//   String _payerMuhri = '';
//   String _hatarMuhri = '';
//   String _hiegh = '';
//   String _puuti = '';
//   String _bodyi = '';
//   String _haatai = '';
//   String _colarToyrii = '';
//   String _komor = '';
//   bool _isPoket = false;
//   bool _isChain = false;
//   bool _isMotaShuta = false;
//   bool _isDoubleSelai = false;
//   bool _isMotaRabar = false;
//   bool _is2Pocket = false;
//   bool _isMobilePocket = false;
//   bool _isBendRoundColar = false;
//   bool _isKotiColar = false;
//   bool _isDoublePlate = false;
//   bool _isRoundcolar = false;
//   bool _isSinglePlate = false;
//   bool _isFull = false;
//   bool _isSamna = false;
//   bool _isColar = false;
//   bool _isMura = false;
//   bool _isHata = false;
//   bool _isKop = false;
//   bool _isSidePocket = false;
//   bool _isKandi = false;
//   bool _isFullBodySita = false;
//   bool _isColarSingle = false;
//   bool _isColarDouble = false;
//   bool _isSamnaSita = false;
//   bool _isGolGola = false;
//   bool _isOneChain = false;
//   bool _isOneGuntiDana = false;
//   bool _is3GuntiDana = false;
//   //my variables ends
//   Future<List<Order>> fetchOrders() async {
//     final response = await http.get(
//         Uri.parse('https://nuriya-tailers-backend.vercel.app/api/orders/'));
//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body);
//       List<Order> orderList = [];
//       for (var order in jsonData['data']) {
//         orderList.add(Order(
//           id: order['_id'],
//           orderId: order['orderId'],
//           orderNote: order['orderNote'],
//           clothName: order['clothName'],
//           customer: Customer(
//             id: order['customerId']['_id'],
//             customerName: order['customerId']['customerName'],
//             customerPhone: order['customerId']['customerPhone'],
//             customerLocation: order['customerId']['customerLocation'],
//           ),
//         ));
//       }
//       return orderList;
//     } else {
//       throw Exception('Failed to fetch orders');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchOrders().then((value) {
//       setState(() {
//         orders = value;
//       });
//     });
//   }

//   Future<void> deleteOrder(String id) async {
//     final url = 'https://nuriya-tailers-backend.vercel.app/api/orders/$id';
//     final response = await http.delete(Uri.parse(url));
//     if (response.statusCode == 200) {
//       setState(() {
//         orders.removeWhere((order) => order.id == id);
//       });
//     }
//   }

//   var orderId;

//   Future<void> createOrder(
//     String customerId,
//     String orderNote,
//     String clothName,
//     String clothType,
//     double price,
//     DateTime estimatedDeliveryTime,
//     String lomba,
//     String payerMuhri,
//     String hatarMuhri,
//     String hiegh,
//     String puut,
//     String bodyy,
//     String hata,
//     String kolarToyri,
//     String komor,
//     bool isPoket,
//     bool isChain,
//     bool isMotaShuta,
//     bool isDoubleSelai,
//     bool isMotaRabar,
//     bool is2Pocket,
//     bool isMobilePocket,
//     bool isBendRoundColar,
//     bool isKotiColar,
//     bool isDoublePlate,
//     bool isRoundcolar,
//     bool isSinglePlate,
//     bool isFull,
//     bool isSamna,
//     bool isColar,
//     bool isMura,
//     bool isHata,
//     bool isKop,
//     bool isSidePocket,
//     bool isKandi,
//     bool isFullBodySita,
//     bool isColarSingle,
//     bool isColarDouble,
//     bool isSamnaSita,
//     bool isGolGola,
//     bool isOneChain,
//     bool isOneGuntiDana,
//     bool is3GuntiDana,
//   ) async {
//     final url = 'https://nuriya-tailers-backend.vercel.app/api/orders/';
//     final response = await http.post(
//       Uri.parse(url),
//       body: jsonEncode({
//         'customerId': customerId,
//         'orderNote': orderNote,
//         'clothName': clothName,
//         'clothType': clothType,
//         'price': price,
//         'totalPrice': price,
//         'estimatedDeliveryTime': estimatedDeliveryTime.toIso8601String(),
//         'lomba': lomba,
//         'payerMuhri': payerMuhri,
//         'hatarMuhri': hatarMuhri,
//         'hiegh': hiegh,
//         'puut': puut,
//         'body': bodyy,
//         'hata': hata,
//         'kolarToyri': kolarToyri,
//         'komor': komor,
//         'isPoket': isPoket,
//         'isChain': isChain,
//         'isMotaShuta': isMotaShuta,
//         'isDoubleSelai': isDoubleSelai,
//         'isMotaRabar': isMotaRabar,
//         'is2Pocket': is2Pocket,
//         'isMobilePocket': isMobilePocket,
//         'isBendRoundColar': isBendRoundColar,
//         'isKotiColar': isKotiColar,
//         'isDoublePlate': isDoublePlate,
//         'isRoundcolar': isRoundcolar,
//         'isSinglePlate': isSinglePlate,
//         'isFull': isFull,
//         'isSamna': isSamna,
//         'isColar': isColar,
//         'isMura': isMura,
//         'isHata': isHata,
//         'isKop': isKop,
//         'isSidePocket': isSidePocket,
//         'isKandi': isKandi,
//         'isFullBodySita': isFullBodySita,
//         'isColarSingle': isColarSingle,
//         'isColarDouble': isColarDouble,
//         'isSamnaSita': isSamnaSita,
//         'isGolGola': isGolGola,
//         'isOneChain': isOneChain,
//         'isOneGuntiDana': isOneGuntiDana,
//         'is3GuntiDana': is3GuntiDana,

// //              'customerId'	{
// //               "_id":	"64ae9f6d559978be96f6c33b",
// // "customerName":	"ests ts",
// // "customerPhone"	:"212431234123sf3424",
// // "customerLocation":	"barishal",
// // "createdAt":	"2023-07-12T12:41:17.756Z",
// // "updatedAt":	"2023-07-12T12:41:17.756Z"
// //               },
//         // {
//         // "orderNote": "Sample order 1",
//         // "customerId": "64ae9f6d559978be96f6c33b",
//         // "totalPrice": 100,
//         // "estimatedDeliveryTime": "2023-07-15T10:00:00.000Z",
//         // "deliveredOn": null,
//         // "orderStatus": "pending",
//         // "clothName": "Anis Molla",
//         // "clothType": "Cotton",
//         // "lomba": "Sample lomba",
//         // "payerMuhri": "Sample payer muhri",
//         // "hatarMuhri": "Sample hatar muhri",
//         // "hiegh": "Sample hiegh",
//         // "puut": "Sample puut",
//         // "body": "Sample body",
//         // "hata": "Sample hata",
//         // "kolarToyri": "Sample kolar toyri",
//         // "komor": "Sample komor",
//         // "isPoket": true,
//         // "isChain": false,
//         // "isMotaShuta": true,
//         // "isDoubleSelai": false,
//         // "isMotaRabar": true,
//         // "is2Pocket": false,
//         // "isMobilePocket": true,
//         // "isBendRoundColar": false,
//         // "isKotiColar": true,
//         // "isDoublePlate": false,
//         // "isRoundcolar": true,
//         // "isSinglePlate": false,
//         // "isFull": true,
//         // "isSamna": false,
//         // "isColar": true,
//         // "isMura": false,
//         // "isHata": true,
//         // "isKop": false,
//         // "isSidePocket": true,
//         // "isKandi": false,
//         // "isFullBodySita": true,
//         // "isColarSingle": false,
//         // "isColarDouble": true,
//         // "isSamnaSita": false,
//         // "isGolGola": true,
//         // "isOneChain": false,
//         // "isOneGuntiDana": true,
//         // "is3GuntiDana": false,
//         // "price": 50
//         // }
//       }),
//       headers: {'Content-Type': 'application/json'},
//     );
//     var myjson = jsonEncode({
//       'customerId': customerId,
//       'orderNote': orderNote,
//       'clothName': clothName,
//       'clothType': clothType,
//       'price': price,
//       'totalPrice': price,
//       'estimatedDeliveryTime': estimatedDeliveryTime.toIso8601String(),
//       'lomba': lomba,
//       'payerMuhri': payerMuhri,
//       'hatarMuhri': hatarMuhri,
//       'hiegh': hiegh,
//       'puut': puut,
//       'body': bodyy,
//       'hata': hata,
//       'kolarToyri': kolarToyri,
//       'komor': komor,
//       'isPoket': isPoket,
//       'isChain': isChain,
//       'isMotaShuta': isMotaShuta,
//       'isDoubleSelai': isDoubleSelai,
//       'isMotaRabar': isMotaRabar,
//       'is2Pocket': is2Pocket,
//       'isMobilePocket': isMobilePocket,
//       'isBendRoundColar': isBendRoundColar,
//       'isKotiColar': isKotiColar,
//       'isDoublePlate': isDoublePlate,
//       'isRoundcolar': isRoundcolar,
//       'isSinglePlate': isSinglePlate,
//       'isFull': isFull,
//       'isSamna': isSamna,
//       'isColar': isColar,
//       'isMura': isMura,
//       'isHata': isHata,
//       'isKop': isKop,
//       'isSidePocket': isSidePocket,
//       'isKandi': isKandi,
//       'isFullBodySita': isFullBodySita,
//       'isColarSingle': isColarSingle,
//       'isColarDouble': isColarDouble,
//       'isSamnaSita': isSamnaSita,
//       'isGolGola': isGolGola,
//       'isOneChain': isOneChain,
//       'isOneGuntiDana': isOneGuntiDana,
//       'is3GuntiDana': is3GuntiDana,
//       'orderStatus': 'pending',
//     });
//     print('customerId: $customerId');
//     print('orderNote: $orderNote');
//     print('clothName: $clothName');
//     print('clothType: $clothType');
//     print('price: $price');
//     print('totalPrice: $price');
//     print('estimatedDeliveryTime: ${estimatedDeliveryTime.toIso8601String()}');
//     print('lomba: $lomba');
//     print('payerMuhri: $payerMuhri');
//     print('hatarMuhri: $hatarMuhri');
//     print('hiegh: $hiegh');
//     print('puut: $puut');
//     print('body: $bodyy');
//     print('hata: $hata');
//     print('kolarToyri: $kolarToyri');
//     print('komor: $komor');
//     print('isPoket: $isPoket');
//     print('isChain: $isChain');
//     print('isMotaShuta: $isMotaShuta');
//     print('isDoubleSelai: $isDoubleSelai');
//     print('isMotaRabar: $isMotaRabar');
//     print('is2Pocket: $is2Pocket');
//     print('isMobilePocket: $isMobilePocket');
//     print('isBendRoundColar: $isBendRoundColar');
//     print('isKotiColar: $isKotiColar');
//     print('isDoublePlate: $isDoublePlate');
//     print('isRoundcolar: $isRoundcolar');
//     print('isSinglePlate: $isSinglePlate');
//     print('isFull: $isFull');
//     print('isSamna: $isSamna');
//     print('isColar: $isColar');
//     print('isMura: $isMura');
//     print('isHata: $isHata');
//     print('isKop: $isKop');
//     print('isSidePocket: $isSidePocket');
//     print('isKandi: $isKandi');
//     print('isFullBodySita: $isFullBodySita');
//     print('isColarSingle: $isColarSingle');
//     print('isColarDouble: $isColarDouble');
//     print('isSamnaSita: $isSamnaSita');
//     print('isGolGola: $isGolGola');
//     print('isOneChain: $isOneChain');
//     print('isOneGuntiDana: $isOneGuntiDana');
//     print('is3GuntiDana: $is3GuntiDana');
//     print(myjson.toString());

//     if (response.statusCode == 200) {
//       // id = jsonDecode(response.body)['_id'];
//       orderId = jsonDecode(response.body)['orderId'];
//       print("Order Id: $orderId");
//       setState(() {});
//     } else {
//       print("Error: " + response.statusCode.toString());
//     }
//   }

//   Future<void> markAsDelivered(String orderId) async {
//     final url = 'https://nuriya-tailers-backend.vercel.app/api/orders/$orderId';
//     final body = jsonEncode({'orderStatus': 'delivered'});

//     try {
//       final response = await http.patch(Uri.parse(url),
//           headers: {'Content-Type': 'application/json'}, body: body);

//       if (response.statusCode == 200) {
//         print('Order marked as delivered successfully.');
//         // Handle success scenario
//       } else {
//         print(
//             'Failed to mark order as delivered. Status Code: ${response.statusCode}');
//         // Handle error scenario
//       }
//     } catch (error) {
//       print('Error occurred while marking order as delivered: $error');
//       // Handle error scenario
//     }
//   }

//   Future<void> markAsDone(String orderId) async {
//     final url = 'https://nuriya-tailers-backend.vercel.app/api/orders/$orderId';
//     final body = jsonEncode({'orderStatus': 'done'});

//     try {
//       final response = await http.patch(Uri.parse(url),
//           headers: {'Content-Type': 'application/json'}, body: body);

//       if (response.statusCode == 200) {
//         print('Order marked as Done successfully.');
//         // Handle success scenario
//       } else {
//         print(
//             'Failed to mark order as Done. Status Code: ${response.statusCode}');
//         // Handle error scenario
//       }
//     } catch (error) {
//       print('Error occurred while marking order as Done: $error');
//       // Handle error scenario
//     }
//   }

//   void searchOrder(String _searchQuery) {
//     setState(() {
//       orders
//           .where((order) =>
//               order.customer.customerPhone.contains(_searchQuery) ||
//               order.orderId.contains(_searchQuery))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Orders'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: orders.length,
//               itemBuilder: (context, index) {
//                 final order = orders[index];
//                 return Container(
//                   padding: EdgeInsets.only(left: 5, right: 5),
//                   child: Card(
//                     elevation: 7.2,
//                     child: ListTile(
//                       leading: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: GlobalVariables.primaryColor,
//                         ),
//                         padding: EdgeInsets.only(
//                             left: 10, right: 10, top: 10, bottom: 10),
//                         // color: GlobalVariables.primaryColor,
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child: Text(
//                               order.orderId,
//                               style: TextStyle(color: Colors.white),
//                             )),
//                       ),
//                       title: Text(
//                         order.customer.customerName +
//                             "[" +
//                             order.customer.customerPhone +
//                             "]",
//                         // order.clothName,
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Text(order.clothName),
//                       trailing: PopupMenuButton(
//                         itemBuilder: (BuildContext context) => <PopupMenuEntry>[
//                           PopupMenuItem(
//                             child: Text('Edit'),
//                             value: 'edit',
//                           ),
//                           PopupMenuItem(
//                             child: Text('Mark As Done'),
//                             value: 'done',
//                           ),
//                           PopupMenuItem(
//                             child: Text('Mark As Delivered'),
//                             value: 'delivered',
//                           ),
//                           PopupMenuItem(
//                             child: Text('Delete'),
//                             value: 'delete',
//                           ),
//                         ],
//                         onSelected: (value) {
//                           if (value == 'edit') {
//                             // Implement edit functionality
//                           } else if (value == 'done') {
//                             // Implement Done functionality
//                             markAsDone(order.id);
//                           } else if (value == 'delivered') {
//                             markAsDelivered(order.id);
//                             // Implement delivered functionality
//                           } else if (value == 'delete') {
//                             showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   title: Text('Confirm Deletion'),
//                                   content: Text(
//                                       'Are you sure you want to delete this order?'),
//                                   actions: [
//                                     TextButton(
//                                       child: Text('Cancel'),
//                                       onPressed: () =>
//                                           Navigator.of(context).pop(),
//                                     ),
//                                     TextButton(
//                                       child: Text('Delete'),
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                         deleteOrder(order.id);
//                                       },
//                                     ),
//                                   ],
//                                 );
//                               },
//                             );
//                           }
//                         },
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text('Create Order'),
//                 content: SingleChildScrollView(
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         DropdownButtonFormField(
//                           value: _selectedCustomer,
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedCustomer = value.toString();
//                             });
//                           },
//                           items: [
//                             DropdownMenuItem(
//                               value: 'Sujan',
//                               child: Text('Sujan'),
//                             ),
//                             DropdownMenuItem(
//                               value: 'Rahat',
//                               child: Text('Rahat'),
//                             ),
//                             DropdownMenuItem(
//                               value: 'Anis',
//                               child: Text('Anis'),
//                             ),
//                           ],
//                           decoration: InputDecoration(
//                             labelText: 'Select Customer',
//                           ),
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Order Note',
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter an order note';
//                             }
//                             return null;
//                           },
//                           onChanged: (value) {
//                             setState(() {
//                               _orderNote = value;
//                             });
//                           },
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Cloth Name',
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter a cloth name';
//                             }
//                             return null;
//                           },
//                           onChanged: (value) {
//                             setState(() {
//                               _clothName = value;
//                             });
//                           },
//                         ),
//                         DropdownButtonFormField(
//                           value: _clothType,
//                           onChanged: (value) {
//                             setState(() {
//                               _clothType = value.toString();
//                             });
//                           },
//                           items: [
//                             DropdownMenuItem(
//                               value: 'Cotton',
//                               child: Text('Cotton'),
//                             ),
//                             DropdownMenuItem(
//                               value: 'Payjama',
//                               child: Text('Payjama'),
//                             ),
//                             DropdownMenuItem(
//                               value: 'Fotua',
//                               child: Text('Fotua'),
//                             ),
//                           ],
//                           decoration: InputDecoration(
//                             labelText: 'Cloth Type',
//                           ),
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Price',
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter a price';
//                             }
//                             return null;
//                           },
//                           onChanged: (value) {
//                             setState(() {
//                               _price = double.parse(value);
//                             });
//                           },
//                         ),
//                         ListTile(
//                           title: Text('Estimated Delivery Time'),
//                           subtitle: Text('${_estimatedDeliveryTime.toLocal()}'),
//                           onTap: () async {
//                             final DateTime? picked = await showDatePicker(
//                               context: context,
//                               initialDate: _estimatedDeliveryTime,
//                               firstDate: DateTime(2000),
//                               lastDate: DateTime(2100),
//                             );
//                             if (picked != null &&
//                                 picked != _estimatedDeliveryTime) {
//                               setState(() {
//                                 _estimatedDeliveryTime = picked;
//                               });
//                             }
//                           },
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Lomba',
//                           ),
//                           onChanged: (value) {
//                             setState(() {
//                               _lomba = value;
//                             });
//                           },
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Payer Muhri',
//                           ),
//                           onChanged: (value) {
//                             setState(() {
//                               _payerMuhri = value;
//                             });
//                           },
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Hatar Muhri',
//                           ),
//                           onChanged: (value) {
//                             setState(() {
//                               _hatarMuhri = value;
//                             });
//                           },
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Hiegh',
//                           ),
//                           onChanged: (value) {
//                             setState(() {
//                               _hiegh = value;
//                             });
//                           },
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Puuti',
//                           ),
//                           onChanged: (value) {
//                             setState(() {
//                               _puuti = value;
//                             });
//                           },
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Bodyi',
//                           ),
//                           onChanged: (value) {
//                             setState(() {
//                               _bodyi = value;
//                             });
//                           },
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Haatai',
//                           ),
//                           onChanged: (value) {
//                             setState(() {
//                               _haatai = value;
//                             });
//                           },
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Colar Toyrii',
//                           ),
//                           onChanged: (value) {
//                             setState(() {
//                               _colarToyrii = value;
//                             });
//                           },
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Komor',
//                           ),
//                           onChanged: (value) {
//                             setState(() {
//                               _komor = value;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isPoket'),
//                           value: _isPoket,
//                           onChanged: (value) {
//                             setState(() {
//                               _isPoket = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isChain'),
//                           value: _isChain,
//                           onChanged: (value) {
//                             setState(() {
//                               _isChain = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isMotaShuta'),
//                           value: _isMotaShuta,
//                           onChanged: (value) {
//                             setState(() {
//                               _isMotaShuta = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isDoubleSelai'),
//                           value: _isDoubleSelai,
//                           onChanged: (value) {
//                             setState(() {
//                               _isDoubleSelai = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isMotaRabar'),
//                           value: _isMotaRabar,
//                           onChanged: (value) {
//                             setState(() {
//                               _isMotaRabar = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('is2Pocket'),
//                           value: _is2Pocket,
//                           onChanged: (value) {
//                             setState(() {
//                               _is2Pocket = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isMobilePocket'),
//                           value: _isMobilePocket,
//                           onChanged: (value) {
//                             setState(() {
//                               _isMobilePocket = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isBendRoundColar'),
//                           value: _isBendRoundColar,
//                           onChanged: (value) {
//                             setState(() {
//                               _isBendRoundColar = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isKotiColar'),
//                           value: _isKotiColar,
//                           onChanged: (value) {
//                             setState(() {
//                               _isKotiColar = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isDoublePlate'),
//                           value: _isDoublePlate,
//                           onChanged: (value) {
//                             setState(() {
//                               _isDoublePlate = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isRoundcolar'),
//                           value: _isRoundcolar,
//                           onChanged: (value) {
//                             setState(() {
//                               _isRoundcolar = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isSinglePlate'),
//                           value: _isSinglePlate,
//                           onChanged: (bool? value45) {
//                             setState(() {});
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isFull'),
//                           value: _isFull,
//                           onChanged: (value) {
//                             setState(() {
//                               _isFull = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isSamna'),
//                           value: _isSamna,
//                           onChanged: (value) {
//                             setState(() {
//                               _isSamna = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isColar'),
//                           value: _isColar,
//                           onChanged: (value) {
//                             setState(() {
//                               _isColar = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isMura'),
//                           value: _isMura,
//                           onChanged: (value) {
//                             setState(() {
//                               _isMura = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isHata'),
//                           value: _isHata,
//                           onChanged: (value) {
//                             setState(() {
//                               _isHata = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isKop'),
//                           value: _isKop,
//                           onChanged: (value) {
//                             setState(() {
//                               _isKop = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isSidePocket'),
//                           value: _isSidePocket,
//                           onChanged: (value) {
//                             setState(() {
//                               _isSidePocket = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isKandi'),
//                           value: _isKandi,
//                           onChanged: (value) {
//                             setState(() {
//                               _isKandi = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isFullBodySita'),
//                           value: _isFullBodySita,
//                           onChanged: (value) {
//                             setState(() {
//                               _isFullBodySita = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isColarSingle'),
//                           value: _isColarSingle,
//                           onChanged: (value) {
//                             setState(() {
//                               _isColarSingle = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isColarDouble'),
//                           value: _isColarDouble,
//                           onChanged: (value) {
//                             setState(() {
//                               _isColarDouble = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isSamnaSita'),
//                           value: _isSamnaSita,
//                           onChanged: (value) {
//                             setState(() {
//                               _isSamnaSita = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isGolGola'),
//                           value: _isGolGola,
//                           onChanged: (value) {
//                             setState(() {
//                               _isGolGola = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isOneChain'),
//                           value: _isOneChain,
//                           onChanged: (value) {
//                             setState(() {
//                               _isOneChain = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('isOneGuntiDana'),
//                           value: _isOneGuntiDana,
//                           onChanged: (value) {
//                             setState(() {
//                               _isOneGuntiDana = value!;
//                             });
//                           },
//                         ),
//                         SwitchListTile(
//                           title: Text('is3GuntiDana'),
//                           value: _is3GuntiDana,
//                           onChanged: (value) {
//                             setState(() {
//                               _is3GuntiDana = value!;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 actions: [
//                   TextButton(
//                     child: Text('Cancel'),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                   TextButton(
//                     child: Text('Create'),
//                     onPressed: () {
//                       createOrder(
//                         // _selectedCustomer,
//                         '64ae9f6d559978be96f6c33b',
//                         _orderNote,
//                         _clothName,
//                         _clothType,
//                         _price,
//                         _estimatedDeliveryTime,
//                         _lomba,
//                         _payerMuhri,
//                         _hatarMuhri,
//                         _hiegh,
//                         _puuti,
//                         _bodyi,
//                         _haatai,
//                         _colarToyrii,
//                         _komor,
//                         _isPoket,
//                         _isChain,
//                         _isMotaShuta,
//                         _isDoubleSelai,
//                         _isMotaRabar,
//                         _is2Pocket,
//                         _isMobilePocket,
//                         _isBendRoundColar,
//                         _isKotiColar,
//                         _isDoublePlate,
//                         _isRoundcolar,
//                         _isSinglePlate,
//                         _isFull,
//                         _isSamna,
//                         _isColar,
//                         _isMura,
//                         _isHata,
//                         _isKop,
//                         _isSidePocket,
//                         _isKandi,
//                         _isFullBodySita,
//                         _isColarSingle,
//                         _isColarDouble,
//                         _isSamnaSita,
//                         _isGolGola,
//                         _isOneChain,
//                         _isOneGuntiDana,
//                         _is3GuntiDana,
//                       );
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
