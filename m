Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729961;
	b=2Z3FjRGNuyQdhgTF+9W/sTe6AIQQmEI4Fhq02Uz6QPIGsMCivZY11HICYvO0VpdVkWMU
	 h1Xea+bLSZqVUm+5JNEBY6vESmCc0b3ICrqs0JJGGvTJGZQK1SmNdMbCrlJgZZZyQHORT
	 YY/dl0ybRBmmJZ4xuPuWKIJpdhrocTQUvaeHXuaWzXyG4F/sSSVqcRayuQsr2FtUK3nFw
	 ydqiNlpjSDkF3gROusofdPFRXeBIikQKmCT+VUadzkN2rmQpD1GSjw8lZcy0xy+sjkH0N
	 hcRP+YaFDEKrgXLpXDL2yX1GoolMBy0X2MuylEKbgoXstmGtbz/Qz9TVW41BYjfVTGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729961;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a6e33FUXB/GBiDw4+lwPznAxPC7ALaJyHv7KaCKbPmk=;
	b=5EoErpZ0zsCjMpMlMTK5aBVlhFsrgqGwejvdwnE78uumnG/RLZQnKmtIzcsCAp0iYCS9
	 oCEasgYoNRAuj2QE9/oGKKF+zf9lsO6UV2Tt9k6YIEfsoq6cUsOhJb+l66ZFyGGP07wyR
	 +NQR9bdERtZZrsDTJVyoE/w9J47buLBe02O1ttHQ6BsdRriU8G5Bew6Ki75O+P8jLu3gv
	 f4LJacFKXvLO/2OoPXwCqxCFHYkIU2hcmcqjCsCkcRbmYX6tofeeVZZHuSy+bg4Ii1dFB
	 DM49G/yc7ILfhH1j+HyaGQFwMMDjsOA7RClq8gJounGtpAiAIws+IStfCM/wRmY4lHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PK6AizbL;
	arc=none smtp.remote-ip=95.215.58.137
Received: from mta1.migadu.com (out-137.mta1.migadu.com [95.215.58.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E39606D83D
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 18:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59E39606D83D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PK6AizbL
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2hguKlDZFZ6O92tcQVjyXL2fJi6dM7PMsX0fLFDYtGg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793729958; v=1; x=1794334758;
 b=PK6AizbLtyu1CxXklZGGmxDaJ3afApG4wSjRuW53XtJ7HVsIYb5nODCMXJCcvSJYrEXJfylH
 aSgWMyS8j7OFpvN2Iy+ZbAOU0ORCkNlBt6iPueL+qJpXdJaadHUY/5Wxhw6kDCzzkNF32nOVRTC
 z8BhVp+RSaVyDBK1WNSbvVig=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ccfdecbf43939bb5;
	Tue, 03 Nov 2026 18:19:17 +0000
X-Mizu-Trace-ID: ccfdecbf43939bb5
X-Migadu-Flow: FLOW_OUT
From: Vineet Gupta <vineet.gupta@linux.dev>
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
	john.fastabend@gmail.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	jose.marchesi@oracle.com,
	david.faust@oss.qualcomm.com,
	Vineet Gupta <vineet.gupta@linux.dev>
Subject: [PATCH bpf-next v4 7/8] selftests/bpf: cast explicitly in the struct_ops arena triggers
Date: Tue,  3 Nov 2026 10:18:15 -0800
Message-ID: <20261103181816.254686-8-vineet.gupta@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103181816.254686-1-vineet.gupta@linux.dev>
References: <20261103181816.254686-1-vineet.gupta@linux.dev>
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

trigger() in struct_ops_arena.c and its three siblings puts the
__BPF_FEATURE_ADDR_SPACE_CAST guard inside the function, so without
arena support the body is gone and the program falls through to
"return 0". The host side then does

  err = bpf_prog_test_run_opts(bpf_program__fd(trigger), &topts);
  ASSERT_OK(err, "test_run");
  ASSERT_EQ(topts.retval, 0, "trigger_retval");

and passes, having run a program that did nothing.

These are not driven by test_loader, so __skip_without_arena cannot
reach them. They do not need it: cast_kern() is a nop when the
compiler supports the address space and bpf_addr_space_cast(ptr, 0, 1)
when it does not, so one cast makes the body work either way and the
tests run for real instead of being skipped.

No verdict changes: struct_ops_arena/arena_arg and /arena_autobind
reported OK before, from an empty body, and report OK now from one
that runs. What changes is that the OK means something.

Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
---
v3 -> v4: was 8/8. cast_kern() instead of the skip_tests flag in
.data, so these run rather than skip. (Alexei)

 tools/testing/selftests/bpf/progs/struct_ops_arena.c           | 3 +--
 tools/testing/selftests/bpf/progs/struct_ops_arena_autobind.c  | 3 +--
 tools/testing/selftests/bpf/progs/struct_ops_arena_member.c    | 3 +--
 .../selftests/bpf/progs/struct_ops_arena_member_render.c       | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/struct_ops_arena.c b/tools/testing/selftests/bpf/progs/struct_ops_arena.c
index 8aa8639df91f..3fffa24839ee 100644
--- a/tools/testing/selftests/bpf/progs/struct_ops_arena.c
+++ b/tools/testing/selftests/bpf/progs/struct_ops_arena.c
@@ -86,7 +86,6 @@ struct bpf_testmod_ops3 testmod_arena = {
 SEC("syscall")
 int trigger(void *ctx)
 {
-#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
 	u64 __arena *val;
 	int ret;
 
@@ -94,6 +93,7 @@ int trigger(void *ctx)
 	if (!val)
 		return 1;
 
+	cast_kern(val);
 	*val = 41;
 	ret = bpf_testmod_ops3_call_test_arena((u64 *)val);
 	if (ret)
@@ -134,6 +134,5 @@ int trigger(void *ctx)
 		return 11;
 
 	bpf_arena_free_pages(&arena, (void __arena *)val, 1);
-#endif
 	return 0;
 }
diff --git a/tools/testing/selftests/bpf/progs/struct_ops_arena_autobind.c b/tools/testing/selftests/bpf/progs/struct_ops_arena_autobind.c
index 495faa0f4a8b..3455ca9e2d47 100644
--- a/tools/testing/selftests/bpf/progs/struct_ops_arena_autobind.c
+++ b/tools/testing/selftests/bpf/progs/struct_ops_arena_autobind.c
@@ -45,13 +45,13 @@ int unrelated(void *ctx)
 SEC("syscall")
 int trigger(void *ctx)
 {
-#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
 	u64 __arena *val;
 
 	val = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
 	if (!val)
 		return 1;
 
+	cast_kern(val);
 	*val = 41;
 	if (bpf_testmod_ops3_call_test_arena((u64 *)val))
 		return 2;
@@ -59,6 +59,5 @@ int trigger(void *ctx)
 		return 3;
 
 	bpf_arena_free_pages(&arena, (void __arena *)val, 1);
-#endif
 	return 0;
 }
diff --git a/tools/testing/selftests/bpf/progs/struct_ops_arena_member.c b/tools/testing/selftests/bpf/progs/struct_ops_arena_member.c
index a2218cd81619..afbe59f77af6 100644
--- a/tools/testing/selftests/bpf/progs/struct_ops_arena_member.c
+++ b/tools/testing/selftests/bpf/progs/struct_ops_arena_member.c
@@ -80,7 +80,6 @@ struct bpf_testmod_ops3 testmod_arena_member = {
 SEC("syscall")
 int trigger(void *ctx)
 {
-#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
 	u64 __arena *val;
 	int ret;
 
@@ -88,6 +87,7 @@ int trigger(void *ctx)
 	if (!val)
 		return 1;
 
+	cast_kern(val);
 	*val = 41;
 	ret = bpf_testmod_ops3_call_test_arena_member((u64 *)val);
 	if (ret)
@@ -104,6 +104,5 @@ int trigger(void *ctx)
 		return 4;
 
 	bpf_arena_free_pages(&arena, (void __arena *)val, 1);
-#endif
 	return 0;
 }
diff --git a/tools/testing/selftests/bpf/progs/struct_ops_arena_member_render.c b/tools/testing/selftests/bpf/progs/struct_ops_arena_member_render.c
index 09b4c740bdca..c4e134e14f87 100644
--- a/tools/testing/selftests/bpf/progs/struct_ops_arena_member_render.c
+++ b/tools/testing/selftests/bpf/progs/struct_ops_arena_member_render.c
@@ -63,7 +63,6 @@ struct bpf_testmod_ops3 testmod_arena_member_render = {
 SEC("syscall")
 int trigger(void *ctx)
 {
-#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
 	u64 __arena *val;
 	int ret;
 
@@ -71,6 +70,7 @@ int trigger(void *ctx)
 	if (!val)
 		return 1;
 
+	cast_kern(val);
 	*val = 41;
 	ret = bpf_testmod_ops3_call_test_arena_member((u64 *)val);
 	if (ret)
@@ -80,6 +80,5 @@ int trigger(void *ctx)
 		return 3;
 
 	bpf_arena_free_pages(&arena, (void __arena *)val, 1);
-#endif
 	return 0;
 }
-- 
2.53.0-Meta

