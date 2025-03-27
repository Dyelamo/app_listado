import 'package:app_listado/models/tareas_model.dart';
import 'package:app_listado/service/api_service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TareasController extends GetxController {

  final ApiService apiService = ApiService();
  var isLoading = true.obs;
  var tareasList = <Tarea>[].obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;


  @override
  void onInit() {
 
    super.onInit();
    fetchTareas();
  }



  Future<void> fetchTareas() async {
    try {
      isLoading(true);
      hasError(false);
      errorMessage('');
      tareasList.value = await apiService.getTareas();
    } catch (e) {
      hasError(true);
      errorMessage('Error al cargar las tareas: $e');
    } finally {
      isLoading(false);
    }
  }

  
  
  
}