
%%%%%%%%%
%%
%%  @doc htte_t2_mnesia - htstub_techempower test 2 implementation
%%
%%  This is a set of HtStub implementations of the 
%%  <a href="http://www.techempower.com/benchmarks/">TechEmpower Web Framework Benchmarks</a>.
%%
%%  Test 2: Single Database Query - Mnesia edition





-module(htte_t2_mnesia).





-export([

    init/0,
      is_already_init/0,

    start/0,

    serve/0

]).





-record(htte_t2_mnesia_store, {

}).





is_already_init() ->

    false.





init() ->

    case is_already_init() of

        true ->
            { error, already_init };

        false ->
            mnesia:create_table(htte_t2_mnesia_store, [
                { access_mode, read_write },
                { disc_copies, [node()]   },

            ])

    end.





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