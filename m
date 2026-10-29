Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793293060;
	b=Jq3WCxdIAADRb+uaLvHYCHfj7g5yAe+yuBB55e5PK5tqi7r5j3roSWE+1SOIwrJ8rR/W
	 SrPSoB7JSKvsKbePGbY9bWZPe3yPMTLlaGVT8Iuf1n+W9iDX0okg77DSJ+q+wp46aJWPP
	 /IZYqTtJsVOJarEN1fPKzUOJMkLfNqFvCm7O0yxAealuIbHuc1mZeShSPA8KqEZ3vGqZP
	 LXs2CkpJVJClZIb7Zwwt/NhjpQeoF8zgeUSpylOGQsF+KoNm+SwYBLxjdJ04UotS/5k28
	 qKERpVIc2bUpQAJ25t3D700FgFMYz2F0jfz+Zd1LaTc658nND1V7QcjJNUVcGpYp8cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293060;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+xV1RGjg5KU41r+LCzwCOMC6Im+qEpwWkzwUNymeeJg=;
	b=L9nG1cgHSRrfeqkRpRT9GlPRN7A7JfAVfNqOmMsxQf7PIZs5AB/QkMYon1B1Ejzt+vY9
	 QWh2Zgb1J4759Q/CLxj34S/UJGC37ZnrWs4SePeGBpa6rgFKuoPgJXNv+hh0bbUkmgbuP
	 TujUnueXrBDi70BOJdCUK56aC5ywAmDLmfMoPo3kLXZZfX5ZFHK7n2XxJY4ihuEIrdt/U
	 oZvjchGarVMPxrd5vWGPkiiDOfSqOWisbqqlTb19TeJ1Hv5n4LeU6u4dvSrok+NedvqMZ
	 BY+GKUiCLCSd/O8gll4V37MSFJu3w+rfasJX4d90NRDLhzynT9jZwpvHB/CzU7xuboQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmlqFbrV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XLFA90Dt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98656606A322
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 16:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98656606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmlqFbrV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XLFA90Dt
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGCxQF3872932
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 16:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+xV1RGjg5KU
	41r+LCzwCOMC6Im+qEpwWkzwUNymeeJg=; b=mmlqFbrVGnojNptRIp2Y0FfR73/
	wVV/o5gTl0sCSMYCHjuF3Dx6l0i5+dOf8jR6p65QP1QMFMPWqGx0EMXVgd6dbauH
	gdakoBqo/m9dYUGh5xACXlDUC4wCrqj39o2uJq7laJlMZUyh7kOcGa0InIpCK165
	6WlNbRcScA8H2Sjc/YpxU4HfKK8QEXNqvo77ljPo43uBpqhXz5cAhR9QkF4qQxMX
	5svf28nfmCH6fqPn7+p8M49RKPZmG7OQ7HilRO3lwccPNt/JQ28mwIbGboEUWZDF
	xEd7ajB1dSy8HHKOBP6FSUd4j8X9GrXE2IGybfIwRnCbmvDY8UBT9I6lL5g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm7620ywc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 16:57:37 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso549181241.2
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 09:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793293057; x=1793897857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xV1RGjg5KU41r+LCzwCOMC6Im+qEpwWkzwUNymeeJg=;
        b=XLFA90DtsV8ao0O1g1TGR8ZaeW+WCt5ubT7HTmtPEAqL8PY9W3Lco3ryBst5C8B8Ub
         A7iGnNGPdCESMKfg5SYe5LKaEzRGz1TzQEVQgUDYlw0DsxKwOrGsjF+JrOgSoNewKwmF
         WbmpwdaR7eIRHiGsRTYuQL5nomcxJ+YE+aE7GMZ+VMmoWZ7x1TtIksALO26lvzEPU96A
         YAndJ3IntHxwNhehGYsOTPR+jFoHJL21mKWqnLuiXbBRh5NQ0XnodZxPe2UhVG4I34/E
         c7afvCcaMiU3SbO02J6zc61gNut9JlrOsSCvctp8eZYlMPijwJ2sRC0wjDPEeNm5mUBn
         xepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293057; x=1793897857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+xV1RGjg5KU41r+LCzwCOMC6Im+qEpwWkzwUNymeeJg=;
        b=SczmQWo9jHBhAAbxkOwJi7BYEiz3eZv5attb1Acq3W+HOUTUztXDd1h2r+HhVwTA9e
         nzsXuz6SdcYySekGUlilPlAiT5xOw6Mp4CAc1vbeql7bHy7mXsM6f9lG6sxw+iKQtaQD
         ixpu8+T4Bf+sRajXcIU5X0zOaXhcy4NhoCYe0lYFklY36DQ8fIz1L8R+l7irwoY+Rk6D
         Zuwtjpalw9vNDzSB7FmoQPXEbg9ftYDGut8UHVPjBgNOkPUOpZckXjYejDMJTOi8/omk
         zluEslz3G2WLsuxBTWhdfbVGVtvVIlwfx4okIiWEHbUdC0TFrSw7lxZgIvBRcBtUpJBC
         zVMg==
X-Forwarded-Encrypted: i=1; AKwUvByh/ffZfvKPWxAcJuKf4C66q39zJEuzm0hnX2HPK74kuCan+0EPSx5Lrrj1JXBPokIIxTGpGM+ZNWBoR6Pw1/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvtl62ljYqnX89kVpuZ9xJqKrXqxRSTWEhp/KPwzbIE/922VCF
	KiSE7kmZixcNm/WB5VLY9FfqMsq50lFOXPDPxZxS9EzvhzCOgeJDbVsLcRHr8i1m68Y/xvh8yVA
	2L0I19FeJgEqCUhAhf4/zkLZNFlF94I2sMkP0uyBrcZa2X99QJ3+cHto/ooYEma83BfLf6Q0=
X-Gm-Gg: AYBFou2vaEMMbRP91e98O4VMwfGQsDjUBoIWqJO4MsbbM0KPZ8Ge8wHeB+pCyeRqOkT
	q5FRNM0ODYPz0r/iNya5dujv5v88dMSWdSNnW9oFJkW6ccTgyzQ8OWkhflxvm2rBzFAPEG195y/
	/hDsyZMPAwAbAAympkwIgsCJya/OqEfhMYdt0ypXxHbHkkfSTsYK+tLUUdXZTMysvfa8Ja4NoFR
	88o8dcXKvR/2UgKh58lbqKmTy3S/8n1dpKPpRxaw8C7bEtfL5r8vzbb8fdxuF2Z9oBNU8g/KQ3J
	Tgcxe1RGOEVPl2KXT0SIFEKJIrkbKZ9pRawy6haHMVwND517Cau59KUWWk0iRz5aZKJccgIZOM6
	/wUCB+2vT337qPJkXztphGQTQuXamJC9lt0TdkaValztQ8DHQfZQMFmyeUz3pR56pYt/urpsSEc
	nt
X-Received: by 2002:a05:6102:1483:b0:7cc:9d82:61e2 with SMTP id ada2fe7eead31-7d03a4bec64mr3117842137.13.1793293056950;
        Thu, 29 Oct 2026 09:57:36 -0700 (PDT)
X-Received: by 2002:a05:6102:1483:b0:7cc:9d82:61e2 with SMTP id ada2fe7eead31-7d03a4bec64mr3117824137.13.1793293056511;
        Thu, 29 Oct 2026 09:57:36 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df961dasm325669f8f.23.2026.10.29.09.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:57:35 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v4 3/6] powercap: dtpm: Remove duplicate RK3399 CPU hierarchy nodes
Date: Thu, 29 Oct 2026 17:56:47 +0100
Message-ID: <141ad25a137cb50516bd92f9a13dda7ec940f6da.1793288783.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 2ot2m-SKU7G2jCw9A6chJ2Vw0BLsfG-N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfXzX1+2KokyV4F
 XbZKWPZYwmSVhzMXgT+XRXB0ISqsYSoSvHZCa4lqZ9uriGscbq3SHs94SqEl0qGk1tDmww0NJkr
 mkhffe9dvBBFK/8PtA8WE+X+/mLuYD9WAeb9inlx3Syjl6N/eiy5Yi9k79gsVUJ1bbRAo87w71P
 Ovp/aIYZLN3RnMKcnpC6af1R2VBAC9vDNhMNtnte4HU71I/fZcFe8uv+Htg7f4AKdhLATBKm7sm
 k4gBvitz0wK1BWvV4w6h+Yru/Y7r60hwUa1qvizqY3UTGBCNMHdoNaWNR2cdW7eETrHpjDV33kk
 /eV7fkpMZQuhJiNZyab8bkPlsbSonNCMfiYHZKr2jzVveoTN9I/xwkDLcbpLix5WpQnc2KIEb75
 JXVB4XMOXtsh3KrkkhmhYEyhbtP4h/T+QavyU3jLdOUacBlxKYQzgikr6LNfeLPQu7StEEwZtFE
 UcoMVRWThSjn8RdCWqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfXxG0qzhRRufnP
 +dpyfR3MSf21ekmDm97ta/5PCPK+TYVTrxbxQqXclmYW61duKtSezWXRMXdLkO1Y8YU9Rg6HG1x
 ONfbNChyBlRGWtS5Ng3qGYnbggki1iY=
X-Authority-Analysis: v=2.4 cv=Kv3YSmWN c=1 sm=1 tr=0 ts=6ae37b02 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=EpzjDTW3ywHV2UopgxgA:9
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 2ot2m-SKU7G2jCw9A6chJ2Vw0BLsfG-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290066

The DTPM CPU backend registers one powercap zone per cpufreq policy,
not per CPU. On RK3399, CPUs sharing the same cpufreq policy therefore
map to the same DTPM zone.

Remove the redundant CPU nodes from the RK3399 hierarchy and keep only
one CPU node per cpufreq policy. The backend already suppresses duplicate
registration through its per-CPU state, so the removed entries are
redundant descriptions of the same zones. Keep both CPU policy domains
and the GPU in the hierarchy, preparing for one created zone per generic
hierarchy node.

Also fix indentation in the Rockchip device match table.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v4 (since v3):
- Rebase on v7.3; no code or commit-description changes.

Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Fix Rockchip match-table indentation here rather than in patch 1.
- Clarify that the existing backend suppresses duplicate registration.

 drivers/soc/rockchip/dtpm.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
index b36d4f752c30..e71f315fbb6b 100644
--- a/drivers/soc/rockchip/dtpm.c
+++ b/drivers/soc/rockchip/dtpm.c
@@ -20,30 +20,18 @@ static struct dtpm_node __initdata rk3399_hierarchy[] = {
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
-        { .compatible = "rockchip,rk3399", .data = rk3399_hierarchy },
-        {},
+	{ .compatible = "rockchip,rk3399", .data = rk3399_hierarchy },
+	{},
 };
 
 static int __init rockchip_dtpm_init(void)
-- 
2.43.0

