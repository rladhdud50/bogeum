package com.cos.bogeum.repository;

import com.cos.bogeum.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.Optional;

//JSP의 DAO , 자동으로 bean 등록이 된다. @Repository 생략가능
public interface UserRepository extends JpaRepository<Users,Integer>, JpaSpecificationExecutor<Users> /* Specification 사용 */ {
	//로그인을 위한 함수
	//JPA Naming 전략
	//select * from users where username=? AND password=?;
//	Users findByUsernameAndPassword(String username, String password);
	//위랑 같음
	//@Query(value="select * from users where username=?1 AND password=?2", nativeQuery=true)
	//User login (String username, String password);
	Optional<Users> findByUsername(String username);
	Optional<Users> findById(String id);
	Optional<Users> findByUsername2(String username2);
	Optional<Users> findByTel(String tel);
	Optional<Users> findByUsername2AndTel(String username2, String tel);
	boolean existsByUsername(String username);
	Optional<Users> findByUsername2AndEmail(String username2, String email);
	Users findByUsernameAndEmail(String username, String email);
	
	
	
}
