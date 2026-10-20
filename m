Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505867;
	b=snecczMcQYmcJNeifb1+cSTDECI7cchST1xFWGQMGFI7wIJvhONPohGstZZ+efY0G+QH
	 TTh2E6SsfqmubCv1s/SUF8V+f4xr9/z5gS16j56594wVAHBXfndMPtjleboDPko9S2iof
	 ovMuSQ1v4T5cuYs5ZpLAwi1r2kSr16DujuDXqF5KCUmqqj7JlFWR44F6Xvt6y2yFYOQNk
	 5Yb043dExMUAeV34B1pwIoYL54yoG75qptCbwrhP/s1ytXcTLY/Lwl5yHysMsNg81MAl8
	 qeH+4TAQYrAcqnQ4MnFRI65nEhETom/htN2M3suv5rm/ATjqRqsuDg/m88Fg32DB5BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uXpc2QWgMGXBiYzG6BvVA2zeICE/TGbAAGJgn9nSWvw=;
	b=iCLOPRZK3Mjhm8ZdMNUagNBDHas4uFuig9KuiTJ4tdj+R2fC0O+dhb4Vqwqp8wpGsUmK
	 5R6oYxFHB5EYizboLKOPFWs16W7Jugd9DtRneRKVqLWiyiXi8tNKadmyN1MJW3FIDBOw/
	 U75cGo9ikHgdaVmmO9proI78rMOgeJ53Rnmw+FOhN2IzffH8e7CK/l76yCGE9LO2KY+K8
	 9OcaNMhAjbHQ80DTt481nH7UZzi+XiNzop+ABXkH3hgUQAgVxctaywHIA7pUdiW8VC1Oj
	 4ujawlOfyoz/QrwU4ZwYBUH+H24PBy07Yv6wwRx5BkosNl/IJJkwaMfURkv9GQzFwhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U2eK5zmx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1I68N5Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E4360A5BE5
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5E4360A5BE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U2eK5zmx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1I68N5Y
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9rRn2845571
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uXpc2QWgMGX
	BiYzG6BvVA2zeICE/TGbAAGJgn9nSWvw=; b=U2eK5zmxQX3gkfz5ViE8MyntVu/
	GrSSZFnWeIMrCaS3S4TNkmw8V9udeZu2ZINdcXicQRI4p5I+b8jApPKP/kI1N0Wt
	gq0Fwp+6bvT1L7tz8n2cQ8/loJ7m4UBYudoWcyCK+sbYmga8N+y2DqtUdAs1cczu
	MyWN8Vq5G3I/uvesRwwR19+5LvEvXMPrdUTC3B4vyl3IC/oqkc91xmrBaxQWLAKY
	boNvwdCkAqTeHn1JDDDatQ/WFw1/n+1CNP7Q7DAMbEHuAs8MfmWMkUbd2q8k2IJ0
	570lUYY/3oV6qHnGFV9aE2kXqmC8MWyLIIol/1jDn96t16EvY1mn1bxC2og==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5natmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:17:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5ab5c136so543253285a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 07:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792505865; x=1793110665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXpc2QWgMGXBiYzG6BvVA2zeICE/TGbAAGJgn9nSWvw=;
        b=S1I68N5YttxClaGAJfaIDKSu8LpoDfbrTw2Qyc+SXqwYdgawznxCImJYAXdW/zlTRu
         LEB9urQwB2bC6gfLZets46Hf37lV+9JnzLfGJ5NLpuiyapEcjw0HrLxRWD5yoymxV0oR
         moS6OWTbFr2+2JLHhFLCstwuAgsA+5emeHoQCCXF9dhuoAeshpLsK0LypDhgQOazIncu
         jD9kSww7ZIjUcC95tWCpJ0vh7xLFWCFPgHUehEAgIgtn1J6HRPXRQCVDLbVsza2bUo6B
         kSuYgu6Mj6bOnBUylZUS+Id1iZW23SZG1qIRwPpIY52cJxYtGn2npQ2JRZQ6nc/w4LgN
         +mOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505865; x=1793110665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uXpc2QWgMGXBiYzG6BvVA2zeICE/TGbAAGJgn9nSWvw=;
        b=Xe9qfNS5EdssTKK/kNgppzVOOJu1Ike8o3fVzvQGztEq+bbQg7Wk1ljj3aUxyFJD84
         qFnG74xxLIu8qX/hIOFgS6H15nesUYX2xK/zFiPum6tIAzqB48w6FC5c6tOpy/HX/7WH
         dIC/iU0do6xp5n7gNUjjXuYSDYYRfHbsFYnsWs5hOVwU/hnA6Q1ubvyzXjj3wfd6pjxw
         5GS2ODineP/uyd/yn4hAcowQhtnZNuWbkjV4Z3hjmXltKdH/LbR/plWADOSPTpdF7qC7
         1FDoAFpvXAA+ejQdC8FH8Vfi6vtQzYkMcAOrRp1r498iDLrmMWgkVAf6RklaYyZrKb93
         8A1A==
X-Forwarded-Encrypted: i=1; AKwUvBzSZNDNjD/Fc9JCg1yeoEFX8DsnfwOymi3VyrfmiPH8+RV+dwq0R8uNNDhB8G41rZ9ofheXle6zCUTOHMVyXs8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKejTKYGRYAksI5BFReU9RDdR9/ji8R43HZtLpzq5OTYl6k1jKx
	tgBYDhpycevU6l+3XQNnu8pnjfM+KPOyjkieFMxZgXutWV5Rvev+7CGRfALSR+DJjFDCTfkMdMU
	CA+nXPcejwnE4WeUJevXJeOq9UgH3LizQ/wWPoBwulF1wTnpKWMbmYHGvWCbh8JTz2ZRs9GE=
X-Gm-Gg: AYBFou3J4ynFJBjv47mSG7guAwm8LfFRtSSngYGJlzYwRB8HpZ2ey/TOksqD0jC20im
	/35OwjAySZKPd5OBDoMgKF4NyTVAVOt4K87YrTM/iVrasBw9IgaeQla7CR8u72C0p9mpv0VUuSJ
	o37KWaPo2HkKGX2J5wcfPw52f1oL0JtAH2NawNefa7a3pCcm2AVu+NvcPFal6WpphlA/nA2qku6
	hiIX7kgz804clKySzogzPnbd1wf5g50a8zujjeDZlzXENkcueirugWJdVu9GVkIn8vvZyvtJnrQ
	TjHFlKyZIlaSLqwZ7vWQd2WOP+r8408bds82wYAx6cUT0XgzWfvrkwCUPzfLXHKgUda4nEQgpe9
	kjMRaVQXdABKXIn6CuWUxFLMIlAo=
X-Received: by 2002:a05:620a:8812:b0:939:6dfa:48fd with SMTP id af79cd13be357-93f29d8358bmr1660654085a.51.1792505864768;
        Tue, 20 Oct 2026 07:17:44 -0700 (PDT)
X-Received: by 2002:a05:620a:8812:b0:939:6dfa:48fd with SMTP id af79cd13be357-93f29d8358bmr1660644185a.51.1792505864113;
        Tue, 20 Oct 2026 07:17:44 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:4884:6e9a:d9ff:9fa6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d810043sm6642276f8f.16.2026.10.20.07.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:17:43 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v3 5/6] powercap: dtpm: Rename Rockchip virtual node descriptor
Date: Tue, 20 Oct 2026 16:16:55 +0200
Message-ID: <5ff8e721e9b2191439dc8f5342fec6f4c07b4fe8.1792504834.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: PwfcU9fk7ILYUEvhCEArKu3TX7oux1Pn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfXwLRlTkJWSAKV
 PY1jeVfpOgdgeNU3tp681atgVha9Z5kXGciSQysuKI9sGv0ks+jAECi5wsAB44m7M//MUVUXpYH
 b7hrXdlDB1ZM/W2YR4Ycww5PbbjQePUKmECjT3bjyBf2Kt8Km9cIyqe16e7IcHkjnEJuNlHMVlp
 s6RruKr+94T/FKNK6cO+LKakXt2EPqIXgGy+4XkDhoxBtkaTXGQMxF1zUy9oJcBcVEoyHO0AsLm
 CWkcxbQCRkFWUYV8eDpn/BEuKhkngWreDjAney99qZIqHd+iyaKFwceMD0Z/cdduL0hHvh0O9uW
 Sqo2xj/B2CoDbDaRiYOHYGIneZR6aj9hN17h9lhwdNGbXL/TAux9wHjSog1oOqPVIHBT+AasTmD
 xmSenzqcMhMuA+sdLI9OA5rEXoKoQsBihrshK3aMtzqrHoQJ3e92AXuEFyRf2MCsrpWPs9twFpK
 73syHTsoLyJB2W9aUiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfX5QVgUTIYTao4
 L+TnRbV8ES3pOxQRtVT2Jn5wuVyRjZpeYUlmn7KhGPRoZKynuH1GEYeK8IAmLXD9KQg1UxK5ghZ
 RuuUlNYcQxfvn2t8aNvUNYyzNgSSKNU=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad77809 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=_NZqlvP9bvTAGtRSC3sA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: PwfcU9fk7ILYUEvhCEArKu3TX7oux1Pn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200056

The virtual DTPM node descriptor is named after the RK3399 even though
it does not contain any SoC-specific information.

Rename it to rockchip_virtual so it can be reused by other Rockchip SoC
hierarchies.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v3 (since v2):
- Rebase on v7.3-rc7 and refresh context after patch 4 style cleanup.
- Add Assisted-by attribution; no functional changes.

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

