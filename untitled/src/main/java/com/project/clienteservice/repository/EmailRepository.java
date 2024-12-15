package com.project.clienteservice.repository;

import com.project.clienteservice.entity.Email;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmailRepository extends JpaRepository<Email, Long> {
}
