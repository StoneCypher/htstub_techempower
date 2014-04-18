
%%%%%%%%%
%%
%%  @doc htte_t1 - htstub_techempower test 1 implementation
%%
%%  This is a set of HtStub implementations of the 
%%  <a href="http://www.techempower.com/benchmarks/">TechEmpower Web Framework Benchmarks</a>.
%%
%%  Test 1: JSON Serialization





-module(htte_t1).





-export([
    serve/0
]).





%% todo "/json"

serve() ->

    htstub:serve(fun(_) -> 

        % the contest requires the json to be dynamically generated
        Response = crap_json:to_json([ {<<"message">>, <<"Hello, World!">>} ]),

        {   200, 

            [   { "Date",           htstub:standard_datestring()    },
                { "Content-Type",   "application/json"              },
                { "Server",         "htstub"                        },
                { "Content-Length", integer_to_list(size(Response)) }
            ], 

            Response

        } 

    end). 