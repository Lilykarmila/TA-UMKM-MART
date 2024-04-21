// import 'package:flutter/material.dart';
// import 'package:ta_ecommerce/view/chat/widget/chat_list.dart';
// import 'package:ta_ecommerce/model/user_model.dart';
//
// import '../../common/widgets/appbar/appbar.dart';
//
// class TestChatList extends StatelessWidget {
//   const TestChatList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Contoh data merchantList
//     final List<UserModel> merchantList = [
//       UserModel(
//         uid: '1',
//         profilePicture: 'https://example.com/profile1.jpg',
//         username: 'Merchant 1',
//         email: 'merchant1@example.com',
//         type: 'seller',
//         fullName: 'Merchant 1',
//       ),
//       UserModel(
//         uid: '2',
//         profilePicture: 'https://example.com/profile2.jpg',
//         username: 'Merchant 2',
//         email: 'merchant2@example.com',
//         type: 'buyer',
//         fullName: 'Merchant 2',
//       ),
//       // Tambahkan data lainnya jika diperlukan
//     ];
//
//     return Scaffold(
//       appBar: TAppBar(
//           title: Text(
//             'Chat',
//             style: Theme.of(context).textTheme.headlineMedium,
//           ),
//           showBackArrow: false),
//       body: ListView.builder(
//         itemCount: merchantList.length,
//         itemBuilder: (context, index) {
//           return ChatList(
//             userModel: merchantList[index],
//           );
//         },
//       ),
//     );
//   }
// }
