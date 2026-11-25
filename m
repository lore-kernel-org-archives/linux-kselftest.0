Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795582216;
	b=13Ab+NElaekdPFsH7SXfdT8BraHd6bJbhgm8Q1qAYYtwfLwxgEYBDFZEWSm8PgR3vOzj
	 93eioiaur8zwK/2f3Tzm+ChYf6IY2McY0zAp4uPxmlctlSoZAAi6vH93wfpHoUIlGbUjk
	 pR8Q2hXsQ922zxTzx8qGfVy3Jrlrc4vjJ9/z9xVwuVueVxsCLn/5z6ePj2pamIPHfPRZy
	 CMp6P8fS08Iq7DjdT20IN7FWwFe+lKu6C+MOdE0M7VH8Z2w4fTiJnAijVelcCtztM9As9
	 RI+A6VfnQznpYRcY38wvPfw9d70z1nfOxBUoS109odBEsES9KZXg/rjSNvsCk8x0Fkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795582216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=WZpqROJT0TFZ0N9AeyXaUSyo/Ga6Gz526tDibJ18xQ0=;
	b=iWRj0xO9QBdLhR9YEeko1mLe+rtrYDEO/7urSPY0Xw4mG6D+LfxzK1kapvAxKFdLhKIo
	 8bQo3A07nRB06RdX1nt+cLgc/N+ZzMA3gf8wCKjoNEXIrldzloGZ2yfyhBwIYOF+a913/
	 bXCNFmDxvJECCWHqB0NKMJ6NCYKh6bv2er9X/zAFrPayUnK33OhdC+H9sHY2BRrj/TWZw
	 Lg05nMQohiicAnFK3QfN4nBzFqQiO+5kXhkFQkC0xeMFRe9jCmYAuY/Fv/sazavwthh+J
	 Gm1b1Li2La6cYQjl9QmYB6JKVHCTErmF+bw13xsp0BYjVQVlsVK9O0VCAq9cFoBkM3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LuIyU/xm";
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED545606A326
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 04:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED545606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LuIyU/xm
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f04b676219so29168625ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 20:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795582215; x=1796187015; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WZpqROJT0TFZ0N9AeyXaUSyo/Ga6Gz526tDibJ18xQ0=;
        b=LuIyU/xmh3BDPSXKUR92JkBXXf570oqi3Y8UK36zn1m+izg3teFHRAvTAlsB9d4Yrt
         jiyFW/a/MDgD+SiC5LcOCuHZl/d0LZ9ojLoiBiRbLUPiAXPE8V1tn04Z+xZZ9S02OkHv
         q74wRiIEDaVGWFMdQDDSj8tnr6h4jMIfQmwG8BpiH8brOWUXWyLafDX1bdQcLxyv3+Xk
         2qTfSxK48tIV1vEIW0cJO/CVnuRR6zspU4WW7VZfJtZDjxb1iPSXnQfotUjBi4HNNeuy
         HVpkZPW9A3Lq8RWbFGAs1/Whr/lJFzu2iS7gC2zjV4p1SX5A+QZxBfDnIkWGH6l0Zzy+
         7YnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795582215; x=1796187015;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZpqROJT0TFZ0N9AeyXaUSyo/Ga6Gz526tDibJ18xQ0=;
        b=DZFellOBp9O38RtN1GFDCbBiPuSIFIHOJcZrP9JFb08ZpKVbOGRh6o/5Jzb/QTkziy
         RCzwlOZ7cCNddhwIE5ULukVmAala8BNHrJ0024YKHzzAbznzJmy+W7IDzzNrHBXkTPak
         4BiX3KRyzslhLPCbc+Zk5Q0hFOBQX+Odw2m7n+6WLS0RvfGTyQSB5c+9axGo+UqjylSt
         sTboWY/TRyrB0lHmU8CZHgcZFHsCwPNoHEEfABU0Y8rMZZq2VFVNRGwYoUgTgZ7hxUfM
         pmrdVpOf/Cm1vxNmqxV6A795RZIqeksT0rKA6fXLe4m0Kt9g+XU15d+qruWKX8NZXoZ2
         uQ5Q==
X-Forwarded-Encrypted: i=1; AL+hErFXk/x4zPGQ5jhvYjavXLMFosXYC7KjzggPclhMAzEcG82a+8+Xf0D2I1zSAJESZAuoFbzoVrOwZBl9cXll4CE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+apgd2p5YSKCCKJnK6wKJUOKgG5l4sV/gxB34ZG+ZeRO+H4wZd
	/lPcLLZGe66AixUo/FaFMUzFXLl8qKZnW4L90Qd/3Rg01Np3N+pKbTDV
X-Gm-Gg: AZFdTZcXytfO9Kg64gCUjAVYPlKkwghw3fJS/giGk6lRLw5S+It27CNC7PD1N4z/SuS
	RUIFMVeGjnUwncGa6NSfw/Wy4V3L6skrvrCIwVK/AuDpH7FN0YCZeUxunajISWSvSaqlTEEed2X
	SbG70ZVrzAhhX0xkx/nzGz58IU9I6fFbv8ruCtGirAiKZ8RQm3+mh+NuTeUldUUnBJ4AaAHFN1y
	CRjO5yS8JmkxHUxIBApwt7xP6IeTXfywRXNBNC2W3qWZDd8b257EchFRjfV1uldxwAnuurHrMZQ
	l7uGVGknKlnwWaMOtp8Gjiwh/3eIx5Rze0H4HNwkFjLgsy9WFuR/ew2VRWrU5CWCfnSdI8/Qx9E
	mqpBaKX37uIxC1Mxei6qQ61VU267EzKklq2CvoaYaZyw2hC/hnVuLoqMz0xEecjT78DZrrQyvQL
	q26qBRivp14tj+H9nghUcpJ8pSyegotiX3tkioyo4n8d84QVpjqnCKFy4h2ZcG6xzw5Yae98rxr
	2bcEzx155wLrfbDdYWIe9HdSCoIUjxxi7AM61xDcqiv0PBdwN3rjfYG8WA++/x/djUAYEWkOgf6
	NLskDZYyHxxBIo3PzWLRLAuuiUo1gjpWoiSLGdnxAcwFcG9rFNssGGxZUFBZOZl9843cBs8Hd6L
	7PZaX/PmZDge6jUWK+zyiZeH2VPSGHrdlLnnBXSo7TDM/aPSpEK8Iwa8=
X-Received: by 2002:a17:903:b4f:b0:2f0:22fe:65e5 with SMTP id d9443c01a7336-2f03f1d0f8amr148657735ad.60.1795582214938;
        Tue, 24 Nov 2026 20:50:14 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm70131345ad.39.2026.11.24.20.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 20:50:14 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 04:50:13 +0000
Message-Id: <DN40RTGK98VJ.2XIDDVK3YL2ZC@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tobias Philipp" <tphilipp@gmail.com>, <bpf@vger.kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "Stanislav Fomichev" <sdf@fomichev.me>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Jesper Dangaard Brouer" <hawk@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, "Jakub Kicinski"
 <kuba@kernel.org>, "Shuah Khan" <shuah@kernel.org>, "Felix Fietkau"
 <nbd@nbd.name>, =?utf-8?q?Thibaut_VAR=C3=88NE?= <hacks@slashdirt.org>,
 "Stijn Tintel" <stijn@linux-ipv6.be>, "Daniel Mack" <daniel@zonque.org>,
 <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 2/4] bpf: Align lpm_trie map values to 8
 bytes
In-Reply-To: <20261124225055.87344-3-tphilipp@gmail.com>
References: <20261124225055.87344-1-tphilipp@gmail.com> <20261124225055.87344-3-tphilipp@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 24, 2026 at 02:50 PM Tobias Philipp <tphilipp@gmail.com> wrote:
> misaligned address. FEAT_LSE2 relaxes that for LSE atomics that stay
> within a 16-byte block, and for LDAR/STLR only if SCTLR_EL1.nAA is
> set, which Linux does not do. The fault is not fixed up. This oops is

Not quite. With nAA == 0 LDAR/STLR have the same 16-byte rule.
nAA == 1 removes that rule for them.

> Round data_size up to a multiple of 8 when computing the value offset
> and the node size, like hashtab does for keys. IPv4 nodes grow by 4
> bytes, IPv6 nodes (data_size 16) are unchanged. Add a BUILD_BUG_ON()
> for the offset of data[], which the alignment of the value relies on.

4 bytes can move all nodes of a map to the next kmalloc bucket.
There is no need to grow. prefixlen is at most 2048 and flags has one bit.
Make both u16. Bytes that bpf_mem_alloc asks from kmalloc on 64-bit:

  data_size  value_size  today  this patch        u16
  ---------  ----------  -----  ----------------  ---
  4          28          64     68, kmalloc-96    60
  4          60          96     100, kmalloc-128  92
  16         16          64     64                64
  20         12          64     68, kmalloc-96    60

BUILD_BUG_ON() and four copies of round_up() go away.
So does the new comment. It's not in kernel multi-line style.
32-bit still needs patch 1.
This is in place of patch 2.

diff --git a/kernel/bpf/lpm_trie.c b/kernel/bpf/lpm_trie.c
index 4d6f25d..72084ac 100644
--- a/kernel/bpf/lpm_trie.c
+++ b/kernel/bpf/lpm_trie.c
@@ -25,8 +25,8 @@ struct lpm_trie_node;
 
 struct lpm_trie_node {
 	struct lpm_trie_node __rcu	*child[2];
-	u32				prefixlen;
-	u32				flags;
+	u16				prefixlen;
+	u16				flags;
 	u8				data[];
 };
 
@@ -40,6 +40,12 @@ struct lpm_trie {
 	rqspinlock_t			lock;
 };
 
+/* The verifier assumes that map values are 8-byte aligned */
+static size_t trie_value_off(const struct lpm_trie *trie)
+{
+	return round_up(offsetof(struct lpm_trie_node, data) + trie->data_size, 8);
+}
+
 /* This trie implements a longest prefix match algorithm that can be used to
  * match IP addresses to a stored set of ranges.
  *
@@ -286,7 +292,7 @@ static void *trie_lookup_elem(struct bpf_map *map, void *_key)
 	if (!found)
 		return NULL;
 
-	return found->data + trie->data_size;
+	return (void *)found + trie_value_off(trie);
 }
 
 static struct lpm_trie_node *lpm_trie_node_alloc(struct lpm_trie *trie,
@@ -302,7 +308,7 @@ static struct lpm_trie_node *lpm_trie_node_alloc(struct lpm_trie *trie,
 	node->flags = 0;
 
 	if (value)
-		memcpy(node->data + trie->data_size, value,
+		memcpy((void *)node + trie_value_off(trie), value,
 		       trie->map.value_size);
 
 	return node;
@@ -557,6 +563,8 @@ out:
 #define LPM_DATA_SIZE_MAX	256
 #define LPM_DATA_SIZE_MIN	1
 
+static_assert(LPM_DATA_SIZE_MAX * 8 <= U16_MAX);
+
 #define LPM_VAL_SIZE_MAX	(KMALLOC_MAX_SIZE - LPM_DATA_SIZE_MAX - \
 				 sizeof(struct lpm_trie_node))
 #define LPM_VAL_SIZE_MIN	1
@@ -598,8 +606,7 @@ static struct bpf_map *trie_alloc(union bpf_attr *attr)
 	raw_res_spin_lock_init(&trie->lock);
 
 	/* Allocate intermediate and leaf nodes from the same allocator */
-	leaf_size = sizeof(struct lpm_trie_node) + trie->data_size +
-		    trie->map.value_size;
+	leaf_size = trie_value_off(trie) + trie->map.value_size;
 	err = bpf_mem_alloc_init(&trie->ma, leaf_size, false);
 	if (err)
 		goto free_out;
@@ -766,8 +773,7 @@ static u64 trie_mem_usage(const struct bpf_map *map)
 	struct lpm_trie *trie = container_of(map, struct lpm_trie, map);
 	u64 elem_size;
 
-	elem_size = sizeof(struct lpm_trie_node) + trie->data_size +
-			    trie->map.value_size;
+	elem_size = trie_value_off(trie) + trie->map.value_size;
 	return elem_size * READ_ONCE(trie->n_entries);
 }
 

pw-bot: cr
