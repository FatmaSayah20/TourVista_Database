# TourVista Database


**📌 Project Overview**

TourVista is a relational database system for a tourist guide company.
It manages tourists, companions, bookings, tours, hotels, services, events, travel agents, administrators, and national places.
The goal is to ensure smooth operations, efficient management, and memorable travel experiences.

**🗂 Key Entities & Relationships**

**🧍 Tourist & Companion**

    Each tourist has a unique ID, name, nationality, and contact info.
    
    Tourists may bring multiple companions (each with ID, name, nationality, and relationship).

**🚌 Tours & Services**

    Tours have unique codes, locations, arrival/departure times.
    
    Each tour offers multiple services (shopping, restaurants, cinema, etc.).
    
    Multiple tourists can join multiple tours.

**📑 Booking**

    Managed by tourists.
    
    Each booking has a unique ID, arrival airport, date, type (Hotel, Tour, Flight, Car Rental), and price.

**🏨 Hotel & Events**

    Company-owned hotel with unique name and contact info.
    
    Hotels provide different accommodation packages.
    
    Hotels host events/festivals (time, date, type, area, street).

**👨‍💼 Administrators & Travel Agents**

    Administrators manage services (unique ID, name, phone, position).
    
    Travel agents assist tourists, offering services and guidance.

**🏛 National Places**
    
    Defined by name, location, type, and historical description.
    
    Tours and tourists can be linked to multiple national places.

**⚙️ Features**

    ✅ Normalized database schema with foreign key constraints.
    
    ✅ Pre-loaded sample data (hotels, bookings, tourists, tours, events, etc.).
    
    ✅ Example SQL queries to retrieve and analyze data.
    
    ✅ Views to simplify reporting, including:
    
            Tourist bookings
            
            Tours and national places
            
            Travel agents with services
