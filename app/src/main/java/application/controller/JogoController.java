package application.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.model.Genero;
import application.model.Jogo;
import application.repository.GeneroRepository;
import application.repository.JogoRepository;

@Controller
@RequestMapping("/jogos")
public class JogoController {
    @Autowired
    private GeneroRepository generosRepo;

    @Autowired
    private JogoRepository jogosRepo;

    @RequestMapping("/list")
    public String list(Model ui) {
        ui.addAttribute("jogos", jogosRepo.findAll());
        return "/jogos/list";
    }

    @RequestMapping("/insert")
    public String insert(Model ui) {
        ui.addAttribute("genero", generosRepo.findAll());
        return "/jogos/insert";
    }
    
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestParam("titulo") String titulo, @RequestParam("multiplayer") Boolean multiplayer, @RequestParam("genero_id") Long genero_id) {
        Optional<Genero> resultado = generosRepo.findById(genero_id);
        if(resultado.isPresent()) {
            Jogo jogo = new Jogo();
            jogo.setTitulo(titulo);
            jogo.setMultiplayer(multiplayer);
            jogo.setGenero(resultado.get());
            
            jogosRepo.save(jogo);
        }

        return "redirect:/jogos/list";
    }

    @RequestMapping("/update") 
    public String update(@RequestParam("id") long id, Model ui) {
        Optional<Jogo> result = jogosRepo.findById(id);
        if(result.isPresent()) {
            ui.addAttribute("jogos", result.get());
            ui.addAttribute("generos", generosRepo.findAll());
            return "/jogos/update";
        }

        return "redirect:/jogos/list";
    }


    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam("id") Long id, @RequestParam("titulo") String titulo, @RequestParam("multiplayer") Boolean multiplayer, @RequestParam("genero_id") Long genero_id) {
        Optional<Jogo> result = jogosRepo.findById(id);
        if(result.isPresent()) {
            Optional<Genero> resultGenero = generosRepo.findById(genero_id);
            if(resultGenero.isPresent()) {
                result.get().setTitulo(titulo);
                result.get().setGenero(resultGenero.get());
            }
            jogosRepo.save(result.get());
        }
        return "redirect:/jogos/list";
    } 
}
