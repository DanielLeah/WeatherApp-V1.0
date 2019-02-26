Weather App Sample

In this project I created a simple view of the weather in London. 

I've used a table view embedded in a view controller to show the daily weather( weather for 12:00). When we click on the cell( the day that is presented) a new view will be show with a detailed weather of that day (hourly).

The api is parsed using a custom model that is using Decodable protocol. I have used nested structs to parse the api.

The solution is stored on GitHub

What can be improved?? 
- first I could made the unit testing
- a better UI and UX
- implemet MVVM or VIPER ( now is MVC)
- add some 3rd party libraries to get a color to the app
- add UI tests
- others
