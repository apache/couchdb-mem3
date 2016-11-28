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

-module(mem3_httpd_handlers).

-export([url_handler/1, db_handler/1, design_handler/1, endpoints/1]).

url_handler(<<"_membership">>) -> fun mem3_httpd:handle_membership_req/1;
url_handler(_) -> no_match.

db_handler(<<"_shards">>) -> fun mem3_httpd:handle_shards_req/2;
db_handler(_) -> no_match.

design_handler(_) -> no_match.

endpoints(url_handler) ->
    [
        <<"_membership">>
    ];
endpoints(db_handler) ->
    [
        <<"_shards">>
    ];
endpoints(design_handler) ->
    [].

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

mem3_endpoints_test_() ->
    Apps = [couch_epi, mem3],
    chttpd_httpd_handlers_test_util:endpoints_test(mem3, ?MODULE, Apps).

-endif.
