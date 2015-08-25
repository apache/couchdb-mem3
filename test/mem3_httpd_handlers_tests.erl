% Licensed under the Apache License, Version 2.0 (the "License"); you may not
% use this file except in compliance with the License.  You may obtain a copy of
% the License at
%
%   http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
% WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
% License for the specific language governing permissions and limitations under
% the License.

-module(mem3_httpd_handlers_tests).

-export([handlers/1]).

-include_lib("couch/include/couch_eunit.hrl").

handlers(url_handler) ->
    [
        {<<"_membership">>, mem3_httpd, handle_membership_req}
    ];
handlers(db_handler) ->
    [
        {<<"_shards">>, mem3_httpd, handle_shards_req}
    ];
handlers(design_handler) ->
    [].

mem3_endpoints_test_() ->
    Apps = [couch_epi, mem3],
    chttpd_httpd_handlers_test_util:endpoints_test(mem3, ?MODULE, Apps).
