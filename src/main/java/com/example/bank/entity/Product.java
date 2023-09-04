package com.example.bank.entity;

import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Objects;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "product")
public class Product {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne
    @JoinColumn (name = "manager_id", referencedColumnName = "id")
    private Manager managerId;

    @Column(name = "product_typ")
    private String productTyp;

    private Integer status;

    @Column(name = "currency_code")
    private Integer currencyCode;

    @Column(name = "interest_rate")
    private BigDecimal interestRate;

    @Column(name = "product_limit")
    private Integer limit;

    @Column(name = "created_at")
    private Timestamp createdAt;

    @Column(name = "update_at")
    private Timestamp updateAt;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Product product)) return false;
        return Objects.equals(id, product.id) && Objects.equals(productTyp, product.productTyp);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, productTyp);
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", managerId=" + managerId +
                ", productTyp='" + productTyp + '\'' +
                ", status=" + status +
                ", currencyCode=" + currencyCode +
                ", interestRate=" + interestRate +
                ", limit=" + limit +
                ", createdAt=" + createdAt +
                ", updateAt=" + updateAt +
                '}';
    }
}