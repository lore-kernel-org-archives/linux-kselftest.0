Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0776340409
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 15:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783871127; cv=none; b=Y3aXgQZRf45RjS4YDyBLH9FwaLTu1LpLbTNUG21oi1pUT0hIzFr4jw4ux4Z6Bkdu7C+7s9KSQN3oMq8HoctGknQRHdR/dTyrgzabIaBAfnUb2/IPJfQmItINFgcxfy5gANNuOEXtlKDU+uPigobBUC2n/ZGaDJDwXTjuT51aTcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783871127; c=relaxed/simple;
	bh=PA4Bqt4ZM/5eU9t/Xv2IagzZnnLp2iO/pQZpXfi9d2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W1XAdiJ+p/fXb8o2teHJD3LBGdXgcy5VCFvjiPJHeF0CF6MvtGaLGRbOgc4hOykgN9BLjfa22rqXU6NywoiXEM3G49gxY1q9dzgtx1AMMcBStUv9KgnkIyUpg/UCD8FqQPDP8Ih0l5NwexwRfFB5ieXEeaAg/t2XUYI9SnbIJIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=qkQwxyi+; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="qkQwxyi+"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e4fd65b2bso126161985a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 08:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783871121; x=1784475921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpaKnc1e95Tg7VSs2UGrLw6c/qizit0d3ArQLheYoTo=;
        b=qkQwxyi+lS/V6C/6ZbviOYZiK/Xyxwj0S1s5rI/8IjIakus0/4wabvGX9MLUW+mRMJ
         ACfreLka0ufxOaXhswp7U60dnZaqZGcPLZRzs8X1G94ZnrXV1IATULPMOSSH169xGqph
         tu+6Ug/8MyVgNZ2ORyrEKKcSDFCqNXctaMWVN5bvgrkDBdaC8ESQZRRHEjyanbTXPRAu
         q48L5wai0s5lIHiWMCY0a06leNDRZLQ46NWpbwzumk+14PUQx4rC9ls+hx3KTexvvNL3
         YYu4v3xkof/1jdkFSZhfCJlGPpq78uMUAswALJGTP4AqTMIh+Ce1d7wZg1LJrg33kSeI
         yz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783871121; x=1784475921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpaKnc1e95Tg7VSs2UGrLw6c/qizit0d3ArQLheYoTo=;
        b=F2MeeFfUYrY/2agexvRhUuXvq0k0UYFca+aDQcANdiAcJYDGbK5poibve96RxPkBse
         tR6DfhqwdOU4+qv2WahHIJF6WX+kureqXZdWg7PKf4mKXuazIb6flYjXlbfSJ8ev23AG
         OS+gJ88XECCMGu+h8TH9TlzjDMDJqPdTSm9+AY80WmFhbNdJITqlK61R5rHKXVoHLJs3
         oqYg9xe4weyioMoZXX4LSG3Cx1qiACumtLf/IUQhToAKrx+AwauNxzdcCJRwKrCdKVK2
         SuE7RwQWnm6wsWZCTYjzIuhaxpaIf9t0MQ+eH+mYIjYdfMP6j+wNWOwmy4mZrJAg8+kW
         27Fw==
X-Forwarded-Encrypted: i=1; AHgh+Rrj/BhqygmdE+cLqx2k4fz6Zf3W0a6MXI33uvL1UfbVoHxV7A/xK1XtW/lDfNbIrhMewPY4MZnA2At2SkVhVXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUpfQ8bjDDZU/TogVkP/9QvmnNRXoXZtmhCRQV8uesagnZTiTv
	kuOz631hlTfIiLDrh49T5q0JohlEtdOfDxMRUVltrGxHBXi1D1ckS8IFddY7Foo0Ekk=
X-Gm-Gg: AfdE7cmMuy6gs3Fm/bMO8y9I5QeUdQfMyOPNV+d5rpmoH7ZJzEgyEvzZalMqvDvbM0K
	vCkuNXtjETa/htRRwK6BQbsxDkMeG4I1lJezVenuz0wyZzAHM+XjbiVuc3bbgnElsOxXBQWZlWh
	KbCNT5yxy/7T1C8FQZiUJVgfGe6X4uwg4lm2nkavAWkYc8zCSLk/ndgxx4PJgHKuVSFUBK1g0cZ
	iKXFt4K+tSRMMwAfYyzcTsFFp+yN5iq8xqdjg3p8i94orcHz/nPXEDtB6+j/13BCmwTG6BOIhIq
	/VWoEfmkhdQhxR7h77GborEyQEOK9CbzDjyyLmGo0k7dcooOcueMrvYyoXTudp1Bet9LTPURfx6
	2Q5nDKH6Z5sDSKeDamvH0TKrUetPb2apTmp8IPD22/Py8Deziu/596h6hU0UEGOHzBOKZhF73B/
	df7DH4Qm3Di7cqLwqSuCQffzuBwotHAcdhASAfhHd5OwiHE6WT+l/pR8C7groLaaxSyOprBu3l8
	w==
X-Received: by 2002:a05:620a:2913:b0:915:e9c3:f1a0 with SMTP id af79cd13be357-92ef2b35bfemr677144185a.12.1783871120928;
        Sun, 12 Jul 2026 08:45:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d61facsm862186485a.42.2026.07.12.08.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:45:20 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
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
	Pankaj Gupta <pankaj.gupta@amd.com>
Subject: [PATCH v7 03/10] mm/memory_hotplug: pass online_type to online_memory_block() via arg
Date: Sun, 12 Jul 2026 11:44:57 -0400
Message-ID: <20260712154505.3564379-4-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712154505.3564379-1-gourry@gourry.net>
References: <20260712154505.3564379-1-gourry@gourry.net>
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
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/memory_hotplug.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 8b137328dcf01..e625529baf996 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1338,7 +1338,9 @@ static int check_hotplug_memory_range(u64 start, u64 size)
 
 static int online_memory_block(struct memory_block *mem, void *arg)
 {
-	mem->online_type = mhp_get_default_online_type();
+	enum mmop *online_type = arg;
+
+	mem->online_type = *online_type;
 	return device_online(&mem->dev);
 }
 
@@ -1495,6 +1497,7 @@ static int create_altmaps_and_memory_blocks(int nid, struct memory_group *group,
 int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 {
 	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
+	enum mmop online_type = mhp_get_default_online_type();
 	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
 	struct memory_group *group = NULL;
 	u64 start, size;
@@ -1583,7 +1586,8 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 
 	/* online pages if requested */
 	if (mhp_get_default_online_type() != MMOP_OFFLINE)
-		walk_memory_blocks(start, size, NULL, online_memory_block);
+		walk_memory_blocks(start, size, &online_type,
+				   online_memory_block);
 
 	return ret;
 error:
-- 
2.53.0-Meta

