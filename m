Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794771349;
	b=S3MT1PnB9ZYm+wevVh2KWNrPChFNKY6U2m16dqDFCSViIBrKScl6iz7kQ2fQ7QbR3UOM
	 iGctVnjj1ayRn7ho/DDxwU/8pUCLWKevHSDK6799l+8sQoHBy5cPFPzytwEBmm+g3vT81
	 1bwYGITcGhBwVeRMAGBS4UUiQx05Ifxbm/wF14yzukcfbOuiq97reGa1Cbk5PV0BCvq84
	 IVxyY7bMnra+ZxC5WYwzPerSGQstShqS+JitydA8LZmUWvDm+21Gxyg9foQRoq6PVuQFz
	 MuLwKXszy2iP5wwbUAdhX+m5WLbHAEzqvrBdLgI05rtMACDFlp+T9mCuq0TfPkJhn0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tK8pY04ULzlkXT8YAD8XuTJKOa5LokDbsoPvaMBMCag=;
	b=pOfFMRAraVAeLvi4NgTO3NHaGnQMbA0QJC2CySXU6Mi9fA1/lK6iIwsQ6nw/7WWwh0oB
	 5Urp0RbgOhWpkwFDGrvlK1CP5wcXBUlG8dqmvQBfsBElXiAy6nID3qh0gRlWlDhz015Ti
	 9vABLqa1xB2NqoGBqtcnPld/q144RxP5u4POAQegzg3dWnHacY+cYrclKirTYMIi5RD49
	 5Gmxb3BFOM8JFoQzcG979ThbVQtIqxu6RvgGZDZbI+1xE7HhjM+1htdbjK3gnAMpuMDDf
	 +JV5ZGiqpWPrEaUu0p2dQtYuotDnuU+ddHIIpvpA44OQYYEhR0bIEz9WIzIPpe4U7iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=MMyf1xFt;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D5D606A331
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 19:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D5D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=MMyf1xFt
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50e26763a4so958466b.1
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 11:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794771343; x=1795376143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tK8pY04ULzlkXT8YAD8XuTJKOa5LokDbsoPvaMBMCag=;
        b=MMyf1xFtg5f7mLaOMXYxwa47KeuCHgfiZd8RIsmV+iKswcuNbpdOy7R6jGAcXURrwd
         F9fdnbsev7jw10wt1hakRflYdyGA/wcopixTTlIQ/KEcoddgo6WPW+gC2I9Qzz7PVxw3
         xWoqQ3exgnLR2Qx0ckTJQAR3Uf55mo3ZyB0Svwq3WvRzn5depXvTQ+5SWPVKzCf8KKKV
         thiKRleMyXRmUXqkjy2I+ufHBP25FpqQXotf8fiA95joB47SvZzHwHSUa51oX20TSRIj
         Z17FItr8Hz2yhbhmP0lO0jxZzI453u/Vx8IdaXeKXw9avYW3DIDDKNkU3owggpV1YVXM
         qpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794771343; x=1795376143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tK8pY04ULzlkXT8YAD8XuTJKOa5LokDbsoPvaMBMCag=;
        b=Efm85CM0wTFO9o2QPW4Vu8rD+NVFGx7ttIvAwSv7cVtXi7Du8wUizIkZJwt1TVTi86
         EEenEgd5wZe8NtajHoFtBPHgUkDAwKCYXIENxe9tDnHqahaxZGMlXdCVO29yzGWFZtJ+
         pImntvo/L9Z/DBT+fqmCJLsdT/sBzs+d82iuRh6JnnXeWFBZz9eS9nnt8XMf496VU42T
         4TW4SGwKIb4EZuhvPFeLMNAO/80Oqack+zKja8evZKPmksuIusIfot2AtjA9QdC8g2/A
         2FI+eBsOs1GqkTydKgL6ZfHy0fmSWXKSj3bzC+G1X1b6uUhgOfSx2XEicDQ2EWX01gKC
         4apA==
X-Forwarded-Encrypted: i=1; AL+hErG0fyUOZQTbtIn7l0YTeNkMFg6WdTEvhVpxV2X42wDVYJXEY/V9lqsO9Xv+LIw+r/FDNO0w4SwcKYxdJbCpSxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z86F1vOPqUXPZQ5dEY4G54+z5C4ofyXD5tTT5d/SXbxQXSz7Aao
	C2iqm18/XMjjMXeaO+69DWsYRiAi3uX6/knQhx/WXrjgdveFnwb+2W6mo+dWAteNiXQ=
X-Gm-Gg: AYBFou1+mhoom5ymwK2S0nVrQsi67ZAd4Q9p2r44DYVAaPCYwd6jrR8Dk9jgjnwFP/S
	0WJJQP530euGIOFYkZM7ElbAbHzrH6l2B9jSWIxNwD8s1Kq8p5y2+e25W9c+AlITPxIfg7R/+Xb
	H+II36RArxBsVewxWPEx7vZy+KQvnmdU7i4rA/ERhKbcEpkM+/mcuwXDQvlU2ek4DZT1aK2Rs/5
	98D3WOKg137o6Lg/mHQBs+u76tEVOe8CbQ3Rxpbrdn1LdDNYNLu/9vNsmGgJ8aZIoZjv1hB/LAR
	c/K7A4ULKw1iVnQuRsUU4t3sQND+50d23XBEJUs+hlsveOvm0jEQDQMkOvPbwDUy6sbrrJsJH4u
	Dl50z8hc7zQ2GL/N8D6zk8B2IDqwjysTZ5r2nw0vcoE0Fmeg4gDeI4eLHAZbEQdI5TM3/FbncuP
	6q7tnZTxsfFG6AeSwiliO2r5roA6d+4ug4t2jTzELeAVD8Af55/aN+xzO66zRl5GYcflqAQk3Jr
	wNRGaQT36WUHZd2TJpsglPTA7e+myxvswxQBMx8/Jq/F5sDhEO9RQO6DZG9bzbGgSK8dPPnOtSV
	i1FxKi9CzwStVvC2Sscl6/Ak5gHjZVyYNGd0D1pqe2DwfmxCtnaYelXqwqUPQlsdCr91ufK0wN8
	5e7A=
X-Received: by 2002:a17:907:c05:b0:c2e:378c:8ce3 with SMTP id a640c23a62f3a-c509634a522mr696307566b.32.1794771343416;
        Sun, 15 Nov 2026 11:35:43 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm340448766b.16.2026.11.15.11.35.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 11:35:42 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	toke@redhat.com,
	lorenzo@kernel.org,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	joe@dama.to,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v3 3/5] selftests: net: veth: test RX queue NAPI links
Date: Sun, 15 Nov 2026 19:35:29 +0000
Message-ID: <20261115193531.57679-4-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115193531.57679-1-tianyi@cloudflare.com>
References: <20261115193531.57679-1-tianyi@cloudflare.com>
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

Add checks that each RX queue is linked to a NAPI instance of the
device while NAPI is enabled, and is not linked otherwise.

chk_queue_napi() reads queue-get and napi-get with the ynl CLI, as the
ndo-xmit checks do. It checks with jq that the napi-ids of the RX queues
are the IDs of the NAPI instances, and that the expected number of
queues is linked. The checks run with GRO on and with XDP attached, and
across RX channel changes and link down/up. They are skipped if the ynl
CLI or jq is not found.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 tools/testing/selftests/net/veth.sh | 79 ++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 64c2a5a59821..685209995485 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -110,6 +110,44 @@ chk_xdp_feature() {
 	fi
 }
 
+chk_queue_napi() {
+	local msg="$1"
+	local target=$2
+	local expected=$3
+	local ns=$BASE$target
+	local ifindex
+	local queues
+	local napis
+	local st
+	local linked
+
+	ifindex=`ip netns exec $ns cat /sys/class/net/veth$target/ifindex`
+	queues=`ip netns exec $ns "$YNL" --family netdev --dump queue-get \
+		--output-json --json "{\"ifindex\": $ifindex}" 2>&1`
+	st=$?
+	napis=`ip netns exec $ns "$YNL" --family netdev --dump napi-get \
+		--output-json --json "{\"ifindex\": $ifindex}" 2>&1` || st=$?
+
+	printf "%-60s" "$msg"
+	if [ $st -ne 0 ]; then
+		echo " fail - ynl cli error: $queues $napis"
+		ret=1
+		return
+	fi
+
+	queues=`echo "$queues" | \
+		jq -c 'map(select(.type == "rx") | ."napi-id" // empty) | sort'`
+	napis=`echo "$napis" | jq -c 'map(.id) | sort'`
+	linked=`echo "$queues" | jq length`
+
+	if [ "$queues" = "$napis" ] && [ "$linked" = "$expected" ]; then
+		echo " ok "
+	else
+		echo " fail - expected $expected found $queues napis $napis"
+		ret=1
+	fi
+}
+
 chk_channels() {
 	local msg="$1"
 	local target=$2
@@ -330,7 +368,8 @@ fi
 
 [ $CPUS -lt 2 ] && echo "Only one CPU available, some tests will be skipped"
 [ $STRESS -gt 0 -a $CPUS -lt 3 ] && echo " stress test will be skipped, too"
-[ ! -f "$YNL" ] && echo "ynl cli not found, ndo-xmit tests will be skipped"
+[ ! -f "$YNL" ] && echo "ynl cli not found, ndo-xmit/napi tests will be skipped"
+[ ! -x "$(command -v jq)" ] && echo "jq not found, napi tests will be skipped"
 
 chk_channels_carrier up up || ret=1
 chk_channels_carrier up down || ret=1
@@ -443,6 +482,44 @@ else
 fi
 cleanup
 
+if [ -f "$YNL" ] && [ -x "$(command -v jq)" ]; then
+	create_ns
+	RXQ=1
+	if [ $CPUS -gt 1 ]; then
+		ip netns exec $NS_DST ethtool -L veth$DST rx 2
+		RXQ=2
+	fi
+	chk_queue_napi "queue napi - default" $DST 0
+	ip netns exec $NS_DST ethtool -K veth$DST gro on
+	chk_queue_napi "           - with gro on" $DST $RXQ
+	if [ $CPUS -gt 1 ]; then
+		ip netns exec $NS_DST ethtool -L veth$DST rx 1
+		chk_queue_napi "           - fewer rx channels with gro" $DST 1
+		ip netns exec $NS_DST ethtool -L veth$DST rx 2
+		chk_queue_napi "           - more rx channels with gro" $DST 2
+	fi
+	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} section xdp
+	chk_queue_napi "           - with gro and xdp on" $DST $RXQ
+	ip -n $NS_DST link set dev veth$DST xdp off
+	chk_queue_napi "           - after xdp off with gro on" $DST $RXQ
+	ip netns exec $NS_DST ethtool -K veth$DST gro off
+	chk_queue_napi "           - after gro off" $DST 0
+	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} section xdp
+	chk_queue_napi "           - with xdp on" $DST $RXQ
+	if [ $CPUS -gt 1 ]; then
+		ip netns exec $NS_DST ethtool -L veth$DST rx 1
+		chk_queue_napi "           - fewer rx channels with xdp" $DST 1
+		ip netns exec $NS_DST ethtool -L veth$DST rx 2
+		chk_queue_napi "           - more rx channels with xdp" $DST 2
+	fi
+	ip -n $NS_DST link set dev veth$DST down
+	ip -n $NS_DST link set dev veth$DST up
+	chk_queue_napi "           - after down and up" $DST $RXQ
+	ip -n $NS_DST link set dev veth$DST xdp off
+	chk_queue_napi "           - after xdp off" $DST 0
+	cleanup
+fi
+
 create_ns
 
 CUR_TX=1
-- 
2.56.0

