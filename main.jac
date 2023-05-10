import {*} with "./graph.jac";
import {*} with "./walkers.jac";

walker init{
    root{
        spawn here ++> graph::map;
        // spawn here walker::find_current_location;
        spawn here walker::ask_next_question;
        
    }
}
