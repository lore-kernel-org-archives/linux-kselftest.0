Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793293064;
	b=bTHqZprKBSDTdgOu+BzVN1OMYU0TcQENglfzFLnpjOzQKrXd+BuMQR7apLAiMEe8frAz
	 xAoW9SJ28/WAMzvDL5DxBgzlRJNsiOTevbLRS/6BiRX/ZnosoS6o618GsJ5ptz2mA4k6l
	 T82wp8BvfQnx/TaLGC1sqN8s/L9AR7OknG50zGVCUeFYiRcE2Mm42rububdpMXFWEGTB2
	 pqLkjNDN4Qk6dlKCs5bo35nMaEt3vS7uBy0Ye1N2Tx4ELUShwezSlMj6LU4Fm+6Ry9sqQ
	 OSirqUS9ZRWhaf6X1MUpXjwGFyFOOrHVATdwsO+X1EbcrkWdNdFcVPJLPH/+sq9icuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ytOjkYgyk5LlmjFcxh3gPQQdewa7HVP6wQzba4/f+go=;
	b=PxKFKtYFoOtoewPCSF2kz6ay78rEqW3REbWBBZaRBFRaTv6rNvmkD6dgv/3TNPNfzm9B
	 wGIBcAXm537OvMgFTs9FcCb5guWq/OZq1rIlHt+WJ5DWwiwDus1yNTZ3nQiPB+IRsdDKk
	 9w5Whrewwkl/ZLtWG7Y1jTdHZHvB7IfIUshc0WBTED7kd6XH/ImYDyRV3MAbXtuHPanfL
	 RLIZnDMDp5M1H7X26xgzLUc2W+axj6iC3iIzwL8a6+hkz32mDRhRJFjhviGJsXZHplZgh
	 UaY3D1gLGRuszheI4zd/I2Pe6os9NTl7ye6hCHERWLrtFLy/ADAmkJ/JmUfDUXY5UZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K5B4EY4m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UEjBhxH8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53C8606A33C
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 16:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A53C8606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K5B4EY4m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UEjBhxH8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDPZk594483
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 16:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ytOjkYgyk5L
	lmjFcxh3gPQQdewa7HVP6wQzba4/f+go=; b=K5B4EY4m88mryxZuLbPk7QKXc2F
	+bohx0GPOVwzeoz05M1vtTbY1G/RlSkU0t0d7BmUFdl2FGHmh2zw94EKW3kqyiDU
	M5Q2hQmVUQNKONVnE/q/FqJlsBAdZV2c41/yn58cj0e8XrAwdRE9xBEiJGQmlAcC
	tPP9kVwj2n9rHIP8EuVxpXWvwoe3+PQRhvUWLXI5dL2r8AvwXfC6DI3QV701Kbyf
	Ua7vj1nxum6/ahaYKeBgVjsOzDzlUuecvKAE7aZveMgc0xLOPOhAbFFCJnXLSGsQ
	W9ZG36XnnqtUdzHoyPbA/nPz9LykFPBypu0zpOFzWWKkf03ZSTXkO6WbGtg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3kjab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 16:57:43 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9902e6f65dbso331408241.3
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 09:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793293062; x=1793897862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytOjkYgyk5LlmjFcxh3gPQQdewa7HVP6wQzba4/f+go=;
        b=UEjBhxH8LEL8nsqJCQm0X5sXfub94BSpRqSJ//Cf7RVT5Yv9yLkxmGzVH7qVHZNYid
         Jw+KR3MtIX8QLq4DVu+9jF8WODum80BXsNyNT5rZ5MnqWdSIu54olOZ8mFEtLut1tLo3
         d4/MFIjq1CKQbkiM2h3145NPIyc5pngXNgGnPC009P9hIuz9VVDr+Dbk2ZGvxnD03jSe
         vOJEuVZ4BJ/9xWu+k7WDKts9RZQdCpPhfhA5yOF6YNEp84oa1wQezkzdw/1jsC/ClHrj
         N2zSRYFEMoVTdgSrE0yzzjMoDNWZxtYL2esVfz0ybCuWLelgZQtOzlIJm22bu9ds63fQ
         qE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293062; x=1793897862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ytOjkYgyk5LlmjFcxh3gPQQdewa7HVP6wQzba4/f+go=;
        b=tvJpfO6CmLIMJStgNSLEooGs62nhP3x4HEVd5au4/4WS7XxCMGxuDWI1VpMeSZ9+Zf
         Y69BHMa72F7PTMgqpGT0dGlTYVXdWqh26QJR9VK7ZwY4W4OWEDxWolbHWc4me1vQLiGI
         9V3jusVoqHAc5SNgiYb3ORWcWpGo8qFtqclxn6BoSVLNlfU1TVrq00aRxeTft6jIMDJJ
         ihMFiNn7JLwB7YmJ7XfoORzPBw3Q5H/8xq1Ja+ZQ0/wluTveiuIouxH2DL/TJOdb1JYs
         yJzjVjHFHAXXYiVxRHV5lNW/eSf45v75S8ZVA3PumvCyleN8s6XJWiZO8uotPQSyg2mi
         /rWA==
X-Forwarded-Encrypted: i=1; AKwUvBwPXvL7MmQ4gPH0CfVbx1mifd9FwbwmjnSqvUvME/ukj7uQgPvY65sjQT58FWzjIFQqoETrFKTvU5UCZBgZKmo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI18iT/k63PvBNrNo5I30AzM4+unVnvRnHjpxo96b7n25jfhiJ+
	HuxQvtHxNDj2hj/TelTKS/PIAXAWH3uHhOwntGWtul28KhkVM7y0m9uZkhTXhFPxO60ytwyhlHJ
	K99ARMdXNTgxQZ2A+xZPdKlGqu+YLi2XjVpdN02L7ZvbnhSe/+CwEvRTaUtUfICpx6xPfIwc=
X-Gm-Gg: AYBFou01HoV8yYreJNZ5niyYhxc3JU7gJtemd3XTNZH0UrJqCHkj0FEf5J/Anhy2BaM
	qsEnvE2QLu6/O5h6xefSyjFUxHir10/EVZxQJsNmyCk2QloCL6NK+oMn0BnvVOsfVGu86i6Mjhg
	9JonBke8u379sLRKCXq46cKQB6LnIYZ5m2EQJcMwLk/mSDntoQ4jDALD/B5YdoUGpjLgSygnRim
	XWyiHpZgwxWdxz9Ho42Q+N+4ikyerONTg/uzOO7zpuFdQPa4XD339gVhpbSDAtG72IWb1YpJIBQ
	XNxFJ+HnPPt8vDwrQ3ln/TXQK04dKDlNACVZjcIUqdm9evy4j5qA3+JAojnbHOQsr/sMnw6DBHy
	VEySDcJGko2A9bjfBB63RXakIPLtkL/kFqrixHXHq1l+q0dYZw2UOrmjyHGYI4xsPqxE+9t/yBP
	GJ
X-Received: by 2002:a05:6102:6a8c:b0:7cc:2c29:54ef with SMTP id ada2fe7eead31-7d03a5abb96mr2605298137.19.1793293061914;
        Thu, 29 Oct 2026 09:57:41 -0700 (PDT)
X-Received: by 2002:a05:6102:6a8c:b0:7cc:2c29:54ef with SMTP id ada2fe7eead31-7d03a5abb96mr2605280137.19.1793293061411;
        Thu, 29 Oct 2026 09:57:41 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df961dasm325669f8f.23.2026.10.29.09.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:57:39 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v4 5/6] powercap: dtpm: Rename Rockchip virtual node descriptor
Date: Thu, 29 Oct 2026 17:56:49 +0100
Message-ID: <063f0587a6c951ca57e941ebab39617a0d0a305c.1793288783.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfX1rygZFa26sMY
 8gavurCUEzmjZTFjiIDG1nnp2ThIYgggJsexvjUg4hunUoi2wAtymQI2wdxyJxUIsGnIJwfAkFr
 TmM2Ziy8mOQaMNFAsytNdRDamX6dtW8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfX91Hss4jQfEn7
 tyC5DwBwB8OOK6DAy0zQGQIdbKMiUli2EEfQC0eJ7PC5K6U1LkhJ5dDe8qbuWwLbPXn0G/0Tfa0
 3yH8u/bF7SWA1XNmrnJ3/KUtEc3I9BpBQYn1rrINMdTncru7j4WC1S+1iNWKEnxf3HLtpJXPEd2
 uy+Bq9zzac5rGv1kS0CtrK4//gBLuUakaw2BpW2StVr+TeTCxTk2mEw6bUEJomwsPfviPLldSiB
 ykocTDXCLSArJsn4pkCH3+ealwQxiSkXAhuwgb0rGN3qmGxKj6AtkblR5ud5PfFT2neLsuG70A3
 6grtlE5I335LQjxMZAiNTdoY6m3/TrDlXuKddvbMdP6r5EaW3CjHL0IJS2lwv1qYsKBSWwN0FOE
 deut9qF2Y60vf4NgczzMX1iM//9pKTkYs0CiNwqJSWZT4Taj7negHnXZYUGE6/I2ZweNpawzIIu
 rskXJf7Y1dNxjwAd7Hw==
X-Proofpoint-ORIG-GUID: KFGz6R3EnlgEXphGu94IduMJxaH0QJZ0
X-Proofpoint-GUID: KFGz6R3EnlgEXphGu94IduMJxaH0QJZ0
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae37b07 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=_NZqlvP9bvTAGtRSC3sA:9
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290066

The virtual DTPM node descriptor is named after the RK3399 even though
it does not contain any SoC-specific information.

Rename it to rockchip_virtual so it can be reused by other Rockchip SoC
hierarchies.

No functional change intended.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v4 (since v3):
- Rebase on v7.3; no code or commit-description changes.

Changes in v3 (since v2):
- Rebase on v7.3-rc7 and refresh context after patch 4 style cleanup.
- No functional changes.

 drivers/soc/rockchip/dtpm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
index 222d9098cc98..5ae00680602f 100644
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
 static struct powercap_node rk3399_nodes[] __initdata = {
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

