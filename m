Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1004DD3AA
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 18:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791396803; cv=none; b=h8sYuPSjLMvG0gtN8KoQ9hrfozoPBLJQW4mYv6Iv8hmWqoWo4cchSLMrJ2W3xCNWMObO7hYAR25fRlD8MwdydNCZqviI8sAq6swmqVyQmyFa7MX07jFP+HE16FAHebqjaDDsFPMRZmOdk6ViF+YEhtdznhzsYJOb1rkaIBQvC6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791396803; c=relaxed/simple;
	bh=fGnUR8pUz0Yu+aH9Y53oe0ise/KSrMTwoNWwfc8dHCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oe1C4ZnjAoSRMElUfHuY3yT2fM3WzQfESgoV3WT7XGsJDRuGxHo/GB3Lv/xbhqxX0aS6ARuNAStSMmAm0HQwIO8tr+v5rNtPE20lMijYI8MH8+XqH1s0OePITfpqJua2yTFCba9tTQuw/LA6K5Nw4rp52XvlkavKqcESdfpF69k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j1+R92gU; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1+R92gU"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a5a26c8412so12876471fa.3
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 11:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791396800; x=1792001600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGrnPWUOyDg0C0yJ/lqCgfFWPjcx0fkqwSZpB/L+ihw=;
        b=j1+R92gUvD7VlUNXCd3GUl5TWYoOVgXxvG1cNYSdmOhQ5BYJzkAJA/yTFchR2t1NAD
         K1UNzZZ3o3xtdM1gQCpWxT20av2Pvny16KBz2LKq03L5RGh2cJhto+gNX9cpu7iHa7w+
         knwcXqL6Fj2Xa9AvOmujDCZ4a3NuLQdYe88tT4RniDuJcALAWuJs2+dlb3ms3YKXS7HJ
         djR3tlo2rgI/ROj4WavlFlt544eNqWS0tLPjyVMwUzqs7gRN4vZUZnp3ZAXadXZAP/ou
         okwbbFCykBP6aUJRXA0GV9nlOOp51OeeoE6kvI4aWG2zI0dupeTrGhLG6FYEbpixM3iN
         lKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396800; x=1792001600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZGrnPWUOyDg0C0yJ/lqCgfFWPjcx0fkqwSZpB/L+ihw=;
        b=bfQAtAHbfJiurKlzChGvbeTEZn97+wbN0+rNAlI8R63wU1eXfm3g2hNgoxDHDTHOzy
         awOUllp0THcZEwC8aunWrptDhFI8kS8NCkJ/1xKOOQG7ix3ZvDewanDSJmFTBfcVzxp+
         wrPiBpLLgR/ITUnM1war8V0BZ6jvOp8SsyRE7hH3xeT464jEhsBHTAlm5F6VVh9kThai
         2h+9wzgBqoMAijThdOC0yogcTB1vZhZDlzObTWOo/857Z1jWo2/nY2OCQyyslD8bT42Y
         YzEneiCrq93kxDhPFR4i3FWKqqJztQ0PW3OOyuGJkrejGh8fKtsSKpT2lf3DHuF9Div7
         c1OQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBiN6GtSmpAQGJh9wXmo+jWt/A7M69KfRsDny67Y4M1pG5zPJbgfYlzdDtskma1udIDmZHs0Gatn+GEWxvATI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFw60MX0A/Ec43yWHrrjY+yE7rWNxaH+jNFFX8lNR6vMCYasFe
	FjVUTvsd5G3Lb5FzsLxuNJhvImaFwYVz1PKhGbioO9oeazJu9phjhmyd
X-Gm-Gg: AYBFou1NyjRnX7JxPT4pbR/EaMig7cFM90bxv4LGsjOC+2V9qIz25HrgCzpSR+EFf8f
	x45j6BNwMkIIkmMJWwInWGBUYBRgOQloCNCxOfUKEgRP1loNX4/h7wVT7ixzb5OIX2ohlU8X4UC
	A/jHaLZC6cjgWoJpw1bsNSq/o2PhIQNRWlLtUxJ3dDUeoPXfx8XFQhBTPAnsWhCGwUTL2fp1Nqk
	wgnjQo5YvxQavjaDUIbw/Jbw4pnniccd8COhyB1oXXXtrLLTbIvD+fFRLvdWOrFeUm6XoC9VJ4Y
	hrkdPP/tMqoUwfcCvgnACn/As+bmmeTpKqrpjOFtWOSK3H3ByNpozgVrlAl4uFBfh67GZ/nUJnf
	7KsLioiTiHRieQwhsgD45b+6EIhVKl7pHJ/WH1F5mcQLcOoM9gOFjmlVRB919izpvqv2OuYtASG
	F1sk+SB6/SCDmO3uQtYTbCXgoYhvGpKcMEssVxirw4dJ2NtcbnQKMb5wiTH/mqa24k2gWv1Ndor
	+mZOhp+GF4AFFb1W7d7UA9nCu492EqK6Dhzpd0ttHQTU244qtg/
X-Received: by 2002:a2e:a7ca:0:b0:3a9:8546:ee13 with SMTP id 38308e7fff4ca-3a9a2cf70camr7501791fa.19.1791396799446;
        Wed, 07 Oct 2026 11:13:19 -0700 (PDT)
Received: from localhost.localdomain (95-24-167-79.broadband.corbina.ru. [95.24.167.79])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1d59661sm9000041fa.18.2026.10.07.11.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:13:18 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	memxor@gmail.com,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	vadim.fedorenko@linux.dev,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: [PATCH bpf 2/2] selftests/bpf: Cover test_run csum validation after bpf_skb_change_tail()
Date: Wed,  7 Oct 2026 21:12:42 +0300
Message-ID: <20261007181249.352831-3-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261007181249.352831-1-skokovmaksimevg@gmail.com>
References: <20261007181249.352831-1-skokovmaksimevg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add BPF_F_TEST_SKB_CHECKSUM_COMPLETE tests for tc programs that move the
skb out of CHECKSUM_COMPLETE with bpf_skb_change_tail():

- change_tail_trim trims the last 4 bytes of pkt_v4. They hold the
  non-zero tcp.urg_ptr, so the stale skb->csum no longer matches the
  packet.
- change_tail_grow_write appends 4 zero bytes, which on their own do
  not change the sum, and then writes a byte with BPF_F_RECOMPUTE_CSUM.
  That write can no longer update skb->csum.

Both return -EBADMSG without the preceding test_run fix and pass with
it.

Also add store_no_recompute as a negative test. It writes a byte
without BPF_F_RECOMPUTE_CSUM, so the skb stays CHECKSUM_COMPLETE with a
stale skb->csum, and test_run must keep returning -EBADMSG. This checks
that the validation still runs for CHECKSUM_COMPLETE skbs. The passing
case, a CHECKSUM_COMPLETE skb whose checksum is updated correctly, is
already covered by test_skb_pkt_end.

Assisted-by: LLM
Signed-off-by: Maxim Skokov <skokovmaksimevg@gmail.com>
---
 .../bpf/prog_tests/skb_csum_complete.c        | 39 ++++++++++++++++
 .../selftests/bpf/progs/skb_csum_complete.c   | 44 +++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/skb_csum_complete.c
 create mode 100644 tools/testing/selftests/bpf/progs/skb_csum_complete.c

diff --git a/tools/testing/selftests/bpf/prog_tests/skb_csum_complete.c b/tools/testing/selftests/bpf/prog_tests/skb_csum_complete.c
new file mode 100644
index 0000000000000..919f24dbacd3d
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/skb_csum_complete.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <test_progs.h>
+#include <network_helpers.h>
+#include "skb_csum_complete.skel.h"
+
+static void run(struct bpf_program *prog, int expected_err)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, topts,
+		.data_in = &pkt_v4,
+		.data_size_in = sizeof(pkt_v4),
+		.repeat = 1,
+		.flags = BPF_F_TEST_SKB_CHECKSUM_COMPLETE,
+	);
+	int err;
+
+	err = bpf_prog_test_run_opts(bpf_program__fd(prog), &topts);
+	if (!ASSERT_EQ(err, expected_err, "test_run"))
+		return;
+	if (!expected_err)
+		ASSERT_EQ(topts.retval, 0, "retval");
+}
+
+void test_skb_csum_complete(void)
+{
+	struct skb_csum_complete *skel;
+
+	skel = skb_csum_complete__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "skel_open_and_load"))
+		return;
+
+	if (test__start_subtest("change_tail_trim"))
+		run(skel->progs.change_tail_trim, 0);
+	if (test__start_subtest("change_tail_grow_write"))
+		run(skel->progs.change_tail_grow_write, 0);
+	if (test__start_subtest("store_no_recompute"))
+		run(skel->progs.store_no_recompute, -EBADMSG);
+
+	skb_csum_complete__destroy(skel);
+}
diff --git a/tools/testing/selftests/bpf/progs/skb_csum_complete.c b/tools/testing/selftests/bpf/progs/skb_csum_complete.c
new file mode 100644
index 0000000000000..8e8d53530899a
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/skb_csum_complete.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <vmlinux.h>
+#include <bpf/bpf_helpers.h>
+
+SEC("tc")
+int change_tail_trim(struct __sk_buff *skb)
+{
+	/* Drops CHECKSUM_COMPLETE. skb->csum still covers the trimmed bytes,
+	 * which hold the non-zero tcp.urg_ptr of pkt_v4, so it no longer
+	 * matches the packet.
+	 */
+	if (bpf_skb_change_tail(skb, skb->len - 4, 0))
+		return 1;
+	return 0;
+}
+
+SEC("tc")
+int change_tail_grow_write(struct __sk_buff *skb)
+{
+	__u8 val = 0xab;
+
+	/* Drops CHECKSUM_COMPLETE. The new bytes are zero and do not change
+	 * the sum, but the write below can no longer update skb->csum.
+	 */
+	if (bpf_skb_change_tail(skb, skb->len + 4, 0))
+		return 1;
+	if (bpf_skb_store_bytes(skb, skb->len - 1, &val, sizeof(val),
+				BPF_F_RECOMPUTE_CSUM))
+		return 2;
+	return 0;
+}
+
+SEC("tc")
+int store_no_recompute(struct __sk_buff *skb)
+{
+	__u8 val = 0xab;
+
+	/* skb stays CHECKSUM_COMPLETE, but skb->csum is not updated. */
+	if (bpf_skb_store_bytes(skb, skb->len - 1, &val, sizeof(val), 0))
+		return 1;
+	return 0;
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.47.3

