Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DD43A16B2
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 02:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119567; cv=none; b=qzDGbvHh+9EViw5pORp95IezQ0h/m32csK7Afjod7inK35ou29U2gZizSGwbs6PJ/CRBxZvCx0cBxkWjKX/kX2g7UyamPrdTruSXZEIxrN5RIPADLbmM31Yz8k7tYUSOmE14UvMblrBudDCK/owmGaqp9vROTP3NUobOZQMJQnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119567; c=relaxed/simple;
	bh=g7kdzc5hvtrudWPq+5TfB02+rMhErWeMHNWfdpncx6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tvrM65xbgBsWbqoXsn9I7/gxxmN3np1w8xYb3F1nQ2G25PhG2Du0QxRFqn5qiHVxhhG7WiM+KEt9HJVeo7p6775Kc4DTMLjyS+Zo+astLZqq5qSkOPWjVcq1N9H6zxxytpM8+y96A/3PMSM44qH0FwbAJEQJ4TgrOBRwotRRJrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfnXvYwr; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfnXvYwr"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35943f55c06so734092eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 19:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792119565; x=1792724365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=msBkAWQzlQoQqAGoMJZykacdeNuYYmXdlWmpFGzS2Ao=;
        b=RfnXvYwrj/otsYbP0YcRIsUhEwECfYZ2apGUlRXJ1ZvNjwRV7QWa2NWvjjX0h/bE0n
         bmMhcMjLKmIqMiSNLxff9gVJgrCP9BuKz3tgeoxktkZUKH3GiQ9X1AogEFkpZHxOpvOa
         sotQql9pVIlQtD4zrBg0Q46Dcy01ErIBytcgjV3Lm5R+c3ustNiX4O5Dl5aWDDl41Ea0
         ls2Yqs1M/zMu6v4X9sN0PpDlEz6Mg8Agf3+7mcJxDuN4ZrMMzNgB2ZDWQebhfXSSXRAd
         X38dTw9INrg3WPwoKGIUy1n02gSYgQzkCW+t2O8Zi+KKFByQD3MMg4vw4X//vupAQC7n
         HHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792119565; x=1792724365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=msBkAWQzlQoQqAGoMJZykacdeNuYYmXdlWmpFGzS2Ao=;
        b=escT9wnwmRHrN1KFJjhyM2Oon4xfRsNQB2yQLp3VfKNuxyyVDoGAGSarX7we8BfFqi
         mfu2LrvcRCtF0bYI2bI7cBzWPENvbq1udjjnOB0fOkh581NsC4DslK3pyN/Tc7oZ7Bp6
         Hko5uIlvZw7tKKJ5p3FYNB+bP+FVR82m4IdjhEh7HEPVtVC2ja4NFGnlo08lhli2RZ73
         Tqna0fpx8VKoRa1cMcYqsyQahKku/G+ECmam/roVR52u78/rN9hGFB5zIabMtrdwXPTr
         2htkCzSKPJx7hxR6YXL823qiicsCd4VAuNe64e98pFEz0+t1DF8bVSBeXV9Jb2MI0vA/
         GFZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwph708sazk50UrzghVEsP9Oml/G70aZPt4IBkhZT7dykV9PEPv7EQug4WtvSiJv4PDofYJUqHzZPrk9tCfh4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPVrmmcG0t+g5SXOy6m5dSlbga6/pniPiTWiuwfiRTRSQGhITA
	/ipNpuBSbKdLk/9/9NUcwEj+g7alZLqFKv3SdPe9TijpSw0gFeBBmcI+
X-Gm-Gg: AYBFou1ygY9fUTZBcQPpH2owsd/TjeAmwjQH9L040329k6iIX5FJu4hiGEtLAsyqNzt
	9gIyySP4mj3UYsVCetA85rFkS1oQOOXVOFlQpDwugJ06abAin6WR67CNys03OGBLk33OCmdsYEP
	6neSoR144rxbHGykaWugTyaI9QdK9THRj52/VlesLaqt9pH9ZzwRfDpxhW7Mm7seOGLVPxxmYvJ
	gZv7OT7Ral3Y70AwGT2ftev+nl4s62mRKufDfDwo7SZUp9x8FCQJJzEFWNX9uz8uXZWwXvYn99n
	fCfGCM+l+mabLCW/JptZVsI0PZO7PS7Y3NNfbTtvUiMar5CXEFnCcUwkEJZeEyZOniUNgW/xWAs
	OsqRbxV0gcYtKIQ1u9MEmFOUedNGPvR537RzWqYJiRyu+u0r4Y0dkOWqAVSUZSs698RZcs2tOvH
	9kIRWLfc6Ym1aOFM81cAZKGSys5wLNZZhZFvGSP7i3+KnWGWEShUkoudUq3Ll9Bh+daw==
X-Received: by 2002:a05:693c:42d2:b0:34b:3f7d:6105 with SMTP id 5a478bee46e88-3602e3a6861mr2137401eec.14.1792119565274;
        Thu, 15 Oct 2026 19:59:25 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm2481261eec.3.2026.10.15.19.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:59:24 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 16 Oct 2026 10:59:07 +0800
Subject: [PATCH bpf-next v4 3/4] selftests/bpf: Test freeing a struct_ops
 map under a running prog
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-selftests-bpf-struct-ops-assoc-timer-v4-3-9ad31c21220c@gmail.com>
References: <20261016-selftests-bpf-struct-ops-assoc-timer-v4-0-9ad31c21220c@gmail.com>
In-Reply-To: <20261016-selftests-bpf-struct-ops-assoc-timer-v4-0-9ad31c21220c@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Amery Hung <ameryhung@gmail.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

st_ops_assoc_in_timer_no_uref drops every reference to the struct_ops
map while a timer callback of its prog calls .test_1 through the
association, and checks that the callback ends up with no struct_ops.

The timer first fires 500ms later and .test_1 returns right away, so the
callback hardly ever runs .test_1 while the map is freed, and the test
can't catch a map that is freed under a running .test_1.

Add st_ops_assoc_in_timer_free, which starts the timer right away,
restarts it with no delay until the association is gone, and makes
.test_1 spin in bpf_loop() when the timer callback calls it. Share the
steps of st_ops_assoc_in_timer_no_uref with it through a helper, which
stops when running syscall_prog fails instead of waiting for a timer
that never starts.

st_ops_assoc_in_timer_free run in a loop on kernels of the same bpf-next
commit with KASAN enabled, x86_64 VM with 32 vCPUs, without and with
the previous fix:

              without the fix           with the fix
  outcome     Oops (int3) on run 1      100 of 100 passed, median 0.27 s

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 .../bpf/prog_tests/test_struct_ops_assoc.c         | 34 ++++++++++++++++++----
 .../bpf/progs/struct_ops_assoc_in_timer.c          | 16 ++++++++++
 2 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c b/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
index 461ded7223515..9d56e8cb5675a 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
@@ -136,7 +136,8 @@ static void test_st_ops_assoc_in_timer(void)
 	struct_ops_assoc_in_timer__destroy(skel);
 }
 
-static void test_st_ops_assoc_in_timer_no_uref(void)
+static void run_st_ops_assoc_in_timer_no_uref(int timer_ns, int wait_map_free,
+					      int spin_loops)
 {
 	struct struct_ops_assoc_in_timer *skel = NULL;
 	struct bpf_link *link;
@@ -157,12 +158,18 @@ static void test_st_ops_assoc_in_timer_no_uref(void)
 	/*
 	 * Run .test_1 by calling kfunc bpf_kfunc_multi_st_ops_test_1_prog_arg() and checks
 	 * the return value. .test_1 will also schedule timer_cb that runs .test_1 again.
-	 * timer_cb will run 500ms after syscall_prog runs, when the user space no longer
-	 * holds a reference to st_ops_map.
+	 * timer_cb will run timer_ns after syscall_prog runs and, with wait_map_free, every
+	 * timer_ns after that until the map is freed. With 500ms, it first runs when the
+	 * user space no longer holds a reference to st_ops_map.
 	 */
-	skel->bss->timer_ns = 500000000;
+	skel->bss->timer_ns = timer_ns;
+	skel->bss->wait_map_free = wait_map_free;
+	skel->bss->spin_loops = spin_loops;
 	err = bpf_prog_test_run_opts(bpf_program__fd(skel->progs.syscall_prog), NULL);
-	ASSERT_OK(err, "bpf_prog_test_run_opts");
+	if (!ASSERT_OK(err, "bpf_prog_test_run_opts")) {
+		bpf_link__destroy(link);
+		goto out;
+	}
 
 	/* Detach and close struct_ops map to cause it to be freed */
 	bpf_link__destroy(link);
@@ -178,6 +185,21 @@ static void test_st_ops_assoc_in_timer_no_uref(void)
 	struct_ops_assoc_in_timer__destroy(skel);
 }
 
+static void test_st_ops_assoc_in_timer_no_uref(void)
+{
+	run_st_ops_assoc_in_timer_no_uref(500000000, 0, 0);
+}
+
+/*
+ * Keep calling .test_1 through the association from the timer callback, and
+ * stay in it for a while each time, while the map is being freed. The map
+ * must not be freed under a running .test_1.
+ */
+static void test_st_ops_assoc_in_timer_free(void)
+{
+	run_st_ops_assoc_in_timer_no_uref(0, 1, 1 << 20);
+}
+
 void test_struct_ops_assoc(void)
 {
 	if (test__start_subtest("st_ops_assoc"))
@@ -188,4 +210,6 @@ void test_struct_ops_assoc(void)
 		test_st_ops_assoc_in_timer();
 	if (test__start_subtest("st_ops_assoc_in_timer_no_uref"))
 		test_st_ops_assoc_in_timer_no_uref();
+	if (test__start_subtest("st_ops_assoc_in_timer_free"))
+		test_st_ops_assoc_in_timer_free();
 }
diff --git a/tools/testing/selftests/bpf/progs/struct_ops_assoc_in_timer.c b/tools/testing/selftests/bpf/progs/struct_ops_assoc_in_timer.c
index 0bed49e9f2170..47a44c8e8b114 100644
--- a/tools/testing/selftests/bpf/progs/struct_ops_assoc_in_timer.c
+++ b/tools/testing/selftests/bpf/progs/struct_ops_assoc_in_timer.c
@@ -25,6 +25,13 @@ int test_err;
 int timer_ns;
 int timer_test_1_ret;
 int timer_cb_run;
+int wait_map_free;
+int spin_loops;
+
+static int spin(u32 i, void *ctx)
+{
+	return 0;
+}
 
 __noinline static int timer_cb(void *map, int *key, struct bpf_timer *timer)
 {
@@ -34,6 +41,12 @@ __noinline static int timer_cb(void *map, int *key, struct bpf_timer *timer)
 	timer_test_1_ret = bpf_kfunc_multi_st_ops_test_1_assoc(&args);
 	recur--;
 
+	/* Try again later until the map is freed */
+	if (wait_map_free && timer_test_1_ret != -1) {
+		bpf_timer_start(timer, timer_ns, 0);
+		return 0;
+	}
+
 	timer_cb_run++;
 
 	return 0;
@@ -53,6 +66,9 @@ int BPF_PROG(test_1, struct st_ops_args *args)
 		bpf_timer_init(timer, &array_map, 1);
 		bpf_timer_set_callback(timer, timer_cb);
 		bpf_timer_start(timer, timer_ns, 0);
+	} else if (spin_loops) {
+		/* Stay in the trampoline while the map may be freed */
+		bpf_loop(spin_loops, spin, NULL, 0);
 	}
 
 	return MAP_MAGIC;

-- 
2.43.0

