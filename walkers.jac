import {*} with "./graph.jac";
import {*} with "./nodes_edges.jac";

global location_now=""; 



walker find_current_location {
    can use.enc_question, use.enc_answer;
    has anchor location_now;

    
    answers = ['ampara','Batticaloa', 'trincomale', 'colombo', 'gampaha', 'kalutara', 'Jaffna', 'mannar', 'kilinochi', 'mullaitivu', 'vavuniya', 'galle', 'matara', 'hambantota', 'kandy', 'nuwaraeliya', 'matale', 'badulla', 'moneragala', 'kegalle', 'ratnapura', 'puttalam', 'kurunegala', 'polannaruwa', 'anuradhapura'];
    question = std.input("Enter Your current location:  >>>");

    q_enc = use.enc_question(question);
    a_enc = use.enc_answer(answers); # can take lists or single strings
    a_scores=[];

    for i in a_enc:
        a_scores.l::append(vector.cosine_sim(q_enc, i)); 

    answer = answers[a_scores.list::idx_of_max];
    global.location_now = answer;
    std.out(global.location_now);
    spawn --> walker::go_to_current_location;
}


walker go_to_current_location{
    //this walker sould walk to current location in the graph-map
    state{
        //take --> node::state;
        take -[province_belongs_to(name=="eastern")]->node::state;
        take -[belongs_to(name=="batticaloa")]->node::state;

        std.out(here.name);
    }
}


walker ask_next_question{
    can use.enc_question, use.enc_answer;
    has anchor location_now;

    answers = ["Find Distance", "Find Nearest place"];
    question = std.input("How can I help you?  >>>");

    q_enc = use.enc_question(question);
    a_enc = use.enc_answer(answers); # can take lists or single strings
    a_scores=[];

    for i in a_enc:
        a_scores.l::append(vector.cosine_sim(q_enc, i)); 

    final_question = answers[a_scores.list::idx_of_max];

    if(final_question == "Find Distance"){
        resp_data = ent_ext.entity_detection(text = question, ner_labels = ["LOC"]);
        places = ['ampara','Batticaloa', 'trincomale', 'colombo', 'gampaha', 'kalutara', 'Jaffna', 'mannar', 'kilinochi', 'mullaitivu', 'vavuniya', 'galle', 'matara', 'hambantota', 'kandy', 'nuwaraeliya', 'matale', 'badulla', 'moneragala', 'kegalle', 'ratnapura', 'puttalam', 'kurunegala', 'polannaruwa', 'anuradhapura'];
        given_location = resp_data.entities[0].entity_text;

        q_enc2 = use.enc_question(given_location);
        a_enc2 = use.enc_answer(places); # can take lists or single strings
        a_scores2=[];
        for i in a_enc2:
            a_scores2.l::append(vector.cosine_sim(q_enc2, i)); 

        confirmed_location = places[a_scores2.list::idx_of_max];

        std.out("Did you mean", confirmed_location, "?");
        location_confirm = std.input(">>>");

        best_answer = use.qa_classify(
                text = location_confirm,
                classes = ["y", "n"]
            );
        best_answer = best_answer.match;
        if(best_answer == "y"){
            std.out("yes");
            spawn --> walker::find_distance;
        }
        elif(best_answer == "n"){
            std.out("no");
            take -->;
        }
    }
    elif(final_question == "Find Nearest place"){
        spawn --> walker::find_nearest_place;
    }
}

walker find_distance{

}

walker find_nearest_place{
    std.out("Find nearest place");
}
