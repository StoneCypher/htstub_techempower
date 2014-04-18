
%%%%%%%%%
%%
%%  @doc htte_t1 - htstub_techempower test 1 implementation
%%
%%  This is a set of HtStub implementations of the 
%%  <a href="http://www.techempower.com/benchmarks/">TechEmpower Web Framework Benchmarks</a>.
%%
%%  Test 1: JSON Serialization

serve() ->

    htstub:serve(fun(_) -> 

        Response = <<"{\"message\":\"Hello, World!\"}">>,

        { 200, 

          [ { "Date",           htstub:standard_datestring()             },
            { "Content-Type",   "text/html"                       },
            { "Content-Length", integer_to_list(length(Response)) }
          ], 

          Response

        } 

    end). 