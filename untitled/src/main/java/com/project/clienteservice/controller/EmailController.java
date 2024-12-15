package com.project.clienteservice.controller;

import com.project.clienteservice.entity.Email;
import com.project.clienteservice.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/emails") // Caminho base para os endpoints de email
public class EmailController {

    @Autowired
    private EmailService emailService; // Supondo que exista um serviço para o email

    // Adicionando um novo email
    @PostMapping("/add-email")
    public ResponseEntity<Void> addEmail(@Valid @RequestBody Email email) {
       emailService.addEmail(email); // Chama o método do serviço para salvar o email
        return ResponseEntity.ok().build(); // Retorna uma resposta 200 OK
    }
}