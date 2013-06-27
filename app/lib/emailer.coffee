# /lib/emailer.coffee

emailer = require("nodemailer")
fs      = require("fs")
_       = require("underscore")

class Emailer

    options: {}

    data: {}

    constructor: (@options, @data)->

    send: (callback)->
        html = @getHtml(@options.template, @data)
        attachments = @getAttachments(html)
        messageData =
            to: "'#{@options.to.name} #{@options.to.surname}' <#{@options.to.email}>"
            from: "'Myapp.com'"
            subject: @options.subject
            html: html
            generateTextFromHTML: true
        transport = @getTransport()
        transport.sendMail messageData, callback

    getTransport: ()->
        emailer.createTransport "SMTP",
        service: "Gmail"
        auth:
            user: "myappemail@gmail.com"
            pass: "secretpass"

    getHtml: (templateName, data)->
        templatePath = "./views/emails/#{templateName}.html"
        templateContent = fs.readFileSync(templatePath, encoding="utf8")
        _.template templateContent, data, {interpolate: /\{\{(.+?)\}\}/g}

exports = module.exports = Emailer