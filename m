Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBF14FB9B7
	for <linux-kselftest@vger.kernel.org>; Mon,  5 Oct 2026 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220644; cv=none; b=ditvDtD+U6bjZUkViZZuS4luLO7aM2/5GKsGiW0mKjCZufIdn3FUzJ7LYrMSzBzDJaVV3xYunemNvvYEaauqY5BBWwdnO7xCmLFWZY0UuWg+DFBVlqysozz3j6JRlf+aH/VkFXKJAQnzRg2OaRB8uU8XxI1yKkg3Is/zjYpDf68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220644; c=relaxed/simple;
	bh=+3MpZXZDrpG3qLkvzfnf9AFNVYrh8OCkchmfy1w7NKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nbW4htIqrA1wI3yr8/VUNHrBbjbVJ/xB//8udmJVzyw1LYZ8WSTvmMZ/4uaRcDu+ENwJZiJ9PXw8gLLdN3VNl3IHVLfN7Ise7+N35G8fao9wUMiaRXvHMJIc7y7dytVFNMwDqBO20hcH4Pr61YISTg5SkozjKkul7AnePQ81v4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Smt9EFxv; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Smt9EFxv"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78dd54610so623915a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220642; x=1791825442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgimI6/+2euHwRm1MdlOUoQLnXLe8HSbpGa41J2vK6A=;
        b=Smt9EFxvekpVrMOMqaRC5TFTpCRG74WHzK5c6xcGumUvBjmUfPtWC8jJZ1kKJGBZeb
         L2m4RTt3eAqpw1RM0U7HrzSAnzSGVfxcpcyRvfGVH3fRpQYvWAplmT08ajhkuA6alUSJ
         BUgGV/o58GiXsdEnmehpVyiEG+o6OPlDh4G5uX86DnOtCzGzIKfi9tZ+gUnvq6Kx++5X
         bKQV3vX96eP71PymYYPR505GVRtITize85QI0vxpkUnEEaLlQoo4FBzPwnBISdIl9xxF
         jMrrSD/MsKMSlbSv9fe9rcBRDeTNGXZaw6Tuc06DTr9SIQzKKQcAS2wEgaR4R5oFG7Qd
         e54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220642; x=1791825442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgimI6/+2euHwRm1MdlOUoQLnXLe8HSbpGa41J2vK6A=;
        b=vSasPLUS/3EKqSegpjiWS1eLFcJtjA/UeAwXb3xpqhOnn1nGCdqPZUg5/42/1N2q+i
         mcDj2KZkYGA/w9dncOUiiY5XoZi8EYtLO28udFwY/9MrMYjDVIrMqmTrOxNi+0/x1gMf
         Tc7kWQ8tMaQ8I2nY374qhFNu9aYjTY+iOubSNYIjDQFtkVWLiyOdN1ZpktHrMPdw+iMo
         qWLeEz7BsquFK7uy1GhG3N25M8nNOBeUwtRquw/rvgcGP53I9KABHF+AtEiMbJcSySci
         JS0hOOl997n2exrY9bOpXB50KthoXeXv+0/R4Y+aA357v0bf/bXQhfssO3K8J/x4dz/q
         5ovg==
X-Forwarded-Encrypted: i=1; AKwUvBwtdnXRsJz6pxi1aabhaWdgotQtieya2zOC8CVioP3Kttinfwoq41lk45d16tQ5rI3a+MtEibC/bhFDRQovNCE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0yZpPvmjOSFTBO50nCSg/e0RCbofKsebPtjgV8opMaUYyRsnv
	xkLHoIvbEyugF683HI6d1C2pBxNmlVJW7URMZ2jOBs1vQzNNKB9qQ96z
X-Gm-Gg: AYBFou2rvH4cjJ8muNDhbuqzGBIl7n6J+SzWvEXNgglJn3VgtJPaLWy1+Hi/JpG4wBM
	YclcLqQlfPF6KG0MScQ8QLsuA2XS394/8uu8UuK5DqYwv3FU0A0t2wkz4CEFXRFmGhKmrxXJN09
	S0Yj/EznjCWKHfaqviG644iCdP0hMyqehe8CCrMDgKARPpF6tj1pyYjKqy6iGfUFqscrammzPRp
	cPj5odRJAAYxqa0pFaXvpf54yuX2tDB4JFg2C6f6bAy91RhrsnwHgbnhZt2d5pighGqsTsztXB9
	wmNLeMyW04USG/pCzupfirVG1F9qWqiAt6Rd2Zkd+cd3aqWYTHZB4COA/31+FQPu0hDxumV6SNY
	6SFQx9Vhrr9Q9Z6m/LqQGKEzOZuHGv6Zwm/uI4VV+4QfWh47C7qpGevSP1ojk0X9v1rOwT06dkk
	Fbs/Jty/YHUUb9Md4JJOHyhVJlz9I8XjxymYR4avzqqrMByb0Hr2EIZka5ZlNoGuQlGCQXNcKOH
	MUxnNUYHRXo9/Gi574lBb4EG5tDEw==
X-Received: by 2002:a17:90b:4f84:b0:3a7:ee74:e8d2 with SMTP id 98e67ed59e1d1-3a7ee74eac6mr1974037a91.25.1791220641154;
        Mon, 05 Oct 2026 10:17:21 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:17:20 -0700 (PDT)
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
Subject: [PATCH RFC v3 07/15] Documentation/litmus-tests: add hazptr wildcard-flip escape test
Date: Tue,  6 Oct 2026 01:15:21 +0800
Message-ID: <20261005171529.1378809-8-kunwu.chan@gmail.com>
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

Add a three-process litmus test for the in-flight wildcard window
of the single-pass wildcard-flip scan.

P0 models hazptr_synchronize(): it unpublishes the object and
enqueues the waiter after its memory barrier.

P1 models the scan kthread: it picks up the waiter, flips the
wildcard, and performs the final hazard-pointer walk.

P2 models a straggling hazptr_acquire(): it reads and publishes
the old wildcard, then loads the object after its publication
barrier.

The forbidden outcome is that the final walk misses the
straggler's slot while the straggler still loads the unpublished
object.

Verified with herd7 (linux-kernel.cfg): Never 0 13.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../hazptr/hazptr-wildcard-flip-escape.litmus | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus

diff --git a/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus b/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus
new file mode 100644
index 000000000000..de467bb82d20
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus
@@ -0,0 +1,46 @@
+C hazptr-wildcard-flip-escape
+
+(*
+ * Result: Never
+ *
+ * Check that a straggling acquire which published the old
+ * wildcard after the final walk cannot still load the
+ * unpublished object.
+ *)
+
+{
+	int ptr = 3;
+	int hp = 0;
+	int wildcard = 1;
+	int enq = 0;
+}
+
+P0(int *ptr, int *enq)
+{
+	WRITE_ONCE(*ptr, 0);
+	smp_mb();
+	smp_store_release(enq, 1);
+}
+
+P1(int *enq, int *wildcard, int *hp)
+{
+	int r1;
+	int r2;
+
+	r1 = smp_load_acquire(enq);
+	WRITE_ONCE(*wildcard, 2);
+	r2 = READ_ONCE(*hp);
+}
+
+P2(int *wildcard, int *hp, int *ptr)
+{
+	int r0;
+	int r3;
+
+	r0 = READ_ONCE(*wildcard);
+	WRITE_ONCE(*hp, r0);
+	smp_mb();
+	r3 = READ_ONCE(*ptr);
+}
+
+exists (1:r1=1 /\ 1:r2=0 /\ 2:r3=3)
-- 
2.43.0

