### This is still a pretty big work in progress

Some TODOs: 

1. I'd like to use Canvas' course nicknames to name the courses, instead of looking the IDs up in `application.yml`.
1. The `fetcher` classes could stand to benefit from some refactoring
1. Error handling (especially from the API) should be added, though I don't think it's entirely necessary. I haven't really encountered any errors at all. 
1. Tests need to be written. I don't think they're totally necessary either.
1. I'd like to add a Twitter feed eventually. 
1. Maybe Gmail integration to see emails?


# My Home Dashboard
Home dashboard using the (extremely limited) [UcfWebcoursesAPI Ruby wrapper](https://github.com/JackWorden/ucf_canvas_api) and some other stuff. 


Requires `application.yml` to be created in the root directory to be run. The values in `application.yml` are specific to you, and follow the pattern found in `application.example.yml`.


To run: 

1. Run `bundle`
1. Run `thin start`
1. Connect at `localhost:3000`
