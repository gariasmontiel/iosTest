# MVP Swift Project


This project was developed in Swift using the **MVVM (Model-View-ViewModel)** architectural pattern combined with **SwiftUI** for the user interface, following **Clean Architecture** principles.

Youtube video: https://youtu.be/Qt2cyBJjYLI

## Key Concepts

### Memory Management
Memory is managed automatically through **ARC (Automatic Reference Counting)**. ARC tracks the number of strong references to each object. When an object's reference count drops to zero, it is automatically deallocated, promoting efficient memory use.

### Clean Architectural Layers
The project separates responsibilities clearly across layers:

- **Model Layer**:  
  Contains business logic, networking operations, and database entities.

- **ViewModel Layer**:  
  Handles presentation logic, transforming models into view-ready data and managing user interactions.

- **View Layer**:  
  Built with SwiftUI (or UIKit if needed), focusing on UI rendering and user interaction. The view remains passive, binding only to the ViewModel.

### Dependency Injection
ViewModels receive their dependencies, such as the network client or persistence manager, via their initializers.  
This promotes **testability** and **loose coupling** between layers.

### Testability-Focused Code Design
Several principles are followed to ensure the code is easily testable:

- **Separation of Concerns**:  
  Each class or module has a single, clear responsibility, making it easier to isolate and test.

- **Dependency Injection**:  
  Dependencies are injected rather than hard-coded, allowing real services to be replaced with mocks or fakes during testing.

- **Protocol-Oriented Programming**:  
  Behaviors are defined using protocols, and code relies on abstractions rather than concrete types, improving flexibility and simplifying mocking.

- **Minimizing Static/Shared State**:  
  Global dependencies (e.g., singletons) are minimized or abstracted behind protocols to reduce tight coupling and enhance testability.

---

## Technologies Used
- Swift 5+
- SwiftUI
- MVVM
- Clean Architecture principles
- Protocol-Oriented Programming

---

## Project Structure Overview
