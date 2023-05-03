import {*} with "./graph.jac";
import {*} with "./nodes_edges.jac";
// import {*} with "./bot.jac";
node step1;
global location_now=""; 

walker init{
    //spawn here ++> node::step1;
    spawn here ++> graph::map;
    
    spawn --> walker::find_current_location;
    spawn --> walker::go_to_current_location;
    
}

walker find_current_location {
    can use.enc_question, use.enc_answer;
    has anchor location_now;

    state{
        answers = ['ampara','Batticaloa', 'trincomale', 'colombo', 'gampaha', 'kalutara', 'Jaffna', 'mannar', 'kilinochi', 'mullaitivu', 'vavuniya', 'galle', 'matara', 'hambantota', 'kandy', 'nuwaraeliya', 'matale', 'badulla', 'moneragala', 'kegalle', 'ratnapura', 'puttalam', 'kurunegala', 'polannaruwa', 'anuradhapura'];
        question = std.input("Enter the place >");

        q_enc = use.enc_question(question);
        a_enc = use.enc_answer(answers); # can take lists or single strings

        a_scores=[];

        output = "";
        for i in a_enc:
            a_scores.l::append(vector.cosine_sim(q_enc, i)); 

        answer = answers[a_scores.list::idx_of_max];
        location_now = answer;
        std.out(location_now);
    }
    spawn --> walker::go_to_current_location;
}

walker go_to_current_location{
    //current_location = ["srilanka", "eastern","batticaloa"];
    //this walker sould walk to current location in the graph-map
    // take --> node::state;
    // std.out(here.name);
    // take -->node::state;
    // std.out(here.name);
    // take -[province_belongs_to(name=="eastern")]->node::province;
    // take -[belongs_to(name=="batticaloa")]->node::district;
    // // std.out(here.name);

    // action_to_do = std.input("What should I Do? ");
    // std.out(action_to_do);
    // country{
    //     take -->node::country;
    //     std.out(here.name);
    //     take -->;
        
    // }
    state{
        take --> node::state;
        take -[province_belongs_to(name=="eastern")]->node::state;
        take -[belongs_to(name=="batticaloa")]->node::state;

        std.out(here.name);
    }
}


