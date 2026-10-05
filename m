Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1674E0212
	for <linux-kselftest@vger.kernel.org>; Mon,  5 Oct 2026 17:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220631; cv=none; b=gcG1rJB7mjqpfuisuc3UGVEMqVHG1c4PjKUlY/SFUuYnXPicIS2Y/jRixzyGoYBoeGfPxJvgpdvKIAlwQOluZwOzV9R2GExVuvFPU7E3A+jX/MoeK2X9+FaF/1pJatLODu0KFBF5jPBkKzBcRlWUifSQuof71WReSJQCXHaikDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220631; c=relaxed/simple;
	bh=qSkRi8XlT4WUuuM/Vrnlxa70Aiw5xHXCcH5kKxR3bV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h16bHZUaCyBrk1umYzAMGO8hA3RoWvtCX7/g5wuSh4evaD+QQWe1ZIIgDjISp71JttfP9nw/cAUbEaSxcdIir0J1PuLDwfj87z54eLcE72NqyhFrAdKr70pcjU5+lLlzWQbjfrkVCe7VfUjNSJDSvqymi4Io3Nuvdz6uxO9zkmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaloghTp; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaloghTp"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso891148a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 10:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220629; x=1791825429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qdf2Dycggm4mT6sPheIXdhrke0YZJhuYFMLF05Xnp3s=;
        b=ZaloghTpme6lwdDuJficWeiRQ3uXolA+P2wbeidCD2xxCgyMi9oCq2INMnDLZJUek2
         9Em+3UL4sJUgRhB5STMKCWxf9GvORO5cPgoHOMQuSORmdhRpMR9i8JLkg+zCdkOaGm5B
         2IlIAm2+6NO5iolLBaVn4vcPJ80U/uFuXELgwh6m6Q+fgGvqkI8wM5un7TFTY7P8juaz
         CU3vL346gPuzwa4F1zMxANmtut4d6n3vNq+Aq9krtmVOs0OrR9JyOAud3nhXQ71Weba/
         YLSus2wqXzBXF3jkni1+RBNz6kYfLwOEWm1yONbQyI6d6dYFwETDDwRVxXC8Q5pJgsIp
         f0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220629; x=1791825429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qdf2Dycggm4mT6sPheIXdhrke0YZJhuYFMLF05Xnp3s=;
        b=fy9Mj/IXKdtaCcI5Ym21NMw013/U2voEK0XrYQirJnol7vQ7CTU2mCTBOvjsSO1Wuc
         K+YtyWImQvgxZkoaaLndsNY9KAQvttDFn2vL3BoVXLJBH3q7HV7Wfd+Cq2ZRjXEotpvd
         jqwHe0WNqZBa12jCnsut0Pgsd37Qm93dDPKts5foeCMV70TMd8nQMxHcoqT30l7IXYmE
         Uq0778kSM56MjSRZ86RlfDShT+nWtBJ9368uwR3j4ty3SnNcAnjuIoO6iXOXkEo8JrHi
         3+KWms7etjNJU+jJAI4HzDaK0CukKJtiiXkjRGG37ohFSdxVMBmaWZV7mpkb8Zk7QnP5
         WB8w==
X-Forwarded-Encrypted: i=1; AKwUvBypL6JaoRtUMxC3ESVVdIxrWVhLhKac0c9CdYZNYm8EsOVbeAsbVgfTi15MOXFJcHboCg0hdRNSHqJ7YwpntFA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLijORGaUTUjPhrlYMnkni8y++kAuljC4GrxfGBcxDjO/THgCR/
	ONFKZc6Q6J7I/WydZE91vg+NrepxFGu5ZkDsUB/JLy50Ly+07t2X8S+j
X-Gm-Gg: AYBFou2hM9uwVn0tG4B9UZ7GIgyXYYWN9x/tMG39c/BYa8UZil1DyryfTh1WS5sPnfh
	4xbjyC/2p6xokIrELDXOl8YWn3DpKVUWDXsnKzeop9af/CuyjXDHGQZUT/3M8ozfxt8j/x+8OX+
	j3h/XJOpMkZEhWbmCKyWOtJ9xeGSXOQsDFc7isBk1dGPfqZEm7UMQlE/pxwQP0IedSSHZOfHM2H
	pYJveGwvJHOCqx45L9kLeT+es4DbzqlfsIo2wtNENpv/T4Tc/dmZN7ju/USIFp+jGeOyoyitz4l
	oeCe30F7lds39bzSfpOWh6m+moT8dY9IX/Drlo7nG9yr+Zfk17x+fEFeX+nZG/Yl/ffyz1YG8Jk
	vdb1VlJlofQvTInT3EAl9yjAeAcHfsx+YqFJf9sq9TFilExzTuPoMBnpLx9X0A3jjdUb1gGRbhe
	ofiAAcVMa6WDF47FxB7Fq2JpiE0H+J8+vK++s+ksWJBlFQLGO4l5pNCGO6gHhNWU1ePNSQsEqXa
	p2pt43V4w4vn8zIKuVV9tQfuxjevg==
X-Received: by 2002:a17:90b:5870:b0:3a8:32f2:f4a5 with SMTP id 98e67ed59e1d1-3a832f2f5e2mr1648236a91.53.1791220628556;
        Mon, 05 Oct 2026 10:17:08 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:17:08 -0700 (PDT)
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
Subject: [PATCH RFC v3 06/15] hazptr: elide redundant first drain pass
Date: Tue,  6 Oct 2026 01:15:20 +0800
Message-ID: <20261005171529.1378809-7-kunwu.chan@gmail.com>
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

Each scan cycle drained both wildcard generations: the
unpublished "other" generation (pass 1) and the pre-flip current
generation (pass 2).  Pass 1 is not needed for correctness, so
flip the wildcard first and drain only the old generation while
building the Bloom filter.

An acquire that read the old wildcard before the flip may publish
it into its slot after the drain has passed that slot.  Such a
straggling acquire cannot have loaded the pre-unpublish pointer;
see the following LKMM test for the ordering argument.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/hazptr.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 799784f698ed..86336f229f57 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -365,24 +365,19 @@ static bool hazptr_scan_walk(void *watch, struct hazptr_bloom *bloom)
 }
 
 /*
- * Wait until no per-CPU slot or overflow-list slot holds @wc.
- * Callers must ensure that the wildcard value in use by new acquires
- * differs from @wc, so that the set of slots holding @wc only
- * shrinks, which guarantees forward progress.
- */
-static void hazptr_drain_wildcard(void *wc)
-{
-	while (hazptr_scan_walk(wc, NULL))
-		cond_resched();
-}
-
-/*
- * Move pending waiters to ->scanning and perform a two-phase
- * wildcard scan shared by all waiters.
+ * Move pending waiters to ->scanning, flip the wildcard, then
+ * drain the old generation while collecting observed addresses
+ * into the Bloom filter.  New acquires use the new generation,
+ * so old-generation slots normally only drain.
+ *
+ * An acquire that read the old wildcard before the flip may
+ * publish it after the scanner has passed its slot, but cannot
+ * have loaded the pre-unpublish pointer.  See
+ * Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus.
  */
 static void hazptr_scan_do_cycle(void)
 {
-	void *scan_wildcard, *old_wildcard;
+	void *old_wildcard;
 	struct hazptr_waiter *w, *n;
 	LIST_HEAD(done);
 
@@ -397,16 +392,11 @@ static void hazptr_scan_do_cycle(void)
 		return;
 	}
 
-	/* Pass 1: drain the unpublished wildcard. */
-	scan_wildcard = flip_wildcard(READ_ONCE(hazptr_wildcard));
-	hazptr_drain_wildcard(scan_wildcard);
-
-	/* Flip so new acquires use the new generation. */
-	WRITE_ONCE(hazptr_wildcard, scan_wildcard);
-	old_wildcard = flip_wildcard(scan_wildcard);
+	old_wildcard = READ_ONCE(hazptr_wildcard);
+	WRITE_ONCE(hazptr_wildcard, flip_wildcard(old_wildcard));
 
 	/*
-	 * Pass 2: drain the old wildcard while collecting observed
+	 * Drain the old wildcard while collecting observed
 	 * addresses into the Bloom filter.
 	 */
 	while (hazptr_scan_walk(old_wildcard, &hazptr_scan.bloom))
-- 
2.43.0

