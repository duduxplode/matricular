import 'package:test/test.dart';
import 'package:matricular/matricular.dart';

/// tests for TurmaControllerApi
void main() {
  final instance = Matricular().getTurmaControllerApi();

  group(TurmaControllerApi, () {
    //Future<TurmaDTO> turmaControllerAdicionaAlunos(int idTurma, BuiltList<int> requestBody) async
    test('test turmaControllerAdicionaAlunos', () async {
      // TODO
    });

    // Método utilizado para altlerar os dados de uma entidiade
    //
    //Future<TurmaDTO> turmaControllerAlterar(int id, TurmaDTO turmaDTO) async
    test('test turmaControllerAlterar', () async {
      // TODO
    });

    // Método utilizado para realizar a inclusão de um entidade
    //
    //Future<TurmaDTO> turmaControllerIncluir(TurmaDTO turmaDTO) async
    test('test turmaControllerIncluir', () async {
      // TODO
    });

    // Listagem Geral
    //
    //Future<BuiltList<TurmaDTO>> turmaControllerListAll() async
    test('test turmaControllerListAll', () async {
      // TODO
    });

    // Listagem Geral paginada
    //
    //Future<PageTurmaDTO> turmaControllerListAllPage(Pageable page) async
    test('test turmaControllerListAllPage', () async {
      // TODO
    });

    // Obter os dados completos de uma entidiade pelo id informado!
    //
    //Future<TurmaDTO> turmaControllerObterPorId(int id) async
    test('test turmaControllerObterPorId', () async {
      // TODO
    });

    // Método utilizado para remover uma entidiade pela id informado
    //
    //Future<TurmaDTO> turmaControllerRemover(int id) async
    test('test turmaControllerRemover', () async {
      // TODO
    });

    // Realiza a busca pelos valores dos campos informados
    //
    //Future<BuiltList<TurmaDTO>> turmaControllerSearchFieldsAction(BuiltList<SearchFieldValue> searchFieldValue) async
    test('test turmaControllerSearchFieldsAction', () async {
      // TODO
    });

    // Realiza a busca pelos valores dos campos informados
    //
    //Future<PageTurmaDTO> turmaControllerSearchFieldsActionPage(BuiltList<SearchFieldValue> searchFieldValue, { int page, int size, BuiltList<String> sort }) async
    test('test turmaControllerSearchFieldsActionPage', () async {
      // TODO
    });

    // Listagem dos campos de busca
    //
    //Future<BuiltList<SearchField>> turmaControllerSearchFieldsList() async
    test('test turmaControllerSearchFieldsList', () async {
      // TODO
    });
  });
}
