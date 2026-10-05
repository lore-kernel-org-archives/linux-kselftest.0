Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517C04EE871
	for <linux-kselftest@vger.kernel.org>; Mon,  5 Oct 2026 17:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220619; cv=none; b=X2pNuxYFulYH3rEIrYOptHmqC299R+7NzSjB3B97S1SP91TuKSPc5J3Tmp2ZZZEPxpqzDSzfi3hDdkyKGLgVm7zAEJCYoBduOJ/ne7KL+Qjmha65oUz82GbYOMtEDRxXVQ0/kMqkh91y0cQwqxYAiKmBvkZbsJV5hEzZA2RHT2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220619; c=relaxed/simple;
	bh=9wEbN2n5LQFaWEnfgc/fjcdj12CgL82mEepIN/jxNKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNhlsfxs9+xK+8QT5g/hyDwHlmGpjKpPGMjGMOrjSksWVFqM0Calwkf6+1X8hqbwGho+/8Cq6LvcEEOwUNAja8Kv42gxqwLw5WPwwziA8AhRpUkxsZFyMopbLipAHZoSz91dbvkia9By75UA+4WGB5pham1SDOR8eLZbCkuzrIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbL07d6a; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbL07d6a"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so1246821a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 10:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220617; x=1791825417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InVY38nfxVAqb/WmgYkdpIBcCwx01OQ8UJwYgwWPio4=;
        b=QbL07d6azUEZP/YgXxJwnZHrBE7Emtw9fZ9uAoWdNta0PxzGeVEH9cdyBwnP0kM6nW
         NhPhFcVGXVi52g3tTCcTgvhZjgV1scowezYg8/MdHe0QydTs66hR7bIQ3mcWDtioq6Ht
         wTtjOohdhBnmATxJJ9ny3J4xzb99AGqW5DWp3WCVnfPpBA4HA7iFFwm3QPM+szpCRkX+
         nD6oV1fLhYLz9h5rYwwucbcvd/170kFqdeK6Fd1y76IoE7fWWWeNnZA5ZfwiJZ5Mvm9D
         1Vwe6lJLcknwrDexGy2Na0LwWbqW6sRuVQ+Fwb+fEt/50MEDUSNtU0kiGCLKteSvHbMS
         64LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220617; x=1791825417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=InVY38nfxVAqb/WmgYkdpIBcCwx01OQ8UJwYgwWPio4=;
        b=BNzJXePW03d++HKJHO1KDaGWzVRPeidEf7igT78eUJkxuTdhDCPGi4NqRklgsqEMu4
         CYxUO37g15TzUu0pWY3DrKRDRlQ1oFOHV3s26rsrjCc40gtmdN5p8GOYepvUgMwyimdn
         g/ntGK2CnzJYKxFnpxgEqqhE6RQxglIY8njh5SF5ScHa4YQq/8m7CGN2u9qzISuIFYsQ
         /8qSyaKbMXFCQ8DCAPBru1yUAno/DUZ3KzcNszsisxIna9hmwHKZBsXVmhFk6x/kqlqb
         v1+lvI4jvxuqPIUM8M4wz9jgUik+QBfkFiXuCmDqmuYN8hFhETvWjz6MKzPxpWKiTJg4
         WizQ==
X-Forwarded-Encrypted: i=1; AKwUvBzX2uLpLE5oXKTC46y7wTa1hRvFs/OARgBPAlqrQXr9qutPiGrSt8Q22ldU1X+E8FChL24loroEzOyrUXZVF3k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY9ek3oDsGyRCysxHWB8iDmAwzW3UVlihV0JRH7UjTuD2mZZhD
	iLCd9RhDzRdgDQfg4NtQl1qDgtofg29WxM3Tvr7M+c2Gf7VQvkBfHE5O
X-Gm-Gg: AYBFou1pQyKBipSA72Wkx9D4XikU4cyeywM9DpQcyhNp40CbVK6OamFiCELbTDXWqb0
	xg+s5GeNZfCEN/H9yO7xRWvlFqq+6VOIpYnVw6/w3g+VAkbIgqi5qi2PAEX9iM/mBqv9oUTY38i
	+v7QuToUqk1tGLIh/a06irMUIpC3swQj8MBWWhsS9U2wxCSc5DCJLOmg0wUepSE5QNVIqM7N1uN
	4zuer2rPPKR9D/yJXJRs0UwBhdKn9KD5ppYAAx7aFklFxcMOdhIpekpCPH++pUPulg8R3WWV2Pm
	LxjeRrKnCxexy7+Son9x+ToK9IjK7fGARtpS73rMBokLDliOC97jwknqG3HboA49RPdqNLb/SCM
	q1c5JUBUc2ZaVfybpWymyc7VMU+ZPkQqKPqtdtlPaBlc/RNW9nCvf7eJyhYxjGmfYOPhUWLQ9K1
	LxmkWfq7f83sKGEmwY3NERb0jvX7gEg98/fYC/GMpl6BWX3N41cT3lwVqHki5Sb/I7EaKgtCpPl
	yRprOLVixpvjNrlmSaQpVxy9Kp7hg==
X-Received: by 2002:a17:90b:3e85:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3a783504695mr5636453a91.44.1791220616043;
        Mon, 05 Oct 2026 10:16:56 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:16:55 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v3 05/15] hazptr: add debug option to force the acquire slow path
Date: Tue,  6 Oct 2026 01:15:19 +0800
Message-ID: <20261005171529.1378809-6-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005171529.1378809-1-kunwu.chan@gmail.com>
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a debug option that makes hazptr_acquire() always enter
__hazptr_acquire(), even when a per-CPU slot is available.

This allows the slow path, including its lock acquisition, to be
exercised by lockdep-heavy workloads.  It also lets hazptrtorture
exercise the slow path without requiring the per-CPU slots to be
exhausted.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/linux/hazptr.h   |  3 ++-
 kernel/rcu/Kconfig.debug | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index 275cbe54b075..4ee02d23abc9 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -245,7 +245,8 @@ void *hazptr_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
 	ctx->acquire_cpu = smp_processor_id();
 	ctx->acquire_caller = _THIS_IP_;
 #endif
-	if (unlikely(slot->addr))
+	if (IS_ENABLED(CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH) ||
+	    unlikely(slot->addr))
 		return __hazptr_acquire(ctx, addr_p);
 	WRITE_ONCE(slot->addr, READ_ONCE(hazptr_wildcard));	/* Store B */
 
diff --git a/kernel/rcu/Kconfig.debug b/kernel/rcu/Kconfig.debug
index 7c3c6017b266..3a2e9d7f58f8 100644
--- a/kernel/rcu/Kconfig.debug
+++ b/kernel/rcu/Kconfig.debug
@@ -265,4 +265,14 @@ config HAZPTR_DEBUG
 
 	  Say Y here if you want to enable those assert, N otherwise.
 
+config HAZPTR_ACQUIRE_FORCE_SLOWPATH
+	bool "Force hazard-pointer acquire into the slow path"
+	depends on DEBUG_KERNEL
+	default n
+	help
+	  Make hazptr_acquire() always enter __hazptr_acquire().
+	  This is useful for testing slow-path locking, especially
+	  with lockdep.  It also lets hazptrtorture exercise the slow
+	  path without filling the per-CPU slots.
+
 endmenu # "RCU Debugging"
-- 
2.43.0

