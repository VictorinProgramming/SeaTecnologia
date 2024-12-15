package com.project.clienteservice.service;

import com.project.clienteservice.dto.Endereco;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Service
public class ViaCEPIntegrationService {

    private static final String VIA_CEP_URL = "https://viacep.com.br/ws/%s/json/";

    public Endereco consultarCEP(String cep) {
        RestTemplate restTemplate = new RestTemplate();
        String url = String.format(VIA_CEP_URL, cep);
        try {
            return restTemplate.getForObject(url, Endereco.class);
        } catch (RestClientException e) {
            throw new RuntimeException("Erro ao consultar CEP.", e);
        }
    }
}