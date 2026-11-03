Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793681348;
	b=B+FFv3GkBz3Y8Nsd5yPUUVHMuj8upSgxBYAxDs9RDeQOpgeVtttfUjqSN64i43FK4bBY
	 pxjQGiW5Qyfaceq99PTOi+RmUoHAJZee14ueAh6Wd6zLwCZhHzPITSTZLc79ewSookXuG
	 4zsHqBc3krBtmjDjvXxdU7j95lTfkwVp5RAESrnFIpu6QJKjcXh1SHNuVGapY/S1VWNp2
	 E4QehWn3Q5C3P3XDOmbXBc8VNrl9xWtyXi6/aDUkYaD2SxFN8o+lEJI7fuRc3RTIPeUhZ
	 T6IphDjfnx+mVzleMqdOmEvMKTi5A3J4jv+igDUBJvEOSSqA8n7swHwGdgJsHjnHqEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681348;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JCqczoWRKss8snbeoW1OQA5p86RlP9skpTKlIpuQAs8=;
	b=lpXFCL6w6BgEaPSRBy+VQElxUkoqtEE38w4j/VjqD1pJJzE4pigP6j+xEcqZwG7W0p0C
	 YOj1vRhhCKqWDUlNzAVEZ2iJTjUGAFqrtpTXjJox9wMcsQS4n5L0Om7K2+xD8QRkR+eFo
	 jv4PM/azUkiAJnoczQ2PTV+AW/3F+74laZ1w8a5NhseLJHycCvrI3pbkLAPptWkCa2Qhd
	 XVQChABkM04GEhJDjm2X6FG6Sb+MAZJtlQYrDa3EDVZy6to4MVdW9C2+t/WxVDQBczfGP
	 bJCI5OycMzQmPT3C2IrinMr2VhhqTaPliu0Lb3OF/v9Qpujxp26QKZcMp7rQ+NSZOvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IiyEcu+O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FC+qTWCz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BFD606A326
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 04:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94BFD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IiyEcu+O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FC+qTWCz
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eDqB1434033
	for <linux-kselftest@vger.kernel.org>; Tue, 3 Nov 2026 04:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JCqczoWRKss
	8snbeoW1OQA5p86RlP9skpTKlIpuQAs8=; b=IiyEcu+OqwEx+AHLh6dxF0HFLuN
	v98LajLChhJP5gTSB9kX9r74mVC9QrqEke9Qvoy3ed90rvutsx8p665rpcGY3QOz
	rObsNdhMw1wXKKCjJUQ54Jj0L7YJh9XG+rnrM0M1/DKI7T/c5BeO+1H9l43OcQAg
	muCb0jxv7fkOZPu79mX/YzDBC3jOm0pCTidi4z6wxi7uB+L4uhNGm5wjXWuw31ls
	O2titeVUNp71mrAKHObPSZ45Fk3C92LDopi6SiW4n8zmMgsBtJWAHsvgoIETBbHB
	J/N6Om7Sj6P2Q+ea2kI8eUsyr0f5QOeLtwtmQcB6WG8EawbK7aY01JWjOrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2achc7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 04:49:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb71b1443so776667785a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 20:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793681346; x=1794286146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCqczoWRKss8snbeoW1OQA5p86RlP9skpTKlIpuQAs8=;
        b=FC+qTWCzhoaMRfDmqYlyhHAyQKti9YOGol7kZmmR7/h8jc5d85UXCDxSqfK5e01Jgv
         DyNJqR99fBVFZ5dZyIyu7nlZsXfzp+hVRr+gi+fEm6WdDOj1m2duH16HyAPBUnhcZBLZ
         3zSCLzlo4HUD2ETnzy5kQK+Co3VFKue48BUpyrNfexaeH5rRU5uns1MOTmvfV31m4gWD
         gO7CKFZKKKThfCxzn+JZSBbVDJY2MHaZMS9Tms038QYDqiOUbhiT6rKfa7jQJN2/x7km
         sv1CN27kKMoY7j4X1b6qJbEaoTjLuGZigcaxu86DEg+O9IOf4rsXD8OxcAyP+p+lSafZ
         6ZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681346; x=1794286146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCqczoWRKss8snbeoW1OQA5p86RlP9skpTKlIpuQAs8=;
        b=wxGOHuGn68Ag16UvrzqTR1Fjf5wTTshxwjUPTRPSf5AcLn7OBwBPYD/blGs9P483Q9
         rJz+AD7tPFlo0Jl5staEVvjP6fnnF3h5LTjfJWAq3ztTWanoDtFsj1gFVnnBD+FM+h/N
         yzHj+nV3gUYlS3W7XKuzl2RK/JmJtM6tq31FC6skrMsrGFPRnTPO9YQFPbW+p7kPXNwd
         jy7Pacn2gahc2wOXSINNk1DeT+6vrYcl8QwJva5HsXqW3d89Pcd0usVvD4NVc5vtUt43
         jRW8PcNE15Kvg9x/ensG0mdxr0kZwj5sk345FWiLph3SvC1jgECKFwAv5DICBiLqNkGk
         K/IA==
X-Forwarded-Encrypted: i=1; AKwUvBzaltV8Vc8sWpibyej5BxS6tYU8PFYLZvYeSPRwnUhL6yM7s3lS5wuqvca9VEWAeTxF3jbeyoGpnycVj4Lwi/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GK49AcjgHFge/4wkMuTVkr41CVhsIHrR9rHsx++0sFt1FSETm
	YwytlESSX2HsGGB4fXwRUW/WBS2o+LU3GlVQ+VhS0QagrVZWlihBVJkJSx+zZqMRsGGPhiqb5Wv
	VBSoT0KYlenMDB1bx05M+C20xDkeMl4GmUqaAVIRciKTKHcU9pzN5zxm6gPG9I651LiKGKcI=
X-Gm-Gg: AYBFou3z0YWRrBAmJ93yKpMVgUVndNXle6SARcNdoQQ4ALTlLjuSzzJIP1OiA3xLkUQ
	8UBhpmfIj4yfZ8wDMF597Tax0yY9Ysy3HpedkzABja1dV3dphYn4ID1kGKENUIw/KQINlh2Uja3
	WLKsgmWP9M7xeKdfZlD4xOTplVCG42ml7EtjqStZ96djGvGXkiL3ZCXzxjE6bxMj2T/jsExie34
	aB3edu6w9+uo4QdpL4OEaXNgV3sxtQVL/cg0OZ/R/seDxoQiS5NtRoMEaQyYbllHQgKGig4G0yF
	Rob3lkFQj/QU/lkzpgZUzG95ssp20HHq2cjIDKahiH/q6uHDDFQXS4K1bC0xAkS3jsThDPJfcaN
	C8ngkqyx/M5Cy/h92HzB2vKQA3nJ4FbaVRGNsOPyWd4iMcYC/5S8G0N/2hLzq/oi2L/O57jBKdF
	hO
X-Received: by 2002:a05:620a:a89b:20b0:945:51c1:c17 with SMTP id af79cd13be357-94551c11060mr930802085a.42.1793681345912;
        Mon, 02 Nov 2026 20:49:05 -0800 (PST)
X-Received: by 2002:a05:620a:a89b:20b0:945:51c1:c17 with SMTP id af79cd13be357-94551c11060mr930800185a.42.1793681345400;
        Mon, 02 Nov 2026 20:49:05 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8b9e:7797:dd05:11cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879fb29sm25685445e9.4.2026.11.02.20.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:49:04 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v5 3/6] powercap: dtpm: Remove duplicate RK3399 CPU hierarchy nodes
Date: Tue,  3 Nov 2026 05:48:17 +0100
Message-ID: <f9b6ff8250f27e117facd372735b6c1f46e74926.1793666444.git.daniel.lezcano@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae967c2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=EpzjDTW3ywHV2UopgxgA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX51wfhgJpbZge
 UdKpDAbyQa+XIIXZ/LmO3oBtmI43l0c2Abm2rtOHgQOrhk7feeMLZby0+Besa7RzPW+/i32rE8a
 ckk4qtbaq+eLr7wVIXWmRHu5zmyZpq0mPUvUNmznwdjOowWtEfVdcAbF45BqXI7cfDGwV1l5zAt
 IyrzOkFgIbiq7BvIxy1IeePUQvwM45boGYVGJ0Mr2vp7abYW/7gr0xOLa/J1ufn5oSzgAC/rKFe
 YORM+Xc+79IWaUYVErmrc0ynF6eBFhZ7MARkLcnPzFTkTKeVCQ8rviH3TIq0CdH3LK43+zGybjJ
 Eqp2IE15LUbB3IgRx/2NkDujM/+7i22vorUJQVE8W404jq7dcXwYorcbkBIHkTHnypn5ybN6HdV
 qbtCxt6B4UbBhp/75+ykmXO5znNuri1+MmN2p+VTh8fSRvRGBAI9byx3HFB+1yLpsFkXUTR2U37
 Nb2OFwPhxKcMnuPXZlA==
X-Proofpoint-GUID: n4oFBrO-jPDtiLALf2EXzW9pRpuvvRDL
X-Proofpoint-ORIG-GUID: n4oFBrO-jPDtiLALf2EXzW9pRpuvvRDL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX088iTBWBgNy+
 XuzgYZFyYRgUEw2Y3xFNqY2O9QQKOJVT2VYcKV3mJaeYIPivVXfjBQuLow6j2Dk2ciA0DWsHSdd
 07t6/hXsY/pVlRSUMAU1yXjq61F52ZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030018

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
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
---
Changes in v5 (since v4):
- Add Reviewed-by from Lukasz Luba; no code changes.

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

