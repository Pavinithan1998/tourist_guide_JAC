node model_dir;
node flair_ner {
    # load the model actions here
    can ent_ext.entity_detection, ent_ext.set_config;

    can set_config with infer_zero_shot entry{
        report ent_ext.set_config(
            ner_model = visitor.model_name,
            model_type = visitor.model_type
        );
    }

    can infer_zero_shot with infer_zero_shot entry{
        text = visitor.text;
        labels = visitor.labels.list;
        result =  ent_ext.entity_detection(
            text=text,
            ner_labels= labels
            );
        fn = "result.json";
        result = {"text":text,"entities":result["entities"]};
        file.dump_json(fn, result);
    }
}

edge ner_model {
    has model_type;
}

graph ner_eval_graph {
    has anchor ner_model_dir;
    spawn {
        ner_model_dir = spawn node::model_dir;
        flair_ner_node = spawn node::flair_ner;
        ner_model_dir +[ner_model(model_type="flair_ner")]+> flair_ner_node;
    }
}



walker init {
    root {
    spawn here ++> graph::ner_eval_graph;
    }
}

# creating walker for entity predictions
walker infer_zero_shot{
    has model_name;
    has model_type;
    has text;
    has labels;

    root {
        take --> node::model_dir;
    }
    model_dir {
        take -->;
    }
}