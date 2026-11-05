Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889245;
	b=AT9hWrTEnSXAHWLa5pSqt+ZDEm98rJAf5N5mi7TiwtX+B9cVgAiy2XKcEdPJlpa74Rlm
	 xBHIjcSm+txZbdXPDHL6te4pulpWB/SOS5Wb4H1sI7juU6ADROV6UAxkXiS7/Cl/k61A6
	 PLfe71eNnJgU6ReK1M5ScQfQRI8nNhARvlAngxvTZp2TCzamcKRDL1zJUzbF0oC8cX15G
	 dSjZUcu2XI9C09WvgJgTAlRbVEs0iIal9D4mc5m4FX4eZnECU4bYo6dfSD1eZnfB8YgAp
	 y9Un9+tiYXxdelkgyXCSagTMQC5EMdx2yB6hebALRFBx7OcbWc8zzxwr3IWx0hAWBJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=my9OBy1bBkluWAYUioairn9napGH+N/4+ZlIeEPaY8c=;
	b=Hhm9Vn6nuYEvkrLsNCQMrQdIDtJsLi4WHZb6+Af1wZfLFI0Bq6ODpnmYv8EVz09fl8dp
	 wmGlxWe8xLKwpgy6tS9D4vyKZVlEcFKbL+GfADDESxlYpZwqinyTHjVIurWL5gKT+4AGK
	 Ugi/Ji7iK9pvzzhp44RaxkOjKsRABN0NjQmrAgqKquVaKMHNRZiDSN+MF5le48NoU9nt9
	 Q3sBXEvKpOk1yqmV+dTIzkz36IG8rMIAxLOXZMp+UjhtYk2DZcki/rcAQQvh5+tws49RV
	 lbhIVvyUCtsJmR29zl3B/oquMgG1d/1W1Gl55aKiCcDdpFO+ZOujXFbHM1ipn5ia8bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b="e/BKoors";
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBBF606A33D
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 14:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BBBF606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=e/BKoors
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so303429966b.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 06:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1793889244; x=1794494044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=my9OBy1bBkluWAYUioairn9napGH+N/4+ZlIeEPaY8c=;
        b=e/BKoorsJFShcC8l88V2dJXe8612SlmcCnK41t7jRCWKK4eDqHPbYBXK3Dr3Z545N0
         yM+WASdRiPoPoA95bBpkfuTeUH74OTCCYJLwj7cVgLHrZpOnqg1u1w1hTsArDThQqRho
         f0EyI3NUPOaf8wW96n4tYhmikxR8ZCJf6VwS7ZGkMwlZwzY0oFyIAvcm+Yh+a/SZ7quf
         kOqxek4Ske891KPElKAH1lrjoLt/S2O/LqifV0eAheZwxNAVTggE1nXlCY8sexsq+dj3
         43RCqOIJXhaTCRb8kgW0vs33xVe5t6UNTMpJwtEdP2E4mcfykW8kOUGhyygWlW5NXwx5
         k/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889244; x=1794494044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=my9OBy1bBkluWAYUioairn9napGH+N/4+ZlIeEPaY8c=;
        b=bOIz6fLf5Bf8LlYcduKZCzIglFFz0v+D9b7kv5UXP7sZ0wwnXf4zpWMbcuWNrqYWzw
         /TcbBmtXq3HI9dwoZ/NpMDWDeGp2DW+2IY0D7RCIUOwxPW8QqFlC6a7w2aR2OK09a75m
         532QzOE0X8C6kCz4jtqpCjNZIA+l0+S+pwoj4Ox5xxLGwVvYk3m4zQIe0VeXiKlZgalU
         IJEfzrnvSj41NbmWp7Xv7u9cLlW628mkmR9g8SOEcDrIE+EsWUBkmB5e1tA0JFzgi6l8
         2V4lNDstY+hBVdmmF9RS0BvxXLDiCdDGeaShsjJW6r8TS1ZnAbtRiJcpIV1BJAzgOJVi
         30KA==
X-Forwarded-Encrypted: i=1; AKwUvBxO5pzkVqooPxYBctXiP+GF0kjqdCeqxWIwlMOUFqNfItmCUcxZZZXqbGFYTDdoTraXYRf6BT1+JAdRbp1xlOE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rLTSk3AP2P0h8XPHYjl0F+DeHLbly9I2/5mZzNjss2nfwBkOA
	9C+mzW3jzDCPvOlXqt7iHmoGCh6xQiDUfxoIgAGG3AIkxuDaa6k9DS9PQhde1Cwsi8M=
X-Gm-Gg: AYBFou2mdnMwUQO3m9CiZNLo6Wd4NbL7zYzy1aZvylMG11l7ZiHfunBJC2ZKLztvEZx
	duivL5zE6JWEAEUpUL4JK6no4e0D0T2J6/yJbsIbGo0Y3/QP+HmSB+uEs8r0mue1aWl+nZNkblT
	kMCHcOIM7h44RlmDxRbocGnY3BDLkrozi33EUZ6pAoM7jDujNoLpEmxR1/1rgr/P4WNjL4iXVZt
	UDCHG+SJAsJfcadezp+R90L86TLvN/wgEegWuWG+Aok2bZ2mD7XWjLi6n9Rdazb7x5kopewLGlO
	75sG2YJp96F/3Y1nh9fz5Urf1S6kQgOUoIt1cIyoIpgTlKXuu9lhSJ8NZYwjx7QCIZHyUjrBX+9
	uxd/I5ucptNfvlciTMjR6Kh/xDNFk/h63x2HysR3NwTtcZeEIxekssSEoYTkWIIY3wCWNyCPpsI
	rInbz7JUuHYhYK1rqfnDjTc0hj9Ks4LzyDRM5tccU9pMl8vR8UIIcWoZadVp1CWDnaP8QYB07we
	CG+rqNpMQ6LxjcnIbF9hMZVzs89N7rBxv/ZHvkN/yimYDw3Wv1Dk31GkTfmUEzL/eYi7P22u7mA
	6//xq2ZepcDoMfVQ2M4CQy7gdh6G59nQ
X-Received: by 2002:a17:907:f20b:b0:c4c:eb16:4014 with SMTP id a640c23a62f3a-c4ceb1640e5mr896680666b.1.1793889243799;
        Thu, 05 Nov 2026 06:34:03 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e466be0sm178671066b.54.2026.11.05.06.34.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 06:34:03 -0800 (PST)
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
	bpf@vger.kernel.org,
	shuah@kernel.org,
	hawk@kernel.org,
	kernel-team@cloudflare.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	linux-kselftest@vger.kernel.org,
	jiayuan.chen@linux.dev,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next 3/3] selftests: net: veth: test RX queue NAPI links
Date: Thu,  5 Nov 2026 14:33:56 +0000
Message-ID: <20261105143356.17062-4-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105143356.17062-1-tianyi@cloudflare.com>
References: <20261105143356.17062-1-tianyi@cloudflare.com>
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

Check that the napi-id of every RX queue matches a NAPI instance of the
device. Also check that the queues are linked only while NAPI is
enabled. Run the checks with GRO on and with XDP attached, and across RX
channel changes and link down/up.

queue-get and napi-get are only visible through netlink. Read them with
the ynl CLI, as the ndo-xmit checks do. Compare the results with jq.
Skip the checks if the ynl CLI or jq is not found.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 tools/testing/selftests/net/veth.sh | 79 ++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 17cfe412a266..affcdbf772b3 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -107,6 +107,44 @@ chk_xdp_feature() {
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
@@ -255,7 +293,8 @@ fi
 
 [ $CPUS -lt 2 ] && echo "Only one CPU available, some tests will be skipped"
 [ $STRESS -gt 0 -a $CPUS -lt 3 ] && echo " stress test will be skipped, too"
-[ ! -f "$YNL" ] && echo "ynl cli not found, ndo-xmit tests will be skipped"
+[ ! -f "$YNL" ] && echo "ynl cli not found, ndo-xmit/napi tests will be skipped"
+[ ! -x "$(command -v jq)" ] && echo "jq not found, napi tests will be skipped"
 
 create_ns
 chk_gro_flag "default - gro flag" $SRC off
@@ -364,6 +403,44 @@ else
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

