
%%%%%%%%%
%%
%%  @doc htte_t6 - htstub_techempower test 6 implementation
%%
%%  This is a set of HtStub implementations of the 
%%  <a href="http://www.techempower.com/benchmarks/">TechEmpower Web Framework Benchmarks</a>.
%%
%%  Test 6: Static Text





-module(htte_t6).





-export([
    serve/0
]).





%% todo "/plaintext"

serve() ->

    htstub:serve(fun(_) -> 

        {   200, 

            [   { "Date",           htstub:standard_datestring() },
                { "Server",         "htstub"                     },
                { "Content-Type",   "text/plain"                 },
                { "Content-Length", "13"                         }
            ], 

            <<"Hello, World!">>

        } 

    end). 