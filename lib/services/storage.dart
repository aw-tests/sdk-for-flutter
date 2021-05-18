part of appwrite;


class Storage extends Service {
    Storage(Client client): super(client);

     /// List Files
     ///
     /// Get a list of all the user files. You can use the query params to filter
     /// your results. On admin mode, this endpoint will return a list of all of the
     /// project's files. [Learn more about different API modes](/docs/admin).
     ///
    Future<Response> listFiles({String search = &#039;&#039;, int limit = 25, int offset = 0, OrderType orderType = OrderType.asc}) {
        final String path = '/storage/files';

        final Map<String, dynamic> params = {
            'search': search,
            'limit': limit,
            'offset': offset,
            'orderType': orderType.name(),
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.get, path: path, params: params, headers: headers);
    }

     /// Create File
     ///
     /// Create a new file. The user who creates the file will automatically be
     /// assigned to read and write access unless he has passed custom values for
     /// read and write arguments.
     ///
    Future<Response> createFile({required MultipartFile file, List read = const [], List write = const []}) {
        final String path = '/storage/files';

        final Map<String, dynamic> params = {
            'file': file,
            'read': read,
            'write': write,
        };

        final Map<String, String> headers = {
            'content-type': 'multipart/form-data',
        };

        return client.call(HttpMethod.post, path: path, params: params, headers: headers);
    }

     /// Get File
     ///
     /// Get a file by its unique ID. This endpoint response returns a JSON object
     /// with the file metadata.
     ///
    Future<Response> getFile({required String fileId}) {
        final String path = '/storage/files/{fileId}'.replaceAll(RegExp('{fileId}'), fileId);

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.get, path: path, params: params, headers: headers);
    }

     /// Update File
     ///
     /// Update a file by its unique ID. Only users with write permissions have
     /// access to update this resource.
     ///
    Future<Response> updateFile({required String fileId, required List read, required List write}) {
        final String path = '/storage/files/{fileId}'.replaceAll(RegExp('{fileId}'), fileId);

        final Map<String, dynamic> params = {
            'read': read,
            'write': write,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.put, path: path, params: params, headers: headers);
    }

     /// Delete File
     ///
     /// Delete a file by its unique ID. Only users with write permissions have
     /// access to delete this resource.
     ///
    Future<Response> deleteFile({required String fileId}) {
        final String path = '/storage/files/{fileId}'.replaceAll(RegExp('{fileId}'), fileId);

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.delete, path: path, params: params, headers: headers);
    }

     /// Get File for Download
     ///
     /// Get a file content by its unique ID. The endpoint response return with a
     /// 'Content-Disposition: attachment' header that tells the browser to start
     /// downloading the file to user downloads directory.
     ///
    Future<Response> getFileDownload({required String fileId}) {
        final String path = '/storage/files/{fileId}/download'.replaceAll(RegExp('{fileId}'), fileId);

        final Map<String, dynamic> params = {
            'project': client.config['project'],
            'jwt': client.config['jwt'],
        };

        params.keys.forEach((key) {if (params[key] is int || params[key] is double) {
          params[key] = params[key].toString();
        }});

        return client.call(HttpMethod.get, path: path, params: params, responseType: ResponseType.bytes);
    }

     /// Get File Preview
     ///
     /// Get a file preview image. Currently, this method supports preview for image
     /// files (jpg, png, and gif), other supported formats, like pdf, docs, slides,
     /// and spreadsheets, will return the file icon image. You can also pass query
     /// string arguments for cutting and resizing your preview image.
     ///
    Future<Response> getFilePreview({required String fileId, int width = 0, int height = 0, int quality = 100, int borderWidth = 0, String borderColor = &#039;&#039;, int borderRadius = 0, int opacity = 1, int rotation = 0, String background = &#039;&#039;, String output = &#039;&#039;}) {
        final String path = '/storage/files/{fileId}/preview'.replaceAll(RegExp('{fileId}'), fileId);

        final Map<String, dynamic> params = {
            'width': width,
            'height': height,
            'quality': quality,
            'borderWidth': borderWidth,
            'borderColor': borderColor,
            'borderRadius': borderRadius,
            'opacity': opacity,
            'rotation': rotation,
            'background': background,
            'output': output,
            'project': client.config['project'],
            'jwt': client.config['jwt'],
        };

        params.keys.forEach((key) {if (params[key] is int || params[key] is double) {
          params[key] = params[key].toString();
        }});

        return client.call(HttpMethod.get, path: path, params: params, responseType: ResponseType.bytes);
    }

     /// Get File for View
     ///
     /// Get a file content by its unique ID. This endpoint is similar to the
     /// download method but returns with no  'Content-Disposition: attachment'
     /// header.
     ///
    Future<Response> getFileView({required String fileId}) {
        final String path = '/storage/files/{fileId}/view'.replaceAll(RegExp('{fileId}'), fileId);

        final Map<String, dynamic> params = {
            'project': client.config['project'],
            'jwt': client.config['jwt'],
        };

        params.keys.forEach((key) {if (params[key] is int || params[key] is double) {
          params[key] = params[key].toString();
        }});

        return client.call(HttpMethod.get, path: path, params: params, responseType: ResponseType.bytes);
    }
}