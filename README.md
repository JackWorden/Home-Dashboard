### This is still a pretty big work in progress

I highly reccomend not using this. It'll probably just break. I wrote this to fit my specific cases and it shows quite a bit. I assumed things like only having one enrollment in each class or that only assigment submission related TODOs will appear. It allowed me to make this quickly, but it's also really brittle.


1. The weather component isn't implemented yet. 
1. I'd like to use Canvas' course nicknames to name the courses, instead of looking the IDs up in `application.yml`.
1. The `fetcher` classes could stand to benefit from some refactoring
1. Error handling (especially from the API) should be added
1. Tests need to be written.
1. I'd like to add a Twitter feed
1. I'd also like to rotate backgrounds. 
1. I'd also like to know if I have any emails or something. 


# My Home Dashboard
Home dashboard using the [UcfWebcoursesAPI](https://github.com/JackWorden/ucf_canvas_api) and some other stuff. 


Requires `application.yml` to be created in the root directory to be run. The values in `application.yml` are specific to you, and follow the pattern found in `application.example.yml`.


To run: 

1. Run `bundle`
1. Run `thin start`
1. Connect at `localhost:3000`
