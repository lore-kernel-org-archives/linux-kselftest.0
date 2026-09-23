Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7E13A255A
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174074; cv=none; b=ZH/g7d8jP/y3GkrvylxZIbm7BPT/Gy7xhDOg1kop0iBky6EcaIiF4rY0vCT1BdxmhAu0GhINspdxFF/VqRuvmo1Kv9DReNpPmgfeM5w+yYZbX7NT83kc0A1NILBM40jmLpeNdFm2XE9HXDJtQO1UQNJ7s6BdJQUOcjAS51BOHMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174074; c=relaxed/simple;
	bh=Qrnv8qH2T52Rds3B+tQNiGt/EbIPH7XsOJpXNsPQrZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZcLgaijS9rOBJmj1ky82eurIhQdazEl4WQfVlMmmZjcKVZVPEPqqfTnZ8yDe+GjOfh1fk2vio3IxOBdf4HzvqghAGuFFSp8mxH1BJkYQmOuusAlLkIy6ISBycMxRFrntwRTdxL2HSQZ8CgVwKXk2MpjdLCKvk1/cJQXrwEFDDHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikQ1ZZ2B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZxgGuyp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikQ1ZZ2B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZxgGuyp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbSBQ3295494
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zIe6pwh84/c
	gjHJc/ZPARHNyhcZMHDOU3m6rWSmarLw=; b=ikQ1ZZ2BFuINY/2LgptjZuBxSZ9
	maJ8cvWkja4BeenhvIDsjh8wgPedC7Xw2N5feeqFdBY23San0Dj7Y2BwvSOLGmH9
	AkvnYGBtSNqe/5XclDKw2z7kJXLeCkNyjuns8IXQzJouYNEsyhSdaH2x1RRmkXAw
	TO4V19U0GGeAO+/0GoHDKMa8MfiPkGXJjUYn3mxBRGthvc66EBYTux0B5m4Z+SKR
	uBedOgiyg7oAgvPe/kxRqBSZ+TCrr2AgyOJzlOUL7Bp7BXAtr4/ywiO1L3fsYfuN
	kRAHhF9ZbaVhiO2f6nohIyjr9l+x6u0ijOwB/7+8orJL3QELqqCv805Cqqw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm9ayf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:34:32 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97ca6578487so817078241.3
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 07:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790174072; x=1790778872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIe6pwh84/cgjHJc/ZPARHNyhcZMHDOU3m6rWSmarLw=;
        b=RZxgGuyp30paNOCtp4x4aOLjOn8hkrKIJ3+DvmAcQ4KbkG6qWxW4UrWUz0AvkRFxRC
         Ufp03T/CJ7cMj57wYeceeGpy+wk/9DdrudoDIqz9wYTIlBeIizid8cPN+jzC/6+8sAuA
         8q8Rcxcx8xUeR7CXgmz11UMN2OJNioHfpo49csQ/QX1pCcuTiUQIO55fbcFZhlQ4IZq6
         ul1RTQVXTJcA/9vaRbD9X9SvVX7i75JGRKMMgDW3SKnPlRIwg6XoLJXSGiexlgi60XSW
         jNPbP3XU72ZvDIjzAfIHVeESu2Z3GltJUdn2HG9fCEksibcB+n1FP64QbWHpc6yVF1/z
         W5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174072; x=1790778872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIe6pwh84/cgjHJc/ZPARHNyhcZMHDOU3m6rWSmarLw=;
        b=r1VpBCyhCuu+weWFEaabTbnqdMUfDYOrowj8p3cVVWz5LU248VdkGZWPOvS1u2dM3U
         aoBo3xs+WzQzMeim6OHi7uduSU0WIvO31kUclvKGBt7yKZKG2U0KhprLfZN+42lgpABV
         Gv0MxW9xhBKuoy24KzrHKmg9Am+KkKNxVkhnxdb+DCjHcZAnIHLlEZzgFsDfcLs27PDx
         Z9uJK6hAeNnoTwVcQaQQBVvPbC4g1E/yPHqMgb8lcVcHqU//VnAWRxiHZYFUhtkSrdaD
         NabDaIXZPGTZcdsNNQGd8ejiqKA/K4xorvXUsu17JWHFteFSW0OAntAnk5YgWoAQcsfn
         EC/A==
X-Forwarded-Encrypted: i=1; AKwUvByv4EBr/eiJ7fgVZQ8WRFYLelO5d5BXUpZmQyAGDTZ7oezgxqZeTEm7eiuP4osDThrFJetEJXaHcTUa4aFfxhA=@vger.kernel.org
X-Gm-Message-State: AFuF++k+kTP0ZsHooXyLu5RnP2woLDitbuxs/Ykl0zViyEnWarymRSZy
	ZWIKVtAZNlm5SBo0wKy4NsTUzqBE01jMm7EGm8Cn39T6qUO9TaObO5gKRXuTlswVo0IoHMjmNMK
	x7s2jaqNxnICoKTDUc5q/1mfoTQc/vLZuewPFDSu/1JUSVxB6DmuxPxCSWaVgPsVwC7crxRg=
X-Gm-Gg: AYBFou2B7voSMSzmmVZVnEBnazNorro9XDFjdZvHF3leiKlfz3S4paExEo/dz8SvRDy
	Jkl8CwnyOU0obheMl+kmfpMJ/9yh6KRqrAtMf1HR1q0czJ2YftwsK34nWxDT95ZzlOaPWf5bswt
	TQUU8RUws0p8z3MKAnWianT0c310QM9MXwzBozW5JIHs31qMSDivAlPGnkLUchaxeTexVKmgNEV
	taMgeO/gCWz4Pp7WKWsPA5QoU5xT52Vw+tEtm5u3a+bMjDknZpY7RD5HO6rHQCfx8sNiUxRTC9C
	ndiGAQtIgehxjCO4ExX9ZGIUPuQP69VcZWh3LPIz5N8Fzd04V+fsD2WuVMBUSXt4T5SczMKqysL
	ulWnUyx1em72RGCUGeseGXUTz7t4=
X-Received: by 2002:a05:6102:9d6:b0:7a7:1b62:2d3 with SMTP id ada2fe7eead31-7ac1d705bd0mr2441614137.37.1790174071837;
        Wed, 23 Sep 2026 07:34:31 -0700 (PDT)
X-Received: by 2002:a05:6102:9d6:b0:7a7:1b62:2d3 with SMTP id ada2fe7eead31-7ac1d705bd0mr2441596137.37.1790174071365;
        Wed, 23 Sep 2026 07:34:31 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:a913:ba43:96d7:743c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf158147sm58213905e9.0.2026.09.23.07.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:34:30 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: linux-pm@vger.kernel.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
Subject: [PATCH v2 5/6] powercap: dtpm: Rename Rockchip virtual node descriptor
Date: Wed, 23 Sep 2026 16:34:15 +0200
Message-ID: <20260923143416.3713485-6-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfX20qMc5OIDvml
 eJvoKGS4WymuG6Mr4ed1dg2GFBh32Vz22Cw6FRXyqHLdRASxY7Dh6HxjoAXDM2t6n/n0H+nvbnu
 MhlwyqkdqUroSEs2KM69kCCIDctPC7M=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3e378 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=_NZqlvP9bvTAGtRSC3sA:9
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: lSn4W314_xac5lICNDvgxtMo6X993KXb
X-Proofpoint-ORIG-GUID: lSn4W314_xac5lICNDvgxtMo6X993KXb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfXx6qi21ofmDOb
 XpHyNnDA9uiK6bED3Yby44uUkqTdXjiunphWKrySPIm3MPjA35o6pnQ+5+uoOlUbxafD6SKnW28
 A3iElW8zmPyj9QmTuF8c1DPJfopOg/pcUv9YFgs77/PgTzVN6kaS2OxDxQf0ONBgsr/pOK6xtTU
 44Hy7bcs+f0YaybCCs8MbRGzuJO85LR7W66rXTXjaq8yLh27ONSgLbmc6JFb08osY7MhoXFGM2B
 +qNy1QRx2AB+/JSVHR0I6GYML55bRX288pLHHTEVrgvRsQqaNioqzJNlcDAAVzxEC81rTb1/5QL
 VFIvoWjwshtJ+i++7gwGKThoDJJcaJMDGGnI4+kBsWsgEfDkPixRFJkim4HPNtcvD4yllgn01mI
 XQ3/63r0pgoA1rN9BxEqGsZcMEolFnP4+agrVNtNGMhBb9dmsEgFcbxlm6Ki3oEJwpZN/Vw7RUt
 G+joBwXmbkcSTC+selA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230058

The virtual DTPM node descriptor is named after the RK3399 even though
it does not contain any SoC-specific information.

Rename it to rockchip_virtual so it can be reused by other Rockchip SoC
hierarchies.

No functional change intended.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/soc/rockchip/dtpm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
index 451417ae5715..5f7f238a15fe 100644
--- a/drivers/soc/rockchip/dtpm.c
+++ b/drivers/soc/rockchip/dtpm.c
@@ -11,7 +11,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
-static struct dtpm_node rk3399_virtual = {
+static struct dtpm_node rockchip_virtual = {
 	.type = DTPM_NODE_VIRTUAL,
 };
 
@@ -33,12 +33,12 @@ static struct dtpm_node rk3399_gpu = {
 static struct powercap_node __initdata rk3399_nodes[] = {
 	[0] = {
 		.name = "rk3399",
-		.data = &rk3399_virtual,
+		.data = &rockchip_virtual,
 	},
 	[1] = {
 		.name = "package",
 		.parent = &rk3399_nodes[0],
-		.data = &rk3399_virtual,
+		.data = &rockchip_virtual,
 	},
 	[2] = {
 		.name = "cpu0-cpufreq",
-- 
2.43.0

