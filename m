Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B238432304
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577737; cv=none; b=cmKX0gwRPOHvkUO4zwZNXkwFvq5V1EWvAX0rfu0L+3OaAtwEALhIsCcuHeHkVINW694yes3/CzS/LMG5kkKDelnixZ7qeb/bD6bYapJw1TE7yX0PMpte2+3tGpG8XXrPL6t0woE+PL1QOMNCN9mB9mbbDUisEaNjGR0v/5UQqd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577737; c=relaxed/simple;
	bh=+dp9Vtps27IuWUP3AnoeGjUrH0F9t/YAsGiT2Ps0DtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k4VaTIxWQV4aLLoc46Nr+U+9j1Ojkphlxdr3kSjz//UcP3d1oViGZL8/PVEjLQnDzRizO80ENgkMN7nsZf7N8WNQvPQQG0mutxq4zGPVFjwtr91yELHiQorHcXRBxv/M/koZpc24RsMO/KkN3NChif2aaDJ6TORJM3PvCnKaUk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YojOx9aQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOu9ItJE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YojOx9aQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOu9ItJE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLfsC723944
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CLx6LxcsDwB3ZjIhypvrn1AGWZ6LjrH8hIxTnjXB4Bk=; b=YojOx9aQmonhxXUs
	6qzKycVFk4bAjBdLEmZipaYboaKQWt88q/4+/5TgEQvkMXZZActak186vWiRqIUp
	cpp+RUIPLKXwjbXleKwSz8za+0LTBk167S4yKBTZRaoVGiFFq2QqnjefQSqkg6h5
	magLE5etM3/hOeOMeIg1BnnYPVclMDj7qTqGZnfe7AshOT12gzW/AI0HFQeaFnyc
	d1BhNqd6iGrSNBbfx1xM5F1kSm/9R5FENsfbU1ys1LE4ZX2u/vZ37fKhWyA0NpdX
	cBiYcUBv3GEK5KB91oxrZkg32srJDVnUsdqIwsONcXGGtURLgGF+bX0gbm18oCcH
	r5lQOg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0pmyuaxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:35:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so4842255ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 16:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577735; x=1787182535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLx6LxcsDwB3ZjIhypvrn1AGWZ6LjrH8hIxTnjXB4Bk=;
        b=MOu9ItJEdmthBUx+9mdpGIfjc963CQtD4xW2Qw5tFDFuVIlBb/DeLfjiOAzchSlIPg
         ygrtdB57agq0F8+Xg1uCbZQ9AB63IjsDxyrG+AdURgS5RbFoHK6VurkoDueZ3xR8fr/2
         +BuasQP6YY+Ixz0d4QAWB/816eXGebfnvN+/Ea0s2eg73b7e6S6R7iSrlRqOrVVFMtp1
         C0C5PS19zt0BQSraU/KCpx97dz40udRjxWVwlfZRri62ODRz2aKYs16Tobxm95SxxYlj
         Tca09ftP39kdiHydG+iFsOBeI4N6IUNTKtCCBlsiIH7RVSzEArDrXKf18iUh9rOzVCp0
         Pcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577735; x=1787182535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLx6LxcsDwB3ZjIhypvrn1AGWZ6LjrH8hIxTnjXB4Bk=;
        b=Zlejg8l+oFYg0J0nZATI7RrTXUACAqXAjbcJC+9F/NQuIbtLr6c2DEkIX3QCFugoeH
         6cg2SI+68R9kjjz/Ze+bNdVTsxaexI0mEDxkpQNJMAVJYQo8G3O+PZDJtDS0+kEl9wx4
         9JLSSpP9FVgI/954BuAMfhlmu4h0cVVCYuq+ZYq9xxnO92t23XrG3yZJ7/WvZGQICi/O
         mZUvNGJQwNa/chwH6JlQ2l9MVaBTLwiA4Pr+PTmNKvTaNuUbAYYgVQzo4iQYVZY6zdFN
         qN3igt9cj0AOzoQ2FGEadClyVd3LPtn4dwodBiKijPYbiXQl7dPFvW6fjEe0eIs0Ll2t
         fFzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqr/Fnd0BGOTmZhK9FRSPubSQS9MD82oJVrdGFXqOq7VJny5CFFoJyuCsbWAZ3f4girPTDms+IUxcC19b8PDAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YylByDb9D360H8z/Ng7uyyNYebX9E1PDJHGhEfJ132hVVvK7G8V
	RKyP482F/nxEpn02eqM34TQaX37iuKq+OSQchlh68tUhdp6gKz/ZetTnLA9iybZlYT47nbzGuRN
	5kLxT2W5OBpvgKncwvvxhfZdWc/HyjGWPf4avQQTjmKwQQM1lxZRqQCyfIVHyeIh9OzLi9WE=
X-Gm-Gg: AR+sD10lOY2E6dRgnmhUkQLOMA+xSweYzM4sXlAHy5At1UIHjrroIP5boMdKsMHwzD+
	/CkF/uXCV0Md4kjLOXpl5+OfwEbkCRztToqri6jAfGP+R0g7BWD8oLjFMQGmZTF66c6rQI73xrP
	QhQsrCOV4755LNE59QVdJcP+ecAio7XhWDxxQuznPxDw8oILM3PVEQ4ytCaWFxpi13hpD5CwxEA
	iYXxLvrXIgA9IF7OsIa6vtcsqgqN5K9QHfGJKt22vuLl70eZ+g6ix13F6xq9CvBC6vFj/nDsXOJ
	4E/dSh4Uih+YXWdsKoCcFuHmVYf7B0zUTiohRhAqVTgZgjZKaExPJkc5ZSc4rg==
X-Received: by 2002:a17:902:d2cc:b0:2ca:d172:7228 with SMTP id d9443c01a7336-2d37e855129mr13704585ad.11.1786577734764;
        Wed, 12 Aug 2026 16:35:34 -0700 (PDT)
X-Received: by 2002:a17:902:d2cc:b0:2ca:d172:7228 with SMTP id d9443c01a7336-2d37e855129mr13703945ad.11.1786577734295;
        Wed, 12 Aug 2026 16:35:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:33 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:51 -0400
Subject: [PATCH v6 05/11] riscv: dts: spacemit: k3: Add Zic64b ISA
 extension
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-5-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6883;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=+dp9Vtps27IuWUP3AnoeGjUrH0F9t/YAsGiT2Ps0DtE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZtGHGjGn45+ZfZUUtp/T9rgyOard5u8NuS7v5Xpq3
 C+LZlh3lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwERWBTH8jxTsX6fpeUG6OqiY
 s96jVm+yWoN/uL7RA4GuA+4P7qW8YfhncLre/61C3KsnPEEtH5vWTd9yNPbZw9AF01i8FFfXewr
 zAwA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX7iIVeQRvXuMx
 RkO5gsEIA6We4qtYCFHUIk8s47QulJljyBdCg6vCG6eYTUkT//dfKMs55KnjVDSV7wQuWaZODoR
 A0ucO97QIFI53CrGvYBThyD/GUNKfTo=
X-Proofpoint-ORIG-GUID: zpdcTy8OvjJHfF8LFIyqxFFRmgSE7-gC
X-Authority-Analysis: v=2.4 cv=C/fZDwP+ c=1 sm=1 tr=0 ts=6a7d0347 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UGsqu9ZSYe-JSgDVrOUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: zpdcTy8OvjJHfF8LFIyqxFFRmgSE7-gC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX6nEe0D4nsk85
 cMxfSGT7iNuHcXh2SWt11nzy/YFXZZgKVGoJ/1R5L5KuyxnvcQe92rwppeopV8PiveVyFbHrLfh
 dtgWoeAT4JwQsFQAxV6Uzx4NM26oeqUf88KdCVUKi/WYnX9V9eRgaWgunCsKBSaJh5hRnHIloa/
 t4jwCBAoNlnJQkDdA2DzjIwCFMduATpyDCpZrRaudIpN4NTtZ0wqk33cJh6ynxWGzCgGbyMXntZ
 iN4WaSXCOGzLfifo9YTuzMVDJaNP7+EgRgCchf7qXyM9/HGY+SAtvJJUHiGZcSEM5w519YY/+QB
 pPVlNtVRfwG5v6m9yjN+yljWnhDcIFavhE1/GcQ7It9de3x/uNYPLKxjLveqkQBi0dYHD6JCgbQ
 Mi4BT4GDjjJcjpkbmJ6bHM9Av/pKZz7SrCBmEbOCK3YVUwEOeQipRmWC0Ec5VwQ1HuMewInmZ9o
 z0HfY88kwPzjw11AVkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190

The K3 X100 cores have 64-byte cache blocks, already described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b, a mandatory
RVA23 extension.  Declare it in each core's riscv,isa-extensions.

Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: No change.
v5: Collected Reviewed-by from Yixun Lan.
v4: No change.
v3: New patch.
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 48 ++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..9a03b72e271c 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -35,9 +35,9 @@ cpu_0: cpu@0 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -76,9 +76,9 @@ cpu_1: cpu@1 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -117,9 +117,9 @@ cpu_2: cpu@2 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -158,9 +158,9 @@ cpu_3: cpu@3 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -199,9 +199,9 @@ cpu_4: cpu@4 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -240,9 +240,9 @@ cpu_5: cpu@5 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -281,9 +281,9 @@ cpu_6: cpu@6 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -322,9 +322,9 @@ cpu_7: cpu@7 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",

-- 
2.43.0

