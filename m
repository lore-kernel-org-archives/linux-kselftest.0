Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58770501F21
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 17:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961078; cv=none; b=KZquhJdk/jENTNblukiFF725fkY4VPtfCXqryee3NEamcQ+n8xCnTWj22EKHfpNANIWUdY/No4gcZlWt+ldivNMGIzllEwo+ZIr/IqxT7n5triO7VZex9dcoDFIzyL3YuKM5RyUS2+dPJM1OzmRPH8R/X2rNWfl7EDwvgq+QUrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961078; c=relaxed/simple;
	bh=VRRvq3zLEbjKyIt2UhIB5bfMCL6WQ+2ygOmVvN1KkXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M/0EUCRuWFFIchMRWTjqPErzpBygbuPlIpMeBdeGxl4EnDh8+3I7atc75Kg35iXzxFa+CuaQStDuEyyhX9pY8NeNzcYS2naZ7b7lkmtyoDqIDOYpfWjdxLVuHcmrGjpvQIBM5d9H9oloTxjxv388g30ZFu82N2Lrh2i2j6OcMOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yjohda+U; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yjohda+U"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2e49be254c3so4769315ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 10:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961072; x=1791565872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQJb7vr8ZMuFWHiL+RnTPMV3r43UUmwaGCJuJ+OyJv4=;
        b=Yjohda+U1LkmX0Sv2EzS1S2PbXcFm5y0bSnamZN6vV9B1c3KNTldFwVK7f/CayVn6c
         bz4phj6mU+CJ1mHCMoY7WwOZerDeCIPe6YFXyW+t+5Fw3JTnJ/ZAFIasxMsuXUz4Jr1A
         qELy5swnfLQX+kOVoAWV7WBMpP9xFGcJcEyjHemphVM98rnDY4Vb1fLILV39fDJ9pvEy
         ElRGYOk4db43DOH6isQb+2H0LNcswEJtUFop3UXgMvEMeLJp0GJj4fR4TtAwT2MTgdUA
         Ir8yxDNV40A8y8288bo2F0QcW+CGrz8tGZcF1yJSVq0j4VmCZrIYwbMwwEP3bugSEEPp
         imcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961072; x=1791565872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQJb7vr8ZMuFWHiL+RnTPMV3r43UUmwaGCJuJ+OyJv4=;
        b=NKPk0MjDMgPTyQu51UyHl1+SzeR1THskqCdc/nnecpFGRCnRG8yGIAFUt0QhCl4lIM
         p4vEKbOiAOM0rHqLC0wieKuE3q47sgUbviL8/55NCY9PWszs32S7Hd3nBwlA6eD27UIA
         52qMYua6Gz+ETDtUAkF8EPfmkyCt+Ehsq40YTga1U4LqaCd8IcXgJQG42NWJ7Dplwegx
         DCTG4KgXf3A3Zzn/MjbPo10E40m5QkoedA7aw6vAvyeLQDk7UyNagjMlS6kMKcbAu13t
         gm502vpr1NaH0sH2Lv/lEyrHbspxOVe0hhD+S/k6TJ81qkD7bbRSIy/atPyVgETGdyAi
         YUKA==
X-Forwarded-Encrypted: i=1; AKwUvByT5/0wLzlPDP19o/QSBrHKZj8Tg4guBNooBa4EZJIy93D1BZ8tgIW1/fhptswOkwWYjwQK6zYjG60lAxXHJ+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdkDMl9Utecrk6lwyEx1Z12kS6GnLJGxaBzndnA1Ot5U/9kpKC
	sqqSyXCCojtfCrh6QWKLS/ehy79xOYRXbxSXa4bsUd+H5rK5Qv1Tr1zN
X-Gm-Gg: AYBFou35wMR5XyiMQ7sVCQi/3MQ0iwEydFrp3MQD5iOMTrgjrjuClLpWlVw5Tsm31WQ
	eEtSUxBprx4chBLUGKtig8iQoE68+AqLg+qMpcvxubNpU3mRHeanrcCUzJgcriRqm12nTxoVV0N
	avRZF/lxt0hyXkJsFhIMKO1WdKwvepselqixY2eXmd7yi9RELs8YIq9pcqu1YkmIK/YgyfbD8m2
	y6fmkHkSs/QQnomNny9sPiXezoMMJ3DCV7eByvfrqgUGnNkzC+Hn//Xd3KnoWUxEF8kVeKb5M2v
	i7zLcoT1WWxNsUuYVkWRmfFRxT7YfEtRlIq/mD4huMTLZfoWaOYL8XGhMn+fSOXsS1qMcVtYFct
	3ecqQDHpVeXLESGX1fj6tOt+tE2zksrhfa780Aq3GjpEjV9IKqfGhElJUEoiD4aTpVBnZtreZJQ
	ifOMgIIcRouTg8jE9bbNfduU39xrLc5AftZTF1jnJ+BS6sNk2N3uwT9ufhJTTwWyLzUAOGF6f5L
	B20PVtyvz9HWye8UuCJVULQ2JF1
X-Received: by 2002:a17:90b:1dce:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3a6ce959345mr2938832a91.25.1790961071827;
        Fri, 02 Oct 2026 10:11:11 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:10:59 -0700 (PDT)
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
Subject: [PATCH RFC v2 11/15] Documentation/litmus-tests: add hazptr acquire-before-scan test
Date: Sat,  3 Oct 2026 01:08:43 +0800
Message-ID: <20261002170847.3653663-12-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002170847.3653663-1-kunwu.chan@gmail.com>
References: <20261002170847.3653663-1-kunwu.chan@gmail.com>
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

