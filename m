Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com [209.85.128.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A563E0225
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906432; cv=none; b=sbnDFhuOJ6m+mumTKsJlAzxWQLwCoRxBO8OLn+swmEqpsSOolTb93UP0ny68OtEgK1zNzI+NyWcXpN7q3351Cs9Ub16cSKWlm+aKXKl1sAjxv4eHLrSwFMka49vxS7I5n2sgFPQIJHFi+ruB4crdt2wUhU4qETGHvnTOeZXM1L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906432; c=relaxed/simple;
	bh=NHQizhHkJFek9eWTi5oYmtlX7dFb8feNSqydNnqPYoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hej1BdtzjtW0hPIprYmBIWlIn6MHUx507IjOICGrRUQB3JpMxaIUaqhFGSmBrrsNLxzzsDT70ouqbY+t68B0NkCX1c8u6UhJXsS+jVtKOmnp2ie1Obk9d+nYYW55Je6xiLIfsTd70lUEHuEvNjc7iMdH7qz/M9iTdIN8DnyQxDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JFv78a2P; arc=none smtp.client-ip=209.85.128.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JFv78a2P"
Received: by mail-yw1-f227.google.com with SMTP id 00721157ae682-7966d747c84so3698577b3.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 07:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906430; x=1778511230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHQizhHkJFek9eWTi5oYmtlX7dFb8feNSqydNnqPYoo=;
        b=OhA7Cvq4VwKkWYsKLMoAZspqJnVFEWQK60KNV7mZnjuOCpuNQv8xWEcjIWeug4EoHm
         VD5rarb8aW2yA5wQVad/6zii8Lytj4AiNAcvRM9enL8OKGWbUhzKnVPFf41dSYVHjNiy
         auoeVBO5L5bbiZrESbub6AXRRbSop5mb2IHYSoVBEnbsSYHXZ3urSbs2MDrK6bMACIVt
         j8/G74g1yE3rZsiTqqegcyMag8GkbHDHg4I/UCWCDq3Mg4U93lBah00wI5mTQAIouAnk
         K4UfYxiDhkEEZkgE9sQva6clRZ83F94WZ/R8ZSmJyozvehyLfJo4OwbvxeqKRhBduI+9
         FBYg==
X-Forwarded-Encrypted: i=1; AFNElJ/f1KdvEgUsRjfc6vz4pvSzhul/f3MlVqe7+pZgAqVJfjuimwUk7YgDjCQu1wrdTY8f9o83H1/Deco4/OV2/ZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSXoBeyURF29cpzi1qL6mej5z60kGBtQq75mxJf5BAal1LerS5
	fikIPbA97JbmuJds7Bjg7Dq6ylUlrbvb+7WrzwSEhm77RV+YDqAxvHdanrHK1acAmLBgTKdPHsu
	reajS3KGL7wTCltAT8zqg4OwYOcIHpL6wUorXJA68qUTqI0moDNgh1Ya5NNGhp56CAdOSIKnWiy
	Yi7T6XPtla/quLNWP2u5tHS7L8Wwh/sKaVknGiV06EEBEnihpjRff5FYVO1e/cbaYLQpKnjToPz
	Jh4FIUQnHWXt1OSdTY9njeTGm8=
X-Gm-Gg: AeBDieuumZGR5Hph+0KXDlpyVXD7AfG39hALp2+Ux6XGA4ZaKZmXahhvk59CU3u5WmB
	fUP9z2lqC9ghcglPqMkqXv/f09qt9ci5WJS/F8JSVwJw2STT36jvK1OVFkyJyyLF8EQf0kYahCm
	nar9VpUXo3zPzTxE+bT7fh62eFOaPstc/9+56LSahMh2UaodN13HRK8rPwBZwpT3Uf5KaU8m3bx
	d7S7WOlk7CvMHbtDNyQ9tBaHmbsbt0dpNoWna7E0qnqN1z2Bxfrzn5dzi84Ivvfk1xjzbyPBg9P
	lKGfeSkdjQO70rCUkEcw6tNn2Sr40mik2qifLjInM8b0Du/y6PvpVB25biqmtQEcwOKYYRazEwi
	RozH7r+lw8QIOclFPtvP8I9LzPL1YN9FDjPR8skSReI0D8AYSL2LSSPWyDBZkmaxfsFxbex3a6E
	JxZDthKYvUnOYkVqW8
X-Received: by 2002:a05:690c:3602:b0:79f:99be:1587 with SMTP id 00721157ae682-7bd77109dccmr68794677b3.7.1777906429855;
        Mon, 04 May 2026 07:53:49 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7bd665274f3sm6293327b3.7.2026.05.04.07.53.49
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2026 07:53:49 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eab2831ba2so62886785a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 07:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777906429; x=1778511229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHQizhHkJFek9eWTi5oYmtlX7dFb8feNSqydNnqPYoo=;
        b=JFv78a2PpDkIaHme3ck10Nit/5VwzBWCjaZgNBbnVbjs+P61VvgvHWjklObHY5UsXP
         i0nRUt78bmjxNx1Wy5lNmBPGn8oYv+YjWcVVDPl1gra+6aZA7bnhkr96igmKS9128Ukx
         yzBuQbAVxgj1+hMhr5/9md8y3eDeVzbaF6zgI=
X-Forwarded-Encrypted: i=1; AFNElJ8k82AXnupBKUf8UaBcvRoPzxxnF0/kDWQXyJtcLGbn5fnhJzF5siPTGdDwjD388QBDRPteV+nGZZFT6irstTU=@vger.kernel.org
X-Received: by 2002:a05:620a:404d:b0:8ef:2118:aecd with SMTP id af79cd13be357-8fd127b737dmr1008301585a.0.1777906429098;
        Mon, 04 May 2026 07:53:49 -0700 (PDT)
X-Received: by 2002:a05:620a:404d:b0:8ef:2118:aecd with SMTP id af79cd13be357-8fd127b737dmr1008297585a.0.1777906428521;
        Mon, 04 May 2026 07:53:48 -0700 (PDT)
Received: from photon-d7fac424c0d3 ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1046315985a.41.2026.05.04.07.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:53:48 -0700 (PDT)
From: Ankit Jain <ankit-aj.jain@broadcom.com>
To: edumazet@google.com,
	kuba@kernel.org,
	netdev@vger.kernel.org
Cc: davem@davemloft.net,
	pabeni@redhat.com,
	ncardwell@google.com,
	kuniyu@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	quic_subashab@quicinc.com,
	quic_stranche@quicinc.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	karen.badiryan@broadcom.com,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Ankit Jain <ankit-aj.jain@broadcom.com>
Subject: [PATCH net v2 2/2] selftests/net: add packetdrill test for locked SO_RCVBUF SWS
Date: Mon,  4 May 2026 14:49:45 +0000
Message-ID: <20260504144945.13477-3-ankit-aj.jain@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260504144945.13477-1-ankit-aj.jain@broadcom.com>
References: <20260504144945.13477-1-ankit-aj.jain@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add a packetdrill test to verify that TCP does not aggressively penalize
the `scaling_ratio` when an application explicitly locks the receive
buffer via SO_RCVBUF.

This test establishes a connection with a very small MSS, then injects
small payloads. On buggy kernels, the payload-to-truesize memory penalty
drops the `scaling_ratio` to 1, which shrinks the dynamically calculated
window and causes Silly Window Syndrome (SWS).

The test asserts that `tcpi_rcv_ssthresh` (the exposed window clamp)
remains protected and stays at a healthy level.

Signed-off-by: Ankit Jain <ankit-aj.jain@broadcom.com>
---
 .../net/packetdrill/tcp_locked_rcvbuf_sws.pkt | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_locked_rcvbuf_sws.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_locked_rcvbuf_sws.pkt b/tools/testing/selftests/net/packetdrill/tcp_locked_rcvbuf_sws.pkt
new file mode 100644
index 000000000000..96d3a0813548
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_locked_rcvbuf_sws.pkt
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test that TCP does not apply aggressive truesize penalties
+// to the scaling_ratio when the application has explicitly locked
+// the receive buffer, preventing Silly Window Syndrome.
+
+// 1. Create a socket and lock SO_RCVBUF to 32K
+0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
++0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [32768], 4) = 0
++0 bind(3, ..., ...) = 0
++0 listen(3, 1) = 0
+
+// 2. Establish connection with a TINY MSS (48 bytes)
+// This forces the kernel's rcv_mss expectation to initialize at rock bottom.
++0 < S 0:0(0) win 65535 <mss 48,nop,wscale 8>
++0 > S. 0:0(0) ack 1 <...>
++0 < . 1:1(0) ack 1 win 65535
++0 accept(3, ..., ...) = 4
+
+// 3. Inject 100 bytes.
+// 100 is > 48, so this forces tcp_measure_rcv_mss() to recalculate the scaling ratio.
+// Because the payload (100B) is small compared to the sk_buff truesize,
+// kernels without the fix will incorrectly drop the scaling_ratio.
++0.1 < P. 1:101(100) ack 1 win 65535
++0 > . 1:1(0) ack 101 <...>
+
+// 4. Inject 110 bytes to bypass the length jitter optimization and force
+// a second recalculation, driving the scaling_ratio to 1 and crushing the clamp.
++0.1 < P. 101:211(110) ack 1 win 65535
++0 > . 1:1(0) ack 211 <...>
+
+// 5. Assert the window clamp (tcpi_rcv_ssthresh) is protected from the penalty.
++0.1 %{
+assert tcpi_rcv_ssthresh > 15000, f"BUG DETECTED: scaling_ratio crushed! rcv_ssthresh={tcpi_rcv_ssthresh}"
+}%
--
2.53.0

