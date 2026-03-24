Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EFF23BCFD
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 04:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774327801; cv=none; b=Df4P7VGPBY1kdFTB3k6n8xPUtN8J4XPNe6wTfRpEy+nFSbO9jQLLwlhKCz0bX83bDizmX1Srzt/3MVtmdzGUMR09WBRTDABA+FhedwEv0oerB9D8m5moV3BGW8gZjKhwkKkoa4MH73Clen2VWEpcvjepQz8QiQJrrdLFW2hKxds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774327801; c=relaxed/simple;
	bh=ftegVYCo78uMSqHnP0Y4PRhKxxJ+BFfvqzvQcWQEpuc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SrgbKe8U9HzfV7DdaVkfPG5Oup820l2aA9qHAwxkPh89iejFNN3OFGaNljotPhT0J0OPno4wQy9HRSKZerdbxXHQWaHeQD3MDGr9AGx7bwlzl2EE49OwLfK9agrBMDz0kUW5Ps6Gvr/d3QJp60NuInHCzsboQhGaWy4jnXdtLfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pbiid56w; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pbiid56w"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79800183233so60671677b3.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 21:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774327799; x=1774932599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uGicTH0momhfy97qEFkEkUQzNyCBTGeoKeJkQ/iSw0A=;
        b=pbiid56w0b0flFqlH1PmzFQ7am2BDkoJjtq2vWASUp7qDb3QZs/Z0EFlgqJAoM/Z08
         iAUqK+cxZJVVDHQUN40iMkCexwBUGTRIp5wvEj+lOnf49XIezSx8FDRTzaH0jBzwmb3r
         TXZGav8ynpZHZ282f+LWLkOBjwzMPkv/4x5DTxN3YEkZ/SyVmm7Cs5SLZjcqX7+dtdvA
         gbO2r6x0MY8jPOBUstlo58tGJM4Rz5iB6j+zHZXb5UYuW9tJRoGAeP4HqIIgRSJMfdL6
         dEAE2cXvjkXDqN7+DRj8dxw81b4CNhdUrpHgk0UHuhk3ITcSzoRTyj9S9VlY//3SDz4Q
         ankw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774327799; x=1774932599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGicTH0momhfy97qEFkEkUQzNyCBTGeoKeJkQ/iSw0A=;
        b=CSqYoe8bpGUyXrKUJr44Oy/+iyma2v1FEaeKLPpUNsHRPkfOo/dVtTFFdCpFhv/rTC
         q64Ol3P8Evy2KGgu+y8drFjDrByqgochcNeBCHqLkmTkbQB+R2fvBXcaf5mxv/9LB44B
         q05osRXD1QHCWVfYjUrUItW2jJHhTOeqV4iBNs7dBL9/MWFgUnxHE1haga8qWQZMpWto
         aygJwNvo4Al0JDqn749zQF7mPtpTbWI77FO4kAko8XJbXESYE2e8DWAj7OWBaJLdL7QU
         asNLBLhYYMWYGiVInJ2QWYCwxNB3CExfEVX9Ktff4E45pCkR9bUjLFkeXg4FrvlLaRo+
         T3cA==
X-Forwarded-Encrypted: i=1; AJvYcCVKFfjifrYLw+Oc5St9Ymq7gumnu/zNpjJ2BfC7ULhQ0wmjKDpQknnl/exR7sZ89mbeRHTw0E2u+LZM4YKRacQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzQ6V1S2adct7JJzVAZqlXijDdKVsNN3apPwajgd0NLvxXNa2W
	0nTh4vAkloRMldFY/AJ7CSqPQUyfYBMXxM0yspy63yzQKUqysOPXiZWi
X-Gm-Gg: ATEYQzzOkAKrZCseMX0eGLqji5HZy9+p5DrhqKhTFMr+Y6NFOBas0gAKmgictWlAcmn
	Ye1cMpJmyQISxYewGDOlfvsn2equTdv5LC7sjAXk8DhzXgwiXrLW3CjF8Ty+NlclhF5CClTRalQ
	pgt899I96RmR7xuypNmIOhmdKrI2YSEKWsJle+QvTHdufylcUvWyxZ3LbhWz91RRh8f0lY1TZiM
	wi532M9FYjM/s9fxdNbBFFfdg+7NXd49XjSaiTlwYZayqUuCTp7AvW/Z8Iuhw1Z3sjkvbMTFCZX
	nR6Nya2D7iAz2Jpt4ayNBxYWU91w05YtBHsSAm9rv1W3GimtjtXoT/B+HJppgaUmyMwy/o2icPf
	+mhVkuPG6XBLlS3nhL9IwkSpQhd8eL6FR+o13cQdXUAkNtwnOCP9iQ+whLHJWK7W+TF64wezf5t
	ZzPAeGnf6DpgCA31mgG38X/F26R+VGftLnuxXpo/MGZCN99uPFHyap+Df5rU4bgAqO43Kw/KN1C
	8jgf7lTUP6Ak4F1aojj4e3APP/npIrfBoDoVrkPjDB2vi9091Y8TPg7x80G6oeYJKpF/9Z17dWv
	cD58A76AsCZtZYyz4Q==
X-Received: by 2002:a05:690c:12:b0:79a:c5b5:d094 with SMTP id 00721157ae682-79ac5b5e61cmr6816317b3.22.1774327799343;
        Mon, 23 Mar 2026 21:49:59 -0700 (PDT)
Received: from u2404-VMware-Virtual-Platform.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903f82e6sm70028857b3.17.2026.03.23.21.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 21:49:58 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	paul.chaignon@gmail.com,
	mykyta.yatsenko5@gmail.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v4] selftests/bpf: move trampoline_count to dedicated bpf_testmod target
Date: Tue, 24 Mar 2026 12:49:49 +0800
Message-ID: <20260324044949.869801-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

trampoline_count fills all trampoline attachment slots for a single
target function and verifies that one extra attach fails with -E2BIG.

It currently targets bpf_modify_return_test, which is also used by
other selftests such as modify_return, get_func_ip_test, and
get_func_args_test. When such tests run in parallel, they can contend
for the same per-function trampoline quota and cause unexpected attach
failures. This issue is currently masked by harness serialization.

Move trampoline_count to a dedicated bpf_testmod target and register it
for fmod_ret attachment. Also route the final trigger through
trigger_module_test_read(), so the execution path exercises the same
dedicated target.

This keeps the test semantics unchanged while isolating it from other
selftests, so it no longer needs to run in serial mode. Remove the
TODO comment as well.

Tested:
  ./test_progs -t trampoline_count -vv
  ./test_progs -j$(nproc) -t trampoline_count -vv
  ./test_progs -j$(nproc) -t \
    trampoline_count,modify_return,get_func_ip_test,get_func_args_test -vv
  20 runs of:
    ./test_progs -j$(nproc) -t \
      trampoline_count,modify_return,get_func_ip_test,get_func_args_test

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---

Link: https://lore.kernel.org/bpf/20260320074150.628094-1-sun.jian.kdev@gmail.com/

v4:
- simplify the dedicated trampoline_count target and its trigger path
- simplify the associated fentry/fmod_ret/fexit test program signatures
- reduce the final trigger to a plain ASSERT_OK()
- drop Suggested-by per Jiri

v3:
- route the final trigger through trigger_module_test_read() and make
  bpf_testmod_test_read() call the dedicated trampoline_count target

v2:
- rewrite the subject to describe the change
- resend with the correct patch content

 .../bpf/prog_tests/trampoline_count.c          | 17 +++--------------
 .../bpf/progs/test_trampoline_count.c          | 12 ++++++------
 .../selftests/bpf/test_kmods/bpf_testmod.c     | 18 ++++++++++++++++++
 3 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/trampoline_count.c b/tools/testing/selftests/bpf/prog_tests/trampoline_count.c
index 6cd7349d4a2b..7321850db75f 100644
--- a/tools/testing/selftests/bpf/prog_tests/trampoline_count.c
+++ b/tools/testing/selftests/bpf/prog_tests/trampoline_count.c
@@ -30,16 +30,14 @@ static struct bpf_program *load_prog(char *file, char *name, struct inst *inst)
 	return prog;
 }
 
-/* TODO: use different target function to run in concurrent mode */
-void serial_test_trampoline_count(void)
+void test_trampoline_count(void)
 {
 	char *file = "test_trampoline_count.bpf.o";
 	char *const progs[] = { "fentry_test", "fmod_ret_test", "fexit_test" };
-	int bpf_max_tramp_links, err, i, prog_fd;
+	int bpf_max_tramp_links, i;
 	struct bpf_program *prog;
 	struct bpf_link *link;
 	struct inst *inst;
-	LIBBPF_OPTS(bpf_test_run_opts, opts);
 
 	bpf_max_tramp_links = get_bpf_max_tramp_links();
 	if (!ASSERT_GE(bpf_max_tramp_links, 1, "bpf_max_tramp_links"))
@@ -80,16 +78,7 @@ void serial_test_trampoline_count(void)
 		goto cleanup;
 
 	/* and finally execute the probe */
-	prog_fd = bpf_program__fd(prog);
-	if (!ASSERT_GE(prog_fd, 0, "bpf_program__fd"))
-		goto cleanup;
-
-	err = bpf_prog_test_run_opts(prog_fd, &opts);
-	if (!ASSERT_OK(err, "bpf_prog_test_run_opts"))
-		goto cleanup;
-
-	ASSERT_EQ(opts.retval & 0xffff, 33, "bpf_modify_return_test.result");
-	ASSERT_EQ(opts.retval >> 16, 2, "bpf_modify_return_test.side_effect");
+	ASSERT_OK(trigger_module_test_read(256), "trigger_module_test_read");
 
 cleanup:
 	for (; i >= 0; i--) {
diff --git a/tools/testing/selftests/bpf/progs/test_trampoline_count.c b/tools/testing/selftests/bpf/progs/test_trampoline_count.c
index 7765720da7d5..02f52806b1b2 100644
--- a/tools/testing/selftests/bpf/progs/test_trampoline_count.c
+++ b/tools/testing/selftests/bpf/progs/test_trampoline_count.c
@@ -3,20 +3,20 @@
 #include <bpf/bpf_helpers.h>
 #include <bpf/bpf_tracing.h>
 
-SEC("fentry/bpf_modify_return_test")
-int BPF_PROG(fentry_test, int a, int *b)
+SEC("fentry/bpf_testmod_trampoline_count_test")
+int BPF_PROG(fentry_test)
 {
 	return 0;
 }
 
-SEC("fmod_ret/bpf_modify_return_test")
-int BPF_PROG(fmod_ret_test, int a, int *b, int ret)
+SEC("fmod_ret/bpf_testmod_trampoline_count_test")
+int BPF_PROG(fmod_ret_test, int ret)
 {
 	return 0;
 }
 
-SEC("fexit/bpf_modify_return_test")
-int BPF_PROG(fexit_test, int a, int *b, int ret)
+SEC("fexit/bpf_testmod_trampoline_count_test")
+int BPF_PROG(fexit_test, int ret)
 {
 	return 0;
 }
diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
index e62c6b78657f..9caf9ffa1bb0 100644
--- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
+++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
@@ -470,6 +470,11 @@ noinline void bpf_testmod_stacktrace_test_1(void)
 
 int bpf_testmod_fentry_ok;
 
+noinline int bpf_testmod_trampoline_count_test(void)
+{
+	return 0;
+}
+
 noinline ssize_t
 bpf_testmod_test_read(struct file *file, struct kobject *kobj,
 		      const struct bin_attribute *bin_attr,
@@ -548,6 +553,8 @@ bpf_testmod_test_read(struct file *file, struct kobject *kobj,
 			21, 22, 23, 24, 25, 26) != 231)
 		goto out;
 
+	bpf_testmod_trampoline_count_test();
+
 	bpf_testmod_stacktrace_test_1();
 
 	bpf_testmod_fentry_ok = 1;
@@ -1843,6 +1850,16 @@ struct bpf_struct_ops testmod_multi_st_ops = {
 
 extern int bpf_fentry_test1(int a);
 
+BTF_KFUNCS_START(bpf_testmod_trampoline_count_ids)
+BTF_ID_FLAGS(func, bpf_testmod_trampoline_count_test)
+BTF_KFUNCS_END(bpf_testmod_trampoline_count_ids)
+
+static const struct
+btf_kfunc_id_set bpf_testmod_trampoline_count_fmodret_set = {
+	.owner = THIS_MODULE,
+	.set = &bpf_testmod_trampoline_count_ids,
+};
+
 static int bpf_testmod_init(void)
 {
 	const struct btf_id_dtor_kfunc bpf_testmod_dtors[] = {
@@ -1859,6 +1876,7 @@ static int bpf_testmod_init(void)
 	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_TRACING, &bpf_testmod_kfunc_set);
 	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_SYSCALL, &bpf_testmod_kfunc_set);
 	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_STRUCT_OPS, &bpf_testmod_kfunc_set);
+	ret = ret ?: register_btf_fmodret_id_set(&bpf_testmod_trampoline_count_fmodret_set);
 	ret = ret ?: register_bpf_struct_ops(&bpf_bpf_testmod_ops, bpf_testmod_ops);
 	ret = ret ?: register_bpf_struct_ops(&bpf_testmod_ops2, bpf_testmod_ops2);
 	ret = ret ?: register_bpf_struct_ops(&bpf_testmod_ops3, bpf_testmod_ops3);

base-commit: 8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
-- 
2.43.0

