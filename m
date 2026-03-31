Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED534035CA
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970726; cv=none; b=asjhpJiIVOLUPc/KiPyg/XrCy6wQxQK3ZPHjtu/tYP4NhVoSix+qpIW3oYhJdcbwXEPcv8TVHMBjh2RvJuRWSHw3rLgkFHXQLIO7K7iO+kqvrAhLFXNJ3pFGJYeGDet/QowZ0edO+YnrzmFve+hnQXCZ76glQ9LntIEcwZ0ooyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970726; c=relaxed/simple;
	bh=387H1xti8ra1VEGk2s6IjY9AeXDEy+hfE2xNg++8Ljg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LX/cwrwLyYQNmumDr+HAh/Y+gGAiOzzdikTxhZzEGc6nAOLAWHpW9N9ewzLPMSA1D1hSnmF0FKtRBFVSTQyPU/2oUD2ds61VUt41x7U1pxHGujHTu2GWju6lYwuHaLqmA/yW8bf/6pOL4FoOMCBqIsyq3KgKlRrTC6Lit0UJR/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q1APwItA; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q1APwItA"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9358dd7f79so33206566b.1
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 08:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774970719; x=1775575519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l28j6iJn6Eh1/pQq6D7Ym9WMmjNwSYO0NcwG/PxrV74=;
        b=Q1APwItAXWpfEFqcL6wrLaOtxDDsw4M3iozqHQKF31FTqZH0IRYwuPXw9bIwym0Eu7
         jtz0msRcnto0LOFR9CZhhUZKuSVxXpNmk1Ltra64BjzVB5pqnyP8GMto+sfHZx6qTWOy
         xLjhNFFRCVhWuu1oinN+VxOeKHE5ba1q1zZo7ZjOeCr8sl3yryzY9fsOADIuPsfKuv3g
         c7vXHCgO50Fj+KX9+/NN7TK71Z9fXsaEPjYKaHkr0pOe7yshst4z0P8HEaKEl0QIl8AD
         1rjXvB4pXLjJWbJ358Hb4PWnxHVjEwXaX/ldvK2OGRcZZQzH2Sh3Vr33msqF62RPIjfS
         Z9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774970719; x=1775575519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l28j6iJn6Eh1/pQq6D7Ym9WMmjNwSYO0NcwG/PxrV74=;
        b=Bo2iiFOJKMymxrZkSWrknBt9wA8+LpUSeLL0YJS7PRyTAGMULZ0qKlfBV/k3ElOjVi
         3JYAeMLpS97uabCDLc1ss1/DG5AsD0iAww4I/pND/PADUW40hxWunMwPT/mM3GRwdWDL
         SlceKM5twBE1AOLHIsvEnpFHw9Nfu+EMlS77U3RCVn9vQou4nFUXiRfbmtMtwxhCvLkQ
         wjUrxR//xlQv+DuWNX3fMCqGwk0JHdKtcfxet0za3yrBedihPOkhoUCqzY2QqZ6kwF0A
         74pXnYrzUotvNSqHqx/6qb6l6hjA308DmxwRldqmR/uI3jdje8yAKySKwcr9Ahyyd/+i
         SRGg==
X-Forwarded-Encrypted: i=1; AJvYcCUfnfmbaOYGes1N+x7EF+HNDY9KHKUL9n4mmfwhkeGEgtiwytNbiaY7pzA8yuNNWI6rYF8HScrUK39lIrNFei0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuersU93g2FHU/P8sa3xMuvSvEiE90ST2oaBrJT0J0ALVY2hA0
	RynsPhCbk0cv44uz3f84VRrnznxyl8Dk0xvvS0jBwfAdtbqZcN3GRvSu0s4gDg6XUvY=
X-Gm-Gg: ATEYQzyHq+D+kMle4aolHgRzHHpPbXATHWKJNEfCqK+9wDepOJc4QDxnARKAd7L4vbc
	0yuq0/kQ57oGJfMMmuMVg3cR2ZNF+byOAJWJQsYHvMTyxdvbDAmVhbBpFTGHIgVt0KbYVfLlitG
	cqNOnMGWzYlc8Qlq//hClpriYPRSY8s35wj+DVa+Hm/HEiWRNBIVBLw2CZzs7RB0F4JYeBpnP/R
	39ykyWA2rClThXr49niw0c/Gnnd4JnPEWGL9+QzJwCRcnkfe+q0UFV5z9cArCfbeRky2uvUZI3H
	/wa0i1jllfPTD7o4R1j3XvexIWrdDf6tOPgDVIf8w8iocMCbH8ihaYDsWdMXday6ZXh9WEBxI1R
	rREUHOHDcizSiGBhQ/urxUMc4k1F/bdmbqLTO6llnxbqSxE9VwqkFAg28PwE7Gntrt88iMfcZwh
	Ugsk5G2fzj/0zNdpzJNek0CMChLMub/LNhgW2iQLGtDOdgLkpzg4d+Nw2RdM/ncr1C8CmmvT3R
X-Received: by 2002:a17:906:c38b:b0:b9a:7d8b:cda8 with SMTP id a640c23a62f3a-b9c13b7cd60mr1816466b.42.1774970719005;
        Tue, 31 Mar 2026 08:25:19 -0700 (PDT)
Received: from f16.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dba558226sm1264003a91.2.2026.03.31.08.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:25:18 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 1/2] libbpf: clarify raw-address single kprobe attach behavior
Date: Wed,  1 Apr 2026 00:24:35 +0900
Message-ID: <20260331152509.70468-2-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260331152509.70468-1-hoyeon.lee@suse.com>
References: <20260331152509.70468-1-hoyeon.lee@suse.com>
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
 tools/lib/bpf/libbpf.c | 21 ++++++++++++---------
 tools/lib/bpf/libbpf.h |  3 ++-
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 9ea41f40dc82..9083f542a3b0 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -11523,7 +11523,8 @@ static int determine_uprobe_retprobe_bit(void)
 #define PERF_UPROBE_REF_CTR_OFFSET_SHIFT 32
 
 static int perf_event_open_probe(bool uprobe, bool retprobe, const char *name,
-				 uint64_t offset, int pid, size_t ref_ctr_off)
+				 uint64_t offset_or_addr, int pid,
+				 size_t ref_ctr_off)
 {
 	const size_t attr_sz = sizeof(struct perf_event_attr);
 	struct perf_event_attr attr;
@@ -11558,7 +11559,7 @@ static int perf_event_open_probe(bool uprobe, bool retprobe, const char *name,
 	attr.type = type;
 	attr.config |= (__u64)ref_ctr_off << PERF_UPROBE_REF_CTR_OFFSET_SHIFT;
 	attr.config1 = ptr_to_u64(name); /* kprobe_func or uprobe_path */
-	attr.config2 = offset;		 /* kprobe_addr or probe_offset */
+	attr.config2 = offset_or_addr;	 /* kprobe_addr or probe_offset */
 
 	/* pid filter is meaningful only for uprobes */
 	pfd = syscall(__NR_perf_event_open, &attr,
@@ -11816,6 +11817,8 @@ bpf_program__attach_kprobe_opts(const struct bpf_program *prog,
 	default:
 		return libbpf_err_ptr(-EINVAL);
 	}
+	if (!func_name && legacy)
+		return libbpf_err_ptr(-ENOTSUP);
 
 	if (!legacy) {
 		pfd = perf_event_open_probe(false /* uprobe */, retprobe,
@@ -11835,21 +11838,21 @@ bpf_program__attach_kprobe_opts(const struct bpf_program *prog,
 						    offset, -1 /* pid */);
 	}
 	if (pfd < 0) {
-		err = -errno;
-		pr_warn("prog '%s': failed to create %s '%s+0x%zx' perf event: %s\n",
+		err = pfd;
+		pr_warn("prog '%s': failed to create %s '%s%s0x%zx' perf event: %s\n",
 			prog->name, retprobe ? "kretprobe" : "kprobe",
-			func_name, offset,
-			errstr(err));
+			func_name ?: "", func_name ? "+" : "",
+			offset, errstr(err));
 		goto err_out;
 	}
 	link = bpf_program__attach_perf_event_opts(prog, pfd, &pe_opts);
 	err = libbpf_get_error(link);
 	if (err) {
 		close(pfd);
-		pr_warn("prog '%s': failed to attach to %s '%s+0x%zx': %s\n",
+		pr_warn("prog '%s': failed to attach to %s '%s%s0x%zx': %s\n",
 			prog->name, retprobe ? "kretprobe" : "kprobe",
-			func_name, offset,
-			errstr(err));
+			func_name ?: "", func_name ? "+" : "",
+			offset, errstr(err));
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

