Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56982E7387
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 01:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788745853; cv=none; b=sgioLIZKEdaaivffNJtRa/GzwRU/11CLQMZzDq2GjMUR6CbFxzwnwNfV2vVcjFbuqzL+qxmfiVXGnCeUa7p4Ga2BSIHSH38MroCIvostWpGbsD7TnDlH5iwHxUcmCpgvp6hTLKA/eTkRsVatnIwRS1xYL63uBLSfSdkSXpWBhbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788745853; c=relaxed/simple;
	bh=9+4aoPNTqAd8WGCafkd8EILnfgdfYj2vO5R+UZTC56U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzotAhaQCtOqnHsxDb+ObgBblAxa30U88FtaqvcIhwYreY86C1GTuOwNo4yiwKbybsHzevbGkFt1bSeSn0UeDbJDstk0VMLQce7NdApfVx0XkcGmNIdR2FLAQLmXYXW6knu0rMHdfKGhHjHmljlXAbv5In6iU+pmREMHQkkELZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/r8bifQ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/r8bifQ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d9004f39d3so37243995ad.2
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 18:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788745850; x=1789350650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+LE5Vy6vaZPNsi+iRTDd/qD0BVGkAM4pa52G4CTr/g=;
        b=X/r8bifQYrXNi8Dt3gApf1pC3PZG3E9/5l8hpdBU6/IwLQOQMYPM4S4u6jJFHXa/lN
         rJNJ0do7HUlvCZxMDFUF5ZMl2S28TqZmzo4+zCDr7tquBrEPC8wVUTbe3Nzy4bI9FIPw
         Za/1tSpVPdrEPj2Shi4v1Fdy7CoLzVAMfpv94fZmwI1n1A9zCzd2E1f9dCcanY7MFMZl
         G4spvCwtWLO4zgjCIK2f8e57N7pCmKd1ZUjGbdAhJ8d3TRfFXDdP5fBQZndmBbZm4EH9
         Wq+5L5nMAoGVOo7vPNbRYoKwq2BzhgV+HdsYQZUhATVyobonPinKJ+Tkx+FH8hPk+QIN
         MO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788745850; x=1789350650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J+LE5Vy6vaZPNsi+iRTDd/qD0BVGkAM4pa52G4CTr/g=;
        b=rs63Ye6j0yEYxIHqrbIH1lB8Fbkb1R+N+0iIGvJYvPUs75gcpieYT1Ch3B8iCy8RU1
         CXV2swC5uW6105+UxqDRpUwDGFush9Jo/CJMXv9sCYaHQcOVP1wan9vaPqm3zvKiG+ab
         cmWTkxZREedbKn3ZaP+bDWd62Rn2jdDdLqSnwq1DhbASlmzSV+FavkdxWKgiK6skN7Fp
         n6OVO/XXenN7/zlqa6SINarnmLS+XJC6owBJTAOoiZ0un1syTKpzTMxhqt6Y6lSNWDW5
         H61nIbeOfa+xsLpebPqJogLe/kcZZ1nvpbuh47EuVQet1NciXlDr2B935iL+7PxzRXif
         rlDg==
X-Forwarded-Encrypted: i=1; AKwUvBxFsvjRLhOh8RRqsc2zkqfkw5yU6Pn+h+WsYBB1GYmkxLCktVs6uF6+eTj16XcOqvsG2cl3HKBKzHnGj+xkwso=@vger.kernel.org
X-Gm-Message-State: AFuF++mBYriNhxi5q+nejPFM8ExgOdpC0bxaP9ftUKXzsKlCJpWux7GF
	41qD5r7guoVfZj2RtxWYB2qZ1eCHIEeeLIjR9TBvxeaj3+ijXvfVOXNz
X-Gm-Gg: AYBFou2VpfjTz5/KAqNuG89n0d/v+8GMRbf9uaOzLj0v2W/Wvp4bwLrPNaHxRLn10pv
	fIMKx/6/wn4fbxueOtKq2fr+6aud9GEUqVM/5X39+cbrbyltDAkH38kjQXCnavNeaGYULIkyr8K
	9hummJlOQk/Xr6khFdFXi01fCg6xRItnaTl4gms4DaWq/x4HtlQHRql63eJ+xZiWS3d/HgzfwWd
	KMf18Vao+2mWNJb+fxfKtGN7L9+AQx1xBpTTi9JJRdh9NFHdqv21DGAfcDd7MsjwqS5KMIO757n
	qJkjdUosgJinZweIShYCeaUIqGAeP0kPLwMv8ICK01q2UlOiSPVByw9LN9FUnz2B2Lp2w1N8bxp
	U6zSMXBC5ZckfPVXHGCiFZXvCu/+cbaVfahMtuDiKn0E3T1AbypzyNePwqC7vi9G6x4QoavK6Mh
	I/BCTAmroWekYvkCivQv7fSItlbH5DA8oYvVf8+Pny/Ek2Gi/GXjbRekOHzmgMEy0PreDofjZM7
	x9hK5DVYzpxJmlbQJddQ/oIjvVQVF3HK74FbAkN+WfNmhkyXCZV
X-Received: by 2002:a17:90a:164f:b0:39b:3510:49e7 with SMTP id 98e67ed59e1d1-39b35105b52mr15190290a91.0.1788745849967;
        Sun, 06 Sep 2026 18:50:49 -0700 (PDT)
Received: from secrnd-cstp.tailb7f510.ts.net ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd2aasm17142018a91.3.2026.09.06.18.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 18:50:49 -0700 (PDT)
From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	bpf@vger.kernel.org
Cc: Sanghyun Park <sanghyun.park.cnu@gmail.com>,
	Leon Hwang <leon.hwang@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Pu Lehui <pulehui@huawei.com>,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>,
	Xu Kuohai <xukuohai@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v6 2/2] selftests/bpf: Cover attach type checks in link update
Date: Mon,  7 Sep 2026 10:50:04 +0900
Message-ID: <20260907015003.65087-4-sanghyun.park.cnu@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907015003.65087-2-sanghyun.park.cnu@gmail.com>
References: <20260907015003.65087-2-sanghyun.park.cnu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pin down the two contracts changed by the companion patch. LINK_UPDATE
validates a replacement program against the link's attach type, while
CGROUP_SKB capability checks apply at LINK_CREATE and not LINK_UPDATE.

Cover incompatible UDP4/UDP6 and LSM attach flavors, plus a CGROUP_SKB
link update after dropping CAP_NET_ADMIN and CAP_SYS_ADMIN.

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
---
v6:
  - Remove the unused msg_src_ip6 store from sendmsg6().
  - Add Reviewed-by tag.
v5: https://lore.kernel.org/r/20260901014713.3502900-4-sanghyun.park.cnu@gmail.com
  - Isolate attach and update coverage in separate subtests with their own setup.
  - Inline the one-use LSM program FD and use a descriptive link FD.
  - Explain the create-versus-update contracts covered by the tests.
v4: https://lore.kernel.org/r/20260831023918.1857658-2-sanghyun.park.cnu@gmail.com
---
 .../testing/selftests/bpf/prog_tests/cgroup_link.c | 81 +++++++++++++++++++++-
 .../testing/selftests/bpf/prog_tests/lsm_cgroup.c  | 12 ++++
 tools/testing/selftests/bpf/progs/lsm_cgroup.c     |  6 ++
 .../testing/selftests/bpf/progs/test_cgroup_link.c | 13 +++-
 4 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/cgroup_link.c b/tools/testing/selftests/bpf/prog_tests/cgroup_link.c
index 15093a69510e..3b43c34917cc 100644
--- a/tools/testing/selftests/bpf/prog_tests/cgroup_link.c
+++ b/tools/testing/selftests/bpf/prog_tests/cgroup_link.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <test_progs.h>
+#include "cap_helpers.h"
 #include "cgroup_helpers.h"
 #include "testing_helpers.h"
 #include "test_cgroup_link.skel.h"
@@ -24,7 +25,77 @@ int ping_and_check(int exp_calls, int exp_alt_calls)
 	return 0;
 }
 
-void serial_test_cgroup_link(void)
+static void test_cgroup_link_update(void)
+{
+	const __u64 caps = (1ULL << CAP_NET_ADMIN) | (1ULL << CAP_SYS_ADMIN);
+	struct bpf_link *link = NULL;
+	__u64 saved_caps = 0;
+	int cg_fd = -1, err;
+
+	skel = test_cgroup_link__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "skel_open_load"))
+		return;
+
+	err = setup_cgroup_environment();
+	if (!ASSERT_OK(err, "cg_init"))
+		goto cleanup;
+
+	cg_fd = create_and_get_cgroup("/cgroup_link_update");
+	if (!ASSERT_GE(cg_fd, 0, "cg_create"))
+		goto cleanup;
+
+	err = join_cgroup("/cgroup_link_update");
+	if (!ASSERT_OK(err, "cg_join"))
+		goto cleanup;
+
+	link = bpf_program__attach_cgroup(skel->progs.sendmsg4, cg_fd);
+	if (!ASSERT_OK_PTR(link, "attach_sendmsg4"))
+		goto cleanup;
+
+	err = bpf_link__update_program(link, skel->progs.sendmsg6);
+	ASSERT_EQ(err, -EINVAL, "reject_sendmsg6_update");
+	bpf_link__destroy(link);
+	link = NULL;
+
+	err = cap_disable_effective(caps, &saved_caps);
+	if (!ASSERT_OK(err, "drop_caps_for_attach"))
+		goto cleanup;
+
+	link = bpf_program__attach_cgroup(skel->progs.egress, cg_fd);
+	if (!ASSERT_ERR_PTR(link, "attach_without_net_admin"))
+		goto cleanup;
+	err = libbpf_get_error(link);
+	link = NULL;
+	if (!ASSERT_EQ(err, -EPERM, "attach_err"))
+		goto cleanup;
+
+	err = cap_enable_effective(saved_caps & caps, NULL);
+	if (!ASSERT_OK(err, "restore_caps_for_attach"))
+		goto cleanup;
+
+	link = bpf_program__attach_cgroup(skel->progs.egress, cg_fd);
+	if (!ASSERT_OK_PTR(link, "attach_egress"))
+		goto cleanup;
+
+	err = cap_disable_effective(caps, &saved_caps);
+	if (!ASSERT_OK(err, "drop_caps"))
+		goto cleanup;
+
+	err = bpf_link__update_program(link, skel->progs.egress_alt);
+	ASSERT_OK(err, "update_without_net_admin");
+
+cleanup:
+	err = cap_enable_effective(saved_caps & caps, NULL);
+	ASSERT_OK(err, "restore_caps");
+	bpf_link__destroy(link);
+	if (cg_fd >= 0)
+		close(cg_fd);
+	cleanup_cgroup_environment();
+	test_cgroup_link__destroy(skel);
+	skel = NULL;
+}
+
+static void test_cgroup_link_attach(void)
 {
 	struct {
 		const char *path;
@@ -253,3 +324,11 @@ void serial_test_cgroup_link(void)
 	}
 	cleanup_cgroup_environment();
 }
+
+void serial_test_cgroup_link(void)
+{
+	if (test__start_subtest("attach"))
+		test_cgroup_link_attach();
+	if (test__start_subtest("update"))
+		test_cgroup_link_update();
+}
diff --git a/tools/testing/selftests/bpf/prog_tests/lsm_cgroup.c b/tools/testing/selftests/bpf/prog_tests/lsm_cgroup.c
index 41e867467f6c..0dd44dbb9c95 100644
--- a/tools/testing/selftests/bpf/prog_tests/lsm_cgroup.c
+++ b/tools/testing/selftests/bpf/prog_tests/lsm_cgroup.c
@@ -74,6 +74,7 @@ static void test_lsm_cgroup_functional(void)
 	int bind_prog_fd = -1;
 	int bind_link_fd = -1;
 	int clone_prog_fd = -1;
+	int socket_link_fd = -1;
 	int err, fd, prio;
 	socklen_t socklen;
 
@@ -156,6 +157,17 @@ static void test_lsm_cgroup_functional(void)
 	ASSERT_EQ(query_prog_cnt(cgroup_fd, "bpf_lsm_socket_bind"), 1, "prog count");
 	ASSERT_EQ(query_prog_cnt(cgroup_fd, NULL), 4, "total prog count");
 
+	socket_link_fd =
+		bpf_link_create(bpf_program__fd(skel->progs.socket_first),
+				cgroup_fd, BPF_LSM_CGROUP, NULL);
+	if (!ASSERT_GE(socket_link_fd, 0, "link create socket_first"))
+		goto detach_cgroup;
+	err = bpf_link_update(socket_link_fd,
+			      bpf_program__fd(skel->progs.socket_create_lsm),
+			      NULL);
+	ASSERT_EQ(err, -EINVAL, "reject lsm_mac link update");
+	close(socket_link_fd);
+
 	/* Attach another instance of bind program to another cgroup.
 	 * This should trigger the reuse of the trampoline shim (two
 	 * programs attaching to the same btf_id).
diff --git a/tools/testing/selftests/bpf/progs/lsm_cgroup.c b/tools/testing/selftests/bpf/progs/lsm_cgroup.c
index 3bfa479104be..30727945cecc 100644
--- a/tools/testing/selftests/bpf/progs/lsm_cgroup.c
+++ b/tools/testing/selftests/bpf/progs/lsm_cgroup.c
@@ -213,6 +213,12 @@ int BPF_PROG(socket_first, int family, int type, int protocol, int kern)
 	return 0;
 }
 
+SEC("lsm/socket_create")
+int BPF_PROG(socket_create_lsm, int family, int type, int protocol, int kern)
+{
+	return 0;
+}
+
 SEC("lsm_cgroup/socket_create")
 int BPF_PROG(socket_second, int family, int type, int protocol, int kern)
 {
diff --git a/tools/testing/selftests/bpf/progs/test_cgroup_link.c b/tools/testing/selftests/bpf/progs/test_cgroup_link.c
index 4faba88e45a5..107429638f54 100644
--- a/tools/testing/selftests/bpf/progs/test_cgroup_link.c
+++ b/tools/testing/selftests/bpf/progs/test_cgroup_link.c
@@ -20,5 +20,16 @@ int egress_alt(struct __sk_buff *skb)
 	return 1;
 }
 
-char _license[] SEC("license") = "GPL";
+SEC("cgroup/sendmsg4")
+int sendmsg4(struct bpf_sock_addr *ctx)
+{
+	return 1;
+}
 
+SEC("cgroup/sendmsg6")
+int sendmsg6(struct bpf_sock_addr *ctx)
+{
+	return 1;
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.48.1

