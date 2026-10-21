Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792608894;
	b=5Iei+DOzOYfLNysnVVdohDWyJkQPSxP/FgipYFNS1RzrMu+b1p0chkPq87vPHk/zi7Ya
	 bR/9TsHR23BgS2DwWxMwccDC5fFv/AJythvuIXXgiSRSIoNVEjYFo4SDbCXBA9eRrYoNI
	 Q57GwXhlGxkQDzn7rrk+Xj3hGM3q58SIcb9kjBNgT4/qXbhyWarmR1jaFr8ioUl1yL6ev
	 tpexpDgF69ZgFRpn6e/Ds8bJmP3TDHg7wtWiFN29SsT/gAfo7mird2CmIa+tH0D9IO+Rf
	 tV7Sn/8on2PqzsGzW0PPqGk33tpiQd8ETk5fXm4904anUaMCsSI3ZCqiXQDnXHYqghA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792608894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=FAatMgI47RcpdmhEQp6ZyvK4uPwUgdd9UV442LX/ajU=;
	b=Fig4VBTpTfzx3Z5mhBJervG3l07jj6/d9FvVfBEy/s502hwxZyIOQzeYz5Np8OPNwXMH
	 aAlKS9apypP5XwDCXyEyu27G+8PqhZz6wqgphiVT6yrFRl3dMZlfuB69PMTF7Qq3se1n6
	 t9FgZr8Vpxq1XgjJanM80azZumUsB3uxrKvTvdZLbmbnJJUHWJdMzjI8hIvsLZdAgjYCA
	 tIc+NZd2mhLBMFPFGzNlmYs25mdXfkAiBK+u+b+AykIz+04wbBPBdcR3UF9GEpyvEdg6X
	 UJnmHr4O82NlDnNHYYcMcvxwtJ5VPOxJSKi3zgiyCHDuWf4W21vxt2oWoU/iAiktWXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tavip.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="XFko/2ds";
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D03606A322
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 18:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D03606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tavip.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=XFko/2ds
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aaee1fc104so1316443a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 11:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792608894; x=1793213694; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FAatMgI47RcpdmhEQp6ZyvK4uPwUgdd9UV442LX/ajU=;
        b=XFko/2dsx6vJOqx+MzybMZnJM6liXwHPqhafCkYbSFjYoCotn4CRvT4VVGUjhhKLvv
         YMnxDX02DpBdNK1R8UzKpRR68C1UGhv+EM9/+aaiCvohieEUGfSOchcitBt1xz3TI05P
         j/rBf6fA4xnamsGBTqfQZN+E1o7BHhIrmg0JtCORBHZX0LQVjBxCjjsTHjDFV9MleCM3
         RYnbWjaIi1IBNyPFDu4j6stAc0Iv+bbvVdDwlc3CoVAJYQlh9jLpguSu3jW0n8oSr2F4
         xcLbhbkZeZW9bOrfTLx0KTXAkMFNWPmdoblwju3UahkdQnjZPizVHpb/c7o7wVedIn18
         +0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792608894; x=1793213694;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FAatMgI47RcpdmhEQp6ZyvK4uPwUgdd9UV442LX/ajU=;
        b=GDl/uZ1H/MY84PEO+7qWEquhB5ksWGnqoXUk2nXqaAfdxl28R4iTigp8xQf8xuAy0c
         Lzj8t24Wy6H7OSItFdi+k45x6l0+rxJTLcmm0wyB76VxF9JltDantugCKmPGWDQ3zgit
         URw/Xuov/ZddZprlqYlbeJvMsaW3sYH0RaGqBizbUzBURsJLGobeNKFmYm12RBkhXwUp
         QpIYlP6fDidp3+L3JWsVp5MHGz1a41/a6Bf2LGkMlmJD/edJk29IZhMzl3zFPHm3JmLU
         hEcXyth53vBdu65+97zyGguAGkL5DUzOLkrZ29b6Vk1XO7A1Ddfj6TT8yWYmsf0RxBW9
         vQsA==
X-Forwarded-Encrypted: i=1; AKwUvByVq5zAtHGNauIs08PgdaBJX6rPdbnYOkDUufmzDzX5hmjbhHmvq48CxnvkCGdG5kEmVldr+pNHjIuTZd71jbk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCNkx+5ragJyNkO3/CUZV8bWZsHVVeBm83upB6K+kqTvJxPfH8
	xABqPYqj6HvsYTF8iJn48iCRr0NG16LRSikBJSIA63XQ3hsum8t11Z7T2hKVMADWjEf0cgEHrq7
	esQ==
X-Received: from pjne1.prod.google.com ([2002:a17:90a:8181:b0:3ab:2711:625])
 (user=tavip job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3846:b0:3ac:85be:cd52
 with SMTP id 98e67ed59e1d1-3ad86f7388cmr2885901a91.59.1792608893355; Wed, 21
 Oct 2026 11:54:53 -0700 (PDT)
Date: Wed, 21 Oct 2026 18:54:46 +0000
In-Reply-To: <20261021185447.2914274-1-tavip@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021185447.2914274-1-tavip@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261021185447.2914274-2-tavip@google.com>
Subject: [PATCH v3 1/2] tcp: clamp return value of tcp_wmem_schedule() to non-negative
From: Octavian Purdila <tavip@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Wei Wang <weiwan@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Octavian Purdila <tavip@google.com>
Content-Type: text/plain; charset="UTF-8"

When sk_wmem_schedule(sk, copy) fails under TCP memory pressure and
sk->sk_wmem_queued already reaches or exceeds sysctl_tcp_wmem[0],
tcp_wmem_schedule() returns min(copy, sk->sk_forward_alloc).

However, sk->sk_forward_alloc is a signed int that can transiently
become negative when tcp_collapse() re-packs partially read or high
payload-to-truesize SKBs in the receive queue and charges newly
allocated SKBs via sk_mem_charge() before freeing the original SKB.

If tcp_wmem_schedule() returns a negative value, tcp_sendmsg_locked()
passes that negative copy length to skb_copy_to_page_nocache() ->
copy_from_iter_full() -> check_copy_size(), where it is converted to an
unsigned size_t > INT_MAX, triggering a WARN_ON_ONCE(bytes > INT_MAX)
in production and returning -EFAULT instead of waiting for memory or
returning -EAGAIN:

  WARNING: CPU: 1 PID: 939331 at include/linux/thread_info.h:249 tcp_sendmsg+0x10c1/0x1530
  Call Trace:
   <TASK>
   __sys_sendmsg+0x292/0x490
   do_syscall_64+0x88/0x340
   entry_SYSCALL_64_after_hwframe+0x76/0x7e

Clamp the return value of tcp_wmem_schedule() to [0, copy] so callers
treat negative sk_forward_alloc as 0 available bytes.

Fixes: 849b425cd091 ("tcp: fix possible freeze in tx path under memory pressure")
Assisted-by: LLM
Signed-off-by: Octavian Purdila <tavip@google.com>
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
 net/ipv4/tcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 87ef6d5cbfeba..0e062fcd94a6c 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1037,7 +1037,7 @@ int tcp_wmem_schedule(struct sock *sk, int copy)
 	left = READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_wmem[0]) - sk->sk_wmem_queued;
 	if (left > 0)
 		sk_forced_mem_schedule(sk, min(left, copy));
-	return min(copy, sk->sk_forward_alloc);
+	return clamp(sk->sk_forward_alloc, 0, copy);
 }
 
 void tcp_free_fastopen_req(struct tcp_sock *tp)
-- 
2.56.0.307.g5fe7bd680c-goog

