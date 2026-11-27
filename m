Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774972;
	b=NBiInmDOn5FUMzS37/apylQR6gXlOTQ4W/rgY5BT5Cj/Gk2LT0TvUBgFuy/VlCHn2Zp9
	 FEMVeeAXUpj8exZw+UBgrNl3BEjybRQEBf130a9X0lP2B4pabN4rO/JDE7SMsmcMAhTkX
	 +Vr3saQXSMWKRVdha/sE1dk40o++54klT6zycbXrbthQAfkNYP3XOO9yXRlJjr5fmj+Y1
	 dBmKf0NeYcmk6S6qeIqlFZd+MF3NL6aCYM8s65cprwE4UuK1tZQDSLUVa6aqkbjRPqZiV
	 D9k5J0/UKJZ2UgBfO546trTQvr96b1lt4h1etRlnRFkdyjEf4n8zRCbjsBhzYupPrkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rcLiYjm+Bw7UNaKZxYLwAijXLTVgk+NU4KBS0kQqv3U=;
	b=ZAkQ4lWVmed6TDUD0juborjLO0j7Gy9gbuaLHCF+5NiwW4b51YGoMZqo6AAFOB39O58N
	 bUXocJmJ4Bfcn/qgEvzR0agcUdVUuDoMpQbBrA2Sw0czD+24Z38by4Pr1hLb4lOuO6J3E
	 ++s9FqErP8e7NJ2ooGENQ1nJ9R01xMHWrJN5aBdQLq3rdYsKRbq/naRTfpUcX5xXB48j3
	 Srqq1Y59KG979d+WwY3hkiQquQn5frfsYW53YxAYEFfogZa+7eOCUHBnNsYMn6pgzH0s/
	 YTbtrVnlBOSfMAkBnu2KabJWmF8SswKhyJ2QOoPmzoVT4Mb2Y9eM5wyXoDSzT6GqSBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPY+kzT3;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1B5606A332
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 10:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE1B5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPY+kzT3
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so9026933a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 02:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774968; x=1796379768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcLiYjm+Bw7UNaKZxYLwAijXLTVgk+NU4KBS0kQqv3U=;
        b=jPY+kzT35XRacdl/8zgOfvZ99pEl+zFMT597HKM4mIj4QYGbAajvNOjFula5B87lYb
         ziNy+8KI8skqfjiGuaWvwMezqrmQfD3/lAcFxRg1KghJhiZQbcxIHJPSZKHWeeJj0N5K
         M2h8TkcqoVoVFbMoiH2cwak7V4OcW+KQNzCB+VLmsQFLdeJ3A3WqWAUFK10wh0tiGrFH
         fSOVW3C6jDwbY3IqNitahlg4yUqifsfmiUvvxgg9p8Ziz+gc4Y8lljV5TYqN+ZLzcFZH
         qZsc4+zuE45UtBXFqUNbJOC5dsWFOFgK/wpdD1TXcprR5ZloOsmqSjBYDt4SrsrV13Rf
         6Ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774968; x=1796379768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rcLiYjm+Bw7UNaKZxYLwAijXLTVgk+NU4KBS0kQqv3U=;
        b=crBtXmXZJzlQhfiwiksl0qKxJQUm+/CPotTCapwC/jhT1SpNJERqSfaxx/kS9Wvw8s
         FfZmXjhLYa7fr12JH0oAhuPj/ZA11FtmEAvtCetnFkbfHyzfJ1gcHJTsvdsTRJWnvqgH
         jCEKDkuzAvZwP7cvIure/cd9dMUOFqt9INFEWDjji4/DCfNgpm5EMWNOqak3YlFTMv3F
         KlkNK/D2EH77KgQmqsPmMpfakRAFuT36BaomusovW40Hfv90+Lhxd1XHwRrEjY69u9bW
         m241wgDBo0mOqpwH272PkHWW/8zErVCi3zUXTRrgoMIwLtvNm+arYMaWZZlbS3Rv8wjx
         jixQ==
X-Forwarded-Encrypted: i=1; AL+hErEOpfIHNCOJtcpZn+LSKYNqokHf+VNEusNLac4QIkpQbwjbkAoN3JJxQ270PDZNVaNrWh1UHW99EdljD/brH2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5ltwNyoCvr0u6aulAh5/M7aA/9dG/LfXplEZiq9j7UD+Ta6M7
	j/og4hilVVkfFVpM21/1ClTrj/csvh12l59z13hpBkNeKPyopn1yNxj8
X-Gm-Gg: AZFdTZf+FVi3xwmO9aQJ1LeC0oTZcQRTOJrBgogkqptZ5mG+viGyXi8l5po2u/++ljS
	FT4giUQ+uvW+91zWbM5fIkFMN5TFaqe7XWZjDpxMO248pJWH7gMwoTqs2A7d9Aqbmjr0m3oafmc
	iR8xK4s6IEiKs9OJxNrIYSN7BAoLD8MDyPUwSAmzh4w7K06A9MTJCVC+AhryrG2bt1/K+7rYq4s
	NpAzdFxGrZ5Ly7J3o6btOKhDM0cvU5htDWvMiINQ6gi/Z8zSpAMCyfdIWj4oLMoJ0DKKwfXLGj6
	d9oLPgNGcC7BJBA/vcPcl2fwmoQnDZdVbqUMVP8c5nGFgpjPHatHBIagPbVxCKJAI+zNItzwtMg
	cQfHc43BFdBMkIx8A/hkSkbmA6lgHIlTVzRU3vpoa4folLOm3bWTHaEA1y2Gib/9doiC7tENyZJ
	MU4pBCcuY4xrQwPhOo0CSgScHp3a1KJu/uGsTd8QB7N7MdBRnuEieDyfAsii/tWlMJcHLa8fNR6
	7k8t77CCSjH1+/SVY1RKx3Wpzs49SJUIRyUzACCCPEyRxAshV2bK2W5uBMVyM1oF/B+GPGGupy5
	VkpOTJ6K+HzFIZXpRkrzUnQBGPGKz7SKInWaUPxcmsoRlV/2IOR5CuIxAswf66++nAo6cA==
X-Received: by 2002:a05:6402:2105:b0:6b8:7e86:3eb0 with SMTP id 4fb4d7f45d1cf-6ba37ec50b2mr16425783a12.40.1795774967795;
        Fri, 27 Nov 2026 02:22:47 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm10886407a12.9.2026.11.27.02.22.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 02:22:47 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 2/2] wireguard: selftests: remove a peer under load
Date: Fri, 27 Nov 2026 12:22:43 +0200
Message-ID: <20261127102243.49405-3-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127102243.49405-1-apasichnik9@gmail.com>
References: <20261127102243.49405-1-apasichnik9@gmail.com>
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

Remove a peer while a UDP flood keeps its receive queue busy, re-add it,
and repeat ten times. Packets left on the per-peer receive queue keep
the peer and its keypair alive, which the created/destroyed object check
at the end of netns.sh reports as "merely created".

The ping after the re-add makes the new peer handshake at once. Without
it the other side keeps using the old keypair until its own timers start
a handshake, nothing flows in the meantime, and only the first removal
happens under load.

netns.sh sets message_cost to 0, so every removal under load logs up to
1024 "Packet has unallowed src IP" lines, one per queued packet. Ten of
them overflow the 256 KB kernel log buffer; the object check then reads
an incomplete log, reports peers as "merely destroyed" and can miss real
leaks. In the worst case the loop logs about 1 MB, so raise
CONFIG_LOG_BUF_SHIFT to 21.

The loop adds about 13 seconds to a run. Without the previous patch it
fails in every run with NR_CPUS=1. With the default four CPUs the leak
is hit much less often, so NR_CPUS=1 is the configuration that checks
for it.

Signed-off-by: Andrii Pasichnyk <apasichnik9@gmail.com>
---
 tools/testing/selftests/wireguard/netns.sh         | 14 ++++++++++++++
 .../testing/selftests/wireguard/qemu/kernel.config |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
index a8f550aec..8303802c0 100755
--- a/tools/testing/selftests/wireguard/netns.sh
+++ b/tools/testing/selftests/wireguard/netns.sh
@@ -207,6 +207,20 @@ n0 iptables -F INPUT
 ip1 link set wg0 mtu $orig_mtu
 ip2 link set wg0 mtu $orig_mtu
 
+# Remove a peer while a UDP flood keeps its receive queue busy, then re-add it;
+# packets left on the per-peer queues would keep it from being destroyed,
+# which the created/destroyed check at the end catches.
+for ((i = 0; i < 10; ++i)); do
+	n1 iperf3 -s -1 -B 192.168.241.1 &
+	pids=( $! ); waitiperf $netns1 $!
+	n2 iperf3 -Z -t 2 -b 0 -u -l 64 -P 4 -c 192.168.241.1 >/dev/null 2>&1 &
+	pids+=( $! ); sleep 1
+	n1 wg set wg0 peer "$pub2" remove
+	kill "${pids[@]}" 2>/dev/null || true; wait "${pids[@]}" || true
+	n1 wg set wg0 peer "$pub2" preshared-key <(echo "$psk") allowed-ips 192.168.241.2/32,fd00::2/128 endpoint 127.0.0.1:2
+	n1 ping -c 1 -W 1 192.168.241.2
+done
+
 # Test using IPv4 that roaming works
 ip0 -4 addr del 127.0.0.1/8 dev lo
 ip0 -4 addr add 127.212.121.99/8 dev lo
diff --git a/tools/testing/selftests/wireguard/qemu/kernel.config b/tools/testing/selftests/wireguard/qemu/kernel.config
index 368fd9d60..1adf7cb6e 100644
--- a/tools/testing/selftests/wireguard/qemu/kernel.config
+++ b/tools/testing/selftests/wireguard/qemu/kernel.config
@@ -67,7 +67,7 @@ CONFIG_SYSCTL=y
 CONFIG_SYSFS=y
 CONFIG_TMPFS=y
 CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
-CONFIG_LOG_BUF_SHIFT=18
+CONFIG_LOG_BUF_SHIFT=21
 CONFIG_PRINTK_TIME=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_LEGACY_VSYSCALL_NONE=y
-- 
2.43.0

