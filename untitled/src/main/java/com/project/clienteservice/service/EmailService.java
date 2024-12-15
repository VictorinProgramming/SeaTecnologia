package com.project.clienteservice.service;

import com.project.clienteservice.entity.Email;
import com.project.clienteservice.repository.EmailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    private final EmailRepository emailRepository;

    @Autowired
    public EmailService(EmailRepository emailRepository) {
        this.emailRepository = emailRepository;
    }

    public void addEmail(Email email) {
        // Lógica para adicionar o email no banco de dados
        emailRepository.save(email);
    }
}
