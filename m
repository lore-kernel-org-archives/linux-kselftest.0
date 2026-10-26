Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792984941;
	b=aw+9CKoIfTtRg8RqoRmCTZ7T7Ys2t/GrEEPU9JmBX2pmLohCXzqRoDPaZARBtZ8IuY52
	 phleeYQpE8G4V69mP/CpwnHq8CpG4FiujKDDM8hW6ZzsH/UO52ED2l//NX7Rsl6CmJC7/
	 YfoLWo7K6WjUFZpEZOXGi2CenJ74OGGonh4R/PTCOwrF3fN46bQm5rnGfyzp2mE7QmIJ7
	 G3X+APiu4GfYZmBtLm7Ldmb0vmAalYamzhyAsl0VK788ZWMHVPT8ZP/JwcmDoCL1TXgGz
	 Jdz4y/dIhTNq2NMT4QMuFSUM0R7X5bvSfJAvkmeieXh6abUvfCCdio+9EfEQ11c+iEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=uJyYymouqBQHX6BWujXvWQ1rvhU5zBX4eBfxY6iRb/I=;
	b=xeIXIsEdCNd3iZ4pbTq7ps0FBWjzHcEsmoBTWrcr8gWNqqy1mHQNZOR6LVjuuDaF6QDL
	 33DsvhF+hMBbkHvcVveFk3/zCbLngys1jaVnMFeK/pBD+PbN83SzcCFPnRWEU6Ivy/QIo
	 E4SurLZksWwIeiIwIoQr84MS2jzQtwAIdtigQ/zsl2waLj3+tQWqbKQk+UB/aLDKOqLy8
	 ksbRnNjAN6/SaCvMWI8gfDYbpPaQWHYGXTqmBxqGcrUTzJP3Y/tWbegGX9M34FgV5xR/L
	 Pg/jG0vGPiN9twaZiB1W3LvufPus3T4QeaVHi//Fngk2NmlYWitJvzAwoLE+c1oONrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tavip.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ERs79FtN;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C474C606A327
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 03:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C474C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tavip.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ERs79FtN
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd63a7cdfb3so1597427a12.1
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 20:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792984940; x=1793589740; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJyYymouqBQHX6BWujXvWQ1rvhU5zBX4eBfxY6iRb/I=;
        b=ERs79FtNO9thnP1VqmFeDHRIDl9UWzwYvyzAuD/2OStrEBGF4w/JdXfASRhKW4kJLF
         OMk9tIq9NT9OxTB4iBe9Z2Wu2rL/t8uKLjurVf0IoUc5iINwLcRiXFC1TBO7vvRytsPm
         MHN3OgLyhI7EHz6mndJTFXYZFTPhD5LoVgSKbmq4HBaHdFIvmo4rZObBy6tKm/PLPc7N
         nY32zo7vkfa5s5qGZtbOzyh6pDwUioLwAH7RpJJuL2bJQr7j/OwWw17hQF5vTMuvFiYQ
         1/qqep5uuwJQEy3DhrO2T5oaByHxLDgRYCyDl1EvUarCjVpNQsfgUoLgr3d1yD4WBjo4
         Hx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792984940; x=1793589740;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJyYymouqBQHX6BWujXvWQ1rvhU5zBX4eBfxY6iRb/I=;
        b=Y9k6/j7EzFnffATlNyBeIISNe6JSUMUIpaWDzHpIsJ8uETAumKRVoV5b7BdXRbnltx
         IJrgPH/mLePojtyI5v2n6flUAMgk6ANhdTj/p6qaa30hc24pxFNiYa+De8lzJyLnS/wx
         SWjk8zvO07coxp2PTIw9M6RnwZZ4GPbUhoRVHzpxxn7z7lKNLgO6P5Ef7u0gFQjqaD55
         qoHl+Zks6+dlv6BAigLvCxNxld/Evh+Yy6Q2CKAxnhjUdGdAkpONejlK/g8bG2wRXsao
         8pVvxQuQwNLzSnfakdi3zU3fO6IHRGNOaGD9zIrzxpasHCiLvZH20MDx0IiJrW0YqxJy
         yhXg==
X-Forwarded-Encrypted: i=1; AKwUvByL1OqRpbAdfk7nsHIjQL2WpzLR6Q/nTE7FI9nPgAuuNZwFhzX6V4fVtmuQFJAkWdDCrtS49IsXZVkIMKVtvko=@vger.kernel.org
X-Gm-Message-State: AFq9FYJq0MZZqDTnqPXgX3IHVTL9I2uGSucRg654+09O1NEhJ19JNeD4
	3XfhNI1HkUk7bleoTcPWSOQsWhhtWQolN5g/DoQBBIJOimxgJ/Tp+Y4MW7dOTThK14DpolzpdEg
	8lQ==
X-Received: from plbbi9.prod.google.com ([2002:a17:902:bf09:b0:2e8:43aa:1e5e])
 (user=tavip job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1968:b0:2e9:95c0:7c50
 with SMTP id d9443c01a7336-2ea9c95ba36mr40443685ad.71.1792984940101; Sun, 25
 Oct 2026 20:22:20 -0700 (PDT)
Date: Mon, 26 Oct 2026 03:22:15 +0000
In-Reply-To: <20261026032216.1145201-1-tavip@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026032216.1145201-1-tavip@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261026032216.1145201-2-tavip@google.com>
Subject: [PATCH net v4 1/2] tcp: clamp return value of tcp_wmem_schedule() to non-negative
From: Octavian Purdila <tavip@google.com>
To: Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Octavian Purdila <tavip@google.com>, Eric Dumazet <edumazet@kernel.org>
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
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Octavian Purdila <tavip@google.com>
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
2.56.0.257.gf7497c7d27-goog

