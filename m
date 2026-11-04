Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811349;
	b=E9L3rTcJ5UWq5/D1gOxrGGO2Fo7mirEqN492qmg8WxZYBIkeWo0J/rtpsQ9kCo2kIPib
	 xDn9cGMdn52lQrLrj6AFvwFl8OzQAT7QzDETVxVTvf3CsUyusO0PA0vNDYhPVFsHkd5c7
	 Zr7BQRB4JuFKBdxgEbAs9Bd0IKq9WgNBL5fgbhUbinxlscTyLQBOc3+YBb0s1QIv7lzxC
	 nXZNFuKvd6UCIwRnUdYWj4OID5AHg62cCz/5r7FyyvDDlKgXnHlNAHBZf3WK2Z8ySAqrg
	 5CuMMF3thv91mFhBfIBbFaz0RXeo6GYILLEPgtWeRIbAIgQl5s+TDgLuI2pssYVrP5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zN0OMa6DsitFd0I63/8rm5wsSSArSxIu8WmzT7WDGsU=;
	b=RI3DvxKzqbuwrzpVdivONlzDWk57v3CEoSxEzLXEB1/tqz8MFVyJ6audA28t93YLVTBr
	 Bkaw/eGWTYr8iFQKMLst+fz2ncj6kA60b4iRoY1W4o770AH9r1MDGSOXOf2zRTxwNjgub
	 M+8zsBITOVhON8z4d5FQlQC9X3+8EBCi5o6Fn4aBSUshEvwbnBMiyV9SYS7ejf5Z1GfIL
	 wRaK2kJhk9elKcGBNaCiiPtzHzom2hXJCqeWn8P5vkcHROkdCyhYQ0VRY+nfvlCXI2CT8
	 uB8vL3tbLIrg172SVwtLsbzO0fENVbIac2O4NhbyC2cLxCZ5sQdA/ZFwYdqA1rynQUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GfhIGsI1;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA147606A329
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA147606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GfhIGsI1
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a18fc7a38so2022758eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811348; x=1794416148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zN0OMa6DsitFd0I63/8rm5wsSSArSxIu8WmzT7WDGsU=;
        b=GfhIGsI1A79J7jj8MJAkxgJjudxW5sb6BpufeqVLWo4k5o9TBPAOkoCPeNcDs2elCb
         91bVJsIm83LcNhiO5mYbF39oD7VEjY9BiK+zk6u8gqDTaVdUFDv0uslgPSVOPnH1Kwk0
         hW0fpiJUPDSulT9sjmuAXODm7KaVFn2/qcZ5VCjidr1u9VELGD6xVErSX1p9jDOreK11
         c0wqkNvo4FFRBO0j78kT2Pted/n+mcjMpXtVQKHfEYds8sVK4NeBEAWete0R+fJr2Z8Q
         gVmU+4MLZBzoKT47koTB0I9kNjDp1iWCjikr7bMtNUnkLsmXm+5nFGPVV+slNHi8wJzC
         BIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811348; x=1794416148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zN0OMa6DsitFd0I63/8rm5wsSSArSxIu8WmzT7WDGsU=;
        b=wksiZg6aCOGr+TH/OFqdBEfJyfJhc1cN3ZsOGbaezbWLKkPi2hTwfNr3zA2eggX2OG
         7eAjo5FJqXlZOBYcdb9fsEPtqnG78X6MGQdBdp2xqYs7+aC5+fT5bnkCxDnC2Ie5EfLV
         p4Mwcfb79G6CUb2iRe9YL/zR4ACnI06qFBqI4mJFP5iCOAl5DxeOs39TigOmEJXmwpel
         VsiIZRnJgARDlT3yTa0oJif44S84AesvFodAl3IosYT8uYfbkX+AAUKXFAvExxcDtWu9
         BlITVAVhSmAUL6AWhu8nqlXDBekHHyOGM/d55Lsgp3cy+s1NxjP5Apn4AOZgzUOV8BUy
         pQsg==
X-Forwarded-Encrypted: i=1; AKwUvBz2qCsQSJLa0iRHtzEivhkDqmGD3synjA0t3JUgqrAb3h/bdfPj2HB9IbbfFPG3kaPDyPuV4JndAAaAbSWFqow=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t9/G9MaK7xC/WrZxefOrPQHe59ngfhdpGw6s6x7lTrVx4mWb3
	9BJr5eQu3LqobiRDAAPqA/G7eFCRzwq/6HQ6frx43OyirfNlv0lvApma
X-Gm-Gg: AYBFou1RP+h6YHwOgNspJQAaGoCkh7gINKa7pR7uRH8jfVkFc0e87JmG+UKx7fqYTDW
	o7pLz429Y1y4xFiRbe/XkKYMxIQOImX+UH0tqjdbGMn99rzQqgUTogjLm7JL9hqBDXh5YscZnue
	ccmf41LU3MY8GK7lVuTYjGhoBlahMRpIIIwZA4khSwzBqgXmpVUDwEITAI5R60hVSXL+VbOhnac
	hGDbfXaKngKBf2jpoUKi0uiVcclC4qSnbJn900/SifX+8Gc0dmz7sps4l0Ht5azkWCHzp7XUB6j
	ksiPuf8AdRpJiB9vtasB93BWOS18e0HJFAUX4avo6x58yugShWIqwqibRflrDLYGPtcRHNK6jNw
	ziG8KfDHAU3FT6eNb5TWZFMI/Sns3EOTRlcTzRmsBNhAEN4LKmnn49Pb9ZTUD8qpGJiAl/jUVvm
	hTEjvqx9BKZLGfG3Y/tcYdIEa64p1Int0D8q3IH1n9nJQv8/EOKBNWHkhAwyLvyjJcfRcmlPeGP
	TEAAazLwwYb6wpqrhAIxYFp+ujVi6a62Ggu6FW7iB82xWMK8TBjBha+UhAntlJ6mhsz4QbgumuX
	zvuDVkBlle1SteoPDQw6k5LEM8unn//KsmGAXSQFaoYdFL4MkeMBACTBJKvF
X-Received: by 2002:a05:693c:6092:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-36a423e52c8mr29321886eec.23.1793811347548;
        Wed, 04 Nov 2026 08:55:47 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:55:47 -0800 (PST)
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
Subject: [PATCH 03/28] hazptr: Add scoped_guard() support
Date: Thu,  5 Nov 2026 00:54:21 +0800
Message-ID: <20261104165504.2430480-4-kunwu.chan@gmail.com>
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

Add a scoped_guard() class for hazptr so that callers can pair
hazptr_acquire() with hazptr_release() on scope exit.

The guard holds a pointer to a caller-provided hazptr_ctx rather
than embedding it.  The ctx must remain at a stable address while
the hazard pointer is held because the slow path can chain its
backup slot into the overflow list by address.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 include/linux/hazptr.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index d37792af3493..3372b1cdbee6 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -341,6 +341,43 @@ void hazptr_release(struct hazptr_ctx *ctx, void *addr)
 		hazptr_unchain_backup_slot(ctx);
 }
 
+
+/**
+ * struct hazptr_guard - cleanup.h guard for a single hazard pointer
+ *
+ * @ctx: Pointer to the caller-provided hazard-pointer context.
+ * @addr: The address returned by the matching hazptr_acquire().
+ */
+struct hazptr_guard {
+	struct hazptr_ctx *ctx;
+	void *addr;
+};
+
+/**
+ * hazptr_guard_acquire - Acquire a hazard pointer for scoped_guard() use
+ *
+ * @ctx: The caller-provided hazard-pointer context.
+ * @addr_p: Pointer to the pointer that is to be hazard-pointer protected.
+ *
+ * Acquire a hazard pointer using @ctx and return a guard that
+ * cleanup.h releases via hazptr_release() on scope exit.
+ */
+static inline struct hazptr_guard
+hazptr_guard_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
+{
+	struct hazptr_guard g;
+
+	g.ctx = ctx;
+	g.addr = hazptr_acquire(ctx, addr_p);
+	return g;
+}
+
+DEFINE_CLASS(hazptr, struct hazptr_guard,
+	     hazptr_release(_T.ctx, _T.addr),
+	     hazptr_guard_acquire(ctx, addr_p),
+	     struct hazptr_ctx *ctx, void * const *addr_p)
+DEFINE_CLASS_IS_UNCONDITIONAL(hazptr)
+
 void hazptr_init(void);
 
 #endif /* _LINUX_HAZPTR_H */
-- 
2.43.0

