Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD50442B3E
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 11:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386644; cv=none; b=VnUHzLLrZhGo7r2QejD6cAnNp5IfqdaxzhLA1nLBFmEYAVFP75NQheMsHvHkhUCYd3PJO1RtHySFyiQgVFizJiXuXgymvKERbohWWePgWIFvdGIVFwFqZno5+G1G2rP6Og/D2m0n55z//BNASrUqrgdbAWoJodi6mTx3vchfDwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386644; c=relaxed/simple;
	bh=ChNWu4SF6NGhwjGjf6K8AWy5RuCiogwQwkyEnV0Sbbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZHIuXtZrjVgHN6AIJQydqYZKH3iuk0i/rDFvtB3hPS96ljplmxQJSm3apgDUHVi6FyxerJjJxs94aMmtBxciU+M4QhL4EfkBHWsJHa57znDrQ9Jgiyrw0qlUFlmVb4+G5cUu3CMPgfmU0LwII8jkh3C0r70OLfaD14c8aIua5po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIK/NQHS; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIK/NQHS"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4b381337e1fso3158539b6e.1
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 04:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789386641; x=1789991441; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MaqTH9IlSFyz/AkXyftEm+wBLkaCkpRXZW0c+BfqTAY=;
        b=tIK/NQHSBAmP7RSxz+6cJVzVArk+IF9OaELzQI5MHOyrC1YPPp8EB0NKAKbho5v2lT
         ZsuSA1d3quKF0WJVlYrEGvchK0I4VIWWQyXqSl5gmAnjut+LBU8ZBtST3H+VYxAJtCDD
         tTi4kskmhoXjwQdQQQI4E9betsCkAoK+eOYT6hd12XulPhyk4qbGNil+1+Tjw/ATB8w8
         4ZCHrVhYmsXGdwrdKl9K+OIobSw2eMxbGEE21zG3a0KI2wRQVehBcvaAs5ZhjV0SWfe8
         W52CHr3skm2TkC54qerVPNQAHWJut70mNmWCQ2jZIrFOaOZKHnt6uQVEa4G8BSZnVfmr
         pQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386641; x=1789991441;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MaqTH9IlSFyz/AkXyftEm+wBLkaCkpRXZW0c+BfqTAY=;
        b=RxzR7xZ4FHtk3weCKffY4/YC0dBomwRggbeDaDd746N2M8zl7QBmzmRrHbFopXTRGx
         /xdF8OOECbXcG7uZQh31cn7afnJIadFXLDdDtTdcVzwdVTn692Z+1aS4nsBbkz4kShKB
         Rqsm2yivOhLB505Cwl2RvDkib7/kuFma6pupN11ODN1IPtH5UlMz1T3N0bbHBGGvH6IL
         4A6bVtvdj5/qTfEkMPyP1Yq1zdnwmWpNMaLXAb+Ys6LHyt6qvxq/s4o1NakT+yLYmAsN
         YC3rpV+Ds3pIhiF7Q+NHyBtfgywB55Vx171M/wZK0nHdR+XR7lGY7em9Pf8I3toO5ht6
         ARgA==
X-Forwarded-Encrypted: i=1; AKwUvBx2eJWXXBfH480w58PYsL1dQVP1h8M1/7cf3Pi6LPGLPMYHCzGT8IAa2HATUU0A9zb/0SqQvSVDBFZYWvbWMUo=@vger.kernel.org
X-Gm-Message-State: AFuF++mYmBE0R4ssT7soYN7mOoUU/N9v1VZOagbzqxXBpaCOCRzDkUNd
	bgO8FsWcEB+U9ljb0Oboi+MHme9pVmfGI4njv3bGbd3cFqW3wVNict0m
X-Gm-Gg: AYBFou2ep4Sv28P+bH/TmtPBAuHuO3V2/1EknGSDe3v9zstOHNFhsk932ubcN/YVv5u
	QL2qXx+87a1UrqDXIoUkuXaQTDBYdqJIBNjNPRlcB4tg7aT/0GuQ2IcCStsSQ5BfnfXRdcAVKif
	BepeIZmAubzFLq7MCixPavIUV+69mnuc5LKS5yN/disg02yhV81EzZITznDjGGxupwhOVYFxDfd
	8ktCBRCREeNmFFPARprK807Qs+p+bcOK2xOiXAefx7hRAnpLQxJfEDuPQqJSInEOjBnXKxda8R/
	mIvXQbvid4RifClz1ZFfw7H95435VW7SLJQnKzFPYyVE79qHXiy9vYU6U7UqSrIl5v0bP1/nXEd
	C9+9baTA++veBi9uEAojjVUfcclEC8sy4X195OZpDuCiB3M2bp19RhAKm+xqdtQC9FUHfdJ2RYD
	Cd8kitlMcRap0oetuQAesHpqcpnWampSzBFXBqHx6+GKnNcZIzYTSIyMnnZFK36at5UIFASj4WU
	iM=
X-Received: by 2002:a05:6808:244c:b0:4b9:e65b:8c31 with SMTP id 5614622812f47-4c7b48b3bd7mr1603457b6e.31.1789386641298;
        Mon, 14 Sep 2026 04:50:41 -0700 (PDT)
Received: from [127.0.1.1] ([201.162.69.22])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c3314b17d0sm9904432b6e.8.2026.09.14.04.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:50:40 -0700 (PDT)
From: Luis Vieira <luisflavieira@gmail.com>
Date: Mon, 14 Sep 2026 08:50:31 -0300
Subject: [PATCH bpf] libbpf: Fix program log buffer size validation
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-libbpf-log-buf-fix-v1-1-f592caffcc71@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIbfp2oC/x2MSwqAMAwFryJZG2j9oV5FXLSa1kCp0qII4t0NL
 ucxbx7IlJgyjMUDiS7OvEcBXRawbCZ6Ql6FoVJVpwZdY2BrD4dh92hPh45vbAbXqrpfjGlXkOO
 RSOY/OoHIML/vBwCA4vppAAAA
X-Change-ID: 20260913-libbpf-log-buf-fix-49f5038caa5d
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Luis Vieira <luisflavieira@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789386635; l=2747;
 i=luisflavieira@gmail.com; s=20260913; h=from:subject:message-id;
 bh=ChNWu4SF6NGhwjGjf6K8AWy5RuCiogwQwkyEnV0Sbbs=;
 b=+BXvKW5XIp+uDGQQdXyt3rRGzNHUx/tWoYxQaix3CUebltrheNoWY5mGbtM9eRw81unJKmOjJ
 ro5a4w4mBlcCM58XPDG+ywgA/kE9F486ggCw81a1k4FN90xIlRpn/Q8
X-Developer-Key: i=luisflavieira@gmail.com; a=ed25519;
 pk=98MeC/NdrC6ah7zYpPnkWiQIoyj62iUP/rNuV3esCW4=

bpf_program__set_log_buf() intends to reject log buffer sizes larger
than UINT_MAX.

However, the function checks the existing prog->log_size instead of
the incoming log_size argument. As a result, an oversized value can
be accepted.

Validate the supplied log_size instead.

Add a regression test that verifies that values larger than UINT_MAX
are rejected with -EINVAL on platforms where size_t can represent
such values.

Fixes: b3ce90795035 ("libbpf: Add per-program log buffer setter and getter")
Signed-off-by: Luis Vieira <luisflavieira@gmail.com>
---
 tools/lib/bpf/libbpf.c                           |  2 +-
 tools/testing/selftests/bpf/prog_tests/log_buf.c | 25 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index b749c01742ee..e1fed7735614 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -9955,7 +9955,7 @@ int bpf_program__set_log_buf(struct bpf_program *prog, char *log_buf, size_t log
 {
 	if (log_size && !log_buf)
 		return libbpf_err(-EINVAL);
-	if (prog->log_size > UINT_MAX)
+	if (log_size > UINT_MAX)
 		return libbpf_err(-EINVAL);
 	if (prog->obj->state >= OBJ_LOADED)
 		return libbpf_err(-EBUSY);
diff --git a/tools/testing/selftests/bpf/prog_tests/log_buf.c b/tools/testing/selftests/bpf/prog_tests/log_buf.c
index d6f14a232002..31c842d27fb4 100644
--- a/tools/testing/selftests/bpf/prog_tests/log_buf.c
+++ b/tools/testing/selftests/bpf/prog_tests/log_buf.c
@@ -3,6 +3,8 @@
 
 #include <test_progs.h>
 #include <bpf/btf.h>
+#include <limits.h>
+#include <stdint.h>
 
 #include "test_log_buf.skel.h"
 #include "bpf_util.h"
@@ -267,6 +269,27 @@ static void bpf_btf_load_log_buf(void)
 	btf__free(btf);
 }
 
+static void prog_log_buf_size_limit(void)
+{
+#if SIZE_MAX > UINT_MAX
+	struct test_log_buf *skel;
+	char log_buf[1];
+	int err;
+
+	skel = test_log_buf__open();
+	if (!ASSERT_OK_PTR(skel, "skel_open"))
+		return;
+
+	err = bpf_program__set_log_buf(skel->progs.good_prog, log_buf,
+				       (size_t)UINT_MAX + 1);
+	ASSERT_EQ(err, -EINVAL, "set_log_buf_too_big");
+
+	test_log_buf__destroy(skel);
+#else
+	test__skip();
+#endif
+}
+
 void test_log_buf(void)
 {
 	if (test__start_subtest("obj_load_log_buf"))
@@ -275,4 +298,6 @@ void test_log_buf(void)
 		bpf_prog_load_log_buf();
 	if (test__start_subtest("bpf_btf_load_log_buf"))
 		bpf_btf_load_log_buf();
+	if (test__start_subtest("prog_log_buf_size_limit"))
+		prog_log_buf_size_limit();
 }

---
base-commit: ee363e055895364039bf28348ff13c615afad4ba
change-id: 20260913-libbpf-log-buf-fix-49f5038caa5d

Best regards,
--  
Luis Vieira <luisflavieira@gmail.com>

