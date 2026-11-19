Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048233;
	b=BhphWq63jwLuhgys9rU9D+aP9wT3ZLy8MYzBIG9O25JyOMGQlCaZPgzZ+P5HgMKV52Zg
	 bApdFSPuV/7CPOE7dFfq6ZkucbNV++t4N0AKyRxKXQTJ0b+HA2ZR2ylv9rtZwd1kRJDMP
	 sZIl79cTb1/ZGmJTMFuKN9iqBRinnwgrCzetXO+q0z+Cx8VGg2LWnC0uS8Xs4WoOHvjoS
	 TnDBhd7m7g9zYsWil0VVzCX/DazChHX2PjgH3eaLqsZVluTMTgfFlfIp8TwaI6HbLZofm
	 qYcLdfuUpTLQxIuUNxYM0iuW4Ussg1HZYNHnXGvw047jwNfaolE+KEtP6EGSWjM+bvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tY6fRiRHZ4qZ5vYbTo0aHqI1fHONsrHB61AnWgkQo9U=;
	b=u4vK33A52DHYZnlkVD8O6eTgAksrS4RCYhq4s2/ylpY1fPk966MU0oA0Vk+uAuF1Hq0S
	 B+rhDYnK7gvK1xMg3uOTkZv78rsaQO0UFMPv3aNovBDfeiUeEFEIAqyG7mePXm4dsx5i8
	 LTt3iPXYwgRqE3ID7H5jkc0z3AgOg0tDXFlIVCR6kPXkqYQ2AjP9agf15/P9tQDPLfQA3
	 JMfBMUJf3E4PNCqtNHfLeYLoroshWyr9Net1vSEGzmBnKT/+V4gmKeyjjyqLapnzyBYUU
	 0CmHM3HnIGV1XwoQv2dewpw4+Oo4aLcJuw7MW/UDuWqOI9KQNIgkqeV8IT0OYm93p/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PRNwZbbp;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C36660A2621
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 00:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C36660A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PRNwZbbp
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c504707acfeso36736266b.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 16:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048232; x=1795653032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tY6fRiRHZ4qZ5vYbTo0aHqI1fHONsrHB61AnWgkQo9U=;
        b=PRNwZbbpu1cxDps4lx1UK660t5mxgKF3mzzZubJ0SgZGhmNYtnHeBDIQK0hVqt6qs0
         1qzPOjOtvYhmWNnW1MrRjPaBgOicIxQW7ZaCLSAxktNNeZGws5e9jDQ3iQkqI/qxXto9
         JGct10nK5IE1P0lsAHlZ+iX24wYAY8s+K+d0jEBa9K0/R4A9MOJQFqH9ZIbj4GRy+rDJ
         rXohZgzARca5GUzOWkjtOE6N+z7JrIQjHoAbO2xd0JxxNhvMRK/LPYAZ7GfXvfkvJEt4
         +fhXNAS7vdhZlHrDvrbpkb2ndMD7fSl5EQx75kNhbXfrTx1SkXDKtXAii9K7l2iWP1C3
         E3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048232; x=1795653032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tY6fRiRHZ4qZ5vYbTo0aHqI1fHONsrHB61AnWgkQo9U=;
        b=rwG/AwjmSwiB/bORUTsyWMdqHLbuWAipnLa7qVykEgDlxc9V1+5DoOp1ycvqR9gGZL
         VbWZ0ZQAxNzywxg/+xjT8nceGZB0puoqjXaaPN9GbcsOiWax+xHZw41HbheMRd5TSvu+
         jjixVwnhHl5sG+l73LOQnoYCIrIlR6zmOWjy3CV0FR4DHGQuI+w/NUKIXnZPvY2r2/pH
         cQOUq8lkjmIsy7LxcMmjk03YhXvtypHYzqG7F1y75dEmlKnzD3JNlVxBaPtDsjKZb5sI
         yhMKTD1rWSpZ5oKJ8/K6BMAG6GW+UqJ3vl3z0dMOgTZ4Zt2a16jHmjGnZFA5TtdGrWEA
         4XMQ==
X-Forwarded-Encrypted: i=1; AL+hErETiGlfEx4HTz7McowwnDnuI12uXO6uHcnfjY2Vf4ZvGqxudllk5AKjklT/6ULxyQmWq2cTUfxpPtBeHJdhvn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gGs44X53r9Tg5B3V8bn7ERXyml3GGMD1R8rnJiS7wcV4D7O7k
	n77t33T4xqE+TwDu4cb8oiS6+Tu/ZpBDYyLGbF/Y9OM5zBuq1JyI4adS
X-Gm-Gg: AYBFou0a41u6P3Q+yh6r1LhRPOBzyaVw/aaAoAW2uRvnunbLdXdGB2rxrEjRa9xGRdG
	0C0gloW+mO/ei7DCaTATg8HDztt6KZQluOlwx2ovPRQSad9GSo5x1flI+LcCrQcXe13yKsHmwwQ
	w5mRZD2XNQVdYcxUA7yvp69ljSq8HiCHzAFNwEnEjiokTCrYiOKSSuEbvKJ6ByzuEhP8mxtKU5i
	oQWRH35J16i/vjGPjOC3Kj0bcgA7kOsLnSUjxvk0f98UinMk1gJ2H3PgCa6sMqHM/TQs2r4zIQB
	QE9Z4AykTlocAJuLTm8yJS18KWCSvkgRZ6EuhRcbTkn5euWo7ADc3H01H17zHgZ6wK1ZNz/HlKd
	EJz9OOCG7ujeYXGne61J63HRZrXLrhlymCiA0s0nRktAeVTdr1Wk2IrfvrfcRg6jGr5TOkhnie3
	ddbF4Tl3X1H76ilQYyef4j+XKXm4j0qnyqi5SN/C3iTu0RITTJw/0wtNo+cnQmOSdSgD9EAEh0i
	YofZs11HtRIwmG80XNmhnSEyhH9gimYKov8NiSQ/sfTf7r9I0CZ7kTErMW4VGoOOyqvNnxOAGXm
	eZpdDbybrcWo0Mq0QPOcwA13hQeLFHIbflxWfqDNz0uz4/VrRwPTWEiKv6bHMaFYQ0MVPEINSQ=
	=
X-Received: by 2002:a05:6402:ca02:b0:6b8:8146:a10f with SMTP id 4fb4d7f45d1cf-6b887e52710mr3301122a12.2.1795048231599;
        Wed, 18 Nov 2026 16:30:31 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.208.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a001123sm1729744a12.21.2026.11.18.16.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:30:31 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net v4 2/3] selftests: net: veth: propagate bad-settings check failures to exit status
Date: Thu, 19 Nov 2026 01:30:01 +0100
Message-ID: <20261119003003.40482-3-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119003003.40482-1-emmaonana18@gmail.com>
References: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com>
 <20261119003003.40482-1-emmaonana18@gmail.com>
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

Three more checks in veth.sh print "fail - set operation successful
?!?" without setting ret: "bad setting: XDP with RX nr less than TX",
"bad setting: reducing RX nr below peer TX with XDP set", and "bad
setting: increasing peer TX nr above RX with XDP set". A kernel that
wrongly accepts any of these invalid operations would be reported yet
the script would still exit 0. Wrap each fail branch so it sets ret=1.

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
Reported-by: Tianyi Gao <tianyi@cloudflare.com>
Link: https://lore.kernel.org/all/CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com/
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 5c1dbe1516bb4..2a37d21f97da5 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -472,9 +472,13 @@ if [ $CPUS -gt 1 ]; then
 	ip netns exec $NS_DST ethtool -L veth$DST rx 1 tx 2 2>/dev/null
 	ip netns exec $NS_SRC ethtool -L veth$SRC rx 1 tx 2 2>/dev/null
 	printf "%-60s" "bad setting: XDP with RX nr less than TX"
-	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
-		section xdp 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
+		section xdp 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 
 	# the following tests will run with multiple channels active
 	ip netns exec $NS_SRC ethtool -L veth$SRC rx 2
@@ -482,16 +486,24 @@ if [ $CPUS -gt 1 ]; then
 	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
 		section xdp 2>/dev/null
 	printf "%-60s" "bad setting: reducing RX nr below peer TX with XDP set"
-	ip netns exec $NS_DST ethtool -L veth$DST rx 1 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip netns exec $NS_DST ethtool -L veth$DST rx 1 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 	CUR_RX=2
 	CUR_TX=2
 fi
 
 if [ $CPUS -gt 2 ]; then
 	printf "%-60s" "bad setting: increasing peer TX nr above RX with XDP set"
-	ip netns exec $NS_SRC ethtool -L veth$SRC tx 3 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip netns exec $NS_SRC ethtool -L veth$SRC tx 3 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 	chk_channels "setting invalid channels nr" $DST 2 2
 fi
 
-- 
2.43.0

