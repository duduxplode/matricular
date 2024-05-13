// Openapi Generator last run: : 2024-05-13T15:31:53.261355
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  additionalProperties: DioProperties(pubName: 'matricular', pubAuthor: 'Aluno'),
  inputSpec: InputSpec(path: 'matricularapi/api-docs.json'),
  //typeMappings: {'Pet': 'ExamplePet'},
  generatorName: Generator.dio,
  runSourceGenOnOutput: true,
  outputDirectory: 'matricularapi',
)
class OpenApigenerator {}