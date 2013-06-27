// Generated by CoffeeScript 1.6.3
var Emailer, emailer, exports, fs, userinfo, _;

emailer = require("nodemailer");

fs = require("fs");

_ = require("underscore");

userinfo = require("../userinfo");

Emailer = (function() {
  Emailer.prototype.options = {};

  Emailer.prototype.data = {};

  function Emailer(options, data) {
    this.options = options;
    this.data = data;
  }

  Emailer.prototype.send = function(callback) {
    var html, messageData, transport;
    html = this.getHtml(this.options.template, this.data);
    messageData = {
      to: "'" + this.options.to.name + " <" + this.options.to.email + ">",
      from: "'fourvolt.com'",
      subject: this.options.subject,
      html: html,
      generateTextFromHTML: true
    };
    transport = this.getTransport();
    return transport.sendMail(messageData, callback);
  };

  Emailer.prototype.getTransport = function() {
    return emailer.createTransport("SMTP", {
      service: "Gmail",
      auth: {
        user: userinfo.user,
        pass: userinfo.pass
      }
    });
  };

  Emailer.prototype.getHtml = function(templateName, data) {
    var encoding, templateContent, templatePath;
    templatePath = "./views/emails/" + templateName + ".html";
    templateContent = fs.readFileSync(templatePath, encoding = "utf8");
    return _.template(templateContent, data, {
      interpolate: /\{\{(.+?)\}\}/g
    });
  };

  return Emailer;

})();

exports = module.exports = Emailer;