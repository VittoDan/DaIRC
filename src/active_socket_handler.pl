
:-use_module(library(sockets)),use_module(library(process)),use_module(library(mutdict)).
servertest:-socket_server_open('':1337,Sk,[loopback(true),numeric_nodename(true),reuseaddr(true)]),
            socket_server_accept(Sk,C,S,[type(text)]),
            read(S,T),
            close(S),            
            socket_server_close(Sk),nl,
            write(T),nl,
            (T =  'agent1' ->
                write("FIRSTIF"),
                (mutdict_get(AgentDict, T, V) ->
                    write("SECONDIFTRUE"),
                    NV= V+1,
                    mutdict_put(AgentDict, T,  NV)
                    ;
                    write("SECONDIFFALSE"),
                    NV=1,
                    mutdict_put(AgentDict, T,  NV),
                mutdict_get(AgentDict, T, V),
                set_prolog_flag(double_quotes, atom),
                process_create(path(sh),['-c', ['./agent_creation_trigger.sh',' ', 'agentType1', ' ', V]],[wait(exit(0))])
                ;
                set_prolog_flag(double_quotes, atom),
                process_create(path(sh),['-c', ['./agent_creation_trigger.sh',' ', 'test', ' ', 0]],[wait(exit(0))]))),
            servertest.
?-new_mutdict(AgentDict),servertest.
