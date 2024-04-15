import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/view/public_rooms/search_bar_rooms.dart';

class Home_room_body extends StatelessWidget {
  const Home_room_body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        'subcategory': [
          {
            'sub': {
              'subcategory 1_1_1': ['room 1_1_2_1', 'room 1_1_2_2'],
              'room 1_1_3': null,
              'room 1_1_4_1': null,
              'room 1_1_4_2': null
            }
          }
        ]
      },
      {
        'subcategory': [
          {
            'sub': {
              'subcategory 1_2_1': ['room 1_2_2_1', 'room 1_2_2_2'],
              'room 1_2_3': null,
              'room 1_2_4_1': null,
              'room 1_2_4_2': null
            }
          }
        ]
      },
      {
        'subcategory': [
          {
            'sub': {
              'subcategory 1_3_1': ['room 1_3_2_1', 'room 1_3_2_2'],
              'room 1_3_3': null,
              'room 1_3_4_1': null,
              'room 1_3_4_2': null
            }
          }
        ]
      },
      {
        'subcategory': [
          {
            'sub': {
              'subcategory 1_4_1': ['room 1_4_2_1', 'room 1_4_2_2'],
              'room 1_4_3': null,
              'room 1_4_4_1': null,
              'room 1_4_4_2': null
            }
          }
        ]
      },
      {
        'subcategory': [
          {
            'sub': {
              'subcategory 1_5_1': ['room 1_5_2_1', 'room 1_5_2_2'],
              'room 1_5_3': null,
              'room 1_5_4_1': null,
              'room 1_5_4_2': null
            }
          }
        ]
      },
      {
        'subcategory': [
          {
            'sub': {
              'subcategory 1_6_1': ['room 1_6_2_1', 'room 1_6_2_2'],
              'room 1_6_3': null,
              'room 1_6_4_1': null,
              'room 1_6_4_2': null
            }
          }
        ]
      },
      {
        'subcategory': [
          {
            'sub': {
              'subcategory 1_7_1': ['room 1_7_2_1', 'room 1_7_2_2'],
              'room 1_7_3': null,
              'room 1_7_4_1': null,
              'room 1_7_4_2': null
            }
          }
        ]
      },
      {
        'subcategory': [
          {
            'sub': {
              'subcategory 1_8_1': ['room 1_8_2_1', 'room 1_8_2_2'],
              'room 1_8_3': null,
              'room 1_8_4_1': null,
              'room 1_8_4_2': null
            }
          }
        ]
      },
      {
        'subcategory': [
          {
            'sub': {
              'subcategory 1_9_1': ['room 1_9_2_1', 'room 1_9_2_2'],
              'room 1_9_3': null,
              'room 1_9_4_1': null,
              'room 1_9_4_2': null
            }
          }
        ]
      },
      {
        'subcategory': [
          {
            'sub': {
              'subcategory 1_10_1': ['room 1_10_2_1', 'room 1_10_2_2'],
              'room 1_10_3': null,
              'room 1_10_4_1': null,
              'room 1_10_4_2': null
            }
          }
        ]
      },
    ];

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Search_bar_rooms(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final subcategories =
                    category['subcategory'] as List<Map<String, dynamic>>?;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(35, 101, 97, 97)),
                        borderRadius: BorderRadius.circular(5)),
                    child: ExpansionTile(
                      title: Text(
                        "Category ${index + 1}",
                        style: Text_style_constant.normal_text,
                      ),
                      trailing: Icon(Icons.arrow_drop_down),
                      children: [
                        if (subcategories != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: subcategories.map<Widget>((subcategory) {
                              final sub =
                                  subcategory['sub'] as Map<String, dynamic>;
                              return Column(
                                children: sub.entries.map<Widget>((entry) {
                                  final subcategoryTitle = entry.key;
                                  final rooms = entry.value as List<String>?;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                35, 101, 97, 97)),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .07,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              subcategoryTitle,
                                              style: Text_style_constant
                                                  .normal_text,
                                            ),
                                            if (rooms != null)
                                              ...rooms.map((room) => Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8.0),
                                                      child: Text(
                                                        room,
                                                        style:
                                                            Text_style_constant
                                                                .normal_text,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            }).toList(),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
