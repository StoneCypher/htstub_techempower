
%%%%%%%%%
%%
%%  @doc htte_t2_mnesia_raw - htstub_techempower test 2 implementation
%%
%%  This is a set of HtStub implementations of the 
%%  <a href="http://www.techempower.com/benchmarks/">TechEmpower Web Framework Benchmarks</a>.
%%
%%  Test 2: Single Database Query - Mnesia edition
%%
%%  This implementation does not use an ORM and therefore should be marked "raw" under test 2 rules.





-module(htte_t2_mnesia_raw).





-export([

    init/0,
      is_already_init/0,

    start/0,

    serve/0

]).





-record(htte_t2_mnesia_store_raw, {

    id,
    rnd

}).





start() ->

    application:start(mnesia).





is_already_init() ->

    false.





init() ->

    case is_already_init() of

        true ->
            { error, already_init };

        false ->

            mnesia:transaction(fun() ->

                { atomic, ok } = mnesia:create_table(htte_t2_mnesia_store_raw, [

                    { type,        set                      },
                    { access_mode, read_write               },
                    { disc_copies, [node()]                 },
                    { record_name, htte_t2_mnesia_store_raw }

                ]),

                [
                    mnesia:write(#htte_t2_mnesia_store_raw{
                        id=Id,
                        rnd=sc:rand(99999)
                    })
                ||
                    Id <- lists:seq(1, 10000)
                ]
            end)

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