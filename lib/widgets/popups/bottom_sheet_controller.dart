import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_colors.dart';

// ignore: todo
/// TODO: Optimize this class.
///
/// This class is HUGE! I didn't have the time to fix it, sorry :(
/// Anyway, it stabilishes all the BottomSheet flows. Good luck!
// ignore: must_be_immutable
class AppBottomSheet extends StatefulWidget {
  AppBottomSheet({
    Key? key,
    required this.title,
    required this.selectedOrder,
    required this.selectedFilter,
    required this.selectedFilterType,
    required this.selectOrder,
    required this.selectFilter,
  }) : super(key: key);

  final String title;
  final String selectedOrder;
  final Function(String) selectOrder;
  final Function(String, String) selectFilter;
  String selectedFilter;
  String selectedFilterType;

  @override
  State<AppBottomSheet> createState() => AppBottomSheetState();
}

class AppBottomSheetState extends State<AppBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                if (widget.title == 'filtrar' &&
                    widget.selectedFilterType.isNotEmpty) ...[
                  TextSpan(
                    text: widget.selectedFilterType,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ] else
                  TextSpan(
                    text: '${widget.title} por',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                TextSpan(
                  text: ':',
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        color: AppColors.green1,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),

          /////////////////////////////////////
          if (widget.title == 'ordenar') ...[
            RadioListTile(
              value: 'nome',
              groupValue: widget.selectedOrder,
              onChanged: (value) => {widget.selectOrder(value.toString())},
              toggleable: true,
              activeColor: AppColors.green1,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: const EdgeInsets.symmetric(horizontal: 2),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'nome ',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    TextSpan(
                      text: '(a-z)',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: AppColors.blue5,
                          ),
                    )
                  ],
                ),
              ),
            ),
            RadioListTile(
              value: 'data',
              groupValue: widget.selectedOrder,
              onChanged: (value) => {widget.selectOrder(value.toString())},
              toggleable: true,
              activeColor: AppColors.green1,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: const EdgeInsets.symmetric(horizontal: 2),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'data ',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    TextSpan(
                      text: '(mais recente-mais antigo)',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: AppColors.blue5,
                          ),
                    )
                  ],
                ),
              ),
            ),
            RadioListTile(
              value: 'avaliacoes',
              groupValue: widget.selectedOrder,
              onChanged: (value) => {widget.selectOrder(value.toString())},
              toggleable: true,
              activeColor: AppColors.green1,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: const EdgeInsets.symmetric(horizontal: 2),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'avaliações ',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    TextSpan(
                      text: '(100-0)',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: AppColors.blue5,
                          ),
                    )
                  ],
                ),
              ),
            ),
          ]

          /////////////////////////////////////
          else ...[
            /////////////////////////////////////
            if (widget.selectedFilterType.isEmpty) ...[
              ListTile(
                onTap: () {
                  setState(() {
                    widget.selectedFilterType = 'plataforma';
                  });
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                title: Text(
                  'plataforma',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),

              // ListTile(
              //   onTap: () {
              //     setState(() {
              //       widget.selectedFilterType = 'genero';
              //     });
              //   },
              //   contentPadding: const EdgeInsets.symmetric(horizontal: 2),
              //   title: Text(
              //     'gênero',
              //     style: Theme.of(context).textTheme.bodyText1,
              //   ),
              // ),

              /////////////////////////////////////
            ] else if (widget.selectedFilterType == 'plataforma') ...[
              InkWell(
                onTap: (() {
                  setState(() {
                    widget.selectedFilter == 'windows'
                        ? widget.selectedFilter = ''
                        : widget.selectedFilter = 'windows';
                    widget.selectFilter(widget.selectedFilter, 'plataforma');
                  });
                }),
                child: SizedBox(
                    height: 40,
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Text(
                          'windows',
                          style: widget.selectedFilter == 'windows'
                              ? Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: AppColors.green1)
                              : Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/img/platforms/windows.svg',
                          width: 18,
                          height: 18,
                          color: widget.selectedFilter == 'windows'
                              ? AppColors.green1
                              : AppColors.white1,
                        ),
                      ],
                    )),
              ),
              InkWell(
                onTap: (() {
                  setState(() {
                    widget.selectedFilter == 'playstation'
                        ? widget.selectedFilter = ''
                        : widget.selectedFilter = 'playstation';
                    widget.selectFilter(widget.selectedFilter, 'plataforma');
                  });
                }),
                child: SizedBox(
                    height: 40,
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Text(
                          'playstation',
                          style: widget.selectedFilter == 'playstation'
                              ? Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: AppColors.green1)
                              : Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/img/platforms/playstation.svg',
                          width: 18,
                          height: 18,
                          color: widget.selectedFilter == 'playstation'
                              ? AppColors.green1
                              : AppColors.white1,
                        ),
                      ],
                    )),
              ),
              InkWell(
                onTap: (() {
                  setState(() {
                    widget.selectedFilter == 'xbox'
                        ? widget.selectedFilter = ''
                        : widget.selectedFilter = 'xbox';
                    widget.selectFilter(widget.selectedFilter, 'plataforma');
                  });
                }),
                child: SizedBox(
                    height: 40,
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Text(
                          'xbox',
                          style: widget.selectedFilter == 'xbox'
                              ? Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: AppColors.green1)
                              : Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/img/platforms/xbox.svg',
                          width: 18,
                          height: 18,
                          color: widget.selectedFilter == 'xbox'
                              ? AppColors.green1
                              : AppColors.white1,
                        ),
                      ],
                    )),
              ),
              InkWell(
                onTap: (() {
                  setState(() {
                    widget.selectedFilter == 'nintendo'
                        ? widget.selectedFilter = ''
                        : widget.selectedFilter = 'nintendo';
                    widget.selectFilter(widget.selectedFilter, 'plataforma');
                  });
                }),
                child: SizedBox(
                    height: 40,
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Text(
                          'nintendo',
                          style: widget.selectedFilter == 'nintendo'
                              ? Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: AppColors.green1)
                              : Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/img/platforms/nintendo.svg',
                          width: 18,
                          height: 18,
                          color: widget.selectedFilter == 'nintendo'
                              ? AppColors.green1
                              : AppColors.white1,
                        ),
                      ],
                    )),
              ),
              InkWell(
                onTap: (() {
                  setState(() {
                    widget.selectedFilter == 'android'
                        ? widget.selectedFilter = ''
                        : widget.selectedFilter = 'android';
                    widget.selectFilter(widget.selectedFilter, 'plataforma');
                  });
                }),
                child: SizedBox(
                    height: 40,
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Text(
                          'android',
                          style: widget.selectedFilter == 'android'
                              ? Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: AppColors.green1)
                              : Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/img/platforms/android.svg',
                          width: 18,
                          height: 18,
                          color: widget.selectedFilter == 'android'
                              ? AppColors.green1
                              : AppColors.white1,
                        ),
                      ],
                    )),
              ),
              InkWell(
                onTap: (() {
                  setState(() {
                    widget.selectedFilter == 'ios'
                        ? widget.selectedFilter = ''
                        : widget.selectedFilter = 'ios';
                    widget.selectFilter(widget.selectedFilter, 'plataforma');
                  });
                }),
                child: SizedBox(
                    height: 40,
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Text(
                          'ios',
                          style: widget.selectedFilter == 'ios'
                              ? Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: AppColors.green1)
                              : Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/img/platforms/ios-mac.svg',
                          width: 18,
                          height: 18,
                          color: widget.selectedFilter == 'ios'
                              ? AppColors.green1
                              : AppColors.white1,
                        ),
                      ],
                    )),
              ),
            ],
          ],
        ],
      ),
    );
  }
}

// Sorry for the size, again!