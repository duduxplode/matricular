import 'package:test/test.dart';
import 'package:matricular/matricular.dart';

/// tests for NecessidadeEspecialControllerApi
void main() {
  final instance = Matricular().getNecessidadeEspecialControllerApi();

  group(NecessidadeEspecialControllerApi, () {
    // Método utilizado para altlerar os dados de uma entidiade
    //
    //Future<NecessidadeEspecialDTO> necessidadeEspecialControllerAlterar(int id, NecessidadeEspecialDTO necessidadeEspecialDTO) async
    test('test necessidadeEspecialControllerAlterar', () async {
      // TODO
    });

    // Método utilizado para realizar a inclusão de um entidade
    //
    //Future<NecessidadeEspecialDTO> necessidadeEspecialControllerIncluir(NecessidadeEspecialDTO necessidadeEspecialDTO) async
    test('test necessidadeEspecialControllerIncluir', () async {
      // TODO
    });

    // Listagem Geral
    //
    //Future<BuiltList<NecessidadeEspecialDTO>> necessidadeEspecialControllerListAll() async
    test('test necessidadeEspecialControllerListAll', () async {
      // TODO
    });

    // Listagem Geral paginada
    //
    //Future<PageNecessidadeEspecialDTO> necessidadeEspecialControllerListAllPage(Pageable page) async
    test('test necessidadeEspecialControllerListAllPage', () async {
      // TODO
    });

    // Obter os dados completos de uma entidiade pelo id informado!
    //
    //Future<NecessidadeEspecialDTO> necessidadeEspecialControllerObterPorId(int id) async
    test('test necessidadeEspecialControllerObterPorId', () async {
      // TODO
    });

    // Método utilizado para remover uma entidiade pela id informado
    //
    //Future<NecessidadeEspecialDTO> necessidadeEspecialControllerRemover(int id) async
    test('test necessidadeEspecialControllerRemover', () async {
      // TODO
    });

    // Realiza a busca pelos valores dos campos informados
    //
    //Future<BuiltList<NecessidadeEspecialDTO>> necessidadeEspecialControllerSearchFieldsAction(BuiltList<SearchFieldValue> searchFieldValue) async
    test('test necessidadeEspecialControllerSearchFieldsAction', () async {
      // TODO
    });

    // Realiza a busca pelos valores dos campos informados
    //
    //Future<PageNecessidadeEspecialDTO> necessidadeEspecialControllerSearchFieldsActionPage(BuiltList<SearchFieldValue> searchFieldValue, { int page, int size, BuiltList<String> sort }) async
    test('test necessidadeEspecialControllerSearchFieldsActionPage', () async {
      // TODO
    });

    // Listagem dos campos de busca
    //
    //Future<BuiltList<SearchField>> necessidadeEspecialControllerSearchFieldsList() async
    test('test necessidadeEspecialControllerSearchFieldsList', () async {
      // TODO
    });
  });
}
