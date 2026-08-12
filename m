Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA120431E6B
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577722; cv=none; b=ELECLbJ5OFgEd6aMBdHvLjiP81S94ITvqXTT6Snz1Bbe6f15tVsc8jZwd6pJghvDBnZJKjRwPa6LM5mc+3UgAv0ouXq/RVCoLDON89h48r2Ywb6MfTd15Jp/2mey2o5zC5ZhVJV/yvaFbqU9bIlkplm0SQcgv3rG8gbwx9NVoAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577722; c=relaxed/simple;
	bh=df+eBxBrANzUqAkDxq/LIOvp8cwE4dtT4e7eHOHJASw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EK/kMXgLNTuucu07eguFBuim1+zts1O6uLs7AbZq2KCYZfzvs/6svO6h0Xxe9JqjJGDtUKiz3gSgku405DgEk6XG7XSGzIcJCL+JnSI3J7WvS5Ru0GY/P4Eliyxi68AAexEjKzgP5tvbjxkMR3K4s3yKSKMhkExXuQo5sKhNpl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRVSFQ47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZKiB48s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRVSFQ47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZKiB48s"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNMEC31024220
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ew7essRfW4CKu/wg5LnPI4usVo+eyUYoe/mBBDpBn4=; b=QRVSFQ47/HfFj+l5
	1NZcpNhH7D+NfqSPF8QVnXbaf5oeLkC2iCGcqnpkNvYm5pXkI9msqwKdEFoZpFes
	Ieqiqj/8LByLIG1GwqMz1f/C+z0DItXQw2vicLrDlSCXPlseo8tZ0uJ8wcMsv3Zi
	VtLf5PUfW9PvmlrSdUqX6/4R1DIPyp47XdohzGLgSgI24v/r2aT+Is/hyxUJBR+i
	GeUfKVvvWJXyG9xLYmi9+THEo8L2T0tp+fv/+s+mgLr73oVH0NXxCCGG8K4839gE
	EkgPTDywrjy3ElT4GWqtVWtFzmJKv5AryJ7alo/+nmBIGcJ0DH5BPSKWIsjAkiP0
	i6OvSw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0y04gteu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:35:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacd6d37edso2626625ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 16:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577719; x=1787182519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ew7essRfW4CKu/wg5LnPI4usVo+eyUYoe/mBBDpBn4=;
        b=JZKiB48s9Y/tn6Upo8IT8HRjjIjFO1fVgYSz5kkFvnpVZPr0QLVMSqbCyHqZJ0Rw1D
         MaTYFA/nw+NzkLup7Pw8FnDrxjPB6SHECmmunAd4lfKBZg0Xg0EFBLQtrzxJHOMQ03kb
         9hK93VrnSc8DroNYY0L+MCBYP0pKMHaGcziBsdDO2cLnzdYi/Nsvx41i6SslZwPVI2C+
         2mXbJqObBlmBUg0XnPqxqJxOetII7DL9edLN+YeYgjcKd073CZzmsnSPTW4ATpwP36/0
         O1zmV8YU8zBCtRkr7Kt/m8rlAgaTE/up0hNSWxG1jl9b269jY6czUw+NYGuJHLdwaf4b
         8Epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577719; x=1787182519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ew7essRfW4CKu/wg5LnPI4usVo+eyUYoe/mBBDpBn4=;
        b=OBiba7PwpT35oaQP/0wqgZas0ybfUeWAYw9/bu++qggbvjlyn08Pmw45XnBz+ul0eK
         237UBMDPNHGfQX1SlJvyUaXMSk2fKl9PHrR9Z6+7A0EIa/9bNTaP/BfXFl+R+PnJrnL7
         LmJO3XEkz7spEvp16GcHsQ4VeF8HltDKGqbzgDDqDoI4VbpX+eNroHKJAf5K9rcgKlmb
         wtC5+bDt/sPZYE63FFeJ4jITFzoU1zfeiLLYc+DgqvENyBhmiC9lYnZRLkK+XgbEnkzO
         GplGZA7dvoaRU3z6FkPMc9JQLi/kgptE/dXPqKC9mGLp9m4Mwz3XmIHVl5cbVCLqetd7
         GLhw==
X-Forwarded-Encrypted: i=1; AHgh+RpI+5s3Um7MJzW5smBD5t2PkvELnQSCWTdVZ7Jp/jTd4STS0VjciWOtZveEpZAhaB1gXW71o8iD/vbdcv99Hp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNL0nGnCDkBcdbeue5HXXkX1icGCPWE14qiuj0QafELlGgbOHH
	eJBSlZuMdK3aEnpPYRi4oGCwgrKr/2pVRREgLjJNUkXj8GuzDHrZk6UhJb2954bC/zYmpDm2vWJ
	mFgZKmfJLq60v6eUVmDBxGFkL+tr8O9CEcXPmyArctm8tn/rggqwdEVngk2u7DhTcnjs66SY=
X-Gm-Gg: AR+sD10Wq+pLnguhwt5kkLsNJp9Sejf89CekoGlCYG1QxPD+aVOomgPT4s4v+KeVDhD
	zI6/kN8nUg6Azk2aprdKlgPzr9yNUKVqEaRXzOiWH1miwv099h9OHqD63iQ0rMM0x0YdfjZQ7gD
	exHddAcFFJlJkZujU1TuF/BtN+SqGFE/5fJnvhZbDqI90OZN72Ez88pavqFZmAqvcwkQmzD6X+R
	5sfLXCkw/DkdCNc0Z71CHu8KkkOK1o4AfupexTMkysFHxm+pnbKFKJtZKaXqNQP4Xp0uZiaTXgi
	X3JoaXFtbWA/zPKF2s/oEVgd7DwgQhQExXDfFJOlJqE1nqALe8fY5kL9zVS61g==
X-Received: by 2002:a17:902:f651:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d37d581162mr19111115ad.8.1786577718843;
        Wed, 12 Aug 2026 16:35:18 -0700 (PDT)
X-Received: by 2002:a17:902:f651:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d37d581162mr19110515ad.8.1786577718418;
        Wed, 12 Aug 2026 16:35:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:18 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:49 -0400
Subject: [PATCH v6 03/11] dt-bindings: riscv: Add Zic64b extension
 description
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-3-c985af3256b8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2714;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=df+eBxBrANzUqAkDxq/LIOvp8cwE4dtT4e7eHOHJASw=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZpGghL0lKZNWVsyfs/b09AnNXKwq7Ue3Jb5z3bP1V
 bmp1L69HaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjCRVHtGhs7zvq3twu+tnrx1
 cD9TvWg1n87SC7vz+1NusSjfZ/ed2sjIcEBQY4v9Xc3WDZeKznt5ss3XPXZa67/EvvcOlyzzb9n
 t5wIA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfXzg6wlxyVk5L7
 1hbTjnHaVlSfhY971GHy5O8l94l144NQ/BIBIYF/kpN4IZaDpF8wBTOTWbyFUR/qC2tc8Te60Kv
 /qeKVQj+NPz7GdNwwvHHKLR7shWvwR0TTp4NxRtgNIIX1KCzrk0B7p6poJqGbz0gEy4amKFHEm+
 BKbqWqd00vt9LfU7EjNR2drB7xwlBZ0iZLqabBHwa81Riymp73+13VBn+EVcAqpEnuIpfnpplrk
 BrQjYAahuNgNWrRhKgyr0nJAVGYPNfnbY9Zb8m3ftKRFbH5z/8Do4rDR6MVRHTyvzSk6qTzhN/W
 VejsYEAosIoLZigxbA6qOqwujVT1IilVuBjdDkmipRUvCwV7kEKHerVbq2ULzP+4BXiahjEa0/X
 bfIig7/QJe23+rMNFQ2uXBTno0wgkiU69/eEN7nVedX4Rse6yMqjzIMrecNLPwGcVnsFZXxYcns
 oogBcRdKsTJsUCAeYVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX5HMDp5W/Um98
 IkxBPI+gCidPBlqHuzmkZzpnv6kRXwIN0H9CshNeIE+g6eoM6aFjjbsQwndxNiGDYsLOB8hvmt+
 g57Wf9PrrC5q5hA/vtuZTNCiKLgXa6A=
X-Proofpoint-ORIG-GUID: Slw2Jq7G-wBPclJGLScbS2iyRgV_ckQL
X-Authority-Analysis: v=2.4 cv=X5Vi7mTe c=1 sm=1 tr=0 ts=6a7d0337 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=B0juqsJzrbe9EOqzv1oA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Slw2Jq7G-wBPclJGLScbS2iyRgV_ckQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120190

Zic64b mandates that cache blocks are 64 bytes in size and naturally
aligned in the address space. It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions. Since
Zic64b fixes the cache block size at 64 bytes, also add a schema check
requiring any present cbom/cbop/cboz block size to be 64. The check
matches only nodes that use riscv,isa-extensions, so nodes carrying
just the deprecated riscv,isa string are not affected.

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: Guard the zic64b rule with required: riscv,isa-extensions so it
    cannot match nodes using only the deprecated riscv,isa string
    (same defect class as Rob's bot reported against the Zicbo*
    block-size patch).
v5: Commit message clean up, fix a double space (Conor).
v4: Insert zic64b at its sorted position (before zicbom).
    Update the commit message.
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index d4cde2a7b8b2..79491ef8f86a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -537,6 +537,12 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: zic64b
+          description:
+            The standard Zic64b extension for 64-byte naturally aligned cache
+            blocks, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zicbom
           description:
             The standard Zicbom extension for base cache management operations as
@@ -1211,6 +1217,22 @@ allOf:
           not:
             contains:
               const: zilsd
+  # Zic64b mandates 64-byte naturally aligned cache blocks
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zic64b
+      required:
+        - riscv,isa-extensions
+    then:
+      properties:
+        riscv,cbom-block-size:
+          const: 64
+        riscv,cbop-block-size:
+          const: 64
+        riscv,cboz-block-size:
+          const: 64
   # All three Zicbo* extensions require their block size property as there's no
   # default.
   - if:

-- 
2.43.0

