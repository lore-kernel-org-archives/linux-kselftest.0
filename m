Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCB5331ED0
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 14:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787494694; cv=none; b=M7ByjpJStDpp1j9lUOIIEb4hoH7F9ggglPRswxNKwOD1e3iPPHja0gEWb3OC3uhG46BbIEbuSB8PIyE9iDSAdSa1bteZAQlhstqhQRZ7xuSvhejUldGNYgAoc/6IbQczzEp3tzhD4aOue22SU1YV+mGFis2XK8TaRhkV8JaLVHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787494694; c=relaxed/simple;
	bh=f45uQTLcoCxQUacMtqdb5ScN6GaILQ79UNqIIFKowz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0VQ0+xqrJnSLO1da8Hwf7mhOeIsURoD70RPUYO7OTTLJ7xMBuyqvkXIm/09aWBloqfmikvBKP5NDUJHy/GHTGsCbrWuZRga5QLfKB9QvFgEByIw74K69vS2gLMjfwhChGY4iY1oTK5kwdu6G0FVbyc5pXsxPlJUR3CgKfOooYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2d561173f9fso16774455ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 07:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787494692; x=1788099492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e7oaM6iEIN9zmqUbo7qJbXRXk+4xR9zhjvD2NxdYN+M=;
        b=MeXhKIv2fT+SzuklryTzafZfTpVcDqxLhJ2Z4lvh6bR3e9pIhMvZKnP9H9jumeCKMR
         J+GIdANB/qXGojMAAepK3DZkF+TaQotaC41/FwTMBJQW7XPluCvUpmpoNnBMQxd1+g/v
         9iWf+09ekquELv5L6aPIxRzMYrKI/QL4RfnwcQTAJBk504O2tgbKtwiiqD3vRFg9hauo
         eInAGIG8ivaGBwq4bWVgKs4SCXJsHBcyP50EmQ1cQgIIXPHdVMy0qrkmo2V1WXUhWeWB
         VcYouK7Si9ZVBpz4DixYX61cssusSO6EiqN0CH4CTgc/qv9SAtQPTbTZaNOpxElpN47V
         RKQw==
X-Forwarded-Encrypted: i=1; AHgh+RpEyr1gaGLrEx+Fk9NokSCPcoSCebA02j1zxXRGViRhRVgVjhQ63wPDMunsROnHg0JZtHGgQUFmQUB9UBf6oyU=@vger.kernel.org
X-Gm-Message-State: AFuF++l9uYaEFuMsl2kZpbT6ARYf+LFQjcTKW16M+jpQTbO0c912Vfi0
	dXnZVFcX5oGBMkS/K0l9vYaRyxI+Sh9EGR+wREf+/rdFKkXl0CzGxW2X
X-Gm-Gg: AR+sD11v0fnJohetdcSlokduVmL3K8FNogTOfgTgeQ1+9yl6llnB4hMJ7nO9LNa3EkL
	1kICJRXbieudkhmr8upK5MvdhpUG9ElI0QZ0/pJE6aAxojFt6g78BlBQIUPyeySoAluZh2TEliJ
	BqoJmmYGUF2xeIJ5kqqfdAJ/n7ZMz1DQJOMtbbpHNyw9etZhfGe0Os25NJbQDBUYsE/BoXJFou+
	+69XdKqeRbLIlZlgRu7uxc8TBqkO2er+/WM6uo2akIimfFtycUucim6zLn1l6VuP271yN1o40QK
	AV+D0HEPn3wCYXrcOI1RXplaZIydXZC0xA9Z63gcE5VX+cK+VtuoYNfyz6iQRTX979IOb7107SR
	3OMdywmH02GTjLkzkG3zG0YCIvNztIp1xxNaMVc7cF3Zq6d1KBKfGr5Wq/pV+bGKq+med2ypn31
	7ynAYttTv6ZvrMDixq2GntyxWfpO97qZW6JieSp2frzpj4LdDGX95KmJ95f42V54/u0YIEDv3bs
	1Iu6OvEiM0YiS04c8s=
X-Received: by 2002:a17:902:e784:b0:2cf:ba10:6d6 with SMTP id d9443c01a7336-2d64af6f8dbmr368136745ad.4.1787494691824;
        Sun, 23 Aug 2026 07:18:11 -0700 (PDT)
Received: from localhost.localdomain ([180.153.160.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676791d44sm9944575ad.24.2026.08.23.07.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 07:18:11 -0700 (PDT)
From: Jianlin Shi <shijianlin11@foxmail.com>
To: bpf@vger.kernel.org,
	memxor@gmail.com
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@kernel.org,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@chromium.org,
	sdf@falco.dk,
	haoluo@google.com,
	jolsa@kernel.org,
	emil@tsalapatis.com,
	pulehui@huawei.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v4 5/5] selftests/bpf: cover stream capacity and partial read edge cases
Date: Sun, 23 Aug 2026 22:17:28 +0800
Message-ID: <c5a79efbd3cb52cc0668ab50db5379c907cfe6a6.1787492521.git.shijianlin11@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787492521.git.shijianlin11@foxmail.com>
References: <cover.1787492521.git.shijianlin11@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add coverage for the stream fixes requested on the capacity rollback
series:

- oversized bpf_stream_printk() returns -E2BIG and does not leak
  capacity for a subsequent successful write on the same program;
- bpf_prog_stream_read() returns the successfully copied prefix when
  the userspace buffer straddles an unmapped page.

Signed-off-by: Jianlin Shi <shijianlin11@foxmail.com>
---
 .../testing/selftests/bpf/prog_tests/stream.c | 65 +++++++++++++++++++
 tools/testing/selftests/bpf/progs/stream.c    | 18 +++++
 2 files changed, 83 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/stream.c b/tools/testing/selftests/bpf/prog_tests/stream.c
index c3cce5c292bd..87170dcad3ad 100644
--- a/tools/testing/selftests/bpf/prog_tests/stream.c
+++ b/tools/testing/selftests/bpf/prog_tests/stream.c
@@ -58,6 +58,71 @@ void test_stream_syscall(void)
 	stream__destroy(skel);
 }
 
+void test_stream_oversize(void)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, opts);
+	struct stream *skel;
+	int ret, prog_fd;
+	char buf[8] = {};
+
+	skel = stream__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "stream__open_and_load"))
+		return;
+
+	prog_fd = bpf_program__fd(skel->progs.stream_oversize);
+	ret = bpf_prog_test_run_opts(prog_fd, &opts);
+	ASSERT_OK(ret, "oversize run");
+	ASSERT_OK(opts.retval, "oversize retval");
+
+	/* Oversized push must not permanently consume capacity on this prog. */
+	ret = bpf_prog_stream_read(prog_fd, BPF_STREAM_STDOUT, buf, sizeof(buf), NULL);
+	ASSERT_EQ(ret, 3, "bytes after oversize");
+	ASSERT_OK(memcmp(buf, "foo", 3), "payload after oversize");
+
+	stream__destroy(skel);
+}
+
+void test_stream_partial_read(void)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, opts);
+	struct stream *skel;
+	int ret, prog_fd;
+	long page_size;
+	char *page, *buf;
+	char rest[8] = {};
+
+	skel = stream__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "stream__open_and_load"))
+		return;
+
+	prog_fd = bpf_program__fd(skel->progs.stream_syscall);
+	ret = bpf_prog_test_run_opts(prog_fd, &opts);
+	ASSERT_OK(ret, "ret");
+	ASSERT_OK(opts.retval, "retval");
+
+	page_size = sysconf(_SC_PAGESIZE);
+	page = mmap(NULL, page_size * 2, PROT_READ | PROT_WRITE,
+		    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (!ASSERT_NEQ(page, MAP_FAILED, "mmap")) {
+		stream__destroy(skel);
+		return;
+	}
+	/* Leave only the first page mapped so a straddling copy faults. */
+	ASSERT_OK(munmap(page + page_size, page_size), "munmap second page");
+
+	buf = page + page_size - 1;
+	ret = bpf_prog_stream_read(prog_fd, BPF_STREAM_STDOUT, buf, 3, NULL);
+	ASSERT_EQ(ret, 1, "partial bytes");
+	ASSERT_EQ(buf[0], 'f', "first byte");
+
+	ret = bpf_prog_stream_read(prog_fd, BPF_STREAM_STDOUT, rest, sizeof(rest), NULL);
+	ASSERT_EQ(ret, 2, "remaining bytes");
+	ASSERT_OK(memcmp(rest, "oo", 2), "remaining data");
+
+	munmap(page, page_size);
+	stream__destroy(skel);
+}
+
 static void test_address(struct bpf_program *prog, unsigned long *fault_addr_p)
 {
 	LIBBPF_OPTS(bpf_test_run_opts, opts);
diff --git a/tools/testing/selftests/bpf/progs/stream.c b/tools/testing/selftests/bpf/progs/stream.c
index 6f999ba951a3..9b97f5e01b83 100644
--- a/tools/testing/selftests/bpf/progs/stream.c
+++ b/tools/testing/selftests/bpf/progs/stream.c
@@ -36,7 +36,12 @@ struct {
 } array SEC(".maps");
 
 #define ENOSPC 28
+#define E2BIG 7
 #define _STR "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
+#define _X64 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
+/* 1024 bytes: truncated by bstr_printf, must return -E2BIG. */
+#define _BIG_STR (_X64 _X64 _X64 _X64 _X64 _X64 _X64 _X64 \
+		  _X64 _X64 _X64 _X64 _X64 _X64 _X64 _X64)
 
 int size;
 u64 fault_addr;
@@ -117,6 +122,19 @@ int stream_syscall(void *ctx)
 	return 0;
 }
 
+SEC("syscall")
+__success __retval(0)
+int stream_oversize(void *ctx)
+{
+	int ret;
+
+	ret = bpf_stream_printk(BPF_STDOUT, _BIG_STR);
+	if (ret != -E2BIG)
+		return ret;
+
+	return bpf_stream_printk(BPF_STDOUT, "foo");
+}
+
 SEC("syscall")
 __arch_x86_64
 __arch_arm64
-- 
2.43.0

