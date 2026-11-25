Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570734;
	b=a0uJyRZDMPJ81aiTh/nDZ1hBcNyHY5ji8mmaS33zKvFM1yFWxAwHV4FbJ5pcsyCzq7KB
	 2XTc41r0LdrYemjktI6EviVNQNjIsdRsAwYvOYWvhV5ktrFutkGHwQaiUxSm7zPgkRrXx
	 rnSyYpFuzSkVVTbuybzd4izarmoR3rEkHy9n3J5mpf4Ex6Yvg+TtfXQG5nao2qbIQATMh
	 7Brnad6+bdFNUSZxPlXBNTnvKHhdDKOVe7vr3gjRAn2U9Nm1LpMKml/T6aJWC7gNJWfWV
	 rblI6XFJAiRsJ4BDKlO6y+mqOlwmjRNCllgL4NnpEl5hJ4P69uSO/7V9dvytvMSnoFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7Smsfv+fq1upfUo3AxsaYN4ktsEVw/qOOecYxHG+yIQ=;
	b=Iykh4DKe/GwEbxIrGfmlOUtZfNbeXtyyYb9O7+3bpJs7Vz3dpYyYeAi2LCLE7fBwFebd
	 y/YnAX6t8zYlTZi8iOwQ9mQls+frR+C1glgZYMllYBK2dDc96ayaHHfldKL5x1p/37/gK
	 vIgBC7Z+7Dboe1KGjbU2qhsyOUClJru+n0GOwVLZXKMOIZ+yATow1UfIIXEbhwTn4IUJw
	 lFrB8hTr2VT7C7HSsMwdd711bpUcgneD43h5cheG1uAQJ48tBKeoO7hyQO3YfLuQbRzOw
	 D+2kfu3J0ebifN5L8WSCeICM3y8IeBblO8kjVVDfIKt/tqNMp5xwNaFxn8sjVaBXxGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y7jI1gpk;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8101F606A333
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 01:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8101F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y7jI1gpk
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so2602353a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 17:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795570734; x=1796175534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Smsfv+fq1upfUo3AxsaYN4ktsEVw/qOOecYxHG+yIQ=;
        b=Y7jI1gpkknqY0ABHfZKzFcIABUS03xker81+5srIr+qNUBouJqMuwZ9MGkR3nd/Ynr
         k3kM0qHc3j6AJJ/uzkutbfAKaUTzYkvAlTO8bSlrAYQagbHVQHtQHV72XwdlpuczvsoP
         TpXgBf0QQ5Dyi8VNg7cP3KQpzYPtHWTG5wL17e8PZ1xSe9dW9fj9Vl2NjKrfFFBDDv9i
         loM5hjoFAVpdW3lShzwl75H0xSa/TC+GNBqDo8l9I/dk/Ni9Gso8mF6f89ucmB4l6ibK
         8WxmXfdX+LO31CwjayLfg6w1fbizGQ3D1jXtvX1WLalpM+BNozLhn0j430I2a32Uxm1/
         Royg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795570734; x=1796175534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Smsfv+fq1upfUo3AxsaYN4ktsEVw/qOOecYxHG+yIQ=;
        b=H6TYdHb75iik+FPrVJbp23kmrQzX7+dCjdG/RGK/4Mb2vGU0H0oq85XyfdUKtz08U5
         cLjYn/hCy5O+7+NUgqXwZliJNFegwKw3ZT9A3Ph9vFkwwQsnt5sez6LVUbv7GwLdRQ+U
         D8LxU0K0rLifgAHKS1RIDRRHwbSNzxeuRnxWso1beN3HCcvKrZ1RZj+3HhpAbQE+Avj2
         JM1YrfVJh/N3ga3lmxTPPr1rxUXfWFsLa/0McWxiX1IN8y1+as/hKLOjdVxXe3+gb0OH
         /DznhIGZsmoz/lavFm+Akl0hIlVnnLiPcW25XI4ExGgV5liaXJTtCEVHLmo9Xeb1ZxBa
         529w==
X-Forwarded-Encrypted: i=1; AL+hErHD8xonJ/pPUdwENP2nD2uhuAA5Quv+sIEOJtH/yv0ccK4McQ0K8Jf53kQnh1Jx5M8Ll0XPrO86DhYEd8dA/hM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dsjvTgJE0WxgzC8aULxIaV+EmfXquNPG35PIbr6KvYbUdr0Lx
	tiQYLEJKM7+VltWWii+pgqYgymB4NabV9fhXSmFSZCZAgYhNVBPlgRFfMGeHVuwX+0s=
X-Gm-Gg: AZFdTZfOXk/kRM0q5wg94/gUWxPU8ZoWw0gasBGcfrGZpBo6sicO0MDV6LiXPuP90yA
	80+lm5+n0huXNIYSCgazcJwbwMmZSP1PB6GRmxEMLe1HwVOR9OOjExOnuc39yc1l0DYSVO9xpif
	TyRuh7GCjX8JoxQfDZQLCRarZlA6L3MSvLiiSJt0cMi25bttsNI1l7GXp4zlPX8jVbOfn0RDZW/
	zUs10MT10lbYSM4Hz8MwPYe6wyY08AOJWUi+OGam2MSgixN1GPAm3s7BsPCcXeFmB0bPVAhNYEw
	xT94aU/3ByPDJZ2TpHda6ZmI+j2Cdw2a6hYnCDkBAe+HitVdZ/4UVjjvfsvsz5t/lyZ58dsB4IN
	jbcnVWDs5PPXWsuQH/nupmiflytK15Y6N+9GwnORBrfasRxWVuj7JJC5m5cbzLNWRVkX6tjEEkT
	2ysgAVzmAyh/wfEs+n3B/rkHy16zAhfMpy7qtVQxhDRED1kRug50dLjVdWHus4zdQr+fwoUNf6E
	EUa0OlI0dziYmVT1SrIwpRDKVjpSnu8K+y79C9q6FDhtoTnd+zLptnchUOQgmfJgdYXO7n2HSUp
	6sOJt6rIEOz+F0ifI/+FaftWEUzfjnMEyNrDCo55utg=
X-Received: by 2002:a17:90b:4ec5:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b41c9476d3mr15912929a91.37.1795570733806;
        Tue, 24 Nov 2026 17:38:53 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:53::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b82e624sm10708674a91.4.2026.11.24.17.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 17:38:52 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: edumazet@google.com,
	horms@kernel.org,
	narcisav.kernel@gmail.com,
	Joe Damato <joe@dama.to>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 1/2] selftests: drv-net: uso: check datagram sizes at the receiver
Date: Tue, 24 Nov 2026 17:38:35 -0800
Message-ID: <20261125013838.3823834-2-joe@dama.to>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261125013838.3823834-1-joe@dama.to>
References: <20261125013838.3823834-1-joe@dama.to>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The receiver only checks the total number of bytes received, which is
the same whether the peer gets one datagram per segment or a single
unsegmented datagram.

Run socat with -v, which logs the length of each datagram received,
and check that the peer received one datagram per segment with the
expected sizes.

Signed-off-by: Joe Damato <joe@dama.to>
Suggested-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/drivers/net/hw/uso.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/uso.py b/tools/testing/selftests/drivers/net/hw/uso.py
index 6d61e56cab3c..b0936b6b2161 100755
--- a/tools/testing/selftests/drivers/net/hw/uso.py
+++ b/tools/testing/selftests/drivers/net/hw/uso.py
@@ -4,10 +4,11 @@
 """Test USO
 
 Sends large UDP datagrams with UDP_SEGMENT and verifies that the peer
-receives the expected total payload and that the NIC transmitted at least
-the expected number of segments.
+receives one datagram per segment, with the expected sizes and total payload,
+and that the NIC transmitted at least the expected number of segments.
 """
 import random
+import re
 import socket
 import string
 
@@ -57,9 +58,12 @@ def _test_uso(cfg, ipver, mss, total_payload):
         defer(ethtool, f"-K {cfg.ifname} tx-udp-segmentation off")
 
     expected_segs = (total_payload + mss - 1) // mss
+    expected_sizes = [mss] * (total_payload // mss)
+    if total_payload % mss:
+        expected_sizes.append(total_payload % mss)
 
     port = rand_port(stype=socket.SOCK_DGRAM)
-    rx_cmd = f"socat -{ipver} -T 2 -u UDP-LISTEN:{port},reuseport STDOUT"
+    rx_cmd = f"socat -v -{ipver} -T 2 -u UDP-LISTEN:{port},reuseport STDOUT"
 
     tx_before = _get_tx_packets(cfg)
 
@@ -70,6 +74,11 @@ def _test_uso(cfg, ipver, mss, total_payload):
     ksft_eq(len(rx.stdout), total_payload,
             comment=f"Received {len(rx.stdout)}B, expected {total_payload}B")
 
+    rx_sizes = [int(n) for n in re.findall(r"length=(\d+) from=", rx.stderr)]
+    ksft_eq(sorted(rx_sizes), sorted(expected_sizes),
+            comment=f"Received {len(rx_sizes)} datagrams, "
+                    f"expected {expected_segs}")
+
     cfg.wait_hw_stats_settle()
 
     tx_after = _get_tx_packets(cfg)
-- 
2.53.1-Meta

