# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
PaymentOption.create(
    [
        {
            amount: 0.00,
            amount_display: 'Up to you',
            description: '<strong>Gratitude: </strong>We greatly appreciate any donation, and will make sure you receive a shoutout on our social media channels!',
            shipping_desc: '',
            delivery_desc: '',
            limit: -1
        },
        {
            amount: 25.00,
            amount_display: '$25',
            description: '<strong>Friend: </strong>Receive a heartfelt mention in our launch newsletter + a shoutout on social media channels on Coderise launch day!',
            shipping_desc: '',
            delivery_desc: '',
            limit: -1
        },
        {
            amount: 50.00,
            amount_display: '$50',
            description: '<strong>Supporter: </strong>Receive a personalized Coderise group photo + a mention in our social media channels.',
            shipping_desc: '',
            delivery_desc: '',
            limit: -1
        },
        {
            amount: 100.00,
            amount_display: '$100',
            description: '<strong>Contributor: </strong>Receive a personalized Coderise group photo + a handwritten appreciation card from students + mention in social media channels',
            shipping_desc: '',
            delivery_desc: '',
            limit: -1
        },
        {
            amount: 1000.00,
            amount_display: '$1000',
            description: '<strong>Founding Fellow: </strong>You will be recognized as sponsoring a speaker lecture + receive exclusive pictures of the event + recognized as a member of the League of Innovation on our website + mention in social media channels',
            shipping_desc: '',
            delivery_desc: '',
            limit: -1
        }
    ])