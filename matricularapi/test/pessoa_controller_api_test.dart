import 'package:test/test.dart';
import 'package:matricular/matricular.dart';

/// tests for PessoaControllerApi
void main() {
  final instance = Matricular().getPessoaControllerApi();

  group(PessoaControllerApi, () {
    // Método utilizado para altlerar os dados de uma entidiade
    //
    //Future<PessoaDTO> pessoaControllerAlterar(String id, PessoaDTO pessoaDTO) async
    test('test pessoaControllerAlterar', () async {
      // TODO
    });

    // Método utilizado para realizar a inclusão de um entidade
    //
    //Future<PessoaDTO> pessoaControllerIncluir(PessoaDTO pessoaDTO) async
    test('test pessoaControllerIncluir', () async {
      // TODO
    });

    // Listagem Geral
    //
    //Future<BuiltList<PessoaDTO>> pessoaControllerListAll() async
    test('test pessoaControllerListAll', () async {
      // TODO
    });

    // Listagem Geral paginada
    //
    //Future<PagePessoaDTO> pessoaControllerListAllPage(Pageable page) async
    test('test pessoaControllerListAllPage', () async {
      // TODO
    });

    // Obter os dados completos de uma entidiade pelo id informado!
    //
    //Future<PessoaDTO> pessoaControllerObterPorId(String id) async
    test('test pessoaControllerObterPorId', () async {
      // TODO
    });

    // Método utilizado para remover uma entidiade pela id informado
    //
    //Future<PessoaDTO> pessoaControllerRemover(String id) async
    test('test pessoaControllerRemover', () async {
      // TODO
    });

    // Realiza a busca pelos valores dos campos informados
    //
    //Future<BuiltList<PessoaDTO>> pessoaControllerSearchFieldsAction(BuiltList<SearchFieldValue> searchFieldValue) async
    test('test pessoaControllerSearchFieldsAction', () async {
      // TODO
    });

    // Realiza a busca pelos valores dos campos informados
    //
    //Future<PagePessoaDTO> pessoaControllerSearchFieldsActionPage(BuiltList<SearchFieldValue> searchFieldValue, { int page, int size, BuiltList<String> sort }) async
    test('test pessoaControllerSearchFieldsActionPage', () async {
      // TODO
    });

    // Listagem dos campos de busca
    //
    //Future<BuiltList<SearchField>> pessoaControllerSearchFieldsList() async
    test('test pessoaControllerSearchFieldsList', () async {
      // TODO
    });
  });
}
