Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714498;
	b=CF2fWx5+Ieznk9A8+9xqYiKD+0HHEgQP/FooI8GzIIpYC8O2OmAlG5y1niM+TXVshq1Q
	 S292HBQceqpL8W8XtQTv087nz4fHMMaquUh/kD+jVrqmRYHOHmg7L/aaw/2Uh79mHvzQj
	 tKASgM96YyHGWKBj519Vlin9j47HFQoS7auqWOHRJTbNzh9o7nU/e0ly8cDiHi/coXDxQ
	 N2nKpVvqRn7rLHiztiVevVNPa30IqkerwNF5M5nlFQBH1VQjbWOQPUt9a25SrXLOOO0p/
	 18xZ947FWSpzEQ05G+VewPZOtEtnR2xZSXYIo18Znsy3tMANuKxLMv8SsB0UQN5rq3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714498;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=crtlCQWUpiltNN3I3i9wQGUeGiNDUE1VlL/TwhcNurA=;
	b=Wmo+CmmOD/wgIqXDQxiq0GKazH76bvxFHCJhta2Bly+BghbQxPcfSpcEUgVYIocb+gPe
	 cfcMclE5tZkkkL8UwyoMaPvK1aCX1l6kdNYrQSIbvmDuGxntIQa+Xo3UW5+qvRKcGwHTk
	 mNK+eVq/ys3B6p1s1ogup0oBE4INjeD9xn9cguvaUL1VOstPFtzvgBiy2IszAGblzDtwu
	 xGokU8byDtzt5TGUiXAWnrP4CphHKg3YXezUUtkuknmVmjNdewL1TLUwWrLzVpHVcFBAa
	 Y+kKiD3+HzqOv+QaUsDIhcyPMZSSn2avzQMc/z27ZHrRMccpsPVeY2auQ6NiBDklDqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mk3P49Nv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BHa7Ejcn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8EB606EE97
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 14:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB8EB606EE97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mk3P49Nv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BHa7Ejcn
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZ43b3003228
	for <linux-kselftest@vger.kernel.org>; Tue, 3 Nov 2026 14:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	crtlCQWUpiltNN3I3i9wQGUeGiNDUE1VlL/TwhcNurA=; b=Mk3P49Nvd1OSxHgS
	E5kJgffxiHbNGOtD118cMvp0eal24xyXnVwMCSF79qsNvtA27Vz5vLoxG69maIpT
	PU5urcdH0lvzYkrGfGh+iIEELWW+zlqA0ZK1Dm1NWqEt3g4/0w99AAXtpscdkc2c
	cCo4OIV8aaze8pOEawRcjCXUmmc3NuYvbKjG2pMRFmGi7Wf/NZ6AT0nzkTymali2
	3ZrNv3Dkelcg1IcQ8Musyrucf8yz699jVigb8Igb/gDxAIV5iKdkAy62J9mYvv66
	jfZbDjRi8fX6/pB+GIVFokH6rx8vLxrcsutVuHNuTqYKoTNU24bxsf5INiDjAIfa
	1p6UkA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2ackffp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 14:01:36 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eac74b0596so4104215e0c.3
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 06:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793714496; x=1794319296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=crtlCQWUpiltNN3I3i9wQGUeGiNDUE1VlL/TwhcNurA=;
        b=BHa7Ejcn0/HNgQncqP7WevO0sLreZk25jVBXL23+uApv55hXgEVANj9IBeHxbaWzO4
         6lzGWAdEhfAonHU+RiXrzu7NRAJoSQybdfrCxsAmf5QG9EY1pWN1/kVgb/cUJWmwXV3k
         tzI13dCjPNnExk3GPTwdtBx5cs1jHdFSlVlw3kFsK14YXCXiUT8qFvWd5FNJLQgSdg5n
         RaYfjSrFcnMviid8KCqtzVhcHqizOukunonR9HHyYJJuH/KTTQEsk6NzZHS3bBMi6w8R
         PtBwTD3Moz1biwwDGVREvDUZmnYI2/TOaIzO0bguMdbM2+xBhJUswxnaSSO76/aOMULy
         fOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714496; x=1794319296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=crtlCQWUpiltNN3I3i9wQGUeGiNDUE1VlL/TwhcNurA=;
        b=wL6v1unT8vFHYM9PVhqTmjv4KKERp1ux/E4LqD+MWxRSMsjqlKAReAASXPf2oV3a2c
         3v2+WDMNNLTJIFb0hWZwtfluC3CwlGhEpK5KQ8pxdUd0yzKyc4wmnpXziygy6cYhv8/v
         ayyLbxMJDxZvxmZD6dhhL++xJpofp8OJTP3c7F08KyR6/UYp7hiGqjdrwhW6jb2dsWWI
         l1hsY5/Gg7DG+1PhNMU3GHOJ8kUvcaqrkILkFLzj83AsHOet6b//ieuGVnTqY7JRyC44
         16MxutRkYzDfvBey3J8a0BGAsRmMeL1oe9XnTujx4ucnGtCGQrfGM08wGgDObR/lzukQ
         YCzw==
X-Forwarded-Encrypted: i=1; AKwUvByA0xaiWOR5oxRkWybzcHbKrr+XhUcLQIxlXq6A4E0qC57naQKOMg7ZI7rY6quv0YRwrqA98bQq85NMCk8GviA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+abiO1cbtYkjrFAatGIkU8rhX/wmCLMrFMme9UcLX1KaURCyvQ
	EzSbtFckEVYck5vUmZXVQ8zYh6iv6AaVJT8fitnus/Q4KO/JsrtH/riHzairoi+xY1G/9WizM7X
	Mkq01heTv9dj2qqxoKYj3WdmLqCqdbUy/GBB/1oEgSCjpqZDKWuaXB/uw5cwYxoI8nrIORpI=
X-Gm-Gg: AYBFou1nXDHf772lzLPpS7wKhIoiArg4Ti9Gd5rQZvHbmtAaYfKu7jO8xrWSTrIR+k5
	OOt+uYipyyH4Ugc4v3A0y2jmvV961XZ6rR3QDmTHv5kOF2d4hUCBVh30k7sdpVOHaJBxhKGgFZD
	eJeD0J0Fma2MaEzs5cPs1g1LtfFBeMPdj/fLYv5k54Od7e9hHlzc8vYxNysCYTbLSMdJaikwt1n
	FovUY+KNB55/FnGxEzelaVWudoQlHqo4njgaKilGLHDJlBAt6h7HUUzKaFV1A9ynB3xXF0b5yvD
	DV8y0X8kASioikcVimQj3GwkUjfZkrDEgzhIFOQhH2ACvMSS40zvkysc/dc/nZauyLfBgj5eimW
	tCEvZwmPNAW/NszYqjdc5T+krynWegPSzrWrX+PPNron20hh6159J4hgOo5uSmuI=
X-Received: by 2002:a05:6122:d17:b0:5c9:a60b:e5a2 with SMTP id 71dfb90a1353d-5ec68996340mr5900310e0c.13.1793714495256;
        Tue, 03 Nov 2026 06:01:35 -0800 (PST)
X-Received: by 2002:a05:6122:d17:b0:5c9:a60b:e5a2 with SMTP id 71dfb90a1353d-5ec68996340mr5900176e0c.13.1793714494007;
        Tue, 03 Nov 2026 06:01:34 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm65397275e9.4.2026.11.03.06.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:01:32 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 15:00:49 +0100
Subject: [PATCH nf-next v3 8/8] selftests: netfilter: nft_flowtable.sh: add
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
Message-Id: <20261103-flowtable-sw-accel-ip6ip-sit-v3-8-60b5f063f1df@oss.qualcomm.com>
References: <20261103-flowtable-sw-accel-ip6ip-sit-v3-0-60b5f063f1df@oss.qualcomm.com>
In-Reply-To: <20261103-flowtable-sw-accel-ip6ip-sit-v3-0-60b5f063f1df@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9e940 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XuXj8uMZMfGkPmKnGZ0A:9 a=a1GBzH_hwgqQkvkP:21
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX/BxyFr+mjMem
 BRbpTMjTLVD20qL2HWObbCxXvk6OCsYbMcRm+Gc/L2LWaC9PlBbBVVgE5KKOo56zYPoE3VYxYeW
 fl+NN/o2B2K60YZ6fGM7V7WkUz60I4hMHq4lcj6uQprD4NMHU2USLlbeyZo41sVeoha7cwJgpsC
 gSWMZY06WyGt+UFlEmgSbpAxOgV8ULAU7I60LqXldryAsXxSmI0PE57eVxp4grfzEG9azLPjaMZ
 pvh7Vzj3BnuytZakgxo/Yg6tholLSSIxXN6mMibe4YBXLj0ytzP3gCiI86Qe93/baWHG7uzkXUI
 N0NQmbGFht4wOjf+w3E9H9Y96auB/6UnMcOzW1p4JV+d90riGAhXl/zHPBkIaC3EBANwzbFgAVa
 3K5BulH1zg+twIVV7gZSRSkc+gQXaKYUe+1SC7s2NiFKnkEI+lgaqcE8XDod/FJj3jAeEVj/3Ec
 jO2RbKiZ/bBn6WmB2Jg==
X-Proofpoint-GUID: w6uD3TrXb_MzOeOBlw39UDq1Gvkj8jzD
X-Proofpoint-ORIG-GUID: w6uD3TrXb_MzOeOBlw39UDq1Gvkj8jzD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfXxltNOlsQDP7q
 N5OKZjfUj+o2p4CAANmwQkM/+e+cyX326pkYaGw72eDZNt3fLBJiD0MGC2l+qlilZBWRGYFDgoy
 qph4/7oy5f+Dx/A+/5R/4v3DdaRed1o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030055

Similar to IPIP, IP6IP6 and IPv4 over IPv6, introduce specific selftest
for SIT flowtable sw acceleration in nft_flowtable.sh.

Add sit1 and sit1.10 devices, route IPv6 over them, and add
tunnel-specific flow-add rules so check_counters() verifies offload in
the original direction.  Append the unconditional accept rules after
the ct-mark counter rule so packets that cannot be offloaded are still
counted instead of bypassing the counters.  Enable CONFIG_IPV6_SIT in
the selftest config and restore the IPv6 default routes at cleanup to
prevent tunnel routes leaking to subsequent tests (e.g. IPsec).

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
index dcbae9a3d92b..efab3854ddb8 100755
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
+ip netns exec "$nsr1" nft -a add rule inet filter forward 'meta oif sit1 accept'
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
+ip netns exec "$nsr1" nft -a add rule inet filter forward 'meta oif sit1.10 accept'
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

