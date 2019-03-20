package com.lego.care4you.demo.controller;

import com.lego.care4you.demo.domain.Company;
import com.lego.care4you.demo.dto.CompanyDTO;
import com.lego.care4you.demo.repository.CompanyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.websocket.server.PathParam;
import java.util.ArrayList;
import java.util.List;

@RestController
public class CompanyController {

    @Autowired
    CompanyRepository companyRepository;

    @RequestMapping(
            value = "/allCompanies",
            method = RequestMethod.GET)
    public ResponseEntity<List<Company>> getAllCompanies() {

        Iterable<Company> positions = companyRepository.findAll();

        List<Company> target = new ArrayList<>();
        positions.forEach(target::add);
        return new ResponseEntity<>(target, HttpStatus.OK);
    }

    @RequestMapping(
            value = "/Companies/{id}",
            method = RequestMethod.GET)
    public ResponseEntity<Company> getCompanyById(@PathParam("id") String id) {
        Company company = companyRepository.findTopById(id);

        return new ResponseEntity<>(company, HttpStatus.OK);
    }
}
