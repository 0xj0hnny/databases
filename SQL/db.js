var Sequelize = require('sequelize');
var sequelize = new Sequelize('chat','root',null,{
  dialect: 'mysql',
  port: 3306
});

sequelize
  .authenticate()
  .complete(function(err) {
    if (!err) {
      console.log('Unable to connect to database',err)
    } else {
      console.log('Connection has been established')
    }
  });

var User = sequelize.define('User', {
  username: Sequelize.STRING
});

var Message = sequelize.define('Messages', {
  text: Sequelize.STRING,
  roomname: Sequelize.STRING
});

User.hasMany(Message);
Message.belongsTo(User);

sequelize
  .sync({force: true})
  .complete(function(err){
    console.log(err);
  });


exports.findAllMessages = function(cb){
  // var sql = "SELECT * FROM messages,users WHERE messages.userid = users.id ORDER BY messages.id";
  // dbConnection.query(sql, function(err, results){
  //   cb(err, results);
  // });
  Message.findAll({
      include: [User]
    })
    .success(function(msgs){
      cb(null, msgs);
    });
};

exports.findUser = function(username, cb){
  // var sql = "SELECT * FROM users WHERE users.username = " + dbConnection.escape(username);
  // dbConnection.query(sql, function(err, results){
  //   cb(err, results);
  // });
  User.findAll({where:{username: username}})
    .success(function(usr){
      cb(null,usr);
    });
};

exports.saveUser = function(username, cb){
  // var sql = "INSERT INTO users (username) VALUES (?)";
  // dbConnection.query(sql, [username], function(err, results){
  //   cb(results);
  // });
  var user = User.build({username:username});
  user.save()
    .success(function(){
      User.findAll({ where: {username: username}})
      .success(function(usr){
        cb(usr);
      });
    });
};

exports.saveMessage = function(message, userid, roomname, cb){
  // var sql = "INSERT INTO messages (text,userid,roomname) VALUES (?,?,?)";
  // dbConnection.query(sql, [message,userid,roomname], function(err, results){
  //   cb(err,results);
  // });
  var message = Message.build({text:message,UserId:userid,roomname:roomname});
  console.log("USERIDDDDDDDDDDDDDDDDDDDDDDDD",userid);
  message.save()
    .success(function(results) {
      cb(null,results);
    });
};
