Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794362378;
	b=3vc8Ax8rwbCWrXOdL6q/1toPPtFCEjL3TvF+Y0SwwQlBkRvLnA9Aw5DRXnwYi80eBQ7o
	 imy52ZEgf9G/mrl+HzT2W2IMUJlvMNUiznleLwoUsDVECuvbG/MOFRa+Nv+KG6ITQQkwo
	 jq30OiPNtk2rymfivN4Pbfh9yMLsEdmnGsFUFqjG9geBfwzGK4mUk+low7i5rS9pNZUmP
	 lKv2tNKLJjm7ZEnsbQuCstpK8S8OCspaX/6Lj7MsigXOOuyRYseXIniol4GUfaPdnHs81
	 RoLi0JrbyLwo4lbeOe5IE2rFPcx9QcrQSNGW1euWVaYxZmCMeHDTj9EVGPe2stLgzJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jgu962y8cHYH/mees700v1pRhH7ojTrqx1f7sTX+E/8=;
	b=Pxe5NtSkT+bd9CY1lP2VszK6DAOCNfDT9srun41iTbgsvaMHg9MSUk/pWkhjILEToaFj
	 XOtEm0cv95AXgPNR7dulMu674AfH3rZ7oT0jZXNRmwVhrpQLq3B4BRIUncIRl3pNUh8B4
	 RXJthGWNE91t5OmgW3Y1NvE6vTHtsqpNVrlc3K6gCp9bWv+LGhobPnT2d/NORBQKiRIil
	 RJoMpiwrP6FXG6rV3mVqaPkzSRgl8ldVnxcC7Oy6r/upQp9KgkKv4tle7cM7SsUB2P15B
	 cobUyWeWil9quEW6RUxh0tKnNGSGmWHV8SLz9TUGq/tHAGnV5XYkHVf1AWpVx48oEAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=NAA8ObNw;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4830606A32A
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 01:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4830606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=NAA8ObNw
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso13071a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 17:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794362376; x=1794967176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jgu962y8cHYH/mees700v1pRhH7ojTrqx1f7sTX+E/8=;
        b=NAA8ObNw0VFx6zfK7QgM1ZFQMkCGhinaiCGyiEr/B2ayq9IY9lyHmHRK/ZIY952fas
         U6I0nseO8oXA8WL4i/T4WnssVKG9ZTwFsZq9WnrxFUDQYMOal923XAORXy68UIoj/fp9
         2o44YAqDd3V7i/wsQHzUoxOAQg2ZWdiVVgVRA78/MtLcuux2t4VWm8sbWXGsIL1CAFa7
         ppxqerNjc8Ws6DKxXNWki1zOGGGni9XMFP+vgcYS8jQQMS2+0YgvR+yAVrdp0CsweV86
         ul7lHm3tYS+gVl3leOtAa3t4ZdQOY2s1J6F4dlAkY64FxkLFuxYlLke/N78FKcpd41iX
         VRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794362376; x=1794967176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jgu962y8cHYH/mees700v1pRhH7ojTrqx1f7sTX+E/8=;
        b=zRACRgueVUQ16NHqWHeNepkzPrW6MS38aUaBxVLEU1BufOqkrLnu3Sn3rasL19cAwI
         75BV7v4gzIuF766w+iIcf1QWuWREy+lzp5bFnkBZXaet4VxVOoYZJQvJnjWxaN4OdxYi
         iXfYiHUEG3vMFDqU2+qu5E8UeUIsHgQsJ5bQiXRaYh2kWhWtVc62EcJAq1Ace6Qg9pcc
         dUkTGl2So1n66WqsPo5V93+p3zRCA3JuwFHfSt7jZItS2bmHdwZeOARlSy+7s4fumog4
         GpjAfA0nOduQdTeDSNZ7h3p/VqvGrATMBfGYerAwbZZxSYbpplZXDQtlf/P/e/I6a2Vn
         R0dw==
X-Forwarded-Encrypted: i=1; AL+hErF9ryxwGkajTIlkSr3PyUebH3+I3d8LaKghSJu2k95rkUYFP7RNDOILnmGzemwio25/WJOB67iLVSZGBP0cf78=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eOALNi9voiCcUc4sTDV9TJZpBy9hEc547yhDaatypOTm79QUS
	EmeHn5p+1ybn2bXBM4myTn32XeZR+L15sSDM68BaCax3vbK98TSmL3vD/gdFVJzbRzo=
X-Gm-Gg: AYBFou2cNfyLEDz18ws+6PoiI58uFbfGZQxz+WLySGhVzISKCfZju0mbhVrux8uPwPZ
	bUN5Ga2P1CkwzaL6djz6NXBNHZTb+okA2phNT8he6bkRx1GnzHQQ8ovqJrbaUU/DNfxOH9VzeJr
	d+h6E0Eih44ihTVHqzInCbn7P5XsAOfnIRej7vZVyn8gw+3QS1H6QtNmwXgw+gbbImrT1rtjEEl
	xH2GVtdNCX2h2BI11SJEOVkE6ItylSOPUMRBgpBXQVmmJidU0vdW9hprsLp+ANUg8DsD+/UPZfX
	m5wr7Nc6WR92dDVODH0g4MFG/Ik/WUAKpJZQdcHYgAnWaPoVGZrF2By2SN4FpHFRDewqfqzNPlq
	P6jh8EbIetayVOPuVeGDfUm+GiB8wCvv6NTbpq++LJp+5+B3hHNQyhyAhqNBHYnKFT5qXeTfVOu
	tNcdLaVSyMXYdrn1wIpu2EbjjRVPMl33KyATJYWvYDqKEhFNDXvpBrfuhHLiFVGTv1JhvU4KHGd
	QLDdjOm13l8+z5XlFKt7sSph3uqhRpq+iOFtgaOTrZdlIEtRePtIXVvpLGkgFXYKPwsENGBU/+x
	497eHH7RQFAKWDg9ACv6FJEeNY3C91ruljm9SIu9xvVr/U7ekpH2zOCarQ==
X-Received: by 2002:aa7:c683:0:b0:6b6:feca:2450 with SMTP id 4fb4d7f45d1cf-6b7775eba49mr531899a12.19.1794362376364;
        Tue, 10 Nov 2026 17:59:36 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.58])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7834cdc23sm147498a12.12.2026.11.10.17.59.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 17:59:35 -0800 (PST)
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
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v2 3/3] selftests: net: veth: test RX queue NAPI links
Date: Wed, 11 Nov 2026 01:59:22 +0000
Message-ID: <20261111015922.67745-4-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111015922.67745-1-tianyi@cloudflare.com>
References: <20261111015922.67745-1-tianyi@cloudflare.com>
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

