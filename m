Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811468;
	b=znsoMjvDP2zEdy71wfBj2WPEq5WsJ4zyXtVv9SNcgwdmEQKVVQ2UUJoYZJAwl3Vl7/NK
	 dE3hyFYmlfu/RDasAhFvNIPe+N8PpVjsiMUlRLegxsjFbVqB04RGwz/dyzAR0Z3XLtp9X
	 urpOstRFGeStKNJgkXTGWwBm/xPP4dJ70r+tMI0FBrlAIq9tfU2rPCsm9d2rOySyJkDnA
	 q31W7y32iHRSmw43uB9GE/Obre0pLC4y2BBqCF6g8c4RS/fva7/e65BAyFXsBaO9CsXfk
	 KkJI/tn+upXT2ohrdv0pScKqVBujooNSSgnvepKVLr1LNhcgDVsCSsujxFb45sOmAow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HYFy8sOOELLyqP//oMKFGSpOITyv86S+D257oV2UNCY=;
	b=xoxbztqNv8nNdXxXbW6jZOi/IubPWLugJvsXX3oT+J6b4cTWu/J48JCHppdelADn0TbW
	 jLQ+7dKa1lrASkjBqGgmhlFiM4nMsjnu+u1LiXpwREl+JU2d1QFIVFI9Eo+rgWxzeKQB6
	 Mypftoh9w2Zz8YE/zkFj49GVnWUiFuHPK8aQSyCuQiN8oXty1hIVd999Y4iAbyqLXp99o
	 jT7fDqLp+g3hUbAnDolvkqf1cZH8Z/Sp/SOw6JdFBh4Vbb7IFc6RtFYpTwv6KJmmuRruy
	 fwPMLfmyIsYPNMcZOZl29ITfmPjQMv9gpUoxNnQerPa2m6sPCbfYwUUumyatHIqeGQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+yZfRyu;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF99606D80C
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EF99606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+yZfRyu
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35c76e9614aso1208586eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811468; x=1794416268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYFy8sOOELLyqP//oMKFGSpOITyv86S+D257oV2UNCY=;
        b=H+yZfRyu1YpjAqnbnHiKh5xNTmCDYDOnNqBVbKlooMK+sxvVJEQXqGJdt2ppEr1oHx
         t435KiYlxJLi6R2A+7xJQKVHU0bpd0p4PwvDNarn62o3341CZREK7JiPVkwmMKTVkZNz
         BPuL/XdarsAwqfDbJv8Ra0M5t2G1eDT8Op+OY5grEIwd/imbjAuY5jPGa59Euw6GYLM9
         GX5rT/byFl19eCTBAowU9TiUfPVTY8CrphI0yYByVAzBDZsS9lwj0htyPQuwfm1cCYSJ
         jFIBEzQv/l9itvS6ELOYrAx7w4GDmZWPFyGVpIPncbIFaiHeSVl0GE9j3rCjCkbMz4Zs
         sfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811468; x=1794416268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HYFy8sOOELLyqP//oMKFGSpOITyv86S+D257oV2UNCY=;
        b=GB2AZ4HOBfW1MgQFyUvPRdXYUq83m5Fh8t1aF3vyIq9GC5YxQb4TrSTH4cIV0nEfvS
         22bWRVK+hNW2lK+ScV6Rz3j/wszoVFGlcfcisLGo2A1RdENZwkcUyueSWit5qoDXLeX1
         fb62rWlzk5UPkUKRYGaFyFqqiNueo4TK0T7qiEm2Gj50LQkRo/M96N6L0njtVfdomd7S
         yb6C2DVXcAhcvHSqAJQJ2EAJYnqTlOPZLzVf+v529JxgjwxSZjMCZShAUOza9NeXwMmQ
         K4nOG4sBIAn6R2YCbN6uQc4osy+jjOxnpRHhHj02m8zMuSG2XDjhl4qEF2rBlgtehG0s
         c6MQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVLTw6+RhtHUtYEcbhLyFbsKBlrunFDuMVtFnmNh3PWwL63IRqup+NR3AZv6GAJgkxzuFPiE3bjSvboRw+EcQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PH4tf9TA/kRYkSSfNaNCJMp+Y1xB+Bu/1QiBEtnvyJjKEK35f
	EYPbO70s/NISYSebGDT1e/o4QyEo9RbLDkPWX76ezGt+giMHy4IBmvYv
X-Gm-Gg: AYBFou39vRFonW5G44ehw2Mp7qErBt9BtBCeLZ+GHvmgCpCslc59vBJwmXDBHYYtpEa
	NBmXBos6s+WUTls26ajXsVQ4kD5cjyRDsvtIer05u5VKk8YVAHWW1zNHaNktsSFjQg5g273CR7L
	BOP6OvrY5u/HE77lUO+ZLy7Edt68jQGO/4OuGCkrvJiDlUBJH3DH2vHmkMu7wX9pQsrL+0XGTbK
	HhjDTwc/IBBeQIEyFEWZxoi6EcHe+mdRaAntGyfJoWNt2DhdKHn4DS8l2EZBpuTApOgdXWKUnlX
	/SIIqiCeDoOvS2oMQbF+lAUZfCXk51bAwg1P2K1Of5MDkw7CZ5dNuCyWWnwI+nNkKeZowA1+OkA
	EdN7lZm/Mvg6DZ0XU4W8t4tbymbS3GV/JJ01VuCOrIWEKpNQD+BEmWzVZIjjkOCSHhm87JKNtKT
	oiXaCUy3oVbTJseueruqySKsfOKIJmEq/Je5ilzwTZJVute9Ct0ZuZ8WwpyzwmYbFWO3hLIxQfI
	GDyuPiPmVWBU0OyLyhfXF8OXuCi/GFG44RtbScoaFRgzpvuDYrqlyUIK7ENdDcq5iODC7T7eeqg
	TPCvIDa0ZYaxQo8HUPtSzCeAbp+LWH7rsJB78zg=
X-Received: by 2002:a05:693c:87d5:20b0:35e:7bfd:4613 with SMTP id 5a478bee46e88-36a42425470mr24210020eec.40.1793811467022;
        Wed, 04 Nov 2026 08:57:47 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:57:46 -0800 (PST)
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
Subject: [PATCH 16/28] Documentation/litmus-tests: Add hazptr drain engage-wildcard test
Date: Thu,  5 Nov 2026 00:54:34 +0800
Message-ID: <20261104165504.2430480-17-kunwu.chan@gmail.com>
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

Model the drain engage's wildcard defer: if the engage reads a
slot holding a wildcard (an in-flight slow-path acquire), the
engage must not complete for the target address.  The smp_mb()
pairing between the reader's wildcard publication and the
engage's slot read forbids the completion interleaving
(herd7: Never).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  5 +++
 .../hazptr-drain-engage-wildcard.litmus       | 44 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-drain-engage-wildcard.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index c2bf20fa4092..daab126e45a2 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -110,3 +110,8 @@ hazptr-wildcard-flip-escape.litmus
     Test the in-flight wildcard window of the single-pass wildcard-flip
     scan: a straggling acquire that published the old wildcard after
     the final walk cannot still load the unpublished object.
+
+hazptr-drain-engage-wildcard.litmus
+    Test the drain engage's wildcard defer: an engage that reads a
+    slot holding a wildcard (an in-flight slow-path acquire) must
+    not complete for the target address.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-drain-engage-wildcard.litmus b/Documentation/litmus-tests/hazptr/hazptr-drain-engage-wildcard.litmus
new file mode 100644
index 000000000000..0cee89893dad
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-drain-engage-wildcard.litmus
@@ -0,0 +1,44 @@
+C hazptr-drain-engage-wildcard
+
+(*
+ * Result: Never
+ *
+ * Models the engage's wildcard defer: if the slot holds a
+ * wildcard (transient value 1) at the time the engage reads
+ * it, the engage must not complete for the target address.
+ *
+ * P0 (reclaimer): unpublishes head, then reads the slot.
+ * P1 (reader): publishes wildcard (1), then replaces with
+ *              the target address (2).
+ *
+ * The smp_mb() pair ensures the engage cannot observe the
+ * target (2) while the reader still sees the pre-unpublish
+ * head.  This verifies the publication ordering that the
+ * engage relies on to defer when it sees a wildcard.
+ *)
+
+{
+	head = 1;
+	slot = 0;
+}
+
+P0(int *head, int *slot)
+{
+	int r0;
+
+	WRITE_ONCE(*head, 0);
+	smp_mb();
+	r0 = READ_ONCE(*slot);
+}
+
+P1(int *slot, int *head)
+{
+	int r1;
+
+	WRITE_ONCE(*slot, 1);
+	smp_mb();
+	WRITE_ONCE(*slot, 2);
+	r1 = READ_ONCE(*head);
+}
+
+exists (0:r0=0 /\ 1:r1=1)
-- 
2.43.0

