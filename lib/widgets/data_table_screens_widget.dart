import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/widgets/base_widgets.dart';

class DataTableScreensWidget extends BaseWidget<DashboardController> {
  
  const DataTableScreensWidget( {
    super.key
  } );

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return DataTable (
          columns: const <DataColumn> [
            DataColumn(label: Text("Screen Name", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
            DataColumn(label: Text("Status", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
            DataColumn(label: Text("Online Since", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
            DataColumn(label: Text("Location", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
            DataColumn(label: SizedBox(),),
          ],
          rows: controller.getScreensDetails().map(
            (cell) => DataRow(cells: <DataCell> [
                DataCell(Text(cell.name ?? "", style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
                DataCell(Text(cell.status ?? "", style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
                DataCell(Text(cell.onlineSince ?? "", style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),    
                DataCell(Text(cell.location ?? "", style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),    
                DataCell(
                  IconButton (
                    onPressed: () {
                      controller.onToggleScreenDetailsStatus(cell.id);
                    }, icon: Icon( controller.getStatusEnabledIcon(cell.id) ), 
                  )
                )
            ] ) ).toList(),
        );
      }
    } );
  }
}