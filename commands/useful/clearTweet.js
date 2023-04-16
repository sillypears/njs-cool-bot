
const { SlashCommandBuilder } = require('discord.js');
const axios = require('axios');

module.exports = {
	data: new SlashCommandBuilder()
		.setName('clear')
		.setDescription('Clear the tweets'),
	async execute(interaction) {
        const res = await axios.post('http://192.168.1.55:4999/clearNewTweets')
        console.log(res.data.cleared)
        await interaction.reply(`Cleared ${res.data.cleared} tweets!`);
        
    },
};
