Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CEF3AE1BC
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 06:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332273; cv=none; b=pK+cRNmC+F7NTCveME44mWZ3uN8UcqOoD05Q3D+WGFRgWLsPHYuxPy39TgtzhU+4VaQgevBxgSknjfcOR/5qFW9ZzcL/oP5Qin0RJ8YSuHqGncZEx6eYnUdTIDlnTwrCkCRRtcavquJA4iSgcjOVWkcBL7ITe1XR/UbWiiuH0Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332273; c=relaxed/simple;
	bh=eYCwzFxY2qGj3pCgqVAMjLFFIbI4v5MvL64DV7JicQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nU231w9oyOyb1ecISaB7rtAxsk1DrEKmTwK+NWDROd4R0Lk0pUx5WQGi7wgX5ZfCkzqQqi4YNXT1944oP/+oOcHdCZJYYgcS3Kbihny4YQCLonBITofQIhBwY14IUH7t3uJ3KN2zYH8+2jD/i1Rddz3/sO0SU4EVUBZHbBd/EbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmL3Jayq; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmL3Jayq"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d7f92bde91so1939037a34.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 23:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774332268; x=1774937068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2bTKYrz6TONuhlNDgy7SEn2xSoQ5Qqb0S20rvcw5Ho=;
        b=cmL3JayqeggRQV89G8Km3o8QnjpYMytrPcff4Jxqdar2vr0hzREkEgAqy1RlfqsB3y
         uzagKgFCZspeHJIJfO9xSTkvTxy67i+VvP60inqbFm35IimacAs1nEf7SHhpapWDq6EV
         pdlWswsgojz22h0PWPxGjVr8aiJENMmvpLab7I1LxcZXi9/iCKmYGBvxHO6bT5mfOzJV
         8bKLJJ/LWXKxK+yGSy5arTCHYZtlBFsUQOhJdwtHTV+Ssm1g4eS74bzHvKjzQrrXFMg3
         4uRdCOG8AiDhTyAq8/T7igSEO8TUnLwp9hh+iD1GGRKjs8tdmElkxSdV01iEFfyjVXcS
         zfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774332268; x=1774937068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b2bTKYrz6TONuhlNDgy7SEn2xSoQ5Qqb0S20rvcw5Ho=;
        b=hdidVKBQWFa+SwWejNl/XYK9D5+tPFiYxrKRFOOe9xIZWluB3lgP582gjjNzzmXAiq
         mcdY77OTNlEQe1dwM872jPA6/dKE+Oc7u+ihYP9IHSMAx9+vUht3qGStUAsy7hSceqVH
         DbYEvAskcufjxA6NJoD5sd4QH0SsL2dS7SDYyFQskph08jQxPoZvU6WTojOEAxc1Rn33
         vH9as/o53SZdZZhzhXo5I8Z2VtcmfB4K8aHQV+N27wC2izHIT+r1HJxYgHVL4FAijJ7y
         quK4kkc2yPGHGW8o/ouaXAPGxTsEp0kY5G+FHt5555WEbO4gUarmbq4O5Jaj5ZXxruoj
         +3OA==
X-Gm-Message-State: AOJu0Yy3htl3cihH/VXDblczEFFv/4/G4hHBFijPD1D4CKp5xHQnFE3g
	a9pGwqOAT6lNyEyUigdWGgRnCdhm72kQsx6JUguaYkPQ+0Y1jpBpR1Sz
X-Gm-Gg: ATEYQzxQdYSfTgWHbx0mqLtdTtD68d0lf1404wIpT3djcHobD9XdOB8tuNAT1fxaoDn
	nmrT7J4Dou2zUYgC7tQuvnJ2SL7OaVSH2q9vKUrdFiciOhBN64Jad8+4QaQuymFqyZ4jNFKRdIE
	PKcvJknq6udgWVUQuPP7rs0gUVZYLKSK8sQ/zgRBXndzWW/7OFYk8uvs1fYL/XP0Uj4XsO5xs5G
	x8ZkSh+T6UoG1zptvSw2zGST3UWcwMTr0DVig8zUy3H0hpy8gyvoc7VqvVF5almoF1bQsR6LxDp
	HUNiGtkDhNG6x2wMf3VVDXmOBDreDlERLpHM6Nn1aael9ne/9DY1ZTmCE0ble3aWO18CzolSiLK
	9L2yCXxgkK0HSkr0beVw+UwiK69O50UA2FUU7HDwskWR3zsRU96Ec2R1Rm61mU6p95z2sEWS4C5
	Du65+IoKRO1k7jnDKfkabvbpbYQLIRk8XDWnaDaJbNcm1sjqJ3DQuEKoyS6gNxqbynx0lecKnqf
	N6Ep3jG069cAt+sewhg+uKQSF/gTJs45dFvKLP5jw==
X-Received: by 2002:a05:6830:6f88:b0:7d7:45eb:4e22 with SMTP id 46e09a7af769-7d7eaffb87cmr9661028a34.26.1774332267560;
        Mon, 23 Mar 2026 23:04:27 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7eadcb757sm11429957a34.15.2026.03.23.23.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:04:27 -0700 (PDT)
From: Wesley Atwell <atwellwea@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	gmbnomis@gmail.com,
	Wesley Atwell <atwellwea@gmail.com>
Subject: [PATCH net-next v2 3/3] selftests: packetdrill: cover scaled rwnd quantization slack
Date: Tue, 24 Mar 2026 00:04:10 -0600
Message-ID: <20260324060410.1137199-4-atwellwea@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324060410.1137199-1-atwellwea@gmail.com>
References: <20260324060410.1137199-1-atwellwea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a packetdrill reproducer for the free_space-limited scaled
no-shrink quantization case.

Grow rcv_ssthresh with in-order data, then queue tiny OOO skbs so
receive memory drives raw free_space just below rcv_ssthresh without
advancing rcv_nxt. The final ACK reaches the case where raw free_space
sits just above 84 scaled units while rcv_ssthresh stays slightly
larger.

Old code rounds that final free_space value up and advertises 85. With
the fix, the ACK stays at 84.

This gives fail-before/pass-after coverage for the actual raw
free_space bug rather than the separate rcv_ssthresh-limited ALIGN-up
behavior.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
v2:
- replace the old rcv_ssthresh-limited sequence with an OOO-memory
  reproducer for the raw free_space case
- drop the follow-on ACK transition and keep the final free_space
  failure case that proves the bug
- drop the IPv4-only restriction after verifying the test passes for
  ipv4, ipv6, and ipv4-mapped-ipv6
- reword the in-file comments to describe the observed behavior without
  referring to a removed path as "buggy"

 .../packetdrill/tcp_rcv_quantization_credit.pkt    | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rcv_quantization_credit.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcv_quantization_credit.pkt b/tools/testing/selftests/net/packetdrill/tcp_rcv_quantization_credit.pkt
new file mode 100644
index 000000000000..bb4f63772326
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_rcv_quantization_credit.pkt
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+
+--mss=1000
+
+`./defaults.sh
+sysctl -q net.ipv4.tcp_moderate_rcvbuf=0
+sysctl -q net.ipv4.tcp_shrink_window=0
+sysctl -q net.ipv4.tcp_rmem="4096 131072 $((32*1024*1024))"`
+
+// Exercise the scaled no-shrink path when raw backed free_space, not
+// rcv_ssthresh, limits the post-ACK window in __tcp_select_window().
+//
+// Grow rcv_ssthresh with in-order data, then queue tiny OOO skbs so receive
+// memory drops raw free_space to just over 84 scaled units while the current
+// rcv_ssthresh stays slightly larger. The final OOO ACK should keep the
+// sender-visible window at 84 rather than reopening it to 85.
+   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+
+   +0 < S 0:0(0) win 32792 <mss 1000,nop,wscale 7>
+   +0 > S. 0:0(0) ack 1 <mss 1460,nop,wscale 10>
+   +0 < . 1:1(0) ack 1 win 257
+
+   +0 accept(3, ..., ...) = 4
+
+   +0 < P. 1:10001(10000) ack 1 win 257
+   * > .  1:1(0) ack 10001
+
+   +0 < P. 10001:11024(1023) ack 1 win 257
+   * > .  1:1(0) ack 11024
+
+   +0 < P. 12024:12025(1) ack 1 win 257
+   * > .  1:1(0) ack 11024
+
+   +0 < P. 13024:13025(1) ack 1 win 257
+   * > .  1:1(0) ack 11024
+
+   +0 < P. 14024:14025(1) ack 1 win 257
+   * > .  1:1(0) ack 11024
+
+   +0 < P. 15024:15025(1) ack 1 win 257
+   * > .  1:1(0) ack 11024
+
+   +0 < P. 16024:16025(1) ack 1 win 257
+   * > .  1:1(0) ack 11024
+
+   +0 < P. 17024:17025(1) ack 1 win 257
+   * > .  1:1(0) ack 11024
+
+   +0 < P. 18024:18025(1) ack 1 win 257
+   * > .  1:1(0) ack 11024
+
+   +0 < P. 19024:19025(1) ack 1 win 257
+   * > .  1:1(0) ack 11024
+
+// The last tiny OOO skb pushes raw free_space just below rcv_ssthresh
+// without crossing the next lower scaled unit.
+   +0 < P. 20024:20025(1) ack 1 win 257
+   * > .  1:1(0) ack 11024 win 84
+   +0 %{ assert (tcpi_rcv_wnd >> 10) == 84, tcpi_rcv_wnd }%
-- 
2.43.0
