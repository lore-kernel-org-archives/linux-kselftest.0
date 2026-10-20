Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514338;
	b=BR0dfn2r9EScnBPy3OHArj5Z6DmrXvjyFQZV/NtKS6Fm8ztrRcENxgrZ6dOLZ9hIXdXR
	 ffhGDhcpMWFuHqcwDiWGtIiF+vCs/9eSKCkrsfYKaYsKucp9EFKwdzW5+AA5CvMn7ONRj
	 AQxN9N364QnJNNm+CJr2fGb6/4fXxxH6wfJVl0xa16nUTMp4d08FfwVC2abSsBTYtzXyN
	 KebxBoEYxhulRaStpYKt5IffqYJUXEnYHKKSXBJniWGFcCGBHPf8IKJ8VudV39Cjx+pm9
	 rf/XtZiP/ttnSgRFj7/btWw4lb+3VT0zAOXohCLaGmvJDwdXn2xl7QGcO0nZEkkEg2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0eL1bMQxR78cjQluECOSoKDJwxenOA4EKKzM001UOl8=;
	b=1dA96+Wh8y7+lIjHgp+BLuConKcxRQk5SsCD9EwQLzSHPyGirWO/f7JWfjCUnVNT7cIS
	 SV2AlwPcWho7bEVAC8Rk+cpdgE2ofDluWDK/qcX7wGIvB9pwd+GdQCz4iREycPsIGS5KL
	 oIkGIeopaHuG/Oo808tapuA/Z+RLbtbqbhHosE12+gOw8UMHDFgTck3EAIcI3qDKjKNWm
	 gqIf9juxckq9dkuD+YDmQLHUf1fQ3tSJ5HZR0pOqrgtopWDhlRyfB6Scf+Qj9baGTcueM
	 bnQasSrc3bhOOJIugRlpxOk2GJ1AWLyZDfoGaP8v/rjAX4bKsqX+pwJ3eSD8MdMQ+fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tavip.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LI65qvPs;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94EF60A3821
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 16:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94EF60A3821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tavip.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LI65qvPs
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a086f5d91aso206414b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 09:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792514337; x=1793119137; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eL1bMQxR78cjQluECOSoKDJwxenOA4EKKzM001UOl8=;
        b=LI65qvPsu29DhnitKrQjeX1Oyih0HBMYPA1NlbfFR0nrK8jPlCK/ejNW/ME9045zp6
         JKrzAcOPqXhk8TSeomAX5EvkEHILzBmqGhOg+wV7PtTibObosXMuqlI36cAC9+4i6wP+
         lqlirBFryf9xb1XtTytmpY09juwDjBURxNjB2VMqaIOikBhy6bYedw8Dvk1T8TZDS50O
         0Hx4MYakLJo04S3kUwctFl+t01H2e5hGfVTif22TUyyLjLN25yMIwyJtODQkOJlEQoB4
         S072BEotIlkzVXo6shx+2pH1kX3DiTEoorv7zmRDUmGAMvfhd7ySxIkQZRjKE+8IX674
         zsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514337; x=1793119137;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eL1bMQxR78cjQluECOSoKDJwxenOA4EKKzM001UOl8=;
        b=qxu/b/TbUg6YFlmrptGnen4NjDmurWnsXzmOjRg1oHDWgooBZPxXI/MPoGk6JYF7fB
         FGbNRGI8sG24s8OWImhRGQeyhbp7U3z5qLICVeZDD5dShyUUuohifeeTEUCh4Ir/odJM
         eSV9dqPbquxNitQngmUKmAyRRQUOhLZmbLZCRERag1FzTFVnDzzsLzbqkVubHyCukDdF
         +gmaaDrSToDKjvhhwZmzUbzyCa9FV8YTYKxQrAjU9RXQMj+HF4Ww2jkfH8OQoTTqyUTu
         YKULtzc6PHBm0v/PWRjZFk6tzvA2uWyMThKRbjjCywcZGzNa0yrjhKFRrD+5wK0OTWrD
         wvwA==
X-Forwarded-Encrypted: i=1; AKwUvBwrpi67tQGUtkKAlKnyvbCV/mhx103bcAUC12w0KwBZ6ViA7a2dj/k65bH1pi9CBx7FNKVYJ/1f3yaTtjSMork=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7VQxjS5Jc2BJwq/jIffPYCqDa5fOlFFunF/2P+yUmonK0eOOF
	LhFcZSTjwbZMNNtDUITvzbULsOpTNLzp22M9Sfyvhu3sBGoL+FMiEll+XcCalsMZxS+1fJEg107
	XoQ==
X-Received: from pfbdr8.prod.google.com ([2002:a05:6a00:4a88:b0:89f:2041:c861])
 (user=tavip job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1393:b0:892:e080:4ed8
 with SMTP id d2e1a72fcca58-8a04ce526edmr8946515b3a.47.1792514334875; Tue, 20
 Oct 2026 09:38:54 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:38:34 +0000
In-Reply-To: <20261020163835.4076594-1-tavip@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020163835.4076594-1-tavip@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020163835.4076594-2-tavip@google.com>
Subject: [PATCH net v2 1/2] tcp: clamp return value of tcp_wmem_schedule() to non-negative
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
v2:
- Add production warning trace to the commit message.

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
2.56.0.212.g129ede20d9-goog

