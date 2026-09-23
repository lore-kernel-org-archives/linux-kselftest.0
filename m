Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E4B51DAEC
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174072; cv=none; b=cF6cjNmPDTfcvy7TWpfbC98jInRE3ZXRP3lCycqYaxBW/zn2f5nIkEpaMPZjDL9r4aRFG8Spy9OyXBsnG7FrS+zoagREUJeeEjy+ed7jRilK6cG7upNpd5aV/0quuH282uFhQ25N7WPSFko1u48OwEUhf6GHYK1Nkcu1IZGS5JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174072; c=relaxed/simple;
	bh=9xyRHdCgfMca3bMdWZS8InA9gKlr/oUn9ZYnEn8KGeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iWmNib52rNIDwX2604blta1utbFHDWaaQ5Msz8OyciOswv5Sbedxh7f7J6HiwYODj6N/0RZlJZxVJ7qIrPSm8pNrvS5jInT/itarfOF9ZrPyZUPLuK6+GbfFVg0pMRmBC+u2L8ht2TVHeUS2BNqk0sDCkMl/hhQGZRadJqvQeGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mad5ISQJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJrDY5Td; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mad5ISQJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJrDY5Td"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbWid3413890
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GvKKPhwjd49
	meQYxdaIJIhbpEz/EwQIgAg0VwR46sfE=; b=mad5ISQJLfZxYdiQxK2t7A88ZRU
	2XXcfwD+hqWCE1+o1K4fsACs6X9nzj2YPzUFCjH2PxefUX4MXrcNdt0giu0SKkhb
	btj8UImA0UdMPNybZ9UGKot4QC9XyTwwhy19Lk5gBv7nD+Jd/SzOc8+CYxm0CsKJ
	CAayhfEt6q9yJ8/jYeoPjtJQc4GGHNH49xx5321cwYRlhQMwfDSp9idSMTS98YqT
	c0mlQBocusFHg8FvJpphDtSkHOw0m2FDDlW+0c8/OZsPzMvpUXa9dfp1XAljwHz8
	ZCgYtkhIyciDzdmxtjDnUNMaIPF3YSzZve7pe4ozW06vSvmNt2X3oEWWAkw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n2g06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:34:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fbc5a4cf8so2361329137.0
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 07:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790174069; x=1790778869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvKKPhwjd49meQYxdaIJIhbpEz/EwQIgAg0VwR46sfE=;
        b=hJrDY5TdbC02RrJc4tN6xB7L8exByXEzvEffxyADn/sZE2/E1licuH9eIL81Vrgrea
         B07NrL+FKDnC0lvh3TwSN7E18w+Lnby36gOd/umFy7R8l0FwFxBzxzoYr6jHy2/LuVJt
         lgo1/NG94plVx1R5SIkO+Wrj4jitCMgnZYWm2wUfYweFziKFLzDkx5KB52Knds/dx2R5
         isL0CWxarAStQBboohJsHY2Iy8zwJPAKHZkTEGpgXwUtv73YcJ/GBVCG4Ru+lyNijdkV
         OG/F11ozrbecwO0nL0bdEHtUIGXgwxY5asb9q+v+/wvYJC4TDeXYj9tHjBrGqb8FhHed
         KfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174069; x=1790778869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GvKKPhwjd49meQYxdaIJIhbpEz/EwQIgAg0VwR46sfE=;
        b=fm5PPTcBbwLjLuAxlEo9B4Cni6YyCKKO5uJV7vMvmbWhP0Nqev5XsyWcyFd2gR7GAo
         ftNO3Mio70Spy1b7ND7ODJU72ULsVEiiwSvJ4iTsdvh/WnQoFUzLOI3C2SWhyDQpE8bt
         HGnlyX3Vv99vcXmtAZUqWLOga8zRF/d1IMg0CdcgbVq07Cp/yyQm3LYCAOukJTGRO8gQ
         cWaq81dugCez8bqeH5foyP8lyBEL0F1XMohdek7CXh26cP6sSbt8Dd02K9VYkgjKhf8E
         5lM7zoRyBsHbddS1N9UYW3OKBxOOhmYe/hyKs0szof++Yni92EG/rQRR7lUgNa94m+Ll
         ctXA==
X-Forwarded-Encrypted: i=1; AKwUvBzV4dqjnCt7wt0YaYUz7lIbfWnu2RhZrRYESb8kZoMxoT1WpJVIvdRN9Db/7EJroRqaRMVWS+NxFkHDHJlVmcA=@vger.kernel.org
X-Gm-Message-State: AFuF++lMYqHr1NCceAJLUpydkj3eZJZlEbQRlymQmpSb2odLlVfBoy8z
	s0CIPAdeZK79ji/khgpx6O5tb0KeXX477d6XmPCOoWoQx+EISpDNj6m395ucoVg0RRWmxjKj/DL
	cdixK2mdZ0f57aET0zBa/IVjz7USzNGKpYvX3GPmaaRoeqznJOj9Gy+oyrDD3AC5ys/yXUe8=
X-Gm-Gg: AYBFou3OPxZcQ/uu5B1fjlPdjyvArMfoxtRBflY5Tp4OVbmL9Wg1LN4Wke27jaDa5QA
	jVQN2q8lBGiIGMhZy+bFBivr2uY4toEqkkvujfvA8Y5ztJ+ziG/6hqoG6sIO3IitfU88mohMTym
	gcpRgfJIF6sCUiohqaiB1Jxp1qE8yrPDAdZIhNIxiuE03oPPEFNFWUiK3U9ukZQ/TNxt92BVJe9
	O6Uhogc8wLsfUpQY6R3JHK4o/OmtCfohQqimxSonEFKUTkx7cYkbKYE1gdVo1pJB63AoFhZ4wOH
	M+mSE7ggaMt1RVX3s1ncO9lWqN8H4hbckjljSe1513FbqQqjXwVdz6T9UrNvrC7aLLYDDr4ULlZ
	iqYav0BTBs+6KSC3YSke1ncuNMYw=
X-Received: by 2002:a67:f74b:0:b0:7a1:f2b5:6468 with SMTP id ada2fe7eead31-7aaa0b1469cmr4699509137.37.1790174069255;
        Wed, 23 Sep 2026 07:34:29 -0700 (PDT)
X-Received: by 2002:a67:f74b:0:b0:7a1:f2b5:6468 with SMTP id ada2fe7eead31-7aaa0b1469cmr4699489137.37.1790174068780;
        Wed, 23 Sep 2026 07:34:28 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:a913:ba43:96d7:743c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf158147sm58213905e9.0.2026.09.23.07.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:34:27 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: linux-pm@vger.kernel.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
Subject: [PATCH v2 3/6] powercap: dtpm: Remove duplicate RK3399 CPU hierarchy nodes
Date: Wed, 23 Sep 2026 16:34:13 +0200
Message-ID: <20260923143416.3713485-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923143416.3713485-1-daniel.lezcano@oss.qualcomm.com>
References: <20260923143416.3713485-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfXwbjw4PscKbAo
 U3uYTmsF3B6MpmqmwIKclf6ikENsYzTMHSVlxq0kFpL1qyaaaUbUaxxU/1TOS+ltR80n1pUJ+bS
 Ju6RXP8RZx3hjPXTrxtPy3AUsEgce+I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfXxAwsj2XI1zrF
 DGw33x2yuEDIXhZp4ljLF9ZAU1ky7uViskRw7mjACgBAB+rjIDfUc8UtP0bZsulY/r+/P6Ei10z
 gP2+ivfe12+6e33R46mwkRIpzLCn/ps/+0AYR1SFw9jn8P70JutwrLji/e+LPthGj1alJyUl4qU
 LMXP5kMn742qPcfkAAmDqBxYA9ksCcgObWT3GmUgtsTCyNuU1ncCsyzE9Gii7WM2Z3NQoJAlItO
 dpmgOLrspEaOb+jBvqgC4Y3DGVfV3Dgg/jxg6EfQfh7i5/IjwnmRwhw74cDlCD+0q81VzFmYk1f
 5Zix5Z5ba/tlO0t6JAwpazi7TDtbEIIvf7KUeAgCOpETklkfaqVAmV1f5PSz14Ka55q7fVpLEoq
 HxYr4TcawOz/B4kiJoy+Oe1viM6jG15TbaaaG4cjUiVblTBgME4sbJnqCsQSlI4mFlfRkeEfvrt
 KozcmiRDTyjHPFujNVg==
X-Proofpoint-ORIG-GUID: tsOHNi5pWJzf2Pp-2gHRc02qQ5_aZznm
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3e375 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=mWFzwBaPd1sawqwuj-4A:9
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: tsOHNi5pWJzf2Pp-2gHRc02qQ5_aZznm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230058

The DTPM CPU backend registers one powercap zone per cpufreq policy,
not per CPU. On RK3399, CPUs sharing the same cpufreq policy therefore
map to the same DTPM zone.

Remove the redundant CPU nodes from the RK3399 hierarchy and keep only
one CPU node per cpufreq policy. This avoids registering the same DTPM
CPU zone multiple times while preserving the two CPU clusters and the
GPU in the hierarchy.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/soc/rockchip/dtpm.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
index b36d4f752c30..e6a0c607334b 100644
--- a/drivers/soc/rockchip/dtpm.c
+++ b/drivers/soc/rockchip/dtpm.c
@@ -20,25 +20,13 @@ static struct dtpm_node __initdata rk3399_hierarchy[] = {
 	[2] = { .name = "/cpus/cpu@0",
 		.type = DTPM_NODE_DT,
 		.parent = &rk3399_hierarchy[1] },
-	[3] = { .name = "/cpus/cpu@1",
+	[3] = { .name = "/cpus/cpu@100",
 		.type = DTPM_NODE_DT,
 		.parent = &rk3399_hierarchy[1] },
-	[4] = { .name = "/cpus/cpu@2",
+	[4] = { .name = "/gpu@ff9a0000",
 		.type = DTPM_NODE_DT,
 		.parent = &rk3399_hierarchy[1] },
-	[5] = { .name = "/cpus/cpu@3",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[6] = { .name = "/cpus/cpu@100",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[7] = { .name = "/cpus/cpu@101",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[8] = { .name = "/gpu@ff9a0000",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[9] = { /* sentinel */ }
+	[5] = { /* sentinel */ }
 };
 
 static struct of_device_id __initdata rockchip_dtpm_match_table[] = {
-- 
2.43.0

