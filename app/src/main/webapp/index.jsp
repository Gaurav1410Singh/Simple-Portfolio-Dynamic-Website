<DOC TYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/htm14/loose.dtd:">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%
Connection connection = null;
String connectionUrl = "jdbc:mysql://localhost:3306/website_master";
ResultSet result = null;
Statement statement = null;

try {
    Map<String, String> websiteItems = new HashMap<String, String>();

    // Load and register the MySQL JDBC driver
    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

    // Establish the database connection
    connection = DriverManager.getConnection(connectionUrl, "root", "Gaurav_#90443");

    // Create a statement to execute SQL queries
    statement = connection.createStatement();

    // Execute a query to retrieve data
    result = statement.executeQuery("SELECT * FROM website_master.page_master;");

    // Process the result set
    while (result.next()) {
        websiteItems.put(result.getString(2), result.getString(3));
    }

    // Check if the map is empty
    if (websiteItems.isEmpty()) {
        out.println("No Data Found.");
    } else {
%>{
     <html>
         <head>
             <meta charset="utf-8" />
             <meta name="viewport" content="width=device-width, initial-scale=1" />
             <link  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
             <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
             <title>JSP Page</title>
         </head>
         <body>
             <header>
                 <nav class="navbar navbar-expand-lg navbar-light bg-light">
                     <div class="container-fluid">
                         <img src="<%= webpageItems.get("logo") %>" class="navbar-brand">

                         <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbar1">
                             <i class="bi bi-list"></i>
                         </button>

                         <div class="collapse navbar-collapse" id="navbar1">
                             <div class="navbar-nav ms-auto">
                                 <a href="index.jsp" class="nav-item nav-link active">Home</a>
                                 <a href="#about-us" class="nav-item nav-link">About Us</a>
                                 <a href="#contact-us" class="nav-item nav-link">Contact Us</a>
                             </div>
                         </div>
                     </div>
                 </nav>

                 <div id="carousel" class="carousel slide" data-bs-ride="carousel">
                     <!-- Carousel Indicators -->
                     <div class="carousel-indicators">
                         <button type="button" data-bs-target="#carousel" data-bs-slide-to="0" class="active"></button>
                         <button type="button" data-bs-target="#carousel" data-bs-slide-to="1"></button>
                         <button type="button" data-bs-target="#carousel" data-bs-slide-to="2"></button>
                     </div>

                     <!-- Carousel Inner -->
                     <div class="carousel-inner">
                         <div class="carousel-item active">
                             <img src="<%= webpageItems.get("carousel_one") %>" class="d-block w-100" alt="Carousel 1" style="max-height:100vh;">
                         </div>
                         <div class="carousel-item">
                             <img src="<%= webpageItems.get("carousel_two") %>" class="d-block w-100" alt="Carousel 2" style="max-height:100vh;">
                         </div>
                         <div class="carousel-item">
                             <img src="<%= webpageItems.get("carousel_three") %>" class="d-block w-100" alt="Carousel 3" style="max-height:100vh;">
                         </div>
                     </div>

                     <!-- Carousel Controls -->
                     <button class="carousel-control-prev" type="button" data-bs-target="#carousel" data-bs-slide="prev">
                         <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                         <span class="visually-hidden">Previous</span>
                     </button>
                     <button class="carousel-control-next" type="button" data-bs-target="#carousel" data-bs-slide="next">
                         <span class="carousel-control-next-icon" aria-hidden="true"></span>
                         <span class="visually-hidden">Next</span>
                     </button>
                 </div>
             </header>

             <main class="mt-5">
                 <section class="container pt-4" id="about-us">
                     <h6 class="display-5 text-center">About Us</h6>

                     <div class="row mt-5 mb-5">
                         <div class="col-md-5">
                             <div class="container">
                                 <img src="<%= webpageItems.get(" about_us") %>" class="d-block w-100" alt="About Us">
                             </div>
                         </div>
                         <div class="col-md-7">
                             <p class="text-black-50">
                                 We are a dedicated team passionate about delivering high-quality solutions that drive innovation and efficiency.
                                 Our goal is to create products that simplify everyday tasks and enhance productivity. With years of experience
                                 in the industry, we continuously strive to improve and adapt to the ever-evolving technological landscape.
                             </p>
                             <p class="text-black-50">
                                 Our commitment to excellence is reflected in our attention to detail and customer-centric approach.
                                 We believe in fostering a culture of creativity, collaboration, and continuous learning. By leveraging the latest
                                 technologies, we ensure that our solutions meet the highest standards and provide real value to our clients.
                             </p>
                         </div>
                     </div>
                 </section>

                 <section class="mt-5 mb-5">
                     <div class="row">
                         <h6 class="display-5 text-center mb-4">What Makes Us Unique</h6>

                         <div class="col-md-4">
                             <div class="container text-center">
                                 <i class="bi bi-person" style="font-size: 3rem;"></i>
                                 <p>Custom tailored user options</p>
                             </div>
                         </div>

                         <div class="col-md-4">
                             <div class="container text-center">
                                 <i class="bi bi-shield-shaded" style="font-size: 3rem;"></i>
                                 <p>Privacy First Approach</p>
                             </div>
                         </div>

                         <div class="col-md-4">
                             <div class="container text-center">
                                 <i class="bi bi-list" style="font-size: 3rem;"></i>
                                 <p>Multiple variants</p>
                             </div>
                         </div>
                     </div>
                 </section>

                 <section id="team" class="container mt-5 mb-5">
                     <h6 class="display-5 text-center mt-5 mb-5">Our Innovative Team</h6>

                     <div class="row justify-content-center">
                         <!-- Team Member 1 -->
                         <div class="col-md-3 d-flex align-items-center justify-content-center">
                             <div class="card" style="width: 18rem;">
                                 <img class="card-img-top" src="<%= webpageItems.get("team_member_one") %>" alt="Team Member 1">
                                 <div class="card-body text-center">
                                     <h4 class="card-title">Team Member 1</h4>
                                     <p class="card-text">When an unknown printer took a galley of type and scrambled it to make.</p>
                                     <i class="bi bi-facebook m-2"></i>
                                     <i class="bi bi-instagram m-2"></i>
                                     <i class="bi bi-linkedin m-2"></i>
                                 </div>
                             </div>
                         </div>

                         <!-- Team Member 2 -->
                         <div class="col-md-3 d-flex align-items-center justify-content-center">
                             <div class="card" style="width: 18rem;">
                                 <img class="card-img-top" src="<%= webpageItems.get("team_member_two") %>" alt="Team Member 2">
                                 <div class="card-body text-center">
                                     <h4 class="card-title">Team Member 2</h4>
                                     <p class="card-text">Passionate and dedicated, committed to excellence and innovation.</p>
                                     <i class="bi bi-facebook m-2"></i>
                                     <i class="bi bi-instagram m-2"></i>
                                     <i class="bi bi-linkedin m-2"></i>
                                 </div>
                             </div>
                         </div>

                         <!-- Team Member 3 -->
                         <div class="col-md-3 d-flex align-items-center justify-content-center">
                             <div class="card" style="width: 18rem;">
                                 <img class="card-img-top" src="<%= webpageItems.get("team_member_three") %>" alt="Team Member 3">
                                 <div class="card-body text-center">
                                     <h4 class="card-title">Team Member 3</h4>
                                     <p class="card-text">A creative mind bringing fresh ideas and strategic vision.</p>
                                     <i class="bi bi-facebook m-2"></i>
                                     <i class="bi bi-instagram m-2"></i>
                                     <i class="bi bi-linkedin m-2"></i>
                                 </div>
                             </div>
                         </div>

                         <!-- Team Member 4 -->
                         <div class="col-md-3 d-flex align-items-center justify-content-center">
                             <div class="card" style="width: 18rem;">
                                 <img class="card-img-top" src="<%= webpageItems.get("team_member_four") %>" alt="Team Member 4">
                                 <div class="card-body text-center">
                                     <h4 class="card-title">Team Member 4</h4>
                                     <p class="card-text">An expert in problem-solving and optimizing performance.</p>
                                     <i class="bi bi-facebook m-2"></i>
                                     <i class="bi bi-instagram m-2"></i>
                                     <i class="bi bi-linkedin m-2"></i>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </section>

                 <section id="contact-us" class="container mt-5 mb-5">
                     <h6 class="display-5 text-center mt-5 mb-5">Contact Us</h6>

                     <div class="row">
                         <!-- Contact Information -->
                         <div class="col-md-6">
                             <div class="container mt-3">
                                 <p class="text-muted text-center fs-3">Our Contact Info</p>
                                 <p class="text-black-50 text-center fs-4">Our Email</p>
                                 <p class="text-black text-center fs-5">gaurav.it.22028@recb.ac.in</p>

                                 <p class="text-black-50 text-center fs-4">Our Phone No.</p>
                                 <p class="text-black text-center fs-5">9026721816</p>

                                 <p class="text-black-50 text-center fs-4">Our Address</p>
                                 <p class="text-black text-center fs-5">KanakSarai, Kachhawa Bazaar, Mirzapur, UP.</p>
                             </div>
                         </div>

                         <!-- Contact Form -->
                         <div class="col-md-6">
                             <div class="container">
                                 <p class="text-muted text-center fs-3">You can Also Write to Us</p>

                                 <div class="container">
                                     <div class="card shadow">
                                         <div class="card-body">
                                             <form>
                                                 <div class="form-group">
                                                     <label for="name" class="form-label">Enter Your Name</label>
                                                     <input type="text" class="form-control" name="name" id="name">
                                                 </div>

                                                 <div class="form-group mt-3">
                                                     <label for="email" class="form-label">Enter Your Email</label>
                                                     <input type="email" class="form-control" name="email" id="email">
                                                 </div>

                                                 <div class="form-group mt-3">
                                                     <label for="subject" class="form-label">Enter Your Subject</label>
                                                     <input type="text" class="form-control" name="subject" id="subject">
                                                 </div>

                                                 <div class="form-group mt-3">
                                                     <label for="message" class="form-label">Enter Your Message</label>
                                                     <textarea class="form-control" name="message" id="message" rows="4"></textarea>
                                                 </div>

                                                 <div class="form-group text-center mt-3">
                                                     <input type="submit" class="btn btn-outline-dark mt-3" value="Send Message">
                                                 </div>
                                             </form>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </section>

                 <footer class="bg-dark mt-5 py-4">
                     <div class="container">
                         <div class="row">
                             <!-- Left Section: Logo & Description -->
                             <div class="col-md-6">
                                 <div class="container pt-3">
                                     <img src="<%= webpageItems.get("logo") %>" height="50px" class="bg-white" alt="Logo">
                                     <p class="text-white mt-3">
                                         Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                         Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.
                                     </p>
                                 </div>
                             </div>

                             <!-- Right Section: Quick Links -->
                             <div class="col-md-6">
                                 <div class="container mt-3">
                                     <p class="text-white fs-5">Quick Links</p>
                                     <ul class="list-unstyled">
                                         <li><a href="#about-us" class="text-white text-decoration-none">About Us</a></li>
                                         <li><a href="#contact-us" class="text-white text-decoration-none">Contact Us</a></li>
                                     </ul>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </footer>
             </main>

             <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
             <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
         </body>
    </html>
}<%
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    try {
        if (result != null) result.close();
        if (statement != null) statement.close();
        if (connection != null) connection.close();
    } catch (SQLException e) {
        out.println("Error closing resources: " + e.getMessage());
    }
}
%>

