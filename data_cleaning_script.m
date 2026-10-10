let
    Source = MySQL.Database("localhost", "nyc_taxi", [ReturnSingleDatabase=true]),
    nyc_taxi_vw_clean_taxi_trips = Source{[Schema="nyc_taxi",Item="vw_clean_taxi_trips"]}[Data],
    #"Added Conditional Column" = Table.AddColumn(nyc_taxi_vw_clean_taxi_trips, "Payment Method", each if [payment_type] = 1 then "Credit card" else if [payment_type] = 2 then "Cash" else if [payment_type] = 3 then "No Charge" else if [payment_type] = 4 then "Dispute" else "Unknown"),
    #"Changed Type" = Table.TransformColumnTypes(#"Added Conditional Column",{{"Payment Method", type text}})
in
    #"Changed Type"