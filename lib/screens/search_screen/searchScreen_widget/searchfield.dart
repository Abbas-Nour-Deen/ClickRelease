// import 'package:click_release/models/provider_model.dart';
// import 'package:click_release/screens/provider_screens/selectedProvider_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:searchfield/searchfield.dart';

// class SearchFieldWidget extends StatelessWidget {
//   SearchFieldWidget({super.key});

//   final FocusNode searchFocus = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     return SearchField<ProviderModel>(
//         // onSearchTextChanged: (query) {
//         //   final filter = dummyProviders
//         //       .where((element) =>
//         //           element.name.toLowerCase().contains(query.toLowerCase()))
//         //       .toList();
//         //   return filter
//         //       .map((e) =>
//         //           SearchFieldListItem<ProviderModel>(e.name, child: Text(e.name)))
//         //       .toList();
//         // },

//         focusNode: searchFocus,
//         suggestionState: Suggestion.expand,
//         onSuggestionTap: (provider) {
//           searchFocus.unfocus();

//           Get.to(SelectedProviderScreen(
//             provider: provider.item,
//           ));
//         },
//         hint: "Search by name or Keyword",
//         emptyWidget: Container(
//             padding: const EdgeInsets.all(10),
//             child: const Text("No results Found!")),
//         searchInputDecoration: InputDecoration(
//           alignLabelWithHint: true,
//           border: const UnderlineInputBorder(borderSide: BorderSide.none),
//           fillColor: Get.theme.colorScheme.primaryContainer,
//           hintStyle: const TextStyle(fontWeight: FontWeight.w400),
//           filled: true,
//         ),
//         itemHeight: 80,
//         suggestions: []

//         // dummyProviders
//         //     .map(
//         //       (e) => SearchFieldListItem<ProviderModel>(
//         //         "${e.name} ${e.category}",
//         //         item: e,
//         //         child: Padding(
//         //           padding: const EdgeInsets.all(8.0),
//         //           child: Row(
//         //             children: [
//         //               CircleAvatar(
//         //                 backgroundImage:
//         //                     Image.asset("assets/images/me.jpeg").image,
//         //               ),
//         //               const SizedBox(
//         //                 width: 10,
//         //               ),
//         //               Text(e.name),
//         //             ],
//         //           ),
//         //         ),
//         //       ),
//         //     )
//         //     .toList(),
//         );
//   }
// }
