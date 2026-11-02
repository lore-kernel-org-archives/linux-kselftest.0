Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659170;
	b=PUqgKMkoQeeTavkmhbu5yPZ3IwAUuk4ms+E+Pk022tgivzBnJMf+NaUjMHAroek/bsm3
	 JZ16QBjDANGl4zjA6eXTpHhQeVL0H4uGmOFLugGIIDLJvE+yuoJSYfv84TRVOT21v3W23
	 evyqUUiRca6Urqi2/s7A7OrUbd4sgBIIn/NZGTBWYtBR5IOblQgRq27dfMKAm/5uUu6Az
	 jSAAoBw1Pfs/eHmOqJXfsHe4IGss0nPM4gW0BWXk1rlWWup9SyYiF/kMyPVcorDlXQxtH
	 V+owrYHsZy9eZy7TiDA8mGUKjC9sNA4hpYG/nnrF/ZtycaxZZmw3qwmIlCYSZHf0lWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=g5XH9GbJz9K+fVYPnTUbNJQlpMqHowMb6PcTtvYSgZI=;
	b=L/Fv8E0tKAVu3T04blrE3PUfmVzOEOjYZjXKQrxXqlKEcQ4A0+ylqfCY9V8dhbZtROm5
	 VZlc/TALGJOGNKJvw73mfXobPopTdgV7VwN7+TFq46aVlkWPUw1j1SDBW1l1wfL1q7zf0
	 zQz7ndCF1KFPYgZelVblePyA1ki2YlQUHNcpEkJfrltMCspy6dDVJqGAKYrOJR6JMyS+9
	 xkcISHtX0dMozW5l4uI7SQUKHKUrSPP8ESLc5R3cME7aRBgHPoHoDYmrW/50O0/iD76/9
	 1mGGwC+dTtuM4lhaKcMW0U5F8o4FHKHIvIirEbeK8v9oZwnb7MNWUyjfbuhmg+Bt49g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TcEd7U/O";
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C61606A326
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 22:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C61606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TcEd7U/O
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e96502e447so32517865ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 14:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793659170; x=1794263970; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g5XH9GbJz9K+fVYPnTUbNJQlpMqHowMb6PcTtvYSgZI=;
        b=TcEd7U/OlX9LtOACLuuXqCzdGJudg5Zgsu1EbOUHl9QNKsN9rYg9VC12+7rRNq/Ucz
         ggPJ6ZimxlwljXZP1HsCZNkoeRFGPRjet25kBqeEe6b0bOvanrabymWZJz+twDr8wtv4
         esVOFrnCySx2Ll71Jr77+jsIdowHwmo6U1jbQixI4fASKllbYpN9QKxHkDKrPxEAXnlz
         pMGwrT6Z/OYHvrdf7SQQoY27hamdyv0F/tRTerGGEjheN1kAdmuPQ9F2R+tTLIh89WuY
         9IWk7NmzmTMKhks8aEfQDq3CdY3SMMaUt5PV608w4pLbQsiMRBPg7tpMnaTQbj/NfZEo
         0qHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793659170; x=1794263970;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5XH9GbJz9K+fVYPnTUbNJQlpMqHowMb6PcTtvYSgZI=;
        b=nGPHOcXy2WEIBR+pZMn/kBDIsRt1aZAz9xouqMGQz/lbwlWk93qCPFV6ubPT+f5jRX
         Uw99RKLEbdPS7xkTdwwfKAuGbOLLYSeRcm2OGYMULqav4maz/ayAZC4s3/ch2XaggTuF
         N4vD/9AqJwQbQFAND++YeXiJYbuW0B5OWa00+Sk3d8ez12tEe/uiQveIFxT3uPVNo0Hq
         WjzMsFxboaNh0S368xi9hOiQr9/DCf9OTUmYc7ORc2hwcmlu8PzVmOHHzca+BbrIK/5a
         5U1CW7Os+u+x4lhsUFJ+HNbPTUmkd/pI9ahArqjgi1Xziqw3avbDYZcKyTDMfJdo4Em9
         YJoA==
X-Forwarded-Encrypted: i=1; AKwUvByPkaV/PkZwZikpI213CRvrqJx94luEkh9UugLHFyfaQG2W57VgM2mUS+q6b7LKH+VkGj3Iv9hI6yXXUO/m7Lk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RdKfOCR92JeXve2NDMTI80FNAnV0lsDy4Ve4E+ZODtuBL4j0e
	FJOn64m+atqNNRlld8fMtAoKEwPV2X//CBjMdDGXUKwB3V2BDCkKnuTY
X-Gm-Gg: AYBFou0OrChLqjcfN//4DLoJzSpBry2b9Z68hzoJlCjaXL8tPKUBHFLP25AVGKU1Ttq
	aAaedVJ4uESOZnSs7nlL+V2eje5Zovqja2wow3eBclfanbgdJzWaE3vGDlCCngGJH2PmntgnUCF
	jQxzjs1eEYV/HgZsqLh+7kWwJtl1mbCZtsG9o0tEPVUiibbS0RKNvTcsuFj768hFuzOy0kLySTg
	E+dpGde9SLuTXwHw/uEuCN9hvybLlWa9EpPqMAp8/Ujvi4XY91duq5cgXw2F+ynF5dVNhi02WjW
	z0MJngkNgv6T6CGmyno2t+4HnGRKmTqOVgxpN7lriWi0H4f8ax9vrEu4OKlMqA9efXSDjALo0+0
	aN3w1+vkEwJ31yLju54kyY8EK6b85tAQZjzxfP8fGP58U19et3dkRgZPQ/az70YMaw61SuLO2nt
	E/MM25ALf/wGKHRJhe4cyM21o2uXkTSTB4dGiuCUW2kO8yNV+jZqZWkvPhpdi9Ayq0P1bAP70L7
	mL2cIIFxNKUUWgoebHe+dqgGEgD0PWbzW+DdgCK5QrT95OVoRCTeAtmW6+7p1921+HyqINxmo4t
	iL60vD3JHk4p57Vq8TA7WGuEft7o8WMkWHHpDfc/HAgg0o0VQ+sjhteeJtG+ulPjb/b52l0vcDq
	G2x8ZknLfGzFy29B68e30SqPkOdV3ig3HPw==
X-Received: by 2002:a17:902:d485:b0:2dd:c053:a6ee with SMTP id d9443c01a7336-2eb364ce5e3mr104247515ad.32.1793659169696;
        Mon, 02 Nov 2026 14:39:29 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052edasm32812155ad.4.2026.11.02.14.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:39:29 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 22:39:28 +0000
Message-Id: <DML33YRVJEMW.2HUSMGKYHA4HT@gmail.com>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <john.fastabend@gmail.com>, <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <jose.marchesi@oracle.com>, <david.faust@oss.qualcomm.com>
Subject: Re: [PATCH bpf-next v3 8/8] selftests/bpf: skip the struct_ops
 arena tests without compiler support
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Vineet Gupta" <vineet.gupta@linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <20261102220717.4079739-9-vineet.gupta@linux.dev>
References: <20261102220717.4079739-1-vineet.gupta@linux.dev> <20261102220717.4079739-9-vineet.gupta@linux.dev>
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
> These are not driven by test_loader, so __skip_without_arena does not
> reach them.  Use the flag-in-.data pattern linked_externs.c already
> uses for the same situation: the program exports skip_tests, and the
> host checks it before attaching and reports SKIP.

cast_kern() is cleaner...
It's a nop when the compiler supports arena.

diff --git a/tools/testing/selftests/bpf/progs/struct_ops_arena.c b/tools/testing/selftests/bpf/progs/struct_ops_arena.c
index 8aa8639..3fffa24 100644
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
index 495faa0..3455ca9 100644
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
index a2218cd..afbe59f 100644
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
index 09b4c74..c4e134e 100644
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
