import 'package:chopper/chopper.dart';

// Source code generation in Dart works by creating a new file which contains a "companion class".
// In order for the source gen to know which file to generate and which files are "linked", you need to use the part keyword.
part 'post_service_api.chopper.dart';

@ChopperApi(baseUrl: 'https://jsonplaceholder.typicode.com/posts')
abstract class PostApiService extends ChopperService {
  @Get(headers: {'Constant-Header-Name': 'Header-Value'})
  Future<Response> getPosts([
    // Parameter headers are suitable for ones which values need to change
    @Header('Changeable-Header-Name') String headerValue,
  ]);

  // Put & Patch requests are specified the same way - they must contain the @Body
  @Post()
  Future<Response> postPost(
      @Body() Map<String, dynamic> body,
      );
}