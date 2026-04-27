Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B7918C02E
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 00:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777248975; cv=none; b=gKPgLi850WzXkmgq2kUrtlRkLco4g/Uj2wKUQFlkL3xyZuaVYnJwmCKivPkn/f94B/4h9Go+tzXH7kaiu3Viz+o0F4ltTDynd3YnZTTQTp2i/814ocCgqPapIS9HGy4R9Y39RTNxbSJR2x3l79TF0NTtKbKW9+vxnF1P7BVzODE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777248975; c=relaxed/simple;
	bh=NjT6WS99dzsH0BNHG0qiOHBrOhXLz3TwFeCMkEzyuU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eFEk348tjk/t4ba9yfH4wl21yAJqP5RAPk5zfARiDBfusHAtW0Wx8hKgMN1PAJ1tD+xgdQZ442XzS8XaGnqcrUnSKGAY3zkBhDLa0YJdp+hCCDw86MgPX8uMTIkwG5NsnftEnGyt/HKmQJSgGCSyjmFtxmFFnRmn5N00EhnD2JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jeo4rHrz; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jeo4rHrz"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cb5c9ba82bso1473678085a.2
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Apr 2026 17:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777248973; x=1777853773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrEKOElBE1O+qzK7jpp9/RCzGfUO3JW960CxJ57Fjyc=;
        b=Jeo4rHrzN9MXkd4r4GVp0x1dC9avVGEfwPZoHuX2EMILEDyd99CRUdfSf6G3bmwtqi
         kTbxVmNEf8lM3F7Q4zb5W9+3YOFphzwQ5hoyqr81oKx5xgvN4svY8lLkB0T9fuUbUTwz
         SKW9ssU2jh9Zx3D+ghfdTxFi1cAJ19o5MLktdyhJXQ+BhVBBNIXqIijzHEoH2wAJNOnH
         uiOHhInUF6CT5hnifgzJ6XU1HGctS7D3GizZh1vFXKWatsw+RwzF/f3Pj5crJDJJexDc
         Qys4WncRswla+GMCr6mWA0wfeJGztcYMtLlBc+Iv9abBfU53bayc04riRuRF5pLwpf/M
         +BWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777248973; x=1777853773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wrEKOElBE1O+qzK7jpp9/RCzGfUO3JW960CxJ57Fjyc=;
        b=sCQE1X7/arbilCnq3JxKsLa+70ZR8nHLViE87T9WI8OX5DogIuVoxjU2KNAGjDsdr0
         +Csygr9DYN8VJHa63wGE4CdRwmvTSonEo+nbYqWEs6w0IauuzA20rFwBJH1OV7j1mi0d
         rZUx+2aNMLw4DClMNtcHrfYCTEtwZRmdfTq/A5GbfuDbTrpAlOEnjI6ZR3000GERkQLL
         7wsnK5h9beX8rSUZswjnEh2fvOdwXP4UVWRmWUus/EzkYoDk0Og3QibGhwidOlPkyrgF
         3xbbR7xdMRJUKgQAUgD4a8URFFIrUs3N8o/ZoPMGXJxdQNudyrTjyIV8wVuWBD8TWOSe
         2ebg==
X-Forwarded-Encrypted: i=1; AFNElJ9H+Sgf9+jzJG+UXScnCg9YL03Aw2mcX6A4egC+zcs9mwgTMqCruOsR0tSQhLJQfjX+Nx+iS4x9KPHO2ffe25w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMSjEAEW9D9YFIz84uKIzlVaxndAAeZu7EdlIhN7Njxb+9zH7e
	BsYc6cJmtLqQISg+InD3qGNXZiW3rx3DBkDgJ5txnW8sQUXHAz9gy09l
X-Gm-Gg: AeBDievCc8vPsygw6ZB5Ei22GeUt5t+kczzD8K6Kp9uxFNku5vRwpwnGupSFjHA8qHn
	MTaOSoENSqUCG1OA/oMhEfne29OzWiKsit9xFIL6q8soNXZfODXcR15vrQgnMOQ37JbPgYkDsTv
	2tTeb4UiAQgsvchxRqaeYpth3jKhyrYQ6dyshHod9j2P3fsejG9NJ1hbIJc9e+1xWzEdmTqo9jF
	nz54tRXKDrclu5xVl9nJbhSCKIw3Wr/3HMY2PHNrh5VbPbJ8OyEASHoM6fgtqWl4tTQbGFLUtN5
	9YCDbiku2UxrijOe1VSXVx98OxORKqwtSB8MxmenuhFFamv+mBsAGCoMPBzDiAIY/CiBguVCD/O
	Mm567Lv41htcg+cBqzrCWnFZ2zFcR1u/FMpcQmcWTFQf1fXNPAof3Wz3JIawRpL39iuNcg6vnrs
	odNCOl+YTWDESDd5jmDOpU8al38LkGGK5dzyJfuvmMg24nsRdnhGuqibeKcNUwzao18J5ES0WFj
	YBroQ41ndtQdItnrUqPxfDwBJQq426BMmCdRisZ3xRhHYJxPKUMRyGpwJDDnEg=
X-Received: by 2002:a05:620a:2913:b0:8cd:94f9:1bb1 with SMTP id af79cd13be357-8e79010e10emr5699714285a.27.1777248973121;
        Sun, 26 Apr 2026 17:16:13 -0700 (PDT)
Received: from battery.lan (pool-100-15-227-251.washdc.fios.verizon.net. [100.15.227.251])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d6ba19c3sm2464025485a.21.2026.04.26.17.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 17:16:12 -0700 (PDT)
From: David Windsor <dwindsor@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: David Windsor <dwindsor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next 2/2] selftests/bpf: add tests for bpf_init_inode_xattr kfunc
Date: Sun, 26 Apr 2026 20:15:58 -0400
Message-ID: <20260427001602.38353-3-dwindsor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427001602.38353-1-dwindsor@gmail.com>
References: <20260427001602.38353-1-dwindsor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Test bpf atomic inode xattr labeling in inode_init_security.

Signed-off-by: David Windsor <dwindsor@gmail.com>
---
 tools/testing/selftests/bpf/bpf_kfuncs.h      |  3 ++
 .../selftests/bpf/prog_tests/fs_kfuncs.c      | 49 +++++++++++++++++++
 .../bpf/progs/test_init_inode_xattr.c         | 32 ++++++++++++
 3 files changed, 84 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/progs/test_init_inode_xattr.c

diff --git a/tools/testing/selftests/bpf/bpf_kfuncs.h b/tools/testing/selftests/bpf/bpf_kfuncs.h
index ae71e9b69051..15507a406266 100644
--- a/tools/testing/selftests/bpf/bpf_kfuncs.h
+++ b/tools/testing/selftests/bpf/bpf_kfuncs.h
@@ -92,4 +92,7 @@ extern int bpf_set_dentry_xattr(struct dentry *dentry, const char *name__str,
 				const struct bpf_dynptr *value_p, int flags) __ksym __weak;
 extern int bpf_remove_dentry_xattr(struct dentry *dentry, const char *name__str) __ksym __weak;
 
+extern int bpf_init_inode_xattr(const char *name__str,
+				const struct bpf_dynptr *value_p) __ksym __weak;
+
 #endif
diff --git a/tools/testing/selftests/bpf/prog_tests/fs_kfuncs.c b/tools/testing/selftests/bpf/prog_tests/fs_kfuncs.c
index 43a26ec69a8e..26daef116ee2 100644
--- a/tools/testing/selftests/bpf/prog_tests/fs_kfuncs.c
+++ b/tools/testing/selftests/bpf/prog_tests/fs_kfuncs.c
@@ -9,6 +9,7 @@
 #include <test_progs.h>
 #include "test_get_xattr.skel.h"
 #include "test_set_remove_xattr.skel.h"
+#include "test_init_inode_xattr.skel.h"
 #include "test_fsverity.skel.h"
 
 static const char testfile[] = "/tmp/test_progs_fs_kfuncs";
@@ -268,6 +269,51 @@ static void test_fsverity(void)
 	remove(testfile);
 }
 
+static void test_init_inode_xattr(void)
+{
+	struct test_init_inode_xattr *skel = NULL;
+	int fd = -1, err;
+	char value_out[32];
+	const char *testfile_new = "/tmp/test_progs_fs_kfuncs_new";
+
+	skel = test_init_inode_xattr__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "test_init_inode_xattr__open_and_load"))
+		return;
+
+	skel->bss->monitored_pid = getpid();
+	err = test_init_inode_xattr__attach(skel);
+	if (!ASSERT_OK(err, "test_init_inode_xattr__attach"))
+		goto out;
+
+	/* Create a new file — this triggers inode_init_security */
+	fd = open(testfile_new, O_CREAT | O_RDWR, 0644);
+	if (!ASSERT_GE(fd, 0, "create_file"))
+		goto out;
+
+	ASSERT_EQ(skel->data->init_result, 0, "init_result");
+
+	/* The initxattrs callback prepends "security." to the name */
+	err = getxattr(testfile_new, "security.bpf.test_label", value_out,
+		       sizeof(value_out));
+	if (err < 0 && errno == ENODATA) {
+		printf("%s:SKIP:filesystem did not apply LSM xattrs\n",
+		       __func__);
+		test__skip();
+		goto out;
+	}
+	if (!ASSERT_GE(err, 0, "getxattr"))
+		goto out;
+
+	ASSERT_EQ(err, (int)sizeof(skel->data->xattr_value), "xattr_size");
+	ASSERT_EQ(strncmp(value_out, "test_value",
+			  sizeof("test_value")), 0, "xattr_value");
+
+out:
+	close(fd);
+	test_init_inode_xattr__destroy(skel);
+	remove(testfile_new);
+}
+
 void test_fs_kfuncs(void)
 {
 	/* Matches xattr_names in progs/test_get_xattr.c */
@@ -286,6 +332,9 @@ void test_fs_kfuncs(void)
 	if (test__start_subtest("set_remove_xattr"))
 		test_set_remove_xattr();
 
+	if (test__start_subtest("init_inode_xattr"))
+		test_init_inode_xattr();
+
 	if (test__start_subtest("fsverity"))
 		test_fsverity();
 }
diff --git a/tools/testing/selftests/bpf/progs/test_init_inode_xattr.c b/tools/testing/selftests/bpf/progs/test_init_inode_xattr.c
new file mode 100644
index 000000000000..450798893566
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/test_init_inode_xattr.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2025 Isovalent, a Cisco company. */
+
+#include "vmlinux.h"
+#include <errno.h>
+#include <bpf/bpf_tracing.h>
+#include "bpf_kfuncs.h"
+
+char _license[] SEC("license") = "GPL";
+
+__u32 monitored_pid;
+int init_result = -1;
+
+const char xattr_name[] = "bpf.test_label";
+char xattr_value[] = "test_value";
+
+SEC("lsm/inode_init_security")
+int BPF_PROG(test_init_inode_xattr, struct inode *inode, struct inode *dir,
+	     const struct qstr *qstr, struct xattr *xattrs, int *xattr_count)
+{
+	struct bpf_dynptr value_ptr;
+	__u32 pid;
+
+	pid = bpf_get_current_pid_tgid() >> 32;
+	if (pid != monitored_pid)
+		return 0;
+
+	bpf_dynptr_from_mem(xattr_value, sizeof(xattr_value), 0, &value_ptr);
+	init_result = bpf_init_inode_xattr(xattr_name, &value_ptr);
+
+	return 0;
+}
-- 
2.53.0

