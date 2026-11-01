Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559752;
	b=LxjNSPBwjuJkpE4tgICentuiMzFLMKTArI0tDewgZkBqQ/LJp/X4s5BK2uzxUwn5HXAX
	 X1mZA61/oCpQ95ZNPSqo+HIzwG+COpcwOJWLVMDTIfLfTX1vKAu6jTDtjPtLJCaVurLeI
	 Idk6MetZFawpzdC5W1FTKq482v09rrnZVF5EJxn5P26x7ErlfxE+9xwlKQI4TxTYEGZSx
	 tvsMxlYtL8VibzHQDSq4hzXTkfudJUSGeIMOzTM3tvHP9Ve4LvshJc/O3VDwPtDHPtUCD
	 6gbJb9SEvuJbElLKAm0DDLJeESBisZBjCnk+YYNT2iXZ+ChKwSjboJLIDvMcHU6vboA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559752;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bkyFaU7pm1UiMcf0aTZkl/EEwuv05ryAASaXqNs27JQ=;
	b=H1vDX1m604nghm5hvC0oZSNObG7R3yls1Ebu6ARGdNftZYDYIvxYzdxvhbF2OFsRBNZZ
	 Dgiy+UupfomgyFaJuOTQqC1OlJuohvtoSrSV6HPojxGYcFfP3IfZvChW2iG+muYFcsdvY
	 Tr6U7i/gPogbG44ENXoy8hkNSuC9vQhNzIktJLOQyT9wWSmtEvxSDm9a600QW6zP/5A9T
	 QMjzPdO4TJVmmoH3MF5uNpZmj8Y432AAQWaAzkNTqQWIuob81PrSJpFXlDpMQNhQLdh5/
	 1WJ10FONEWMOg8rtMbGE7kVjuY8Zr9sq03Y9St+tFji4xkUlIzIk7dWuFttXGJONTFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SYR1ltU+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MrzkMnWW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EE7606A326
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 19:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70EE7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SYR1ltU+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MrzkMnWW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQ8oH1099024
	for <linux-kselftest@vger.kernel.org>; Sun, 1 Nov 2026 19:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bkyFaU7pm1UiMcf0aTZkl/EEwuv05ryAASaXqNs27JQ=; b=SYR1ltU+h+DcYgUS
	KwUm0gjiC5pxOnmN0rOWydYeeAQUt2Y5GWUV9Ssqisgziv5GYDbOASmCtvnRklNM
	APIZSukBaEgcR3cERN5oruncVgcULyq4erxjZw8TgDl1wWIHHGNuka3Q1Q95btu0
	pnxBUwc0ZZ0C/7h5DlIidVGslPUtUURR3NQzhfWVggWB8/1hcLjTcAAtzN/xPHgj
	FnP4bpvTxS78Vlwbejci9vIiNuUZsZVVXVTIzzdyPh06ygnBRAA+iE/8kkFVpgH9
	A4x57MuD7p9gUqjd4rPOuJkPlnmenqRuznfsc52aM4vJf4VqlMmbmYqUDytuTE1u
	mbNusQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfv3sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 19:02:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so125390485a.1
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 11:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793559751; x=1794164551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bkyFaU7pm1UiMcf0aTZkl/EEwuv05ryAASaXqNs27JQ=;
        b=MrzkMnWWxj+1T9HABI6xBvJwGSQLbYo4iE6lfkI1NvW8OVeXZhecN+LkSQWhxGAOT9
         nYe59VJfFzevnVGjaaj+LMMbo+sd+CQ4iFyqDRLNeMUFyY3TxfixG1a6ddpS2l2bUajn
         05JgH8LgLximpWeSdmwFnEGqQUAT4gzPX6XbmXySPrLDQ+yt7AWbOksnSkkzG7TvudGX
         6bKpEn3rMNZ4OEi/3J1z0f/e/L3jsVsNREu8jaL2dCoycnxKs6G/idBQwUZS+AerXWZ7
         IW79arVsPxQaNofBgQozxxNFJBaHOpRzVfvxngwy7/7gwssMfwYjDw0tYvIKXZy9l3M1
         Nc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559751; x=1794164551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bkyFaU7pm1UiMcf0aTZkl/EEwuv05ryAASaXqNs27JQ=;
        b=Wn0aDjyKP6O21w5isjOFPeo9PhsBFF9e0LT3KgL4YMCypnsW5amzTsFMikQHwaeSLk
         6YsNNOfUFunR9Mv1vUHJqPnSFP63en6lK6A9HYN6Dxnh1ansuuIxUuMfoseHPE9mIUsU
         nqnoKJyKHQzrHuR3DDMRoeeoOLriSs2fMyY8p5ODW7jxW5DCvg+sTqa/nGK1mP+cWykG
         VHcasmXGlIspUsWJhwXVVto5USe0mjOv4+AJHW3DeOrOFGnEu8AXLs2SUCVJor5inmXr
         QQc+uM4EoPvsGOdacfcjAkpIYhf3jo1kyyiVK65ho9yhHwbS/8gaOu5SdIgD3dbtxUNK
         DnrA==
X-Forwarded-Encrypted: i=1; AKwUvBxhbhmTynX0wMY6KP1B/MZOvT84MTh51qYUtCNCrVmwdcJfGXjd2j385dhHupds0/dNQcUq/4L4LwidJA2YN0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkNjQvUrX9akncvDgYbPJ5m8zRhZE7LtBtFvi3ER01i+yJLIi0
	iZH5tUd7Y4ACLjxB0KmBN1mVt5CF+MqvVDjBomaoeJxkloI3NKozkgmMlQfKU0J4MnFVQ7GFOZh
	ooya1mF1uWbm42BftxJ6/uSuZ/Gv/DZJPzm/ug2dp90wMtLfmySEvvqYnXlBV1Gjgp9GTINc=
X-Gm-Gg: AYBFou2ecY1vqa1KqskG6uWAjqDm3Skl+e+22uH/wfJkuzz96TJVUi+bex0jcV2LPLY
	F3Oqa5DnB4prIAdl9czvee1CKLHyIzISGuANSjFfEm9D2aSjSEMW2F3Ndgafx2y0biNlJB3hGGK
	5A2PbA43bQ+AON7PTvpfWdunVCOjYqFy/IcodAVd8jGhkLyZNj0+VCPgsU1OTw8oWhJ9PLBw7PM
	88xywfjDjMD9d7NB039f/gcgqGnwj0CzH7wM5YU8WSLOiSPsFj8XZFl+S1Z1GQuFgRhd4W+RnW0
	48TzyrOFo68wjpkQ0Moc/YwbE1SRikH0JKIP8/GFHgKjACVW9iokbe6Y5IsQcM9uWrFwdd0MRzA
	uEKFR92rt749tL/pUgs4guVT/EOEWXQsBgtljVtmEsXfn6Z07fVz2KWmp5NejaOA=
X-Received: by 2002:a05:620a:404c:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-94421725362mr1333069585a.65.1793559750708;
        Sun, 01 Nov 2026 11:02:30 -0800 (PST)
X-Received: by 2002:a05:620a:404c:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-94421725362mr1333065585a.65.1793559750104;
        Sun, 01 Nov 2026 11:02:30 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f047bfsm287704435e9.3.2026.11.01.11.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:02:27 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sun, 01 Nov 2026 20:02:00 +0100
Subject: [PATCH nf-next v2 6/8] selftests: netfilter: nft_flowtable.sh: add
 IPv4 over IPv6 flowtable selftest
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
Message-Id: <20261101-flowtable-sw-accel-ip6ip-sit-v2-6-c6c282cab5cb@oss.qualcomm.com>
References: <20261101-flowtable-sw-accel-ip6ip-sit-v2-0-c6c282cab5cb@oss.qualcomm.com>
In-Reply-To: <20261101-flowtable-sw-accel-ip6ip-sit-v2-0-c6c282cab5cb@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfX38GfTBYFNSNc
 D99xqLyMEY4cVELcIkPBRQta+YHbGqy1OOIc2Eu6biv1yzgi7zfE6kNksV9bMDhIKmLvKZ6yvOx
 33n6F1Iav0UjZlHr7sropasANKmHAWU=
X-Proofpoint-GUID: ut_3KD_Eh2HMwH7Wvd5OaJi7FqCwmRye
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae78cc7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bN0dAzVfwMEGxDOd9cEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ut_3KD_Eh2HMwH7Wvd5OaJi7FqCwmRye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfX5XCDTXSHg9kN
 lcd4+qo1fPjWWxIzw3RNXF2WtRMhPRRUgkK9rzgbAdWQ0y3//MzIQtac8U2QjYnFhNDL4L72HW+
 /wzwkSNZsOPxtEQ/kDLtzC5Z5RDE6mhMl5qYvRaLOF1TjAKufnM+ZAR+2XL6nJShrxT8BGlJmCD
 YKgDyGT6euNdgVGjD55x00qFK9yxBHUZSiGVOSWaNlj6f5qZzpV3It6WOG+C5NHHXQhMVEbhvkz
 U6TRnUI3SyZlPUVdVREDn2TN0t0SHATTy/Fwttp0dnhYdEqqGi8oi44GeAuANASI+ECqqUBanJD
 GV/0ZDC581vOf5rpFGFHLmbPgBOb29Avf1WR0Imexy8GDRus13ldaa8jRI+IBScV6wsF6Gc417G
 2Yv0Yl/NagQkiFUgUvdj11OGUPGKTEoZvZDGOg+6uJbdfEfhMbxHoFL6dmEntWZcz/U/5Ze5HkB
 ulCZ5FAsm2EJGXo496Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010075

Similar to IPIP and IP6IP6, introduce specific selftest for IPv4 over IPv6
flowtable sw acceleration in nft_flowtable.sh

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 .../selftests/net/netfilter/nft_flowtable.sh       | 33 +++++++++++++++++++---
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/netfilter/nft_flowtable.sh b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
index 449c518bd947..dcbae9a3d92b 100755
--- a/tools/testing/selftests/net/netfilter/nft_flowtable.sh
+++ b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
@@ -579,9 +579,8 @@ if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 ""; then
 	ip netns exec "$nsr1" nft list ruleset
 fi
 
-# IPIP tunnel test:
-# Add IPIP tunnel interfaces and check flowtable acceleration.
-test_ipip() {
+# IP tunnel tests:
+test_ip_tnls() {
 if ! ip -net "$nsr1" link add name tun0 type ipip \
      local 192.168.10.1 remote 192.168.10.2 >/dev/null;then
 	echo "SKIP: could not add ipip tunnel"
@@ -594,7 +593,9 @@ ip netns exec "$nsr1" sysctl net.ipv4.conf.tun0.forwarding=1 > /dev/null
 
 ip -net "$nsr1" link add name tun6 type ip6tnl local fee1:2::1 remote fee1:2::2 encaplimit none
 ip -net "$nsr1" link set tun6 up
+ip -net "$nsr1" addr add 192.168.210.1/24 dev tun6
 ip -net "$nsr1" addr add fee1:3::1/64 dev tun6 nodad
+ip netns exec "$nsr1" sysctl net.ipv4.conf.tun6.forwarding=1 > /dev/null
 
 ip -net "$nsr2" link add name tun0 type ipip local 192.168.10.2 remote 192.168.10.1
 ip -net "$nsr2" link set tun0 up
@@ -603,7 +604,9 @@ ip netns exec "$nsr2" sysctl net.ipv4.conf.tun0.forwarding=1 > /dev/null
 
 ip -net "$nsr2" link add name tun6 type ip6tnl local fee1:2::2 remote fee1:2::1 encaplimit none || ret=1
 ip -net "$nsr2" link set tun6 up
+ip -net "$nsr2" addr add 192.168.210.2/24 dev tun6
 ip -net "$nsr2" addr add fee1:3::2/64 dev tun6 nodad
+ip netns exec "$nsr2" sysctl net.ipv4.conf.tun6.forwarding=1 > /dev/null
 
 ip -net "$nsr1" route change default via 192.168.100.2
 ip -net "$nsr2" route change default via 192.168.100.1
@@ -640,6 +643,15 @@ else
 	ret=1
 fi
 
+ip -net "$nsr1" route change default via 192.168.210.2
+ip -net "$nsr2" route change default via 192.168.210.1
+
+if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 "IP4IP6 tunnel"; then
+	echo "FAIL: flow offload for ns1/ns2 with IP4IP6 tunnel" 1>&2
+	ip netns exec "$nsr1" nft list ruleset
+	ret=1
+fi
+
 # Create vlan tagged devices for IPIP traffic.
 ip -net "$nsr1" link add link veth1 name veth1.10 type vlan id 10
 ip -net "$nsr1" link set veth1.10 up
@@ -661,7 +673,9 @@ ip netns exec "$nsr1" nft -a insert rule inet filter forward 'meta oif tun0.10 a
 
 ip -net "$nsr1" link add name tun6.10 type ip6tnl local fee1:4::1 remote fee1:4::2 encaplimit none
 ip -net "$nsr1" link set tun6.10 up
+ip -net "$nsr1" addr add 192.168.220.1/24 dev tun6.10
 ip -net "$nsr1" addr add fee1:5::1/64 dev tun6.10 nodad
+ip netns exec "$nsr1" sysctl net.ipv4.conf.tun6/10.forwarding=1 > /dev/null
 ip -6 -net "$nsr1" route delete default
 ip -6 -net "$nsr1" route add default via fee1:5::2
 ip netns exec "$nsr1" nft -a insert rule inet filter forward \
@@ -682,7 +696,9 @@ ip netns exec "$nsr2" sysctl net.ipv4.conf.tun0/10.forwarding=1 > /dev/null
 
 ip -net "$nsr2" link add name tun6.10 type ip6tnl local fee1:4::2 remote fee1:4::1 encaplimit none || ret=1
 ip -net "$nsr2" link set tun6.10 up
+ip -net "$nsr2" addr add 192.168.220.2/24 dev tun6.10
 ip -net "$nsr2" addr add fee1:5::2/64 dev tun6.10 nodad
+ip netns exec "$nsr2" sysctl net.ipv4.conf.tun6/10.forwarding=1 > /dev/null
 ip -6 -net "$nsr2" route delete default
 ip -6 -net "$nsr2" route add default via fee1:5::1
 
@@ -700,6 +716,15 @@ else
 	ret=1
 fi
 
+ip -net "$nsr1" route change default via 192.168.220.2
+ip -net "$nsr2" route change default via 192.168.220.1
+
+if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 "IP4IP6 tunnel over vlan"; then
+	echo "FAIL: flow offload for ns1/ns2 with IP4IP6 tunnel over vlan" 1>&2
+	ip netns exec "$nsr1" nft list ruleset
+	ret=1
+fi
+
 # Restore the previous configuration
 ip -net "$nsr1" route change default via 192.168.10.2
 ip -net "$nsr2" route change default via 192.168.10.1
@@ -847,7 +872,7 @@ ip -net "$nsr1" addr add dead:1::1/64 dev veth0 nodad
 ip -net "$nsr1" link set up dev veth0
 }
 
-test_ipip
+test_ip_tnls
 
 test_bridge
 

-- 
2.56.0

