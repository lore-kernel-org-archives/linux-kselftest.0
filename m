Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3DA322A2E
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 06:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781850657; cv=none; b=N3lI/5qQP1Abss8xXQbZlixVNiGdc0ZhkM4ch4zYdHq1oQ4uRFSm9ZHtob2oNmN3/M0vWZz2jWXm0bt7UK9+pDyoTMST88Nvm3Ob6W7w2xrNXsr+tG/DUT8CxJFoVOeqtCkHo8ks1rOvCJrvtOqqkG337nms9l1e2RZMRCrk9D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781850657; c=relaxed/simple;
	bh=7jNRGL9wLLf/n8BacQ6MdJ5odGHwhYnnHCg2eGttY8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kDvGPVDbXcqiSRjp9UHAEnZQ8iq/l32YedS2BqZgySw0af/9lRUXK7H4wGZdlC2jlCpUq2d6XXjq+F+RP0uLgPbGLkrvPa2BDvfzIQACs33XcEFhatcdxAth9LVT7NdcE1vchz/OckO75MNi6ai8m69WroCqgbY32kPjCbF0V6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zv1uLapq; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zv1uLapq"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so1284295b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 23:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781850656; x=1782455456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/a9K7WnQpx0xR5fjHURf+lcE2o2CPd+Qu05sU/3h0S4=;
        b=Zv1uLapqcQMNvR0x2XJdA90YNABwafKQHsMje5QJdxcuiQYbtK+GIRe8e1kpR9fq9c
         kco7AsncrfR1T8sdCUHmHnO2FzVQEL9LKAjlR5N1W3o9S0aYT6RhN0EOwE9BVoeI2ia3
         mR91EBxNu664M6HTRMIpDLk20/eAKFhQ0GraG9XsCETztwf0ylKWpbec5+fBwI3Dc0X+
         sST6fDpFuWMmaisHIzTqEzlR06e/40ZtVjE1SVZMsEiXQYyeBlxg1RHbT2ZoYjsaGYqM
         zUCAcO/HDVRhy+tkQ+kttJQCDrkA6zFi6UdMdi9aZ2w+Wt+0A7B9fJ/+EcIC8fCdpg5h
         Z5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781850656; x=1782455456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/a9K7WnQpx0xR5fjHURf+lcE2o2CPd+Qu05sU/3h0S4=;
        b=KHwhiKH4ZDeFGbqYlwyfFS+BRpqfVBfErSMIG2B48WN9WmmjnLr44aAH5kQ6SvjdXS
         QEn7lU2gcA6iK83YClZa1mJdcIDM7QJRtDamXZYClcpA573AmbPaMoV6KAHIGCPykWwO
         hfkTNuVRtLSMbAncMyoFGe9cotaqqiOByLXxGxvgSBpoTG3GAnFqXdPG6O6cMLmswS4a
         9fuBl6WqSHNTcAXJ46pgPD8MXwqFA6BWF6nl5JtBuzyH1mGbAw9WEXoJUzQNeAZyPljw
         WvFT00tGWvYSkiFYR796JJU/42mlpck5zAgh2WpO9yqdX8dF5YS2NF/xV0ciqxZoGjJr
         zaXw==
X-Forwarded-Encrypted: i=1; AFNElJ/3jbJJp7Aw6Z0LuDwN9HKtm/ic/OsjXxaA4gP0fQs65MA62ZL7bDzSFa6DrwRgLWvvtnXJeL1uDWXanLuVLfo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+VMJGsUebCVINZdT6DY1+G+X41EOTYSl1aBt8D/X3560yW7bG
	pCp7D6WOcRL4g9tSBPtoUq3by1G9UY285QXBQUsgd5KOW69gUvwTdZsQ
X-Gm-Gg: AfdE7cn6+o95KreurYMJPaB33cWUHEN07ELvYFrsuXTnACf2YLIDROwB8gEOzcnVdvq
	pjN0Yy/96B+j9m5yiAFlnllStXwc7eAObQ22dQBcEYAVHks50CZpuQdAr7dVm9nNYO0UxScUGNF
	tJbOBz7ARJAU55KcJW8QygYqD+iTuE7Lf++zwzqWYEB3yP7pePKg50bLLDnG9wviRMyvSuuacXS
	2nPf3cJOiLiHtdpS+6dj98IuEJj75iGYmFqlsPBFJja/KOYXroCM8MXp49Hxy5tOquslpSCGKNb
	294onbXZ0eVtWtChliZwz/Q6wQzf4EIBClibGpROwozp/qxmnixza9vEv1kn1AQ6EzNkkR/rlTA
	mqbRLvzSxk70t6gUUKYUlJD0F8GK42orug7LYehhV+PDEMHCKQ9PpBxfPdcwqoj+ndyYclz1S+S
	vodVa5HnTO35beK2ybxgOmk1RWXIx6zr2utnrLQr+eRX3v40apFTI=
X-Received: by 2002:aa7:9062:0:b0:842:4982:81c with SMTP id d2e1a72fcca58-845560b04d0mr1600983b3a.20.1781850655672;
        Thu, 18 Jun 2026 23:30:55 -0700 (PDT)
Received: from cps-manycore-1.. ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455382b886sm1380096b3a.51.2026.06.18.23.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 23:30:55 -0700 (PDT)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Simon Horman <horms@kernel.org>,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf v4 2/3] bpf, sockmap: reject a packet-modifying SK_SKB stream parser
Date: Fri, 19 Jun 2026 06:29:51 +0000
Message-ID: <20260619062959.3277612-3-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619062959.3277612-1-rhkrqnwk98@gmail.com>
References: <20260619062959.3277612-1-rhkrqnwk98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sk_psock_strp_parse() runs the BPF_PROG_TYPE_SK_SKB stream-parser program
to find the length of the next message. strparser assembles a message out
of several received skbs by chaining them onto the head's frag_list and
recording where to append the next one in strp->skb_nextp:

	*strp->skb_nextp = skb;
	strp->skb_nextp = &skb->next;

and then calls the parser on the head:

	len = (*strp->cb.parse_msg)(strp, head);

The parser is only meant to inspect the skb, but the program may call
bpf_skb_change_tail() -- or the sibling bpf_skb_pull_data(),
bpf_skb_change_head(), bpf_skb_adjust_room(), all allowed for SK_SKB.
Once the head carries a frag_list these go

	... -> skb_ensure_writable -> pskb_may_pull -> __pskb_pull_tail

and __pskb_pull_tail() frees the frag_list skbs that strparser still
tracks through skb_nextp:

	while ((list = skb_shinfo(skb)->frag_list) != insp) {
		skb_shinfo(skb)->frag_list = list->next;
		consume_skb(list);
	}

strp->skb_nextp now points into a freed sk_buff. The next segment of
the same message arrives in __strp_recv(), which links it with
*strp->skb_nextp = skb, an 8-byte write into the freed skb. The free
and the write happen in different __strp_recv() calls, so the message
has to span at least three segments before it triggers.

  BUG: KASAN: slab-use-after-free in __strp_recv+0x447/0xda0
  Write of size 8 at addr ffff88810db86140 by task repro/349

  Call Trace:
   <IRQ>
   __strp_recv+0x447/0xda0
   __tcp_read_sock+0x13d/0x590
   tcp_bpf_strp_read_sock+0x195/0x320
   strp_data_ready+0x267/0x340
   sk_psock_strp_data_ready+0x1ce/0x350
   tcp_data_queue+0x1364/0x2fd0
   tcp_rcv_established+0xe07/0x1640
   [...]

  Allocated by task 349:
   skb_clone+0x17b/0x210
   __strp_recv+0x2c3/0xda0
   __tcp_read_sock+0x13d/0x590
   [...]

  Freed by task 349:
   kmem_cache_free+0x150/0x570
   __pskb_pull_tail+0x57b/0xc20
   skb_ensure_writable+0x236/0x260
   __bpf_skb_change_tail+0x1d4/0x590
   sk_skb_change_tail+0x2a/0x40
   bpf_prog_1b285dcd6c41373e+0x27/0x30
   bpf_prog_run_pin_on_cpu+0xf3/0x260
   sk_psock_strp_parse+0x118/0x1e0
   __strp_recv+0x4f6/0xda0
   [...]

The same resize also leaves the head's length inconsistent with its
frags, so a later __pskb_pull_tail() can instead hit the
BUG_ON(skb_copy_bits(...)) in net/core/skbuff.c.

A stream parser is only meant to measure the next message, not to modify
the packet. Reject a parser whose program can change packet data
(prog->aux->changes_pkt_data) at attach time. The check is shared by
sock_map_prog_update() and sock_map_link_update_prog(), which between them
cover prog attach, link create and link update. Verdict programs are
unaffected and may still modify the skb.

Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
 net/core/sock_map.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/net/core/sock_map.c b/net/core/sock_map.c
index 99e3789492a0..c60ba6d292f9 100644
--- a/net/core/sock_map.c
+++ b/net/core/sock_map.c
@@ -1515,6 +1515,17 @@ static int sock_map_prog_link_lookup(struct bpf_map *map, struct bpf_prog ***ppr
 	return 0;
 }
 
+static int sock_map_prog_attach_check(enum bpf_attach_type attach_type,
+				      struct bpf_prog *prog)
+{
+	/* A stream parser must not modify the skb, only measure it. */
+	if (prog && attach_type == BPF_SK_SKB_STREAM_PARSER &&
+	    prog->aux->changes_pkt_data)
+		return -EINVAL;
+
+	return 0;
+}
+
 /* Handle the following four cases:
  * prog_attach: prog != NULL, old == NULL, link == NULL
  * prog_detach: prog == NULL, old != NULL, link == NULL
@@ -1533,6 +1544,10 @@ static int sock_map_prog_update(struct bpf_map *map, struct bpf_prog *prog,
 	if (ret)
 		return ret;
 
+	ret = sock_map_prog_attach_check(which, prog);
+	if (ret)
+		return ret;
+
 	/* for prog_attach/prog_detach/link_attach, return error if a bpf_link
 	 * exists for that prog.
 	 */
@@ -1776,6 +1791,11 @@ static int sock_map_link_update_prog(struct bpf_link *link,
 		ret = -EINVAL;
 		goto out;
 	}
+
+	ret = sock_map_prog_attach_check(link->attach_type, prog);
+	if (ret)
+		goto out;
+
 	if (!sockmap_link->map) {
 		ret = -ENOLINK;
 		goto out;
-- 
2.43.0

