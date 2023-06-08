package com.cos.bogeum.specification;

import com.cos.bogeum.model.RoleType;
import com.cos.bogeum.model.Users;
import org.springframework.data.jpa.domain.Specification;

public class AdminSpecification {//username, name, role에 따라 데이터를 필터링해서 가져옴
    public static Specification<Users> searchTypeUsername(String searchKeyword) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get("username"), "%" + searchKeyword + "%");
    }
    public static Specification<Users> searchTypeName(String searchKeyword) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get("username2"), "%" + searchKeyword + "%");
    }
    public static Specification<Users> userRole(RoleType roles) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get("roles"), roles);
    }
}
