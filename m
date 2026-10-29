Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793293066;
	b=DS9qTFuNDZh0GZXoXHdQ/ht/If6ZKS6gxnrqnABHteqTCKeZKH5dJAsjpxQzbQinyEhQ
	 WVIvAgsqQDdfonZBtKyWPqJ6WvpBOTdKTdhyNnnjzBSxWjAn+pFeuh6N19HAv37Dy1sY8
	 CMCU6BxXu8zVJpvmN9y+SNFhiDqPT32Av/ktY0SNMGllKLoiGfQJ8eeAdY6Y0ORvzA9/u
	 u5SLZ9AZhq77EGiCcpvy3dfu9Gel8Yqdawq+uSDcl4HS5eKPgJsdMexFTSQqLZ9AXAnu1
	 dztpgRHhSjCvmvrmnY3bf/RQyOmfKdjeSNmb461/9iVDu3ei5ntEk+cMsXGy8FlYuCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293066;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hTV/3nn/Rkcmn0hRyZbdsZoeAcUIyL6tsSbtRE9aXY0=;
	b=B8LkAnY+2zzO0gUyN+Zg47ct/q0Q/+Ado7sEv2IVn4kDPes52iWy0M4NJHNWisedC7BD
	 1qF0g4bTNWFu5Hc6SheWenVBZOVs4bHzafV2XcQfy3PtDxXpJr2urT2xo93W/a8BZaMLK
	 Mwi1HiSi5yoAQntQt+/Sp6o7nWyu+QEx9uQbYlNwbTKhVR6RcxPv2j1oQSyKXgYTS5BAa
	 eN0O7DAgD/A9z/2aQ/f3rkhcoYBX+OMmnGAnnaFVr/juOkIXfraLo/ay+9+ZazzueWOlu
	 sKBMpmt3rDQjs+r4GBb9QpZY/F0K5hCXRdLxrBLIOxExXWzlDuxzSZbOk+FQrew7Q7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GXs86wpK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aGrGC1H0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD2B60A2605
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 16:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACD2B60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GXs86wpK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aGrGC1H0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDHFc1654862
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 16:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hTV/3nn/Rkc
	mn0hRyZbdsZoeAcUIyL6tsSbtRE9aXY0=; b=GXs86wpKTuJaEtB7IvbsrQaIJiD
	Vzau5SA5Ip+Va4Mf7Yqhhf2vXf1VBswh8RUkDV6XmXP4UTiDz83JhUF+8vSeo+Fl
	SIxDn4xWqgvL126WPyWvXV31hOW1RV9v3jnDpX/7UDRCeP7qR0c97qiVWXf5HEFc
	tD/swatm7oFrd2gPzLbFoMU1FyoI9OTwCeprbTcqlsSzoiqUukoqjDDju6Q6CrpU
	uLNUnGdd+69JCAh4/HgijN6/8kUn+oiYlhFekVGKj5hfMFiTK5vO3LLWUtD0fA6/
	ymfcWcqp4hGlkl3kp1PsW9LTPKvtkyJiIm3nt3868LpR3rnGO/ombmT9hQg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm4a21nk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 16:57:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc0418036bso402103137.3
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 09:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793293064; x=1793897864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTV/3nn/Rkcmn0hRyZbdsZoeAcUIyL6tsSbtRE9aXY0=;
        b=aGrGC1H0Ao2Iynuo0mhrxET4tY1TvMZ+XtrCZum1T2gtXc4f3AzCJLOAxQgSvte8nt
         A8eBI3CHaoTw0F2OxeCM3lgdj7qohG3Uoqpz1o0xdFustRtaVi2eedXVRlieQX4IOxi2
         9w3owQHPOxDDlfz0jNC2zH9b1ZEmmBNwIybGjWvPqSBUR+VNQs5nb5XXwNemTdnWjwpV
         TvjHuH63sEHDqykOtRHzKXPFWPpva+tA2ORjPiG5z7CmPnMGbANYJzWE6Lw1Tih9acuT
         1UguC0MNCwfyJHGNgbIVNGn29wJUOj6G9T18OShHTBC5vlVCgURTpk9NnvWhCI+SIy9D
         72fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293064; x=1793897864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTV/3nn/Rkcmn0hRyZbdsZoeAcUIyL6tsSbtRE9aXY0=;
        b=xonrPaAneeF4Kf9GipZQO/EXH1IpEtHC988VVjieNNFcINdvkzmaVUpYK45UOIr1Eo
         AEdXxA/oohkMjWalGmjTFsNSCLMS6Q2drkbkEAh3NrjehMbCSvztPyqB9RCs0lUGGKIh
         Qi30jWSzzM7DBQEy6kwyn1CO7R2PZuLYfdETsa2C0InI71Qr83aWdgP+aeViO6XenhkA
         Re4N+/0BXGzVlBXN40BQpe18nv+GZ6jVUysf+OonWHVHRjkILEwHAebtVy27Eb9P2Rne
         Z6uOzy//5FXbB+0hXf5EPiaBbcJB5wY3SUdBFNrNzDsXBMtUO4Fr5txgKLERZa5I/YxX
         Og+A==
X-Forwarded-Encrypted: i=1; AKwUvBxX0MZ9IxZnqPi/DNWA01h1nbRhgcYSxVGU24ZoIAkJxbCWG+InWg0crvDpmvyNrICIyurcDHV7WInSpQ3NRZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJo+o5KY3cL0wj0z6pXxwaXML8ZyZaI9h6/jDlTrWK2Jyjw2l9b
	lXrlAp7GtJzcbm5BiYg2k4RtOfShPQkSunAFfvHSbM7GtUX/TsYdD7Ze9Dd0E6wMGdKiZ60L3Cm
	Def/iOpFjlamNs/UopOda2dJvDwUViR+1PPD8hoOR4AG+ZF8y0iew3Yf7nj2Jrz0xBIyIOu8=
X-Gm-Gg: AYBFou0B67bZ48uSSP0mhuk4on/np9n4YP89fl/4zd7wPpXwWi2XdiIZfOu52IQiIrY
	mQufG8I948dxMStGqLTlr+vreOp8h8uzttEn3vp4n+MyO/mAhYFiMILjBQvIVrPaXLSkBUJJMUU
	2gCIaAakmP66KdnT6egM/WN+UMYBWJE/VkEvdVrjQk8IDqxh06f6Mbs2egzheWIbWKsb+7Iah0P
	hnhDhn9B2ChX0zGgoFMN9YfmHMNEtn+owykP81aXXBfpEQ4KvnbxvpeM0F1sKVtY+on8yfReJYP
	NzZ3LwwJpJTghGCHY2nwrZ+77HFdfoQw4MnFiPbvB+PvtBNjwIYHrdpcL+dkn+dUo81IL+reeBj
	TIjDjK9qTXKdkGmdXpazrliJgac1wk7/BAB+SvaysIPHHvNuutAvS3Sh/+FAyI+yf4bJBaKMpJs
	lD
X-Received: by 2002:a05:6102:80a5:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7d03a651783mr2367413137.33.1793293063974;
        Thu, 29 Oct 2026 09:57:43 -0700 (PDT)
X-Received: by 2002:a05:6102:80a5:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7d03a651783mr2367399137.33.1793293063416;
        Thu, 29 Oct 2026 09:57:43 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df961dasm325669f8f.23.2026.10.29.09.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:57:42 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v4 6/6] powercap: dtpm: Add RK3588 hierarchy
Date: Thu, 29 Oct 2026 17:56:50 +0100
Message-ID: <50f06fc06f0e83ee59ecf9037071e02344ecd15b.1793288783.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfX5QMX2zb38k/A
 /oDXr/MGbQiM9xD82mkLkIm4MJAp/ZOFI/rAS8eqnPpSkkSIdWD1maD7c/uvswvrYNeOD8Huyec
 04AZJCh14CMN+TuzqUl4CcKw9F3vuNJ+ykYRnmB0X4zDGzitccOoouaU4Iuu7+LliPsXlxxd5BL
 wq3hZD0IxNWh4cbu92SCsOnhL2cKkKF7+HzmY7bLZnCRw3tuFFXJKvtdnTIbifnPVxLBqxt+PLB
 k6sC88FOadj1co9AchGWGxROK2lvAhSrHa4Dk6TcIsHB3fcfygq/m+xYDx7a77AhKVSMVInMRv7
 9HPryahLkZxhC440xmij/RcnhX1yANWueJtuNxOHo0YZ3Cy8eoMztGLevozU6j3AkgVoL4ddSIV
 vbd4oY7RSsdjwGiTt8onSeY0InOpXuJflCfQ1QVFSyea//pH1eBELY9/J1A/EeY9cmwoUNv5yNX
 CtIN8B7V0ToJbCu2TCg==
X-Authority-Analysis: v=2.4 cv=E8tYNqdl c=1 sm=1 tr=0 ts=6ae37b09 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=8Fys3Dm6xgAeGQ2jRPYA:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfX9taB1p8cma1/
 GnldeiuOWPKnt6ajVPtW4vkL7N9OV9MVKRbE3z65XRkGz/gkD3N5Y4/HA66kDHOzLOBiUaPv7Y+
 YkYkD7Sok3sdoXntPuV5KoLxd/fVSFU=
X-Proofpoint-ORIG-GUID: PHaoueS5bk8PPvnSEwlARXA6bMXLHJ5N
X-Proofpoint-GUID: PHaoueS5bk8PPvnSEwlARXA6bMXLHJ5N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290066

The RK3588 has three CPU frequency domains, with CPUs grouped into
three cpufreq policies.

Add a DTPM hierarchy for the RK3588 with one CPU node per cpufreq
policy, represented by cpu@0, cpu@400 and cpu@600. Group the three CPU
domains under a virtual package node attached to the RK3588 root node.

Add the RK3588 compatible to the Rockchip DTPM match table to select
the new hierarchy.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v4 (since v3):
- Rebase on v7.3; no code or commit-description changes.

Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Fix __initdata placement and the RK3588 match-entry indentation.
- No functional changes.

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

