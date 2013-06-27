# /lib/emailer.coffee

emailer = require("nodemailer")
fs      = require("fs")
_       = require("underscore")
userinfo = require("../userinfo")

class Emailer

    options: {}

    data: {}

    constructor: (@options, @data)->

    send: (callback)->
        console.log 'test: ' + JSON.stringify(@options)
        html = @getHtml(@options.template, @data)
        messageData =
            to: "'#{@options.to.name} <#{@options.to.email}>"
            from: "'fourvolt.com'"
            subject: @options.subject
            html: html
            generateTextFromHTML: true
        transport = @getTransport()
        transport.sendMail messageData, callback

    getTransport: ()->
        emailer.createTransport "SMTP",
        service: "Gmail"
        auth:
            user: userinfo.user
            pass: userinfo.pass

    getHtml: (templateName, data)->
        templatePath = "./views/emails/#{templateName}.html"
        templateContent = fs.readFileSync(templatePath, encoding="utf8")
        _.template templateContent, data, {interpolate: /\{\{(.+?)\}\}/g}

exports = module.exports = Emailer