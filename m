Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D2840F72C
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 21:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786655816; cv=none; b=OyAtxfSIaTNz2t21kugbCsAIuSGB19ipiiQSkA4o5kS9MRhp+0PBWmQaicdoC40kyiouW16uVtEHbtuOpZkdJsIrsuq2BV+/aBCgbi8rV9a7V+LvxJb9e/sqqyWSZ5hPlRNy6N2SnmTWAQT863z6l7N6yN2/6+pOCPEsN54g4p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786655816; c=relaxed/simple;
	bh=7l0xVe2LyVfkGorEBGaNMxELLWKDVGFFXB1DJ5Ano04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O7EFfqSxLxZLukg2McgsJ+wmAf+r2uJjnDBPJVBMK/Q5uxMNKJMpgBH/PfDdbpBIUs9kGvHTSD4o3crH0Z82Jb5rjachOBSCAcF3zv2U0oUDpcrko7+n6LmwvyYRe7sSOANEtd7CUxvIzeGiI5Cne68snAM/lld2h905NTgP0sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZ0Gfbs+; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZ0Gfbs+"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so414228a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 14:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786655807; x=1787260607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b35On+LZmzrHtmSn5bQB+gzqg4iokp+EtUtdHB8ERVI=;
        b=lZ0Gfbs+VyMopqbFHQm6349hOuQtkCC3yGUpMrcJORx0SpfLTDjA88A6XL55pOlpMs
         ZY+vfHEVHhDc/rS6C5KM4BOp1MCfTTc8VdeyTti8yVwi+O9PP4StUDcLYtxcOJL5tdR1
         PmWZZzOFF+Vu5Weq/xsiyXw7aG11oeQGhHL1rGsltaRi2I+vVxbes+YRgsh9PQgfRD6T
         Lg3bsyqOPZJtTxgu5QF/qtbqzaJxPfGzN+yN6gvbyHBkGo6xdsY+43IN0rLo8P5QoPu0
         dPC9bNO2MCrtKBFEI6BbpOOO0AnZgVBpXPHRDmR9Cn3Oud1ckOVHfc8qMkoGaWwUg3oE
         0EFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786655807; x=1787260607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b35On+LZmzrHtmSn5bQB+gzqg4iokp+EtUtdHB8ERVI=;
        b=HIMXDLNTkDhp2M1cAmCo0c39ayMZXlh01+ODlNRbCJZPX8ILi3jionH7SJovVDztxe
         Y4Z12JzMk/FOlqC8yvaOu5sD0m553WR4ulOrQAKQCc6PDloHBkLwBQzcHM4hDnrQCNEv
         SwQHPmUNnSw30d/3spek7+RBPwiht5R3dzwGjyUSb3V7zgquJikMBSzZVrCvYZ6A2lTu
         Wo6Y6s4bwhHHjSErd3G+KJFW5y8KWD7RmpySLXJIjXrfS8mNF6cBPaXE6oVZoP8Sh4Kz
         pENCS4uyD026mMIyb630RFojhXStF979z1KZNXcbEgeWJ/nLVvuZ9HK/kngJTE/Nfi0j
         hShA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8YVBb09i0qYp61U8H9TxrbrL+82rpDOstkIZV8aA5UNu6IFgItAaS5YONdnYozn9s7DyUDwq7pqd+U2VSYD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOxH0KkdhWbQcPhB4Y0N3cDFLPtpF4o3wGCv1frELPeHLYDWgy
	VLno3SDCyZS9/Li6syKOaHjYepPrIqFAcx7aPnfHBDeSkb7T19ti4moO
X-Gm-Gg: AR+sD12xv9Y5pKmosva7bSbYn9HzvvVNqm5lZppmmxImJWqz4lhjWdkzG3PckDPQUgp
	P8u3KVH/whaNyuvfaSpI2g63r/unkR3J6MxDbCho5298cRQEIS3KKelxmnds3EFRjDuwZEHWWDE
	AQb7W+3Nk5Z+OjCk+aOO1mvFwEUrB88W4LBdy3gF9eRHHu0IVBoBvYVXiVm3jmVGt/wntsmPXPR
	b0Pn4TwUJFdilr/y2BG26WxM6LqEvjJkbqx572UNL5MEoomk7JhC/8i4ED+PgJfaPPvjxVCa9hG
	9pUHwwQnS4K0BSrdQeskugymz+gHa4Hi6pk/C2SpkZ2gkvxfohdsco7YzsMUuto2pzZQTy+R7Si
	vSE4LefPURHliPegKOq0KxdDJuHUSngNOT4CIFBmeW2m5xb5Bg0XPQmFfw9lRMh/WYL1OG8fF2B
	fwuYzCCuypFGSnVyzSBv2C/pljak+INZ+sA718UzZ5sWEEU5KZWBsB/8oyG9fKHozhiFbciJcvd
	+2YQGzFUjAyEUIP
X-Received: by 2002:a17:90b:5807:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-3933b958ad5mr945995a91.14.1786655806903;
        Thu, 13 Aug 2026 14:16:46 -0700 (PDT)
Received: from patterson.cs.ubc.ca (patterson.cs.ubc.ca. [198.162.52.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933a03e288sm853985a91.17.2026.08.13.14.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 14:16:46 -0700 (PDT)
From: Ning Ding <dingning04@gmail.com>
To: bpf@vger.kernel.org
Cc: memxor@gmail.com,
	greg@kroah.com,
	dingning04@gmail.com,
	sashiko-bot@kernel.org,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	Kaitao Cheng <chengkaitao@kylinos.cn>,
	Viktor Malik <vmalik@redhat.com>,
	Justin Suess <utilityemal77@gmail.com>,
	Leon Hwang <leon.hwang@linux.dev>,
	Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v4 4/4] selftests/bpf: Test untrusted allocated-object pointers
Date: Thu, 13 Aug 2026 14:15:26 -0700
Message-ID: <20260813211533.290256-5-dingning04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813211533.290256-1-dingning04@gmail.com>
References: <20260813211533.290256-1-dingning04@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The verifier previously allowed pointers used after RCU protection ended
to reach bpf_refcount_acquire() and, for one object layout, a direct write.
If the object was freed and reused, these operations could access stale
memory.

Add tests that keep BPF_PROBE_MEM reads accepted but reject reference
acquisition and direct writes after RCU protection ends. Cover both tested
object layouts.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/r/20260726021304.97ED91F000E9@smtp.kernel.org
Assisted-by: Codex:gpt-5
Signed-off-by: Ning Ding <dingning04@gmail.com>
---
 .../selftests/bpf/progs/refcounted_kptr.c     | 100 ++++++++++++++++++
 .../bpf/progs/refcounted_kptr_fail.c          |  27 +++++
 2 files changed, 127 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/refcounted_kptr.c b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
index fd35093285c0..383c5b1b7111 100644
--- a/tools/testing/selftests/bpf/progs/refcounted_kptr.c
+++ b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
@@ -893,6 +893,106 @@ long refcount_acquire_rcu_map_kptr_null_checked(void *ctx)
 	return 0;
 }
 
+SEC("?syscall")
+__success
+long map_kptr_read_after_rcu_unlock(void *ctx)
+{
+	struct map_value_refcount_only *mapval;
+	struct node_refcount_only *n;
+	int idx = 0;
+
+	mapval = bpf_map_lookup_elem(&stashed_refcount_only, &idx);
+	if (!mapval)
+		return 0;
+
+	bpf_rcu_read_lock();
+	n = mapval->node;
+	if (!n) {
+		bpf_rcu_read_unlock();
+		return 0;
+	}
+	bpf_rcu_read_unlock();
+
+	return n->key;
+}
+
+SEC("?syscall")
+__failure __msg("is neither owning or non-owning ref")
+long refcount_acquire_graph_after_rcu_unlock(void *ctx)
+{
+	struct map_value *mapval;
+	struct node_data *n, *m;
+	int idx = 0;
+
+	mapval = bpf_map_lookup_elem(&stashed_nodes, &idx);
+	if (!mapval)
+		return 0;
+
+	bpf_rcu_read_lock();
+	n = mapval->node;
+	if (!n) {
+		bpf_rcu_read_unlock();
+		return 0;
+	}
+	bpf_rcu_read_unlock();
+
+	m = bpf_refcount_acquire(n);
+	if (m)
+		bpf_obj_drop(m);
+
+	return 0;
+}
+
+SEC("?syscall")
+__failure __msg("only read is supported")
+long graph_map_kptr_write_after_rcu_unlock(void *ctx)
+{
+	struct map_value *mapval;
+	struct node_data *n;
+	int idx = 0;
+
+	mapval = bpf_map_lookup_elem(&stashed_nodes, &idx);
+	if (!mapval)
+		return 1;
+
+	bpf_rcu_read_lock();
+	n = mapval->node;
+	if (!n) {
+		bpf_rcu_read_unlock();
+		return 2;
+	}
+	bpf_rcu_read_unlock();
+
+	n->key = 1;
+	return 0;
+}
+
+SEC("?syscall")
+__success
+long graph_map_kptr_read_after_spin_unlock(void *ctx)
+{
+	struct map_value *mapval;
+	struct node_data *n;
+	int idx = 0;
+
+	mapval = bpf_map_lookup_elem(&stashed_nodes, &idx);
+	if (!mapval)
+		return 0;
+
+	bpf_rcu_read_lock();
+	n = mapval->node;
+	if (!n) {
+		bpf_rcu_read_unlock();
+		return 0;
+	}
+	bpf_rcu_read_unlock();
+
+	bpf_spin_lock(&lock);
+	bpf_spin_unlock(&lock);
+
+	return n->key;
+}
+
 static long __stash_map_empty_xchg(struct node_data *n, int idx)
 {
 	struct map_value *mapval = bpf_map_lookup_elem(&stashed_nodes, &idx);
diff --git a/tools/testing/selftests/bpf/progs/refcounted_kptr_fail.c b/tools/testing/selftests/bpf/progs/refcounted_kptr_fail.c
index acd3e81a3916..0cc4cbd0c81b 100644
--- a/tools/testing/selftests/bpf/progs/refcounted_kptr_fail.c
+++ b/tools/testing/selftests/bpf/progs/refcounted_kptr_fail.c
@@ -127,6 +127,33 @@ long refcount_acquire_rcu_map_kptr_unchecked_drop(void *ctx)
 	return 0;
 }
 
+SEC("?syscall")
+__failure __msg("is neither owning or non-owning ref")
+long refcount_acquire_after_rcu_unlock(void *ctx)
+{
+	struct map_value_refcount_only *mapval;
+	struct node_refcount_only *n, *m;
+	int idx = 0;
+
+	mapval = bpf_map_lookup_elem(&stashed_refcount_only, &idx);
+	if (!mapval)
+		return 1;
+
+	bpf_rcu_read_lock();
+	n = mapval->node;
+	if (!n) {
+		bpf_rcu_read_unlock();
+		return 2;
+	}
+	bpf_rcu_read_unlock();
+
+	m = bpf_refcount_acquire(n);
+	if (m)
+		bpf_obj_drop(m);
+
+	return 0;
+}
+
 SEC("?tc")
 __failure __msg("Unreleased reference id=3 alloc_insn={{[0-9]+}}")
 long rbtree_refcounted_node_ref_escapes_owning_input(void *ctx)
-- 
2.43.0

