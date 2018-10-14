var Q = require('q');
var service = require('../services/serviceInstanceService');

exports.create = function(req, res) {
    console.log("req.params.instance_id:" + req.params.instance_id);
    service.create(req.params.instance_id)
        .then(function(result){
            console.log('result:' + JSON.stringify(result));
            res.set('Content-Type', 'application/json');
            var isSyncMode = true;
            if(isSyncMode || !req.query.accepts_incomplete || req.query.accepts_incomplete === false) {
                res.status(200);
            }
            else {
                res.status(202);
            }
            
            res.send(result);
        })
        .catch(function(error){
            console.log("controller error:");
            console.log(error.stack);
            res.set('Content-Type', 'application/json');
            res.status(error.http_code);
            res.send(error.message);
        })
        .done();
};

exports.delete = function(req, res) {
    console.log("req.params.instance_id:" + req.params.instance_id);

    service.delete(req.params.instance_id)
        .then(function(result){
            console.log('result:' + JSON.stringify(result));
            res.set('Content-Type', 'application/json');
            var isSyncMode = true;
            if(isSyncMode || !req.query.accepts_incomplete || req.query.accepts_incomplete === false) {
                res.status(200);
            }
            else {
                res.status(202);
            }
            res.send(result);
        })
        .catch(function(error){
            console.log("controller error:");
            console.log(error.stack);
            res.set('Content-Type', 'application/json');
            res.status(error.http_code);
            res.send(error.message);
        })
        .done();
};

exports.last_operation = function(req, res) {
    console.log("In last operation function");
    console.log("req.params.instance_id:" + req.params.instance_id);
    res.set('Content-Type', 'application/json');
    res.status(200);
    var result = {state: 'failed', description: 'failed operation'};
    res.send(JSON.stringify(result));
	
};
