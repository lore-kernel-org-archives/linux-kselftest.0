Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811358;
	b=xfo0AxjSgduqGZBQRvcxHjQGRD1aCJCopglXeonyh9/JEN582pauzKEgDP9MsRRL5IaX
	 VmgbCc31LgNQfIrpRG2ilGOj0qICl0QlCyvNo2rPV89DYcGfT3Dk7/45zqavHPrD179Ux
	 G+fVd7GdqNbnkZrbmShG8EQfpmjDLMJBi/Y2YuGfzscq4jhTdq5cwWTCxuqo/ICmSkZSl
	 rbypCvy9T53K5q6/kPxpyIiYhUxtNAGrtDCoGMj7QFpAY129XCA51h6YpzVgwxDQLmJLj
	 Juj3nkCwJvP+xPMnerZ4RmTG26dU++wfeV9jweMMPZFDCcjFIUCeN0aNSL0MlcnOCnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+8KQWyBKBxvk/GyclF/OXvG/qT94C95aX0wcu8sQa/8=;
	b=cVjlELSLOFjp/Y7NGWmlLBQ4gSjSguoOp8fnCZqJq6V03Y28Lv3aK79q0n1f5uoPH41h
	 6kvO5coYUI5JL4P3kzJ/Vq8XD52pQHf7FCLfruckZQRystFQ+uWPpwqXDQDwPoQS6k69I
	 8x5cXtm0j+EUNmiF9xgUEi5VVPCmLUv2/UsI9GP5ai5ZFGj8kh2QZl4XgU0SUJHWEhSxK
	 CvwuIFwyAUu1iR+4uzfWg3fSxIgSZt1KzF6WSdMAMijvW/p0HQ4p+LUX0KdgHIpoobn7K
	 qH0iP+80Myyogruql2poKt7Pgnh5Q1fWPutrhm8jzJpjaddMUTAerZm1jdfTjzpFkPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EycCfHSE;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2E5606A32F
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D2E5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EycCfHSE
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35b2c599f43so1894595eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811357; x=1794416157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8KQWyBKBxvk/GyclF/OXvG/qT94C95aX0wcu8sQa/8=;
        b=EycCfHSEmnC3CFQscfhGc9K6l+n6dnpWstzvFxbY/sgIPYFykCn8zDBIa+oXgrvcMa
         lATgPV090nSh34SBkcJD2o5P/IAiOOUJZ9T6EqjWYQwtHFYs3+jJlnP0aSl5YJKnBvsb
         D3HZepsIez9R0xsqvqmbIkK14qdC8qmo1F+tt9+MY4Mgn2c1pNCmzYLqFkK7IcLSP3Ez
         nMiNU6HJ72wXlRUFfjTnzD+XvBK+8GXYnpb8gQh44yzEnH5gO2xIhUy2Ajro6+0/H3a6
         LV4ZNH2ZAQ2mJ/pmbz/77D2ocF1i4FHzguQLCPdF4LogdcdszkoGbHdgKYSUFDWuTs9G
         pCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811357; x=1794416157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+8KQWyBKBxvk/GyclF/OXvG/qT94C95aX0wcu8sQa/8=;
        b=bjyWOueBJuqhyXmrQjsqcrBIbovGESxiBCUdJqok4nCJ5YANlmZxoO8DpUzDGTTrHd
         niI0xHJ+mx3TkcxP0KRuPAZ/8wgFapi5kx00bz0UDvNAHnrsN3bFmKgyg3XT+K3NsFW9
         e5z6uQrQBnExewzD442LXeNGhbd25aLxW87ZKl7z+6ivYK52Rp7bfPz6ahQiCyWWq5bG
         vRwjG3NOjiWi5VH1hNspJQRw/OzXHU/LR6KDvIVaGsCtgjF05c71uZLy1zzivLJwqfuW
         eHIGwN05B8sHt1741hRqg+q/EAIQQXf6XIaIfLv6ukkVv5zA4tcvGajSdVqdvRg715T3
         Datg==
X-Forwarded-Encrypted: i=1; AKwUvBxk10qY8Ball46aAMse0Q46gaPxmwdxMDX0dJV8K9WE8pMzFuijKqh0QXcLataZZiwWcHOC2i3pg//PvNkpvVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tpcozs2cOXfBSuFrK32m0HHpBLGPZNY+rFjE2rdMLdO4SW1o8
	/8Mm+oeKPe16aCKQajK4TFCwAVmuO+0Y96dK8apR92UA085fas7mTwEO
X-Gm-Gg: AYBFou1IqM+yEF55LXZLNz2Lm47b8e6hDOhzKxndIM27a6qoNu/BRSrdGpSLj8k2IsD
	UxY2TlUjHod+RpjOEoRbsrzLvbO2QC/V7DiKq4mi6FYBGlK1ra8kVulTQJ30bHhoOXYk5yqf6Nz
	9ZfW9X6cTtyK7DGnTof9PLcyQwjBPzPLjfleTLOYBVtaz+lHbXgRp0wlDSX3uv0HBDem/9z31/x
	F/o9U6TS9xI61eaFH4L2KwcXNBdsaGJivQiuD2UFEfeHfYhiASK0CIVfEHWcX1hbS0xGqKA8Lgg
	p7xS0DsImh3xoyuRgfCvS+H3VqjT9RsNYezs4J+00hF9WDube+HpkRwaYkXeft+hdoXjvfjhPK+
	mOn7+MXsj1+kp234X/jezkeuCMcS8TvzI3uhl+sZs8hQswhyQ+cP1ADeTOY7rJ+umqoY5xbtGE6
	Q+WKoxk8wPnmLuk4wZGYEjKXv9nmvmXz3MTwfYBoXwo9Sj4L2nwWyFfngE+aWKw+gUvwnTsXwLI
	GHmSpDttet+4Ja/WjCGqrDzyG9fSGsxSYbREyMBtjggtaqu2BIS83Ku12HG0tBaHftl/Rv11WCr
	m4itAB2NCZwYgRqF01UM4geZ06BgNH4JhxYhWZ8=
X-Received: by 2002:a05:7301:2a95:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-36c9afefe8dmr5108211eec.30.1793811356604;
        Wed, 04 Nov 2026 08:55:56 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:55:56 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
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
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 04/28] hazptr: Add debug option to force the acquire slow path
Date: Thu,  5 Nov 2026 00:54:22 +0800
Message-ID: <20261104165504.2430480-5-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH: makes hazptr_acquire()
skip the per-CPU fast path entirely and enter __hazptr_acquire(),
even when a per-CPU slot is available.  This is useful for testing
slow-path locking, especially with lockdep.  It also lets
hazptrtorture exercise the slow path without requiring the per-CPU
slots to be exhausted.

Note that the forced path skips __hazptr_try_acquire() rather than
running it and discarding its result: a successful try_acquire
publishes the address to the per-CPU slot, and abandoning that
publication would leave a slot pointing at a stale ctx, which
hazptr_note_context_switch() then dereferences (use-after-free).

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 include/linux/hazptr.h   |  2 ++
 kernel/rcu/Kconfig.debug | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index 3372b1cdbee6..299ad8a07156 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -271,6 +271,8 @@ void *hazptr_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
 	ctx->acquire_cpu = smp_processor_id();
 	ctx->acquire_caller = _THIS_IP_;
 #endif
+	if (IS_ENABLED(CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH))
+		return __hazptr_acquire(ctx, addr_p);
 	addr = __hazptr_try_acquire(ctx, addr_p, slot);
 	if (unlikely(!addr))
 		return __hazptr_acquire(ctx, addr_p);
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

