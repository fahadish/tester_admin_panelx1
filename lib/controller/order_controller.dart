import 'package:get/get.dart';

class OrderController extends GetxController{

List<bool> isSelected = [true,false,false].obs;


void toggle(int newIndex){

  for(int index = 0;index<isSelected.length;index++){
    if(index == newIndex){
      isSelected[index]= !isSelected[index];
    }else{
      isSelected[index]=false;
    }
  }
}

  // RxInt isSelectedIndex = 0.obs;
  // void toggle(int index)=> isSelectedIndex.value=index;
}