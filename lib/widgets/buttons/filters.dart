import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:game_finder/constants/app_colors.dart';
import 'package:game_finder/widgets/popups/bottom_sheet_controller.dart';

class Filters extends StatefulWidget {
  const Filters({
    Key? key,
    required this.title,
    this.orderList,
    this.filterList,
  }) : super(key: key);

  final String title;
  final Function(String)? orderList;
  final Function(String)? filterList;

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  String _selectedOrder = '';
  String _selectedFilter = '';
  String _selectedFilterType = '';

  bool _activeOrder = false;
  bool _activeFilter = false;
  bool _clicked = false;
  bool _anySelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        setState(() {
          _clicked = true;
          _showFilters();
        });
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          gradient: const RadialGradient(
            center: Alignment(1, 1),
            radius: 1.1,
            colors: [Color(0xff567899), Color(0xff334960)],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.8),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: _clicked || _activeOrder || _activeFilter
                  ? AppColors.blue4
                  : AppColors.blue1,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SvgPicture.asset(
                  'assets/img/icons/${widget.title}.svg',
                  color: _activeOrder || _activeFilter
                      ? AppColors.green1
                      : AppColors.white1,
                  height: 24,
                  width: 24,
                ),
                const SizedBox(
                  width: 10,
                ),
                if (_activeOrder) ...[
                  Text(
                    'ordenado',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: AppColors.green1),
                  ),
                ] else if (_activeFilter) ...[
                  Text(
                    'filtrado',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: AppColors.green1),
                  ),
                ] else
                  Text(
                    widget.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: AppColors.blue5),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showFilters() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.blue4,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: AppBottomSheet(
                title: widget.title,
                selectedOrder: _selectedOrder,
                selectedFilter: _selectedFilter,
                selectedFilterType: _selectedFilterType,
                selectOrder: _selectOrder,
                selectFilter: _selectFilter,
              ),
            ),
          ],
        );
      },
    ).whenComplete(() {
      if (!_anySelected) {
        setState(() {
          _clicked = false;
        });
      }
    });
  }

  void _selectOrder(String name) {
    Navigator.pop(context);
    setState(() {
      _clicked = false;
      _selectedOrder = name;
      _anySelected = _selectedOrder.isNotEmpty && _selectedOrder != 'null';
      _activeOrder = _selectedOrder.isNotEmpty && _selectedOrder != 'null';

      // if (_anySelected) {
      //   _selectedFilter = 'null';
      //   _selectedFilterType = 'null';
      //   _activeFilter = false;
      //   widget.orderList!(_selectedOrder);
      // }
    });
  }

  void _selectFilter(String name, String parent) {
    Navigator.pop(context);
    setState(() {
      _clicked = false;
      _selectedFilter = name;
      _selectedFilterType = parent;
      _anySelected = _selectedFilter.isNotEmpty && _selectedFilter != 'null';
      _activeFilter = _selectedFilter.isNotEmpty && _selectedFilter != 'null';

      // if (_anySelected) {
      //   _selectedOrder = 'null';
      //   _activeOrder = false;
      //   widget.filterList!(_selectedFilter);
      // }
    });
  }
}
