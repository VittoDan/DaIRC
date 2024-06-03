:- use_module(library(sockets)).
:- use_module(library(process)).
:- use_module(library(mutdict)).
:- use_module(library(codesio)).

int_to_atom(Int, Atom) :-
    number_codes(Int, Codes),  % Convert integer to list of character codes
    atom_codes(Atom, Codes).   % Convert list of character codes to atom
servertest(Ag):-
    write('1'),
    nl,
    socket_server_open('':1337, Sk, [loopback(true), numeric_nodename(true), reuseaddr(true)]),
    write('2'),
    nl,
    socket_server_accept(Sk, C, S, [type(text)]),
    write('3'),
    nl,
    read(S, T),
    write('4'),
    nl,
    handle_request(T,Ag),
    write('5'),
    nl,
    close(S),            
    write('6'),
    nl,
    socket_server_close(Sk),
    write('7'),
    nl,
    write('8'),
    nl,
    servertest(Ag).

handle_request(T,A) :-
    (T = 'agent1' ->
        (mutdict_get(A, 'agent1', L) ->
            NV is L + 1,
            write('4.1'),
            nl,
            mutdict_put(A, 'agent1', NV),
            write('4.2'),
            nl
        ;
            NV = 1,
            mutdict_put(A, 'agent1', NV)
        ),
        mutdict_get(A, 'agent1', V),
        write('4.3'),
        nl,
        set_prolog_flag(double_quotes, atom),     
        write('4.4'),
        nl,
        atom_concat('./agent_creation_trigger.sh ', 'agentType1 ', O),
        write('4.5'),
        nl,
        int_to_atom(V,W),
        write('4.6'),
        nl,
        atom_concat(O, W, O2),
        write('4.7'),
        nl,
        process_create(path(sh), ['-c', [O2]], [wait(exit(0))]),
        write('4.8'),
        nl
    ;
        set_prolog_flag(double_quotes, atom),
        atom_concat('./agent_creation_trigger.sh ', 'test ', O),
        int_to_atom(0,W),
        atom_concat(O, W, O2),
        process_create(path(sh), ['-c', [O2]], [wait(exit(0))])
    ).


?- new_mutdict(AgentDict), servertest(AgentDict).
