# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all

demo_user = User.create({
    username: 'Demo',
    email: 'demo@demo.demo',
    password: 'password123',
    time_zone: 'Chicago/America'
})

user0 = User.create({
    username: 'FirstZion',
    email: 'probablydustin@yahoo.demo',
    password: 'password123',
    time_zone: 'Chicago/America'
})

user1 = User.create({
    username: 'PunisherOfTruth',
    email: 'punisher@yahoo.demo',
    password: 'password123',
    time_zone: 'Chicago/America'
})

user2 = User.create({
    username: 'MidwestLuvAffair',
    email: 'midwestluvaffair@yahoo.demo',
    password: 'password123',
    time_zone: 'Chicago/America'
})

user3 = User.create({
    username: 'Peanut',
    email: 'peanut@yahoo.demo',
    password: 'password123',
    time_zone: 'Chicago/America'
})

user4 = User.create({
    username: 'FoxGirl4Eva',
    email: 'foxgirl4eva@yahoo.demo',
    password: 'password123',
    time_zone: 'Chicago/America'
})

user5 = User.create({
    username: 'FatedWing',
    email: 'fatedwing@yahoo.demo',
    password: 'password123',
    time_zone: 'Chicago/America'
})

user6 = User.create({
    username: 'BobSaget',
    email: 'bobsaget@yahoo.demo',
    password: 'password123',
    time_zone: 'Chicago/America'
})

user7 = User.create({
    username: 'LVL99Pikachu',
    email: 'lvl99pikachu@yahoo.demo',
    password: 'password123',
    time_zone: 'Chicago/America'
})

user8 = User.create({
    username: 'Breakkah',
    email: 'breakah@yahoo.demo',
    password: 'password123',
    time_zone: 'Chicago/America'
})

user9 = User.create({
    username: 'LittleKittenMittens',
    email: 'littlekittenmittens@yahoo.demo',
    password: 'password123',
    time_zone: 'Chicago/America'
})

user10 = User.create({
    username: 'Asbestix',
    email: 'asbestix@yahoo.demo',
    password: 'password123',
    time_zone: 'Chicago/America'
})