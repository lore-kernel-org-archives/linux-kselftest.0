Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811496;
	b=tNBwYM/QrDCft+8Qac4tY/fq9eIUdjuanNVUI+mTYRwwvpYkR27k0m3qlG/rSHlN6KTi
	 MWO6S+cFmG8PAAlM7qNc+jXP5xeRXe1pENeBMZUABa+xwp+AXcx1SiaB0XSalia/3SPAm
	 omlk47F01TadY1AmoBJOZ1Wi6Pvi7QuoQ2/NrDRVBCCB6eiiZ/hDMthQMOiVadjoLrt/m
	 RNPbKql+EbYcUuv6jhklzlsRxiHC5BNN9m+3Pd9b7QRNeC6azDfdgzc5gUxzdHlqJ+XUu
	 FMgYLRFANTDNIGkDAuFa3k8L1T8teCx39zUl33kYtOEyWEJ0TdiQphWVRqEn3dVsfhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y7w9zIZGwFreJVwPOaTuHd6p4ZAf4hMC78IhCBOO/FI=;
	b=vXIwwGROGPPu2rsjExF4k+3y79/BEQRGbwxVHaBWNXcRBN0QC1QPcOBa5Q01dk0bO2TL
	 qq7FpN6C4uIpomwqoAJuZ2QJj5zIYDjPKg2BWxejg10VQ+V3eTLjHDLF/3E1v3twW3eVO
	 ZPuu3yiLalM9uNaSsgRYLoG1ERw0jl9PsCgh6sbZTj8oudcw/c2+x7z4YEUBcEkAKzo4s
	 vakpj/7C8T+xh+z3IDgPJdu+0dmmWfUSU/wKCSMIG50djFSoUXGneEDq19BdZ2vp+v4Wy
	 e+QT1cYjktItDFbzuCh3PgcSspOOucMGyq2YiaFk7Xj9Mm4BVOgrpU3PBkHMUvKCGRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNr3tUus;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFF2606D829
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EFF2606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNr3tUus
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36dbde64409so285800eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811495; x=1794416295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7w9zIZGwFreJVwPOaTuHd6p4ZAf4hMC78IhCBOO/FI=;
        b=hNr3tUusaaErjUitu2I6XbppO/tHcSXKdcNOfa5cTRenOkzbAShzlYf+Vh6lhhHcnU
         tV0j2CjmKzhKKOb88naSBWlsm7UMSz+rFmaMbHHVVo52UBAQUQqzpBCnbhekDTbeMHdu
         m2HGm/OC5cbaC5EsFBwb01g0ztwO9qcrVtWW/Gy5r5WiqyNKkT4Fnrid+ZtOZGerKzfs
         i5yhjeAtyPa/dnKRefMUtTmhyXApUGDjfd1Rt/xYYyIFeKFYslG1vZ7fTtcF5bzZh99e
         yUQCBLmrELZusND1vAwkU7lxXMR4LlihbNcRhxjtalepwnGQ6X6xc8qKK1tJvFak4VpN
         STow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811495; x=1794416295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y7w9zIZGwFreJVwPOaTuHd6p4ZAf4hMC78IhCBOO/FI=;
        b=E7ZNZOj3D+HHgo9wIxR/fiFAvNPjA9R0ynUguWqVHYCboxe/eQlHCfcGOUkvAHEwg/
         DPZI2zTXJLDEllDZCoMQa+xhUVkOZbt0KfHHy/EGIju3RZGmeV7wBgq16N/1X3ONGplA
         NS/4ZjiZCp0Ll760/V/Tx944gfrGFzSQdw4r/rIofx6TJtuMK+Q5s8udcyhshVrf9UGd
         k/I7ADCQB/aPKn4DG1LEoKNqBPTb9fus0q6cJhkpZRPV76J8BtLxIHcJi5qRCpcWMlP6
         hTroNKJncgZiBf2f3ADnysy1eMZpJzMGSGbTyZltVgje8wOx3lWMbwp3XMJiLL9wHfUT
         kApw==
X-Forwarded-Encrypted: i=1; AKwUvBxV1LZZHRmCsypaooI+CvSLGQs+vhwwvsVQbEuIWAfYujXtVeMiUx0NFhFCbe4qjcZhNhldcFT+6d/vF0C4Y3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rmkxlfReN9jHTEdX8YkxkXEzAuDoUTkGzR36ueljLX8kIMlPj
	/wCvb3S1+dvHarQFPJdJ6PMj5EmAuK/VbiBO+q5hykvIP/TkyOh/v6ZW
X-Gm-Gg: AYBFou2AN/Vb3S5WY/sxUjeJmFjlOsZZ/BlQDvT29nFBh4whlM6eFfNonTvxH5QBx1N
	oaooXZaHmtVe7RIujodmJN2KWP0sb6BDY5h1EO5hw/iFXuluHdUHOhAhaXcqJ5H7clNj4IZg+1T
	jN6sYikqLpw64SoF3k+6pvP2wkjP6t7svnIeE0Yv0BhbuP+e4TjEJWoAOk9DiKj3fKHjVQSP+70
	V7Kz2rcKo3hbzBgHfZdPVXB3J/xja76ENc1zESAvdPy0b7mIMhfWu+gvyBMYh+DwIGjMaUj0e1d
	FS5UInhX0p0h5OWv+OK7KJMAUZ5ZuGjgj8ZIFT01uzFpbgHhRd1xFH9L38w/yl3cqrW72Rf9H+Y
	AyCrNaFRhAwI5Nw2REw2C7y01YCw2WkabkLS1YzfhRk5P9hKUOh+UWPCuWnNPe6Yb6nCTXpCwHY
	9ZFJIQOHnP50Z7UPV8cSbxyB3tcGOZIILdWtngRUfpmW7/HgqfUzFj+byAFeSo19euCMdJIaWcK
	U1SKIdmMJis0SkcVp9NKnoAcPCBFNdaUNRYjM73W0G3t1+yC+e7WK+/JbqLhWjBEMtlzm3IMn/g
	QWwiItYo6+gfh79N3XYd9vj4vFz0bbMYLFbZVGM=
X-Received: by 2002:a05:7301:fc81:b0:36c:d29e:668f with SMTP id 5a478bee46e88-36cd29e694cmr3306314eec.6.1793811494826;
        Wed, 04 Nov 2026 08:58:14 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:58:14 -0800 (PST)
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
Subject: [PATCH 19/28] Documentation/litmus-tests: Add hazptr drain generation-visibility test
Date: Thu,  5 Nov 2026 00:54:37 +0800
Message-ID: <20261104165504.2430480-20-kunwu.chan@gmail.com>
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

Prove that the drain engage's smp_mb() publication ordering is
correct: a release hook that observes the new drain address also
observes the new generation counter (herd7: Never).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  4 ++
 .../hazptr-drain-generation-visibility.litmus | 41 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-drain-generation-visibility.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 604c2c0025d9..79b0634ddb13 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -123,3 +123,7 @@ hazptr-drain-resnapshot-slot-race.litmus
 hazptr-drain-safety.litmus
     Test the engage snapshot race: the engage can miss an in-flight
     slow-path acquire, so completion must defer on wildcards.
+
+hazptr-drain-generation-visibility.litmus
+    Test the drain generation ordering: a release hook that observes
+    the new drain address also observes the new generation.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-drain-generation-visibility.litmus b/Documentation/litmus-tests/hazptr/hazptr-drain-generation-visibility.litmus
new file mode 100644
index 000000000000..d5c1ca247d71
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-drain-generation-visibility.litmus
@@ -0,0 +1,41 @@
+C hazptr-drain-generation-visibility
+
+(*
+ * Result: Never
+ *
+ * Drain generation visibility: the engage publishes the
+ * generation counter before the drain address (separated by
+ * smp_mb()).  The release hook reads the address with
+ * smp_load_acquire().  If it observes the new address, the
+ * subsequent generation read must also observe the new value,
+ * so the cmpxchg compares against the correct round.
+ *
+ * If this were not the case, a release could read a stale
+ * generation (from the previous drain round) while the address
+ * already belongs to the new round, causing the cmpxchg to
+ * succeed against the wrong round's marker and falsely
+ * decrement the new round's backup_outstanding.
+ *)
+
+{
+	gen = 5;
+	addr = 0;
+}
+
+P0(int *gen, int *addr)
+{
+	WRITE_ONCE(*gen, 6);
+	smp_mb();
+	WRITE_ONCE(*addr, 1);
+}
+
+P1(int *addr, int *gen)
+{
+	int r0;
+	int r1;
+
+	r0 = smp_load_acquire(addr);
+	r1 = READ_ONCE(*gen);
+}
+
+exists (1:r0=1 /\ 1:r1=5)
\ No newline at end of file
-- 
2.43.0

