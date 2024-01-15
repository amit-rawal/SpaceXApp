# SpaceXApp
 This app shows information about SpaceX

# MVVM + SwiftUI
This project have following things -
<p>
    
Design pattern - **MVVM**
    
Language - **Swift + SwiftUI**
    
Network Check - **NWPathMonitor**
    
API Calling - **URLSession**

**Unit Test Case**

**Dependancy Injection**

</p>
    
<h1>About MVVM Architecture</h1>
<p>
MVVM is one of the architectural patterns which enhances separation of concerns, it allows separating the user interface logic from the business (or the back-end) logic. Its target (with other MVC patterns goal) is to achieve the following principle “Keeping UI code simple and free of app logic in order to make it easier to manage”.
    
MVVM is an abbreviation of Model View Veiw model where your presentaion layer will be divided into three packages -
    
<Br/> <b>Model</b> : Model represents the data and business logic of the app.
    
<Br/> <b>View</b> : The view role in this pattern is to observe (or subscribe to) a ViewModel observable to get data in order to update UI elements accordingly.
    
<Br/> <b>View Model</b> : ViewModel interacts with model and also prepares observable(s) that can be observed by a View.


<div id="container">
    <img src="https://miro.medium.com/max/1212/1*BpxMFh7DdX0_hqX6ABkDgw.png" alt="" />
</div>



<p>This repo contains the following branches
  <ul>
    <li><b>master</b>: Contains MVVM architecture with SwiftUI, Split View, network connection check, API manager, Native image cache manager, Unit test cases for API Call, Dependancy Injection. </li>
  </ul>
</p>

</p>
<h2> Used Libraries</h2>
<ul>
<li>No Third Party Library Used </li>
</ul>

## How to build 🛠

1- Fork the project & Clone it to your desktop.

2- Open it from Xcode (13.0+).

3- Change the Build identifier.

5- build & run.

6- enjoy.

MIT License

Copyright (c) 2022 **Amit Rawal**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
