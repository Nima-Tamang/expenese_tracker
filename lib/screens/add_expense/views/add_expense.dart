import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  DateTime selectDate = DateTime.now();

  List<String> myCategoriesIcons = [
    'entertainment',
    'food',
    'home',
    'pet',
    'shopping',
    'tech',
    'travel',
  ];

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            // backgroundColor: Theme.of(context).colorScheme.onSurface,
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Add Expenses",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextFormField(
                    controller: expenseController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        CupertinoIcons.money_dollar,
                        size: 16,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: categoryController,
                  textAlignVertical: TextAlignVertical.center,
                  readOnly: true,
                  onTap: () {},
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.list,
                      size: 16,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                bool isExpanded = false;

                                String iconSelected = '';
                                 Color categoryColor =Colors.white;
                                return StatefulBuilder(
                                    builder: (context, setState) {
                                  return AlertDialog(
                                      title: const Text('Create a Category'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            decoration: InputDecoration(
                                                isDense: true,
                                                filled: true,
                                                fillColor: Colors.white,
                                                hintText: 'Name',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide.none,
                                                )),
                                          ),
                                          SizedBox(height: 16),
                                          TextFormField(
                                            onTap: () {
                                              setState(() {
                                                isExpanded = !isExpanded;
                                              });
                                            },
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            readOnly: true,
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                suffixIcon: Icon(
                                                    CupertinoIcons.chevron_down,
                                                    size: 12),
                                                hintText: 'Icon',
                                                border: OutlineInputBorder(
                                                  borderRadius: isExpanded
                                                      ? BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              12))
                                                      : BorderRadius.circular(
                                                          12),
                                                  borderSide: BorderSide.none,
                                                )),
                                          ),
                                          isExpanded
                                              ? Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                                  height: 200,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              bottom: Radius
                                                                  .circular(
                                                                      12))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GridView.builder(
                                                        gridDelegate:
                                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 3,
                                                          mainAxisSpacing: 5,
                                                          crossAxisSpacing: 5,
                                                        ),
                                                        itemCount:
                                                            myCategoriesIcons
                                                                .length,
                                                        itemBuilder:
                                                            (context, int i) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                iconSelected =
                                                                    myCategoriesIcons[
                                                                        i];
                                                              });
                                                            },
                                                            child: Container(
                                                                width: 50,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            5,
                                                                        color: iconSelected == myCategoriesIcons[i]
                                                                            ? Colors
                                                                                .green
                                                                            : Colors
                                                                                .grey),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/${myCategoriesIcons[i]}.png')))),
                                                          );
                                                        }),
                                                  ),
                                                )
                                              : Container(),
                                          SizedBox(height: 16),
                                          TextFormField(
                                            onTap: () {
                                              showDialog(
                                                
                                                  context: context,

                                                  builder: (ctx2) {
                                                   
                                                    return AlertDialog(
                                                        content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        ColorPicker(
                                                          pickerColor:
                                                              Colors.blue,
                                                          onColorChanged:
                                                              (value) {
                                                            setState(() {
                                                              categoryColor =
                                                                  value;
                                                            });
                                                          },
                                                        ),
                                                        SizedBox(height: 16),
                                                        SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height: 50,
                                                          child: TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    ctx2);
                                                              },
                                                              style: TextButton.styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .black,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12))),
                                                              child: const Text(
                                                                  'Save',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        22,
                                                                    color: Colors
                                                                        .white,
                                                                  ))),
                                                        )
                                                      ],
                                                    ));
                                                  });
                                              // raise the [showDialog] widget
                                            },
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            readOnly: true,
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: categoryColor,
                                                hintText: 'Color',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide.none,
                                                )),
                                          ),
                                          const SizedBox(height: 16),
                                           SizedBox(
                  width: double.infinity,
                  height: kToolbarHeight,
                  child: TextButton(
                      onPressed: () {
                        //create category objecet and pop
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text('Save',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ))),
                )
                                        ],
                                      ));
                                });
                              });
                        },
                        icon: const Icon(
                          FontAwesomeIcons.plus,
                          size: 16,
                          color: Colors.grey,
                        )),
                    hintText: 'Category',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                  ),
                ),
                SizedBox(height: 32),
                TextFormField(
                  controller: dateController,
                  textAlignVertical: TextAlignVertical.center,
                  readOnly: true,
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: selectDate,
                        firstDate: DateTime.now(),
                        lastDate:
                            DateTime.now().add(const Duration(days: 365)));

                    if (newDate != null) {
                      setState(() {
                        dateController.text =
                            DateFormat('dd/MM/yyyy').format(newDate);
                        selectDate = newDate;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.clock,
                      size: 16,
                      color: Colors.grey,
                    ),
                    hintText: 'Date',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: kToolbarHeight,
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text('Save',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ))),
                )
              ],
            ),
          )),
    );
  }
}
