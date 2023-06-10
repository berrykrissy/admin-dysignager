import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/widgets/base_widgets.dart';

class DataTableContentsWidget extends BaseWidget<DashboardController> {
  
  const DataTableContentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return DataTable (
          columns: const <DataColumn> [
            DataColumn(label: Text("Client", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
            DataColumn(label: Text("Start Date", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
            DataColumn(label: Text("End Date", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
            DataColumn(label: Text("Duration", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
            DataColumn(label: Text("File Name", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
          ],
          rows : controller.getContentsDetails().map(
            (cell) => DataRow(cells: <DataCell> [
                DataCell(Text(cell.client ?? "", style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
                DataCell(Text(cell.startDate ?? "", style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),
                DataCell(Text(cell.endDate ?? "", style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),    
                DataCell(Text(cell.duration ?? "", style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),    
                DataCell(Text(cell.fileName ?? "", style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),),    
            ] ) ).toList(),
        );
      }
    } );
  }
}