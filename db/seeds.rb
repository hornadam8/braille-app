# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create(name: "Teacher")
Role.create(name: "Student")

User.create(name: "Adam Horn", email: "hornadam8@gmail.com", password: "password")
User.create(name: "Michael Cera", email: "bigmike@gmail.com", password: "password")
User.create(name: "John Smith",email: "jsmith@gmail.com", password: "password")
User.create(name: "Zep", email: "zep@gmail.com", password: "password")

Cohort.create(title: "Rails Comp 101", password: "password", user_id: 1, teacher_id: 1)
Cohort.create(title: "Rails Comp 202", password: "password", user_id: 1, teacher_id: 1)
Cohort.create(title: "Rails Comp 303", password: "password", user_id: 1, teacher_id: 1)
Cohort.create(title: "Rails Comp 404", password: "password", user_id: 1, teacher_id: 1)

UserCohort.create(cohort_id: 1,user_id: 2, student_id: 2, student_cohort_id: 1)
UserCohort.create(cohort_id: 1,user_id: 3, student_id: 3, student_cohort_id: 1)
UserCohort.create(cohort_id: 2,user_id: 2, student_id: 2, student_cohort_id: 2)
UserCohort.create(cohort_id: 2,user_id: 3, student_id: 3, student_cohort_id: 2)
UserCohort.create(cohort_id: 3,user_id: 2, student_id: 2, student_cohort_id: 3)
UserCohort.create(cohort_id: 3,user_id: 3, student_id: 3, student_cohort_id: 3)
UserCohort.create(cohort_id: 4,user_id: 2, student_id: 2, student_cohort_id: 4)
UserCohort.create(cohort_id: 4,user_id: 3, student_id: 3, student_cohort_id: 4)

Assignment.create(title: "Intro to Rails", cohort_id: 1)
Assignment.create(title: "Rails MVC", cohort_id: 1)
Assignment.create(title: "Rails Static Request", cohort_id: 1)
Assignment.create(title: "Rails 'Hello World'", cohort_id: 1)
Assignment.create(title: "ActiveRecord in Rails", cohort_id: 2)
Assignment.create(title: "AR Models", cohort_id: 2)
Assignment.create(title: "AR Migrations", cohort_id: 2)
Assignment.create(title: "AR Validators", cohort_id: 2)
Assignment.create(title: "Intro to REST", cohort_id: 3)
Assignment.create(title: "Rails Dynamic Request", cohort_id: 3)
Assignment.create(title: "Rails CRUD", cohort_id: 3)
Assignment.create(title: "Scaffolding in Rails", cohort_id: 3)
Assignment.create(title: "Rails Forms", cohort_id: 4)
Assignment.create(title: "Layouts and Partials", cohort_id: 4)
Assignment.create(title: "Routes and Resources", cohort_id: 4)
Assignment.create(title: "Authentication", cohort_id: 4)

Paper.create(title: "Intro to Rails paper",content: "Rails looks pretty cool! I've got to read some more documentation so I can use it properly", user_id: 2, author_id: 2,assignment_id: 1)
Paper.create(title: "Paper for Intro to Rails",content: "Rails looks really powerful. Can't wait to bring some of my ideas to life.", user_id: 3, author_id: 3, assignment_id: 1)
