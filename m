Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794771349;
	b=TfSkt5nAVGN8QH0oLXpslLF7+N717WlaDOifgHrpHjZOZHdUVEgJYsJFADOqR7w26Lyd
	 uf2n1Bs263w9XeoViPdkyhV9Qi4I4bQ/h42WbAKp6Z6R9bqXZ5ppu5mvG6swn2St37HGR
	 xba4N1fpZUlze27RUa4XoBOFpInCEPKbojRBi73mbjB1ECmV2HBSVH4hiF4WOYYHo2qgU
	 QdAOJ47sMxDx/LVcC4VRSrTBj+ZlRdreZN/Zab7OEu3Og0D6HCYjgcfse/39r6ur443qi
	 aMxCxrhhO5DDCE2SaVYgchwf56MdiDcrQc9c56dJPLbkqUzEGkgomJ71qFU6ida5CZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F1yhPQtGuQiIVxyFRyGRvPMKXeA34EsZZQXwH34MUDA=;
	b=qEnTIJK4w6hSB4t+5sb0z/wDSyhRN0Qw+ZCiHoZ3QrgjLknTCpxqbuK+mdLNK12/sKQs
	 HBVOef1SkgCrEAn4n5neHehHviVoyQGGL0SUU8Z4XIbaTseShBp/3i44k8leo36uzY4IF
	 R12MXi9Y/xh9600gmzbH4Frj73g+m/bFmkqIgQGYKXDUa/qHyEse+FzWo4+Mz+SCpw8h6
	 p6Fy3uS4vFWRVS/0hl/jN6z8w1EphlXojkVHUZX10pSsd1x+gwh/O0bazA9Gkh2u8Kd8f
	 uZbVWw3T/IhRUg6Le+4nhBt7Pyk8N1PVZ5WTxx+GTVmTcdNBjH+PGyLYUA4aeAPe9sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Ddd1tPw9;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFA2606A880
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 19:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDFA2606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Ddd1tPw9
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso429284466b.3
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 11:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794771346; x=1795376146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1yhPQtGuQiIVxyFRyGRvPMKXeA34EsZZQXwH34MUDA=;
        b=Ddd1tPw9RAVNYmD12nYH3+lDIsw1GToia/TS6/59V68w+pW8wA2Ki3VhpKYAmnAnO2
         jeIup19iPB0uS7rCH8PHJknGTdquhpQx2Qjpmmka9fpGIOzuEmYt9M8ptEi6A3JxT3sW
         8/5pEYQxQBHdAfY4aAei+Fe/QAvKlUNOfVgnhjlqSKYKTBbZho6GMt7Gb3uOropgCzPy
         a23XRIktJ0XNMq4SRpqeM5KE18pG/hlNQY5EGHXdW2tj9yQRW76VFLzawNBjI1QEyEIW
         OG7/xrshCkTwNomu8g7+z4o1ieIbvizWy6KJncCgY85zVeU9d1mOPszv4TDP4XwOUcee
         L2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794771346; x=1795376146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1yhPQtGuQiIVxyFRyGRvPMKXeA34EsZZQXwH34MUDA=;
        b=Q41MpsBBxYNQvRjGLniL7HmLo+wtiXhC6U5xIaTEtIHBxRShVA1aIlbbSOHMKfzHAa
         4wkXELHAsIVNgOLs+LeMUJZSupfnR9wWFv3uayRQVJHwnL11rsFf92pjXF0CVshzYTJK
         d7vmKo3/1anTzw8LQX6Pnj0HhYrGdD+YvR5DBjdQFHxMtDv+PEUFy/PGF3Nynrre6HE8
         80DgZvPyVvayBu7j3WLdLL/4c/Fo7geVHMTUR9t2Edbt1CHPPEDYEoVhuGz1mzuHnenM
         JcpKXWnZHMpH0tnHA0mA6x1ocFakTXSvg1INkrPfelBFWqIBtIwUiHBGZlsXDBWsv4Ay
         Z3RA==
X-Forwarded-Encrypted: i=1; AL+hErGymbg76C3nm9+1wBH/pvJtwKG2X4ACvL845HnRyyX8lQngbwWrs7PGxbajmznBtlHFQhgJ1M33+/X2XSRdVts=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7T/0e/nn/6xLw+4elg7VOcAngO9+N7hBizEvC5U61yPr3HYhP
	kIyGawigSaCfbhrVojVbAGV27viSOpsmJ40Mo8qwAdq9dnJC57o4NzUYuQS+wV7SYAA=
X-Gm-Gg: AYBFou09s1IKOAey11E7+X4Uk9WEf6H79LPYbO6O88wrLUg2DEK7fcnZrwS+YTdZJgx
	lfcWPZl1Gal2NShD7rTbJZh2tVJlGr5DUhEO3i+fzsLrERu297hsWeptNdmFPfwS9vHsFaPl6NA
	Ji2IIihnOe+HEWOwy9up/xgPAEKui1bmw+r+FR6i2l8G4QA0jtCGSB+orL0UnxNqF/kZpjlgF0V
	9HGDba8lkzvvUHhTwaSXxdhmokTn6q1CZ7I4dcBCfW34IEb7zvyR0aY6vgBhMZg2ANG2iySQPW7
	RYXNBaUsHM9WwGQedo5rGfz5uvI6nMXgZLVZRPS91ubsaHC1g2eyKRCu6veOIrtu3pZhvx+w492
	H4p923RpcodbPcPkxSjVe3lzO+eYV1rZ4ku59IwMQI+T+QuyGvGzeouw/Zk/D0GTY20cEAYFLwx
	n3ySzT3LTeV8gq6ygeji3+u/dP25BDO3B1KUQsvnL1VIVuhu28dLYrKdf/i/tsVEIH4qAkwR4X6
	MsuYIWrkj6yVjHKuF2yt7zoU43rCScPWhhKdmSY4x0WjAITgW572xN8gCGltdFvGIeHdrYpmNxY
	XDiqfsB4QWX/iQszlQ/j01rF5P00gIx9gEHFwg92A0QFRAxXkXAngke5dkU=
X-Received: by 2002:a17:907:94cb:b0:c2e:3a72:ffbd with SMTP id a640c23a62f3a-c5096389759mr692569266b.41.1794771346212;
        Sun, 15 Nov 2026 11:35:46 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm340448766b.16.2026.11.15.11.35.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 11:35:45 -0800 (PST)
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
Subject: [PATCH net-next v3 5/5] selftests: net: veth: test that RX queues keep their NAPI IDs
Date: Sun, 15 Nov 2026 19:35:31 +0000
Message-ID: <20261115193531.57679-6-tianyi@cloudflare.com>
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

Add a check that each RX queue keeps its NAPI ID when veth deletes its
NAPI instance and adds it again.

get_napi_ids() reads the NAPI ID of each RX queue with the ynl CLI. The
test saves the IDs once GRO is on. chk_napi_ids() compares them with
the saved IDs after ethtool -L raises the number of RX queues, after
XDP is attached with GRO off, and after link down/up. A failed read
fails the check.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 tools/testing/selftests/net/veth.sh | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 685209995485..9496b599d722 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -148,6 +148,30 @@ chk_queue_napi() {
 	fi
 }
 
+get_napi_ids() {
+	local ns=$BASE$1
+	local ifindex
+
+	ifindex=`ip netns exec $ns cat /sys/class/net/veth$1/ifindex`
+	ip netns exec $ns "$YNL" --family netdev --dump queue-get \
+		--output-json --json "{\"ifindex\": $ifindex}" |
+		jq -c 'sort_by(.id) | map(select(.type == "rx") | ."napi-id")'
+}
+
+chk_napi_ids() {
+	local msg="$1"
+	local ids
+
+	ids=`get_napi_ids $2`
+	printf "%-60s" "$msg"
+	if [ -n "$ids" ] && [ "$ids" = "$NAPI_IDS" ]; then
+		echo " ok "
+	else
+		echo " fail - expected $NAPI_IDS found $ids"
+		ret=1
+	fi
+}
+
 chk_channels() {
 	local msg="$1"
 	local target=$2
@@ -492,11 +516,13 @@ if [ -f "$YNL" ] && [ -x "$(command -v jq)" ]; then
 	chk_queue_napi "queue napi - default" $DST 0
 	ip netns exec $NS_DST ethtool -K veth$DST gro on
 	chk_queue_napi "           - with gro on" $DST $RXQ
+	NAPI_IDS=`get_napi_ids $DST`
 	if [ $CPUS -gt 1 ]; then
 		ip netns exec $NS_DST ethtool -L veth$DST rx 1
 		chk_queue_napi "           - fewer rx channels with gro" $DST 1
 		ip netns exec $NS_DST ethtool -L veth$DST rx 2
 		chk_queue_napi "           - more rx channels with gro" $DST 2
+		chk_napi_ids "           - same napi ids" $DST
 	fi
 	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} section xdp
 	chk_queue_napi "           - with gro and xdp on" $DST $RXQ
@@ -506,15 +532,18 @@ if [ -f "$YNL" ] && [ -x "$(command -v jq)" ]; then
 	chk_queue_napi "           - after gro off" $DST 0
 	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} section xdp
 	chk_queue_napi "           - with xdp on" $DST $RXQ
+	chk_napi_ids "           - same napi ids" $DST
 	if [ $CPUS -gt 1 ]; then
 		ip netns exec $NS_DST ethtool -L veth$DST rx 1
 		chk_queue_napi "           - fewer rx channels with xdp" $DST 1
 		ip netns exec $NS_DST ethtool -L veth$DST rx 2
 		chk_queue_napi "           - more rx channels with xdp" $DST 2
+		chk_napi_ids "           - same napi ids" $DST
 	fi
 	ip -n $NS_DST link set dev veth$DST down
 	ip -n $NS_DST link set dev veth$DST up
 	chk_queue_napi "           - after down and up" $DST $RXQ
+	chk_napi_ids "           - same napi ids" $DST
 	ip -n $NS_DST link set dev veth$DST xdp off
 	chk_queue_napi "           - after xdp off" $DST 0
 	cleanup
-- 
2.56.0

