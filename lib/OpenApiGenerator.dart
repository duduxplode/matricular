// Openapi Generator last run: : 2024-04-15T20:24:28.969250
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