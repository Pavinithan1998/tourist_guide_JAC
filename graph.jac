import {*} with "./nodes_edges.jac";

graph map{
    has anchor sri_lanka;

    spawn{
        sri_lanka = spawn node::state(
            name = "Srilanka"
        );
        //Province level
        eastern_province = spawn sri_lanka +[province_belongs_to(name="eastern")]+> node::state(
            name = "eastern"
        );
        western_province = spawn sri_lanka +[province_belongs_to(name="western")]+> node::state(
            name = "western"
        );
        northern_province = spawn sri_lanka +[province_belongs_to(name="northern")]+> node::state(
            name = "northern"
        );
        southern_province = spawn sri_lanka +[province_belongs_to(name="southern")]+> node::state(
            name = "southern"
        );
        central_province = spawn sri_lanka +[province_belongs_to(name="central")]+> node::state(
            name = "central"
        );
        uva_province = spawn sri_lanka +[province_belongs_to(name="uva")]+>node::state(
            name = "uva"
        );
        sabragamuwa_province = spawn sri_lanka +[province_belongs_to(name="sabragamuwa")]+> node::state(
            name = "sabragamuwa"
        );
        north_western_province = spawn sri_lanka +[province_belongs_to(name="north_western")]+>node::state(
            name = "north_western"
        );
        north_central_province = spawn sri_lanka +[province_belongs_to(name="north_central")]+> node::state(
            name = "north_central"
        );
        sri_lanka +[province_belongs_to(name="eastern")]+> eastern_province;
        sri_lanka +[province_belongs_to(name="western")]+> western_province;
        sri_lanka +[province_belongs_to(name="northern")]+> northern_province;
        sri_lanka +[province_belongs_to(name="southern")]+> southern_province;
        sri_lanka +[province_belongs_to(name="central")]+> central_province;
        sri_lanka +[province_belongs_to(name="uva")]+> uva_province;
        sri_lanka +[province_belongs_to(name="sabragamuwa")]+> sabragamuwa_province;
        sri_lanka +[province_belongs_to(name="north_western")]+> north_western_province;
        sri_lanka +[province_belongs_to(name="north_central")]+> north_central_province;

        //district level
        //Eastern
        ampara_district = spawn eastern_province +[belongs_to(name="eastern", parent="eastern")]+> node::state(
            name = "ampara"
        );
        eastern_province +[belongs_to(name="ampara", parent="eastern")]+> ampara_district;

        batticaloa_district = spawn eastern_province +[belongs_to(name="batticaloa", parent="eastern")]+> node::state(
            name = "batticaloa"
        );
        eastern_province +[belongs_to(name="batticaloa", parent="eastern")]+> batticaloa_district;

        trincomale_district = spawn eastern_province +[belongs_to(name="trincomale", parent="eastern")]+> node::state(
            name = "trincomale"
        );
        eastern_province +[belongs_to(name="trincomale", parent="eastern")]+> trincomale_district;

        //Western
        colombo_district = spawn western_province +[belongs_to(name="colombo", parent="western")]+> node::state(
            name = "colombo"
        );
        western_province +[belongs_to(name="colombo", parent="northern")]+> colombo_district;

        gampaha_district = spawn western_province +[belongs_to(name="gampaha", parent="western")]+> node::state(
            name = "gampaha"
        );
        western_province +[belongs_to(name="gampaha", parent="northern")]+> gampaha_district;

        kalutara_district = spawn western_province +[belongs_to(name="kalutara", parent="western")]+> node::state(
            name = "kalutara"
        );
        western_province +[belongs_to(name="kalutara", parent="northern")]+> kalutara_district;


        //Northern
        jaffna_district = spawn northern_province +[belongs_to(name="jaffna", parent="northern")]+> node::state(
            name = "jaffna"
        );
        northern_province +[belongs_to(name="jaffna", parent="northern")]+> jaffna_district;

        mannar_district = spawn northern_province +[belongs_to(name="mannar", parent="northern")]+> node::state(
            name = "mannar"
        );
        northern_province +[belongs_to(name="mannar", parent="northern")]+> mannar_district;

        kilinochi_district = spawn northern_province +[belongs_to(name="kilinochi", parent="northern")]+> node::state(
            name = "kilinochi"
        );
        northern_province +[belongs_to(name="kilinochi", parent="northern")]+> kilinochi_district;

        mullaitivu_district = spawn northern_province +[belongs_to(name="mullaitivu", parent="northern")]+> node::state(
            name = "mullaitivu"
        );
        northern_province +[belongs_to(name="mullaitivu", parent="northern")]+> mullaitivu_district;

        vavuniya_district = spawn northern_province +[belongs_to(name="vavuniya", parent="northern")]+> node::state(
            name = "vavuniya"
        );
        northern_province +[belongs_to(name="vavuniya", parent="northern")]+> vavuniya_district;

        //Southern
        galle_district = spawn southern_province +[belongs_to(name="galle", parent="southern")]+> node::state(
            name = "galle"
        );
        southern_province +[belongs_to(name="galle", parent="southern")]+> galle_district;

        matara_district = spawn southern_province +[belongs_to(name="matara", parent="western")]+> node::state(
            name = "matara"
        );
        southern_province +[belongs_to(name="matara", parent="southern")]+> matara_district;

        hambantota_district = spawn southern_province +[belongs_to(name="hambantota", parent="western")]+> node::state(
            name = "hambantota"
        );
        southern_province +[belongs_to(name="hambantota", parent="southern")]+> hambantota_district;
        
        //Central
        kandy_district = spawn central_province +[belongs_to(name="kandy", parent="central")]+> node::state(
            name = "kandy"
        );
        central_province +[belongs_to(name="kandy", parent="central")]+> kandy_district;

        nuwaraeliya_district = spawn central_province +[belongs_to(name="nuwaraeliya", parent="central")]+> node::state(
            name = "nuwaraeliya"
        );
        central_province +[belongs_to(name="nuwaraeliya", parent="central")]+> nuwaraeliya_district;

        matale_district = spawn central_province +[belongs_to(name="matale", parent="central")]+> node::state(
            name = "matale"
        );
        central_province +[belongs_to(name="matale", parent="central")]+> matale_district;

        //Uva 
        badulla_district = spawn uva_province +[belongs_to(name="badulla", parent="uva")]+> node::state(
            name = "badulla"
        );
        uva_province +[belongs_to(name="badulla", parent="uva")]+> badulla_district;

        moneragala_district = spawn uva_province +[belongs_to(name="moneragala", parent="uva")]+> node::state(
            name = "moneragala"
        );
        uva_province +[belongs_to(name="moneragala", parent="uva")]+> moneragala_district;

        //Sabragamuwa
        kegalle_district = spawn sabragamuwa_province +[belongs_to(name="kegalle", parent="sabragamuwa")]+> node::state(
            name = "kegalle"
        );
        sabragamuwa_province +[belongs_to(name="kegalle", parent="sabragamuwa")]+> kegalle_district;

        ratnapura_district = spawn sabragamuwa_province +[belongs_to(name="ratnapura", parent="sabragamuwa")]+> node::state(
            name = "ratnapura"
        );
        sabragamuwa_province +[belongs_to(name="ratnapura", parent="sabragamuwa")]+> ratnapura_district;

        //North_western
        puttalam_district = spawn north_western_province +[belongs_to(name="puttalam", parent="north_western")]+> node::state(
            name = "puttalam"
        );
        north_western_province +[belongs_to(name="puttalam", parent="north_western")]+> puttalam_district;

        kurunegala_district = spawn north_western_province +[belongs_to(name="kurunegala", parent="north_western")]+> node::state(
            name = "kurunegala"
        );
        north_western_province +[belongs_to(name="kurunegala", parent="north_western")]+> kurunegala_district;

        //North_central
        polannaruwa_district = spawn north_central_province +[belongs_to(name="polannaruwa", parent="north_central")]+> node::state(
            name = "polannaruwa"
        );
        north_central_province +[belongs_to(name="polannaruwa", parent="north_central")]+> polannaruwa_district;

        anuradhapura_district = spawn north_central_province +[belongs_to(name="anuradhapura", parent="north_central")]+> node::state(
            name = "anuradhapura"
        );
        north_central_province +[belongs_to(name="anuradhapura", parent="north_central")]+> anuradhapura_district;

    }
}
