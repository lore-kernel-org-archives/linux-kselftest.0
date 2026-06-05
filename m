Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA1C3D3332
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 21:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694363; cv=none; b=nnivAKFYpsMoRk71LVPeFaKeVKQw6rrRH2rjrc3Dw2yKPRR7PCaprCuUTwJscC7PTx6KmGu5aWuFK31a+eD0eNl3rLTzPG3Lcde8BnrcSyv4DlmZRbAEjxtZLpZBilrPPbMFBh45fsJucP0aLAimXKYxTjBEoBVx/54P+VCQC0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694363; c=relaxed/simple;
	bh=5Ke3NaIM8Nos+HKJ6P0Knao9PHLgdSQ3RyZDgwl5zPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnKASiB+fIEIYk7cNFHYuKSv2PIcW5Ka86Gvl0z6WMUMyK8QEDtleeMe6GIIFrdBsMAdrVVY3r0Yat8zdSCweJy7Yjj4hdHhPMSb6oXuRs1/l2TL2LxwDj0MAoELrav7bjKtDaPbdVoMU+5FmZLuiX2sklLHw78CaZ+yIFZx6Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=oinAKT2G; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="oinAKT2G"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ccdf8d4ac5so26222496d6.1
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 14:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1780694358; x=1781299158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oucyR6ExWtK/Mt3ZHMUJ1XBxl0rtHFiWxfVOhnoVW3U=;
        b=oinAKT2Gymn+/oDqzROE9bnryQuZ3vuRYexanN8h7eCN+NIjzUk1YXIfoz7J7QOKb1
         Wj/4ZhiWpwBSDTbCbJUbhGfLndAc3eouVdofHo2zF+rBBTKYp9rG1pIOmxP5MTTy4WL8
         3fhTWk8QdhC3R/Bpq7crTk31P80L17wn3YJE0w2hOg9c6xmlQL/SiIQDniXumj/pSwXh
         QrlhMGF2BpwW/QpTtdHLjWkad5fInsannvvbnz2ZV9RoUj+I3VvXSxaLcR35TkZo27mV
         AePyf4oTkex8TS/XN/qlaPFzIxpQWmEo022P6PKYkDhgz6oI9Du7JX0sULh3L38/ApgR
         Kn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780694358; x=1781299158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oucyR6ExWtK/Mt3ZHMUJ1XBxl0rtHFiWxfVOhnoVW3U=;
        b=mt2jDDk925+vTsR2qY0FvalslgK6V+cu3WKCcj/y8tKUzJY2mpTTCiYfry8/Rp11hO
         fBueal1BUpjQLAy9rttyXH4pKEEpOAGr7Pmhiy6Tnx0bpTgKOY7kpWZ99iFsCIMCEuYW
         VaOkHW9vSxLXZFb3kufEhLGQYUxIxeoL5iC+pQLoyx3kS1soaHqTFmFCf/6hZGYVULE8
         WkLJMv1/SlylFQERELyhOVnDn6cUEhPAba2J29PNNQxnsZftXO/KecROx5kIIKc1LQUD
         nTSG+JjfNIwBOZjYajRq1eA/IIJ1nJFK5iMHvzLl8yPcLjNGPxR3zR0ZwqV/eTNhNRKR
         280g==
X-Forwarded-Encrypted: i=1; AFNElJ+rNSliQTWY4q5xtYdOluVlmFbnIjwxXWR1nCHRVallflnBBIzXN1I1tmvqs/JIulLlcW954Xzt/2UfijOCNSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrgfj2wtXx1ja5FzvU9IUZSB4n074IanSud2xZzo6D2b4H8gF+
	rMFzSsbFyYknMOezpy6kzG1CNJ0HXv935NvvHqSyY3E/n4RlNxPnKLL+9ahy2JNDBlU=
X-Gm-Gg: Acq92OE6ZciMJYSt4sAc0Xhsy0VTjyr/W9As9XWaRNemG/NecWLqhg8irq12rOcQo+8
	c/GezybabSM8ktinnS4apNc9WFUdF4uJDogsR5OqrTwH25JXX+qH40L8gFuQKpTgJNXJSIIb4Px
	BtdnSBqQ1lXGHTSZy9a1ehHEcMU5A20PB4tiTYyY2TI9jZ/8t3ldFqUjp9U3Q+V2umkuXLqg25l
	gZpypxV7wFNuDQhDIS3yWEP8uxs7KXQcwjUz/NWA5cNBHIXmb06/k19pMjpQAt5mM4YcT7d1Kl5
	n+nOkLnj6tmrovcriU4079i4AIktyPzaVkjiKPo3wBOKbxVbThAyAhkapn/PkjOx61/w7Lr+UAk
	nc2bDOyX4IuYvsGGYBo7t+a5O6b9jUwNb2Tm40K3xgMaoENalloknEAv4D3gAOBBNpH/bndWD60
	IktcssWyusW1rIm5DhKspdDHaSxZ4nCuq5bVymwue7/h2vkitlBgKNRb005swQlJopyXoQGsHf3
	xHkd8CK4M98rgkIrEF+5Ek=
X-Received: by 2002:a05:6214:2687:b0:8cc:d4fd:702c with SMTP id 6a1803df08f44-8cee62655c6mr91017826d6.43.1780694358540;
        Fri, 05 Jun 2026 14:19:18 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd277bbcsm90518196d6.49.2026.06.05.14.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 14:19:18 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org,
	nvdimm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-cxl@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	osalvador@suse.de,
	shuah@kernel.org,
	gourry@gourry.net,
	alison.schofield@intel.com,
	Smita.KoralahalliChannabasappa@amd.com,
	ira.weiny@intel.com,
	apopple@nvidia.com
Subject: [PATCH v4 2/9] mm/memory_hotplug: pass online_type to online_memory_block() via arg
Date: Fri,  5 Jun 2026 22:19:04 +0100
Message-ID: <20260605211911.2160954-3-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605211911.2160954-1-gourry@gourry.net>
References: <20260605211911.2160954-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify online_memory_block() to accept the online type through its arg
parameter rather than calling mhp_get_default_online_type() internally.

This prepares for allowing callers to specify explicit online types.

Update the caller in add_memory_resource() to pass the default online
type via a local variable.

No functional change.

Cc: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/memory_hotplug.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 7ac19fab2263..6833208cc17c 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1337,7 +1337,9 @@ static int check_hotplug_memory_range(u64 start, u64 size)
 
 static int online_memory_block(struct memory_block *mem, void *arg)
 {
-	mem->online_type = mhp_get_default_online_type();
+	enum mmop *online_type = arg;
+
+	mem->online_type = *online_type;
 	return device_online(&mem->dev);
 }
 
@@ -1494,6 +1496,7 @@ static int create_altmaps_and_memory_blocks(int nid, struct memory_group *group,
 int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 {
 	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
+	enum mmop online_type = mhp_get_default_online_type();
 	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
 	struct memory_group *group = NULL;
 	u64 start, size;
@@ -1582,7 +1585,8 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 
 	/* online pages if requested */
 	if (mhp_get_default_online_type() != MMOP_OFFLINE)
-		walk_memory_blocks(start, size, NULL, online_memory_block);
+		walk_memory_blocks(start, size, &online_type,
+				   online_memory_block);
 
 	return ret;
 error:
-- 
2.54.0

