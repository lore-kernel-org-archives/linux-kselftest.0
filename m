Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377F41B142D
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 00:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122114; cv=none; b=FcmCYNvbhkl8lm6RKm1RDiiMWz3mQAmx1xqMNbi1S1e/qc6W8F9ALSOqSlZnKhvY8e5FBdC+kAmekvNkdnECGdWO7RdW08XY6UiBV3TPz0h2vtUo3TeM1sAkVQbKIdWNMh+0//hdL05/xx7MZ3rkPPfamLvyh0JoFQHp6YurncU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122114; c=relaxed/simple;
	bh=FXOqWk6+ZyNZc5l454FhAHeymScBoMRKHlFW2SXO0lM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bt4SgTrWmFjRYMKB2N/ME0Gtcz/mqN2OIGWCNb0lijP26Aub3o8x5ixAqSdDUEV32sJ4xBkVoe/FO6U+y4cBWn7KtKqQKnlfKRTIhD+pftrzZ0vww7eUQvDwbZj7lz/hsgUd+1hvBPiJsRpFjs9lTPldrHA0UNcrp8DuT+vPjhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRpn16fm; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRpn16fm"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0135fso2655825ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 17:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790122112; x=1790726912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXRneLdpupGQ5UzSvLNCbz2mrO1OCHoDsNMUHQpwnQo=;
        b=dRpn16fmMpDckJeus7/oLEVwBHFjjTw+OfRGdIJkQSyZIhleUSrAPIZNF/7yNMgjbV
         7jTBInoF/CM6tJrOSJlB2zMcX3N0H3/yYlztuStnMWgRMUQwsI66tomy3KEac4mP0JwJ
         62R4EaqMrj3Vz8B66FlkgOjEmOaEwy1LQ3vH0CJJiNv1v6iAM9oSKoDwyAgUBVUUuF06
         1yw8M7xIETs2lHj68wQUFhtPaZWFwdVSJ6yscWNqIR9euLOoDfe3VGuOYRLcZxiciw26
         QWVDriEjtDqsi+uVsOAwUpowiI5ASaYNq1BEfpmBRrjvPV7/L5m6crTRKYEkftPq9AC7
         ReFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122112; x=1790726912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jXRneLdpupGQ5UzSvLNCbz2mrO1OCHoDsNMUHQpwnQo=;
        b=DiZM67nrxXtI5s1BbPQiPbXHXKcRtwKLO/fNOuTP2rXXU5t7m7GG3dKP+bp2mgGuD2
         e/bheU09/ajSiyrFPXwLwpPnnOO6MDwCfo5PRsKC0/kGK7SPnEF4QWnrdJfXezkGQ/z8
         pwXjqkW4/7JB2yZHIVs6fV846Cc3yGmkA/Q0LZA0Y1MnYtqjZedOcz0UgE3qhgNfbmzy
         wv6ktLR6GFpM7A6KPIUWkQCu7LRlQp4BMuYJowj2VN9tNgOvlSQ4fMb8GKCWsZojX748
         1kY0+HzJTIbEtFZNWwR6GyRL/QWhP4UQ/qRIs0chtls7d8IisQFR/bICdbHAbM3HqIbu
         8M7A==
X-Forwarded-Encrypted: i=1; AKwUvByPAEo2sO/Ci41+qdakixeohRifKeW4720lssjA0CkYg1z2nILdLDvT1ts4Tg0b9YMMk9sNyQ5AjD+eg6GvY/A=@vger.kernel.org
X-Gm-Message-State: AFuF++lMgevDucdeZpMQBzVNSplNyCelEWsSvYEOuQ448U8DqTgxIn28
	LrjYxm+N/X82cb3sojGLp+4rlc47tpuoBUJ6439RRyyUFDqhY9z367o=
X-Gm-Gg: AYBFou2CUro86IpUK3GouwV+qSEHdDz7ixKqSgWRhn0p0GOr8vIfCUYuaEEXXncGRrZ
	ERcwum4VEttT76d2ePsxgMMob1jPH+K/hvDoVhzydERVBXZ/V7g/5aCyEOY02DIJ8Y38iaFFF8E
	YgLmuomJX2bIKVnq4Ybb21bpaar9O2CX7n6qt8RWMDjZrPra7aDe0u72hj77tDObiY49exlwFJ6
	XWiLBMQ9HqlzvTqlAA/MslALeTPI6wGFGwlBFQ42/Gje0e+dNFT5+cR9irbDFD81eJ127+wJJgH
	3KhfZAQBRc9lgs21eFpWNh0wcMqG8Baq6gFYsBuypOOH+dO0gopI24oQ7V7bsLbO/DIk1c6p7kS
	Avea9aQgd8OiSUxa8FsnVYE7q/rjp8LQ0wo084TZ/z005vOr4RzJxxb/oY2Z8BYSYmaHN34wl6k
	1eMn47Ub/kMYJYsNxbYIyQimLA5fOIhoIU26UfurGMq+Tj0ixZVBQ+Qn1nFnmLTfs5UtKVPpgEq
	YGvBO5Cs1EU8li2UPmdl7wiJD5sr8TbbVxehVzy60tlfaoV
X-Received: by 2002:a17:902:d484:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2df69d517bdmr9833245ad.14.1790122112335;
        Tue, 22 Sep 2026 17:08:32 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:2466:805a:e198:cde8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3a3dsm2021425ad.43.2026.09.22.17.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:08:31 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	leon.hwang@linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH bpf v2 2/2] selftests/bpf: Test per-cpu initialization of a BPF_F_CPU created element
Date: Wed, 23 Sep 2026 09:08:01 +0900
Message-ID: <20260923000801.1764758-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923000801.1764758-1-donggeunyoo.kernel@gmail.com>
References: <20260923000801.1764758-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing cpu_flag subtests always prime a key with BPF_F_ALL_CPUS
before any BPF_F_CPU write, so the create path is never covered.

Add a subtest that creates the element with BPF_F_CPU on a map with
max_entries 1, so the key can only reuse the element the previous key
released, and check that the CPUs the update did not name read back
zero.  Run it for PERCPU_HASH preallocated and BPF_F_NO_PREALLOC,
whose per-cpu areas come from different allocators, and for
LRU_PERCPU_HASH.

Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
v2: skip on a uniprocessor machine instead of failing; the block
comment uses the general kernel style.

 .../selftests/bpf/prog_tests/percpu_alloc.c   | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/percpu_alloc.c b/tools/testing/selftests/bpf/prog_tests/percpu_alloc.c
index a72ae0b29f6e9..f853f97bb882d 100644
--- a/tools/testing/selftests/bpf/prog_tests/percpu_alloc.c
+++ b/tools/testing/selftests/bpf/prog_tests/percpu_alloc.c
@@ -350,6 +350,80 @@ static void test_lru_percpu_hash_cpu_flag(void)
 	test_percpu_map_cpu_flag(BPF_MAP_TYPE_LRU_PERCPU_HASH);
 }
 
+/*
+ * A BPF_F_CPU update that creates an element must zero the value on the other
+ * cpus, rather than leave them holding whatever the recycled element last
+ * contained. max_entries is 1 so the second key can only reuse the element
+ * the first one released.
+ */
+static void test_percpu_map_cpu_flag_create(enum bpf_map_type map_type, __u32 map_flags)
+{
+	LIBBPF_OPTS(bpf_map_create_opts, opts, .map_flags = map_flags);
+	const u32 stale = 0xDEADC0DE, fresh = 0xC0FFEE;
+	int nr_cpus, cpu, map_fd, err, key;
+	u32 value;
+	u64 flags;
+
+	nr_cpus = libbpf_num_possible_cpus();
+	if (!ASSERT_GT(nr_cpus, 0, "libbpf_num_possible_cpus"))
+		return;
+
+	if (nr_cpus < 2) {
+		test__skip();
+		return;
+	}
+
+	map_fd = bpf_map_create(map_type, "cpu_flag_create", sizeof(key), sizeof(value), 1, &opts);
+	if (!ASSERT_GE(map_fd, 0, "bpf_map_create"))
+		return;
+
+	key = 1;
+	value = stale;
+	err = bpf_map_update_elem(map_fd, &key, &value, BPF_F_ALL_CPUS);
+	if (!ASSERT_OK(err, "bpf_map_update_elem all_cpus"))
+		goto out;
+
+	err = bpf_map_delete_elem(map_fd, &key);
+	if (!ASSERT_OK(err, "bpf_map_delete_elem"))
+		goto out;
+
+	key = 2;
+	value = fresh;
+	flags = BPF_F_CPU;
+	err = bpf_map_update_elem(map_fd, &key, &value, flags);
+	if (!ASSERT_OK(err, "bpf_map_update_elem specified cpu"))
+		goto out;
+
+	for (cpu = 0; cpu < nr_cpus; cpu++) {
+		value = 0;
+		flags = (u64)cpu << 32 | BPF_F_CPU;
+		err = bpf_map_lookup_elem_flags(map_fd, &key, &value, flags);
+		if (!ASSERT_OK(err, "bpf_map_lookup_elem_flags specified cpu"))
+			goto out;
+		if (!ASSERT_EQ(value, cpu ? 0 : fresh, "value on specified cpu"))
+			goto out;
+	}
+
+out:
+	close(map_fd);
+}
+
+static void test_percpu_hash_cpu_flag_create(void)
+{
+	test_percpu_map_cpu_flag_create(BPF_MAP_TYPE_PERCPU_HASH, 0);
+}
+
+static void test_percpu_hash_cpu_flag_create_malloc(void)
+{
+	test_percpu_map_cpu_flag_create(BPF_MAP_TYPE_PERCPU_HASH, BPF_F_NO_PREALLOC);
+}
+
+static void test_lru_percpu_hash_cpu_flag_create(void)
+{
+	/* lru without prealloc is -ENOTSUPP, so there is no malloc variant */
+	test_percpu_map_cpu_flag_create(BPF_MAP_TYPE_LRU_PERCPU_HASH, 0);
+}
+
 static void test_percpu_cgroup_storage_cpu_flag(void)
 {
 	struct percpu_alloc_array *skel = NULL;
@@ -454,6 +528,12 @@ void test_percpu_alloc(void)
 		test_percpu_hash_cpu_flag();
 	if (test__start_subtest("cpu_flag_lru_percpu_hash"))
 		test_lru_percpu_hash_cpu_flag();
+	if (test__start_subtest("cpu_flag_create_percpu_hash"))
+		test_percpu_hash_cpu_flag_create();
+	if (test__start_subtest("cpu_flag_create_percpu_hash_malloc"))
+		test_percpu_hash_cpu_flag_create_malloc();
+	if (test__start_subtest("cpu_flag_create_lru_percpu_hash"))
+		test_lru_percpu_hash_cpu_flag_create();
 	if (test__start_subtest("cpu_flag_percpu_cgroup_storage"))
 		test_percpu_cgroup_storage_cpu_flag();
 	if (test__start_subtest("cpu_flag_array"))
-- 
2.53.0

