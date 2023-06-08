package com.cos.bogeum.repository;

import com.cos.bogeum.model.Finds;
import com.cos.bogeum.model.Free;
import com.cos.bogeum.model.Inquirys;
import com.cos.bogeum.model.Reply;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

    public interface ReplyRepository extends JpaRepository<Reply, Integer> {
        List<Reply> findByFinds(Finds finds);

        List<Reply> findByinquirys(Inquirys inquirys);

        List<Reply> findByFree(Free free);

    }

