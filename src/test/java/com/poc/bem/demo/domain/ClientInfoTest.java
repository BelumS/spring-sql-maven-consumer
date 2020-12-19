package com.poc.bem.demo.domain;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@ExtendWith(SpringExtension.class)
class ClientInfoTest {
    private ClientInfo info;

    @BeforeEach
    void setup() {
        info = new ClientInfo(
                "ID",
                "SECRET",
                "TEST",
                "TEST",
                LocalDate.now(),
                LocalDate.now().plusDays(1)
        );
    }

    @Test
    void test() {
        info = new ClientInfo();
        assertNotNull(info);
    }

    @Test
    void testAlt() {
        assertNotNull(info);
    }

    @Test
    void testClientId() {
        assertNotNull(info.getClientId());
    }

    @Test
    void testClientSecret() {
        assertNotNull(info.getClientSecret());
    }

    @Test
    void testIssuer() {
        assertNotNull(info.getIssuer());
    }

    @Test
    void testSubject() {
        assertNotNull(info.getSubject());
    }

    @Test
    void testIssuedAt() {
        assertNotNull(info.getIssuedAt());
    }

    @Test
    void testExpiresAt() {
        assertNotNull(info.getExpiresAt());
    }

    @Test
    void testToString() {
        assertNotNull(info.toString());
    }
}
