Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2509544CF4F
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 15:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169117; cv=none; b=SCrY8ncqBBsuzTFx/k3SBWtIsKRcUNH3BXEAMy1doE8tio3AIFYFYGJZn+A+DvOQT3smdKvuyvwKzpcadSZccDFxzonjJsD2Y/Vf8V7kJwzhjX2+vIHDOoClFZCNqR3CYOLrmr71q/uheRLn6f9MzmIx8XpwN8f2ZJX/yTn7XDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169117; c=relaxed/simple;
	bh=N/c5QH2LpQTCnVMZjv55xEfP1S6t/HG0AX5pqSkBqBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9vLjtIlnMtScr/f/yRXxfhA70rfGEhXsIYTJRbjwBKf0p9d4wZNzFSF0rbK4qMxY8r9GX6YtdmzmYMtp0C+bIMwjLj2jb6empbNYej3mMvWjlAlkPaGh9hIIQuERAKJsG49MZECvZHTLyt/63AKUuppJ/IojosalFv/7oW4ADg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FVziDCaZ; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FVziDCaZ"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-364e640dea8so174182a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 08:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169114; x=1778773914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Gej9rC0V5wj21YK/OT0tP6dMq4zLV0oZtuZHtg6JDU=;
        b=RFCWnC9LHep27o1lFjpNAuUhiRJrggsYM0ldERc94UdBRKuGJ+2Ocr8ioxOkDYeVFH
         sTHeL6piMCrh5zYM1emYV1fGWGqq6Hu/IzTagVxLrhUYzLDUCAu/ViSLEJhHPc+uRQMw
         EA0qTbr+nCv4fs99W9pzjRADNKGbjN7c8GsaIW6G1b1TbjNLDW1pZ1CyNyvnx6toiG7k
         VUNI7q8boXfSK98h9T2kXJ38LvT/wihUhY2/Z65jzzg6HLjuU6YdnX4y6driVI8BWD1S
         32wpWYZvc4m71nL8/Hu5DcDf0xTeU5nh6J80kZErTJ7pLBU0B5+emDqMKZ87FZk6DcNZ
         MoBg==
X-Forwarded-Encrypted: i=1; AFNElJ+7RZqNloXMrtfFGF1aIfTMgmNJzoSbuH0cQ2NVCQlB6hABoUL9ly9kUu297dvhKXENPjIFymaCuaBhjXNVc74=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxaaKhBlfi+nSa1xpt/xoCNalZmLPF5LDVJFxLsqYAcW2D8snP
	diPouO965BrY8KkOMVdGR5g4ei2IZ5zpcVLGegJZZGI5i7hg/X5UghpBS8xRa4u70kl7TPQIxJm
	FP3J7zHbUpCn0PYU6LDDp/UPCwy8riR1BftRaWhlmwurXq+ms6Lf4FRTvURa8eWZA4up1sfdmJu
	T6geDdECgTmTb33U1cETHGvhvpz+7nNcZHBQieQIRkEo8+RyzrP3JuB/BcQ6dzoXVbaWrgPjP1M
	p/Zzmtkr8a+oucvUg+8fzNq00s=
X-Gm-Gg: AeBDieuriZMTsy/ePlSzDRVdhPjArbqeJ6v/tDgsv1yPIfvyGIuhhrpHbauiyiN4R3H
	sahMvEXNY3WMAmBZHloH29T2eF9w1E0Es83tF2qtb4NOGYnI5/9yv3U4B/V/SXOGAizyIgYM0oR
	wS4ZXsUsqb9leKGaAmKJRnyktoU+SEPPJ//j3efek+gHoKqhmd8hOycvkdD8/CLKOG8ss/dfju6
	uf7TjRbNS/g8GJ4gAk7WppF2pQNPN7NsgUDbvG5fiPIKW9azqSruvvMVJcZ8Joo5Xvk6aydgPlc
	dDHOEGLpECA5ZTR9v5PS7i+5lvLCYNuMDbJax6R8Tr+kn4ekG30ej4MmTHIJqQfPjJ19rE5120k
	PcY4fv4hRKSYdrIxfwI0LbRA3by5gWe3/iFHccWMBHHSAR1mSgmBCQjVQK3GZlo8PLCKYqmG61F
	nJkx0i41xDzZB6F79fb83m0wMzsnTbvYB1+hB7kd6bLSIZ60c616h+85wrmZcPx2tMPIBI
X-Received: by 2002:a17:90b:2703:b0:35b:ed51:afac with SMTP id 98e67ed59e1d1-365ac782cbamr4515138a91.6.1778169114433;
        Thu, 07 May 2026 08:51:54 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-365b08dfb7dsm380060a91.1.2026.05.07.08.51.54
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 May 2026 08:51:54 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eec753a7bdso28705085a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 08:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1778169113; x=1778773913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Gej9rC0V5wj21YK/OT0tP6dMq4zLV0oZtuZHtg6JDU=;
        b=FVziDCaZt9A7Icol0tsQQITtIfwOK/o7xP5yLgiX2GJVx+0cqGOBw+GuDXuJGQJiPx
         yLRqm5IoYHFUSl/29gYTFci8pnlywIs463JIHfdb5x2n6OI313D+T26Qcy/Kt5XeCm1W
         XI+SffGrUPe3r470jHOz0HeKFKa+dRG0IgMTw=
X-Forwarded-Encrypted: i=1; AFNElJ+5M4gM7famv9OgQeOvVn6KNTsPVvUk0mvSva1R7/kAOGarG+1iCrLhZg5IcW85saeVfbF4S51NdOjTM8LWluM=@vger.kernel.org
X-Received: by 2002:a05:620a:3195:b0:8ea:c7a8:5065 with SMTP id af79cd13be357-904d4392205mr887326785a.2.1778169112836;
        Thu, 07 May 2026 08:51:52 -0700 (PDT)
X-Received: by 2002:a05:620a:3195:b0:8ea:c7a8:5065 with SMTP id af79cd13be357-904d4392205mr887320985a.2.1778169112144;
        Thu, 07 May 2026 08:51:52 -0700 (PDT)
Received: from photon-d7fac424c0d3 ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-90642b76d39sm240711885a.2.2026.05.07.08.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:51:51 -0700 (PDT)
From: Ankit Jain <ankit-aj.jain@broadcom.com>
To: edumazet@google.com,
	netdev@vger.kernel.org
Cc: kuba@kernel.org,
	davem@davemloft.net,
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
Subject: [PATCH net v3 2/2] selftests/net: add packetdrill test for locked SO_RCVBUF SWS
Date: Thu,  7 May 2026 15:48:06 +0000
Message-ID: <20260507154806.18635-3-ankit-aj.jain@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507154806.18635-1-ankit-aj.jain@broadcom.com>
References: <20260507154806.18635-1-ankit-aj.jain@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add a packetdrill test to verify that locked SO_RCVBUF sockets do not
suffer from scaling_ratio truesize penalties.

The test uses a standard 1460 MSS and sends medium-sized packets
(600, 700, 800 bytes) to trigger the recalculation logic. It checks
that the internal window clamp (tcpi_rcv_ssthresh) does not drop
unexpectedly.

Signed-off-by: Ankit Jain <ankit-aj.jain@broadcom.com>
---
 .../net/packetdrill/tcp_locked_rcvbuf_sws.pkt | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_locked_rcvbuf_sws.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_locked_rcvbuf_sws.pkt b/tools/testing/selftests/net/packetdrill/tcp_locked_rcvbuf_sws.pkt
new file mode 100644
index 000000000000..43e1d00d5f26
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_locked_rcvbuf_sws.pkt
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test that TCP does not reduce scaling_ratio for locked SO_RCVBUF.
+
+0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
++0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [32768], 4) = 0
++0 bind(3, ..., ...) = 0
++0 listen(3, 1) = 0
+
+// Establish connection with standard MSS.
++0 < S 0:0(0) win 65535 <mss 1460,nop,wscale 8>
++0 > S. 0:0(0) ack 1 <...>
++0 < . 1:1(0) ack 1 win 65535
++0 accept(3, ..., ...) = 4
+
+// Inject varying payload sizes to force scaling_ratio recalculation.
++0.1 < P. 1:601(600) ack 1 win 65535
++0 > . 1:1(0) ack 601 <...>
+
++0.1 < P. 601:1301(700) ack 1 win 65535
++0 > . 1:1(0) ack 1301 <...>
+
++0.1 < P. 1301:2101(800) ack 1 win 65535
++0 > . 1:1(0) ack 2101 <...>
+
+// Check that truesize penalty did not reduce the window clamp.
+// On unpatched kernels, rcv_ssthresh drops to ~22K.
++0.1 %{
+assert tcpi_rcv_ssthresh > 28000, f"rcv_ssthresh dropped unexpectedly: {tcpi_rcv_ssthresh}"
+}%
-- 
2.53.0

