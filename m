Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567782;
	b=uawk9tzY1B4e8zOJjSOtBuyLIA55XY/FUIfqNBvk3XQ0TnSFcg4mkGKmTGQPHVCrShAj
	 uSqpsszBqeOifxuree8e4kRWqBRvO8n+Jrp/Ni78kZ1Fr0hA4k9wuGPI3fVNvS8HrNDXd
	 OOHZVFS8T+jEnNNkkPuryALSfYRzC/ZR4e+eAtKkmkBIFrInJt4tdAuGQSxOco0yW8N72
	 wKgCGuZw1AZXvKcXrhCOfr4IOcP5vWYlh+IzO83gUCrcpnkmX+QLhYlIrD9SlC2GgXs4E
	 qJamqyYRV3eLlTD07I51li1rQH5+8Wls4RaJ4ENvHZr0aNMsMSghvbalb8JoheTCk8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=cyNNuOa161K+iR4qAyNpNzJrMoWbE+BM8LRvvuUtRMQ=;
	b=eSXG3w9hC1UojwiSuCt5m/WMNHW9yaGUO/JhuiDuQfyTROSBjXPA18qrl5NdP+/V8o43
	 aV6OAS7YUGBYyZx59sEJ7KXWygM0oJzaCrZbyp3FuKH3yA2wSTxTiK2wQlv6YpplE9+9n
	 RGg1Khi+Z5rcyuKNfQWJph2TzgCef6wWuaW3RJZ1r7DtqEyjxZDo+38eIpHvCrBwN6yKj
	 oKce/n93UI5AvMaMFh2R2fPeI0yos/n8xmulnesGMFDYcM23wvAHKT1mMEyyrgo2fYYAS
	 jNIVz617UFWmuFHS1IYSAKmcE3B8S5WecHf629esKr+Gcj/0Q0uZiKUNSxQ+0zGfz+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tweek.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="BT5WE5/N";
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77DA606A31E
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 00:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E77DA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BT5WE5/N
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso3930993a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 16:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567780; x=1796172580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cyNNuOa161K+iR4qAyNpNzJrMoWbE+BM8LRvvuUtRMQ=;
        b=BT5WE5/Nf7L6JkcXmbd9i1EXeP3frwZMtIJPaWoBwtxMNNKBIi13PZaX3vcs8tha+8
         55NISiItQ7qA/5OUJkLOEItIpGy8CvqJC61oG+BE6yF1FQoI0WgxG3KU52/0GMPzQ7CJ
         dr6MIQjb6aYbEPR1R/aKQ8Ki1VEv5/8bE3dzg6tCbZNaIzAWT0o60X0I/5BPuaxnsMPv
         AjCiSJGWmF9oF57kfFRqTAwTKz5+KkSMf3duZxk6sYUR18KGzSQUjXHHfAgkUlcHI7/r
         KG2s8NhfHhK4gp1cE4zwhw7VInBfDNV6gNT1KudUPcsDHy53HvJ3PaMSubVf/y3c8Ice
         zJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567780; x=1796172580;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyNNuOa161K+iR4qAyNpNzJrMoWbE+BM8LRvvuUtRMQ=;
        b=jsjE/V7QuH6qyMYQJDQl5dprwwPqq2wBYsiTbWyDKGCt3Qe2go4JSRMrUEWEF+rO5V
         DZeF5lLLQ+ZNGitdodpCdnDn6JladxlV6wsy2lVSUg8ZVQaistR+YerbWaQ+ND+ov5bt
         YFPnsXggJKFs+1Rq8E/kfaMsOMF2Mg/k5EoVZKjhdeTkucFBHlat+K56LL7teis1/R4S
         dCe/33a7vDnDRfOS5rPUMpR1LVBlZoiTqK6EAeBj4jCdOZiaxvfosg6fxtCKL+3CdFNn
         zUNzmu6lqXBq8hBSstE0yxMQ1rJS1PRFNimqIeYoEMWjn4olSU0RC7ACcC+HERMKL7H+
         gRjQ==
X-Forwarded-Encrypted: i=1; AL+hErEShQi3mYdOEZnJsgxFhJmvUvc5BfRAyJhYs9G9YQSWvJsadOUF9U2gafwgC1V13eFXEfwqL7G65Ad4QGeULAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z98AdeY1mwMiTSS6ISUztfn60iLk4SDtcxBlSy11tNGbsFwbqpE
	tJRWr1Qka0/lSx3HYmreypeox3OJIGniK4BJOJKzF0am0JkjHQjKPH7tsYPq6pxj9kRXUEmQKFZ
	8vg==
X-Received: from pjyf11.prod.google.com ([2002:a17:90a:ec8b:b0:3b4:3d61:7517])
 (user=tweek job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:55c5:b0:3b4:5b2c:2959
 with SMTP id 98e67ed59e1d1-3b45b2c29b9mr10853767a91.63.1795567780147; Tue, 24
 Nov 2026 16:49:40 -0800 (PST)
Date: Wed, 25 Nov 2026 11:49:11 +1100
In-Reply-To: <20261125004911.3937193-1-tweek@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125004911.3937193-1-tweek@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004911.3937193-4-tweek@google.com>
Subject: [PATCH bpf 3/3] selftests/bpf: Test non-autoload rejection in light skeletons
From: "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>
To: Quentin Monnet <qmo@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Leon Hwang <leon.hwang@linux.dev>
Cc: "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Sid Nayyar <sidnayyar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add a test (bpftool_gen/lskel_non_autoload) that invokes
'bpftool gen skeleton -L' on an object containing non-autoload
programs (test_global_percpu_data_failure.bpf.o) and verifies that
generation fails with the expected error message.

Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
---
 .../selftests/bpf/prog_tests/bpftool_gen.c    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpftool_gen.c

diff --git a/tools/testing/selftests/bpf/prog_tests/bpftool_gen.c b/tools/t=
esting/selftests/bpf/prog_tests/bpftool_gen.c
new file mode 100644
index 000000000000..f0a0da6210df
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/bpftool_gen.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <bpftool_helpers.h>
+#include <test_progs.h>
+
+#define MAX_BPFTOOL_OUTPUT_LEN	(64 * 1024)
+
+static char output[MAX_BPFTOOL_OUTPUT_LEN];
+
+static void test_lskel_non_autoload(void)
+{
+	char cmd[MAX_BPFTOOL_CMD_LEN];
+	int ret;
+
+	ret =3D snprintf(cmd, sizeof(cmd),
+		       "gen skeleton -L test_global_percpu_data_failure.bpf.o 2>&1");
+	if (!ASSERT_GT(ret, 0, "format cmd"))
+		return;
+
+	ret =3D get_bpftool_command_output(cmd, output, sizeof(output));
+	ASSERT_NEQ(ret, 0, "gen skeleton -L non-autoload should fail");
+	ASSERT_HAS_SUBSTR(output,
+			  "is marked as non-autoload, which is not supported for light skeleton=
s",
+			  "error message");
+}
+
+void test_bpftool_gen(void)
+{
+	if (test__start_subtest("lskel_non_autoload"))
+		test_lskel_non_autoload();
+}
--=20
2.56.1.831.g720f3f5937-goog

