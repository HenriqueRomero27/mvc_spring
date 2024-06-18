package application.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import application.repository.GeneroRepository;
import application.repository.JogoRepository;

@Controller
@RequestMapping("/jogos")
public class JogoController {
    @Autowired
    private GeneroRepository generosRepo;

    @Autowired
    private JogoRepository jogosRepo;

    // @RequestMapping("/list")
    
}
