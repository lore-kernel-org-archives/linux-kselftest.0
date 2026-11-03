Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793681351;
	b=GDaNTc8eEXzcHsTlq5szVCM8kaW3kHhD5qxN3tJoNtrDHLtnRnbE9sVBn1t+eWvatZ5k
	 ZC0yvpn80RSl9LNvdQTEJIMrylc7A7T6Q5E5mDK3YzB9PLV8bBoh27mnmiIqZap/ajVBb
	 E1Me9Hxjs1xPAbIVCyk6nZe9k7xLV/C5LAS2P52s5CTqufzzYyOueI0bOfp1SfUjWZ8zm
	 rU0FdQ7Qhz0uLJkgZZkhpVjAMW//WSWE4diaDpb5WsFZIY4PGQ8udtCNMgrYNLU5KFGYE
	 OaLELxb1uILFP1wQ+KOKHCZsDZQFL4EHXKZa9Q86oQ+KOx24F9kaLGZJyruKRbrRUOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681351;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xI4gvJjOAmwGjJ10E+KfBxUOX/8swyX/L3aQALDRl8g=;
	b=OHbpU54i6v/aI+wo6J0FFZptdCRctmzw3PzFGWytr9EaRkCPc5CPTjaetWTVFdEM6Hng
	 pLcrTq2sYzegWxpRmOAXm2MMnppD+QcSksM9AszyxQnd5g8jkeioU4BgnpEfOo0Fvlw/5
	 RLZ3mLG5r0503ilbNN1DEurXe9j7uJT/HQpn0/pCOKaBkrazl1PtP94sIIu76LtI7Yt6v
	 CzXstWjT7oclLl4oUyyEuHoZbyrR6uPaTB/u4jRElEnGyAUWyMVn4JpP8yKjFEcfZY1X4
	 C9q+vnnI9uD13RtYfFouo3CH7I+7IF+G5RYYxYSAVKUGrCAa8QjAtm4NCQpA+Deppcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZZknBHZP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y50kfIyA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77156606A335
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 04:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77156606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZZknBHZP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y50kfIyA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eM0X1082283
	for <linux-kselftest@vger.kernel.org>; Tue, 3 Nov 2026 04:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xI4gvJjOAmw
	GjJ10E+KfBxUOX/8swyX/L3aQALDRl8g=; b=ZZknBHZPGA8j3sdVFQeyjONlyiw
	d6E2V4CHledeLpedsobCLLn+5xLVABkY+i2i3VsvbnSr6LllGYNGm50kqgFzMtLO
	TzJhTK8I8luT2QaN/+cr8yO9MfXDvEUuf4v+KiEl1p1TZNzhxj0Fnyj7pHKfSpgd
	n0fbmBqQ5TdELJ1HtAxwA/zo8OVQbnUtmbkJNtC4m5GU6HmcaG6nTcTAHBT0X5do
	3S5eON3t8AjRYoN/yEb54iDRrz9l89vlQkNCGhRR0aEhllJJsOZfBwYhPY3sY4lp
	6GpJBIME20ima80f9kHAL9uh0dluepPWaByVXqF+fJMZguvdWkVbcmo6l5Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r1xyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 04:49:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91256a7b7b3so67343166d6.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 20:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793681349; x=1794286149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xI4gvJjOAmwGjJ10E+KfBxUOX/8swyX/L3aQALDRl8g=;
        b=Y50kfIyAzBn6y9p1E3ADxxS/8GRdeWOi97QZ2AMnIMC8PuuhPEtsf+1PdwACvl6U6G
         Me8ECu9p6qPJ5eBNOd3waFgE0xvsrSlxcj9K3cftTjK/LVK4lW08quNodiBLXQXF18Nl
         75JEtuKu4mPE9neh7GmlHaI4KpVxP/9YLX/+wFIRgeibnu0RNHbeWNjYzou+zPlm0QJD
         +e0T1R1fZa59M0R5/IsfNRZtWOK3Mx+dDCf8sm8K7johz2yTcLAnK/D1LiXe0jQYCDx6
         LotojASs2UxOlD4LadBpJgjPR0h3XKvd3yT6Llt5aIyQuKmK0ZK7KN2B89chuNemEmRN
         LOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681349; x=1794286149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xI4gvJjOAmwGjJ10E+KfBxUOX/8swyX/L3aQALDRl8g=;
        b=sg0xizrKeOG3B4MmRXgfnA30m/ZQSVp3z20OQaqNzlCnu+Nb1l6nsICkOxqVyzHE+N
         jtpywB6vhQgVwtu+3kPVDoCCjF1Mx7ySkA1GWCg3Zb0Pc63DuQQmZcVBxTcmYGUzc2sT
         6xElsEDnu4U3fke38Xg0XsPECLwMWMS6YVKIU7TQezpDZA3kBi85XsjpTfaVaK6IzD5H
         LQDyyjBhukLXvg3mX/ncHNx6o7DzNgq7OEToWR/KOy8XBs6dz6bnd7+MX+K3qs/yaooC
         67u54LSZ2fWhoe0apDSeFHTWMgJ0W9asMGb8EBI7lizNL3D+/3+ZlSMWE7/tPxeouaBQ
         wn4g==
X-Forwarded-Encrypted: i=1; AKwUvBwgtAJQwAT+TaMZEAm8FGlMbKOMiZl5kStgBG7B1ymbOO8g8cVLyf1e3PIQ/PnGRY8JI18BCjUxWR3NI6ExsvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XrLRShdEVXAJfNvpb8HPSLBZMlAlJtWO18LZ1Cb+xYATRDIld
	cTf05CMy8gpz9aX9bkBo6kQTRwra6pfh8ASlk4Etvx6/WiTHscDNV0Xmu2KdkHH6Eynl3jgNy9z
	y1YpKUv/SsuNbzobqOw58CFMvpX+sWeTwgfHxX79WeZLM3XzLc/Rgu00/wqAn4GsB28sC9kQ=
X-Gm-Gg: AYBFou3CuU0SbEDTZb4bV60FYxURcqJTx+MwseL4vHH+Ij1jh0NcDyKTrM40pbs15R8
	0Z26X63ERg8EFc7czP9vDHJawxKfoxk3woHNLcMdKWltds0HxLFs84rPndiD1HCR6TAg3WF1TC2
	zeUxDiXVvDBJyiNRxxaKjIje0b/3Jpn8stcQ3NGzaYCFryCe2LQYLCkbbfQ8wCe7mmvqjRpCxHb
	Wmol9N5tymlUlGbnt/Zelj0XVwtNjQTRXIYcOuvcbI/f8Q2Yc4ozEaOjwsXUU+r/AB/16/VEapS
	psIpgc1+YgMJDhUZZ4BQRRVNhfppKxo4PHMLK6SOFH7DP1LGXlTjTdmfXHt314h1hsmrIgKF/P9
	Q8kGQYOR3HvFZxrMQB5Ega2jXYoshgApNJ72Upm7EAo57zNWIdcOt/ETzdxkgInT+kVLJu2mFBf
	7s
X-Received: by 2002:a05:620a:a905:b0:945:b9c8:de5a with SMTP id af79cd13be357-945b9c8dedbmr587931385a.20.1793681348349;
        Mon, 02 Nov 2026 20:49:08 -0800 (PST)
X-Received: by 2002:a05:620a:a905:b0:945:b9c8:de5a with SMTP id af79cd13be357-945b9c8dedbmr587928685a.20.1793681347600;
        Mon, 02 Nov 2026 20:49:07 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8b9e:7797:dd05:11cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879fb29sm25685445e9.4.2026.11.02.20.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:49:06 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v5 4/6] powercap: dtpm: Use generic powercap hierarchy helpers
Date: Tue,  3 Nov 2026 05:48:18 +0100
Message-ID: <bded992091c92baa7246b939f266297f99c8942b.1793666444.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 5UpbmVpA8sx35T8WDROlr-vVI5fe_6Jm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX8wpubKsrKIv0
 vzKPAjsUqgxaW76hZLIMIbRgqHnktXdXmW52HZpOSneUEZ4TI5MqqTa9dqPVH5BufRZClsw/HLE
 XCW3jvrAe3oLUQfE2T8S4s7iiPKpeaTaQxEvXeU4fNfihwvwlikZz2KnDMcQPcHJ7Nmt3W7ve9B
 pgT/yaSy0msPeqIC7L0kFGOytkrd276sJvNloFvDWKAyuFj5E/NHOvRRxIyWQBWKxRH8ltIXtIS
 60A6FguQ+0dQsaeRgTEFa+CE/DPNvw806s2gRPVbQIMQwSY74JmDoT54BkwAnABOXvHyo0ec9Tw
 0zTeUWozn8JMGlRdogCxDnMcPHeOjQL3lR3DdFZaON2AA1tustE9VeywgMQyL0scpELxBP+ci/7
 f+HB83BT6b6nUnSduCpebNnXts5JP0jjd+Jh/vQVokutuOmxEP2Or4nQiJXLxJgHfhbhwF885+f
 5R0nwPyPh182JpOORJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX4EYyVIZZmjRQ
 H/B/IzO+h/6ejQ87e1FwR1BJ7Ls/fFj1fSWRrkY/JMYMrnl7r2i0xEtsxM55QO84tnxTNtmzNbT
 6Ej8zWddWRa/QLz8ate+jFwYulsMXLY=
X-Proofpoint-GUID: 5UpbmVpA8sx35T8WDROlr-vVI5fe_6Jm
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae967c5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=PNS_9xEdTJF3v_BdtpwA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030018

DTPM implements its own hierarchy creation and destruction logic while
the powercap core now provides generic helpers for this purpose.

Convert DTPM to use the generic powercap hierarchy infrastructure.
Duplicate the platform hierarchy before creating it, and use
powercap_hierarchy_create() and powercap_hierarchy_destroy() to manage
the DTPM zones.

Add DTPM callbacks to create and destroy the zones associated with each
powercap hierarchy node. Adapt the CPU and devfreq backends to return
the created DTPM instance and use the node name provided by the
hierarchy.

Convert the Rockchip RK3399 description to struct powercap_hierarchy
and keep the device tree path as DTPM-specific node data.

This removes the DTPM-specific hierarchy traversal and destruction code
and leaves the hierarchy management to the powercap core.

Preserve best-effort creation: an unavailable backend returns NULL to
skip its branch, and setup failures are warned about and skipped rather
than rolling back independent zones. Invalid node descriptors remain
fatal. Reject a DT node with a NULL path before calling
of_find_node_by_path(), treating it as an invalid descriptor rather
than an unavailable backend.

When the representative CPU is offline, find an active policy through an
online sibling whose related_cpus mask contains it. Hold the CPU hotplug
read lock during selection and setup, and initialize the zone through the
policy's active CPU while keeping the hierarchy-provided name. An entirely
offline policy still has no active CPU to initialize through.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v5 (since v4):
- Reject a NULL DT node path with -EINVAL before invoking
  dtpm_setup_dt(), as suggested by Lukasz Luba.
- Document that a missing path is an invalid hierarchy descriptor.

Changes in v4 (since v3):
- Rebase on v7.3; no code or commit-description changes.

Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Preserve best-effort branch creation using the generic NULL result.
- Find an online policy sibling for offline CPU representatives and
  protect policy selection and setup against CPU hotplug.
- Keep generic API behavior and documentation in patch 1.
- Fix __initdata placement; match-table indentation is handled in patch 3.
- Name setup callback arguments and remove whitespace-only lines.
- Update the description.

 drivers/powercap/dtpm.c         | 180 +++++++++++++++-----------------
 drivers/powercap/dtpm_cpu.c     |  62 ++++++++---
 drivers/powercap/dtpm_devfreq.c |  22 ++--
 drivers/soc/rockchip/dtpm.c     |  67 +++++++++---
 include/linux/dtpm.h            |   6 +-
 5 files changed, 198 insertions(+), 139 deletions(-)

diff --git a/drivers/powercap/dtpm.c b/drivers/powercap/dtpm.c
index b7a65e543f19..da5795b0f3ff 100644
--- a/drivers/powercap/dtpm.c
+++ b/drivers/powercap/dtpm.c
@@ -35,6 +35,7 @@ static const char *constraint_name[] = {
 
 static DEFINE_MUTEX(dtpm_lock);
 static struct powercap_control_type *pct;
+static struct powercap_hierarchy *dtpm_hierarchy;
 static struct dtpm *root;
 
 static int get_time_window_us(struct powercap_zone *pcz, int cid, u64 *window)
@@ -191,7 +192,7 @@ static int get_power_limit_uw(struct powercap_zone *pcz,
 			      int cid, u64 *power_limit)
 {
 	*power_limit = to_dtpm(pcz)->power_limit;
-	
+
 	return 0;
 }
 
@@ -412,8 +413,7 @@ int dtpm_register(const char *name, struct dtpm *dtpm, struct dtpm *parent)
 	return 0;
 }
 
-static struct dtpm *dtpm_setup_virtual(const struct dtpm_node *hierarchy,
-				       struct dtpm *parent)
+static struct dtpm *dtpm_setup_virtual(const char *name, struct dtpm *parent)
 {
 	struct dtpm *dtpm;
 	int ret;
@@ -423,10 +423,9 @@ static struct dtpm *dtpm_setup_virtual(const struct dtpm_node *hierarchy,
 		return ERR_PTR(-ENOMEM);
 	dtpm_init(dtpm, NULL);
 
-	ret = dtpm_register(hierarchy->name, dtpm, parent);
+	ret = dtpm_register(name, dtpm, parent);
 	if (ret) {
-		pr_err("Failed to register dtpm node '%s': %d\n",
-		       hierarchy->name, ret);
+		pr_err("Failed to register dtpm node '%s': %d\n", name, ret);
 		kfree(dtpm);
 		return ERR_PTR(ret);
 	}
@@ -434,90 +433,91 @@ static struct dtpm *dtpm_setup_virtual(const struct dtpm_node *hierarchy,
 	return dtpm;
 }
 
-static struct dtpm *dtpm_setup_dt(const struct dtpm_node *hierarchy,
+static struct dtpm *dtpm_setup_dt(const char *name, const char *path,
 				  struct dtpm *parent)
 {
 	struct device_node *np;
-	int i, ret;
+	struct dtpm *dtpm = NULL;
+	int i;
 
-	np = of_find_node_by_path(hierarchy->name);
+	np = of_find_node_by_path(path);
 	if (!np) {
-		pr_err("Failed to find '%s'\n", hierarchy->name);
+		pr_err("Failed to find '%s'\n", path);
 		return ERR_PTR(-ENXIO);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(dtpm_subsys); i++) {
+		struct dtpm *tmp;
 
 		if (!dtpm_subsys[i]->setup)
 			continue;
 
-		ret = dtpm_subsys[i]->setup(parent, np);
-		if (ret) {
-			pr_err("Failed to setup '%s': %d\n", dtpm_subsys[i]->name, ret);
-			of_node_put(np);
-			return ERR_PTR(ret);
+		tmp = dtpm_subsys[i]->setup(parent, np, name);
+		if (IS_ERR(tmp)) {
+			pr_err("Failed to setup '%s': %ld\n",
+			       dtpm_subsys[i]->name, PTR_ERR(tmp));
+			dtpm = tmp;
+			break;
+		}
+
+		if (tmp) {
+			dtpm = tmp;
+			break;
 		}
 	}
 
 	of_node_put(np);
 
-	/*
-	 * By returning a NULL pointer, we let know the caller there
-	 * is no child for us as we are a leaf of the tree
-	 */
-	return NULL;
+	return dtpm;
 }
 
-typedef struct dtpm * (*dtpm_node_callback_t)(const struct dtpm_node *, struct dtpm *);
-
-static dtpm_node_callback_t dtpm_node_callback[] = {
-	[DTPM_NODE_VIRTUAL] = dtpm_setup_virtual,
-	[DTPM_NODE_DT] = dtpm_setup_dt,
-};
-
-static int dtpm_for_each_child(const struct dtpm_node *hierarchy,
-			       const struct dtpm_node *it, struct dtpm *parent)
+static struct powercap_zone *
+dtpm_node_create(struct powercap_control_type *pct, const char *name,
+		 void *data, struct powercap_zone *parent)
 {
+	struct dtpm_node *node = data;
+	struct dtpm *dtpm_parent = parent ? to_dtpm(parent) : NULL;
 	struct dtpm *dtpm;
-	int i, ret;
 
-	for (i = 0; hierarchy[i].name; i++) {
+	if (!node)
+		return ERR_PTR(-EINVAL);
+
+	switch (node->type) {
+	case DTPM_NODE_VIRTUAL:
+		dtpm = dtpm_setup_virtual(name, dtpm_parent);
+		break;
+	case DTPM_NODE_DT:
+		if (!node->path)
+			return ERR_PTR(-EINVAL);
+
+		dtpm = dtpm_setup_dt(name, node->path, dtpm_parent);
+		break;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
 
-		if (hierarchy[i].parent != it)
-			continue;
+	/* An unavailable backend must not prevent independent branches. */
+	if (IS_ERR(dtpm)) {
+		pr_warn("Failed to create '%s' in the hierarchy: %ld\n",
+			name, PTR_ERR(dtpm));
+		return NULL;
+	}
 
-		dtpm = dtpm_node_callback[hierarchy[i].type](&hierarchy[i], parent);
+	if (!dtpm)
+		return NULL;
 
-		/*
-		 * A NULL pointer means there is no children, hence we
-		 * continue without going deeper in the recursivity.
-		 */
-		if (!dtpm)
-			continue;
+	return &dtpm->zone;
+}
 
-		/*
-		 * There are multiple reasons why the callback could
-		 * fail. The generic glue is abstracting the backend
-		 * and therefore it is not possible to report back or
-		 * take a decision based on the error.  In any case,
-		 * if this call fails, it is not critical in the
-		 * hierarchy creation, we can assume the underlying
-		 * service is not found, so we continue without this
-		 * branch in the tree but with a warning to log the
-		 * information the node was not created.
-		 */
-		if (IS_ERR(dtpm)) {
-			pr_warn("Failed to create '%s' in the hierarchy\n",
-				hierarchy[i].name);
-			continue;
-		}
+static void dtpm_node_destroy(struct powercap_control_type *pct,
+			      struct powercap_zone *zone, void *data)
+{
+	struct dtpm *dtpm = to_dtpm(zone);
 
-		ret = dtpm_for_each_child(hierarchy, &hierarchy[i], dtpm);
-		if (ret)
-			return ret;
-	}
+	if (dtpm == root)
+		root = NULL;
 
-	return 0;
+	dtpm_unregister(dtpm);
 }
 
 /**
@@ -528,27 +528,16 @@ static int dtpm_for_each_child(const struct dtpm_node *hierarchy,
  * description of the different node in the hierarchy. It creates the
  * tree in the sysfs filesystem under the powercap dtpm entry.
  *
- * The expected tree has the format:
- *
- * struct dtpm_node hierarchy[] = {
- *	[0] { .name = "topmost", type =  DTPM_NODE_VIRTUAL },
- *	[1] { .name = "package", .type = DTPM_NODE_VIRTUAL, .parent = &hierarchy[0] },
- *	[2] { .name = "/cpus/cpu0", .type = DTPM_NODE_DT, .parent = &hierarchy[1] },
- *	[3] { .name = "/cpus/cpu1", .type = DTPM_NODE_DT, .parent = &hierarchy[1] },
- *	[4] { .name = "/cpus/cpu2", .type = DTPM_NODE_DT, .parent = &hierarchy[1] },
- *	[5] { .name = "/cpus/cpu3", .type = DTPM_NODE_DT, .parent = &hierarchy[1] },
- *	[6] { }
- * };
- *
- * The last element is always an empty one and marks the end of the
- * array.
+ * The platform description is a struct powercap_hierarchy. The private
+ * data associated with each powercap node describes how DTPM creates the
+ * corresponding zone.
  *
  * Return: zero on success, a negative value in case of error. Errors
  * are reported back from the underlying functions.
  */
 int dtpm_create_hierarchy(struct of_device_id *dtpm_match_table)
 {
-	const struct dtpm_node *hierarchy;
+	const struct powercap_hierarchy *hierarchy;
 	int i, ret;
 
 	mutex_lock(&dtpm_lock);
@@ -571,10 +560,18 @@ int dtpm_create_hierarchy(struct of_device_id *dtpm_match_table)
 		goto out_err;
 	}
 
-	ret = dtpm_for_each_child(hierarchy, NULL, NULL);
-	if (ret)
+	dtpm_hierarchy = powercap_hierarchy_dup(hierarchy);
+	if (IS_ERR(dtpm_hierarchy)) {
+		ret = PTR_ERR(dtpm_hierarchy);
+		dtpm_hierarchy = NULL;
 		goto out_err;
-	
+	}
+
+	ret = powercap_hierarchy_create(pct, dtpm_hierarchy,
+				dtpm_node_create, dtpm_node_destroy);
+	if (ret)
+		goto out_free_hierarchy;
+
 	for (i = 0; i < ARRAY_SIZE(dtpm_subsys); i++) {
 
 		if (!dtpm_subsys[i]->init)
@@ -590,31 +587,20 @@ int dtpm_create_hierarchy(struct of_device_id *dtpm_match_table)
 
 	return 0;
 
+out_free_hierarchy:
+	powercap_hierarchy_free(dtpm_hierarchy);
+	dtpm_hierarchy = NULL;
 out_err:
 	powercap_unregister_control_type(pct);
 out_pct:
 	pct = NULL;
 out_unlock:
 	mutex_unlock(&dtpm_lock);
-	
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dtpm_create_hierarchy);
 
-static void __dtpm_destroy_hierarchy(struct dtpm *dtpm)
-{
-	struct dtpm *child, *aux;
-
-	list_for_each_entry_safe(child, aux, &dtpm->children, sibling)
-		__dtpm_destroy_hierarchy(child);
-
-	/*
-	 * At this point, we know all children were removed from the
-	 * recursive call before
-	 */
-	dtpm_unregister(dtpm);
-}
-
 void dtpm_destroy_hierarchy(void)
 {
 	int i;
@@ -624,8 +610,8 @@ void dtpm_destroy_hierarchy(void)
 	if (!pct)
 		goto out_unlock;
 
-	__dtpm_destroy_hierarchy(root);
-	
+	powercap_hierarchy_destroy(pct, dtpm_hierarchy, dtpm_node_destroy);
+
 
 	for (i = 0; i < ARRAY_SIZE(dtpm_subsys); i++) {
 
@@ -635,8 +621,10 @@ void dtpm_destroy_hierarchy(void)
 		dtpm_subsys[i]->exit();
 	}
 
+	powercap_hierarchy_free(dtpm_hierarchy);
 	powercap_unregister_control_type(pct);
 
+	dtpm_hierarchy = NULL;
 	pct = NULL;
 
 	root = NULL;
diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
index 21355db6419d..ccfc97e96e66 100644
--- a/drivers/powercap/dtpm_cpu.c
+++ b/drivers/powercap/dtpm_cpu.c
@@ -16,6 +16,7 @@
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/cpu.h>
 #include <linux/cpumask.h>
 #include <linux/cpufreq.h>
 #include <linux/cpuhotplug.h>
@@ -189,22 +190,53 @@ static int cpuhp_dtpm_cpu_online(unsigned int cpu)
 	return 0;
 }
 
-static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
+/*
+ * A hierarchy node identifies a policy through one of its related CPUs,
+ * which need not be online. Find an active policy through an online sibling
+ * when necessary. The caller must hold cpus_read_lock() and release the
+ * returned policy with cpufreq_cpu_put().
+ */
+static struct cpufreq_policy *dtpm_cpu_get_policy(unsigned int cpu)
+{
+	struct cpufreq_policy *policy;
+	unsigned int sibling;
+
+	policy = cpufreq_cpu_get(cpu);
+	if (policy)
+		return policy;
+
+	/* The hierarchy's representative CPU may be offline. */
+	for_each_online_cpu(sibling) {
+		policy = cpufreq_cpu_get(sibling);
+		if (!policy)
+			continue;
+
+		if (cpumask_test_cpu(cpu, policy->related_cpus))
+			return policy;
+
+		cpufreq_cpu_put(policy);
+	}
+
+	return NULL;
+}
+
+static struct dtpm *__dtpm_cpu_setup(int cpu, struct dtpm *parent, const char *name)
 {
 	struct dtpm_cpu *dtpm_cpu;
 	struct cpufreq_policy *policy;
 	struct em_perf_state *table;
 	struct em_perf_domain *pd;
-	char name[CPUFREQ_NAME_LEN];
-	int ret = -ENOMEM;
+	int ret;
 
 	dtpm_cpu = per_cpu(dtpm_per_cpu, cpu);
 	if (dtpm_cpu)
-		return 0;
+		return NULL;
 
-	policy = cpufreq_cpu_get(cpu);
+	policy = dtpm_cpu_get_policy(cpu);
 	if (!policy)
-		return 0;
+		return NULL;
+
+	cpu = policy->cpu;
 
 	pd = em_cpu_get(cpu);
 	if (!pd || em_is_artificial(pd)) {
@@ -224,8 +256,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
 	for_each_cpu(cpu, policy->related_cpus)
 		per_cpu(dtpm_per_cpu, cpu) = dtpm_cpu;
 
-	snprintf(name, sizeof(name), "cpu%d-cpufreq", dtpm_cpu->cpu);
-
 	ret = dtpm_register(name, &dtpm_cpu->dtpm, parent);
 	if (ret)
 		goto out_kfree_dtpm_cpu;
@@ -240,7 +270,7 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
 		goto out_dtpm_unregister;
 
 	cpufreq_cpu_put(policy);
-	return 0;
+	return &dtpm_cpu->dtpm;
 
 out_dtpm_unregister:
 	dtpm_unregister(&dtpm_cpu->dtpm);
@@ -253,18 +283,24 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
 
 release_policy:
 	cpufreq_cpu_put(policy);
-	return ret;
+	return ERR_PTR(ret);
 }
 
-static int dtpm_cpu_setup(struct dtpm *dtpm, struct device_node *np)
+static struct dtpm *dtpm_cpu_setup(struct dtpm *dtpm, struct device_node *np,
+				   const char *name)
 {
+	struct dtpm *node;
 	int cpu;
 
 	cpu = of_cpu_node_to_id(np);
 	if (cpu < 0)
-		return 0;
+		return NULL;
+
+	cpus_read_lock();
+	node = __dtpm_cpu_setup(cpu, dtpm, name);
+	cpus_read_unlock();
 
-	return __dtpm_cpu_setup(cpu, dtpm);
+	return node;
 }
 
 static int dtpm_cpu_init(void)
diff --git a/drivers/powercap/dtpm_devfreq.c b/drivers/powercap/dtpm_devfreq.c
index fa71285dee60..a783601fe74e 100644
--- a/drivers/powercap/dtpm_devfreq.c
+++ b/drivers/powercap/dtpm_devfreq.c
@@ -144,7 +144,8 @@ static struct dtpm_ops dtpm_ops = {
 	.release = pd_release,
 };
 
-static int __dtpm_devfreq_setup(struct devfreq *devfreq, struct dtpm *parent)
+static struct dtpm *__dtpm_devfreq_setup(struct devfreq *devfreq,
+					 struct dtpm *parent, const char *name)
 {
 	struct device *dev = devfreq->dev.parent;
 	struct dtpm_devfreq *dtpm_devfreq;
@@ -156,23 +157,23 @@ static int __dtpm_devfreq_setup(struct devfreq *devfreq, struct dtpm *parent)
 		ret = dev_pm_opp_of_register_em(dev, NULL);
 		if (ret) {
 			pr_err("No energy model available for '%s'\n", dev_name(dev));
-			return -EINVAL;
+			return ERR_PTR(-EINVAL);
 		}
 	}
 
 	dtpm_devfreq = kzalloc_obj(*dtpm_devfreq);
 	if (!dtpm_devfreq)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	dtpm_init(&dtpm_devfreq->dtpm, &dtpm_ops);
 
 	dtpm_devfreq->devfreq = devfreq;
 
-	ret = dtpm_register(dev_name(dev), &dtpm_devfreq->dtpm, parent);
+	ret = dtpm_register(name, &dtpm_devfreq->dtpm, parent);
 	if (ret) {
 		pr_err("Failed to register '%s': %d\n", dev_name(dev), ret);
 		kfree(dtpm_devfreq);
-		return ret;
+		return ERR_PTR(ret);
 	}
 
 	ret = dev_pm_qos_add_request(dev, &dtpm_devfreq->qos_req,
@@ -185,23 +186,24 @@ static int __dtpm_devfreq_setup(struct devfreq *devfreq, struct dtpm *parent)
 
 	dtpm_update_power(&dtpm_devfreq->dtpm);
 
-	return 0;
+	return &dtpm_devfreq->dtpm;
 
 out_dtpm_unregister:
 	dtpm_unregister(&dtpm_devfreq->dtpm);
 
-	return ret;
+	return ERR_PTR(ret);
 }
 
-static int dtpm_devfreq_setup(struct dtpm *dtpm, struct device_node *np)
+static struct dtpm *dtpm_devfreq_setup(struct dtpm *dtpm, struct device_node *np,
+				       const char *name)
 {
 	struct devfreq *devfreq;
 
 	devfreq = devfreq_get_devfreq_by_node(np);
 	if (IS_ERR(devfreq))
-		return 0;
+		return NULL;
 
-	return __dtpm_devfreq_setup(devfreq, dtpm);
+	return __dtpm_devfreq_setup(devfreq, dtpm, name);
 }
 
 struct dtpm_subsys_ops dtpm_devfreq_ops = {
diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
index e71f315fbb6b..222d9098cc98 100644
--- a/drivers/soc/rockchip/dtpm.c
+++ b/drivers/soc/rockchip/dtpm.c
@@ -11,26 +11,59 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
-static struct dtpm_node __initdata rk3399_hierarchy[] = {
-	[0] = { .name = "rk3399",
-		.type = DTPM_NODE_VIRTUAL },
-	[1] = { .name = "package",
-		.type = DTPM_NODE_VIRTUAL,
-		.parent = &rk3399_hierarchy[0] },
-	[2] = { .name = "/cpus/cpu@0",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[3] = { .name = "/cpus/cpu@100",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[4] = { .name = "/gpu@ff9a0000",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[5] = { /* sentinel */ }
+static struct dtpm_node rk3399_virtual = {
+	.type = DTPM_NODE_VIRTUAL,
+};
+
+static struct dtpm_node rk3399_cpu0 = {
+	.type = DTPM_NODE_DT,
+	.path = "/cpus/cpu@0",
+};
+
+static struct dtpm_node rk3399_cpu4 = {
+	.type = DTPM_NODE_DT,
+	.path = "/cpus/cpu@100",
+};
+
+static struct dtpm_node rk3399_gpu = {
+	.type = DTPM_NODE_DT,
+	.path = "/gpu@ff9a0000",
+};
+
+static struct powercap_node rk3399_nodes[] __initdata = {
+	[0] = {
+		.name = "rk3399",
+		.data = &rk3399_virtual,
+	},
+	[1] = {
+		.name = "package",
+		.parent = &rk3399_nodes[0],
+		.data = &rk3399_virtual,
+	},
+	[2] = {
+		.name = "cpu0-cpufreq",
+		.parent = &rk3399_nodes[1],
+		.data = &rk3399_cpu0,
+	},
+	[3] = {
+		.name = "cpu4-cpufreq",
+		.parent = &rk3399_nodes[1],
+		.data = &rk3399_cpu4,
+	},
+	[4] = {
+		.name = "ff9a0000.gpu",
+		.parent = &rk3399_nodes[1],
+		.data = &rk3399_gpu,
+	},
+};
+
+static struct powercap_hierarchy rk3399_hierarchy __initdata = {
+	.nodes = rk3399_nodes,
+	.nr_nodes = ARRAY_SIZE(rk3399_nodes),
 };
 
 static struct of_device_id __initdata rockchip_dtpm_match_table[] = {
-	{ .compatible = "rockchip,rk3399", .data = rk3399_hierarchy },
+	{ .compatible = "rockchip,rk3399", .data = &rk3399_hierarchy },
 	{},
 };
 
diff --git a/include/linux/dtpm.h b/include/linux/dtpm.h
index a4a13514b730..79a34d5923f4 100644
--- a/include/linux/dtpm.h
+++ b/include/linux/dtpm.h
@@ -38,7 +38,8 @@ struct dtpm_subsys_ops {
 	const char *name;
 	int (*init)(void);
 	void (*exit)(void);
-	int (*setup)(struct dtpm *, struct device_node *);
+	struct dtpm *(*setup)(struct dtpm *parent, struct device_node *np,
+			      const char *name);
 };
 
 enum DTPM_NODE_TYPE {
@@ -48,8 +49,7 @@ enum DTPM_NODE_TYPE {
 
 struct dtpm_node {
 	enum DTPM_NODE_TYPE type;
-	const char *name;
-	struct dtpm_node *parent;
+	const char *path;
 };
 
 static inline struct dtpm *to_dtpm(struct powercap_zone *zone)
-- 
2.43.0

