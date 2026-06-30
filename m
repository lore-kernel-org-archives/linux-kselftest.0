Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA44230AAD8
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 21:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854339; cv=none; b=IlsK7jKDprUx/uNU4PCJ73U6K+YBFcPlycnTKi+0juL2wpdW/chPmzTcs8iSBhcyxkBw3/u3fkHZRgYBkk6sTBMLH9s7WTEEwSd0/hh0uRJdpDTWXs0tnpNC4qECGigRR/0OQ+juq9g9SPPbcunDaSMyzvdoDOJPBxbCUlMoD34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854339; c=relaxed/simple;
	bh=X6kC2z4Xyj+V+APtGHSXJjIu5DjDPN1Hl4dMPopeuUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7s6URvQ83JUlydv4jdIZlZU6Hncn6nodVhOZD7TsDQiIRfrO9GEa03to+r3GC3a5ZYflBuNisV5N7ip306Om2GNWM+KVmz2YncHNKiRoSV85ne0OP/sVzlI2FJJfjNlBv2k69EAX3oVpxz/2W4XCFrLX8r16TxTT0pLM4JMlB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=tMnQRe/d; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="tMnQRe/d"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e53581361so220451385a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 14:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782854334; x=1783459134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKwO5GGulWgyuo4GgOfyW93Razp13/peNYJDujzNXk0=;
        b=tMnQRe/dS+T69qgQKnqce/JmKMfKJZYHbcrtXH1l/x5200ujtRZK2QIpE+USeWaNA4
         wbB43QKOlGzMa0fdK/c0PENvzzFHKAONe5Z4OVeaFhAqcC85zsvhaORboGpOR3o73LE+
         JqHvSvSEX7ZdSJzF2jQ0bWk0FI6/S3Q6AUgqxS1KPDyDmurYUq1i+wKEc5TbSx7Hx7eF
         OqQXPLiGzlzHQFp3T/uHV6Kf3SLowZrc+tS0ePdyauy5yMoFh7UDckp/E6DK1+cXURhT
         yiqf/mr3ZSYGWKzIiBIAqOTcNFlDgnqRK3GqXN7e20M+/QcNbFtzSJaN9iYjHEMfszLU
         t9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854334; x=1783459134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BKwO5GGulWgyuo4GgOfyW93Razp13/peNYJDujzNXk0=;
        b=DYrt5quazOneExd91FoYk0qEWsP291xtGiyVMftWl9DXB152XhS2g5zWsqqHe+V2/d
         Wg6FnHlGUUXIZlYhEZqmAlB7gUhgS+8lngjOv/jYlHaYi80WGlGjhEtlVXYH5oe62m7V
         ev4JwOw5v7i4+oL//33eqU4pVtTxomhG+HfuJZpD+efwwrtEtkgRDXZHiTp1G6BYmXgz
         BxuFGVhI7Cej2qD962zCSTLkxHnDI4+xoP4d4v8BHlwgkRe56Z/Fq3NRduIyfIQJMc4W
         BzV7Fku7glu2zqzBao6uFNivB+5gqO3z6umc1SXtPoRDoM4wUd5mG53lrQ4pvmFr7DYy
         hxNg==
X-Forwarded-Encrypted: i=1; AFNElJ/ODoSEKpyZ9NxsSjFcy8hrQPOusd15BFXI+/l+lShqUPWbKb7ZTXdoSgfEk/qDOSZlrkAXm40y+Xnr3JU1yME=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6EMy2iz3N/19/utFGLV1ymF4sF8u45ccUel7DlvM+kSjIqjnq
	KEngKx9Iz+mO+cYCMcdInYFwT1c/zJCgtdkbGS7R3OQK/g5aEdMHRU/owUfVar4n7sw=
X-Gm-Gg: AfdE7cnl7nsluc8V35wRHs1lQG6yrf/wV/fw2MHqLHYzIinJkwfEbgSst/QP2Pgo5Ek
	qPrarI7o0mvIBlRJ3jJEGZR6rhu2yZ5WNjIpD825968fuGXw2TixTyfe/cDQIlgw0TLGLxvQRqx
	KQQvpZH12idWwlcg6cT+VQtCw7AJcPJPpeEF7uIUEJRSPGqeniZZN1WCmmfIUTLmu8Ou7wGEA3v
	7zkwgJMyUjduiA3YtYdeGefg+wYizdEgBsDz84XIyf0h+PeHe37z+b3QHwLg5/W8csGFs9Nvr2A
	dIM7vJTyx33Tb4tXr9My34lENehBsn35V8XknMagKlLTqvggSE5Y7YMp20yA/pVw/LAiVOVsaFK
	Mf88lluA8JcJVf871TNMmJGYdjkrV5XsZgpA/6VnzVvjSZvGNZJ+vFMjXNKzsHfyMhNweLY3Mo7
	JNCJaXmMQpzEYOK7mwohnfzpes4/gKfEZq6tVyReOAnWRCJnRw9eVV3YtqNzh1r5bMqs+KYz7A/
	w==
X-Received: by 2002:a05:620a:8018:b0:915:8f76:8005 with SMTP id af79cd13be357-92e6d8bc859mr391991585a.47.1782854333767;
        Tue, 30 Jun 2026 14:18:53 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62366303sm335924285a.40.2026.06.30.14.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:18:53 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	david@kernel.org,
	osalvador@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com,
	apopple@nvidia.com,
	Pankaj Gupta <pankaj.gupta@amd.com>
Subject: [PATCH v6 03/10] mm/memory_hotplug: pass online_type to online_memory_block() via arg
Date: Tue, 30 Jun 2026 17:18:35 -0400
Message-ID: <20260630211842.2252800-4-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630211842.2252800-1-gourry@gourry.net>
References: <20260630211842.2252800-1-gourry@gourry.net>
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

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>
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
2.53.0-Meta

