<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Book your Tickets</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    </head>
    <body>
        <form action="MoviesServlet">
        <div class="col">
            <h1 align="center">Details for Ticket</h1>
        </div>
        <div class="row" justify-content-center>
            <label for="inputName4" class="form-label">Name</label>
            <input type="text" class="form-control" id="inputName4">
        </div>
        <div class="row" justify-content-center>
            <label for="inputEmail4" class="form-label">Email</label>
            <input type="text" class="form-control" id="inputEmail4">
        </div>
        <div class="row" justify-content-center>
            <label for="inputTime4" class="form-label">Timing for Show</label>
            <input type="text" class="form-control" id="inputTiming4">
        </div>
        <div class="btn-group">
            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                Number of People
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item">1</a></li>
                <li><a class="dropdown-item">2</a></li>
                <li><a class="dropdown-item">3</a></li>
                <li><a class="dropdown-item">4</a></li>
                <li><a class="dropdown-item">5 or more</a></li>
            </ul>
        </div>
        <br>
        <div class="row" justify-content-center>
                <div class="col-4">
                    <button type="submit" class="btn btn-primary">Book Tickets</button>
                </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        </form>
    </body>
</html>
