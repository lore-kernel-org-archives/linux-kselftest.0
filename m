Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505869;
	b=alXlWA4orAEYVEXBUgvsC2yfGlNIMBFZAISNhhhN50i/rSVdjh+ARzT+IzyraCXyXlME
	 7Th7bBFW+OblTYAzqu7UkK8yyawmHfHM1RnXFwFuzyyYwSWWYErfFt+CCAJd8eV3n6eaW
	 7BwPUanr/6oJz+LpN23fFnnG1KalIN0q1q2jdJc3cvvRQDaoT5QcTv940IiTO6V8mXbv4
	 J9KnB2bfvNS8U/i6odKYyG474O3sQLDXXObuzRyE+HQQ9wU1bbcTBthpN/0GWZ9/Zl/5x
	 V+VEEimblYJ8x70vWmBfTJgtWQPwDMI+9V3Poa8rz6I/6UpTXB3yoYUsHZ00EIB9S4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yt8E290dh+tISv7RUY4FIj09Mh2VhHp+yj63FHALQjc=;
	b=x1JYE5hXN4xbHTJS6ex6RCKpa6x3a1b1KmUD9BuNqOPFrjJxnYFTb781OZuSjWXnU2Ai
	 ZPU3PkUzPg16vMQ4nTIV1x4igyNV6V2O8b5WtyMdxWlE1iFpHqKqj953OTS9jjFVn60WJ
	 LRwSB3tbN+SHh7ibqwhN22pDE61SJkO2xjiOFczch+b4TbqImQ8iJ6K1xXofss1QQoMQu
	 +WgAB37dYmpsUT+fgIF9TrB6OeHjL6h9hpOavzE++yXRiBc0pxFSp0SSGr/bo4sjy1v/N
	 /mdqQq7qwppeXqXtVmpgmVfm9eizw21zDwjDvjpTeZenJ9qCqPuntzZIoB7roWAo0ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HTPDiGzf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DK7ggB2R;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C42E60A6F63
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C42E60A6F63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HTPDiGzf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DK7ggB2R
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9tPW270461
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Yt8E290dh+t
	ISv7RUY4FIj09Mh2VhHp+yj63FHALQjc=; b=HTPDiGzfWdVUe/V1+jG0cjMtZDg
	whabYYTeFVEldVcYw0qR6EO1OYDdKi0ZaVAjAkOznL+PaOwru5/S7K6yF9njp9ld
	17R056nH4/QOBZ9gO2sRZgbXH9yTwvYuJ9+NWwlezCC9mmJsjVkZJCoCT1dVjXms
	lnBjyV8wDGo2eoV9WDnBQ0h8uydGxNYPUM4sNtdAS5siRok672umX+l+eg9L/Bqk
	XqA8wtOC3j4pEowXgV0hvvxN8ltatQaGNrD65uk+FKexRvO2+g5OT5FsG/il4Jp1
	VHMQYiDa/jW4fcxk2eIVxX3FM6Rej5JY+EnUK4HOlVEOekTTTWDrrSuQK9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hv8hvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:17:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso664929585a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 07:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792505867; x=1793110667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yt8E290dh+tISv7RUY4FIj09Mh2VhHp+yj63FHALQjc=;
        b=DK7ggB2RHo+8/cyBV2sHoU6EjvyD2TPMZYElVi8EBpcH2fgcBS+OTN5M4g9bERnxyw
         hf8IPcBsCb/XMepL9Y5pFXGljJswxCIfmhZ4DQ7BMuFMMMxV9xZRqDHV/lwShuCr3u+b
         9BBwi/lnf6NfarvOf7diUULZkVNVh9KfhXz4S7w8HHbrdRVNR/dNQF6Q/O2zZ8rvSrYO
         xQkGNpRbu3qC/h2cfqJU1f1Xr40RNEDHfWORrGmP8IvmAqGfixnY4IR+MpjWMIIOVSZg
         lCOigfL8DA4FyFL3HYQrKaBLylSjDvDD6uD26mRw8afj1xwzmuBUlXz8HclQM1suKTxF
         iqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505867; x=1793110667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yt8E290dh+tISv7RUY4FIj09Mh2VhHp+yj63FHALQjc=;
        b=TRkNDZMbsaPnBk1Y212hK5vWK/g1g4xXq8L307yvQQ01ZT1jU8tyexd6fzPZtBNfQi
         Qg8en/ZMjkVGtsIPffjZypgNDKpEKlZECqcfhi/+qBJbrL2YVrOXoz0jHbmamh3Xg1KH
         mr8afCFVvqUkFO6HmwC0c5QiJlgsJ47GihWD65IL1bZlTsOyWAjO4OwH7/u+pJg/ffGA
         WT83c6VAVhd5WyWv212fZWQeRTBXHiBsYH3S0Dvk226IPOn9c34T6rUE5wlyFyaaCC59
         dQ7iLiERZgGStzrBy3iDxLJlAAwd3ysaSEkqYe8EJ9o8Tq4Y5BZCG5FeXCHzUpsbES0h
         WiwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOnEn3UEJL7+w2n425h2w0mlLyKmMgRqLCYdxluEFCgQ3Nsm09TP1sDO6eZZWspXCXMFMhyqo8Ed1Z73yeaCE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLc6emZo4srFnMZnNkA7vtx651lEfgk1aDwnUHDRv/GKF9IEJg
	+1XWpduEkKf/08gMb8iIQ7TS07ckGzWoBNrJ0SRqkUnIkBzCLvbVGDEpKd1yhmNptvyDAE/n1om
	isappCQduBBx1IW6i+4gJkCRGoq64oPHp93mdqGQG7tZgssDT7O7OTEkEIk8FQ8JHTkQq0eo=
X-Gm-Gg: AYBFou3yTIFr33N3WIi5+ZZzmLOCZ4HHkYEwe8F4KQMcyLOsArfopVRj/aLFAY6m2vn
	3VnHHw3/1edtrPQirpOxGzwTR3kxkqRoIZ+YLIyeIVZav6V4hJDEi/VZbgTitl1RmgUmjqie3t9
	XqXP0/ht3cE2NrwP+AIA1T2rmXbRxogPlphI5IQR0wZ0uhP2xBZ39c8IKpsBnazxot5big5liM1
	QIQsoUAae5u4z3DRQ++vd/Kk85xiHkcvXmztmAoFe0nw0UTdyFgXUN7nPy8k5mQVicgplgfRpBZ
	/4J0PTpCmIEXHgmmy+eo8u5EQPR1q1PqJVNnbszH22k9brF1LkgxRfDSgb4QqVmAsWxZC8n2Z2d
	diXnHCyDYEYcRvk3dHsevM6hJqSg=
X-Received: by 2002:a05:620a:2609:b0:93e:9934:d179 with SMTP id af79cd13be357-93f29d8f1b2mr1783591585a.56.1792505866766;
        Tue, 20 Oct 2026 07:17:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2609:b0:93e:9934:d179 with SMTP id af79cd13be357-93f29d8f1b2mr1783586085a.56.1792505866248;
        Tue, 20 Oct 2026 07:17:46 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:4884:6e9a:d9ff:9fa6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d810043sm6642276f8f.16.2026.10.20.07.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:17:45 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v3 6/6] powercap: dtpm: Add RK3588 hierarchy
Date: Tue, 20 Oct 2026 16:16:56 +0200
Message-ID: <e271d25192830ee02fe75bf0d5e698487b1579f7.1792504834.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfX8yZ5agGc9I4K
 q2sKm0Y03lkly8o9p/9WoIWhRWIRjwsW1uyYuB9SubInn1ijVfCjUlTdnDw+x9Qi4pf2onEVmFH
 VQhr5MQJB5nR2wMNm8XBVE7qp2TdrVT7ScgOVAXPiVpaksR18wKfk51U6lg5E/fa3z98ueiNe6C
 3h9g1ZA+Ri6glrevw/Lig1t+ECzsW1T0F+Fq1mcTfCarWUi79mSMqE4QWJ2xSvszFMgPWRGwqfX
 lZit2HxJvA5plv6lIsQQ/IgLaF3SjL5sgH8BnUHdM5+YLHfp8K9oadZIBMpcv/0gSHWmnKBoQkv
 lmy+aBzCuWjDS1rRBh/Zn/cgDOy2mqYTcBzSnEcsIg0sc6iDIaxvjQeUrC4i9LthFwB3wHOdemf
 pEk2XSNnSxxTr9WMMdaAUuUrjY3VZQTZULxlha+hjCtN71IvGbng/Q1B1lp3yYiR9DiIDH/caKo
 wirNnURYLTOZr3f6S0Q==
X-Proofpoint-ORIG-GUID: quWhTTW9p5QoBSKqNpQXg0jeNKxtNAc8
X-Proofpoint-GUID: quWhTTW9p5QoBSKqNpQXg0jeNKxtNAc8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfX5R7peWYWcIDU
 SpuVISTPLfMo5OgvHJeg1H0Dp0gEyo+wX1yJm+piFQouN13P3WYjcerIPAEtFwUvsbviptI6fHG
 02hmMGT1GiGBM7T1vczuxi63tmYOJ94=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad7780b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=8Fys3Dm6xgAeGQ2jRPYA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200056

The RK3588 has three CPU frequency domains, with CPUs grouped into
three cpufreq policies.

Add a DTPM hierarchy for the RK3588 with one CPU node per cpufreq
policy, represented by cpu@0, cpu@400 and cpu@600. Group the three CPU
domains under a virtual package node attached to the RK3588 root node.

Add the RK3588 compatible to the Rockchip DTPM match table to select
the new hierarchy.

Assisted-by: LLM
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Fix __initdata placement and the RK3588 match-entry indentation.
- Add Assisted-by attribution; no functional changes.

 drivers/soc/rockchip/dtpm.c | 48 +++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
index 5ae00680602f..664764f4b460 100644
--- a/drivers/soc/rockchip/dtpm.c
+++ b/drivers/soc/rockchip/dtpm.c
@@ -62,8 +62,56 @@ static struct powercap_hierarchy rk3399_hierarchy __initdata = {
 	.nr_nodes = ARRAY_SIZE(rk3399_nodes),
 };
 
+static struct dtpm_node rk3588_cpu0 = {
+	.type = DTPM_NODE_DT,
+	.path = "/cpus/cpu@0",
+};
+
+static struct dtpm_node rk3588_cpu4 = {
+	.type = DTPM_NODE_DT,
+	.path = "/cpus/cpu@400",
+};
+
+static struct dtpm_node rk3588_cpu6 = {
+	.type = DTPM_NODE_DT,
+	.path = "/cpus/cpu@600",
+};
+
+static struct powercap_node rk3588_nodes[] __initdata = {
+	[0] = {
+		.name = "rk3588",
+		.data = &rockchip_virtual,
+	},
+	[1] = {
+		.name = "package",
+		.parent = &rk3588_nodes[0],
+		.data = &rockchip_virtual,
+	},
+	[2] = {
+		.name = "cpu0-cpufreq",
+		.parent = &rk3588_nodes[1],
+		.data = &rk3588_cpu0,
+	},
+	[3] = {
+		.name = "cpu4-cpufreq",
+		.parent = &rk3588_nodes[1],
+		.data = &rk3588_cpu4,
+	},
+	[4] = {
+		.name = "cpu6-cpufreq",
+		.parent = &rk3588_nodes[1],
+		.data = &rk3588_cpu6,
+	},
+};
+
+static struct powercap_hierarchy rk3588_hierarchy __initdata = {
+	.nodes = rk3588_nodes,
+	.nr_nodes = ARRAY_SIZE(rk3588_nodes),
+};
+
 static struct of_device_id __initdata rockchip_dtpm_match_table[] = {
 	{ .compatible = "rockchip,rk3399", .data = &rk3399_hierarchy },
+	{ .compatible = "rockchip,rk3588", .data = &rk3588_hierarchy },
 	{},
 };
 
-- 
2.43.0

