:- use_module(library(sockets)).
:- use_module(library(process)).
:- use_module(library(mutdict)).
:- use_module(library(codesio)).
:- use_module(library(json)).

parse_json_from_string(JSONString, JSONObject) :-   
    atom_codes(JSONString, JSONCodes),                                                                    
    json_from_codes(JSONCodes, JSONObject).
      
get_item(JSONObject, Item) :-                                                                                                           
    JSONObject = json(Members),                                                                                                                    
    member('item'=Item, Members).                                                                                                           
get_action(JSONObject, Action) :-                                                                                                           
    JSONObject = json(Members),                                                                                                                    
    member('action'=Action, Members).                                                                                                           
          

int_to_atom(Int, Atom) :-
    number_codes(Int, Codes),  % Convert integer to list of character codes
    atom_codes(Atom, Codes).   % Convert list of character codes to atom
servertest(Ag):-    
    socket_server_open('':1337, Sk, [loopback(true), numeric_nodename(true), reuseaddr(true)]),
    socket_server_accept(Sk, C, S, [type(text)]),
    read(S, IT),
    parse_json_from_string(IT, JSONObject),
    get_action(JSONObject,J),
    write(J),
    (J == add  ->
        get_item(JSONObject,T),
        handle_request(T,Ag)
        ;
        write('TBD')
    ),
    close(S),            
    socket_server_close(Sk),
    servertest(Ag).

handle_request(T,A) :-
    (mutdict_get(A, T, L) ->
        NV is L + 1,
        mutdict_put(A, T, NV)
    ;
        NV = 1,
        mutdict_put(A, T, NV)
    ),
    mutdict_get(A, T, V),
    set_prolog_flag(double_quotes, atom),     
    atom_concat('./agent_creation_trigger.sh ', T, O),
    int_to_atom(V,W),
    atom_concat(O, ' ', O2),
    atom_concat(O2 ,W, O3),
    process_create(path(sh), ['-c', [O3]], [wait(exit(0))]).


?- new_mutdict(AgentDict), servertest(AgentDict).
