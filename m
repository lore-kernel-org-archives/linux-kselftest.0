Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793220147;
	b=rDr7nnwlGMF4/aj3Efym34Zq98rCUvZZ+LTGduJRb2s4MazOt7ysXCmqLT5FLEnwny+/
	 +UTzOBPjIDagtbFO/5pjDe9ET0w0adL1d8vy04vPm7TjV0HvxN80+OV8T6p6QjidB9dj0
	 mTiaOY1Od/NXpMUn565PVZms0EvdZ95wuTQUTanE7KjEY6rzldZZZK5EtH41xMgRdCXpT
	 1kddQgdOGnB5G/0I0Y13lqc8LSOi6ml/IxIQFrfes9dX9Vfk8b2FGIgnaKCuIab/4gUFU
	 TrIVTJ8bBT3v4FH/Ld+HEWUjpIIn82piQuFZxEXKYtKjdsg/K+fyCv3Jo6UujpfPjWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220147;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TqZMShUwObQw8SKTj74MIhBW352zXxbZoagijRnRZsU=;
	b=KrnyTLDkmPzuHab6urvF9CqOUXqgrNYNDssf+nRvqu0+90OIB+U2KdyexpHxeu1BKsg/
	 1ibcBArGkVQUw/q2WgeiWH9KeoD+yGqMAbZLZOWHgbdyy8nC88zkX7IgGyOjxDqdopeAv
	 g6qUsaXhfz2r2IWTDjeeL5lYrgI3BlUaFNvhQO55rliJmodPnc+6o40M6nke3G7IbNCsj
	 ISkRDaCNZEp1nxmw+X+vk2H1tZu5Y2PMyJGX8qCjBH/32cQyKbrn0TDfZC1x8gUW4W70i
	 0SyQthS7rh31GgJwIV2gvEzaZYZokKDfl3ZOIKmxDLCVK4+Zoh5srUSSH8n7GwNZc6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c8g0RLMi;
	arc=none smtp.remote-ip=91.218.175.224
Received: from mta0.migadu.com (out-224.mta0.migadu.com [91.218.175.224])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165C260A2625
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 20:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 165C260A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c8g0RLMi
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kG6PSTw+cy6dHxyAq6KmUby801uCfZJf2HXQ109G+h4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793220145; v=1; x=1793824945;
 b=c8g0RLMi1m5kfQCve6u8lpLHNXJNSCbc0IsG8I9FeyS5+zKjhgw0oRvq7hDGeN6DW3A+11T1
 bHBBwxVYPWJuaXcMH9v0rvX033w0vGF13PSZFg3cnXST9jywMt/2Vg1YGbCVdTk3D1zDevOSUIT
 V9woTZZi0/DiPEpTkvEp8qew=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 58ae1e1d1c5ddfdf;
	Wed, 28 Oct 2026 20:42:24 +0000
X-Mizu-Trace-ID: 58ae1e1d1c5ddfdf
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
Subject: [PATCH bpf-next v2 4/8] selftests/bpf: make arena_base() opaque to GCC's -Warray-bounds
Date: Wed, 28 Oct 2026 13:41:54 -0700
Message-ID: <20261028204158.1021284-5-vineet.gupta@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028204158.1021284-1-vineet.gupta@linux.dev>
References: <20261028204158.1021284-1-vineet.gupta@linux.dev>
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

arena_base() casts the map definition to the kernel's struct bpf_arena
and reads user_vm_start out of it.  In the object file that definition
is only the 32-byte BTF placeholder the loader rewrites, so the access
is past the end of the object and GCC says so:

  libarena/include/bpf_arena_common.h:52:69: error: array subscript 'struct bpf_arena[0]' is partly outside array bounds of 'struct <anonymous>[1]' [-Werror=array-bounds=]
     52 | #define arena_base(map) ((void __arena *)((struct bpf_arena *)(map))->user_vm_start)
  progs/arena_race.c:58:30: note: in expansion of macro 'arena_base'

GCC is right; clang has the same warning but does not apply it to a
member access through a cast.  With BPF_CFLAGS carrying -Werror this is
a build failure, today, for every prog that calls arena_base() and is
compiled by a GCC with arena support: verifier_arena.c,
verifier_arena_large.c, verifier_arena_globals1.c,
verifier_arena_globals2.c and arena_race.c.

Make the pointer opaque instead, which is what progs/stream.c already
does for its own open-coded copy of the same access.  The bounds
analysis then has nothing to reason about, and every caller is covered
without a per-file opt-out that has to be maintained -- arena_race.c
was added without one and broke the bpf_gcc build.

The barrier is behind #ifdef __clang__ so clang keeps the plain macro.
It does not need it, and the barrier is not free: it blocks reuse of
the map address, so each call site reloads it.  Across the five progs
and 20 call sites that is +35 instructions under GCC
(2528 -> 2563), about 1.4% on those objects and nothing elsewhere.
Clang output is unchanged, bit for bit.

Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
---
 .../bpf/libarena/include/bpf_arena_common.h      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/testing/selftests/bpf/libarena/include/bpf_arena_common.h b/tools/testing/selftests/bpf/libarena/include/bpf_arena_common.h
index 82aafe879fae..4f2c6050215f 100644
--- a/tools/testing/selftests/bpf/libarena/include/bpf_arena_common.h
+++ b/tools/testing/selftests/bpf/libarena/include/bpf_arena_common.h
@@ -49,7 +49,23 @@ void __arena* bpf_arena_alloc_pages(void *map, void __arena *addr, __u32 page_cn
 int bpf_arena_reserve_pages(void *map, void __arena *addr, __u32 page_cnt) __ksym __weak;
 void bpf_arena_free_pages(void *map, void __arena *ptr, __u32 page_cnt) __ksym __weak;
 
+/*
+ * GCC's -Warray-bounds fires on the member access: the map definition the
+ * object file carries is smaller than struct bpf_arena.  Make the pointer
+ * opaque to it, as the open-coded form in progs/stream.c already does.
+ * clang does not warn and does not need the barrier, which costs a reload
+ * of the map address at every call site.
+ */
+#ifdef __clang__
 #define arena_base(map) ((void __arena *)((struct bpf_arena *)(map))->user_vm_start)
+#else
+#define arena_base(map)							\
+({									\
+	struct bpf_arena *__ma = (void *)(map);				\
+	barrier_var(__ma);						\
+	(void __arena *)__ma->user_vm_start;				\
+})
+#endif
 
 #else /* when compiled as user space code */
 
-- 
2.53.0-Meta

