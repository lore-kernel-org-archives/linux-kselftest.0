Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4A63612DB
	for <linux-kselftest@vger.kernel.org>; Sun,  3 May 2026 21:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777843122; cv=none; b=fdW2L7MwIOaQ5i66IJTCykb/nilpit51LYlYJHdCXTvOyOH9bSu1MOI63u+FZsBt61ZYrYyDsWOI1XLUsPD2m4DJN/+HeT7CFsDNyCkioULhNFhwf3vPrb/gWzBTADkc8YRzzDTi7qfFXBEZnmnthCriFQ/URpvVMU1b5IO+zRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777843122; c=relaxed/simple;
	bh=0rvNq6Ngdr9sbO2BAvOPTZrSqe1KCyp+hciX6ow1LY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m4aFNST2Mp4rtJCxinizqRJI47p+Ahp7u7mR9ccb1sKtSvZm4aPI9J380mFdm7pbGu0DrjdTccwRuVseThL0ceyzcJp1qzFiFUzCWP07p9nT0gVoTF8YA435Kz7eIAgew04Wdj71Jzvkir7lEKl+oJ2WVnNf8Wna/ZspT4LiQpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVNWfhCk; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVNWfhCk"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8b59772d441so20756146d6.0
        for <linux-kselftest@vger.kernel.org>; Sun, 03 May 2026 14:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777843120; x=1778447920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRi8xj1SPXf/3lAen7R/NSSWw8Zycq/3ZwGnVVa+VnE=;
        b=QVNWfhCkjo9PV1ud76pmQj/R/E9mcBBkyNelZwGOMfSMOR3KkzIHcFYFFIuuR6g0PU
         ANA3T1PKCqtL06sDb/v+sHnnIZtxm5hhf1ZbpdsXmD1HKY0CviY6667AdrITYB5KpP6h
         0gQtFz7AVFUTZHRxnTWaEk6/gFeTNdXrAEd96ZNjkZ7dGATM6e66/FGekGbYeqP0NveG
         p1uzFtaDho0yyWVtut4uH4Gl/7wIZBGinkND3QZ8E2AdBCxCsuXuls9wjiIIBQL+2nTq
         MTaZq4KqBzLHgICOU9y1aAzO4bwgjKA5pxLKCEzcKariVV4JtLCa8HjLy6oUKcCoom7B
         y7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777843120; x=1778447920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rRi8xj1SPXf/3lAen7R/NSSWw8Zycq/3ZwGnVVa+VnE=;
        b=m7hPYWwGWmu8B53z457ocAiu+JXo7ZTBjzS5A8S1agb/hNh7+v3yxalKzdMqJMJyIl
         cDfy5vQEgtSxtWkzLKedObye5ZRZJkE6oIBTYhPjrBODVGqyIzpnWb7/Aw4itfamaTkN
         xa/UdqAKOrypnwVZpjCfsC9NgrG6bq++NsvrlbZLhM/fhc+h5x04wRs1Wne7VHAI1ps4
         sc2IfQ0eisjChIZUkQRY0/lnIslHOGKMKauNSOGshaafEt7f/xCi6lOFbcEwHOUOFlyn
         tU6FhYTJ+vBo83exxq9xnFR2BgEHx9/3dbUiJeUC7ObjAS/mHc793W3oMfiI6wBqOQxx
         EIfA==
X-Forwarded-Encrypted: i=1; AFNElJ/nenVVPaLcdXP3SMpeWOqtzLzys11AvE7WHk5cKpbFzuqG+y3yFIIo0WLkEwK265glmfBh/Koz4k0RTwGHltw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMxnldNP+0wmbNlf/3M7pcQFktT0PI2nuIo10Ac6n6sVANSwRK
	n70drlxHK9CmdHV3G08LFSETPtelzwEk190bp9XYvW4KtZso1BaSmzzj
X-Gm-Gg: AeBDieuAiDvBXXcqOX7g9ZZy/TXTKx0MDiak0bU5qPQYDZ7OBZXlwjmtvkny+67gVAc
	VlMi6Ihc4Ve0CThowls5PIBrGhsQ+GroSZ8TzXb+//nmNeM7dtFjdUaQ1enACekj1QYwsdJdjyv
	StniWvxTSPJEOz64B797c0aZtgqTdjcx+dPdMGgifpLilfe8NtHYOby2UrR5zMbjU/c9lbuOSj/
	fiyadddMhRdVtuHXh3ujB8IcsX0MWucy8FAA1BCTO7GZLJnKV51ktwBYCoHL7A5F926VKzicd7/
	tGs1t0fpnfoSHGNbWdc1RtLhAvv56aZuc7LyGWVq2F24IHeb5knmNipDkMEb1T3dSaJI7EOts7S
	huU3PiUIRIjCa3lFlXT3ACGT/UIsOeqKJSPYEYzcoU1yw1xYzllgGuh+yyrf+xyDxmmBzM67tHO
	r08ChBdo03G2nbzr8R3qe8ZMLGvyVHF22c9NHnxqbFX1Tq4FlstsYkiLh9wIAsmd3kdXVKtuKda
	AEH9CMdcQg2QmK/kGkF3QGTzYHWpAYfDw7iglRYtTcbsg6dphpq4MaGDJAjAtw=
X-Received: by 2002:a05:6214:8015:b0:8ac:b1ad:3a1f with SMTP id 6a1803df08f44-8b66834bdcamr118113156d6.35.1777843120210;
        Sun, 03 May 2026 14:18:40 -0700 (PDT)
Received: from battery.lan (pool-100-15-227-251.washdc.fios.verizon.net. [100.15.227.251])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53d831651sm96146346d6.47.2026.05.03.14.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 14:18:39 -0700 (PDT)
From: David Windsor <dwindsor@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 2/2] selftests/bpf: add tests for bpf_init_inode_xattr kfunc
Date: Sun,  3 May 2026 17:18:31 -0400
Message-ID: <20260503211835.16103-3-dwindsor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260503211835.16103-1-dwindsor@gmail.com>
References: <20260503211835.16103-1-dwindsor@gmail.com>
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
 tools/testing/selftests/bpf/bpf_kfuncs.h      |  5 ++
 .../selftests/bpf/prog_tests/fs_kfuncs.c      | 49 +++++++++++++++++++
 .../bpf/progs/test_init_inode_xattr.c         | 32 ++++++++++++
 3 files changed, 86 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/progs/test_init_inode_xattr.c

diff --git a/tools/testing/selftests/bpf/bpf_kfuncs.h b/tools/testing/selftests/bpf/bpf_kfuncs.h
index ae71e9b69051..5d67eb773e44 100644
--- a/tools/testing/selftests/bpf/bpf_kfuncs.h
+++ b/tools/testing/selftests/bpf/bpf_kfuncs.h
@@ -92,4 +92,9 @@ extern int bpf_set_dentry_xattr(struct dentry *dentry, const char *name__str,
 				const struct bpf_dynptr *value_p, int flags) __ksym __weak;
 extern int bpf_remove_dentry_xattr(struct dentry *dentry, const char *name__str) __ksym __weak;
 
+struct lsm_xattr_ctx;
+extern int bpf_init_inode_xattr(struct lsm_xattr_ctx *xattr_ctx,
+				const char *name__str,
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
index 000000000000..5bc5b90a98f2
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
+SEC("lsm.s/inode_init_security")
+int BPF_PROG(test_init_inode_xattr, struct inode *inode, struct inode *dir,
+	     const struct qstr *qstr, struct lsm_xattr_ctx *xattr_ctx)
+{
+	struct bpf_dynptr value_ptr;
+	__u32 pid;
+
+	pid = bpf_get_current_pid_tgid() >> 32;
+	if (pid != monitored_pid)
+		return 0;
+
+	bpf_dynptr_from_mem(xattr_value, sizeof(xattr_value), 0, &value_ptr);
+	init_result = bpf_init_inode_xattr(xattr_ctx, xattr_name, &value_ptr);
+
+	return 0;
+}
-- 
2.53.0

