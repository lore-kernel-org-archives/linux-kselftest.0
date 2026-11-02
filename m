Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659087;
	b=Vk/z8QYS1qq9Nfej2OwzamsAVnCY1pJxISpXZLsyZhxohJjPvPf+JikdtllsxWULWccv
	 fZzfviIbNXHT0d711R6xPTSJq+dDfeO78f3YrlEhKZCdEGkNm74LDUclIAS2JZgfNnvXA
	 JK7e4Jb0mIeCGc0PT1QHdvKmDxsT9969+0f7RatKol6rXK3Awckt8o0ZqMD92XSm4rpz0
	 w7sTj373Ixg5zpo1fjEcvurWmFKI5bqE3KmaV+52RSw3TSyuWpGcTh9RdKfnJeqf8MVz2
	 WLLQ7pgcuRlzm8lFmu8/9quLqq5AOqZpL6ggwmX/LPOFku2JHt4oJAH0JC1t6Y0UUKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=h+ZF210fax8HjS8szV9XHjrNkBuZH/bj1V8SNZNkYcY=;
	b=RV8yoZ79P8v5xIr4mKb2BpRERlrfkaLRUnbOQrskUAgO/KXH2o1K8K1p/LAwRgp23NbX
	 OPU58wSKk2zJNqMxfNwQyRoQFEusarFu0PNy2gsn2SFlVcGtaGc3Y87qulbyLVPd6QlvA
	 2bjFBQOmQZsyEaiC8+LgsjnsVmAggQHZC9IAMdFYciCl6EKoJHoLgjk+sexCMCb7kK8aE
	 EVx07XUUXbA9HkCUgF2PYWMp+NW5eRkRuwB1tdl6sOyi2CHk2KtS+emycOIbeNwg4NzGi
	 4CcNUhguEx62i1+UeliSPwlMeiDIM5NShfJd9aHXzmYntr7mIizzPJqNhamLvdkc35A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kvJUmZK9;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A156E606A326
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 22:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A156E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kvJUmZK9
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso1279954b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 14:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793659086; x=1794263886; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h+ZF210fax8HjS8szV9XHjrNkBuZH/bj1V8SNZNkYcY=;
        b=kvJUmZK9vmuMJAdL0K4EFwjLGSetSR58lljEn9BsFrCBTRaoiP+Q1QDXZTajenGWBW
         JC5oooWXUbO2abypveTsQu6paZzBPM0fC4UoUzM82GBbBxtnzIbtPgJsKTpVMfr+Wlp+
         Zjks5E32OWXwRfoMX6veCGB9+HBplceJGXbJsdd1Pt7jVsOjmZRYA4QYT4m1JPIdzz27
         BqC7LSsHg7jcOG1jNIIaqz8LnYOhtOv5KoMYd9u2gkUPvRcqquk5TfJRT+mqzTbwAU0D
         hQ+6E+jAwKRaGtpsRaXZZG/JIipaJt7k9BFt5sqsj18xnSIawpZM6gyf5w/WaD+SAtsg
         Cl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793659086; x=1794263886;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+ZF210fax8HjS8szV9XHjrNkBuZH/bj1V8SNZNkYcY=;
        b=r2Q1HIGCsGx2iK/y3t/XmpZ8WJl8uraQ2p2wkaI4KxRK/Zdrl1ISXp+hkj5w/gx1s9
         8y63cUSdOItO2XJ0UFmgcE+RLGe/QxMqwc/qTmMTVET6dIQjM/38BkxVjnPDlgOx0mV/
         x/hvsc1ptVlU+FXZ1TevYy8DHI50uDiXAxt5UkggT+svfk2lptuihZn9dqkuStmYib7e
         PaZBLDd20pJhINkdLz+OjXBvmzopcTExIe3dIl1VmrixDl+DTxj5j2J4M8sp8rIbEByN
         ltxh2R9zLYRvRwIu1y7jvhpNHDTMdd+5tHufhn8O8jsXmBDek8SGnh17oiIAUwmLNVWe
         iW6g==
X-Forwarded-Encrypted: i=1; AKwUvByQyXfTWfwzhFGpCAIO7EVbfOVkO7ChsTaLYf61zcpGhENkxVjhlPbsdLlTvgBd8uxmFb/ToWU3sn+mW4xg6gw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLHAG1lPJ2OsJPqm+9aB3xqfbHYz4jyGMEdd9O7WsDAfQ5Ex3f
	l7fO4MVa6kT96f/lx9jyCERZG+lBDqkbfGaMfmgcZuNB551ZOGzI0CeK
X-Gm-Gg: AYBFou1/H94J+HuOp2rOkJrCJvQJwksK6CBYi9ilvdsuaVv+n8Uia9Z5DIhgPy7tKOj
	gPNbeT9Wy+qwgYjXjRYPqmF0ELoW75o4txHJLMlub6rMI7fsShy9gT9i1PMeRqALA/R4LA8gVao
	a2X9pEdNoayiTqUtf+QixR0PC+DBRMHgXZ8MG4N0N4Po2Jrxy1gJUPnszP7rgI/2qmB9DTjHFrZ
	CbO8bdjgang6ac4jTImm3T+aBE8D2mZmCTY7L1O6/vQKCnqbdgQB2zcyEL51GJsQZ88CoSKwNa8
	ok1XtNhJ/TBYesWDF5CMLU0o65gv4Fdj7Tvobb5bTdvDSGH3Q9Knyr//ZQs184peGbhKwmVinYe
	1lKGyvBFXHnBXO2yTCFjCk3RyVdzfkwSZq5kIrYj0LekDTurmXrywXnfPXaP7wjhJVuIFtHl5KP
	zXZT0hpSosGstFMyiQ3q8G8xMAelACBl1FHJ4rkGJ90+rTKOPXZyhH7jUo99dDtfC8v4AaxuH3I
	e7WDT30F/VnGky5VppHwMFWAQ7t5yKL6d1BZ4+iLZCN67gK8xBhuRQM6wkLXrXiSVeX9QJyTupW
	ONR8UWnI6NZ1zHx2ZhNCy2YrtWYjKASlxzFywgpWAe/lnnyH8oSyn5jboouaLt1AyVKJfyKmgh5
	DW0kBmODvIwT1tok1jHrhcsQKea1MrWXJ4w==
X-Received: by 2002:a05:6a21:39a:b0:3de:b120:bb88 with SMTP id adf61e73a8af0-3e928b88d42mr9530537637.2.1793659085876;
        Mon, 02 Nov 2026 14:38:05 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aadac9c505sm2511972b3a.53.2026.11.02.14.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:38:05 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 22:38:05 +0000
Message-Id: <DML32WAB5JZD.1LR3JA1OYY6A5@gmail.com>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <john.fastabend@gmail.com>, <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <jose.marchesi@oracle.com>, <david.faust@oss.qualcomm.com>
Subject: Re: [PATCH bpf-next v3 4/8] selftests/bpf: make arena_base() opaque
 to GCC's -Warray-bounds
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Vineet Gupta" <vineet.gupta@linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <20261102220717.4079739-5-vineet.gupta@linux.dev>
References: <20261102220717.4079739-1-vineet.gupta@linux.dev> <20261102220717.4079739-5-vineet.gupta@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 02, 2026 at 02:07 PM Vineet Gupta <vineet.gupta@linux.dev> wrote:
> The barrier is behind #ifdef __clang__ so clang keeps the plain macro.
> It does not need it, and the barrier is not free: it blocks reuse of
> the map address, so each call site reloads it.  Across the five progs
> and 20 call sites that is +35 instructions under GCC
> (2528 -> 2563), about 1.4% on those objects and nothing elsewhere.
> Clang output is unchanged, bit for bit.

stream.c already has barrier_var() for both compilers.

How about this one instead:

diff --git a/tools/testing/selftests/bpf/libarena/include/bpf_arena_common.h b/tools/testing/selftests/bpf/libarena/include/bpf_arena_common.h
index 82aafe8..0eba529 100644
--- a/tools/testing/selftests/bpf/libarena/include/bpf_arena_common.h
+++ b/tools/testing/selftests/bpf/libarena/include/bpf_arena_common.h
@@ -49,7 +49,16 @@ void __arena* bpf_arena_alloc_pages(void *map, void __arena *addr, __u32 page_cn
 int bpf_arena_reserve_pages(void *map, void __arena *addr, __u32 page_cnt) __ksym __weak;
 void bpf_arena_free_pages(void *map, void __arena *ptr, __u32 page_cnt) __ksym __weak;

-#define arena_base(map) ((void __arena *)((struct bpf_arena *)(map))->user_vm_start)
+/*
+ * The map definition is smaller than struct bpf_arena.
+ * barrier_var() hides that from -Warray-bounds of GCC.
+ */
+#define arena_base(map)							\
+	({								\
+		struct bpf_arena *___arena = (void *)(map);		\
+		barrier_var(___arena);					\
+		(void __arena *)___arena->user_vm_start;		\
+	})

 #else /* when compiled as user space code */

diff --git a/tools/testing/selftests/bpf/progs/stream.c b/tools/testing/selftests/bpf/progs/stream.c
index 1ae015c..b4d88d0 100644
--- a/tools/testing/selftests/bpf/progs/stream.c
+++ b/tools/testing/selftests/bpf/progs/stream.c
@@ -178,16 +178,8 @@ __stderr("Call trace:\n"
 "|[ \t]+[^\n]+\n)*}}")
 int stream_arena_write_fault(void *ctx)
 {
-	struct bpf_arena *ptr = (void *)&arena;
-	u64 user_vm_start;
+	u64 user_vm_start = (u64)arena_base(&arena);

-	/* Prevent GCC bounds warning: casting &arena to struct bpf_arena *
-	 * triggers bounds checking since the map definition is smaller than struct
-	 * bpf_arena. barrier_var() makes the pointer opaque to GCC, preventing the
-	 * bounds analysis
-	 */
-	barrier_var(ptr);
-	user_vm_start = ptr->user_vm_start;
 	fault_addr = user_vm_start + 0x7fff;
 	bpf_addr_space_cast(user_vm_start, 0, 1);
 	asm volatile (
@@ -212,16 +204,8 @@ __stderr("Call trace:\n"
 "|[ \t]+[^\n]+\n)*}}")
 int stream_arena_read_fault(void *ctx)
 {
-	struct bpf_arena *ptr = (void *)&arena;
-	u64 user_vm_start;
+	u64 user_vm_start = (u64)arena_base(&arena);

-	/* Prevent GCC bounds warning: casting &arena to struct bpf_arena *
-	 * triggers bounds checking since the map definition is smaller than struct
-	 * bpf_arena. barrier_var() makes the pointer opaque to GCC, preventing the
-	 * bounds analysis
-	 */
-	barrier_var(ptr);
-	user_vm_start = ptr->user_vm_start;
 	fault_addr = user_vm_start + 0x7fff;
 	bpf_addr_space_cast(user_vm_start, 0, 1);
 	asm volatile (
@@ -252,17 +236,9 @@ int stream_arena_load_acquire_fault(void *ctx)
 		.off	 = 0x7fff,
 		.imm	 = 0x100,	/* BPF_LOAD_ACQ */
 	};
-	struct bpf_arena *ptr = (void *)&arena;
-	u64 user_vm_start, val;
+	u64 user_vm_start = (u64)arena_base(&arena);
+	u64 val;

-	/*
-	 * Prevent GCC bounds warning: casting &arena to struct bpf_arena *
-	 * triggers bounds checking since the map definition is smaller than
-	 * struct bpf_arena. barrier_var() makes the pointer opaque to GCC,
-	 * preventing the bounds analysis.
-	 */
-	barrier_var(ptr);
-	user_vm_start = ptr->user_vm_start;
 	fault_addr = user_vm_start + 0x7fff;
 	bpf_addr_space_cast(user_vm_start, 0, 1);
 	asm volatile (
@@ -296,17 +272,9 @@ int stream_arena_xchg_fault(void *ctx)
 		.off	 = 0x7fff,
 		.imm	 = 0xe1,	/* BPF_XCHG */
 	};
-	struct bpf_arena *ptr = (void *)&arena;
-	u64 user_vm_start, val;
+	u64 user_vm_start = (u64)arena_base(&arena);
+	u64 val;

-	/*
-	 * Prevent GCC bounds warning: casting &arena to struct bpf_arena *
-	 * triggers bounds checking since the map definition is smaller than
-	 * struct bpf_arena. barrier_var() makes the pointer opaque to GCC,
-	 * preventing the bounds analysis.
-	 */
-	barrier_var(ptr);
-	user_vm_start = ptr->user_vm_start;
 	fault_addr = user_vm_start + 0x7fff;
 	bpf_addr_space_cast(user_vm_start, 0, 1);
 	/*
@@ -346,17 +314,9 @@ int stream_arena_cmpxchg_fault(void *ctx)
 		.off	 = 0x7fff,
 		.imm	 = 0xf1,	/* BPF_CMPXCHG */
 	};
-	struct bpf_arena *ptr = (void *)&arena;
-	u64 user_vm_start, val;
+	u64 user_vm_start = (u64)arena_base(&arena);
+	u64 val;

-	/*
-	 * Prevent GCC bounds warning: casting &arena to struct bpf_arena *
-	 * triggers bounds checking since the map definition is smaller than
-	 * struct bpf_arena. barrier_var() makes the pointer opaque to GCC,
-	 * preventing the bounds analysis.
-	 */
-	barrier_var(ptr);
-	user_vm_start = ptr->user_vm_start;
 	fault_addr = user_vm_start + 0x7fff;
 	bpf_addr_space_cast(user_vm_start, 0, 1);
 	/*
