Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9B13955D3
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 21:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786655802; cv=none; b=czIAxwv6iZHGgApG0wM/x5YKpPwh53LEcEtwOjEuUrdHmyBrWlMVWKfJDb9SQrWNWSoealBQ10pi4a0Wo+2/PQy6JnYPCZ9KRrAgAA0/KKyCkn6Csrj9CRctClnKa7E3SnryA/aw5qMM0OuBjv0yLBV6eeTQIM9L1DNnbAX21Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786655802; c=relaxed/simple;
	bh=sAusXOdwVtn6WF9NS8nJSIu1JOY/31ExSEj2AGQ5TPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETeYBg0Qmwovui1gtgJP5QpHYBKf5OoDgfEKWHQHhDK9gyOpCzbIv3WOZDj9huj/JYgs+EzbcW1RgcpsxHbwy1lPVyCYILf1ZllTh6MMc+U+qPu7SInFuZe7edexJMFaPYTXlWE/HXX/EMBvEJoi98ujRmTTSu2DKRCQNH5mKag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNVXmvHB; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNVXmvHB"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so443846a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 14:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786655795; x=1787260595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPxZbADhGWNayp+pc6kSWXesxZmSrTwPZr9c/8FZz0Y=;
        b=dNVXmvHB2zMB6zNV/+Xx4F9O48yXwH1CWjVd0ObJ99iA9O7F+vxQyEDUQtVURRNiwJ
         y83k7SPLRpX13O7PZjR2Srp8hs0W+n9Shbe4oK3KXpFTlHcsNK5I4+N9eCS17GE5mKEg
         KDRZNPu2r2Y9VnbGPgq0JnnIXdwB9wt+hxsl4uhcgHQeScXM2tb5AtX7TTALNEy5FRvV
         zkwfNXqwVhJd41RwDHmLS3cIyYCIzzzPy16n+yK3ZRun10i+FqiwZw3sPfV4EZaXu2hh
         AtSMTsFuj83VGG0fqXdedGd0vsCNKCYNoX12QBB6Tu4SgBWpxywUnsMfKdYykA08fsUb
         X/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786655795; x=1787260595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iPxZbADhGWNayp+pc6kSWXesxZmSrTwPZr9c/8FZz0Y=;
        b=ZHJ79Ow1NYiRLlckR9SA3MUfEF8pwhybPPiNlv2cOwtDctAjZsDH0CTkFm3wo4Py9Q
         rJsYQEUzEXQIFDmJoRGzvaHKsuXKNrrFqSPezz3RUN66XlkOZvS1yDFjLWp4l1tcUQ69
         zsDxboF3VOBxuga3T6eiKxF32JpygQbQUf6qQqpISeOhAXKIIT7MzTDtOsL7c6yPBI3C
         AepznwYaFHCIYV0qx9JNB1oO2ksAGU9+vDtMUgMwSIk/khrTEbvB7mEV+vri17aHkxrF
         Y/AGMKi86Z9FSTFtWBi8VrtOQ3yPm1ZNpD1Fa19RMvLVLM9M5e8J+OLuibeuZKg7EoaO
         aF3Q==
X-Forwarded-Encrypted: i=1; AHgh+RoaUfKHHbdbo9GfOSwF7YVimROixJtLgohrBIwfHpOTBVy3nZ+WtT1Av+10pE80QCuAKMMgrolAE1he6Lyn0HY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ciX0DzuwUGmwKJWYkE5fl09bbc9rxed0ltCSK2DgJUw88M5/
	8ZsJ4TMQqxfwNL7fAtC8OKNBRJGlQcz4vQeKOtS8FZmH5SqBmqViS7fp
X-Gm-Gg: AR+sD135cvLDgKt0+R4leNNWiG4vsgrV2N9d1xqBKVkHw+oE0fKstDhH3vkYbpG7jjN
	N8SZ6FDtVhmcAQxZ3LAA8fBnT2AAfczlj9KiOTDPwxcuPjAOBSloURDNJJmDqjEl+3NFY8yIQZZ
	MEC7108vk6l5O2Ws8BqJrazBQNNJnGnOmAwdw0h8tI+YZITCcDZghASyjrbBj6wt/4tq6dMkUOw
	InYfeIfjvzuPQrtZS7r4Ttslzd0rGBJgB5c6A8uQibHZ+ZxfW71u0Wsqnl+YmLZCOkwLF20bRsq
	RfG7WnuBJ5Dga2eymPV9YZn2zfkIqdKlezgscFW9Afne1U2ZsGg+RK2ZOmOnqFm6XDaJwOD0szz
	k8iAJy/yIL5HnGxna2HAyhi7OI0K/t/8eGGDM95ofJ4moRMk2sifyzpLEMhVksjI7XkS6PNl4/L
	GN+1L4pVPSHv7PKHMqr1kdK9Snhqh8M5zjIw/OAy3EJxbt7/WexymPU3Wq6QAOFFAvt896NyuFf
	aH72om5Mr9AD5NI
X-Received: by 2002:a17:90b:3d8b:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-3933b77ece8mr1072781a91.1.1786655794693;
        Thu, 13 Aug 2026 14:16:34 -0700 (PDT)
Received: from patterson.cs.ubc.ca (patterson.cs.ubc.ca. [198.162.52.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933a03e288sm853985a91.17.2026.08.13.14.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 14:16:34 -0700 (PDT)
From: Ning Ding <dingning04@gmail.com>
To: bpf@vger.kernel.org
Cc: memxor@gmail.com,
	greg@kroah.com,
	dingning04@gmail.com,
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
	Justin Suess <utilityemal77@gmail.com>,
	Kaitao Cheng <chengkaitao@kylinos.cn>,
	Viktor Malik <vmalik@redhat.com>,
	Leon Hwang <leon.hwang@linux.dev>,
	Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v4 2/4] selftests/bpf: Test refcount_acquire return nullability
Date: Thu, 13 Aug 2026 14:15:24 -0700
Message-ID: <20260813211533.290256-3-dingning04@gmail.com>
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

The verifier could accept an unchecked bpf_refcount_acquire() result for a
borrowed RCU-loaded map kptr. If the call returns NULL, passing the result
to bpf_obj_drop() can crash the kernel.

Add tests showing that an owned input remains non-NULL, a checked borrowed
result is accepted, and an unchecked borrowed result is rejected.

Assisted-by: Codex:gpt-5.5
Assisted-by: ChatGPT:GPT-5.6-Thinking
Signed-off-by: Ning Ding <dingning04@gmail.com>
---
 .../selftests/bpf/progs/refcounted_kptr.c     | 61 +++++++++++++++++++
 .../bpf/progs/refcounted_kptr_fail.c          | 47 ++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/refcounted_kptr.c b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
index 61906f48025c..fd35093285c0 100644
--- a/tools/testing/selftests/bpf/progs/refcounted_kptr.c
+++ b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
@@ -23,6 +23,15 @@ struct map_value {
 	struct node_data __kptr *node;
 };
 
+struct node_refcount_only {
+	long key;
+	struct bpf_refcount refcount;
+};
+
+struct map_value_refcount_only {
+	struct node_refcount_only __kptr *node;
+};
+
 struct {
 	__uint(type, BPF_MAP_TYPE_ARRAY);
 	__type(key, int);
@@ -30,6 +39,13 @@ struct {
 	__uint(max_entries, 2);
 } stashed_nodes SEC(".maps");
 
+struct {
+	__uint(type, BPF_MAP_TYPE_ARRAY);
+	__type(key, int);
+	__type(value, struct map_value_refcount_only);
+	__uint(max_entries, 1);
+} stashed_refcount_only SEC(".maps");
+
 struct node_acquire {
 	long key;
 	long data;
@@ -832,6 +848,51 @@ long rbtree_refcounted_node_ref_escapes_owning_input(void *ctx)
 	return 0;
 }
 
+SEC("tc")
+__success
+long refcount_acquire_owning_input_no_null_check(void *ctx)
+{
+	struct node_refcount_only *n, *m;
+
+	n = bpf_obj_new(typeof(*n));
+	if (!n)
+		return 1;
+
+	m = bpf_refcount_acquire(n);
+	bpf_obj_drop(m);
+	bpf_obj_drop(n);
+
+	return 0;
+}
+
+SEC("tc")
+__success
+long refcount_acquire_rcu_map_kptr_null_checked(void *ctx)
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
+	m = bpf_refcount_acquire(n);
+	bpf_rcu_read_unlock();
+
+	if (!m)
+		return 3;
+	bpf_obj_drop(m);
+
+	return 0;
+}
+
 static long __stash_map_empty_xchg(struct node_data *n, int idx)
 {
 	struct map_value *mapval = bpf_map_lookup_elem(&stashed_nodes, &idx);
diff --git a/tools/testing/selftests/bpf/progs/refcounted_kptr_fail.c b/tools/testing/selftests/bpf/progs/refcounted_kptr_fail.c
index 024ef2aae200..acd3e81a3916 100644
--- a/tools/testing/selftests/bpf/progs/refcounted_kptr_fail.c
+++ b/tools/testing/selftests/bpf/progs/refcounted_kptr_fail.c
@@ -19,6 +19,15 @@ struct node_refcounted {
 	struct bpf_refcount refcount;
 };
 
+struct node_refcount_only {
+	long key;
+	struct bpf_refcount refcount;
+};
+
+struct map_value_refcount_only {
+	struct node_refcount_only __kptr *node;
+};
+
 extern void bpf_rcu_read_lock(void) __ksym;
 extern void bpf_rcu_read_unlock(void) __ksym;
 
@@ -28,6 +37,13 @@ private(A) struct bpf_rb_root groot __contains(node_acquire, node);
 private(B) struct bpf_spin_lock lock;
 private(B) struct bpf_list_head head __contains(node_refcounted, list);
 
+struct {
+	__uint(type, BPF_MAP_TYPE_ARRAY);
+	__type(key, int);
+	__type(value, struct map_value_refcount_only);
+	__uint(max_entries, 1);
+} stashed_refcount_only SEC(".maps");
+
 static bool less(struct bpf_rb_node *a, const struct bpf_rb_node *b)
 {
 	struct node_acquire *node_a;
@@ -80,6 +96,37 @@ long refcount_acquire_maybe_null(void *ctx)
 	return 0;
 }
 
+SEC("?tc")
+__failure __msg("Possibly NULL pointer passed to trusted R1")
+long refcount_acquire_rcu_map_kptr_unchecked_drop(void *ctx)
+{
+	struct map_value_refcount_only *mapval;
+	struct node_refcount_only *tmp, *n, *m;
+	int idx = 0;
+
+	tmp = bpf_obj_new(typeof(*tmp));
+	if (!tmp)
+		return 3;
+	bpf_obj_drop(tmp);
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
+	m = bpf_refcount_acquire(n);
+	bpf_rcu_read_unlock();
+
+	bpf_obj_drop(m);
+
+	return 0;
+}
+
 SEC("?tc")
 __failure __msg("Unreleased reference id=3 alloc_insn={{[0-9]+}}")
 long rbtree_refcounted_node_ref_escapes_owning_input(void *ctx)
-- 
2.43.0

