package com.example.house_rent.Bean;

public class emailAndChecking {
    private String email;
    private String checking;

    public emailAndChecking(String email, String checking) {
        this.email = email;
        this.checking = checking;
    }

    public emailAndChecking() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getChecking() {
        return checking;
    }

    public void setChecking(String checking) {
        this.checking = checking;
    }

    @Override
    public String toString() {
        return "emailAndChecking{" +
                "email='" + email + '\'' +
                ", checking='" + checking + '\'' +
                '}';
    }
}
