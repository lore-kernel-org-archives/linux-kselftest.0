Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F6E533582
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174076; cv=none; b=EqdHbWAV3EEjbp7ywNXNVql9gAXmgwr8z32LQg5LD6xdjyfvsXHBX4dErbiwWM+RjIWSTvtO1JYCtkpNOwpTpO65Uaw3QmQcjbL9eYKulJC6ktdAmEpb+ZRaCUuf/sXu25Ik/iGDjdtkZ7LZ8M4csCKt7cfW4PIb+51P9RExKUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174076; c=relaxed/simple;
	bh=CY567MCLIdasyZt9otNfmyFtYDpAdo+YL1MezVk7ykE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TGZXAeeMEg8qpDD/+J5C4aZ0sxhFLcoucJ6ujTtkg4WDpKHz4JsfJtTcMsAMbyVSGgJ/e/PtKdP4bctnCQodZZtkYC+isJnQrz6MQhEGqQOpiTWZbb+lkrsj5YCKX7HzpmrpT/0Fzam+COzv79mlK2N2H35Cfh6IPCSPsOlHdoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eaZ/ScfY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yb7L8M90; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eaZ/ScfY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yb7L8M90"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDM6X53842962
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v7zL2wJAHhF
	GLcCrZcZjlmgVvoWga7A2Naov48OSiWI=; b=eaZ/ScfYfliAaZXpspu/BuDpUtt
	meFY5L6U5Ut9G7fwr4gBButR3qELHJMKP8ZrMCU24Kf59sKX0Cc5r+Yqu9upMUX9
	9gpGhIKYgG/4MtEsFeC2QxBpkLySuFbi6elcEgGkNuxCkn+dy0MNZFcvq1r2OwXi
	Mx2xivPZZhPtbO3SWpY9bodh5vE+5dw89wP9v8RPFnreMkuLkf2q7SHq1KuCOStE
	RAmZpXbIXeu02meqDdDQHiUXU2A5+AL0sh6FKaKlnzDcSi0Znt3OO4IIOPzqGIxs
	W2nkiDt33ghx8jp0iVs+M3jA+3neD6/TcdHEf4K4HqEY5p9TSy91Ohe9fYQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbgaab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:34:34 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78580a6b2fbso390170137.3
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 07:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790174073; x=1790778873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7zL2wJAHhFGLcCrZcZjlmgVvoWga7A2Naov48OSiWI=;
        b=Yb7L8M90mk5Kr0RpRG71SirqwHG+LbdFoYDkpgQUXcRIxlcrXLpFz3OjKD5XU4D8Pd
         gedFG4ssjhiiLyJZu7iTTAPyprrOg1KZR7CcL1iSshJ5U4PZ9ajWzpu91O2L7GMD5I7+
         uRLLO4VTmm+6xqpS3xkd24EB3p3z8sFRQ4RTJsbhUA4ShK6itHCHIRwpuJv6e6Nf5WNI
         k17mAq6NmMMnylRjbOJ5MTz2Ni6aY8X9wWQPQqroECWsmxgQCA+6c5nK1bPvMrJpqJ0j
         wjFGwb/Cxvkiy2bJdi15c3biV8CdwKomEtSYd20TcMfEMRCIexRj4v0IgtTLrQZ6tzkl
         P57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174073; x=1790778873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7zL2wJAHhFGLcCrZcZjlmgVvoWga7A2Naov48OSiWI=;
        b=vAvdP+0ml1gNm8apKFXV5Q7i1xf6orzL7ezcmrxyk/N18fkHDrLVSt854aQGJMiN/w
         wVb2XxualeDG7qR2EioyVlNoJhcGUl5uqf1yQxXZmHrhC2vhGZRjYjzXvokV99v3UY7G
         QhsVUg+EQxkvZmt4voRSVVmnJSc/NQECbZYUARNT6oP13fdbDuLLmpm58T9Y6MJDpum0
         6JRYZ1SNYRzLSjhTKPzFpDOvllh0PUfpCWnGYL3hP0Uhgx1sA8rsBxYOu5l0vx+BXt6Q
         G/735iHa5iKKW5KaqYSr4oiawYxJYX7sKwAQE0GSjuDD6s4PYkJTDICnd6OBtqg54C64
         0hqg==
X-Forwarded-Encrypted: i=1; AKwUvBxhnLzjN2ibk5GGS7rmFyUjlp9IceoGpRyMV6bWCtIVQidi3F4W/GrDY+IixzrwAM+K1qNUvaKCxviLM4XfrgY=@vger.kernel.org
X-Gm-Message-State: AFuF++nt/2Q9yOYTi95+2dExxyz2MsAgpUT/ul4IlKkv/W+rUaEK8aTb
	Cpw76fcSeb3HBmJG8Hb+W9NrOx/yV2CL3gwB0OWWHjxzUxRi5l1Jy2/J6F/CWiHf997Sx397Q9c
	1ta8xV/VvOV8WjgWD79GiDOAPvZXeQuagsIA39oP+Cfv+uN5C7Gcu5dpV1jpVQXttnGq2MeQh0w
	hz8sE=
X-Gm-Gg: AYBFou2bjjk2G1xHkrLRYDefibEs2fNUdmCX947zqGPV/AwugXoWO/nNBt4XHGtOfFF
	44LSBIHtB5v/77wQ8RBoKYTPBg3rBWxQyz8+VMsBhcUYYGcnRsMEnaOF6BizLTMMoQcR2ZpYRmQ
	6iso4lsGuvOLWS+CO9crKowj26XSf4E6W2JuuR+eyd3wgs2A6XV8nI4JN3ODo+HCzqP8ECJ+1q7
	w4b2lk0RrEtj7Mz7+fa92Nx/34XTTW5aOZLz5p3IADsQsPJMp60O7vLB0be3xEO8NwE2IdR/5q7
	wSTQw5mhLzz8H/kwojv2v7RykJAaTZsQ5UntFEqkcU4pbnZ70V6vuDYbxhV4nkksa/TjiWO8o54
	wLui5KecZYZNp3yyTZeMxN1zSYaw=
X-Received: by 2002:a05:6102:32cd:b0:790:c7bb:43fd with SMTP id ada2fe7eead31-7ac1aad3498mr2384662137.8.1790174073292;
        Wed, 23 Sep 2026 07:34:33 -0700 (PDT)
X-Received: by 2002:a05:6102:32cd:b0:790:c7bb:43fd with SMTP id ada2fe7eead31-7ac1aad3498mr2384639137.8.1790174072762;
        Wed, 23 Sep 2026 07:34:32 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:a913:ba43:96d7:743c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf158147sm58213905e9.0.2026.09.23.07.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:34:31 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: linux-pm@vger.kernel.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
Subject: [PATCH v2 6/6] powercap: dtpm: Add RK3588 hierarchy
Date: Wed, 23 Sep 2026 16:34:16 +0200
Message-ID: <20260923143416.3713485-7-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfXwca6qHhp5rCB
 krisBv+/5NFdU/zmtyhW6UseHj651vJCZ1k80mNNVc0kB2i5gEx9ad7stl6TMg/WuhMcFUAJdBi
 Y69wlFaryMbf/DhiDEDN/DHiI9+JkDI=
X-Proofpoint-GUID: HGO95IUxVFPc_eTmFgvkf9e_5rpEQlMM
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab3e37a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=8Fys3Dm6xgAeGQ2jRPYA:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfX6G74iQxXup3t
 vEKHDnZqHttdJDIl+bgO01yk98OmHB5wJv4vHYja0GJfuTtEIgLlAfkGL7ZhjS9X6dmIRmpwn0g
 meGP9yC0ydv4N2/S2TQGDd0HBcm/mLz3EmdavDPFoEvdRFmjLMiN8Kh/gwlV3tbwTuQo/jdi1QX
 pSyQQ1l0kFXVMIh2HYG5WG8p1O6pU5dffGXDHFIvgdesepFUofn3l2FEhKBiGR/8XLJsohe12ev
 we2VETKx5Hnad5DsWlDG+IFpaU0vBxInr+1/y+peACH7NKd1+Vn/o1KOY8hhAbmeVR18oqR+hFs
 54ZaeTyYa5tbZQ6K5w8AFGzuip5BeOCUeXM4gBvoNnrFDHxsDJnlWSj0e+9dM7Cw//frMsBR1QV
 H1ppsjIKjIIgpUQLt3HSrcIpyt1Ew/gAAMuJ4p8/PAKaHIw87FlIdLwUQfykvbn6JqTt9zFmIZZ
 T8kMtlxrKLh1i97aVQg==
X-Proofpoint-ORIG-GUID: HGO95IUxVFPc_eTmFgvkf9e_5rpEQlMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230058

The RK3588 has three CPU frequency domains, with CPUs grouped into
three cpufreq policies.

Add a DTPM hierarchy for the RK3588 with one CPU node per cpufreq
policy, represented by cpu@0, cpu@400 and cpu@600. Group the three CPU
domains under a virtual package node attached to the RK3588 root node.

Add the RK3588 compatible to the Rockchip DTPM match table to select
the new hierarchy.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/soc/rockchip/dtpm.c | 48 +++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
index 5f7f238a15fe..3d9367d05803 100644
--- a/drivers/soc/rockchip/dtpm.c
+++ b/drivers/soc/rockchip/dtpm.c
@@ -62,8 +62,56 @@ static struct powercap_hierarchy __initdata rk3399_hierarchy = {
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
+static struct powercap_node __initdata rk3588_nodes[] = {
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
+static struct powercap_hierarchy __initdata rk3588_hierarchy = {
+	.nodes = rk3588_nodes,
+	.nr_nodes = ARRAY_SIZE(rk3588_nodes),
+};
+
 static struct of_device_id __initdata rockchip_dtpm_match_table[] = {
         { .compatible = "rockchip,rk3399", .data = &rk3399_hierarchy },
+        { .compatible = "rockchip,rk3588", .data = &rk3588_hierarchy },
         {},
 };
 
-- 
2.43.0

