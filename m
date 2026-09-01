Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9D640F751
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 01:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788227328; cv=none; b=ZZz+Iah8f5e88zkw2kAhQNp+uoq4vVGI6ak5Xfll8BCwLNK8LEQGizu75ofuUv/BUtSelOYJQeF/KVNcE584yoNVCluG+nrTrYeBd84uocoIzc4Pl8hX4UDLmy5TM2Ax7Gb2CcRfrOA7EmGsyb4U2XD6NtHokm3oAHUY9twUMMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788227328; c=relaxed/simple;
	bh=PRi2aOR64kC+IhwsiLLjmuUQ6esstKfr+hkByw0I2BY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahbSCdOk9gecmP+hKW//gzabnFq0zb5ZZeTzosm3zRcjmDnoHhsOzyvOswnpnMdNJ4bvEXtnLzKofF5WfLiaHytPeIsnhREK2aizsVPqqR5Uc3avwvPd/ZAUT46mlqpCZujGM16O5VQr75yo74YBj6SiAXvcc4+aKMope43lZOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fskj+Clg; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fskj+Clg"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d72ae08fa1so35284405ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 18:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788227283; x=1788832083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJhpRtCyOkCHd1HDKmJquZ3SMNy+pxMEUXWEvt31OZE=;
        b=fskj+ClgEfAU/60uNfmL3r02D1evmdGv/ZplF8V5ZgHRru0Wyd5kxVLByqmK2IplKi
         1n1votwvGYzdMpjCbDSZaUbgNYZYMuCi7dQB7iiUYDhR6SW6RtfzSr3uBxae/iGZX8PN
         hEF+Ut/VuC6Bdffeqq+WJY07B54jNV2BEgmJe7kmXzrrO8yujO4z9Ye+VuLVQNrAOU5B
         q1XWF8O1/BjeYl2ydxet1aHCd5ccuYGPBqc196VRlFGcU1neFkiMt5625fKcQDb00WII
         VRw8YgqNEyOiCLrNbhX16TFSe6vy4cyTOU3+XvW1/qjSDNZb19YZmi5Cw3o8pgJY21GG
         rT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788227283; x=1788832083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJhpRtCyOkCHd1HDKmJquZ3SMNy+pxMEUXWEvt31OZE=;
        b=T69brVU8HzblsWkMCRcdg2WsmL62bABFZcXFE4pfY0ql4gDo+6nI7QC58cePFKzdxs
         Z2Kjr+KilZymxfHxu1PqAI8apLeT0ID62fG5t9vxqnzHMwiWAXV+E2eLIE5bdE4A6Vnd
         tDLikchBdu+xY/PPKV3Dq98gahiiHPSNkYy0DHdEbKc+h7KZeVt6Aw9oRDyoLT93dsTM
         K8TjvJMGPMSWHSMh32fjeiH88BwwKcR7Db7gc5a9aTAQa+n98iZ0Ze9Tlhanu91ZZR6I
         bEBCRE7juhDZBX//7cF4N4oYwQqy9JPR3g7JoQaVwM8UaGh+OVj8s+WHdxEQX0dkjkU3
         MM1w==
X-Forwarded-Encrypted: i=1; AKwUvBxGVD+6TmsbN3E5Rc+l7m0GPubvxrC/FT4Jqou+4MAU5feRg4WS2/mVkWXNHOnMinEyx37k0TaC7GW2dWXUT34=@vger.kernel.org
X-Gm-Message-State: AFuF++kq08B3OFuC7XBRRcV2qXbnB7m6aSdrvSEwihBoZ0+d442Q85hy
	u4GuEZUHERkoZdA/00FenvxA6Zxe73/uNX2/+s1lhqQ+MJN6GLhC99n/
X-Gm-Gg: AYBFou1M2fhvgf4FtWYq9HRSBOqyR1zNC2GW3zNZ5pI3RZC1QZqbNBLRKnnZ4LIV9t/
	CC9TqVafSbzPs8slbzl/wcsjSr/SCJtVfLqMNhpcb1aum4kMhB7YmfRDuw8mqLPQtDhdt/XFD4m
	gGSb8fBgUAz9Wm4Ij0c4nj28Y/Jrk6tMAbMd3sdw3n01qzjZJcewY8rrKpbF0+EihXiSFuh9aYO
	CLucrlILJ4YJAzCp9Vcb+yBPoIpCA0vBXcGELm5yqpymWB+g2WzHCzljuQWQX9ow38njY85GmM3
	q69yDzDx4yZ3Pqzwphp/GVeKjuSwh5e0hJCGb5l3gNNB7IkEFZ4DChWXO2Pvz53V1mgFIaw0voq
	IYUQJPHufgoL4Lj0HzWViEYISgQ1I8sA3MeHq/bcV5HcM8vFI/Bq0DvXaokQoa7/9Wk88aziqDy
	KGX9mZvwge87MzaV6+zuL9drP4WEFV4aq74YZ7PQVwMzHZYaLhZWFe1I0XTAMy6zbOfqdVMukWx
	+0WfE9iL6J1/zZyytyxqy+BiX/XUSFcp8edoLAwPGhxxBr/Aq6Y
X-Received: by 2002:a17:902:fc84:b0:2d8:d4d3:da4c with SMTP id d9443c01a7336-2d94a90e1d2mr65184305ad.16.1788227282814;
        Mon, 31 Aug 2026 18:48:02 -0700 (PDT)
Received: from secrnd-cstp.tailb7f510.ts.net ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d911a9651csm27053495ad.21.2026.08.31.18.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:48:01 -0700 (PDT)
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
Subject: [PATCH bpf-next v5 2/2] selftests/bpf: Cover attach type checks in link update
Date: Tue,  1 Sep 2026 10:47:11 +0900
Message-ID: <20260901014713.3502900-4-sanghyun.park.cnu@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260901014713.3502900-2-sanghyun.park.cnu@gmail.com>
References: <20260901014713.3502900-2-sanghyun.park.cnu@gmail.com>
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

Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
---
v5:
  - Isolate attach and update coverage in separate subtests with their own setup.
  - Inline the one-use LSM program FD and use a descriptive link FD.
  - Explain the create-versus-update contracts covered by the tests.
v4: https://lore.kernel.org/r/20260831023918.1857658-2-sanghyun.park.cnu@gmail.com
---
 .../selftests/bpf/prog_tests/cgroup_link.c    | 81 ++++++++++++++++++-
 .../selftests/bpf/prog_tests/lsm_cgroup.c     | 12 +++
 .../testing/selftests/bpf/progs/lsm_cgroup.c  |  6 ++
 .../selftests/bpf/progs/test_cgroup_link.c    | 14 +++-
 4 files changed, 111 insertions(+), 2 deletions(-)

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
index 4faba88e45a5..a987744d129c 100644
--- a/tools/testing/selftests/bpf/progs/test_cgroup_link.c
+++ b/tools/testing/selftests/bpf/progs/test_cgroup_link.c
@@ -20,5 +20,17 @@ int egress_alt(struct __sk_buff *skb)
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
+	ctx->msg_src_ip6[2] = 0;
+	return 1;
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.48.1
