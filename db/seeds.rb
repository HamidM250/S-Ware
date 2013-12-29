# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
# cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# Mayor.create(name: 'Emanuel', city: cities.first)

# TODO this user seed is a hack, it needs fleshing out properly asap
# a user for each seed volunteer and roster_coordinator
# maybe also a Volunteer coordinator?
User.create([{
    id: 1,
    email: 'andrew',
    password: 'aaa',
    password_confirmation: 'aaa',
    role: 'both'
  },{
    id: 2,
    email: 'rc',
    password: 'aaa',
    password_confirmation: 'aaa',
    role: 'both'
}])

Volcoordinator.create([{
  email_replyto: 'coordinator@test.com',
  application_email_header: 'SPCA Application',
  application_email_content: 'Thank you for your application to become an SPCA Volunteer. We value all our volunteers and appreciate the many ways you can help us out. Please bear with us while your application is processed and we will reply to you by email in approximately 10 working days.',
  absence_tolerence: 3,
  absence_period: 4,
  absence_email_header: 'SPCA - you missed your roster', 
  absence_email_content: 'Hi #{@volunteer.firstname}, you missed your roster today. If you cannot make it in, please just let us know in advance or adjust your preferred schedule online. We like having you here and we value the contribution you make. Please just keep us informed if you cannot come in.',
  user_id: 1
}])

Orientation.create([{
  presenter: 'None',
  datetime: nil,
  participantMax: 1000000,
  numCurrParticipant: 1,
  duration: 2
},{
  presenter: 'Mr Cool',
  datetime: DateTime.new(2013, 12, 25, 5, 0, 0),
  participantMax: 2,
  numCurrParticipant: 0,
  duration: 2
},{
  presenter: 'The Regular Person',
  datetime: DateTime.new(2013, 12, 31, 17, 0, 0),
  participantMax: 5,
  numCurrParticipant: 4,
  duration: 2
}])

# TODO change to give unique user_ids (Matt.user_id = 2 is a hack)
# TODO is moblie problem fixed?
Volunteer.create([
  {
    role: 'volunteer',
    title: 'Mr',
    dob: '12-10-1991',
    firstname: 'Andrew',
    lastname: 'Davies',
    address: '3/1 Braithwaite st, karori, wellington',
    email: 'andrew@gmail.com',
#   mobile: 02265,
    home: 0447747,
    background: 'blah blah',
    orientation_id: 1,
    status: 'New',
    user_id: 1,
    volscheduler_id: 1
  },{
    role: 'fosterer',
    title: 'Mr',
    dob: '12-10-1991',
    firstname: 'Matt',
    lastname: 'Stevens',
    address: '4 CamelCase st, karori, wellington',
    email: 'matt@something.com',
#   mobile: 02265,
    home: 04123456,
    background: 'like cats and walking',
    orientation_id: 2,
    status: 'New',
    user_id: 2,
    volscheduler_id: 1
  },{
    role: 'both',
    title: 'Mr',
    dob: '12-10-1991',
    firstname: 'James',
    lastname: 'McCreanor',
    address: '5 snakeCase st, karori, wellington',
    email: 'james@overhere.com',
#   mobile: 02265,
    home: '0425469',
    background: 'like afternoons, mornings are for hangover recovery',
   orientation_id: 2,
    status: 'New',
    user_id: 1,
    volscheduler_id: 1
  },{
    role: 'fosterer',
    title: 'Mr',
    dob: '12-10-1991',
    firstname: 'Hamid',
    lastname: 'Maddah',
    address: '6 lowercase st, karori, wellington',
    email: 'hamid@doinstuff.com',
#   mobile: 02265,
    home: '04985423',
    background: 'hate paperwork',
    orientation_id: 3,
    status: 'New',
    user_id: 1,
    volscheduler_id: 1
  },{
    role: 'volunteer',
    title: 'Mrs',
    dob: '12-10-1991',
    firstname: 'Brad',
    lastname: 'Personson',
    address: '6 UPPERCASE st, karori, wellington',
    email: 'mymom@givingmeshite.com',
#   mobile: 02265,
    home: '0498999999',
    background: 'hate student layabouts',
    orientation_id: 1,
    status: 'Auto-Rejected',
    user_id: 1,
    volscheduler_id: 1
  }
])

Fosterer.create([{ 
                             
 motivation: 'I like to be a fosterer', 
 catnursing: false,
 catfeeding: true, 
 catbottlefeed: true, 
 catinjured: false,	
 dognursing: false, 
 dogfeeding: false,
 dogbottlefeed: true,
 doginjured: false,
 rabgui: true, 
 hedgehoginjured: true,
 hedgehogbottle: true,
 birdsinjured: false,
 birdstoung: false,
 livestock: false,
 ownhome: 'Yes', 
 inspecting: 'No',
 rooms: 'Yes', 
 roomwarm: 'No', 
 hutch: 'No',	
 rabbithutch: 'No', 
 aviary: 'No',
 livestockfenced: 'No',
 homedesc: 'Blah Blah',
 numadulta: 2, 
 numchild: 1,
 ages: 5,
 numhoursperday: 3,
 worktype: 'Full time',
 secondperson: 'Blah Blah',
 allmembersagree: 'Yes',
 bringcentre: 'Yes',
 transportdesc: 'Boom Boom',
 agreement: 'I agree',
 volunteer_id: 1 
}, { 
                             
 motivation: 'I like to be a fosterer', 
 catnursing: false,
 catfeeding: true, 
 catbottlefeed: true, 
 catinjured: false,	
 dognursing: false, 
 dogfeeding: false,
 dogbottlefeed: true,
 doginjured: false,
 rabgui: true, 
 hedgehoginjured: true,
 hedgehogbottle: true,
 birdsinjured: false,
 birdstoung: false,
 livestock: false,
 ownhome: 'Yes', 
 inspecting: 'No',
 rooms: 'Yes', 
 roomwarm: 'No', 
 hutch: 'No',	
 rabbithutch: 'No', 
 aviary: 'No',
 livestockfenced: 'No',
 homedesc: 'Blah Blah',
 numadulta: 2, 
 numchild: 1,
 ages: 5,
 numhoursperday: 3,
 worktype: 'Away from home',
 secondperson: 'Blah Blah',
 allmembersagree: 'Yes',
 bringcentre: 'Yes',
 transportdesc: 'Boom Boom',
 agreement: 'I agree',
 volunteer_id: 2
},{ 
                             
 motivation: 'I like to be a fosterer', 
 catnursing: false,
 catfeeding: true, 
 catbottlefeed: true, 
 catinjured: false,	
 dognursing: false, 
 dogfeeding: false,
 dogbottlefeed: true,
 doginjured: false,
 rabgui: true, 
 hedgehoginjured: true,
 hedgehogbottle: true,
 birdsinjured: false,
 birdstoung: false,
 livestock: false,
 ownhome: 'Yes', 
 inspecting: 'No',
 rooms: 'No', 
 roomwarm: 'No', 
 hutch: 'No',	
 rabbithutch: 'No', 
 aviary: 'No',
 livestockfenced: 'No',
 homedesc: 'Blah Blah',
 numadulta: 2, 
 numchild: 0,
 ages: 0,
 numhoursperday: 3,
 worktype: 'Part time',
 secondperson: 'Dum Dum',
 allmembersagree: 'No',
 bringcentre: 'No',
 transportdesc: 'Boom Boom',
 agreement: 'I agree',
 volunteer_id: 3
}])