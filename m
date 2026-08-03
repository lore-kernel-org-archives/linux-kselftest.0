Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3783B4EB3
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756347; cv=none; b=PgQPOSGSod6321pP7kMpIRdmuBN91CpSnQPvAlbPJdRyCSfPJLF7WXE78PoIuxR5petY/VCYZ3xD7NxkfUsIu5ZEegIFw3qqN1hCjz96INSnmiVUj12wcToejXaH2llDVfnuIHmkYpLDlMEP2h0XARd2buTfW6sseEuQ7ZqPDJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756347; c=relaxed/simple;
	bh=DX2T1t5+wkhjkNMPP9O3hcoBYmJLEcLYhP/ce7kvHxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZnqY4UDmMtw2WXXdYN7GRr3CpRTBw1NviHVkxCULFeN2yTs9CkIQX8hCeuPINE+FcQeiFq5FQgR3njHmM57LsdS42+YsRgI1jGsOQCTT1TiKRf1cHcQLkxYeVfWNroh5lZHgQRaxRcKqZMtUWktmWMb6O6PXUHa/HF1/a+DU4LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJawwLb6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJawwLb6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ce98cb8165so33463665ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 04:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785756345; x=1786361145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GA10tWMw7G+suJhvgrYzC8iyWhRvHbTnt0EFzl+EgR0=;
        b=RJawwLb6e7YTLm/aOWEsMKc9Yezb68C2KZkYyU4VNPmXvptH4+G5bhkyWWGO02BLTU
         OGRmr+F4v6OqjGcGeW3NEBr1Tzod3NKGftCLPtVEfJFGLZcvKF/EsHnuNdIyLaKvOrP5
         cSzQRij2GOnlXs5lOeN3rrm952UQaU6XhgczM4AYkmshbyEJKnWFGdIRX7W0rsZTk3a4
         iHUtrJKBi8IG/IEnFkz5+uNtQL9D8lBRYQeEEopnVzqcOh1pqohdzRUU48NUr7q5Fpqj
         ob2tCFQwMBYylqVYbXKikatSoeRg4Uspzh+A+G2qFMZvegZzz0lDLGxDzzdmtX45a1QC
         ciCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756345; x=1786361145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GA10tWMw7G+suJhvgrYzC8iyWhRvHbTnt0EFzl+EgR0=;
        b=NzUHtxsmjjhxwL5isiHwOimwSy1TrRmM+gLSDa4UBbHvKxRCpJhRztofFxJynfAeJd
         e+SUyyQYAdKY3s62vdUIF8+mkY1e65WwgnN+1OgkzKsDjOQqlCnVf5MEqCt8iUAwYOR3
         hvcxnDt5Q32mAT03gy7u+sB2/txK2JhQ/t9LjnyjMutPYVRxRx+ls2O8M65Pkyyzw1SA
         z+VnW9mqz+q4BCFdixjL6vAHkeE8zQeSUFAC+JI3FGTL0JZypVcq489/C2kOhk+yP6YF
         jxKOjTeCsKNYkpK+eqdkww0GS/pWGYWycUzX4iNhIt3TYmQzpg9wVrLPgvXFTWhUu9CF
         +5HQ==
X-Forwarded-Encrypted: i=1; AHgh+RozIq2u4azTVC0Chi29ycWPeTSQHm98jnJJl3gUd6b+XpNI6vcKyxaOONHtyHQxvLCkVk33atBLEQk4TaXWzdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiKqhjTGcpKpGruopId2hkYk5MinB8l0Yzem9YBU9DtE0VLKaX
	T1O+uP3ftAJkOj8K31pQ6Rir8nIkKRlrHeAHZB2sF/qp7ocXQDLU/abt
X-Gm-Gg: AR+sD10Qg6rCTwNkvO5Z/B1nI8Sy3wxiWvOn7brTJERdYcG2SqZDJZBOs8dBGhnOzUh
	ErvSzidruPgwvqkaYBTjKfYEZSYFo0Z+WBXAUnaScLNiwt9U5aI3fCtHT4bWyNDHOgqMR5DqGVz
	i/jIiHnApAEgKuO4nRNykGbfSQjQZ5CL1fMuhPQkCcL0mLyodhvnvPXWqNL+1nRJabJODXq2TnB
	gGRKxZvoKcQqysbCzpuTXhPB+d8V8+XRvpDKJH77IlMYoGXg6tc2GCEO/Xnr7BsNdynpAcZ9rdg
	466kMnX2EjqzWdO/OMeivy7JupYlZFIy5DnW8iGUG2ewEFXgzYlbxyBDZ1cL4xkG+NMH7SrVIfO
	rkfv+jKB07pL1e0rLVT8Mk/qQbP0nj8ECF2CAz4wOagLWzk/qr2/NsD7YP9Q8YS4Z9EHdGRWw4q
	VUye79d/0jB/Z8ghlCVjdOenGv0euDYKy6/swCCxK2Xefq0g9mxdI40qzs04G0HDoE3x6vlyIq7
	WAyjlc89DUypMlq7w==
X-Received: by 2002:a17:903:1786:b0:2cf:70d2:da7c with SMTP id d9443c01a7336-2d047d7921fmr108519205ad.12.1785756345462;
        Mon, 03 Aug 2026 04:25:45 -0700 (PDT)
Received: from patterson.cs.ubc.ca (patterson.cs.ubc.ca. [198.162.52.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5a91asm36190685ad.21.2026.08.03.04.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:25:45 -0700 (PDT)
From: Ning Ding <dingning04@gmail.com>
To: bpf@vger.kernel.org
Cc: memxor@gmail.com,
	greg@kroah.com,
	Ning Ding <dingning04@gmail.com>,
	sashiko-bot@kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	Viktor Malik <vmalik@redhat.com>,
	Justin Suess <utilityemal77@gmail.com>,
	Kaitao Cheng <chengkaitao@kylinos.cn>,
	Leon Hwang <leon.hwang@linux.dev>,
	Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf v3 4/4] selftests/bpf: Test untrusted allocated-object pointers
Date: Mon,  3 Aug 2026 04:22:11 -0700
Message-ID: <20260803112218.3361213-5-dingning04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803112218.3361213-1-dingning04@gmail.com>
References: <20260803112218.3361213-1-dingning04@gmail.com>
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
index fd35093285c0d..b70be8b52ff80 100644
--- a/tools/testing/selftests/bpf/progs/refcounted_kptr.c
+++ b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
@@ -893,6 +893,106 @@ long refcount_acquire_rcu_map_kptr_null_checked(void *ctx)
 	return 0;
 }
 
+SEC("?tc")
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
+SEC("?tc")
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
+SEC("?tc")
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
+SEC("?tc")
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
index acd3e81a39168..3408f68ad444d 100644
--- a/tools/testing/selftests/bpf/progs/refcounted_kptr_fail.c
+++ b/tools/testing/selftests/bpf/progs/refcounted_kptr_fail.c
@@ -127,6 +127,33 @@ long refcount_acquire_rcu_map_kptr_unchecked_drop(void *ctx)
 	return 0;
 }
 
+SEC("?tc")
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

