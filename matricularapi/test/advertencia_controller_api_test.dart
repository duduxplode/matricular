import 'package:test/test.dart';
import 'package:matricular/matricular.dart';

/// tests for AdvertenciaControllerApi
void main() {
  final instance = Matricular().getAdvertenciaControllerApi();

  group(AdvertenciaControllerApi, () {
    // Método utilizado para altlerar os dados de uma entidiade
    //
    //Future<AdvertenciaDTO> advertenciaControllerAlterar(PkAdvertencia id, AdvertenciaDTO advertenciaDTO) async
    test('test advertenciaControllerAlterar', () async {
      // TODO
    });

    // Método utilizado para realizar a inclusão de um entidade
    //
    //Future<AdvertenciaDTO> advertenciaControllerIncluir(AdvertenciaDTO advertenciaDTO) async
    test('test advertenciaControllerIncluir', () async {
      // TODO
    });

    // Listagem Geral
    //
    //Future<BuiltList<AdvertenciaDTO>> advertenciaControllerListAll() async
    test('test advertenciaControllerListAll', () async {
      // TODO
    });

    // Listagem Geral paginada
    //
    //Future<PageAdvertenciaDTO> advertenciaControllerListAllPage(Pageable page) async
    test('test advertenciaControllerListAllPage', () async {
      // TODO
    });

    // Obter os dados completos de uma entidiade pelo id informado!
    //
    //Future<AdvertenciaDTO> advertenciaControllerObterPorId(PkAdvertencia id) async
    test('test advertenciaControllerObterPorId', () async {
      // TODO
    });

    // Método utilizado para remover uma entidiade pela id informado
    //
    //Future<AdvertenciaDTO> advertenciaControllerRemover(PkAdvertencia id) async
    test('test advertenciaControllerRemover', () async {
      // TODO
    });

    // Realiza a busca pelos valores dos campos informados
    //
    //Future<BuiltList<AdvertenciaDTO>> advertenciaControllerSearchFieldsAction(BuiltList<SearchFieldValue> searchFieldValue) async
    test('test advertenciaControllerSearchFieldsAction', () async {
      // TODO
    });

    // Realiza a busca pelos valores dos campos informados
    //
    //Future<PageAdvertenciaDTO> advertenciaControllerSearchFieldsActionPage(BuiltList<SearchFieldValue> searchFieldValue, { int page, int size, BuiltList<String> sort }) async
    test('test advertenciaControllerSearchFieldsActionPage', () async {
      // TODO
    });

    // Listagem dos campos de busca
    //
    //Future<BuiltList<SearchField>> advertenciaControllerSearchFieldsList() async
    test('test advertenciaControllerSearchFieldsList', () async {
      // TODO
    });
  });
}
