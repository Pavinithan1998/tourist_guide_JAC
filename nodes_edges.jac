node state{
    has name;
}

node city{
    has name;
    has city_category;
    has facilities;
}

node place{
    has place_category;
    has rating;
    has comfort;
}
edge belongs_to{
    has name;
    has parent;
}
edge province_belongs_to{
    has name;
}

edge place_belongs_to{
    has name;
}

edge connect_cities{
    has distance;
    has route_name;
    has route_type;
}


edge place_connect{
    has distance;
    has route_type;
    has route_name;
    has road_quality;
}