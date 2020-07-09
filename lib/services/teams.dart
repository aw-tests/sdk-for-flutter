

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import "../client.dart";
import '../enums.dart';
import "../service.dart";

class Teams extends Service {
    Teams(Client client): super(client);

     /// List Teams
    Future<Response> list({String search = '', int limit = 25, int offset = 0, OrderType orderType = OrderType.asc}) {
        final String path = '/teams';

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

     /// Create Team
    Future<Response> create({@required String name, List roles = const ["owner"]}) {
        final String path = '/teams';

        final Map<String, dynamic> params = {
            'name': name,
            'roles': roles,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.post, path: path, params: params, headers: headers);
    }

     /// Get Team
    Future<Response> get({@required String teamId}) {
        final String path = '/teams/{teamId}'.replaceAll(RegExp('{teamId}'), teamId);

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.get, path: path, params: params, headers: headers);
    }

     /// Update Team
    Future<Response> update({@required String teamId, @required String name}) {
        final String path = '/teams/{teamId}'.replaceAll(RegExp('{teamId}'), teamId);

        final Map<String, dynamic> params = {
            'name': name,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.put, path: path, params: params, headers: headers);
    }

     /// Delete Team
    Future<Response> delete({@required String teamId}) {
        final String path = '/teams/{teamId}'.replaceAll(RegExp('{teamId}'), teamId);

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.delete, path: path, params: params, headers: headers);
    }

     /// Get Team Memberships
    Future<Response> getMemberships({@required String teamId, String search = '', int limit = 25, int offset = 0, OrderType orderType = OrderType.asc}) {
        final String path = '/teams/{teamId}/memberships'.replaceAll(RegExp('{teamId}'), teamId);

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

     /// Create Team Membership
    Future<Response> createMembership({@required String teamId, @required String email, @required List roles, @required String url, String name = ''}) {
        final String path = '/teams/{teamId}/memberships'.replaceAll(RegExp('{teamId}'), teamId);

        final Map<String, dynamic> params = {
            'email': email,
            'name': name,
            'roles': roles,
            'url': url,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.post, path: path, params: params, headers: headers);
    }

     /// Delete Team Membership
    Future<Response> deleteMembership({@required String teamId, @required String inviteId}) {
        final String path = '/teams/{teamId}/memberships/{inviteId}'.replaceAll(RegExp('{teamId}'), teamId).replaceAll(RegExp('{inviteId}'), inviteId);

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.delete, path: path, params: params, headers: headers);
    }

     /// Update Team Membership Status
    Future<Response> updateMembershipStatus({@required String teamId, @required String inviteId, @required String userId, @required String secret}) {
        final String path = '/teams/{teamId}/memberships/{inviteId}/status'.replaceAll(RegExp('{teamId}'), teamId).replaceAll(RegExp('{inviteId}'), inviteId);

        final Map<String, dynamic> params = {
            'userId': userId,
            'secret': secret,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.patch, path: path, params: params, headers: headers);
    }
}