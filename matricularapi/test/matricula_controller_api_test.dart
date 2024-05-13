import 'package:test/test.dart';
import 'package:matricular/matricular.dart';

/// tests for MatriculaControllerApi
void main() {
  final instance = Matricular().getMatriculaControllerApi();

  group(MatriculaControllerApi, () {
    // Método utilizado para altlerar os dados de uma entidiade
    //
    //Future<MatriculaDTO> matriculaControllerAlterar(int id, MatriculaDTO matriculaDTO) async
    test('test matriculaControllerAlterar', () async {
      // TODO
    });

    // Busca a quantidade de registros
    //
    //Future<MatriculaDTO> matriculaControllerAtualizaContraChequeMatricula(int idMatricula, String tipoDocumento, { MultipartFile multipartFile }) async
    test('test matriculaControllerAtualizaContraChequeMatricula', () async {
      // TODO
    });

    // Busca a quantidade de registros
    //
    //Future<int> matriculaControllerCount(String statusMatricula) async
    test('test matriculaControllerCount', () async {
      // TODO
    });

    // Gera o termo da matricula
    //
    //Future matriculaControllerGerarTermo(int id, String cpfTutor) async
    test('test matriculaControllerGerarTermo', () async {
      // TODO
    });

    //Future<Uint8List> matriculaControllerGetDocumentoMatricula(String caminhodoc) async
    test('test matriculaControllerGetDocumentoMatricula', () async {
      // TODO
    });

    // Busca a quantidade de registros
    //
    //Future<MatriculaVisualizarDTO> matriculaControllerGetMatriculaVisualizar(int idMatricula) async
    test('test matriculaControllerGetMatriculaVisualizar', () async {
      // TODO
    });

    //Future<Uint8List> matriculaControllerGetTermo(String caminhodoc) async
    test('test matriculaControllerGetTermo', () async {
      // TODO
    });

    // Método utilizado para realizar a inclusão de um entidade
    //
    //Future<MatriculaDTO> matriculaControllerIncluir(MatriculaDTO matriculaDTO) async
    test('test matriculaControllerIncluir', () async {
      // TODO
    });

    // Listagem Geral
    //
    //Future<BuiltList<MatriculaDTO>> matriculaControllerListAll() async
    test('test matriculaControllerListAll', () async {
      // TODO
    });

    // Listagem Geral paginada
    //
    //Future<PageMatriculaDTO> matriculaControllerListAllPage(Pageable page) async
    test('test matriculaControllerListAllPage', () async {
      // TODO
    });

    // Busca a quantidade de registros
    //
    //Future<BuiltList<MatriculaListagemDTO>> matriculaControllerListAllPageMatriculaListagemDTO(int offset, int pageSize, String statusMatricula) async
    test('test matriculaControllerListAllPageMatriculaListagemDTO', () async {
      // TODO
    });

    // Busca a quantidade de registros
    //
    //Future<BuiltList<MatriculaListagemDTO>> matriculaControllerListarAlunosPorTurma(int idTurma) async
    test('test matriculaControllerListarAlunosPorTurma', () async {
      // TODO
    });

    // Busca a quantidade de registros
    //
    //Future<BuiltList<MatriculaListagemDTO>> matriculaControllerListarMatriculasListagemPorStatus(String statusMatricula) async
    test('test matriculaControllerListarMatriculasListagemPorStatus', () async {
      // TODO
    });

    // Obter os dados completos de uma entidiade pelo id informado!
    //
    //Future<MatriculaDTO> matriculaControllerObterPorId(int id) async
    test('test matriculaControllerObterPorId', () async {
      // TODO
    });

    // Método utilizado para remover uma entidiade pela id informado
    //
    //Future<MatriculaDTO> matriculaControllerRemover(int id) async
    test('test matriculaControllerRemover', () async {
      // TODO
    });

    // Realiza a busca pelos valores dos campos informados
    //
    //Future<BuiltList<MatriculaDTO>> matriculaControllerSearchFieldsAction(BuiltList<SearchFieldValue> searchFieldValue) async
    test('test matriculaControllerSearchFieldsAction', () async {
      // TODO
    });

    // Realiza a busca pelos valores dos campos informados
    //
    //Future<PageMatriculaDTO> matriculaControllerSearchFieldsActionPage(BuiltList<SearchFieldValue> searchFieldValue, { int page, int size, BuiltList<String> sort }) async
    test('test matriculaControllerSearchFieldsActionPage', () async {
      // TODO
    });

    // Listagem dos campos de busca
    //
    //Future<BuiltList<SearchField>> matriculaControllerSearchFieldsList() async
    test('test matriculaControllerSearchFieldsList', () async {
      // TODO
    });

    //Future<MatriculaDTO> matriculaControllerUploadDocumento(int idMatricula, String tipoDocumento, { MultipartFile multipartFile }) async
    test('test matriculaControllerUploadDocumento', () async {
      // TODO
    });

    //Future<MatriculaDTO> matriculaControllerUploadDocumentos(int idMatricula, { BuiltList<MultipartFile> multipartFile }) async
    test('test matriculaControllerUploadDocumentos', () async {
      // TODO
    });

    // Busca a quantidade de registros
    //
    //Future<MatriculaDTO> matriculaControllerValidaMatricula(MatriculaDTO matriculaDTO) async
    test('test matriculaControllerValidaMatricula', () async {
      // TODO
    });
  });
}
