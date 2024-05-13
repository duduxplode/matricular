import 'package:test/test.dart';
import 'package:matricular/matricular.dart';

/// tests for TutorControllerApi
void main() {
  final instance = Matricular().getTutorControllerApi();

  group(TutorControllerApi, () {
    // Método utilizado para altlerar os dados de uma entidiade
    //
    //Future<TutorDTO> tutorControllerAlterar(String id, TutorDTO tutorDTO) async
    test('test tutorControllerAlterar', () async {
      // TODO
    });

    // Método utilizado para realizar a inclusão de um entidade
    //
    //Future<TutorDTO> tutorControllerIncluir(TutorDTO tutorDTO) async
    test('test tutorControllerIncluir', () async {
      // TODO
    });

    // Listagem Geral
    //
    //Future<BuiltList<TutorDTO>> tutorControllerListAll() async
    test('test tutorControllerListAll', () async {
      // TODO
    });

    // Listagem Geral paginada
    //
    //Future<PageTutorDTO> tutorControllerListAllPage(Pageable page) async
    test('test tutorControllerListAllPage', () async {
      // TODO
    });

    // Obter os dados completos de uma entidiade pelo id informado!
    //
    //Future<TutorDTO> tutorControllerObterPorId(String id) async
    test('test tutorControllerObterPorId', () async {
      // TODO
    });

    // Método utilizado para remover uma entidiade pela id informado
    //
    //Future<TutorDTO> tutorControllerRemover(String id) async
    test('test tutorControllerRemover', () async {
      // TODO
    });

    // Realiza a busca pelos valores dos campos informados
    //
    //Future<BuiltList<TutorDTO>> tutorControllerSearchFieldsAction(BuiltList<SearchFieldValue> searchFieldValue) async
    test('test tutorControllerSearchFieldsAction', () async {
      // TODO
    });

    // Realiza a busca pelos valores dos campos informados
    //
    //Future<PageTutorDTO> tutorControllerSearchFieldsActionPage(BuiltList<SearchFieldValue> searchFieldValue, { int page, int size, BuiltList<String> sort }) async
    test('test tutorControllerSearchFieldsActionPage', () async {
      // TODO
    });

    // Listagem dos campos de busca
    //
    //Future<BuiltList<SearchField>> tutorControllerSearchFieldsList() async
    test('test tutorControllerSearchFieldsList', () async {
      // TODO
    });
  });
}
