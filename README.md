DOCUMENTATION

Local deployment:

    1. First of all ensure that you have installed all from above
    
    2. Create the folder for your app and clone the repository into it with:

            git clone "project clone url"

    3. Next step is installing the required gems and project dependencies via:
    
            bundle install
            
    4. In generated app/config/application.yml you should insert env_variables:
        DATABASE_USERNAME: ''   # Your PSQL username
        DATABASE_PASSWORD: ''   # Your PSQL password
        APP_HOME: 'http://localhost:3000/'
        
    4. After it you should create the database via:
            
            rails db:create

    5. Run migrations with:
    
            rails db:migrate

    6. Run the rails server with:
    
            rails s


Production environments:

     Go to link:
     
     https://bitno.herokuapp.com/


RETROSPECTIVE

    What went well?
    
      In general, everything was fine excluding some points.
    
    What didn't go well? 
    
     I was choosing the encoding method of the source url for a long time. I tried to start with the reaction, but I realized         that there would not be enough time. 

    If you had more time to work on this? If I had more time, I think I would:
    - add React library 
    - cover the application with tests
    - change the reduction urls approach
