Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D5E35E956
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 20:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385594; cv=none; b=C85huZFMgnesdp6P+WYEIOfxhZuEG2VfYuhipHgu0I0tlUbSjBTBP/Pnu9h2ySofPxk7x8fQJeMcMtpCnc8c4f3jSb49EvuQ9RRN1at174TQFJ+9L7O7aROO/VJartkddRAlpMEFAJIiNynlb3k7Cy+T2+U7sB3dvzd4j9B5tu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385594; c=relaxed/simple;
	bh=xqZQ3SvaBjFkGhtlaYhusneOcuRfyDHHa5x9/WtiaUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dfe1dwVuQTQkhUygzOg1LVpj26SbW4ItW1LoYbRVgcCx30Xyeoe3ft4BP5t4gHLrN8O9FgeQKVZEOoruWDBApLaHFNFO3soKaf7+jX6JURD2eN2knrFfymXT2mSJZ0Sg9a45gca5xTTU5FVKzYWJzeZQvafPf0iiVc2MK4+cwLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8gOfnNb; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8gOfnNb"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-67c1e0718f1so3264233eaf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 13:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774385592; x=1774990392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QV9GcPB3CgMH11snwri74jW6U7GqWaCu+8vUwZySiUA=;
        b=l8gOfnNbJKIFBeQ/BPo23ak2J4hM+ICAT4sm/uxpT18Lcxio6Doqdrh1D0e5AsXlG5
         kKrMd0Fv2fpp+DtJgqAIvWZpFgwx8tRlALGUahnfVRwHfeE6FIjPxw7emClgpusR3IeU
         5h2k1iPWf2uanaOWijx0D8G2QzMGrcTUgywreZXp8ZCGWsPlR+Gsv13jSxDowsLHAt1r
         DrXv0eP+SbdTGM4R3XvUsIQ9jZU+ACrhY5JmYBDXgO9qvjbIAOxHTSzlMQ+4YlKUo3M2
         zPlZRYa6TDaeRQvDwOCRopTh1f8OsGIJ344wTzYpSeerbpxdrYHPqAUE9TY8vXKXL/OD
         tD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385592; x=1774990392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QV9GcPB3CgMH11snwri74jW6U7GqWaCu+8vUwZySiUA=;
        b=CiqdZ+GmH3deTzT/pb02s/weh4WKlN3XYOEFqx5y+KNrChi1trsD5hofIO34aUDl9T
         FcXMI2ud0SUl7JC3hw4Qwd4Uv6AflDIAjJ8uxWysbzMwTk7MepBrvRv3DuFe4WWuIx2z
         GHALMlorncocMWrNmJ4Cxxcf4OY0PnBMeRlT4z4MV6r5FJ59GNlAWBSwPU97q2wMmmu9
         7mD851ycZHYGr/AcMLFdqOeRIBOVf5UWkSXBbXoqPrJDELO6MKYi31V8FcDJlp3HFC7A
         Xe5YTehm9erUIIaFwe3piunaGrsmxi0A4s1pi2/H19Y6t39WmyM8YzJkCtCTExcjexgx
         /nqw==
X-Forwarded-Encrypted: i=1; AJvYcCVxlEJ6R0s0fZak5aeuSrVg4Kwy6uLY75dXwGWbamM7q2nQSCRiu7eM9KP+q5rLNCv5zlvO0tdp85LBU34Kjxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YydzoDvcDJRhY1aKDwNrx+YtjP/iBDnRU9jtolLJXoe1/UPsgAW
	sy+VumaSXG38mN3U6TDpEyAiOP4Z9HEj3Ble5VQVENPXHlppEPyspV3C
X-Gm-Gg: ATEYQzwv8rXj0xpsOWCaVus+DXUe5PJvIRTpwgjMU7hs0+7q6mc2W4cvoZD15PlSyjb
	I2t0HClubRHUFozm/LVtErFuv3BIb9UFcLZPxmjW4wol+HLfVyQ0NxddMhkoYPyRtkDjNEFv9nb
	6VykvA41Huu/BljaJVGJPWCR75i2+hIeOh0BF/VFKN54T8i058RTlJNvKu49TXm4cKY+bNbtFau
	4dFxoGo/IFW7sY2l6l1p+owbkqIfovjwMjx7e/WPgidRtDtiptZum5pjXHSmh73Hj8gOMLf1S8F
	MNwcOJxWWQQdJ3NBfhDzc0TpplfjrvSdlVcPVherJLu/GWNZWG1vx9jODJo/o4r9aHm6tt3u0G4
	2nLQJdpVVB+jqMzFypqqLClg8bgRTwWr/pGZfLJC2OaxqArU0kJTV/+hlUcIC7YPxgFwbvYyN5e
	7WEDD9ATDM595Kdu1miLqVhtnrBbo7RU7NrGcguM44S0Sk+c8oFM5Nj45bevLMS4GvrwSKmaisy
	1Qs6LQvrN9iyC1griLYBQq0e/VYMnz8hc8gCAJU+Q==
X-Received: by 2002:a05:6820:3108:b0:679:88aa:7531 with SMTP id 006d021491bc7-67dff566397mr657706eaf.62.1774385592564;
        Tue, 24 Mar 2026 13:53:12 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c252c91d0sm9125161eaf.5.2026.03.24.13.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:53:12 -0700 (PDT)
From: Wesley Atwell <atwellwea@gmail.com>
To: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Simon Baatz <gmbnomis@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wesley Atwell <atwellwea@gmail.com>
Subject: [PATCH net-next v3 3/3] selftests: packetdrill: cover scaled rwnd quantization slack
Date: Tue, 24 Mar 2026 14:53:01 -0600
Message-ID: <20260324205301.1361608-4-atwellwea@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324205301.1361608-1-atwellwea@gmail.com>
References: <20260324205301.1361608-1-atwellwea@gmail.com>
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
index 0000000000000000000000000000000000000000..bb4f63772326fb1146574ad3f43d59082ee49c18
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
