var host = db.serverStatus().host;
//var prompt = function() { return db+"@"+host+"> "; };

var prompt = function() {
  return "Uptime:"+db.serverStatus().uptime+" Documents:"+db.stats().objects+" > ";
};
