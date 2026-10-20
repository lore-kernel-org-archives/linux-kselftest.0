Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505863;
	b=423Yn9czhF6HdfKtbv7MOjyWsKeASluo8RutWP8bvSW+1mNnEL1DWpnSXIdueMBXyU0Y
	 AWRh43tvhTwnyHFze3JVt0PntdMard41Diwdvx9X36vjemSeWZOG3N4hg0EB8UEjdKNfe
	 TEdDOpVTPNvdYhyrm+tXolv2LXunBfovp5UTHHCG2AZVdFplKrrjYyFi6Tydle9D77Ui2
	 YrIwaqmQaPRCFGfIYKH8YYjdb/nDv4c5ExpFEIm77AWw8SyhzALZQFYR+XRz8ZyWNaAUg
	 DF8AoCS7wIY9CI1LDzFtvh2zuVjIn4HmjmuyEAdmTJBrK8S7nEwNQ/sxFs1KfuUN5IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8J4j0djyVVFC/C1z8k5Rma/HbptDjpjZS/vt1pUoijY=;
	b=2IJhhKdWjSWBaEy/jBomtH2dH+jHLFxwVYY+sAplI9kQDVspvIsEjQDh9aFH8fpeHLQY
	 8DJJWquDSFtIkNUkDjRk6aenszw9HnfTOIwnNweEGj8g4J2kX/bnT+5MMnyek9R0d/4DZ
	 fZVh8BvjNLXqNWBG7fJ1IeOouDmOdR/Cg3T8+1goEolq48QyGJGbbUmxCnOGTdznjHVVy
	 oBUnokZvUIVZWS+c7dmWa+m0pd3htKC/hFFHOreQmBv2bqUnRBQj/JY3UedZB63O7LfdX
	 iWn9YEyeuggu/a4XU40KXPaPdXIvXgwEjjRcFH8qsvjF3pC+WZrlQ+F432jZUciGV3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O1u6Asj4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Otjz7Zmt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905C660A5BC7
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 905C660A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O1u6Asj4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Otjz7Zmt
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9rRk2845571
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8J4j0djyVVF
	C/C1z8k5Rma/HbptDjpjZS/vt1pUoijY=; b=O1u6Asj471qzv8lGc4di8WmrEup
	+DJtLvvwD5gLoCj0Kfqmwnbvj3SUqfuDtfGq5rWZaSa66O9VGQ8X4SmJHkSiJYcd
	2Tq9bPtyIAW/W6XskJSCNhA1aEivFnqcx3B1Aji9aLbEtoMOyeoz1J2YoZsKxlOL
	F1Zb+KQAlT3+xZT5TPU/oXEi09LqG8zy/klXnsdRHnRI2bsS9ywkeZn7fzIMfloQ
	P1K/NN71OHE5VlZE5//45yBAQcPTWFLp8zqo8sUUB3P+EzH5DMwgyN4d679N0pus
	LJhb/IiXkgx9RGeS7LIbvn+NYcRWjO0cHZhPb8PudVNbMUopp8DLb4sGcbw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5natmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:17:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so854194685a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 07:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792505861; x=1793110661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8J4j0djyVVFC/C1z8k5Rma/HbptDjpjZS/vt1pUoijY=;
        b=Otjz7ZmtW/ncop9r2eRGMHnmCkLJEvlWSwiozhxk8iY7ztV+6ZMYx7nnotCur1OWxX
         PY0q8wLC+Wv+G3CtDFVWwmgXdHpcIrqpsxP+a+Ke0CpaPVAXpAF8sNW2pOhF4vjRh6VA
         0mQX1qi37Wf15PY78PKEY2Y/kmSwcJr1Ubz+XeKMzakr0TY4w7pofw/lNtQMvGRypGCR
         8ugN9oaOOGvUZRp4EWiz/zXmPr1noAsa4+uWyrLjjmOapQlp0w4lRBq1QV94EociZuiX
         Ho/dQtwdcM5UuGxEU4SwImipZP4BhKUh28mFNG/jYBvjkMOOVe4Lg3k/mWb4c0eGfPlw
         8G9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505861; x=1793110661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8J4j0djyVVFC/C1z8k5Rma/HbptDjpjZS/vt1pUoijY=;
        b=Mex9LyV5lePVRGaS5Yqyy8jnWmzcDmTM3YRJDuAZ9Q11YlEno08OKJcPe8UeUvNWWe
         V47Q8ncfv9LfkljV6dbXJXOq+EZ4NiHPiZBf0OUxJCaM8k8RdrCOPrOXoz97w99eg4mh
         X8UIqknlBzAqm0JzmW3CYgx9C/4tH94lNgGXhLomnDNiWgYFgkNeYli02kHcUPU/3fNX
         edIYj91NeWsIm8Ncv/WQgXXKN6+F23RR7emA8gGpz1At1reJgOYGbbMHNCl2n3usV+5q
         ZO2ClqJg+tIZqH24hkzV+k7dtKt10Nag0nouS1DVVxlTcYBpH41hgif9T1oc79nLJEUs
         sJMA==
X-Forwarded-Encrypted: i=1; AKwUvBznJeVTHAUW5CPphfJkQMBhmjE8BPzu51NJefgMOxUUYv9QI9lmN1/YN/vUr9uppUGsB34q6GU+uinhWw6afu0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzmc/awBsD91k2hhsTHYoThabPhVLcVEMbAHE6p97unN/+ManE
	dSXq8YtBOACKgyajAnH6ZlPSgZ6ZYwPJ9TUWc2cf9KKzFfsAAyt9tnfIiLWbrOXjc1JgAjFUjNY
	1b3Splvj3AuPPVM9Q9WgCb4RK763DFyAFr06nJ1Kl24C6DzFoLFxwpvXwSd86sOs3OyU8sLg=
X-Gm-Gg: AYBFou3muVXC5liJuHMKjJ6UT31MSDpCcOY7jrohL0gQoQhe1xhyQYVmb1ypUyedRpW
	wHFMRgE9Dh/vun2ZIEQXKzQrEVC510C2mC8Cws6lFhFpkJFZhg3hn9oPYrreOSP/6vQRTiMOZDf
	AI0hMDHTu7EaH/I7X+zF6XXUZL7l8eIK2N92BWmk+9SdS5F2HzpUM/tvIxTWTWIXqX2gSsAvNK9
	BvI79vONrNMesiZa1YAglnj8tCThjmDRbNCYVB9m6moRouMcFq2+upcIrKkjXC4nR6ocBtUScPk
	R8DO8hkPNrFJb72s4ybKF4ddQdAKHynLJJr+gf+ql5YKXiahzYTaRsNyzidJsCZMUcTy5aoBqTW
	E01RkAipXDQwVxtjlnhbNUVooQxM=
X-Received: by 2002:a05:620a:19a5:b0:93e:b0c3:388d with SMTP id af79cd13be357-93f29b7f65cmr1936775885a.11.1792505860727;
        Tue, 20 Oct 2026 07:17:40 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:93e:b0c3:388d with SMTP id af79cd13be357-93f29b7f65cmr1936767785a.11.1792505860129;
        Tue, 20 Oct 2026 07:17:40 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:4884:6e9a:d9ff:9fa6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d810043sm6642276f8f.16.2026.10.20.07.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:17:39 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v3 3/6] powercap: dtpm: Remove duplicate RK3399 CPU hierarchy nodes
Date: Tue, 20 Oct 2026 16:16:53 +0200
Message-ID: <38f5964cadd33f8b03afaf9ff740653258367d72.1792504834.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: s3fwmPVVQlPVGeSRdBp9uEA6AvioE6ew
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfX8/qTzmY3GqXK
 Hgup3w/qRV0AaKM5qrUSd5cIVMGuiUYMYhcSq7SD4ei3c7c2M2XIfQeLb3d2V78fv1w3Ivzf2NO
 XtNU0RYaBsGKsy/Mm3YUJF4BMICLKVqWd7+kbwPtBiUQby2karQm0qZOcmnj0SiF8Wx7tafiWaD
 jLRnzF7K23u4nwtJoSuAw3ZwrJgS7gAraOpLCfE48p57qf4CBHUA90wsvtHGRrekKntSyKIsRN6
 rYnWBHbiEp3C8LvzeNYcoAqEIJU7CKdjZ0gDRqTrSolTWjkXXsij/h+Pm1dXfpOafeKnawk58em
 qLknQZMHH33IMVYiclyP6OGyToYo4NE7UGf4N7SCrotihF4muJM7e5iypW7/TnwFW6fAzf2MUTz
 x0GzI7oC/H7ORjvYP7Ft2+Gq+t2/IIq+h/7SAccCQjZBRgk5H/6+ATAX+MBhWKzoieak0b3zQu3
 EJQfZgasmT5Tsu0Y9FQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfXyjtmJpAvqx7U
 +TuJYLJSYh+IzKcaXNPo+nA/tvlvpoGp/ATxTasmoKD0Re6NoP4ql+celENjYjZMN6DmTCr24Tn
 gek2pdt2wGZmCwhwjVLg5zfskNqfj2A=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad77806 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=EpzjDTW3ywHV2UopgxgA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: s3fwmPVVQlPVGeSRdBp9uEA6AvioE6ew
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200056

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

Assisted-by: LLM
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Fix Rockchip match-table indentation here rather than in patch 1.
- Clarify that the existing backend suppresses duplicate registration.
- Add Assisted-by attribution.

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

