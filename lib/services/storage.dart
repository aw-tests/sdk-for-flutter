

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import "../client.dart";
import '../enums.dart';
import "../service.dart";

class Storage extends Service {
    Storage(Client client): super(client);

     /// List Files
    Future<Response> listFiles({String search = '', int limit = 25, int offset = 0, OrderType orderType = OrderType.asc}) {
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
    Future<Response> createFile({@required MultipartFile file, @required List read, @required List write}) {
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
    Future<Response> getFile({@required String fileId}) {
        final String path = '/storage/files/{fileId}'.replaceAll(RegExp('{fileId}'), fileId);

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.get, path: path, params: params, headers: headers);
    }

     /// Update File
    Future<Response> updateFile({@required String fileId, @required List read, @required List write}) {
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
    Future<Response> deleteFile({@required String fileId}) {
        final String path = '/storage/files/{fileId}'.replaceAll(RegExp('{fileId}'), fileId);

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.delete, path: path, params: params, headers: headers);
    }

     /// Get File for Download
    String getFileDownload({@required String fileId}) {
        final String path = '/storage/files/{fileId}/download'.replaceAll(RegExp('{fileId}'), fileId);

        final Map<String, dynamic> params = {
            'project': client.config['project'],
        };

        Uri endpoint = Uri.parse(client.endPoint);
        Uri location = new Uri(scheme: endpoint.scheme,
          host: endpoint.host,
          port: endpoint.port,
          path: endpoint.path + path,
          queryParameters:params,
        );

        return location.toString();
    }

     /// Get File Preview
    String getFilePreview({@required String fileId, int width = 0, int height = 0, int quality = 100, String background = '', String output = ''}) {
        final String path = '/storage/files/{fileId}/preview'.replaceAll(RegExp('{fileId}'), fileId);

        final Map<String, dynamic> params = {
            'width': width,
            'height': height,
            'quality': quality,
            'background': background,
            'output': output,
            'project': client.config['project'],
        };

        Uri endpoint = Uri.parse(client.endPoint);
        Uri location = new Uri(scheme: endpoint.scheme,
          host: endpoint.host,
          port: endpoint.port,
          path: endpoint.path + path,
          queryParameters:params,
        );

        return location.toString();
    }

     /// Get File for View
    String getFileView({@required String fileId, String as = ''}) {
        final String path = '/storage/files/{fileId}/view'.replaceAll(RegExp('{fileId}'), fileId);

        final Map<String, dynamic> params = {
            'as': as,
            'project': client.config['project'],
        };

        Uri endpoint = Uri.parse(client.endPoint);
        Uri location = new Uri(scheme: endpoint.scheme,
          host: endpoint.host,
          port: endpoint.port,
          path: endpoint.path + path,
          queryParameters:params,
        );

        return location.toString();
    }
}