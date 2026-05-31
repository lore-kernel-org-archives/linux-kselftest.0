Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6F125D1E9
	for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 00:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780188511; cv=none; b=BS2FOzlZmFPcfMoSPfSLJRxJ+m8Fp3tXEfTYzLc2UmSAASABGSxe+Z+D0d0RLFai2+FYIqyIknjV16riBXz0JFziaQJ6zG6CGGGWXQd/OchLrGIrfp6KD3ARKYzp6rJvpcgqyrak1DjTqtCkYumd99OtNl6/APeNKsek14zSlMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780188511; c=relaxed/simple;
	bh=nf7H52BiE00pfcsnE0so3Yy+4Kqlaf5sOzNGyBYj+pk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pu1tbOh6pUa8jqE1WBxSBadtHj1CZ8skl8nJbbVs76STPU3sOtmbzXG68w2t3rS/0wvZKUJdRPJp5PWFwpbyla6MHlf67hhL7pXxwS4QzMNxq8uX7ok5icnE+M05NCE+9JAOZDV0c3Tq/HganexnrRZyniZDAkWZssBP/6guCpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RuUCsCgj; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RuUCsCgj"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8422875c676so597095b3a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 17:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780188510; x=1780793310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwO/OlrIC4X5IlWqO2MUG4z3bwcShqiYLdiaVgWhfIU=;
        b=RuUCsCgjZI2MaJzgYolIOa2oKIy5birycm8UCXcV80iIx1DNiW3T4ZRV5ogAefFMhx
         tNOd/qgTap9viC0WTBoVZtT8tGYX2Wz1q5aFL+biDB4qEWbROi4vOUX8a9XU02P6nNhU
         SV1NKP5UeP1Pv9OpIPm5eekS+2R2rPVGjvEakB1h5zACwUI0V49AhhyGyosi7EAoO+Br
         mGjMvuQaQPmVo71z+okS8qMBv/+f0ePBNYmhlgooM2MibG4Jp0uPpiJ3nemDfytIo6hc
         3TAQCZjghjp4pNhdv9aCCz19ykrh2Tf2kzRdP7mgIvIZqtgWyZDRTGnH6X4mENhymD2O
         ZE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780188510; x=1780793310;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZwO/OlrIC4X5IlWqO2MUG4z3bwcShqiYLdiaVgWhfIU=;
        b=n9mw3MnaAR8/lKXrnbbGdLx6HsBJkqhEdM0lGAemU+FzuaU9E/QUBIZlqSXR2LsA7k
         2arQcKOPih14OMWXM5m5gSTcvq2BZpLq6qHs6j1Ut0ZU77ozYGwry/8u6kW2tSFOjV0b
         +kjHms4wsGz6pr+r+u6RUzhqTLn95RVh0Gb1HaHeFPBpDT4DMfGyJaFoLPaTo8aqGUsP
         GyTJs5gkjtZ1mMDrXKOK4hqG+Y1t/jt1eR6cpRiCud1UqjRZ9tPwN2qgTCBwbT5n4AaI
         1jGOQ8XQuAsOWIVEBmkjaig/qut2tUr8G1BXbguHVdw64N/+EckGNdL0LjjLNA8NTaLL
         38MQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bosVfdGnHxoy4oBT47QM2fTEdRy5rO0JtdulVh+oVOdJWYRwyl2sW2l9a5/Gf/wm4Z2Ox/IEkU/nX/G9Pd8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMeypWdBEv0Axa7MNsX7mWY9y0h8ESwCbA4af1U+f/EoxJ9WcP
	RAnbPy496OlDs+HLtoN8CoXa8fO8WNOFgwJ7esjsOnKjyNAiiqRhoTx0J+G6x3bnREhPf2rV/Q1
	cKK0/f+1T8lwmbb/zj1Tdpsgxhg==
X-Received: from pfbgr7.prod.google.com ([2002:a05:6a00:4d07:b0:83f:2ce7:48ce])
 (user=yuyanghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3988:b0:835:3861:812c with SMTP id d2e1a72fcca58-84210c545c2mr7093486b3a.23.1780188509512;
 Sat, 30 May 2026 17:48:29 -0700 (PDT)
Date: Sun, 31 May 2026 08:47:48 +0800
In-Reply-To: <20260531004748.3567875-1-yuyanghuang@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260531004748.3567875-1-yuyanghuang@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260531004748.3567875-3-yuyanghuang@google.com>
Subject: [PATCH bpf-next v2 2/2] selftests/bpf: add verification for
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
BPF_PROG_QUERY) correctly rejects queries with a user-declared size below
the mandatory minimum (which now covers query.revision) with -EFAULT, and
succeeds when given the full size.

Cc: Maciej =C5=BBenczykowski <maze@google.com>
Cc: Lorenzo Colitti <lorenzo@google.com>
Signed-off-by: Yuyang Huang <yuyanghuang@google.com>
---
 .../selftests/bpf/prog_tests/bpf_attr_size.c  | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpf_attr_size.c

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_attr_size.c b/tools=
/testing/selftests/bpf/prog_tests/bpf_attr_size.c
new file mode 100644
index 000000000000..4fbe56cb29d4
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_attr_size.c
@@ -0,0 +1,65 @@
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
+
+	err =3D syscall(__NR_bpf, BPF_PROG_QUERY, &attr, OLD_QUERY_SIZE);
+	ASSERT_EQ(err, -1, "query_old_size_fails");
+	ASSERT_EQ(errno, EFAULT, "query_old_size_efault");
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

