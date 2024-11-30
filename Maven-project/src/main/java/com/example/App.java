package com.example;
 
 import org.springframework.boot.SpringApplication;
 import org.springframework.boot.autoconfigure.SpringBootApplication;
 import org.springframework.web.bind.annotation.GetMapping;
 import org.springframework.web.bind.annotation.RestController;
 
 @SpringBootApplication
 public class App {
 
     public static void main(String[] args) {
         SpringApplication.run(App.class, args);
     }
 }
 
 @RestController
 class WelcomeController {
 
     @GetMapping("/")
     public String welcome() {
         return "Welcome to the channel DevOps Techstack !!";
     }
 }