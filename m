Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAA92BE65F
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 04:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773893050; cv=none; b=EmHUJwv2/v2hhAZtQzh8XRC+7VRsQwfJM0THWKULM3uMBnZeLgZbKpZEPkgXXSRzyife2QZLMmAqVgghK0ARjwtjMPGdgEHtPkHfQSdobjQ0rfuk2DhkRPbk6XauWU6AlLi397zFxjdtwLkj3iEVcI5UNZS5wjLAjHSYGRqscbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773893050; c=relaxed/simple;
	bh=al28sz6aoPxmVJCaRFJbTqr9Acsx8Cb6Jpl7mkM1zU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RO1Awe4KS9zhRM9O/Z2r/gaOLk4Ef4sf/vYY3WTcrTwCX3cV4P6KYUizrnLZB3S0yARszVjZ7xNKsXi6W8FUqcFA1o3Me/K8xS+6Eq36bJ24QiOQe/F92QuV7MDdFaIqAJus0aq0hPDyJHa0RpX6WUHBGi4HN4q+/fdU3iytBXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PC8lTvwQ; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PC8lTvwQ"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ba895adfeaso649078eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 21:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773893048; x=1774497848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFidzLk14rThG8oUyNmMDZ2YZWMvX9mGuKIL63l9/g0=;
        b=PC8lTvwQVztLBlJ+bUrBvlKzamJQi40Tm4C2N62cg06c25F2Q4iDCPTofjZDiyTyWa
         yJn7aPsvNgUF4qkzadYxGuzyY1TPrxOnTAA5sJyoLvo9zex34zmJmRD5396R9aO+QFrS
         NWiUlB4lSl3iFbTKbt6OCJmw1zkDUQGSSewCwXTSxO2RN3B3oZ96rw13HMwF/f8kyLnx
         J+0GbJWQXOOWUPriuCwd9eWD1mpxdsd+lTDy++MdVgWUFQ8K99aO7T8EoT16lX5VveBa
         UcAp1l/ab6KJQfYluYTgcw5vs+y1xkZC3xJa2mLaCNRELIIXtTGyPA+stD7lNypXVZYz
         PicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773893048; x=1774497848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aFidzLk14rThG8oUyNmMDZ2YZWMvX9mGuKIL63l9/g0=;
        b=nyDNCm8E4UdJSbl3hCpG0d69bR/ssS9sRM9z88lpwlbw93bkBfl7XUvudIpJ+V42gR
         lIXw0ZBMmaVbutEtYtGpPmo7XTgIyG8qbKfFdOAfeSmz5FwMeCJd5Q6BvCiYZ7pm5Xx7
         WXgHG2KrF5N5oVg7AqTAIaTNNS9C2n8BYa9EySmjjGAwA2Bwy/8/8Ze9CobXGWScKrCg
         kvV2MvxmFmJE5gQ1SdSuptoTn/s2f9m+Qx7MJFzPu3oi9rxAw3MMHwndKnuMPa95bXaV
         uqki/6vAZxj2oR5yvHU0KIU9A8TDOivEz/KhZ086kR1uPMIHCmtZYHCYBr82GbCLvYSB
         Bntg==
X-Forwarded-Encrypted: i=1; AJvYcCVCNIAPERW47hB7zWDfWoB4U85HPmKtYPhQF1VRln1QuzHMqjNZJjp2bLFLntfzA+F2hJmv2avKg/myvh91H8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YylJRyMiPxZprSIP1ue7oehbZ8xquM7ARGvaYsYB4v1pbz5yz67
	TRHWlNT9KZ2rp6mUuK4Gzbgnfgwz5l8x+FObwxpgbV6gEOuIQyxqLfZa
X-Gm-Gg: ATEYQzwe25ut/VqVLzKi3epkvN22KdhP47KvgRpXpYwHNAwu3GEKpc9SZr8hDMkPYs0
	5C2Am0Pn2gZoaErI036wPhf4yJOSOdTLJoEB1G6+8ajrSOuy0pywAkbV0SXahiVwP7lPa5+IeMn
	AHL3Ar0ialRm8qvHMqehFA5MsCEfFTrfVPzZQI3OsnCxXtgoQ9ouBteMiQzJel0TrHDFvoxZYfi
	e1vthaOYbo1iRWVbRcw3vEOFiDwfalQuvBQ6XTaz3GHDAX6DEGYUlqSVQZ5avSW0RoMBMp3YQ2B
	yuliWeJ1UEHhw8wOquxz1B/CJLHNBoaxprny6zUzetf7CLAGducm2w4l2VrcQS0/oTgEj678f64
	ylEvPCT74WaT0EbdzkDDzwQkQIdz9zP3GeDxHlcOtojEl4rH+hTgkNMLYzYWgvR+XqcMx1b6TQX
	3L/06UvECz9UnpmgbAJY5dOJK0AIsZ5tijzYgDVz4A17gp/u67hgbDFLu/3Rux8zmn5EqbV2xCj
	50llkcrg6i+IsrCfIth5J5VK/o=
X-Received: by 2002:a05:7022:410:b0:128:d577:dc21 with SMTP id a92af1059eb24-1299ba8eb6bmr2987001c88.13.1773893048389;
        Wed, 18 Mar 2026 21:04:08 -0700 (PDT)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e560fb5fsm8470953eec.31.2026.03.18.21.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 21:04:08 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	shuah@kernel.org
Cc: martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	paul.chaignon@gmail.com,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2] selftests/bpf: move trampoline_count to dedicated bpf_testmod target
Date: Thu, 19 Mar 2026 12:03:37 +0800
Message-ID: <20260319040337.366375-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319031227.330505-1-sun.jian.kdev@gmail.com>
References: <20260319031227.330505-1-sun.jian.kdev@gmail.com>
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
for fmod_ret attachment. This keeps the test semantics unchanged while
isolating it from other selftests, so it no longer needs to run in
serial mode. Remove the TODO comment as well.

Tested:
  ./test_progs -t trampoline_count -vv
  ./test_progs -t modify_return -vv
  ./test_progs -t get_func_ip_test -vv
  ./test_progs -t get_func_args_test -vv
  ./test_progs -j$(nproc) -t trampoline_count -vv
  ./test_progs -j$(nproc) -t
    trampoline_count,modify_return,get_func_ip_test,get_func_args_test,\
kprobe_multi_test -vv
  20 runs of:
    ./test_progs -j$(nproc) -t
    trampoline_count,modify_return,get_func_ip_test,get_func_args_test,\
kprobe_multi_test

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---

v2:
- rewrite the subject to describe the change
- resend with the correct patch content
- resend as a reply to v1

 .../selftests/bpf/prog_tests/trampoline_count.c |  3 +--
 .../selftests/bpf/progs/test_trampoline_count.c |  6 +++---
 .../selftests/bpf/test_kmods/bpf_testmod.c      | 17 +++++++++++++++++
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/trampoline_count.c b/tools/testing/selftests/bpf/prog_tests/trampoline_count.c
index 6cd7349d4a2b..b19358aed126 100644
--- a/tools/testing/selftests/bpf/prog_tests/trampoline_count.c
+++ b/tools/testing/selftests/bpf/prog_tests/trampoline_count.c
@@ -30,8 +30,7 @@ static struct bpf_program *load_prog(char *file, char *name, struct inst *inst)
 	return prog;
 }
 
-/* TODO: use different target function to run in concurrent mode */
-void serial_test_trampoline_count(void)
+void test_trampoline_count(void)
 {
 	char *file = "test_trampoline_count.bpf.o";
 	char *const progs[] = { "fentry_test", "fmod_ret_test", "fexit_test" };
diff --git a/tools/testing/selftests/bpf/progs/test_trampoline_count.c b/tools/testing/selftests/bpf/progs/test_trampoline_count.c
index 7765720da7d5..14ad2f53cf33 100644
--- a/tools/testing/selftests/bpf/progs/test_trampoline_count.c
+++ b/tools/testing/selftests/bpf/progs/test_trampoline_count.c
@@ -3,19 +3,19 @@
 #include <bpf/bpf_helpers.h>
 #include <bpf/bpf_tracing.h>
 
-SEC("fentry/bpf_modify_return_test")
+SEC("fentry/bpf_testmod_trampoline_count_test")
 int BPF_PROG(fentry_test, int a, int *b)
 {
 	return 0;
 }
 
-SEC("fmod_ret/bpf_modify_return_test")
+SEC("fmod_ret/bpf_testmod_trampoline_count_test")
 int BPF_PROG(fmod_ret_test, int a, int *b, int ret)
 {
 	return 0;
 }
 
-SEC("fexit/bpf_modify_return_test")
+SEC("fexit/bpf_testmod_trampoline_count_test")
 int BPF_PROG(fexit_test, int a, int *b, int ret)
 {
 	return 0;
diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
index e62c6b78657f..6eaceb4dfbec 100644
--- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
+++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
@@ -581,6 +581,12 @@ noinline int bpf_fentry_shadow_test(int a)
 }
 EXPORT_SYMBOL_GPL(bpf_fentry_shadow_test);
 
+noinline int bpf_testmod_trampoline_count_test(int a, int *b)
+{
+	*b += 1;
+	return a + *b;
+}
+
 __bpf_hook_end();
 
 static struct bin_attribute bin_attr_bpf_testmod_file __ro_after_init = {
@@ -1843,6 +1849,16 @@ struct bpf_struct_ops testmod_multi_st_ops = {
 
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
@@ -1859,6 +1875,7 @@ static int bpf_testmod_init(void)
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

