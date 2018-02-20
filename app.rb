require 'sinatra'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require './lib/doctor.rb'
require './lib/patient.rb'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'doctor_office'})

get('/') do
  @doctors = Doctor.all()
  erb(:doctor)
end

post('/') do
  name = params['doctor_name']
  specialty = params['specialty']
  binding.pry
  new_doctor = Doctor.new({:name => name, :specialty => specialty, :id => 1})
  new_doctor.save()
  erb(:doctor)
end
