Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7258B51C35B
	for <linux-kselftest@vger.kernel.org>; Mon,  5 Oct 2026 17:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220711; cv=none; b=qPTOnwSNtQwwnpt31ccQmZviIRlAeg3Gen34ufGFkzprlhavvZqT1B6mYIdFgop+2vo/Zp13HJtMixORI8uj150uL7k/6MM5tN5n9CM+gCLh8Ds20ajz7uDwj71iOtibYMqG64qXOpW+B9bWc7GUVJ6ozJmetvG/d143mfB/+KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220711; c=relaxed/simple;
	bh=VRRvq3zLEbjKyIt2UhIB5bfMCL6WQ+2ygOmVvN1KkXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RqK5pnu8sumpujFzaG+Po4LMahPshSYSd+gfIqP/k2y8W2D16JgbLyrea2A8GBB9dqv/EHcqvsNhBTLD0T7gSHd3PzrodnB6/7Gzkod9SR+0fCuK7ip9El9yo0PAYPc17KMrNuwWxI+peg5d+79+Vhg+b9wI0TMoZkh2UH3FVPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZI6elm2; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZI6elm2"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a7906f463dso1601264a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 10:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220709; x=1791825509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQJb7vr8ZMuFWHiL+RnTPMV3r43UUmwaGCJuJ+OyJv4=;
        b=eZI6elm2ZWLe1z4EUhPXxPUuRWeyQ/T3QgF+iNd4qtEBgDAzb2HTJYrf59DX/nw8FQ
         X19RbX693PaJwIgsX75DmJEaJpfTrh5fv//S51rijQFmw5XeffUjf7zaAM3bWekOUPWE
         0gu8vWfbshp1mwy9aoqCV6/xVw+Fmh86nsg6b9gO8+o09QQERfnNJ9SVCfIviHKeySQ+
         bK+fXcxo83sh9iFrAOM/QzS3mHx+h8SY9sxkgt2bijktpgkeSFwr/Zvi6U7nW+eh0VLR
         KIl+LT8cHfi9WY6ajIbLO5KrxPemNK46ByOLotl1BWBfHU8GdCEOIiYIYtpzbfmPluAF
         BoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220709; x=1791825509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQJb7vr8ZMuFWHiL+RnTPMV3r43UUmwaGCJuJ+OyJv4=;
        b=uHo/YdTwzMMrlfNaut5uWY4IfEqgXOtQwKqWP/0AQBKbwiiO59RHJkA+gd2fcz4g6E
         VScTBsCf7ydDUxdHXaB/xDukawH8VWvaCrvO8hZniVqvHL+c1+MMCxjGuGgj1DZ4+mKz
         r9Ico+aMMW88n4xw5o+rX/c/QcHurRvUnMaQuoPShU1/cdqXupXMBPzIAvWMEFJOUY0o
         oESuSvevSNCY90nOmZvfzRU+SadBcxGAtzaLAW2KoaZBnsXsMriUzeUQDCF1pbmqTtHb
         aLpCsyRN1HGbCgfmJw9RGLYwxdDcWFrG+mahfwGBekneITl9jforB37hIzjDipquw8AG
         Qv0g==
X-Forwarded-Encrypted: i=1; AKwUvBwHdIaZGN/LJUNnGihDmHaeaxfnieMy1LJgaenv9Q+QeU49Y+6hBJFtrhvp3sPaNJjiqnVUuM03+OgIS766o8s=@vger.kernel.org
X-Gm-Message-State: AFq9FYItPyZfrSxAQd4pYI5g5Z7F+hGSAiBP3r2YjAeiNWI5/T5q0YEu
	6QXDEAlbhR51eruFFDjfITiztGiCeb0Yyfn7HNr6KUZPog6tptjTp0lh
X-Gm-Gg: AYBFou0RzQxQ7cqiHT9A1kzRPTDEHAj4gcEdUcxW/2A2uH4O5N2Ol6taKabv3XgAgvz
	9rXctiyVBxJqqM1iQ2dCOjmxMdoBfBcZcQ5sHMzq53JKWfTLEFLDUUvAFWPbJXhdAIxvB3SwM2B
	edGx5LPWOSitX9OXcDXtmxbc4qtRiKWfBZ91DgcR6t+/YLjxB3wO2Pb4BJlQnmjPLviYNXJdSZC
	uWgFmE8rX07OKpuxwdOl/LXJh2naejaYIvQuiSnpNvxDkKJRG7ibQLGDSSkhVu6dTXTqDJtmFSx
	kh8O5XYD/QMCub+UaqjxGcNeRFJ8AfsQRw7DPpuj1xr4Eak8v25z5Dh0i4nC/q8PYdumoekZ1tr
	jgfLaZANDJQFmzwpWjOPyREEjR4fOKcA8N+vjQrF9nNmy52yh5Wb6wINObpnw8H1U+2ZUDMA2pB
	68UyGjRZYqb+Yd8ctxfNRb0UyLpFqg5FbfPKeUxc/AYLNcDCuDetlZd9CpJGtt6/1KYZ+bReLy4
	A9ELzftCikQCdBIJiMlv9bnN5JJiA==
X-Received: by 2002:a17:90b:270d:b0:3a4:97ea:f0d8 with SMTP id 98e67ed59e1d1-3a6ced37137mr10733555a91.51.1791220708564;
        Mon, 05 Oct 2026 10:18:28 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:18:28 -0700 (PDT)
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
Subject: [PATCH RFC v3 11/15] Documentation/litmus-tests: add hazptr acquire-before-scan test
Date: Tue,  6 Oct 2026 01:15:25 +0800
Message-ID: <20261005171529.1378809-12-kunwu.chan@gmail.com>
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

Add an LKMM test for the hazard-pointer publication protocol used
by the lockdep conversion.

The test checks that a scan cannot miss a hazard-pointer
publication while the reader still observes the pre-unpublish
pointer.  The smp_mb() pair provides the required ordering.

This covers the resolved-publication case.  The in-flight wildcard
window of the wildcard-flip scan is covered by
hazptr-wildcard-flip-escape.litmus.

Verified with herd7: Never 0 3.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             | 13 ++++++
 .../hazptr/hazptr-acquire-before-scan.litmus  | 45 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 4d4ec9c6f2cc..c2bf20fa4092 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -97,3 +97,16 @@ SRCU-fastpath-scan-before-anchor.litmus
     period, violating the SRCU grace-period guarantee.  See
     SRCU-fastpath-anchor-before-scan.litmus for the opposite
     ordering.
+
+
+hazptr (/hazptr directory)
+--------------------------
+
+hazptr-acquire-before-scan.litmus
+    Test the resolved-publication ordering between hazard-pointer
+    publication and the scan.
+
+hazptr-wildcard-flip-escape.litmus
+    Test the in-flight wildcard window of the single-pass wildcard-flip
+    scan: a straggling acquire that published the old wildcard after
+    the final walk cannot still load the unpublished object.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus b/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus
new file mode 100644
index 000000000000..6dc13830c07c
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus
@@ -0,0 +1,45 @@
+C hazptr-acquire-before-scan
+
+(*
+ * Result: Never
+ *
+ * The reclaimer unpublishes the pointer, executes smp_mb(), then
+ * scans the hazard-pointer slot.  The reader publishes the
+ * protected address, executes smp_mb(), then loads the pointer.
+ *
+ * The smp_mb() pair forbids the reclaimer from missing the
+ * publication while the reader still observes the pre-unpublish
+ * pointer.
+ *
+ * This is the publication protocol used by the lockdep
+ * is_dynamic_key()/lockdep_unregister_key() conversion.
+ *
+ * This models the resolved-publication case.  The in-flight
+ * wildcard window of the wildcard-flip scan is covered by
+ * hazptr-wildcard-flip-escape.litmus.
+ *)
+
+{
+int ptr = 1;
+int hp = 0;
+}
+
+P0(int *ptr, int *hp)
+{
+	int r0;
+
+	WRITE_ONCE(*ptr, 0);	/* Unpublish. */
+	smp_mb();
+	r0 = READ_ONCE(*hp);	/* Scan. */
+}
+
+P1(int *ptr, int *hp)
+{
+	int r0;
+
+	WRITE_ONCE(*hp, 1);	/* Publish. */
+	smp_mb();
+	r0 = READ_ONCE(*ptr);	/* Load pointer. */
+}
+
+exists (0:r0=0 /\ 1:r0=1)
-- 
2.43.0

