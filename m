Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840AB3D9034
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782313080; cv=none; b=Eklz7DSZyZ1wiYqBv2kFQykEQtP71MJ0IIeVF07GvrhQ/RaIv+dmP7lnyITEEcNRP9NxpVeoYCmb7cYilLHkpzx7Ge3HGfXPY+5a5Akbfkq/iMd1QtW61lGnGC8IZEDEoUid3evYZyCh9+2ZvZe9HaqHlHMao2oxJgZ2av8WsFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782313080; c=relaxed/simple;
	bh=cz/Kd5Fg1n6RVtyFBzJpN2apXZy9vJ9be28aEaW5jhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1WrJoGEmQZ5RhziW00GDlqGLo9tiigHa6kL5jGpoLv/MpLhxoJwM9glKk5Z2ulTuR5tAgXXrTYvuqMvIDEPIZfm1ejGOaf0o5RPTvfvj22R08uJrLSyQ1oZhj46gHPoLi7pmX5MoYjqB0+D/en1TYiahJE1Xf2h7wMq6E2uaEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=gwSWxRJ/; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="gwSWxRJ/"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-519f9f13b06so9227601cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782313078; x=1782917878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQoqst23Sd/uqsFRXXVKz4Ck7yyavMrD/eBg48X+nsY=;
        b=gwSWxRJ/9hOo2kx43gdyE5gJacA7jTFLDluoTdWGhPNB3ahzdqbfCCwFu16yi57PBV
         QwdHrQCMz9YcVQqDw8s33CaxXtaaVeePyhFn8drBndnIFqyZKEHsqiHV3JWPdbBCbi+L
         V9gmanMdsLXh8CXpUWNmc9bWS23r+IVmLR8icUT6o0hFLNOxxSacBPq/VXzBsx5e28jP
         Q1uDxQHI+2a4YA7iAGd6wX6Z7fxrUi2klZWr5WVXlZeXCV9DnETigX/hlAjk8lrk21WI
         /pcCYdxvws2x48ez/OO5iJ1fIzbT/Gf2rJImHCFux27dee+gA1nbZ81AenUBpzRUrMAw
         +AIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782313078; x=1782917878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UQoqst23Sd/uqsFRXXVKz4Ck7yyavMrD/eBg48X+nsY=;
        b=nEpKOMNZ4n+UBiuzJoEXkw23AskWjCyZZ/+UJGSMrl+IOTyRBCcFnVNRyIlcObu37B
         3BrfUBQvJGiSNGq27ZVA7LU99c3Qurt6ILNnkU5rGGHwLRuH/iI9YGzIoAKzkitJV/lU
         /sYMO5xaSzzUMcKGE0KjHqmtr4vM61bghILeAu7CDu5mCGhXixptMHURmxibh5sb5E7K
         wnIg7vnLwkqAnHbgX3unO0/VJtM+RZDQhQ7Ss+p0AmLLPL+r1buCptQN2SFQgSaOjgxe
         SBzCXOhmrLVuTolZc/6OsCR2Fw875waLTs0nS0BnqNrBr2qH0JiaXAPKwZDaA9eW9Izd
         g9bg==
X-Forwarded-Encrypted: i=1; AFNElJ82lOxJYea49617R0t4uMeI2AbgkSAypeyzSAwgxeLH/IiCCCdlCWrX53KTsl2AEcAW9Yl680HEr5ZrX3vdWGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFzoaMKtcBEXHuC0S9t0BNKULdiW+WqZLyfyu0Bxi9bx6vBK4k
	vyB2vHJQMopJ2SQ0DYc6ys+OHUMrtRAVKFbcM0FOJEn67zOTeuaJjPUvePRc8KJcUDA=
X-Gm-Gg: AfdE7cmKlXI+tZcmPILJ7sMDOltfrlmJesliyZD80HYU+W0j6tGsY1JSrP7Vh7XPIEl
	83G3tX2SG7krNquNR8Q97YLBwOtpACGidIJOUTgrUjfn6WbAu7cMeM1EICAAk2vzSxONphi3ur0
	I4YZOVRfpshftDbC9lRcguS3qyvfCe2rHAsXcJkLS94GsICATMb41DXyGpd3mvhL4ZWim22UNne
	YsMxp2zfuPAbhVl8EUqhx5GUcI8J1HO7GXG1VrUsvQZkUQ49LVir8GihURXaUX21xqAC+p+Fczs
	GJvpv2890QrgpCtc7f1zkwszG7HuspydX7icnSP3126yX31nAp7DIS02pL/FTma4u7PoMMMa9i9
	EvkruIQBY2q/mBuEWm6vlFBF0uFk+OQdPW/cWetZ+/4Merk+K0rzxNyNCKwROnj4bj5z3kcLMY9
	EsXr5f+USSoKqH+sd9+B/1VVV+nPu8Bie9P9ryMZtLnJX8TEgbIyoSJUsIprPCsPJumyNf6P5/V
	A==
X-Received: by 2002:ac8:7dce:0:b0:517:7e26:36a9 with SMTP id d75a77b69052e-51a5485b854mr12138801cf.39.1782313078372;
        Wed, 24 Jun 2026 07:57:58 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51ae8ee7sm49502301cf.24.2026.06.24.07.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:57:57 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org,
	nvdimm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
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
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	alison.schofield@intel.com,
	Smita.KoralahalliChannabasappa@amd.com,
	ira.weiny@intel.com,
	apopple@nvidia.com
Subject: [PATCH v5 2/9] mm/memory_hotplug: pass online_type to online_memory_block() via arg
Date: Wed, 24 Jun 2026 10:57:37 -0400
Message-ID: <20260624145744.3532049-3-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624145744.3532049-1-gourry@gourry.net>
References: <20260624145744.3532049-1-gourry@gourry.net>
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

