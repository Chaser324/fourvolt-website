Emailer = require '../lib/emailer'

options =
    to:
        email: "chasepettit@gmail.com"
        name: "Chase Pettit"
    subject: "FourVolt Inquiry"
    template: "inquiry"

exports.sendMessage = (req, res) ->
    data = req.body;
    emailer = new Emailer options, data
    emailer.send (err, result) ->
        if err
            console.log "error sending email: " + err
        else
            res.send data
            