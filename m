Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793681353;
	b=cFzEuGluBXDw0W6at0tx7CBf54SZ5HJIlsucWO3rPhOsnyvtETefPxfzVWSjbk0dotlg
	 CBTsCcCbJMVTUcsWNJNRHj8H6uK76dMetiG/8MsqdLgE+whCRC+uvaiA7p0IVgtZjzIly
	 2RIvvjFiSdVl/dVkSG8D7bRgLogQwQ+hpKJdxL4fAbHkgfnnQYErmEoyIhSuSk0EWA8qz
	 TTuomt5z1flEepTDrSrHVRGB7D1Pfr9IwMKylmEv8wOnP/lEeJEDDJqBw+ZEUJj8FVx3O
	 N7mOVowundcSvJfeIwEsNDe19Msc+t8fOtXv9Q+59bxzrF4DAu7FCcL/1r3Pst7VNNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681353;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aLQirFytpFjaE6BC34p8KJJHy2Uy3xoA/cAaFgViJ0I=;
	b=lVUrfHOJfhllDcLI6BsTXmjsvIElkRD1ghMPv8fq7nK8Cmnpq5CQ37I/kJcpIh0DjpbX
	 zY9HkWwGJibxFrADDkR/IlSSDQfVo7N3kgCTi33u8LWGrKZVsWC/mUf7xwY6dB9BQT5/W
	 pHnl1ie1H6E7xNJXuof8S3F06h3UoSbTxGcmjMAPcle4yBDqEsQ5zYgOX5nFNIF7OC/CT
	 hi/uCbU+2z6HHRcNn+TbPPcQME5o2MojwgiKJA4a0lDwiy/yAgRpmfE99ZRruQrTQ7dtb
	 MgFd0iTgAvyQ9deBDWjlQRym6fF8MboTEub9uY872kpfvxoFvtE/1MhlrI4+BhF9Y9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="HW/gtEYO";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bwhgqKQE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6259F606A338
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 04:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6259F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HW/gtEYO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bwhgqKQE
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eMi51431345
	for <linux-kselftest@vger.kernel.org>; Tue, 3 Nov 2026 04:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aLQirFytpFj
	aE6BC34p8KJJHy2Uy3xoA/cAaFgViJ0I=; b=HW/gtEYOYq7qPFBq0/gQqd/3Np+
	RcWkro5MXkDQIBNCR1TXtNRsGdHdCsQiKw66Sx/kGOr08qK1PaXIYeiYJ/wry6uM
	IU7tQM6geAV3UkQw7gLioBgYAttptD8T/JeAJmiwFCc9gFObLAjDR+kgZ4ePka+/
	DIwNKCEntBWFyADddc8uBtmmvwNeqL0lke39UycuBFBUqhVai/E8ChTizHlMoEZF
	SliM+VOWEWpM+qr655TBkIyu0lnOX/Q+j1HrAaXJXhi1af8JH+sJorsELhWbkyMN
	uYU/CWsrEhRLd3ffRmnO+FLwWOy4ETQslXaj0tuelDfhTGhWCPmWUNlgDVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq0871xwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 04:49:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944101e6367so59378585a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 20:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793681352; x=1794286152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLQirFytpFjaE6BC34p8KJJHy2Uy3xoA/cAaFgViJ0I=;
        b=bwhgqKQE3kqUkT43/q6GQsFlxYJYpo21rnOUzLdklDETojqytxgxZjjAzqiIij1vf9
         pa0fhw1OWb9qIj/AKA3KYn470F/shF1VZSv4WL2wCeYw/ScG0ZsPhCVujS6Q0hM17kwC
         rriubc9/124mYHa88yloTUCdb864CQ2ZbXkCeBgBitPdaem+zlAWV47OCVm7+x+prbG/
         ZMly6bOZVeePcEDKz66zsnFITEBj4vY0tiHkopI2TheFTsX+QrFs2Dez443/SaI3Eiw/
         mmsq0NVYGQeDC/o6LGhubWOnJOuMhlAFwD90C56DH1x7SYo32h4+GwZLRCwFQSrmn8nj
         RkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681352; x=1794286152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLQirFytpFjaE6BC34p8KJJHy2Uy3xoA/cAaFgViJ0I=;
        b=SD82o1jtsxd3rstvzEz6wA2V9d+FvIIigUGHta6cJlvNrzSV2RD5PKem9LFFrRxXat
         Eqsm4Q5JyOU0/wjX15v6zNma3+IrJWcbH3iV0s9SBGnxAsKFuCp7KBXYQ/SPRXFn8Qjd
         sd5nijwDQ5Apam+j3vm6FdM0SxtGxPgn+tmdnlb+7ZHY5Ogj7NLrUIBK2T/nRSyY5l/M
         6UUpOsXKBMjv3zAvzgrkmfKiUI9eEfyMae39yCGZYvv+An9akHSjVHPhaPLlnY6Q7lt3
         3+tlDhewAB3l/z+GgLqc+Tdmck6dX3gCoS+M6HgCOh96TKcL+um8IOtYTnXZyNupWtM5
         XqGA==
X-Forwarded-Encrypted: i=1; AKwUvBy7fTG+KTAow3V2z4w+G56z8XcyuKyh5ZozqcBEnHSPcx8RghYUTUHavS1gPmjiWInNpBpXiI6g+MPhH+jfck0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+178pQtD3O3Q8ChIMUxf4vUKFdqrZ098iUUkPlsybKZxotXA7s
	8aLSVs4JazbKgW9eJqhUNAuKg4mjAEa/E10o9e2+32jA4XmwKBuWgdXXeuLzLlZ+jPr0BIasO3W
	xz65A9hDvEv6s8O8R6MiKD6D9hmvzjy12HnzvhEm5aJICaSb0/zBkwKsbcfYtYHbf3VltyxY=
X-Gm-Gg: AYBFou0r5JYHrie8SVCTbELd9l0MeBgG8mjGk5ZRDf10cElkllywssf7g6tMS54rvLe
	q3tFb3HROR8BS9qjI9ZT0i/ds1gCtgOokuHZrBPCwOZnzv0I58cPl30nXbiO9IzXn/cHEgBwHAL
	up7o3jkHm3bxQbtbrd9u6PP87D0AmWTXhvuRy3cCM5z0o75wnud2TCHcQZThy1iB/3B7rO87aul
	TwlSXA6wk+zB8fmWYCisGOcqK7GJqOgGfBsLBLH+tux+uAt/myw3FDEgPSwP3h8W9fzuxCmq3Bi
	gYbxQHEyXdNJJ/W5+ZD4PTTETd1SXmTjvFpigLvP8k9s75AtY1RpGAEQDZi6ZSRYGPiEVubvtAM
	yBIonyKI42x+5mzZ1Yu4EEkTQgR4NWrtaiXMekdQybeXj/EBQ2SZ6cewCXrrADywt01kCkiUaVo
	ja
X-Received: by 2002:a05:620a:4052:b0:93c:290e:9e9c with SMTP id af79cd13be357-9441337e6c2mr2383283885a.16.1793681351770;
        Mon, 02 Nov 2026 20:49:11 -0800 (PST)
X-Received: by 2002:a05:620a:4052:b0:93c:290e:9e9c with SMTP id af79cd13be357-9441337e6c2mr2383281885a.16.1793681351285;
        Mon, 02 Nov 2026 20:49:11 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8b9e:7797:dd05:11cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879fb29sm25685445e9.4.2026.11.02.20.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:49:10 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v5 6/6] powercap: dtpm: Add RK3588 hierarchy
Date: Tue,  3 Nov 2026 05:48:20 +0100
Message-ID: <973998404b628e5a995a06fbd0febce0802f79bd.1793666444.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX6tPYi0KovBda
 Lm0DgU5SdcuBH8f3Em1ukccECa5eAVVvkIJhZlPnKGqALe62eSwzIGOoGpduAYSBK6PsO2WcMO1
 xGiDT+JKRVr6q7oSEqorxAUng948YMg=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae967c8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=8Fys3Dm6xgAeGQ2jRPYA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX5HummuRrku7e
 iL3JP88mN73TawXhyzvr36zzHkA/B+6tgDzXQiUISx8R/wFPWQ0l421b+iJwK2e8NqcglpJ0xyf
 2ltnVVyNyAezsQg2vu4/B4JGuOb82KCZVTBq+PxSgt4Rrs4NdyAgJoh+hntUputIvGExllHxPlB
 8KEcrTNq7GI9NhXmQJiWFjh1YEFLvkCoq/zSts+zh8O5/mZhW4vBi9kWkSGfyyAxBnhNQ1t2r8c
 QbyqgHzj18120wgmjDvYVXMW1GZQUhynhl4DzUPvEVoorJIdNHmUO6qMwN7vrYdLGDSSY9EFZTN
 OZoLVXRbrPcVC/BbHNUuZ0a6jEMCivX3/z2BGe8z+3BI22pcVz8CHUSHZ7w0BwXAFzha1WI6SK8
 AhVwO8J3PDAX9dzjEFJWY4TH4qCgLJJXKBwSzDvJ/UY4Mtz0sDmcQtNxEYMH6v4kJNkUv8tFoWG
 Xtnru2g/Wd7nVldbUUg==
X-Proofpoint-ORIG-GUID: _JOaD15IA7h5yWweG4FkrZY5yxtsWmT-
X-Proofpoint-GUID: _JOaD15IA7h5yWweG4FkrZY5yxtsWmT-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030018

The RK3588 has three CPU frequency domains, with CPUs grouped into
three cpufreq policies.

Add a DTPM hierarchy for the RK3588 with one CPU node per cpufreq
policy, represented by cpu@0, cpu@400 and cpu@600. Group the three CPU
domains under a virtual package node attached to the RK3588 root node.

Add the RK3588 compatible to the Rockchip DTPM match table to select
the new hierarchy.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
---
Changes in v5 (since v4):
- Add Reviewed-by from Lukasz Luba; no code changes.

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

