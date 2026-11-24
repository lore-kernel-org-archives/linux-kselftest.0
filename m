Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560668;
	b=MCeKwK/g7nrFS0bsHurCcORTg8jQuNivcSfnzrlwzZzOttW6nMff8i8VWKP668C7SqIk
	 KARJ1kxYz3cV5AoCYzYK6JUkQt5DEv7vNpxRb5m4d4/1XmAf+9Kwm+hXBJu/gM8ruNbdw
	 w2bVu/G3ZDC/kjLwT4tZFMtUQdshctqlEcTsp4Pa2FGrtxi6qcXXGIEIVqmkb8Xxw2Sco
	 kqKYXu+rZMb9SN0BUvCzi5EENL7zXG51jZJUyQdthfFZ90rKlCBxVkD0u0YQipq3dNC1C
	 3NWPi/X8rXSLtApTPqVgUEGsuA6mhjPCnq99pEBAgiMxHrtFjvk9ECA/yBtuqXabg+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jrigqiEu/nUvTtr8hgpZahiDD4O3PEjOJSdql4Qjodk=;
	b=ctXvPzSx59dnOkD0ph0QarJzUaCjXccu8jHpQyaHe+UQTq63MNJ03v+4xaiiIU0Z0wFj
	 +CgUaFRQq5kdO2AON1ANXLsr3xFS+hpCAF68hICH7DgqLc9fb6I5vUWtvo86StyDiaOXt
	 Z+Cqj1kUjdkq+zpGni3tkHub4GEboIPp1TszPGRcfSQXyBgwZ4XE9iCGf8w55+JZiIkbM
	 LdmyjYKKqv6G3FYzRzUYx1DJ8d7b03+/tAusJGcW9M2LR6mjsn+4taScoZVKCMtB7nro5
	 YAnKWA9dH3k3mqTEkeztc3P7SgDpFj/EbaOjauY5J9oaf756F+Q5dRL/i8Sn3TZNlIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IwU9Qbho;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B38606A33E
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 22:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B38606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IwU9Qbho
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b467581b98so49631995e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 14:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560666; x=1796165466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jrigqiEu/nUvTtr8hgpZahiDD4O3PEjOJSdql4Qjodk=;
        b=IwU9QbhodXzlLDRauWBLrFbli/b9ei5ev5Yr6svDKdoANACaA9KLxcnMoSiHjB2uQL
         Fcdp5U9gh74slg4rFlwZHdSadfT6fhg4WDhi1i3MABxRtGG6ZDLzyDi7/+7EHkmIEl34
         S8KIhqYfbkxrK85wMruIrUnGuvmWJKChn7HwavPJsaDZ8C89ZfgYugOKlQjmdbHR7GcC
         HXjCYimCXcEMPCd7mKCxsIf90YhibXQBMus2F3VR+zJLk/Sy8ZBoqsmldO6zjOstdVyD
         l3ZweCwHPPW5c4cDA2tRXMo+yhYDHUqNsc2Qomy96/mVnHn5FtmOKe8Fy3oNPk/cubNM
         bVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560666; x=1796165466;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrigqiEu/nUvTtr8hgpZahiDD4O3PEjOJSdql4Qjodk=;
        b=NHSiFd04RuKtLCiIOhSkfwAt7Yj+9lutfwhADjzz5WEkEa5XJNEIHCspxWk0V0vYI7
         w9uB+PMqNv55QaNp5raD3CBGDp8Bp7wKHYRp3QUBQwf0CvClTPPKq+gqzQQNfQpvXp7p
         Ppg7+tK74mBRvTATEomRtN4xxJ1lyuF9hVHYqsqrcNRJ3y/2rVDOaOR1zJ0zdiEUn27B
         h39ssRKa+M0yu3D7/RVT/Ouq6579aAbuZWZpntIt15YDPijlQuXTjeJfMIopXFJkJbkX
         bw1dfXeQykzK5WnYvpsL5qvfauhhkXvR+f5m8m2CgtIIzH4kJk/VN89xAevzRHI4L3ze
         flsQ==
X-Forwarded-Encrypted: i=1; AL+hErHbXXwB+dQr3I8WAEr6zyNg+XUbPyCwCRfkoq0/oebJ2dz3+J6iexnqhceKSIXQPJaHlLh87aqdJCQIGjLx0ow=@vger.kernel.org
X-Gm-Message-State: APuU4Z8z1k3PyA9x0MH7Wv+arxbjXu5T9UtbkSnwWTtB/O9myifQmqee
	mwKuzUywx2pnlPrhnp5wUbeeQDBXnV0A9XdOglZjgnhvGELcE0aWhiI=
X-Gm-Gg: AZFdTZcxXtWVCQIwlUNN/jZLyTj6DPKWrPAGSAPMD/qUfqXMSVclFC/OmH/SFb8Nqr7
	4/oE1XPZRD6594Y5uI+DUIgQsG2xjtCivDhzg50k1Hq3mcowNJqagwwAYSW46ciSSNPc/j2Ch7P
	+pVj47quE1VE/ZrafrFbQROdYPCL4v2zMIoSadaMMoqb4CnAyg4EighOJsf2qnOCpzJCY+pSPdD
	Il00wMl8taXAUIuTEqvOgad3e+1qa300MUCYYMqhRGM02nU9dUNsu/+0y2nWAQedOUw06a91Duw
	hQl5WCtivT+Hc0j9QKYkJskJuW329Y2aK+BgAgOaJbq8VKmwyOVP9HcX5NaQuY8Z7xR7fR1nwuo
	5rA3y+frFVV/nfsOPjD0Dyl9LUcyrUinsKuPb2dL4ye2E9aU9FiT95rTvmqhsdBtbmxGQoc7gof
	wR4gxX7hp3Mn2YULiud8a47o8D37NRoklD830bqKtpeyz0u7maJ6PMZYsdj12NE3rZmBNRGDreg
	HU85bxuH2GTu0w9GiI9g6eN18x4pBEUBsRbM0RM7d69oK6aVS/NjhBM/EFUvpK36Kk7BTwHqc6t
	2OLaGdRrw/4QfT2z7eRNO0q22vsvH9B+YXUtZezViiJxErFr6tRrAZjadiJbI4/SLqE6DH5kml4
	J1FOC98Q/EGhXpb4N4EsxX7gWwjWeEgxUzq0Pj/VHpj0Z5kIzOTSIhjqUrcNWj0Uns8bBfIhEI2
	vor7wxPgUeRPbw3pVwxtbGwRzHj/bxOpEs
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb8892da25mr318594355e9.22.1795560666345;
        Tue, 24 Nov 2026 14:51:06 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2ec1-8a00-a10d-4335-1e05-e7ae.310.pool.telefonica.de. [2a02:3100:2ec1:8a00:a10d:4335:1e05:e7ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm393839525e9.9.2026.11.24.14.51.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 14:51:05 -0800 (PST)
From: Tobias Philipp <tphilipp@gmail.com>
To: bpf@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks@slashdirt.org>,
	Stijn Tintel <stijn@linux-ipv6.be>,
	Daniel Mack <daniel@zonque.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tobias Philipp <tphilipp@gmail.com>
Subject: [PATCH bpf-next v2 1/4] bpf: Fix alignment of memory allocator objects on 32-bit archs
Date: Tue, 24 Nov 2026 23:50:52 +0100
Message-ID: <20261124225055.87344-2-tphilipp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124225055.87344-1-tphilipp@gmail.com>
References: <20261124225055.87344-1-tphilipp@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Felix Fietkau <nbd@nbd.name>

The BPF memory allocator prefixes each object with a header that holds
struct llist_node while the object sits on a free list, and a pointer
to the owning bpf_mem_cache while it is allocated. The header size was
sizeof(struct llist_node), so on 32-bit architectures the memory handed
out was offset by 4 bytes from the 8-byte aligned kmalloc allocation.

The verifier assumes that allocated objects are 8-byte aligned and
allows BPF_DW atomic instructions on their u64 fields, e.g. on values
of non-preallocated hash maps, objects from bpf_obj_new() and local
storage. On arm32 the JIT does not implement atomics, and the
interpreter executes them via atomic64_*(), which are implemented with
LDREXD/STREXD on ARMv6K and later. Those instructions require 8-byte
aligned addresses; a misaligned address raises an alignment fault and
crashes the kernel.

Pad the header to 8 bytes to preserve the alignment provided by
kmalloc. Store the percpu pointer of percpu objects at the new header
offset instead of assuming the header is pointer-sized, and update the
copy of the header size used by the hash map memory usage accounting.

Fixes: 7c8199e24fa0 ("bpf: Introduce any context BPF specific memory allocator.")
Reported-by: Thibaut VARÈNE <hacks@slashdirt.org>
Reported-by: Stijn Tintel <stijn@linux-ipv6.be>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Link: https://lore.kernel.org/all/20260717183632.99195-1-nbd@nbd.name/
[tphilipp: rebased onto bpf-next, adjusted context in hashtab.c.
 Local storage no longer uses bpf_mem_alloc in bpf-next. On 32-bit
 this patch moves an IPv4 lpm_trie value from 0 to 4 mod 8; the next
 patch fixes that, so both have to be applied together.]
Signed-off-by: Tobias Philipp <tphilipp@gmail.com>
---
 kernel/bpf/hashtab.c  | 2 +-
 kernel/bpf/memalloc.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
index a2d0bfd4c..b84911054 100644
--- a/kernel/bpf/hashtab.c
+++ b/kernel/bpf/hashtab.c
@@ -2594,7 +2594,7 @@ static u64 htab_map_mem_usage(const struct bpf_map *map)
 		else if (!lru)
 			usage += sizeof(struct htab_elem *) * num_possible_cpus();
 	} else {
-#define LLIST_NODE_SZ sizeof(struct llist_node)
+#define LLIST_NODE_SZ ALIGN(sizeof(struct llist_node), 8)
 
 		num_entries = bpf_map_sum_elem_count(map);
 		usage += (htab->elem_size + LLIST_NODE_SZ) * num_entries;
diff --git a/kernel/bpf/memalloc.c b/kernel/bpf/memalloc.c
index 15684d0fc..29d62d864 100644
--- a/kernel/bpf/memalloc.c
+++ b/kernel/bpf/memalloc.c
@@ -33,7 +33,7 @@
  * Every allocated objected is padded with extra 8 bytes that contains
  * struct llist_node.
  */
-#define LLIST_NODE_SZ sizeof(struct llist_node)
+#define LLIST_NODE_SZ ALIGN(sizeof(struct llist_node), 8)
 
 #define BPF_MEM_ALLOC_SIZE_MAX 4096
 
@@ -148,7 +148,7 @@ static struct llist_node notrace *__llist_del_first(struct llist_head *head)
 static void *__alloc(struct bpf_mem_cache *c, int node, gfp_t flags)
 {
 	if (c->percpu_size) {
-		void __percpu **obj = kmalloc_node(c->percpu_size, flags, node);
+		void *obj = kmalloc_node(c->percpu_size, flags, node);
 		void __percpu *pptr = __alloc_percpu_gfp(c->unit_size, 8, flags);
 
 		if (!obj || !pptr) {
@@ -156,7 +156,7 @@ static void *__alloc(struct bpf_mem_cache *c, int node, gfp_t flags)
 			kfree(obj);
 			return NULL;
 		}
-		obj[1] = pptr;
+		*(void __percpu **)(obj + LLIST_NODE_SZ) = pptr;
 		return obj;
 	}
 
@@ -262,7 +262,7 @@ static void alloc_bulk(struct bpf_mem_cache *c, int cnt, int node, bool atomic)
 static void free_one(void *obj, bool percpu)
 {
 	if (percpu)
-		free_percpu(((void __percpu **)obj)[1]);
+		free_percpu(*(void __percpu **)(obj + LLIST_NODE_SZ));
 
 	kfree(obj);
 }
-- 
2.54.0 (Apple Git-157)

