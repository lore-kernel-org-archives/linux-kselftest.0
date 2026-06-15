Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92097145B3F
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 07:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509181; cv=none; b=g9OkSF/Aa3mglvXTPHLntNQ22G9Tzk7A1iWkFEC5e5XC3AZZZvX7TmVWY9s0knHzzgN0yiVSY6uVj2opCUhSI5ahPz1pTqt6F0uQax4l1luSPPQtw7BjR4HajSOrzjZHXcnUrW1SoHSECrs7QSWSVb75bBt3XMaPsDzABt6f+CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509181; c=relaxed/simple;
	bh=gLE8CCQ5SH12vR+rRgkoSJvrMBzBUKCuuw23IvWdWz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CmI14fgeBZ2tb5Fd15BO+PchaN+yFu48ZFwDsBv0GU3kFoT3Ulh+wANfqsL3hZPya3DYtqUl2M/T2LhqSIa7w9hDXyh5xi8VQxgbyvBAfnnxWmI30YATQpTu9M8DHsV81w6AjRA6AV4kSnqFU3o0Ahy7Z8WVfMYULlEpBb+eaU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HylVFj8o; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HylVFj8o"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0c20f0c0aso20371995ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 00:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781509177; x=1782113977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbxyv2uuWx2uMg89JQUtXul+SksXRCRyTkytnWrdbbs=;
        b=HylVFj8olbHUfUyxSEIEg9YPMet/+ntPQWFLo9hdVoorB+YhdS9hNFUJIUSHR8Ib2V
         kG9bsprvYkkKY6qwgnqt5u4IuHTRKn70Z/g0Np2yOhdvUef/CQSk5lhBVmqiDMwJdMBM
         JG3WSM54Viep3VFRJSCHEt69AvkI1YBF4TdtPMeHis8arqH6DqAREGPgwYUquiDv4zIk
         Khe3m0LETBwReGBkHaautnRGSndbR1l60gcMMlcf0Xol1oMEVGUqCvCi+0dp4t7q7d9k
         +KCxIeQ7JJWpIguW2j9kw+DcQEM9H1EvncKke5yJc2NaPqO2X8RJ416LHijdISkFg/gz
         wn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781509177; x=1782113977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vbxyv2uuWx2uMg89JQUtXul+SksXRCRyTkytnWrdbbs=;
        b=WX1gH8SaeSdtU1+wwCj5BG+dd55UqwmyMx1i5n3vn9T5kT9+3GRd1O2KjqpEri+hYm
         QqjJR+bagGW+eWoil9VQ8ExkiJNVvp7gPbRkBgBf2owzkr32RTk/+hkud1TL+i++k2Yi
         12GQpP6L7FlXbiBJCvYTR3egNCMJRqTIZj8mvZrgRISkVfSxWW42KEeramDo68GnAOZY
         u8FktNlzdgOqZQRGTeIRZ3AcVDTP74tmuZJBlRrBho3ooeBGVYjmahb5IMjwTCY0Vt2z
         us6v+rEIbPA3UOjAgilZhSJeTjH5sjbpdfpLRFPc+6A23eIsOFJ75JayC1Bd1TUlqSWu
         8mYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lvwE61c18nXHYO5vFw9dSj0XNlqod3iHJmlRCdoP3tXU0aVjmhEavi36hB6PAgD3hg+xXWleVsyworCIoEFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWjajTlag2CicOh1nOdpTc0Txw3TR/8qKXaYEdm+92Hh/uvMyT
	YsJyvv6RJ4XS0N6+S+3QNpfsOXkSt7YYLbGGFu60cWHos27eqAqj0p2n
X-Gm-Gg: Acq92OEAULVODHrjdmBaRk1otFkqDnnkojOEiHg4PuXNLNVdoNqVKuMKmXlM6M9Dpi3
	xGJE/2N3pn/f9W8vtEGWd9lpclkeSGRtRypKAI79OR2AQaQ6Ea7uretgsOq7Mfm8gW6+6E+Q9aJ
	H3HK7qkHEajq13/LWCFoPAsRnEE5N3ElmmkkmAE66iNfwzFNgDq+JOaO+uqpguNCL89bGyjWhtR
	rXzCp/6zXxc+WzQFeKSv4IZ3/tTGziohLmOLgABgsoBmJ3K2U8LYxxjvF09X/CwmWkMaoTRLeeu
	utPVzwj43cJKq7/YefjXB9HLqu4I6o/IWdeHUmq5UwPbGCRGJg3MPOiYmwhCOldBG53iDdD7Zz1
	kBc7eDDxx0+4T4HKFyAz/gkNZnfrF60rRQ2pBzt1tJ0w80y+2jf9yusFtAVmlL9d4fkiNT5IOnm
	o2iU8vwr5zT8MZaVa/eDNCykOdGjmopvOzJE4rQmEcCKrrSG4PZMc43qd9DNVYVOQ=
X-Received: by 2002:a17:903:1a30:b0:2c6:7479:644d with SMTP id d9443c01a7336-2c674796a84mr71837965ad.5.1781509176848;
        Mon, 15 Jun 2026 00:39:36 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a304:100::209f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c43307a259sm91271345ad.68.2026.06.15.00.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:39:36 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	shuah@kernel.org,
	paul.chaignon@gmail.com,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf 2/2] selftests/bpf: Cover partial copy of non-linear skb test_run output
Date: Mon, 15 Jun 2026 15:38:56 +0800
Message-ID: <20260615073856.152479-3-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615073856.152479-1-sun.jian.kdev@gmail.com>
References: <20260615073856.152479-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test case for BPF_PROG_TEST_RUN with a non-linear skb and a short
data_out buffer.

The test verifies that test_run returns -ENOSPC, reports the full packet
length through data_size_out, and copies the packet prefix into data_out.
The test uses a 100-byte data_out buffer with a 64-byte linear head, so the
expected output spans both the skb head and the first fragment.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 .../selftests/bpf/prog_tests/skb_load_bytes.c | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/skb_load_bytes.c b/tools/testing/selftests/bpf/prog_tests/skb_load_bytes.c
index d7f83c0a40a5..134be0ea8ed7 100644
--- a/tools/testing/selftests/bpf/prog_tests/skb_load_bytes.c
+++ b/tools/testing/selftests/bpf/prog_tests/skb_load_bytes.c
@@ -3,6 +3,39 @@
 #include <network_helpers.h>
 #include "skb_load_bytes.skel.h"
 
+#define NONLINEAR_PKT_LEN 9000
+#define NONLINEAR_HEAD_LEN 64
+#define SHORT_OUT_LEN 100
+
+static void test_nonlinear_data_out_partial(int prog_fd)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, tattr);
+	__u8 pkt[NONLINEAR_PKT_LEN];
+	__u8 out[SHORT_OUT_LEN];
+	struct __sk_buff skb = {};
+	int err, i;
+
+	for (i = 0; i < sizeof(pkt); i++)
+		pkt[i] = i & 0xff;
+
+	memset(out, 0xa5, sizeof(out));
+
+	skb.data_end = NONLINEAR_HEAD_LEN;
+
+	tattr.data_in = pkt;
+	tattr.data_size_in = sizeof(pkt);
+	tattr.data_out = out;
+	tattr.data_size_out = sizeof(out);
+	tattr.ctx_in = &skb;
+	tattr.ctx_size_in = sizeof(skb);
+
+	err = bpf_prog_test_run_opts(prog_fd, &tattr);
+
+	ASSERT_EQ(err, -ENOSPC, "nonlinear_partial_err");
+	ASSERT_EQ(tattr.data_size_out, sizeof(pkt), "nonlinear_partial_data_size_out");
+	ASSERT_OK(memcmp(out, pkt, sizeof(out)), "nonlinear_partial_data_out");
+}
+
 void test_skb_load_bytes(void)
 {
 	struct skb_load_bytes *skel;
@@ -40,6 +73,8 @@ void test_skb_load_bytes(void)
 	if (!ASSERT_EQ(test_result, 0, "offset 10"))
 		goto out;
 
+	test_nonlinear_data_out_partial(prog_fd);
+
 out:
 	skb_load_bytes__destroy(skel);
 }
-- 
2.43.0

