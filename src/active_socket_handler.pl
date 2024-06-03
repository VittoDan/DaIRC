:- use_module(library(sockets)).
:- use_module(library(process)).
:- use_module(library(mutdict)).
:- use_module(library(codesio)).

int_to_atom(Int, Atom) :-
    number_codes(Int, Codes),  % Convert integer to list of character codes
    atom_codes(Atom, Codes).   % Convert list of character codes to atom
servertest(Ag):-    
    socket_server_open('':1337, Sk, [loopback(true), numeric_nodename(true), reuseaddr(true)]),
    socket_server_accept(Sk, C, S, [type(text)]),
    read(S, T),
    handle_request(T,Ag),
    close(S),            
    socket_server_close(Sk),
    servertest(Ag).

handle_request(T,A) :-
    (T = 'agent1' ->
        (mutdict_get(A, 'agent1', L) ->
            NV is L + 1,
            mutdict_put(A, 'agent1', NV),
        ;
            NV = 1,
            mutdict_put(A, 'agent1', NV)
        ),
        mutdict_get(A, 'agent1', V),
        set_prolog_flag(double_quotes, atom),     
        atom_concat('./agent_creation_trigger.sh ', 'agentType1 ', O),
        int_to_atom(V,W),
        atom_concat(O, W, O2),
        process_create(path(sh), ['-c', [O2]], [wait(exit(0))]),
    ;
        set_prolog_flag(double_quotes, atom),
        atom_concat('./agent_creation_trigger.sh ', 'test ', O),
        int_to_atom(0,W),
        atom_concat(O, W, O2),
        process_create(path(sh), ['-c', [O2]], [wait(exit(0))])
    ).


?- new_mutdict(AgentDict), servertest(AgentDict).
