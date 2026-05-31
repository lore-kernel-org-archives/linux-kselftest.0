Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7C537AA8B
	for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 07:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780214172; cv=none; b=tibLZCnOS4NAGW7Ov6xw5IM1vo2dw4t4/ZqdPpe4NOmRIyru9W+A2TKpwAEkj5TVSXd5e64NQ0TxZ24siZSA+wL5v1nYSMWKyKgn75CfoQL4djPCb3fQBf0X9BO9sRGgQgdZVWctLWbxVnsHCuGdRchi8FLqtiIyf7NpL7bwbzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780214172; c=relaxed/simple;
	bh=PPRznl2dpFeNjyRO/a5rvUOlyREw9cxIxjFhfsgxg60=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=umou1r+jBCZO2nrg6/IMM7IctynV4LdYDmCwN2c1qcLJBfweoYfEj+PaovpZU7yCockJyaZePQkcd+xvBTPK6nyk9nu9csSwJKC3KHXb/3ajHLuWGPRzrKyvD2Pu/pQU88HAwesaRIHWZQsIA6YvKgY8hz3yGc3P9LpR6XNyJ0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fYm2jU2A; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fYm2jU2A"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8422f987f2eso1418473b3a.3
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 00:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780214170; x=1780818970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JCdlP2eNOvU6T2+PiO1cqwMwUfX++ZHI347m1q/7ZY=;
        b=fYm2jU2AZ+16VyUdd81w3EJfSxi2+oUAlBbvsuLnroQ0yC2sDDAE/S7e3bQpQp9J2s
         VKEa4ASwZZ59YiouKBP2rP8UqZx0viYeDCwUK+azFqwaBRhzo1BVnnc+TR/YJQ3ETG4w
         2LNPCgIuNEckd9pI/s7LkftSxNMdwegWGLVi267FVpZJ3ZXhpwZoJznzPtrG9j8ZIe60
         xb1aYeGraxzOvtpUnNOOIBrMdrdYZ9UCBMv+v1r/BFY/eWEnvpzl9YVeZoAydFlCudEo
         G6uyAPVXWe6nFCCzloC9UhqoYzFBOXZGDnZjeJq5AYazvm3vfV0+9czmdwSdYPrMEnzE
         Y2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780214170; x=1780818970;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1JCdlP2eNOvU6T2+PiO1cqwMwUfX++ZHI347m1q/7ZY=;
        b=nTGdFrhbYKkVGl4f5RJzXQBLLBmY33ORokoT+O1e2jPLJ6A3HmhQ4aTUOZF8nrTrXm
         ZrQ9GUDWxhZc3XBkYtVz9jjKzctFiuqXPlQuKlS8iYDUqqIE7S8/k0KQ1HQQwsTLq/Kv
         lM3f7L/0QeOJBGbmDOyy18W+6O6xqOUTvfoMAww9i3NucJJAhTQ1RDwVb1mUvjfnDkhB
         3jysQhQO8jfOS6HM7Pe3WwvFkKhMRMLmIz1QR5DG2lvS41QTObKY4zPukGdbvgf5h2B6
         LHrH27xSqaqOnItrvZzybobmIgEzUbqD9b7F3srsXb3DJB8/nPZBT64QKIUsHL9QcqOV
         oWbw==
X-Forwarded-Encrypted: i=1; AFNElJ84rJ9E+5CXryPDTbpCbCReV7x1/XCOYXKh5mA671D4n/z+BgL51IKS32LD54Gam8ilH8xfUEqtt1mE6r1XXI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxp0ygtqcHfQcX6nhOWVop1fNoVW4sLZPIuOACCFrF0wEjIwCv
	PvCbMZaVh8VKHCnxN91p+ziKtAQi2yUoAwJzSXdl5zNXqlGmCe/kIKO4xFVvxHt4wl4xtLW92CD
	PwKIwTq0TNC94K7grPaQ3pH2Btg==
X-Received: from pfib24.prod.google.com ([2002:aa7:8118:0:b0:842:284b:75b9])
 (user=yuyanghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1896:b0:82f:1b42:11d0 with SMTP id d2e1a72fcca58-84225782a9bmr6278842b3a.15.1780214170264;
 Sun, 31 May 2026 00:56:10 -0700 (PDT)
Date: Sun, 31 May 2026 15:56:00 +0800
In-Reply-To: <20260531075600.4058207-1-yuyanghuang@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260531075600.4058207-1-yuyanghuang@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260531075600.4058207-3-yuyanghuang@google.com>
Subject: [PATCH bpf-next v3 2/2] selftests/bpf: add verification for
 BPF_PROG_QUERY attr size boundaries
From: Yuyang Huang <yuyanghuang@google.com>
To: Yuyang Huang <yuyanghuang@google.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman <eddyz87@gmail.com>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Shuah Khan <shuah@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Leon Hwang <leon.hwang@linux.dev>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	"=?UTF-8?q?Maciej=20=C5=BBenczykowski?=" <maze@google.com>, Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add a new selftest to verify that the BPF syscall (specifically
BPF_PROG_QUERY) correctly handles different user-declared attribute sizes.

Specifically, verify that:
- For cgroup queries, a query with a size that covers 'prog_cnt' but is
  smaller than 'revision' (OLD_QUERY_SIZE) succeeds, but does not write
  to 'revision' (verifying backward compatibility).
- A query with full size (FULL_QUERY_SIZE) succeeds and writes both
  'prog_cnt' and 'revision'.

Fixes: 120933984460 ("bpf: Implement mprog API on top of existing cgroup pr=
ogs")
Cc: Maciej =C5=BBenczykowski <maze@google.com>
Cc: Lorenzo Colitti <lorenzo@google.com>
Signed-off-by: Yuyang Huang <yuyanghuang@google.com>
---
 .../selftests/bpf/prog_tests/bpf_attr_size.c  | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpf_attr_size.c

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_attr_size.c b/tools=
/testing/selftests/bpf/prog_tests/bpf_attr_size.c
new file mode 100644
index 000000000000..32159dc64da8
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_attr_size.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2026 Google LLC */
+#include <linux/bpf.h>
+#include <unistd.h>
+#include <sys/syscall.h>
+#include <test_progs.h>
+#include <cgroup_helpers.h>
+#include "cgroup_skb_direct_packet_access.skel.h"
+
+#define OLD_QUERY_SIZE		offsetofend(union bpf_attr, query.prog_cnt)
+#define FULL_QUERY_SIZE		offsetofend(union bpf_attr, query.revision)
+
+static void test_query_size_boundaries(void)
+{
+	struct cgroup_skb_direct_packet_access *skel;
+	struct bpf_link *link =3D NULL;
+	union bpf_attr attr;
+	int cg_fd =3D -1;
+	int err;
+
+	skel =3D cgroup_skb_direct_packet_access__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "skel_load"))
+		return;
+
+	cg_fd =3D test__join_cgroup("/attr_size_cg");
+	if (!ASSERT_GE(cg_fd, 0, "join_cgroup"))
+		goto cleanup;
+
+	link =3D bpf_program__attach_cgroup(skel->progs.direct_packet_access,
+					  cg_fd);
+	if (!ASSERT_OK_PTR(link, "cg_attach"))
+		goto cleanup;
+
+	memset(&attr, 0, sizeof(attr));
+	attr.query.target_fd =3D cg_fd;
+	attr.query.attach_type =3D BPF_CGROUP_INET_INGRESS;
+	attr.query.revision =3D 0xdeadbeefdeadbeefULL;
+
+	err =3D syscall(__NR_bpf, BPF_PROG_QUERY, &attr, OLD_QUERY_SIZE);
+	if (ASSERT_OK(err, "query_old_size")) {
+		ASSERT_EQ(attr.query.prog_cnt, 1, "prog_cnt_written_old");
+		ASSERT_EQ(attr.query.revision, 0xdeadbeefdeadbeefULL,
+			  "revision_not_written_old");
+	}
+
+	memset(&attr, 0, sizeof(attr));
+	attr.query.target_fd =3D cg_fd;
+	attr.query.attach_type =3D BPF_CGROUP_INET_INGRESS;
+
+	err =3D syscall(__NR_bpf, BPF_PROG_QUERY, &attr, FULL_QUERY_SIZE);
+	if (!ASSERT_OK(err, "query_full_size"))
+		goto cleanup;
+
+	ASSERT_EQ(attr.query.prog_cnt, 1, "prog_cnt_written");
+	ASSERT_GT(attr.query.revision, 0, "revision_written");
+
+cleanup:
+	if (link)
+		bpf_link__destroy(link);
+	if (cg_fd >=3D 0)
+		close(cg_fd);
+	cgroup_skb_direct_packet_access__destroy(skel);
+}
+
+void test_bpf_attr_size(void)
+{
+	if (test__start_subtest("query_size_boundaries"))
+		test_query_size_boundaries();
+}
--=20
2.54.0.823.g6e5bcc1fc9-goog

