Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280954;
	b=WlhiTGVVwa1QyVwfX/tSZiFMvH7w+E+oKaL26cgRgOGdurKmXFTc8YKdGMXcpaGP4KpD
	 es30t4iBsiESobgWx6s07VsFEcaAaeR+Ms06NzzR2UjWpbH3lXY6Cz1h5hnm8DZMoqKDO
	 JE1uDUrYKvKpxQlylHMV9Rt3ruwZ30+JpKLwlU+Pq7+2AQ74Q5QdQ/y5YvbmsHKuby1bY
	 niXEsHpD2Mj3naCd0hHvCdtH70xGBNY7WWkUQJ/ycXwb1sm7WdUPQR1J4+XT/0Cq0BaFO
	 wI72nlCa+KsawcIf6RwRrR/etOBh6+kUDNFuvMb/550AfmRhJze5G03F7P5TT+Fravw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280954;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Z6XS9g1yfpXlXRk9/YKY1ELXgVfvsZxJEw+TI7y+Uo4=;
	b=L01n8n28SuOSzVBLS4B/ONoQgtDvRYgVCbGzeXCdzTNc2vGXPY6wqoG9IMwYZcDlNb/W
	 pzNC2eTIMNOtjAwja+GaX1c0Il9qqMSKK3V/Zq0iftJCY3V6yZtTmCrftJLIuLt6cDV1H
	 ugMWYbpr1habp5WlbnroP8AstcW9sh8b2b5/HbTb3jcE+pQMzdmNlpGRMCEBOrRW2OWyP
	 s4DucaOmm+edybznj9ouWUPh2PW+ErJS8fP70vP+I+qcfS1lNtkSmEbg6XDLaVgs5/jOg
	 32fgw1R0NlrghxZYWGrVZC32fxNnqqxrZ75Ld9R7Ga+O3UvgfIiN4HTKpXLy314NUCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iStT91TS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XoSb/Tkw";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5729060A2609
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5729060A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iStT91TS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XoSb/Tkw
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCebor120585
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z6XS9g1yfpXlXRk9/YKY1ELXgVfvsZxJEw+TI7y+Uo4=; b=iStT91TSpUGSJ60n
	z4Jds6W8d5YfyZoTJo3FvjhLKhpfO/uykese30NjRDN8C96RqwJcS/C0Ox0Dr5qQ
	yX46nnpIAuuk1AiQzdKIg2SmACWTVeTBJ9X00CRJGupkVScXiDVemW6t093ym9Pb
	H8n4rVQzfbvUqMo45FK7tR+jDy3Raf6zZiVl9ZBdb+pEdEH0Fqf1SqCqHfMEWHmh
	szpJbVRrKs9QiI6cCIaNvqBnr8j6hZgutx96mtlSxT22qdZkwV25bB+kTp79ER+H
	jG37l9zv9VR3MEH8GBoDwCqQ865SWSVQoaPSXpPa4LGq2geSAJSos+UV0YgSOCfD
	MPkxQg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3jjkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c7a26f892so44557046d6.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 06:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793280953; x=1793885753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6XS9g1yfpXlXRk9/YKY1ELXgVfvsZxJEw+TI7y+Uo4=;
        b=XoSb/TkwbCc0t8RyMYMTRCHOa9tUeX3Nvdw3CE5P1M3whZecO/F7aB9YHkzfuQPt5Z
         e3JKA/OhQDbGBKhya7ggFocNMeGvdwIFbNdggQV3e6+W4CIaFq3816fsYjIXowUe4WqB
         L6YvtKfD8Kxb1bahiXM22tCig5dsJWlFyOd8/Yo6yjA7PtwsmbfwyZzkoKeSDi8sUUOw
         vUy8xkVk2vOW8DHX2gVHVUP5XBRIAhE/Hkn75ZDMeMBgcnmybBuXauVEkVFNgCBQXvC2
         fTf7NcYXi9WHxQqNEsuvvKEeA9/64Ppaw/DTe6fbsvO/ZKlzshXBn138heMwPaPJWabB
         rATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280953; x=1793885753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6XS9g1yfpXlXRk9/YKY1ELXgVfvsZxJEw+TI7y+Uo4=;
        b=Tx2qELPThb4RMsRA8uM7icpf9RMCEpJ8HFs/fX71zvT4LiKu6fE2u607ail1rLyqeD
         OYCxZpby/nOLmmaO/MHtfIyG2tgNewL+3ywy/NrhLKXSHOrwwDYj4z+qUCxMnh4P9C2g
         fH+eN6tA9vJX4dlp7z60LnNrz5NoRbjYtAFy8LpsQXduvLYcwHCLhVSjZ/zLZgD88Rcm
         ZjwxhHBVCIKlIE6dvoW6rOv6DbTLnbcZ4nXDI/zAlpdtkViLwlA4SX1nDC6FinH2KzTO
         TCIUbc0EkM40uKR2AkF7kbtj4G4eT1/Cwd/vniPyPzwYEfKtQyZmBCFrB+ruAeW5y2dg
         Z+sQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/2T/iMrATn7D7dC/Ra/Fvvylbmvn1g4+kkFPGimMfSZnRIZrp1AfhOoZ16mxz6fVQX7OukhkyJ9hICh/qKqY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqYBHeZelDto2JBV+mXAQ83BhwaT2Z8TjF7SsJitUlj9hEYW2i
	Ekx0wim4T4Xw6NxYNoAV4a9jtoER+x9FPxvfNtyztrnPZ3jBV0QM4S8v4eYUSZB0MIWYaeQDy6m
	v5vzrPu4DBRG+ETKtqxx1tfRHsIm8ILxGJLRXL65tfUfJy/vGxILBI5fGE5w/HFDDL87fkv8=
X-Gm-Gg: AYBFou2G+JES+jAL7f8CoBlhUqGXdUi2IksxoeavHg6VZTGlhLfXuMBP/TzJjRBAmgB
	00EUdArMI7eO3Ix/67avqWLE7NvoHBjTO5DqCWjFCc6pXqIsjRJppqIl+8zQOZAO+IYDVHoT+mE
	TZ8USbdvlF9VKELozbTsEFfPG/xmd15GI0npRekLb/VswDRg1HcawHe+uTqncHb1J2J8uMnM7lj
	X+q34mliEFERNUSGGVIalR21GnBfXlEdgs8KqcYuCdyCHhZNVc58sJY4UPXFhSiR2nsgWaBBUup
	ymbKXPN7M/oGPauzZRsXnWefAoGYRl09MPW2bHgl92bkMEV2le9xpNrtieuYDC6bksaUSjJG5CW
	4VtHhYGRyzvkye7wNxqSHr9f9nSwhkcoK/es95kHS28K7GMKXPXxjD5TW23kT8mQht9bikaAW5y
	4vUa2llDK0LIDEMp7nFZWhNg==
X-Received: by 2002:a05:620a:170d:b0:93c:635e:6f3e with SMTP id af79cd13be357-94408a5d003mr856599585a.35.1793280952333;
        Thu, 29 Oct 2026 06:35:52 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:93c:635e:6f3e with SMTP id af79cd13be357-94408a5d003mr856593785a.35.1793280951737;
        Thu, 29 Oct 2026 06:35:51 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm71866705e9.13.2026.10.29.06.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:35:50 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:35:19 +0100
Subject: [PATCH nf-next 8/8] selftests: netfilter: nft_flowtable.sh: add
 SIT flowtable selftest
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-flowtable-sw-accel-ip6ip-sit-v1-8-6a17c54f9fb7@oss.qualcomm.com>
References: <20261029-flowtable-sw-accel-ip6ip-sit-v1-0-6a17c54f9fb7@oss.qualcomm.com>
In-Reply-To: <20261029-flowtable-sw-accel-ip6ip-sit-v1-0-6a17c54f9fb7@oss.qualcomm.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>,
        Phil Sutter <phil@nwl.cc>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
        Shuah Khan <shuah@kernel.org>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
        netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX9F1U2J2xYrsc
 tqNuw1xXFshHdcfLwkIki4sTyHCXNa/zhT8e1syu6o9L7ND/q+nx3syU0oEAn68/ywcDu0e7nYw
 4BDUYKNAqLHi2T+zMqIsWJgfsGwcljA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX3UEIdJURdgeK
 MnxSdOCHd20zVZlthanEN3+cfftUjyery50l+wSoq0Bgw+Yo4LudqdmaYoJ1nlc1Jhg3l1vTcOn
 xsyZP+QWhLv9kHDlPfUpO2uOp/nHdkOQuqDAm73etcDT/vQTp4muQKJnmc5zhuhhTFxmee0JPpV
 g71AqVD8MVtGem9xzsd9/6/LhWgu8WVQSeu4ZkIhB1sAj3xrvw9+VzvbnKw7q2qWgO2/Rq7wgnG
 G9n6KLlniiSQUo9ywblDxG9WrwjgeTZYTap0Z9kKWZE7USlL940BN/WGBfRGb/XYdyxCc3M0j4k
 4O1/LIYCLkOJU2booM3nFhHqbiqU9OcYDrWTg4yWL16IPn5SUugBAoasVqjlFWtzX9CUXe38jsZ
 odfPf+33jE4q5AcCeodW7BLEtlN8tNZ+RBuTyjr7uA/PLPFuDfY1VpOdYD4uMWF5tGzHYp9rOhc
 3qQq8tyCMxG+Qz/C+SQ==
X-Proofpoint-ORIG-GUID: aCU7PcEng4UCBZicGX-cuz6Kc8ROa-43
X-Proofpoint-GUID: aCU7PcEng4UCBZicGX-cuz6Kc8ROa-43
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae34bb9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XuXj8uMZMfGkPmKnGZ0A:9 a=a1GBzH_hwgqQkvkP:21
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290053

Similar to IPIP, IP6IP6 and IPv4 over IPv6, introduce specific selftest
for SIT flowtable sw acceleration in nft_flowtable.sh.

Also add tunnel-specific flow-add rules for sit1 and sit1.10 so that
check_counters() properly verifies offload occurred, and restore IPv6
default routes at cleanup to prevent tunnel routes leaking to subsequent
tests (e.g. IPsec).

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 tools/testing/selftests/net/netfilter/config       |  1 +
 .../selftests/net/netfilter/nft_flowtable.sh       | 53 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/tools/testing/selftests/net/netfilter/config b/tools/testing/selftests/net/netfilter/config
index 629b2b29ed1a..930374aabec1 100644
--- a/tools/testing/selftests/net/netfilter/config
+++ b/tools/testing/selftests/net/netfilter/config
@@ -35,6 +35,7 @@ CONFIG_IP_SCTP=m
 CONFIG_IPV6=y
 CONFIG_IPV6_MULTIPLE_TABLES=y
 CONFIG_IPV6_TUNNEL=m
+CONFIG_IPV6_SIT=m
 CONFIG_IP_VS=m
 CONFIG_IP_VS_PROTO_TCP=y
 CONFIG_IP_VS_RR=m
diff --git a/tools/testing/selftests/net/netfilter/nft_flowtable.sh b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
index dcbae9a3d92b..3a393c8deab9 100755
--- a/tools/testing/selftests/net/netfilter/nft_flowtable.sh
+++ b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
@@ -597,6 +597,10 @@ ip -net "$nsr1" addr add 192.168.210.1/24 dev tun6
 ip -net "$nsr1" addr add fee1:3::1/64 dev tun6 nodad
 ip netns exec "$nsr1" sysctl net.ipv4.conf.tun6.forwarding=1 > /dev/null
 
+ip -net "$nsr1" link add name sit1 type sit local 192.168.10.1 remote 192.168.10.2 ttl 255
+ip -net "$nsr1" link set sit1 up
+ip -net "$nsr1" addr add fe01:3::1/64 dev sit1 nodad
+
 ip -net "$nsr2" link add name tun0 type ipip local 192.168.10.2 remote 192.168.10.1
 ip -net "$nsr2" link set tun0 up
 ip -net "$nsr2" addr add 192.168.100.2/24 dev tun0
@@ -608,6 +612,10 @@ ip -net "$nsr2" addr add 192.168.210.2/24 dev tun6
 ip -net "$nsr2" addr add fee1:3::2/64 dev tun6 nodad
 ip netns exec "$nsr2" sysctl net.ipv4.conf.tun6.forwarding=1 > /dev/null
 
+ip -net "$nsr2" link add name sit1 type sit local 192.168.10.2 remote 192.168.10.1 ttl 255
+ip -net "$nsr2" link set sit1 up
+ip -net "$nsr2" addr add fe01:3::2/64 dev sit1 nodad
+
 ip -net "$nsr1" route change default via 192.168.100.2
 ip -net "$nsr2" route change default via 192.168.100.1
 
@@ -626,6 +634,9 @@ ip netns exec "$nsr1" nft -a insert rule inet filter forward 'meta oif tun0 acce
 ip netns exec "$nsr1" nft -a insert rule inet filter forward \
 	'meta oif tun6 tcp dport 12345 ct mark set 1 flow add @f1 counter name routed_orig accept'
 ip netns exec "$nsr1" nft -a insert rule inet filter forward 'meta oif tun6 accept'
+ip netns exec "$nsr1" nft -a insert rule inet filter forward \
+	'meta oif sit1 tcp dport 12345 ct mark set 1 flow add @f1 counter name routed_orig accept'
+ip netns exec "$nsr1" nft -a insert rule inet filter forward 'meta oif sit1 accept'
 ip netns exec "$nsr1" nft -a insert rule inet filter forward \
 	'meta oif "veth0" tcp sport 12345 ct mark set 1 flow add @f1 counter name routed_repl accept'
 
@@ -652,6 +663,19 @@ if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 "IP4IP6 tunnel"; then
 	ret=1
 fi
 
+ip -6 -net "$nsr1" route delete default
+ip -6 -net "$nsr1" route add default via fe01:3::2
+ip -6 -net "$nsr2" route delete default
+ip -6 -net "$nsr2" route add default via fe01:3::1
+
+if test_tcp_forwarding "$ns1" "$ns2" 1 6 "[dead:2::99]" 12345; then
+	check_counters "flow offload for ns1/ns2 SIT tunnel"
+else
+	echo "FAIL: flow offload for ns1/ns2 with SIT tunnel" 1>&2
+	ip netns exec "$nsr1" nft list ruleset
+	ret=1
+fi
+
 # Create vlan tagged devices for IPIP traffic.
 ip -net "$nsr1" link add link veth1 name veth1.10 type vlan id 10
 ip -net "$nsr1" link set veth1.10 up
@@ -682,6 +706,13 @@ ip netns exec "$nsr1" nft -a insert rule inet filter forward \
 	'meta oif tun6.10 tcp dport 12345 ct mark set 1 flow add @f1 counter name routed_orig accept'
 ip netns exec "$nsr1" nft -a insert rule inet filter forward 'meta oif tun6.10 accept'
 
+ip -net "$nsr1" link add name sit1.10 type sit local 192.168.20.1 remote 192.168.20.2 ttl 255
+ip -net "$nsr1" link set sit1.10 up
+ip -net "$nsr1" addr add fe01:5::1/64 dev sit1.10 nodad
+ip netns exec "$nsr1" nft -a insert rule inet filter forward \
+	'meta oif sit1.10 tcp dport 12345 ct mark set 1 flow add @f1 counter name routed_orig accept'
+ip netns exec "$nsr1" nft -a insert rule inet filter forward 'meta oif sit1.10 accept'
+
 ip -net "$nsr2" link add link veth0 name veth0.10 type vlan id 10
 ip -net "$nsr2" link set veth0.10 up
 ip -net "$nsr2" addr add 192.168.20.2/24 dev veth0.10
@@ -699,6 +730,11 @@ ip -net "$nsr2" link set tun6.10 up
 ip -net "$nsr2" addr add 192.168.220.2/24 dev tun6.10
 ip -net "$nsr2" addr add fee1:5::2/64 dev tun6.10 nodad
 ip netns exec "$nsr2" sysctl net.ipv4.conf.tun6/10.forwarding=1 > /dev/null
+
+ip -net "$nsr2" link add name sit1.10 type sit local 192.168.20.2 remote 192.168.20.1 ttl 255
+ip -net "$nsr2" link set sit1.10 up
+ip -net "$nsr2" addr add fe01:5::2/64 dev sit1.10 nodad
+
 ip -6 -net "$nsr2" route delete default
 ip -6 -net "$nsr2" route add default via fee1:5::1
 
@@ -725,11 +761,28 @@ if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 "IP4IP6 tunnel over vlan"; then
 	ret=1
 fi
 
+ip -6 -net "$nsr1" route delete default
+ip -6 -net "$nsr1" route add default via fe01:5::2
+ip -6 -net "$nsr2" route delete default
+ip -6 -net "$nsr2" route add default via fe01:5::1
+
+if test_tcp_forwarding "$ns1" "$ns2" 1 6 "[dead:2::99]" 12345; then
+	check_counters "flow offload for ns1/ns2 SIT tunnel over vlan"
+else
+	echo "FAIL: flow offload for ns1/ns2 with SIT tunnel over vlan" 1>&2
+	ip netns exec "$nsr1" nft list ruleset
+	ret=1
+fi
+
 # Restore the previous configuration
 ip -net "$nsr1" route change default via 192.168.10.2
 ip -net "$nsr2" route change default via 192.168.10.1
 ip -net "$ns2" route del default via 10.0.2.1
 ip -6 -net "$ns2" route del default via dead:2::1
+ip -6 -net "$nsr1" route delete default
+ip -6 -net "$nsr1" route add default via fee1:2::2
+ip -6 -net "$nsr2" route delete default
+ip -6 -net "$nsr2" route add default via fee1:2::1
 }
 
 # Another test:

-- 
2.56.0

