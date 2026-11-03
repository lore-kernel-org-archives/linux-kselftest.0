Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793681351;
	b=ozBK8Q4l8L1+8SWCyMdFve7YgS3XL5oKQFZP7RhmeJMPwMOx4jFlxEESTzeC5FwM1eHk
	 o3xxl5WV7rI9urBul752JIYLAOd0FsJY4rmTcejDzGwoC2g31e/Iz9TODQwfnwXn4BMMX
	 1DM2FgvHNeomJtlgclfNyb98INccNRGKi+taNy9Da7KKE7XRSa66Gem4qThFyhrKIIlFf
	 7Ce5pVHw9uiu52knwi1GSTbPw7OH3Vazt2+uVOz5pPuqiQTaTseEPkSzY91dP5h/10a2z
	 su0owPNIsObBfpmXWE1ZXwzCqHxwwAqLaumH3Ma7FvLG3DiZTzxDPjGBfyj4T9u/r3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681351;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7upwgKb79Qwzvuf7T+5r1o67QI1wWo0sKlpFyeIZyUQ=;
	b=wYofdkOtEZcGySCWEPxA98NXeImhIgqeEcQfJYPXXLVpSh/yBcr5DxKzU3UjijcqDflG
	 RjCCnBhgAKboaW//Y0QZuz6FKOJvrO1HkqNLM6AM5exebD44HKFo8ycUHIK3qHLx2oUeE
	 GIUx4Ayb1ZIa1VJ4VqPm6uEBJWZ3tVKW8wSeH54G/mDpxa9ZSxo1JOEgrVT//hweMQxst
	 4oJLJMbcjhc/vojxohmwx1mw1NBjQxxSbRpV2hBvWbHNtZ1tC5BMb6Ap/oLP9N/iw3pMp
	 +y2UF9BDz/NYo3AOrXLVCMm4BnmhL22AhU8PTjAl7liTQFRD1eJcsnco9XXIOyGF0SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfuvBzZW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EL2PpGNL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682C9606A335
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 04:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 682C9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfuvBzZW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EL2PpGNL
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31ehPb2012462
	for <linux-kselftest@vger.kernel.org>; Tue, 3 Nov 2026 04:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7upwgKb79Qw
	zvuf7T+5r1o67QI1wWo0sKlpFyeIZyUQ=; b=JfuvBzZWpOyroViKIwsL2V0fmIh
	acu0P2X29m1aWJ4Jn4qNnJ7CFIPHDvjKOYdDArJ/CUZ/N6E5m7SmANdcPtuqAEhl
	ISz2zgn2Zw7NlCkwQs99Nz44gIs5RsqyB0tSuU3Os+qpBdYF13XqyP0JtA5UR0ag
	KGf/IbuMnS687UXoGnKzrvp3fk9q1w83KUIr2i2mt+mKMw7ZrZQevV3h7UzgAIOR
	l3V1NZDP7LjGGCgdUfmAHlhhsxi8UGitR6COavU2yF3t674+GqOLSy5NUbcNVgGy
	6Tf7MsaxyO2Dy+9czyal4Eyz8gk2YO6zO7X8IFq6qJcemN+BnmZkPexn6oQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6uupt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 04:49:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3969a2a7so576638185a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 20:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793681350; x=1794286150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7upwgKb79Qwzvuf7T+5r1o67QI1wWo0sKlpFyeIZyUQ=;
        b=EL2PpGNLMomWVkm77zLSqYCXLbXhJRx9elW3dadE9iiW3c81fsi9/dji2uhphbIbq2
         UtMYBcDSzbb8zHdecax1giqNVCuuqNxGTf2p0lI0X0kMJHOoB7AGz7L3O2Y+Et5lTeh8
         961UuO5DYtuBY8Dq5rjLIng7+ZxYaajL2NdlHJZ7sux/XA/nvgfDtpkKPmXiFHgkdJde
         9fsTH2sTxI0Pg0MoKwqbdkuoChOOqWMbqXkrdfLdQ0YpPoE7x8X1f5+ld3zEckDAZzfW
         Doe4gI1xCAYB/lrE9t3/EzV4dX5VQLCdpz0rSZx/phfC9HzIjmQKm/xVjWdBURuHJCan
         JItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681350; x=1794286150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7upwgKb79Qwzvuf7T+5r1o67QI1wWo0sKlpFyeIZyUQ=;
        b=Im3ZP5jZPiv3KEga38634+oiV7RVmtHpb4hFggYZozDieRjPkdGits11FUSybdutwR
         34KL8nHbM95EBwFpVLhgLyNa27t5F/XbGP2hTq3DHcHXdKI4j5guX+pq5w+4zu1mca3n
         lRkL6TyPT5/T/HR3+dzNxQKGDI2crcwmHGHBJfmeWirDOKnhFqjKTMA3yHdwOFIqaS95
         +E2TzjqkbzqsjBEmZ9LJVwxxDYwa2rov59Th1HkJ4MQ/4JZxdCev+MtvyecXzlbyOwxz
         XatWn5m5YbQuqnoe8bDqvjnK9LdW0b4tMqD33HfbNL3IDkQrh0MnnzorO7cQrG5xKR5K
         QCfA==
X-Forwarded-Encrypted: i=1; AKwUvBxHUmDxgDdyw8hkXPy/5wBQT7BOzz1MNAk3ncgw7bcc1o9FeEG6imlUVGgl4EsatVzh1RjzmfZ42GbE5mx3zDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qygUGQUdE8omm7Z5v5KovrDbSlXx9r77AubrcTqihLi5L5CCy
	jRvb3kygLflEsF4YdjCLLAD2AJIQLEpwWLL9oax3ZU73mmLk1FvIIdvFXzpFlPPwvTNsB6pAYU8
	+TK8j2nwiojW0Cg9fi7PjyzZwXiRTz0liaxNiPaRxqRvtnhNiFaOVizfvf/Kkr7eGfT/UMFQ=
X-Gm-Gg: AYBFou3MqZZDMkOk7huvnUW7SUC1/Ue9/CGrrvSsEC8M5q3lflrDtPyzN1stL8RLy1L
	ozhiZ+Qo88oHG63EdsEbNQzYkB1P+c0V+aEdeiRS+q5HgEWXdmJj/x/mkzPVyv1fR/uMegkM4s8
	qhBTkkaySWPpW43h6S7fr+sfAhZp+8YLf2d1Qo4ILNBFzysIqKkT1jXUK0qF0ZMYAKLx6XwMb6r
	TriSpQRYnCMHBoUUDcvwgX+CavfyvmvGnZgW86Y8CrhQj392+tS0gcbF5tghStdcx+rO60LVVB7
	gjZGxi94FFZSuC1TTnX+puIIbeeG99zsbPmcEbFLxLFUcLerE/mEt1r0mjKlMJUdZntCvnrdFTa
	ilxUHK08Wal6FibiNSqwv9SRIlmayD6QfwYUXuefPfXOmzkQLYpm+Kx7WkKR5c+3uAvaX5f9OBv
	VD
X-Received: by 2002:a05:620a:6844:b0:93e:c12c:4400 with SMTP id af79cd13be357-9442172bcecmr1859912785a.77.1793681349887;
        Mon, 02 Nov 2026 20:49:09 -0800 (PST)
X-Received: by 2002:a05:620a:6844:b0:93e:c12c:4400 with SMTP id af79cd13be357-9442172bcecmr1859911485a.77.1793681349430;
        Mon, 02 Nov 2026 20:49:09 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8b9e:7797:dd05:11cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879fb29sm25685445e9.4.2026.11.02.20.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:49:08 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v5 5/6] powercap: dtpm: Rename Rockchip virtual node descriptor
Date: Tue,  3 Nov 2026 05:48:19 +0100
Message-ID: <d58bc47b95fad310cb506ca01b59cbc54f0d8c75.1793666444.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX9uabSKXwk/sn
 I3skbZ044G2KViJfvoVAl6SlJsNCyacXWLkwsqvHMMuPm21eBQAm9KizaZ9Rj4Aka9cBgD7ANcy
 We4W6VKTjVkfdUII/4ntHGtqwRwHhIXP+y4Md+GcT7Nq+FKNoDxCgtKuGbXp5ethyTgxyQPgaqV
 S/nP+mkKVBSJCVNMIjguC4+SFRLLH1MxWlJXqeeJAKddOPzv411jil3/mwaDJJBn8ZZZjhLcST1
 somohohkdejhTu76oSMeOhTOigCungMX/E113tVv7r1O3e1HKrrzweSsi2Z/r3wMbGX3JicPMLd
 sJ1ciMKyZ7/q4Ucv2C4KO/7FXAm3kA07mncI68Vikyilz8WhobtOQq6ZdNuzuy1F/4Xc1778UGt
 ksu/k9z6ppIGd3fC5FonzPa8tpQ0mZAvU+/9qKFQ3xAGybErcmqUOcW5U978u37Lk8vCOssTp6i
 qvsgL7L4OxyqWaEr4HA==
X-Proofpoint-GUID: EPqBbOJMv607HKesJN1J9SxSb49y3C3A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfXzYRnuqKVgTnR
 xg1vkbZdcqNmkAMrfArUcaaRD+TdmHuNC0l1bIrqkrCNfbL3jbf/4HW7Tu23CYZF56kMwmuJUco
 bahCHapIjFQwPkdcSXKhlzPKfSRrPCU=
X-Proofpoint-ORIG-GUID: EPqBbOJMv607HKesJN1J9SxSb49y3C3A
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae967c6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=_NZqlvP9bvTAGtRSC3sA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030018

The virtual DTPM node descriptor is named after the RK3399 even though
it does not contain any SoC-specific information.

Rename it to rockchip_virtual so it can be reused by other Rockchip SoC
hierarchies.

No functional change intended.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
---
Changes in v5 (since v4):
- Add Reviewed-by from Lukasz Luba; no code changes.

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

