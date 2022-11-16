const man = require('mongoose');


var examSchema = new man.Schema({
 idExam : Schema.ObjectId,
 time : {type : Time, required : true},
 Fetus : {
    PresentationType : {type : String, required : true},
    PresentationVariety : {type : String, required : true},
    PresentationLevel : {type : Number, required : true},
    Heartbeat : {type : Number, required : true}
 },
 watersBag : {
    Status : String,
    LiquidQuantity : { type : Number, required : true, default : 0},
    LiquidAppearance : {type : Number, required : true, default : "none"}
 }, 
 cervicalMonitoring : {
    position : {type : String, required : true},
    dilatation : {type : Number, required : true}
 },
 UterineContraction : {type : Number, required : true},
 Mother : {
    behaviour : {type : String, required : true},
    painEvaluation : {type : Number, min : 0, max : 10, required : true},
    arterialPressure : {type : Number, required : true},
    temperature : {type : Number, required : true},
    pulse : {type : Number, required : true}
 }
});


var examModel = man.model('exam', examSchema);