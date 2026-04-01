Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F07137FF58
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 05:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775021156; cv=none; b=CzKKTSq8mOF4of/MiRYtYNFVS6mL38fYJnmK3OkK3HQA/7ToEP8ohg1rxSAjmvbfQ0JuKHXCIroSq0eIl4pg/TxXU1AFj0EUpVKTe7v5+O5tFN4r/6nfpcoV9T/IjyIysUVtsNIfJ+VDKLISqQsIFDz8ViHeXChO5DVSrOeMDgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775021156; c=relaxed/simple;
	bh=qmeQHRkGzK4lii5ZAyRn9mbpws0lEvcKha0BrFEw8H4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N1htNgxHa1rHVtQZYTOB/g8eyKANT0QVZeuuV/9Q/zCekLUtZPT+uoFwfwgFuAla+ncAM/pPqWdWNVlZ6HcP6VciUy6HODSSkkO7b3e2DpE17QLSor4HIo70IeeYKxnmlRYGVw5TGRaCcZzBa/UUODbzdOTqTc011zEuXdhpGEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y5fUQ68p; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y5fUQ68p"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso57205945e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 22:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775021154; x=1775625954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agD2j9lHJEiH0O0fE306beCiWzd2jKbZSkmxgbBvFK8=;
        b=Y5fUQ68p7FTx4FgxBYQq2M0MpOq4AIxi42KmcWYRnOFJO9pSENMSWW3LYsT2GdiOj7
         8OxhB5ggvxUVMyF8uu7dRK1ZvZtKlrBHR0q4rwrsHC5IwQSg1Rn0wXVgkHAkJIq3C1zR
         ZBC6MOXu3C4cwSImYnVnh++Xln7PxJ93TYsPr1DePLpBsATGakuzAxnxuVBKGPHLdjK+
         7x5/zYJQJB35iovFcLqZvUo7W7zxsAKlwLuxVrbuRXMj9n8EdOb7ePIOgD5CLtTDnDnX
         SGreWq4Z7cKpXPoGvVbCqXBu2nA8ifwPv9dD5rc3LimrxeNem4yZiYDfJyINqODeG3f+
         UtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775021154; x=1775625954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=agD2j9lHJEiH0O0fE306beCiWzd2jKbZSkmxgbBvFK8=;
        b=ZrfzONgl9CQEjWsXhJLdA6nV2IC6mob1v6c9T+eeOSdD2ZfaPaeGeYjhIeix6HOeIq
         f/YCP924iAEQAnKo8EolvG8KGC6vqSgEO1YwiBIAUJrTo9WtPhFTH29ryeqBXSNpIdtc
         v9yUG/kmdIMr2pT3MhADL+zAXvvi9bKpZWTj9b0W3HAdacyBm13NdajUQhL9ykwWHlca
         Wq/Q+nOmdqkxaGwgqex/hW8LtbNRL6QCpZJIYwyYGQk+Lr3X09dgqQ1YVb8sXFq8lb58
         fDK+M575ARmUafFmr8/GzICjjmjulMSMxjfZZV0ds5/kvi2v/x84l4NFAW2nq71aigaw
         k6bA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ3AMQM5tU/OIf7LNJXGlg64d/6hUYRXBsiUk3dddq2aZ9xleN5FEcIDFB8+urg1Lm6HJHnIoLW5MGrvFhBOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzepC9RZgahybLibK9EMMK6+zqDjQZcE576Tyo1k/4l22+jo22e
	UPojtxGThPMsRqVbdxU8ktwKvlaf95w7MPYPlmEHS5pS8Ol51nYPoHn1QwdrnaeWGlk=
X-Gm-Gg: ATEYQzyHF5xFK/oelel4jjZXo2cll07QWXjdMVMtbh51RojQo33w698No8bIrMIjWis
	NIEef61Iu2acd/NkBYdWJvOcRsqNU9J5WJ7ojulZ25wnP/wTrZkO3nl6n/DKMSoGzXpRcaqpUV2
	L2wWswuoC2E+OQlPZb0ExWQgXfiLvo16UF7F7gJzrmndviCpLgafUUlCqsEOgnWo/bdz72ySF6M
	SOZz+IVfPo+Pey+vym3Ut7Oyv/IZzzqA3TpjYWQ70XA3wYq0FEwMBeMZQGtyafsR/wEMTsHOKST
	QMEeOMvU5ruSmm5vu0dzPKRAmRw2V+fSRp1goE/AAirj1unsFzQX6QYh3cmQ3NzjBml5pefwq8m
	nMxPd5F7k49+b1skHpAnV6DmW4JExGLMKPBLHu76JKJ/D9xvvStkwCu1ZfssjjAvR21ayXsLd4f
	zXJpempMSuj+tfadskfq3mtUMjalzmyckp2U9LHIcLlGwiqXXXm9eS8P6FaDUwRg==
X-Received: by 2002:a05:600c:3ba5:b0:471:700:f281 with SMTP id 5b1f17b1804b1-4888359db41mr30178075e9.25.1775021153781;
        Tue, 31 Mar 2026 22:25:53 -0700 (PDT)
Received: from f16.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843b818sm15308214b3a.6.2026.03.31.22.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 22:25:52 -0700 (PDT)
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
Subject: [PATCH bpf-next v5 1/2] libbpf: clarify raw-address single kprobe attach behavior
Date: Wed,  1 Apr 2026 14:25:10 +0900
Message-ID: <20260401052544.100968-2-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260401052544.100968-1-hoyeon.lee@suse.com>
References: <20260401052544.100968-1-hoyeon.lee@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bpf_program__attach_kprobe_opts() documents single-kprobe attach
through func_name, with an optional offset. For the PMU-based path,
func_name = NULL with an absolute address in offset already works as
well, but that is not described in the API.

This commit clarifies this existing behavior by documenting it in
bpf_program__attach_kprobe() and bpf_program__attach_kprobe_opts(),
and rejecting this form explicitly for legacy tracefs/debugfs kprobes.

Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
---
 tools/lib/bpf/libbpf.c | 16 +++++++++-------
 tools/lib/bpf/libbpf.h | 29 ++++++++++++++++++++++++++++-
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 9ea41f40dc82..b27832ff6051 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -11816,6 +11816,8 @@ bpf_program__attach_kprobe_opts(const struct bpf_program *prog,
 	default:
 		return libbpf_err_ptr(-EINVAL);
 	}
+	if (!func_name && legacy)
+		return libbpf_err_ptr(-EOPNOTSUPP);
 
 	if (!legacy) {
 		pfd = perf_event_open_probe(false /* uprobe */, retprobe,
@@ -11835,21 +11837,21 @@ bpf_program__attach_kprobe_opts(const struct bpf_program *prog,
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
index 0be34852350f..f691f05aa68c 100644
--- a/tools/lib/bpf/libbpf.h
+++ b/tools/lib/bpf/libbpf.h
@@ -557,7 +557,7 @@ struct bpf_kprobe_opts {
 	size_t sz;
 	/* custom user-provided value fetchable through bpf_get_attach_cookie() */
 	__u64 bpf_cookie;
-	/* function's offset to install kprobe to */
+	/* function offset, or raw address if func_name == NULL */
 	size_t offset;
 	/* kprobe is return probe */
 	bool retprobe;
@@ -565,11 +565,38 @@ struct bpf_kprobe_opts {
 	enum probe_attach_mode attach_mode;
 	size_t :0;
 };
+
 #define bpf_kprobe_opts__last_field attach_mode
 
+/**
+ * @brief **bpf_program__attach_kprobe()** attaches a BPF program to a
+ * kernel function entry or return.
+ *
+ * @param prog BPF program to attach
+ * @param retprobe Attach to function return
+ * @param func_name Name of the kernel function to attach to
+ * @return Reference to the newly created BPF link; or NULL is returned on
+ * error, error code is stored in errno
+ */
 LIBBPF_API struct bpf_link *
 bpf_program__attach_kprobe(const struct bpf_program *prog, bool retprobe,
 			   const char *func_name);
+
+/**
+ * @brief **bpf_program__attach_kprobe_opts()** is just like
+ * bpf_program__attach_kprobe() except with an options struct
+ * for various configurations.
+ *
+ * @param prog BPF program to attach
+ * @param func_name Name of the kernel function to attach to. If NULL,
+ * opts->offset is treated as a raw kernel address. This form is
+ * supported with PROBE_ATTACH_MODE_PERF and PROBE_ATTACH_MODE_LINK,
+ * and can fail with PROBE_ATTACH_MODE_DEFAULT if libbpf falls back to
+ * legacy attach.
+ * @param opts Options for altering program attachment
+ * @return Reference to the newly created BPF link; or NULL is returned on
+ * error, error code is stored in errno
+ */
 LIBBPF_API struct bpf_link *
 bpf_program__attach_kprobe_opts(const struct bpf_program *prog,
                                 const char *func_name,
-- 
2.52.0
