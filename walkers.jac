import {*} with "./graph.jac";
import {*} with "./nodes_edges.jac";
// import {*} with "./bot.jac";
node step1;
global location_now=""; 

walker init{
    //spawn here ++> node::step1;
    root{
        spawn here ++> graph::map;

        // spawn here walker::find_current_location;
        
        // spawn here walker::new_one;
        spawn here walker::ent_ext_example;
        
    }
    
}

// walker find_current_location {
//     can use.enc_question, use.enc_answer;
//     has anchor location_now;

    
//     answers = ['ampara','Batticaloa', 'trincomale', 'colombo', 'gampaha', 'kalutara', 'Jaffna', 'mannar', 'kilinochi', 'mullaitivu', 'vavuniya', 'galle', 'matara', 'hambantota', 'kandy', 'nuwaraeliya', 'matale', 'badulla', 'moneragala', 'kegalle', 'ratnapura', 'puttalam', 'kurunegala', 'polannaruwa', 'anuradhapura'];
//     question = std.input("Enter the place >");

//     q_enc = use.enc_question(question);
//     a_enc = use.enc_answer(answers); # can take lists or single strings

//     a_scores=[];

//     output = "";
//     for i in a_enc:
//         a_scores.l::append(vector.cosine_sim(q_enc, i)); 

//     answer = answers[a_scores.list::idx_of_max];
//     global.location_now = answer;
//     std.out(global.location_now);
//     spawn --> walker::go_to_current_location;
// }

// walker go_to_current_location{
//     //current_location = ["srilanka", "eastern","batticaloa"];
//     //this walker sould walk to current location in the graph-map
//     state{
//         //take --> node::state;
//         take -[province_belongs_to(name=="eastern")]->node::state;
//         take -[belongs_to(name=="batticaloa")]->node::state;

//         std.out(here.name);
        
//     }
// }

// walker new_one{
//     can use.enc_question, use.enc_answer;
//     report global.location_now;
//     new_action = std.input("What should I Do? >>>");
//     answers = ['Find '];

//     q_enc = use.enc_question(question);
//     a_enc = use.enc_answer(answers); # can take lists or single strings

//     a_scores=[];

//     output = "";
//     for i in a_enc:
//         a_scores.l::append(vector.cosine_sim(q_enc, i)); 

//     answer = answers[a_scores.list::idx_of_max];



// }

# Train and inference with an entity extraction model
walker ent_ext_example {

    // has train_file = "train_data.json";
    // has val_file = "val_data.json";
    // has test_file = "test_data.json";
    // has from_scratch = true;
    // has num_train_epochs = 20;
    // has batch_size = 8;
    // has learning_rate = 0.02;
    can ent_ext.entity_detection, ent_ext.train;
    // train_data = file.load_json(train_file);
    // val_data = file.load_json(val_file);
    // test_data = file.load_json(test_file);

    // # Training the model
    // ent_ext.train(
    //     train_data = train_data,
    //     val_data = val_data,
    //     test_data = test_data,
    //     train_params = {
    //         "num_epoch": num_train_epochs,
    //         "batch_size": batch_size,
    //         "LR": learning_rate
    //         });

    # Getting inference from the model
    resp_data = ent_ext.entity_detection(text="EU book a flight from kolkata to delhi", ner_labels = ["LOC"]);
    std.out(resp_data);
}

