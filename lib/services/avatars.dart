

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import "../client.dart";
import '../enums.dart';
import "../service.dart";

class Avatars extends Service {
    Avatars(Client client): super(client);

     /// Get Browser Icon
    String getBrowser({@required String code, int width = 100, int height = 100, int quality = 100}) {
        final String path = '/avatars/browsers/{code}'.replaceAll(RegExp('{code}'), code);

        final Map<String, dynamic> params = {
            'width': width,
            'height': height,
            'quality': quality,
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

     /// Get Credit Card Icon
    String getCreditCard({@required String code, int width = 100, int height = 100, int quality = 100}) {
        final String path = '/avatars/credit-cards/{code}'.replaceAll(RegExp('{code}'), code);

        final Map<String, dynamic> params = {
            'width': width,
            'height': height,
            'quality': quality,
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

     /// Get Favicon
    String getFavicon({@required String url}) {
        final String path = '/avatars/favicon';

        final Map<String, dynamic> params = {
            'url': url,
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

     /// Get Country Flag
    String getFlag({@required String code, int width = 100, int height = 100, int quality = 100}) {
        final String path = '/avatars/flags/{code}'.replaceAll(RegExp('{code}'), code);

        final Map<String, dynamic> params = {
            'width': width,
            'height': height,
            'quality': quality,
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

     /// Get Image from URL
    String getImage({@required String url, int width = 400, int height = 400}) {
        final String path = '/avatars/image';

        final Map<String, dynamic> params = {
            'url': url,
            'width': width,
            'height': height,
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

     /// Get User Initials
    String getInitials({String name = '', int width = 500, int height = 500, String color = '', String background = ''}) {
        final String path = '/avatars/initials';

        final Map<String, dynamic> params = {
            'name': name,
            'width': width,
            'height': height,
            'color': color,
            'background': background,
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

     /// Get QR Code
    String getQR({@required String text, int size = 400, int margin = 1, bool download = false}) {
        final String path = '/avatars/qr';

        final Map<String, dynamic> params = {
            'text': text,
            'size': size,
            'margin': margin,
            'download': download,
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