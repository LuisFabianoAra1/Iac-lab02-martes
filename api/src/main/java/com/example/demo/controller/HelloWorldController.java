package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// Marking this class as a REST controller
@RestController
public class HelloWorldController {

    // Mapping the root URL ("/") to this method
    @RequestMapping("/")
    public String helloWorld() {

        // Returning a simple "Hello World" response
        return "Hello World";
    }
}