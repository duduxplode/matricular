# matricular.api.MatriculaControllerApi

## Load the API package
```dart
import 'package:matricular/api.dart';
```

All URIs are relative to *http://200.137.241.49:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**matriculaControllerAlterar**](MatriculaControllerApi.md#matriculacontrolleralterar) | **PUT** /api/v1/matricula/{id} | 
[**matriculaControllerAtualizaContraChequeMatricula**](MatriculaControllerApi.md#matriculacontrolleratualizacontrachequematricula) | **POST** /api/v1/matricula/documento/atualiza-contra-cheque | 
[**matriculaControllerGetDocumentoMatricula**](MatriculaControllerApi.md#matriculacontrollergetdocumentomatricula) | **GET** /api/v1/matricula/documento/{caminhodoc} | 
[**matriculaControllerIncluir**](MatriculaControllerApi.md#matriculacontrollerincluir) | **POST** /api/v1/matricula | 
[**matriculaControllerListAll**](MatriculaControllerApi.md#matriculacontrollerlistall) | **GET** /api/v1/matricula | 
[**matriculaControllerListAllPage**](MatriculaControllerApi.md#matriculacontrollerlistallpage) | **GET** /api/v1/matricula/page | 
[**matriculaControllerObterPorId**](MatriculaControllerApi.md#matriculacontrollerobterporid) | **GET** /api/v1/matricula/{id} | 
[**matriculaControllerRemover**](MatriculaControllerApi.md#matriculacontrollerremover) | **DELETE** /api/v1/matricula/{id} | 
[**matriculaControllerSearchFieldsAction**](MatriculaControllerApi.md#matriculacontrollersearchfieldsaction) | **POST** /api/v1/matricula/search-fields | 
[**matriculaControllerSearchFieldsActionPage**](MatriculaControllerApi.md#matriculacontrollersearchfieldsactionpage) | **POST** /api/v1/matricula/search-fields/page | 
[**matriculaControllerSearchFieldsList**](MatriculaControllerApi.md#matriculacontrollersearchfieldslist) | **GET** /api/v1/matricula/search-fields | 
[**matriculaControllerUploadDocumento**](MatriculaControllerApi.md#matriculacontrolleruploaddocumento) | **POST** /api/v1/matricula/documentos | 
[**matriculaControllerValidaMatricula**](MatriculaControllerApi.md#matriculacontrollervalidamatricula) | **POST** /api/v1/matricula/valida | 


# **matriculaControllerAlterar**
> matriculaControllerAlterar(id, matriculaDTO)



Método utilizado para altlerar os dados de uma entidiade

### Example
```dart
import 'package:matricular/api.dart';

final api = Matricular().getMatriculaControllerApi();
final int id = 789; // int | 
final MatriculaDTO matriculaDTO = ; // MatriculaDTO | 

try {
    api.matriculaControllerAlterar(id, matriculaDTO);
} catch on DioException (e) {
    print('Exception when calling MatriculaControllerApi->matriculaControllerAlterar: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **matriculaDTO** | [**MatriculaDTO**](MatriculaDTO.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matriculaControllerAtualizaContraChequeMatricula**
> MatriculaDTO matriculaControllerAtualizaContraChequeMatricula(idMatricula, tipoDocumento, multipartFile)



### Example
```dart
import 'package:matricular/api.dart';

final api = Matricular().getMatriculaControllerApi();
final int idMatricula = 789; // int | 
final String tipoDocumento = tipoDocumento_example; // String | 
final MultipartFile multipartFile = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.matriculaControllerAtualizaContraChequeMatricula(idMatricula, tipoDocumento, multipartFile);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MatriculaControllerApi->matriculaControllerAtualizaContraChequeMatricula: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idMatricula** | **int**|  | 
 **tipoDocumento** | **String**|  | 
 **multipartFile** | **MultipartFile**|  | [optional] 

### Return type

[**MatriculaDTO**](MatriculaDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matriculaControllerGetDocumentoMatricula**
> Uint8List matriculaControllerGetDocumentoMatricula(caminhodoc)



### Example
```dart
import 'package:matricular/api.dart';

final api = Matricular().getMatriculaControllerApi();
final String caminhodoc = caminhodoc_example; // String | 

try {
    final response = api.matriculaControllerGetDocumentoMatricula(caminhodoc);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MatriculaControllerApi->matriculaControllerGetDocumentoMatricula: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **caminhodoc** | **String**|  | 

### Return type

[**Uint8List**](Uint8List.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matriculaControllerIncluir**
> matriculaControllerIncluir(matriculaDTO)



Método utilizado para realizar a inclusão de um entidade

### Example
```dart
import 'package:matricular/api.dart';

final api = Matricular().getMatriculaControllerApi();
final MatriculaDTO matriculaDTO = ; // MatriculaDTO | 

try {
    api.matriculaControllerIncluir(matriculaDTO);
} catch on DioException (e) {
    print('Exception when calling MatriculaControllerApi->matriculaControllerIncluir: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matriculaDTO** | [**MatriculaDTO**](MatriculaDTO.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matriculaControllerListAll**
> matriculaControllerListAll()



Listagem Geral

### Example
```dart
import 'package:matricular/api.dart';

final api = Matricular().getMatriculaControllerApi();

try {
    api.matriculaControllerListAll();
} catch on DioException (e) {
    print('Exception when calling MatriculaControllerApi->matriculaControllerListAll: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matriculaControllerListAllPage**
> matriculaControllerListAllPage(page)



Listagem Geral paginada

### Example
```dart
import 'package:matricular/api.dart';

final api = Matricular().getMatriculaControllerApi();
final Pageable page = ; // Pageable | 

try {
    api.matriculaControllerListAllPage(page);
} catch on DioException (e) {
    print('Exception when calling MatriculaControllerApi->matriculaControllerListAllPage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | [**Pageable**](.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matriculaControllerObterPorId**
> matriculaControllerObterPorId(id)



Obter os dados completos de uma entidiade pelo id informado!

### Example
```dart
import 'package:matricular/api.dart';

final api = Matricular().getMatriculaControllerApi();
final int id = 789; // int | 

try {
    api.matriculaControllerObterPorId(id);
} catch on DioException (e) {
    print('Exception when calling MatriculaControllerApi->matriculaControllerObterPorId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matriculaControllerRemover**
> matriculaControllerRemover(id)



Método utilizado para remover uma entidiade pela id informado

### Example
```dart
import 'package:matricular/api.dart';

final api = Matricular().getMatriculaControllerApi();
final int id = 789; // int | 

try {
    api.matriculaControllerRemover(id);
} catch on DioException (e) {
    print('Exception when calling MatriculaControllerApi->matriculaControllerRemover: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matriculaControllerSearchFieldsAction**
> matriculaControllerSearchFieldsAction(searchFieldValue)



Realiza a busca pelos valores dos campos informados

### Example
```dart
import 'package:matricular/api.dart';

final api = Matricular().getMatriculaControllerApi();
final BuiltList<SearchFieldValue> searchFieldValue = ; // BuiltList<SearchFieldValue> | 

try {
    api.matriculaControllerSearchFieldsAction(searchFieldValue);
} catch on DioException (e) {
    print('Exception when calling MatriculaControllerApi->matriculaControllerSearchFieldsAction: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchFieldValue** | [**BuiltList&lt;SearchFieldValue&gt;**](SearchFieldValue.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matriculaControllerSearchFieldsActionPage**
> matriculaControllerSearchFieldsActionPage(searchFieldValue, page, size, sort)



Realiza a busca pelos valores dos campos informados

### Example
```dart
import 'package:matricular/api.dart';

final api = Matricular().getMatriculaControllerApi();
final BuiltList<SearchFieldValue> searchFieldValue = ; // BuiltList<SearchFieldValue> | 
final int page = 56; // int | 
final int size = 56; // int | 
final BuiltList<String> sort = ; // BuiltList<String> | 

try {
    api.matriculaControllerSearchFieldsActionPage(searchFieldValue, page, size, sort);
} catch on DioException (e) {
    print('Exception when calling MatriculaControllerApi->matriculaControllerSearchFieldsActionPage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchFieldValue** | [**BuiltList&lt;SearchFieldValue&gt;**](SearchFieldValue.md)|  | 
 **page** | **int**|  | [optional] [default to 0]
 **size** | **int**|  | [optional] [default to 5]
 **sort** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] [default to ListBuilder()]

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matriculaControllerSearchFieldsList**
> BuiltList<SearchField> matriculaControllerSearchFieldsList()



Listagem dos campos de busca

### Example
```dart
import 'package:matricular/api.dart';

final api = Matricular().getMatriculaControllerApi();

try {
    final response = api.matriculaControllerSearchFieldsList();
    print(response);
} catch on DioException (e) {
    print('Exception when calling MatriculaControllerApi->matriculaControllerSearchFieldsList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;SearchField&gt;**](SearchField.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matriculaControllerUploadDocumento**
> MatriculaDTO matriculaControllerUploadDocumento(idMatricula, tipoDocumento, multipartFile)



### Example
```dart
import 'package:matricular/api.dart';

final api = Matricular().getMatriculaControllerApi();
final int idMatricula = 789; // int | 
final String tipoDocumento = tipoDocumento_example; // String | 
final MultipartFile multipartFile = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.matriculaControllerUploadDocumento(idMatricula, tipoDocumento, multipartFile);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MatriculaControllerApi->matriculaControllerUploadDocumento: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idMatricula** | **int**|  | 
 **tipoDocumento** | **String**|  | 
 **multipartFile** | **MultipartFile**|  | [optional] 

### Return type

[**MatriculaDTO**](MatriculaDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matriculaControllerValidaMatricula**
> MatriculaDTO matriculaControllerValidaMatricula(matriculaDTO)



### Example
```dart
import 'package:matricular/api.dart';

final api = Matricular().getMatriculaControllerApi();
final MatriculaDTO matriculaDTO = ; // MatriculaDTO | 

try {
    final response = api.matriculaControllerValidaMatricula(matriculaDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MatriculaControllerApi->matriculaControllerValidaMatricula: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matriculaDTO** | [**MatriculaDTO**](MatriculaDTO.md)|  | 

### Return type

[**MatriculaDTO**](MatriculaDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
