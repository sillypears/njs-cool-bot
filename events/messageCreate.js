const { Events } = require('discord.js');

console.log('loaded')
module.exports = {
    name: Events.MessageCreate,
    execute(message) {
		if (message.content.startsWith("tweet_id")){
            c = message.content
            const r = /tweet_id:\s(\w+)/;
            m = r.exec(c)
            m.forEach((match, index) => {
                console.log(match)
            })
        }
	}
}