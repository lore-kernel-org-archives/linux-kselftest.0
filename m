Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B6C334C00
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Mar 2026 14:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774709863; cv=none; b=cZz0ZZd+PUGx8vzMrOtNKWYCbMG2TaYelFhPP2f8tqvKhnz8eltccwy/VNYY+VRDI0Rhfr3OaXygAo6wCs6lHD2bd8yaWKwAR8Q9aRQrWBc9wS/Ut+ytP9/H1I82EZC6Q0/ypjacpYH8azIv0wzeAQEiYXCLaYfdY3VLF9YUDUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774709863; c=relaxed/simple;
	bh=yL8Td9UZA88O3o7r3JW+BpHaCJ4yxltbSa4UhiL9gIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/SoBRSXgrDPXoGoYjseXvHL3EeBrhKA/7bKd5rgF5wx8zCiAijGrkv5en2lGIdMoiSdDEbfetc69s8DrSCTPYoaP8r103mPgN1pBukwsbrrEidYHZ0laCwzfk2W3urIYObYP8J+fnenw8QCg/YEPBJSJ5FmtgA/TJ0RrW2C9e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=c6GVIEwI; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="c6GVIEwI"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9a0762ed5fso422089866b.1
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Mar 2026 07:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774709860; x=1775314660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPuSW6pRsFeFjtweuNOAKbGLGRJBOpgP+7O/NYd7b34=;
        b=c6GVIEwIuUu0yxejbbxTQ8aJMesuCzNpE5nAzx3nZWo4Nkv+hdD9CxwNyBOcYpRHbE
         4jiKqLARJ/IjcTKLhSZTZDkrBS0XFAk7QjTh6LNgZBt99Mgp/wdicb1SqBMH8pIPqzTT
         mOanKxzcMpZgm4MqBjHd+hA+OBYXpVNJS6wFQJa95Qaaii4x0KfguSA0zKKrE8tWgUDh
         ZRgLd+1CmPn3wtKEy9a3h0TaIsozX59Yto4K2IazXczw7Fr7pD1Gp+IDqtnqbJ0yJ9uY
         sufmDF9FH0nt3jFJreIk25grgkbD3OL84rKAhTMi/lv4jYTJaXoWB6SYZ/OSaB7ROTXF
         /D3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774709860; x=1775314660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lPuSW6pRsFeFjtweuNOAKbGLGRJBOpgP+7O/NYd7b34=;
        b=UQjduaKyGDrxr9/jJqq1mHGfjPdFYY9oQVAS0atGUh4iYCBGgw7k9OoAxQV6v9xR16
         rGD/8I+RMNUqdcNSbmbswG/bYfZ+Lc9RJ5e/uOHl3Gt/FhUg4HtnHcRPWYOkLMGhGSN4
         qRyXLnPsRHaBnMsiN+q0HU7h0UssUX9/zwMp4pYqoC2x/wwq3ttspyf7J4CEkaOf1g0v
         XYFKro2yXFqfe+odOK/VJXejUfuDgbLIHEGK7yeGbxi3KFOat/j7lws+bFgugLVqNtYl
         rbQPH2jOg6ACD7XLVR7xvRWC6EebtF9QuJngyehHgoTb/vFvgCj0rahJ7M1TkEbr0jrg
         JSlg==
X-Forwarded-Encrypted: i=1; AJvYcCVOaos35brmQtwCD3xJ4qiGF8y601CNdmoSwUdlmR2ae7qnUpn/Q6SNP0y6Da9nmxBGEG6jPyJCclkNvdOQEhU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1HNGjs2cWzNjQK8I0lyM60D62N27JcFK9NFlWfrBTpVM8s/eI
	IqbGz9BMKFF4ULY/mo/Eccps6+q7v+GoXnjo5LrQtuQamR8DW9Z+YWM+w6irzCTMQIj4+YU7Nin
	I7cPvIVM=
X-Gm-Gg: ATEYQzz7LRslGdYSdFxHzQOjwY15Mkj1+gHVsRZh7JTTvZ8dgbUMbvCQxorB2pJUh+e
	icQThutW4Sag4cFuEZf5JlG+Pb52EMMz39jdn3N23wMO6fSykvCB9B9bXJ9bVq8gosXlf6JjWEb
	iKQxsPOvuCkuAfVmx5kv8TA3XusRz8laXTU8GDCYK2N7J2iIE11utxHgQsKnOF6PRBtaaGTkNin
	HAukJtaLoDhLTFJ4S2Jkodbqh10a/FV+OQ+tAoo4gUe/Xev2rGbw1BG0ZwaFtCNBfqfLHW7LCuQ
	041PxBzskPKOFD32izV02ajhb1x8z1VOyuEKWaQMPqCaOfMaw1B8Poihf8DRtGOzitjFFIDj3Y/
	QPqyq84PkRtrU+7tGrZfCWRE9JrMbZEL3cxm6+G62Cl8td5WJgspuglYxoZtfq8BOe6i+LHPHKf
	b4TnMABJ4Z0G/0uG5mma0EiXlwlYp3qI579jtfGoetkf48xlc+TLHxzqppafCX1g==
X-Received: by 2002:a05:600c:5956:b0:486:fe08:639a with SMTP id 5b1f17b1804b1-48722b813a4mr110789345e9.4.1774708012383;
        Sat, 28 Mar 2026 07:26:52 -0700 (PDT)
Received: from f16.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916da892sm1874017a12.14.2026.03.28.07.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 07:26:51 -0700 (PDT)
From: Hoyeon Lee <hoyeon.lee@suse.com>
To: bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Feng Yang <yangfeng@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 1/2] libbpf: allow address-based single kprobe attach
Date: Sat, 28 Mar 2026 23:26:08 +0900
Message-ID: <20260328142643.627560-2-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260328142643.627560-1-hoyeon.lee@suse.com>
References: <20260328142643.627560-1-hoyeon.lee@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bpf_program__attach_kprobe_opts() currently attaches a single kprobe only
by func_name, with an optional offset. This covers only the symbol-
based form, not the raw-address form that the kernel already supports
for both kprobe PMU events and legacy tracefs/debugfs kprobes. Callers
that already have a target IP still have to drop down to
perf_event_open() or direct tracefs writes.

libbpf already exposes address-based attach for kprobe_multi through
bpf_kprobe_multi_opts.addrs. This commit adds bpf_kprobe_opts.addr so
that single kprobes can be attached either by func_name + offset or by
raw address.

Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
---
 tools/lib/bpf/libbpf.c | 77 +++++++++++++++++++++++++++++-------------
 tools/lib/bpf/libbpf.h |  5 ++-
 2 files changed, 57 insertions(+), 25 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 9ea41f40dc82..a49ea01288ad 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -11523,7 +11523,7 @@ static int determine_uprobe_retprobe_bit(void)
 #define PERF_UPROBE_REF_CTR_OFFSET_SHIFT 32
 
 static int perf_event_open_probe(bool uprobe, bool retprobe, const char *name,
-				 uint64_t offset, int pid, size_t ref_ctr_off)
+				 uint64_t offset_or_addr, int pid, size_t ref_ctr_off)
 {
 	const size_t attr_sz = sizeof(struct perf_event_attr);
 	struct perf_event_attr attr;
@@ -11558,7 +11558,7 @@ static int perf_event_open_probe(bool uprobe, bool retprobe, const char *name,
 	attr.type = type;
 	attr.config |= (__u64)ref_ctr_off << PERF_UPROBE_REF_CTR_OFFSET_SHIFT;
 	attr.config1 = ptr_to_u64(name); /* kprobe_func or uprobe_path */
-	attr.config2 = offset;		 /* kprobe_addr or probe_offset */
+	attr.config2 = offset_or_addr;	 /* kprobe_addr or probe_offset */
 
 	/* pid filter is meaningful only for uprobes */
 	pfd = syscall(__NR_perf_event_open, &attr,
@@ -11633,13 +11633,14 @@ static const char *tracefs_available_filter_functions_addrs(void)
 }
 
 static void gen_probe_legacy_event_name(char *buf, size_t buf_sz,
-					const char *name, size_t offset)
+					const char *name, uint64_t offset_or_addr)
 {
 	static int index = 0;
 	int i;
 
-	snprintf(buf, buf_sz, "libbpf_%u_%d_%s_0x%zx", getpid(),
-		 __sync_fetch_and_add(&index, 1), name, offset);
+	snprintf(buf, buf_sz, "libbpf_%u_%d_%s_0x%" PRIx64, getpid(),
+		 __sync_fetch_and_add(&index, 1), name ?: "addr",
+		 offset_or_addr);
 
 	/* sanitize name in the probe name */
 	for (i = 0; buf[i]; i++) {
@@ -11648,13 +11649,27 @@ static void gen_probe_legacy_event_name(char *buf, size_t buf_sz,
 	}
 }
 
+static void gen_kprobe_target(char *buf, size_t buf_sz, const char *name,
+			      uint64_t offset_or_addr)
+{
+	if (name)
+		snprintf(buf, buf_sz, "%s+0x%" PRIx64, name, offset_or_addr);
+	else
+		snprintf(buf, buf_sz, "0x%" PRIx64, offset_or_addr);
+}
+
 static int add_kprobe_event_legacy(const char *probe_name, bool retprobe,
-				   const char *kfunc_name, size_t offset)
+				   const char *kfunc_name, uint64_t offset_or_addr)
 {
-	return append_to_file(tracefs_kprobe_events(), "%c:%s/%s %s+0x%zx",
+	char probe_target[128];
+
+	gen_kprobe_target(probe_target, sizeof(probe_target), kfunc_name,
+			  offset_or_addr);
+
+	return append_to_file(tracefs_kprobe_events(), "%c:%s/%s %s",
 			      retprobe ? 'r' : 'p',
 			      retprobe ? "kretprobes" : "kprobes",
-			      probe_name, kfunc_name, offset);
+			      probe_name, probe_target);
 }
 
 static int remove_kprobe_event_legacy(const char *probe_name, bool retprobe)
@@ -11674,24 +11689,27 @@ static int determine_kprobe_perf_type_legacy(const char *probe_name, bool retpro
 }
 
 static int perf_event_kprobe_open_legacy(const char *probe_name, bool retprobe,
-					 const char *kfunc_name, size_t offset, int pid)
+					 const char *kfunc_name, uint64_t offset_or_addr, int pid)
 {
 	const size_t attr_sz = sizeof(struct perf_event_attr);
 	struct perf_event_attr attr;
 	int type, pfd, err;
+	char probe_target[128];
 
-	err = add_kprobe_event_legacy(probe_name, retprobe, kfunc_name, offset);
+	gen_kprobe_target(probe_target, sizeof(probe_target), kfunc_name,
+			  offset_or_addr);
+
+	err = add_kprobe_event_legacy(probe_name, retprobe, kfunc_name,
+				      offset_or_addr);
 	if (err < 0) {
-		pr_warn("failed to add legacy kprobe event for '%s+0x%zx': %s\n",
-			kfunc_name, offset,
+		pr_warn("failed to add legacy kprobe event for '%s': %s\n", probe_target,
 			errstr(err));
 		return err;
 	}
 	type = determine_kprobe_perf_type_legacy(probe_name, retprobe);
 	if (type < 0) {
 		err = type;
-		pr_warn("failed to determine legacy kprobe event id for '%s+0x%zx': %s\n",
-			kfunc_name, offset,
+		pr_warn("failed to determine legacy kprobe event id for '%s': %s\n", probe_target,
 			errstr(err));
 		goto err_clean_legacy;
 	}
@@ -11784,6 +11802,9 @@ bpf_program__attach_kprobe_opts(const struct bpf_program *prog,
 	enum probe_attach_mode attach_mode;
 	char *legacy_probe = NULL;
 	struct bpf_link *link;
+	uint64_t offset_or_addr;
+	char probe_target[128];
+	unsigned long addr;
 	size_t offset;
 	bool retprobe, legacy;
 	int pfd, err;
@@ -11794,8 +11815,18 @@ bpf_program__attach_kprobe_opts(const struct bpf_program *prog,
 	attach_mode = OPTS_GET(opts, attach_mode, PROBE_ATTACH_MODE_DEFAULT);
 	retprobe = OPTS_GET(opts, retprobe, false);
 	offset = OPTS_GET(opts, offset, 0);
+	addr = OPTS_GET(opts, addr, 0);
+	offset_or_addr = func_name ? offset : addr;
 	pe_opts.bpf_cookie = OPTS_GET(opts, bpf_cookie, 0);
 
+	if (!!func_name == !!addr)
+		return libbpf_err_ptr(-EINVAL);
+	if (addr && offset)
+		return libbpf_err_ptr(-EINVAL);
+
+	gen_kprobe_target(probe_target, sizeof(probe_target), func_name,
+			  offset_or_addr);
+
 	legacy = determine_kprobe_perf_type() < 0;
 	switch (attach_mode) {
 	case PROBE_ATTACH_MODE_LEGACY:
@@ -11819,26 +11850,25 @@ bpf_program__attach_kprobe_opts(const struct bpf_program *prog,
 
 	if (!legacy) {
 		pfd = perf_event_open_probe(false /* uprobe */, retprobe,
-					    func_name, offset,
+					    func_name, offset_or_addr,
 					    -1 /* pid */, 0 /* ref_ctr_off */);
 	} else {
 		char probe_name[MAX_EVENT_NAME_LEN];
 
 		gen_probe_legacy_event_name(probe_name, sizeof(probe_name),
-					    func_name, offset);
+					    func_name, offset_or_addr);
 
 		legacy_probe = strdup(probe_name);
 		if (!legacy_probe)
 			return libbpf_err_ptr(-ENOMEM);
 
 		pfd = perf_event_kprobe_open_legacy(legacy_probe, retprobe, func_name,
-						    offset, -1 /* pid */);
+						    offset_or_addr, -1 /* pid */);
 	}
 	if (pfd < 0) {
-		err = -errno;
-		pr_warn("prog '%s': failed to create %s '%s+0x%zx' perf event: %s\n",
-			prog->name, retprobe ? "kretprobe" : "kprobe",
-			func_name, offset,
+		err = pfd;
+		pr_warn("prog '%s': failed to create %s '%s' perf event: %s\n",
+			prog->name, retprobe ? "kretprobe" : "kprobe", probe_target,
 			errstr(err));
 		goto err_out;
 	}
@@ -11846,9 +11876,8 @@ bpf_program__attach_kprobe_opts(const struct bpf_program *prog,
 	err = libbpf_get_error(link);
 	if (err) {
 		close(pfd);
-		pr_warn("prog '%s': failed to attach to %s '%s+0x%zx': %s\n",
-			prog->name, retprobe ? "kretprobe" : "kprobe",
-			func_name, offset,
+		pr_warn("prog '%s': failed to attach to %s '%s': %s\n",
+			prog->name, retprobe ? "kretprobe" : "kprobe", probe_target,
 			errstr(err));
 		goto err_clean_legacy;
 	}
diff --git a/tools/lib/bpf/libbpf.h b/tools/lib/bpf/libbpf.h
index 0be34852350f..526d44111e81 100644
--- a/tools/lib/bpf/libbpf.h
+++ b/tools/lib/bpf/libbpf.h
@@ -563,9 +563,12 @@ struct bpf_kprobe_opts {
 	bool retprobe;
 	/* kprobe attach mode */
 	enum probe_attach_mode attach_mode;
+	/* kernel address to install kprobe to; mutually exclusive with func_name */
+	unsigned long addr;
 	size_t :0;
 };
-#define bpf_kprobe_opts__last_field attach_mode
+
+#define bpf_kprobe_opts__last_field addr
 
 LIBBPF_API struct bpf_link *
 bpf_program__attach_kprobe(const struct bpf_program *prog, bool retprobe,
-- 
2.52.0

