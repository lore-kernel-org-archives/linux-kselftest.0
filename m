Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DD53ED5DE
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774950072; cv=none; b=rbSZSGw33joXUJWp5Ky8zgVJ3euATv32P6a+2Ul7ouOuwqi4EYm26KIY/cuOtVlqV5vfa8LwGbDCPVquoslcGSAgsqZ6XuhOBtg/nwS/xVo3Qw6omBD1ILaZjrXJCVIUULA1J+4WjGi+rcqQpRMUDeq/fZUR8E/i+8PjWnrVAgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774950072; c=relaxed/simple;
	bh=zjNVLLXf4FRHJi7xCfsZ+zGLUv7oWEI5xrhgjiSQRC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oWOp44XzycdD9i40QkoQqPv2v84a0oLjex3s/aEcZO2IoK5scanKP0OJrdWoPrKyoObWXEYgh53G192DvoYxaXrwueG83nxPA9SEpNOML9mAxMiWRFYwheqLFqNXfhK6+Q+KaaCI2OoN21mxL8Q+h0MKFF6iowjeXQcomQczKQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NGa2xUSe; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NGa2xUSe"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48704db565eso69574325e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 02:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774950068; x=1775554868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyqEXQLqFypyPuwNGUA2n6cHuK6us3URoKl8kCVt9ls=;
        b=NGa2xUSeCkijHWUQ4SEODgDs4eyiM/buangUwXWG0DoIJsFrEyZLw9glFQ/0r1daUD
         9svMB4v8WJMgMHQRO3MbRrnKk1vMcYG/oewh01uF7bMhFbl66K6mDKSH8SNyZTU0QKzg
         Qe0D+QQ6W4vMK6ua7R92/rQ6CpW+DJXBfpb7d2nBMN6iQEf60Qqi4aYX0uR2I6GVgBwx
         inf4NmoffbyCx9zUCQQ6UlsjQxdMbm3Bl/cGgN2m+PxaSTi+Vn9TM9M74jv//QIefMa/
         IlGuVVspisUwVE46ZHt79jfCXMO5fxKwyko90hY8J/LmRD9Kosaz6V+EXKxjnvnh3s0c
         LyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774950068; x=1775554868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YyqEXQLqFypyPuwNGUA2n6cHuK6us3URoKl8kCVt9ls=;
        b=F8CzK04ontTNUrq1l6PfaJtfcJxRaCwWyPlztmvRfHzBDQQrbMnMAPcxTetFQ5n40n
         HKi2Z+oRP2Go5aMC+7Y9smJ4s/KPprEYSlC+TZI4NK8bgmAdhUfuvdI+m3+nZw3wxW+f
         qXEG4i5BK6pco69iZPeHm60bwdQUI+g9SGbI5/VUOW8HJbMa82c9F+JGhfUQh12Jx/oN
         j+GiC9sBVaywL8+ilSzb08pdSc07R7TFXSVYNKet9X6LYS95BBxRfMY/MQVbw06pTYks
         fOMUUl2a40MG9ZuypdFh+44L1PZ/uT8hsPpGVuq56TpuUrmXX6fe48ECQ7E9sepQ139Y
         65gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW0UhaVC8iGaTosgmxZq+399RrT4CAc4oZjT2qJ/Kfo5Ii0CbYncE4FHeDLtmhgCCKOfk51uVfQPvT4Rff1JE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcL8HAE+kzYaKDaOv2FEwIh89zfKbnu6uwZgVQQm5jxKrdLI+z
	VosS7/eSeaURdVgZjFjy4DPpJ0hPDj9qed1PLM8FPD94G3CHBCmuiefVQz8eOIeF/0t7tsa2sB2
	kKgEP3pE=
X-Gm-Gg: ATEYQzxJxn3rri77ZKGGERji7RtRHyqSqZzqgm0ADtB2wyADssPlpiaTi6+kKR5Lmyg
	qROxOkcvraocY2Pu3VG8kcRwxf2AMUZx/TDLKKMSLrXV4HviWJiP59dKyGNtTM3OPL5ZYn2Jken
	LJcvwjTC023PUGw4ll4ctllfNwBYcDKyj1FzAZxcAT8lefv6PrkrsubxegrDsaTY2z5ZWIv9zE3
	I4/1cij3B1FKP5O1NWhZFOQnhzpZ6FHg4m5KCqSGfhOoERHu6U7gxNV3GxnmvRmNv+TOCvnbsZE
	AZ/Zns+ajPCxixFizdK+ZoB0U8+ay1riG7BpMm0/EEVi8DYkfAyG3jw2RFRqVo9zFagAGFxdzag
	B7rbzjA+RU6QrF0A7Mo/NQV/3BrrsqLHodxOFy4AYrMEEt/CTLea3QF7QTobNRbVNN52yojERZ5
	Q4r6j5kqqa/xalIqOKBwdmprGDsx7gxnMkx46YsijSBEN5Fdbga9lke0Me9UmRYw==
X-Received: by 2002:a05:600c:1d1f:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-48727eb81bbmr291469285e9.17.1774950067635;
        Tue, 31 Mar 2026 02:41:07 -0700 (PDT)
Received: from f16.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427afbe0sm130079565ad.72.2026.03.31.02.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:41:06 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 1/2] libbpf: clarify raw-address single kprobe attach behavior
Date: Tue, 31 Mar 2026 18:37:46 +0900
Message-ID: <20260331094058.49229-2-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260331094058.49229-1-hoyeon.lee@suse.com>
References: <20260331094058.49229-1-hoyeon.lee@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bpf_program__attach_kprobe_opts() documents single-kprobe attach
through func_name, with an optional offset. For the PMU-based
non-legacy path, func_name = NULL with an absolute address in offset
already works as well, but that is not described in the API.

This commit clarifies this existing non-legacy behavior. For PMU-based
attach, callers can use func_name = NULL with an absolute address in
offset as the raw-address form. For legacy tracefs/debugfs kprobes,
reject this form explicitly.

Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
---
 tools/lib/bpf/libbpf.c | 33 ++++++++++++++++++++++++---------
 tools/lib/bpf/libbpf.h |  3 ++-
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 9ea41f40dc82..8cf90a073455 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -28,6 +28,7 @@
 #include <asm/unistd.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/kallsyms.h>
 #include <linux/bpf.h>
 #include <linux/btf.h>
 #include <linux/filter.h>
@@ -11523,7 +11524,8 @@ static int determine_uprobe_retprobe_bit(void)
 #define PERF_UPROBE_REF_CTR_OFFSET_SHIFT 32
 
 static int perf_event_open_probe(bool uprobe, bool retprobe, const char *name,
-				 uint64_t offset, int pid, size_t ref_ctr_off)
+				 uint64_t offset_or_addr, int pid,
+				 size_t ref_ctr_off)
 {
 	const size_t attr_sz = sizeof(struct perf_event_attr);
 	struct perf_event_attr attr;
@@ -11558,7 +11560,7 @@ static int perf_event_open_probe(bool uprobe, bool retprobe, const char *name,
 	attr.type = type;
 	attr.config |= (__u64)ref_ctr_off << PERF_UPROBE_REF_CTR_OFFSET_SHIFT;
 	attr.config1 = ptr_to_u64(name); /* kprobe_func or uprobe_path */
-	attr.config2 = offset;		 /* kprobe_addr or probe_offset */
+	attr.config2 = offset_or_addr;	 /* kprobe_addr or probe_offset */
 
 	/* pid filter is meaningful only for uprobes */
 	pfd = syscall(__NR_perf_event_open, &attr,
@@ -11648,6 +11650,15 @@ static void gen_probe_legacy_event_name(char *buf, size_t buf_sz,
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
 				   const char *kfunc_name, size_t offset)
 {
@@ -11781,6 +11792,7 @@ bpf_program__attach_kprobe_opts(const struct bpf_program *prog,
 				const struct bpf_kprobe_opts *opts)
 {
 	DECLARE_LIBBPF_OPTS(bpf_perf_event_opts, pe_opts);
+	char probe_target[KSYM_NAME_LEN + 32];
 	enum probe_attach_mode attach_mode;
 	char *legacy_probe = NULL;
 	struct bpf_link *link;
@@ -11816,6 +11828,11 @@ bpf_program__attach_kprobe_opts(const struct bpf_program *prog,
 	default:
 		return libbpf_err_ptr(-EINVAL);
 	}
+	if (!func_name && legacy)
+		return libbpf_err_ptr(-ENOTSUP);
+
+	gen_kprobe_target(probe_target, sizeof(probe_target),
+			  func_name, offset);
 
 	if (!legacy) {
 		pfd = perf_event_open_probe(false /* uprobe */, retprobe,
@@ -11835,21 +11852,19 @@ bpf_program__attach_kprobe_opts(const struct bpf_program *prog,
 						    offset, -1 /* pid */);
 	}
 	if (pfd < 0) {
-		err = -errno;
-		pr_warn("prog '%s': failed to create %s '%s+0x%zx' perf event: %s\n",
+		err = pfd;
+		pr_warn("prog '%s': failed to create %s '%s' perf event: %s\n",
 			prog->name, retprobe ? "kretprobe" : "kprobe",
-			func_name, offset,
-			errstr(err));
+			probe_target, errstr(err));
 		goto err_out;
 	}
 	link = bpf_program__attach_perf_event_opts(prog, pfd, &pe_opts);
 	err = libbpf_get_error(link);
 	if (err) {
 		close(pfd);
-		pr_warn("prog '%s': failed to attach to %s '%s+0x%zx': %s\n",
+		pr_warn("prog '%s': failed to attach to %s '%s': %s\n",
 			prog->name, retprobe ? "kretprobe" : "kprobe",
-			func_name, offset,
-			errstr(err));
+			probe_target, errstr(err));
 		goto err_clean_legacy;
 	}
 	if (legacy) {
diff --git a/tools/lib/bpf/libbpf.h b/tools/lib/bpf/libbpf.h
index 0be34852350f..f75f3ab0f20c 100644
--- a/tools/lib/bpf/libbpf.h
+++ b/tools/lib/bpf/libbpf.h
@@ -557,7 +557,7 @@ struct bpf_kprobe_opts {
 	size_t sz;
 	/* custom user-provided value fetchable through bpf_get_attach_cookie() */
 	__u64 bpf_cookie;
-	/* function's offset to install kprobe to */
+	/* function offset, or raw address if func_name == NULL (non-legacy) */
 	size_t offset;
 	/* kprobe is return probe */
 	bool retprobe;
@@ -565,6 +565,7 @@ struct bpf_kprobe_opts {
 	enum probe_attach_mode attach_mode;
 	size_t :0;
 };
+
 #define bpf_kprobe_opts__last_field attach_mode
 
 LIBBPF_API struct bpf_link *
-- 
2.52.0

