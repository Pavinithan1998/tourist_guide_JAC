import {*} with "./graph.jac";
// import {*} with "./bot.jac";
node step1;

walker init{
    //spawn here ++> node::step1;
    spawn here ++> graph::map;
    
    spawn --> walker::find_current_location;
    
}

walker find_current_location {
    can use.enc_question, use.enc_answer;

    
    answers = ['ampara','Batticaloa', 'trincomale', 'colombo', 'gampaha', 'kalutara', 'Jaffna', 'mannar', 'kilinochi', 'mullaitivu', 'vavuniya', 'galle', 'matara', 'hambantota', 'kandy', 'nuwaraeliya', 'matale', 'badulla', 'moneragala', 'kegalle', 'ratnapura', 'puttalam', 'kurunegala', 'polannaruwa', 'anuradhapura'];
    question = std.input("Enter the place >");

    q_enc = use.enc_question(question);
    a_enc = use.enc_answer(answers); # can take lists or single strings

    a_scores=[];

    output = "";
    for i in a_enc:
        a_scores.l::append(vector.cosine_sim(q_enc, i)); 

    answer = answers[a_scores.list::idx_of_max];
    report answer;

    take --> node::country;  
    

    country{
        std.out("done");
    }

}

