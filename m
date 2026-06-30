Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D97822370A
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 14:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831272; cv=none; b=DiLK0vjoRYRX7c8v5CyHvSA5MKu72gFvP+JwpL+0UYKiRqea2A0SdzTcWYzQZ0w+CrdjEZY1N8G2pMxhvziDlH4zNbXMUglge/DH026wWO4A7Dgru+3IcBJe5B6RXmdQftmWuI1mRLp7gxs+4+pyFI8ny7/NsTkZBjR2ZgTTVNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831272; c=relaxed/simple;
	bh=pl4s/6iqG4iSWxDnqowahuLLtVqCMT3nY7wajXCTXiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SsOF0/u7qi3/6ySmhPKy5xpwlC1IpqWiBWFiwYSxJIm94Fcn6L33gwDMWLF7LR7VXEydRW2u4CsX0LGzSBNjGThNbd/sepjZj2KEulZj/GpQOzD3nyviO7vcoPf+Np5v2HA2j/suVZNY9FNClKh9w+SAZPrmjoVdeJZiQZe8Gzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o6hsTLBS; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o6hsTLBS"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37f72212544so4358805a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 07:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782831270; x=1783436070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ggz9EBjbp7saeRSZLMYqE+cKP+mv7VKgG7WqG3xg4y4=;
        b=o6hsTLBSx4Kr7qQlWoowecnZW6X34nK5jfp9LxOj2H9xf/5ikM9Ck4wytu0PbO368G
         nEvftZ+DcoZmYuPU0Vw6S3JSUz9FhEQ/+FxIVJJtGyyeWR+a2SisTQhar99oqDBhPTw0
         w/RTr/Wt70COEN0raSChw0gRDXFPp5X/WUE+I8lH7bL+Zdwzk+fbo+1eTYO6N2dKrjPz
         6Yk1iKbQWOaEB2Tmniea0LPJkgZmM4XEXNTdZ87Ds8CQCjU1sieT6s+3x1VI1HNd5SLI
         xJDdaRv9unuEoXXrNKB7zMhVZDLwlbWVqfkLq833AmNo2tKGkKgNiRpv56RlUUimva2T
         UbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831270; x=1783436070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ggz9EBjbp7saeRSZLMYqE+cKP+mv7VKgG7WqG3xg4y4=;
        b=pUvmMZZAEynuxEsC/SlFpr3RugBpOntjtsbuBg0Dwooy2KI+l61YahKV6n+rZbfp9M
         wc9kZQ20sdXYIFJKAc2MCxzyU2suX3agW82BMoaXzZFPpuFlt99lK5FczTC1vo2Dkzf4
         Rn9QoiLa8BhbAGYU4cBb1awR1PtLQ0PSqdPxRG31gLY+8LeBvMgkvDLT5+CB4y6htLEV
         5lyXZbf7ROmEYAvOwCSycKsvn2LqSH/Sg1ySfx69AG2ga5IKWDiEHfslR2UIVU65PTQL
         d6rIkl7SCKD1dUymBIuJy+PyAdq5R/le3kuXjElPIS7UnqYEDBd4jFZqXrErkxrb3g+v
         t2hw==
X-Forwarded-Encrypted: i=1; AHgh+RruLimA7EjnqHnhYJcdiA+bfRjldDXnAAZ2se9Vsf3YEbYY7VbEAyIjvR3rh4LOZ/4Ij8lvOj8m9gT2z/NlLl0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Fa2SDvQzo/Gwj+5nItRRgtW3zXu1IL0TEzVvAZzkusE/RkQG
	4kRsAyS4bwsTTBEb7ILUAGSVPBQ6IWuoRUjF/TssfikowqWpydiPsumY
X-Gm-Gg: AfdE7clSrANEXNqxPCvWfw9S8+zWwB3AfXu53W43hIVBSH/ZhtywjZrBVWiMmQmm8rG
	73+zubr1j63fHpH7lk23az0lVoB1qqz0zrZxMQXurtp4J/QLYOlD6fGygXy5Vlj5XA4OKHYA8sH
	7GIo/AiDzGsozmQqA3ZXYU9DuvIxsK8GG/Y7fRr0+gtWFVI7oIAD05D6nDXDHB5g1wxjlPN7XGX
	GLYFjAZDDSrZd3BKXjOp3iaqRYNQCHD3KEvKFVYGyWIk1iXNfXdednhaRvEUM2fUBttacgS4uPO
	Bi2ifbOeiuY7btQ/C8YUnB66m/MAqdHdRQlq7jU9lLHkcX2cdnLjR+s5baaIq/gimV72kkq/fBp
	3aq1NFOt/qcTEhjXKhTodXEWpC5LvLDusTi8gBp7uMlDknCQoZYJKUeofFmxMLj/bC3InQ+bpDe
	fGNuqtNYGEqFRa9qiIz3IOoM8SPbYfw2aFej0eXylcebHVOlv6ikQ=
X-Received: by 2002:a17:90b:3dce:b0:37f:9ce1:cdb1 with SMTP id 98e67ed59e1d1-3808c1035e3mr705579a91.31.1782831270257;
        Tue, 30 Jun 2026 07:54:30 -0700 (PDT)
Received: from cps-manycore-1.. ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095b684basm20122a91.1.2026.06.30.07.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:54:29 -0700 (PDT)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	John Fastabend <john.fastabend@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Varun R Mallya <varunrmallya@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v4 1/2] bpf, sockmap: disallow update and delete from tc, xdp, socket_filter and flow_dissector
Date: Tue, 30 Jun 2026 14:54:05 +0000
Message-ID: <20260630145410.3648099-2-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630145410.3648099-1-rhkrqnwk98@gmail.com>
References: <20260630145410.3648099-1-rhkrqnwk98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sock_map_update_common() and __sock_map_delete() hold stab->lock and call
sock_map_unref() -> sock_map_del_link(), which takes sk_callback_lock for
write. That gives the order stab->lock -> sk_callback_lock.

The reverse order comes from the SK_SKB stream parser.
sk_psock_strp_data_ready() holds sk_callback_lock for read, and after the
verdict tcp_bpf_strp_read_sock() acks the consumed data inline via
__tcp_cleanup_rbuf(). The ACK goes out egress, where a sched_cls program
deletes from the sockmap and takes stab->lock:

  WARNING: possible circular locking dependency detected
  ------------------------------------------------------
  syz.9.8824 is trying to acquire lock:
  (&stab->lock){+.-.}-{3:3}, at: __sock_map_delete net/core/sock_map.c:421
  but task is already holding lock:
  (clock-AF_INET){++.-}-{3:3}, at: sk_psock_strp_data_ready net/core/skmsg.c:1173

  -> #1 (clock-AF_INET){++.-}-{3:3}:
         _raw_write_lock_bh
         sock_map_del_link net/core/sock_map.c:167
         sock_map_unref net/core/sock_map.c:184
         sock_map_update_common net/core/sock_map.c:509
         sock_map_update_elem_sys net/core/sock_map.c:588
         map_update_elem kernel/bpf/syscall.c:1805

  -> #0 (&stab->lock){+.-.}-{3:3}:
         _raw_spin_lock_bh
         __sock_map_delete net/core/sock_map.c:421
         sock_map_delete_elem net/core/sock_map.c:452
         bpf_prog_06044d24140080b6
         tcx_run net/core/dev.c:4451
         sch_handle_egress net/core/dev.c:4541
         __dev_queue_xmit net/core/dev.c:4808
         ...
         tcp_bpf_strp_read_sock net/ipv4/tcp_bpf.c:701
         strp_data_ready net/strparser/strparser.c:402
         sk_psock_strp_data_ready net/core/skmsg.c:1174
         tcp_data_queue net/ipv4/tcp_input.c:5661

  Possible unsafe locking scenario:

         CPU0                    CPU1
         ----                    ----
    rlock(clock-AF_INET);
                                 lock(&stab->lock);
                                 lock(clock-AF_INET);
    lock(&stab->lock);

   *** DEADLOCK ***

A tc, xdp, socket_filter or flow_dissector program has no reason to
update or delete a sockmap, and redirect does not go through here. Drop
them from may_update_sockmap() so the verifier rejects it. It also
closes the matching sockhash inversion.

Suggested-by: John Fastabend <john.fastabend@gmail.com>
Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
 kernel/bpf/verifier.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 25aea4271cd0..83ea3b33ff67 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -8488,12 +8488,7 @@ static bool may_update_sockmap(struct bpf_verifier_env *env, int func_id)
 		if (func_id == BPF_FUNC_map_delete_elem)
 			return true;
 		break;
-	case BPF_PROG_TYPE_SOCKET_FILTER:
-	case BPF_PROG_TYPE_SCHED_CLS:
-	case BPF_PROG_TYPE_SCHED_ACT:
-	case BPF_PROG_TYPE_XDP:
 	case BPF_PROG_TYPE_SK_REUSEPORT:
-	case BPF_PROG_TYPE_FLOW_DISSECTOR:
 	case BPF_PROG_TYPE_SK_LOOKUP:
 		return true;
 	default:
-- 
2.43.0

