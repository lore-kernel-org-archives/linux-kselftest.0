Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD8E221277
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Mar 2026 05:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773553361; cv=none; b=kKCZQZqnzNf+cxWJtTfD6tP4Vbecks/AhyNg8GDbAUaC+Dtj5LAFW7WxReY/0ROL64FJDctSMfbFPt8VoUIE+X+NLgjs4gD4lDlxXDJx8U5+B8rNffbKI6Kix+SsrBo0kf3e5o0qqV8KSzaKeUe9Ln3qQkaj9u9TN1ewy1/D/7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773553361; c=relaxed/simple;
	bh=kR+TE10tpnxKQiZjkq/fLqmkxPaUA58D/ODHc+W7kf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HnGEEjPp4GmHajd/fG2Lj6qF/6/Vt7n6TANd5hd0RU9xsRrOdI+9hiYBKFzKF4YMdPQRzrRrq8IflL/ssWQdYo8J0bNmYFr/BdFK+5DAPRkE6McAGVFkXBg5hX0te0oLtdW7XtpN4fnBnlgwNvd53iAOylwb9AMDeBm10+sXMrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxzjXvfY; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxzjXvfY"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79a46260385so712377b3.3
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 22:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773553360; x=1774158160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dKUquyCRSPWmlofe+X/2wplVAFLMW1S/AyCAW60GwsI=;
        b=QxzjXvfYU6OMptXMDMRGMyLBoyPTMqkwlcBgBZ/0Tbd4xPYbd54b0UmWkfvsFbZNW2
         1MNVtJHD0MkCNfKz1ShSmvNOfZjRzYwZDKKUmLK3imACdL51laDHFRVbd8panc0sM3i1
         NAdeulCOcJbzHkWUeul54aBh0PZR1Bav5KSv/aZMj7dUPH5nhRCw6QuITXtoyCaO9WQX
         DOJLY3w8b6TbuYWVGQ3t+74OJyb2rHMhupw1KWPDkMQZFKrkWXyAKHvETRktgoldo+LL
         JJkpseoAbC2MDPxatyzIRzV7/OMxu/tD+qzA7c8aj+gM0vFBHdMfhmWSfLkEnQjTZJmW
         XpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773553360; x=1774158160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKUquyCRSPWmlofe+X/2wplVAFLMW1S/AyCAW60GwsI=;
        b=JCQ/9FThvI2Ybva2jsZgiGQA3FfwQrl59hiSIw5ElWSVOLeQsJ1gmoKip34KI0HTNq
         fuLXd0Wf/LZR49qzYXiE9jfaU5lmXDMfOvU9srTzGu38KyRH3lKGaOItVJZEQPmB/CXj
         M8ULLrsrNVv6cTWgXTIu9B5e8NYPw3A7+i/MUVDdH7WBO2Mm+6H28RWuZ1x9KZNw2TIc
         lpV1IHo7vhmo6JySx6YNhIIaYRLdN4hNXJhc6/0Pbzeet3BUeZnPCOxu5AjnviHuCRkg
         CPszCAVw3afYFpzB1uMPH/KL0q4RJVSWPqXl830JV2lZQmUB9qrFX7/U4ZwZLY7plI8u
         b3fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGDbSNodvIHIj3+MDgiTIz8su99MGmTKaBXjeoljY8x6nkVzO+RldFx2KWmy9+6/r1KkPlxMnE4ZyEMhuLlG0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8kP1OGHR98QdyQXdMPSEk9e2qIjBs7wKuJpKnlswYEuJ5kwS3
	8x31uocpKy27QUnfNrhIlbAt67bh4fSLnpz8rmb0EBg4TxX8NA8zkb7h
X-Gm-Gg: ATEYQzytvQpclHvp8ZZbkchAdKiATT8OZRlM6AnivKrDE2PYNQMK6oeXKctPDRYMTMp
	Rz3jLP4u9wwNPNEuw6z1Juofh3yzNNQP5HMUADSuXf5WgroLrOvkuqZRr9jVNKW+J3lWRzTNWSa
	0+hWbU/i2/sUxpXqXaeDiMWm5DEniN7XNgNQan5pAIosLL3loNZYGTHrgf/b7axXN+L0rN3jRji
	KUYfRtb47FPCoWCaX5z6mYvWs8YCgRignSY6pwJeuHZ5rTgLjloVbEb74Oy5qhFsGgqUyUaEddD
	jIPn74D9ePlZ+aSS3iTJ2UOQjVxb7oQEw+6/kj+weff2UkZHrhufXo3l7TbTCXXm7AOBDg7AYlN
	OG+X9FdEzWc1fTaCDJq27aZaIRhr6z6Wgv/WUkkRBn573/Ed49YcI99otpz5nek3F73R71N6+iN
	bHXVjao/CslrrWbiEuamseKKkaCKdsGOiSSl1RLWLctl91ovQu+iDmTKvZX8K8tm/EZoNPTzMHw
	KrKakVNo1e1s3Vxusipq9d4G9Y=
X-Received: by 2002:a05:690c:306:b0:794:9d24:76b0 with SMTP id 00721157ae682-79a1c1ea9a9mr86872447b3.54.1773553359688;
        Sat, 14 Mar 2026 22:42:39 -0700 (PDT)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7991a7041f3sm67562517b3.14.2026.03.14.22.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 22:42:39 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: andrii@kernel.org,
	eddyz87@gmail.com,
	shuah@kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH] selftests/bpf: trampoline_count: use dedicated target function
Date: Sun, 15 Mar 2026 13:42:27 +0800
Message-ID: <20260315054227.118344-1-sun.jian.kdev@gmail.com>
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
modify_return and get_func_ip_test. When those tests run in parallel,
they can contend for the same per-function trampoline quota and
cause unexpected attach failures. This issue is currently masked by
harness serialization.

Add a dedicated bpf_trampoline_count_test target and switch
trampoline_count to use it. This keeps the test semantics unchanged
while isolating it from other modify_return-based selftests, so it no
longer needs to run in serial mode. Remove the TODO comment as
well.

Tested:
  ./test_progs -t trampoline_count -vv
  ./test_progs -t modify_return -vv
  ./test_progs -t get_func_ip_test -vv
  ./test_progs -j$(nproc) -t trampoline_count -vv
  ./test_progs -j$(nproc) -t
    trampoline_count,modify_return,get_func_ip_test -vv

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 net/bpf/test_run.c                                        | 7 +++++++
 tools/testing/selftests/bpf/prog_tests/trampoline_count.c | 3 +--
 tools/testing/selftests/bpf/progs/test_trampoline_count.c | 6 +++---
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index 178c4738e63b..b41147a29f16 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -580,6 +580,12 @@ __bpf_kfunc int bpf_modify_return_test2(int a, int *b, short c, int d,
 	return a + *b + c + d + (long)e + f + g;
 }
 
+__bpf_kfunc int bpf_trampoline_count_test(int a, int *b)
+{
+	*b += 1;
+	return a + *b;
+}
+
 __bpf_kfunc int bpf_modify_return_test_tp(int nonce)
 {
 	trace_bpf_trigger_tp(nonce);
@@ -635,6 +641,7 @@ BTF_KFUNCS_START(bpf_test_modify_return_ids)
 BTF_ID_FLAGS(func, bpf_modify_return_test)
 BTF_ID_FLAGS(func, bpf_modify_return_test2)
 BTF_ID_FLAGS(func, bpf_modify_return_test_tp)
+BTF_ID_FLAGS(func, bpf_trampoline_count_test)
 BTF_ID_FLAGS(func, bpf_fentry_test1, KF_SLEEPABLE)
 BTF_KFUNCS_END(bpf_test_modify_return_ids)
 
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
index 7765720da7d5..911d282fd423 100644
--- a/tools/testing/selftests/bpf/progs/test_trampoline_count.c
+++ b/tools/testing/selftests/bpf/progs/test_trampoline_count.c
@@ -3,19 +3,19 @@
 #include <bpf/bpf_helpers.h>
 #include <bpf/bpf_tracing.h>
 
-SEC("fentry/bpf_modify_return_test")
+SEC("fentry/bpf_trampoline_count_test")
 int BPF_PROG(fentry_test, int a, int *b)
 {
 	return 0;
 }
 
-SEC("fmod_ret/bpf_modify_return_test")
+SEC("fmod_ret/bpf_trampoline_count_test")
 int BPF_PROG(fmod_ret_test, int a, int *b, int ret)
 {
 	return 0;
 }
 
-SEC("fexit/bpf_modify_return_test")
+SEC("fexit/bpf_trampoline_count_test")
 int BPF_PROG(fexit_test, int a, int *b, int ret)
 {
 	return 0;

base-commit: 267594792a71018788af69e836c52e34bb8054af
-- 
2.43.0

