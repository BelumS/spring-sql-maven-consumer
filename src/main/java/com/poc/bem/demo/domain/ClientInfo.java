package com.poc.bem.demo.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;

/**
 * Created by bel-sahn on 7/31/19
 */
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ClientInfo {
    @JsonIgnore
    private String clientId;

    @JsonIgnore
    private String clientSecret;

    private String issuer;
    private String subject;
    private LocalDate issuedAt;
    private LocalDate expiresAt;
}
