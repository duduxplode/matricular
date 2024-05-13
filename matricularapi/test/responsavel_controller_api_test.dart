import 'package:test/test.dart';
import 'package:matricular/matricular.dart';

/// tests for ResponsavelControllerApi
void main() {
  final instance = Matricular().getResponsavelControllerApi();

  group(ResponsavelControllerApi, () {
    // Método utilizado para altlerar os dados de uma entidiade
    //
    //Future<ResponsavelDTO> responsavelControllerAlterar(PkResponsavel id, ResponsavelDTO responsavelDTO) async
    test('test responsavelControllerAlterar', () async {
      // TODO
    });

    // Método utilizado para realizar a inclusão de um entidade
    //
    //Future<ResponsavelDTO> responsavelControllerIncluir(ResponsavelDTO responsavelDTO) async
    test('test responsavelControllerIncluir', () async {
      // TODO
    });

    // Listagem Geral
    //
    //Future<BuiltList<ResponsavelDTO>> responsavelControllerListAll() async
    test('test responsavelControllerListAll', () async {
      // TODO
    });

    // Listagem Geral paginada
    //
    //Future<PageResponsavelDTO> responsavelControllerListAllPage(Pageable page) async
    test('test responsavelControllerListAllPage', () async {
      // TODO
    });

    // Obter os dados completos de uma entidiade pelo id informado!
    //
    //Future<ResponsavelDTO> responsavelControllerObterPorId(PkResponsavel id) async
    test('test responsavelControllerObterPorId', () async {
      // TODO
    });

    // Método utilizado para remover uma entidiade pela id informado
    //
    //Future<ResponsavelDTO> responsavelControllerRemover(PkResponsavel id) async
    test('test responsavelControllerRemover', () async {
      // TODO
    });

    // Realiza a busca pelos valores dos campos informados
    //
    //Future<BuiltList<ResponsavelDTO>> responsavelControllerSearchFieldsAction(BuiltList<SearchFieldValue> searchFieldValue) async
    test('test responsavelControllerSearchFieldsAction', () async {
      // TODO
    });

    // Realiza a busca pelos valores dos campos informados
    //
    //Future<PageResponsavelDTO> responsavelControllerSearchFieldsActionPage(BuiltList<SearchFieldValue> searchFieldValue, { int page, int size, BuiltList<String> sort }) async
    test('test responsavelControllerSearchFieldsActionPage', () async {
      // TODO
    });

    // Listagem dos campos de busca
    //
    //Future<BuiltList<SearchField>> responsavelControllerSearchFieldsList() async
    test('test responsavelControllerSearchFieldsList', () async {
      // TODO
    });
  });
}
