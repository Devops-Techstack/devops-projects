package com.example;
 
 import org.junit.jupiter.api.Test;
 import static org.junit.jupiter.api.Assertions.assertTrue;
 
 class AppTest {
 
     @Test
     void testApp() {
         String message = "Welcome to the channel DevOps Techstack from scratch";
         assertTrue(message.contains("DevOps Techstack"));
     }
 }
