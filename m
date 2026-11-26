Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686453;
	b=VxjiSM4+hcEZZ9JR5u9JLBOUAEdoLCoD+1lWYR6T1Mm9eRmoZ9GKh0/i/Hrb2nZ7KrP3
	 rouGKpefsslNyvK/so4MUBvWOnK8jxjzGgk2jw3oPspmFak7bD9idvy0aCpp0ExEfHu49
	 ELNBtRorHQIeknVuerRGicyrYbQQFqSbsnwe58MFP/lyDdCXnv4xX6GrnsvJrunMinRtG
	 UfRvvtJRTnJFhZeeZ/2EPdVwRxqj5/RwT7hhuXt/Tso/sBjVMKfgeYJUA275ixpWL2mUF
	 gKyXpDVcg2gpjjSUyHXFeHJLAFZClU083T3J+YdZgGbaYwhy6Bc0k3m92XoDrFlXwlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UH2IMeYVxT8rS/5LnU9w8cMAnO78HMIPaSbsms7ayDw=;
	b=gTEzW9ffhMRBDj0HBLj1h38x7V1TtPbGH7sEniOwWYTSPsmFRBuCUJB8jauUraWkSqXt
	 Rt0tZt6bmIY/+R2Rf4n7eVyNrlcLYvuEV/eSNRsjX5bZR4RYgrvRk2CCIwoCGBhoZDJpf
	 4pwby5SyBq0QVyIdawpIq4BXJq9KQEM/RxkuBHPnN13dehIgFRwTVHwGCMO0I+rQBIGhE
	 cn8QxxicA6ijxqYXfErH6NCUUkucN+MEzYTsDjvWSrVSyV2ORHUClDJfD+yleIZtAjsFB
	 Akj12bktD9gATWWBgfrQ7End6QrnkzS5bpjwsG7aSgCFJoagAeHBvDmW6AWOT5HMmhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YnnoxC4n;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB26606A33B
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 09:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB26606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YnnoxC4n
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c515319dd89so212443366b.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 01:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795686451; x=1796291251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UH2IMeYVxT8rS/5LnU9w8cMAnO78HMIPaSbsms7ayDw=;
        b=YnnoxC4nsRl4dppSaIG6h0tMBVgv0V89ea9FGpoYNF7Ypd0OfpXOJgp2neQLwh4+vk
         PD9wTqwuVTrqa7n6TEVaPW6UYBdexjFzc16At8pyR2rvEUS7gmFw5PMvNH8IAhZWu3Dm
         ui0Pd5xm1h0V2uPamOuvocqwke/O0nt8Hpu91bcd3yj61LPsJ12mfSk0k0MN8iHtB1K9
         k/YJJ5G8wsyl9mJ5wrJdR0sFkJgoFRtzu5NZ8SqgaqQnDwKmuiZiTKe2EFGuFw9IB4/0
         NHO5EsXrW0chnRa86+dVM6ObnRQAsbc3LxZIBC0s2FvCTkn/3mT7kR6LbH8y/AIoLQis
         ZhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686451; x=1796291251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UH2IMeYVxT8rS/5LnU9w8cMAnO78HMIPaSbsms7ayDw=;
        b=o63m8klarjJ0Ghi9ftpp7uh/57VqIvtow4mKtG6bBvE7gvO75zSOhPFlfoYf6qODcZ
         /X4GmBrtnw7lvLTh4mT7Ylt6EMEeIlYdxtcrZzBzASuEbZiKiuSGjH7ZPGiaf5LgkBsb
         +muKI2xvXzA5/hQ9P+4RGQtNGTlNkAPemc0dVVJ1f5F4o1Wb8bj9Okp2wDZytiHX0ojk
         lMSKEwv7cs54Dss/GxpMMOgoJBfWHRCN798w7FCT57NkEks7WG909KzsJeBN2sn69SIy
         Px7h4JBtRWbaSS128q5XyqSO78FK8oLuNgqyQChV7BRJ65t1WNTTkzxVZSD5v/L7C+Py
         qipA==
X-Forwarded-Encrypted: i=1; AL+hErHuM1+bFd0eVGdw3t8tHuVc0q20qtXtsclwO6155R8x0G2cON0WgCnkfBYZuYnugX4R+YRCreCtkKClSMM9TLs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zjXBkMbLEPBJC2+OICrPBbUxzGeT5hSCQwLaiPBjzqCI4oLhz
	2fJvIEjum81xOXgTuZFp0W0Yu1QylvY2vdOqywc745RYjYV+QuIfdTBh
X-Gm-Gg: AZFdTZchwcXYHUuCmIia6yyKXRE+sA21BUxdf8O498y0VwQ0aao8cKLDc5jbSg8vqnP
	pikVp61K9PjNllAz8pt1SCCVr+Mi0Q30oZVbrzW6OmnCVg8QDOhmO4KBF0DsmBU8NtCurtVGcI8
	2QE7HSo08+RkdxdZTYRvQqvfNTEua8fMKL9m/NhP9CpSMJw4vrxIE8iMnVgBZbYt/am3M6LCHJQ
	6qJ5HLVTWpxiX47KvKxOQmQuYILZ1kxJBisvWrN/rR+E/Jgli04D4z76hzPNFwMJtDUg5UII80l
	7VohCZF6eGN9u0YDrPxFGLqHnc/kSA/NbRoWW/tGvmi4SZ51EI0wDoIU9Hy36lfpvbnOqMwf0L+
	xc0MQcp12ZXQSl81sQW0NhBS/VqIPSqkpPSXRekFepDI2BtRMrTlkejreO7WuvijYhJpQOdNIL/
	oDzXQI5K3+klAf+wMlbH37IkgqzO1YsFXjSxYkk9hwsNLTu2oCA2Ycy3DEvwmg+m+pEE02swpSd
	bcsiYhlIglWBOLvOqViF4BPLw1kkLKus0elOEA6Hoj/0ek2RqvDNlmUxoeFUuUewuzitU4Ie04Z
	G/szVuXde0azoqQqi1O1hJ2z2Y+AjiXtmINrRAsX0zNdyMgA
X-Received: by 2002:a17:907:bb48:b0:c2d:c98f:4824 with SMTP id a640c23a62f3a-c513a9af930mr1554663266b.30.1795686450911;
        Thu, 26 Nov 2026 01:47:30 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b002b9fsm727100666b.78.2026.11.26.01.47.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:47:30 -0800 (PST)
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
Subject: [PATCH net v2 2/2] wireguard: selftests: remove a peer under load
Date: Thu, 26 Nov 2026 11:47:22 +0200
Message-ID: <20261126094722.73025-3-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126094722.73025-1-apasichnik9@gmail.com>
References: <20261126094722.73025-1-apasichnik9@gmail.com>
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
and repeat ten times. Packets left on the per-peer queues keep the peer
and its keypair alive, which the created/destroyed object check at the
end of netns.sh reports as "merely created".

The ping after the re-add makes the new peer handshake at once. Without
it the other side keeps using the old keypair until its own timers start
a handshake, nothing flows in the meantime, and only the first removal
happens under load.

netns.sh sets message_cost to 0, so every removal under load logs up to
about 1000 "Packet has unallowed src IP" lines. Ten of them overflow the
256 KB kernel log buffer; the object check then reads an incomplete log,
reports peers as "merely destroyed" and can miss real leaks. Raise
CONFIG_LOG_BUF_SHIFT to 20.

The loop adds about 13 seconds to a run. Without the previous patch it
fails in every run with 1 vCPU.

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
index 368fd9d60..c69a408a5 100644
--- a/tools/testing/selftests/wireguard/qemu/kernel.config
+++ b/tools/testing/selftests/wireguard/qemu/kernel.config
@@ -67,7 +67,7 @@ CONFIG_SYSCTL=y
 CONFIG_SYSFS=y
 CONFIG_TMPFS=y
 CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
-CONFIG_LOG_BUF_SHIFT=18
+CONFIG_LOG_BUF_SHIFT=20
 CONFIG_PRINTK_TIME=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_LEGACY_VSYSCALL_NONE=y
-- 
2.43.0

