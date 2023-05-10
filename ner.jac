# Train and inference with an entity extraction model
walker init {

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
    resp_data = ent_ext.entity_detection(text="book a flight from kolkata to delhi",ner_labels= ["LOC"]);
    std.out(resp_data);
}