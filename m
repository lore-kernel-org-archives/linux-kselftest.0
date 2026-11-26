Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795727487;
	b=RUoQYrzM/XahBJ6OHhFjF9Ug2AwfNc6D6TuERtCUMzcKLDHdikAa0FB68PUN5Eao13uz
	 Z25EO4ngDyQpSJtYGQwPk5iK6MDuEbr73aPBu1uTS/W2KXpIubsXJoETQstr67sVpmrxn
	 rLex6dGpqkgJFOE4txS/qnc39LpdlyOMjzxp2grj1O4pddEBJUaEDAC4zvuINEnGGLdVx
	 FRNtj+IpR58WSN1tLCBmaehjOug+SqN3nA1rMehOcj7a8WKApzijAnLcQoVcH+MjzGfZu
	 EUj6jPPOxhy8ZP/U7RPPJwN/G07MKxi0NTVQnXZ5G/IqpHXZIdH+JGTjEe34lpWWkdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795727487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=1eGhF9wa+InSW4Ry7zowJx6R0jLY/ryLtxDc7jirqqQ=;
	b=iMoxcYzp6QT1ZNcMxV7YDtpB0Q9ZO6LhPi9H9Wf/ycZS/BYiCpPn8i9Qn9aA1uRCwIwZ
	 O51FKIEKmAC70G9NnNntJEpRdHZot5rODn5/pIpaT2nmMODi/GYhOiza0EqHliaDlO7oR
	 7EsRgLhYYJTXoZ6gW7lj8oB9UOKLe6fsnaIgKlZa+7HI06dvA68NRbshnrM68arEiFZeg
	 cdDLzXFPGGamMrkSf14ufaakXcsISGj3gFt/ejLj6dfI94pGgsnHqx1WvbCjLeGqI4Y17
	 Gc/AyctEs/yso0/vbdqDK1t8dhZbMuLMXjVsgH/nTLR6Bph7OqQrAOCk41LJsvhO7tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jcLm4e3K;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021E1606A31E
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 21:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 021E1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jcLm4e3K
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f04b676219so41049195ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 13:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795727486; x=1796332286; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1eGhF9wa+InSW4Ry7zowJx6R0jLY/ryLtxDc7jirqqQ=;
        b=jcLm4e3Kr4LRZNOQm7TsamIhRQAYCemljovkkU3TOUej7mwnQKEsCh9AjHMYvZoOIM
         l6WjPISP+9d68Nz8fiGelOJmiMruep+oH2AhR9EW8yi8zsmxzICA6BN8B4wOM0dO+Fjk
         adfEy9NCNDiYa+ZsAv/KJ0aYFPBgtcEc8IMwXK577/HgPV5JZFz0vtM+ANoCHTH1js+P
         yhUINFlY3YWofsCwixNJmIXrh/UvZ7OX0qxK+dfels9uDi6MGxmR+h2nM49pADIPGL1B
         dLZpsh5cwBqugKHHikoqdcxEaQwitTiFoF5JS7KDOmYNk1kHnIZLlPn5ZDEMYj03o6v7
         6nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795727486; x=1796332286;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1eGhF9wa+InSW4Ry7zowJx6R0jLY/ryLtxDc7jirqqQ=;
        b=gs6qcVTEsolgTWX588MV8ryhikogtxYLcLUP5CjRCmFAPEJ8tGL0SQKV1jAQiVplVd
         HNFfNwrGJfkiaztBaGFQaJosBoTMF5OQOv9+aQfR5C+HYijB32GdI3oDv42X7v7DELpI
         lw+lhx/ww/OJVYDErRfU4K3eyEsUuer4PRt4HF3A+5iKvkunaVSZDVss5EHIk6wilLj2
         stSyLIWtxSquIfk7JPQMcQREXPeVv9M+WxNeZ9IEBi68iLneWl7dw9iDjAAlHcUSWMt8
         sKrpk6YFuEja9lEQ2XKT2erxozzMIiFYppZOYA5nClW7ZDUL5M6w0Pa2jk4LB70+j0cs
         b+4Q==
X-Forwarded-Encrypted: i=1; AL+hErH0PqehRqngYInO2HahAMqB0fTjjn+NYMg6Ac7qgqLlk+jRpNeFcc6tUZuCUATkjAZg38+MLXW4qABEiDHWQgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z85YCKijqU1Cw8dJJmJHnhQQ34Grxum3/eQVaEUZQj9BjJSilwB
	39vCG9H0ENpKf7x4DV0A3KkILzGDUR8uHygj5K1qs/BLLuV9E490Lb5c
X-Gm-Gg: AZFdTZf+Y5AsEjZFlZ+9CstcRwOa0Tx/D9SK5Xnlnb5BDRCe7i+cZlGqBV+11ME3IvX
	YPSGJMPITXR0uz1F1lm/0En0RE/CnZ2IfcZGFXUsSo0yhSzsV1MMlKJ82wbd+BO9As4EtPVqFj8
	yvKVWLdfv31FVSullPP+X6w4InuBjssiN16xYR/l4CYSPajXKwJqJyHyF+CpXJLC/J6hZVdc7vT
	kUa7i9UC19IMnv5kKBQiocxN1uBAxa+d/wAIqQt5RK9+KqLVPk3tpH38iMk5VEL+cLc2PS+Zhyn
	glgo8kHK5Y2zSQzb8wvqn03o6B+pJWu9HOxpghCwr03qXbb2sPz/safil6+xbUAC7gDPIiotdl8
	269n1gmI5DgCNo9yKtXjZ/gg2zOub3vLZs7e/iyGVJR4xrariSrBHn53vzz2a9J2PIGSOr2N/dS
	FMLsWsC+e7T91fC4PeNGZs0LdmiHeua/I62oKlCQ8KbVd67iL7WN/0FIkHIA3e1EWWJz3EkJPdX
	7fyW1zmAX/T1TjN3Qvk8Bfb8qoc7ltOmceTcec/x8/PPtspirqGYlUMYEc5gIYqB3wxk4DyUdYL
	GT+l6jxhGvu9izzbR6Zj0YnAc+8kx1YBFyWFTLExN/4iGre1/P35MuKQuL1O3fJDRBskmozCW1J
	AJrCDB/leB8RkUHBVNj6RY/3srB7qR95lwQ==
X-Received: by 2002:a17:902:f642:b0:2ed:fdb:b37a with SMTP id d9443c01a7336-2f03ef84acbmr222699935ad.4.1795727486118;
        Thu, 26 Nov 2026 13:11:26 -0800 (PST)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dcbe3sm109123135ad.28.2026.11.26.13.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 13:11:25 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 21:11:25 +0000
Message-Id: <DN5G9M8G2IKK.Y4INWFA4JESW@gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: account for local storage map
 elements memory
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mahe Tardy" <mahe.tardy@gmail.com>, <bpf@vger.kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>, "Christian
 Brauner" <brauner@kernel.org>, "Amery Hung" <ameryhung@gmail.com>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20261126131318.470837-1-mahe.tardy@gmail.com>
References: <20261126131318.470837-1-mahe.tardy@gmail.com>
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

On Thu, Nov 26, 2026 at 05:13 AM Mahe Tardy <mahe.tardy@gmail.com> wrote:
> Walk the bucket's list to count the number of elements in the map, note
> that concurrent insertions and deletions can make the count imprecise.

No other map_mem_usage() walks the elements. All of them read a counter.
'bpftool map show' reads memlock of every map.
An sk_storage map has one selem per socket, so every read of its fdinfo
is one cache miss per socket.

Lets count in map->elem_count, like htab.
It costs one this_cpu_inc/dec under b->lock. Update and delete take
that lock already.
bpf_map_sum_elem_count() and cur_entries in maps.debug start to work
for local storage maps too.

diff --git a/kernel/bpf/bpf_local_storage.c b/kernel/bpf/bpf_local_storage.c
index b12fcec..6f7c2e5 100644
--- a/kernel/bpf/bpf_local_storage.c
+++ b/kernel/bpf/bpf_local_storage.c
@@ -259,14 +259,17 @@ static int bpf_selem_unlink_map(struct bpf_local_storage_elem *selem)
 		return err;

 	hlist_del_init_rcu(&selem->map_node);
+	bpf_map_dec_elem_count(&smap->map);
 	raw_res_spin_unlock(&b->lock);

 	return 0;
 }

-static void bpf_selem_unlink_map_nolock(struct bpf_local_storage_elem *selem)
+static void bpf_selem_unlink_map_nolock(struct bpf_local_storage_map *smap,
+					struct bpf_local_storage_elem *selem)
 {
 	hlist_del_init_rcu(&selem->map_node);
+	bpf_map_dec_elem_count(&smap->map);
 }

 int bpf_selem_link_map(struct bpf_local_storage_map *smap,
@@ -284,15 +287,18 @@ int bpf_selem_link_map(struct bpf_local_storage_map *smap,
 		return err;

 	hlist_add_head_rcu(&selem->map_node, &b->list);
+	bpf_map_inc_elem_count(&smap->map);
 	raw_res_spin_unlock_irqrestore(&b->lock, flags);

 	return 0;
 }

-static void bpf_selem_link_map_nolock(struct bpf_local_storage_map_bucket *b,
+static void bpf_selem_link_map_nolock(struct bpf_local_storage_map *smap,
+				      struct bpf_local_storage_map_bucket *b,
 				      struct bpf_local_storage_elem *selem)
 {
 	hlist_add_head_rcu(&selem->map_node, &b->list);
+	bpf_map_inc_elem_count(&smap->map);
 }

 /*
@@ -377,7 +383,7 @@ static void bpf_selem_unlink_nofail(struct bpf_local_storage_elem *selem,
 			 * is sleepable: see below.
 			 */
 			if (likely(selem_linked_to_map(selem))) {
-				hlist_del_init_rcu(&selem->map_node);
+				bpf_selem_unlink_map_nolock(smap, selem);
 				if (sleepable_users)
 					keep_fields = true;
 				else
@@ -556,7 +562,7 @@ int bpf_local_storage_alloc(void *owner,
 	 * such a storage through the map. b->lock holds off those who find
 	 * first_selem through the owner and want to unlink it.
 	 */
-	bpf_selem_link_map_nolock(b, first_selem);
+	bpf_selem_link_map_nolock(smap, b, first_selem);
 	raw_res_spin_unlock_irqrestore(&b->lock, flags);

 	return 0;
@@ -673,14 +679,14 @@ bpf_local_storage_update(void *owner, struct bpf_local_storage_map *smap,

 	alloc_selem = NULL;
 	/* First, link the new selem to the map */
-	bpf_selem_link_map_nolock(b, selem);
+	bpf_selem_link_map_nolock(smap, b, selem);

 	/* Second, link (and publish) the new selem to local_storage */
 	bpf_selem_link_storage_nolock(local_storage, selem);

 	/* Third, remove old selem, SELEM(old_sdata) */
 	if (old_sdata) {
-		bpf_selem_unlink_map_nolock(SELEM(old_sdata));
+		bpf_selem_unlink_map_nolock(smap, SELEM(old_sdata));
 		bpf_selem_unlink_storage_nolock(local_storage, SELEM(old_sdata),
 						&old_selem_free_list);
 	}
@@ -794,8 +800,9 @@ u64 bpf_local_storage_map_mem_usage(const struct bpf_map *map)
 	struct bpf_local_storage_map *smap = (struct bpf_local_storage_map *)map;
 	u64 usage = sizeof(*smap);

-	/* The dynamically callocated selems are not counted currently. */
+	/* The maps of an owner share its bpf_local_storage. It's not counted. */
 	usage += sizeof(*smap->buckets) * (1ULL << smap->bucket_log);
+	usage += (u64)smap->elem_size * max(bpf_map_sum_elem_count(map), 0);
 	return usage;
 }

@@ -830,6 +837,10 @@ bpf_local_storage_map_alloc(union bpf_attr *attr,
 		raw_res_spin_lock_init(&smap->buckets[i].lock);
 	}

+	err = bpf_map_init_elem_count(&smap->map);
+	if (err)
+		goto free_smap;
+
 	smap->elem_size = offsetof(struct bpf_local_storage_elem,
 				   sdata.data[attr->value_size]);

@@ -902,6 +913,7 @@ restart:
 	/* smap remains in use regardless of kmalloc_nolock, so wait unconditionally. */
 	rcu_barrier_tasks_trace();
 	rcu_barrier();
+	bpf_map_free_elem_count(map);
 	kvfree(smap->buckets);
 	bpf_map_area_free(smap);
 }

pw-bot: cr
