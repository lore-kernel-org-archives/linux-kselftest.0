Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FD345D92B
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 07:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456611; cv=none; b=eSm11Zyp6Yrov5pFOSRFl/sSTjjC1FF/JfP+EFsREDOc7ohSGvnHB8erp5+0If6ZzDTMjA9jvSUZkndTsyzdlYK0WvirvyXCG7olZaLTShjzplzD+h+KVgj+DK9meus2SV3XdYSKKOMuqK4y+UYl7HQC+Na+2IJVZ80RjM0O/ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456611; c=relaxed/simple;
	bh=ly0eko061Qlf/uDE0HQLjreuewjv2PPwW/vrF9/DA5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tCzu+KGz2Vc4Kg8y9UU89b8jERTYsT1GXMM+reGiBTdCSC4PGIi9stLxM72khkau6yQBkG1EdLxNR/DyCt1od45vkAK8YnSCY5ldpsWa0S8zVVPxflt5BkiivNiErcKwuMW2HGMF6d4/bNzIR76pYWdD6Fc3iFYHC8WRVZ0bEiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JG0KXhnR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bX2MQc3a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JG0KXhnR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bX2MQc3a"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZkET2792514
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 07:16:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fTqVRfaAxudbHUUsHz0djLyzEwtkEiMK6H/EzB30hZM=; b=JG0KXhnRe0WnZHAP
	iUwfZ62ONv6ZsdeAK6dTLq1BJcen0HiH6g3V1hiQ9+VnZNF13voELp9kDi+kXwCo
	SUdeDsE6FA+vxtStPRfFq6nRNdHCo9Xd34/Z5yALRpmTjlNwNSSAFTiOixo1iu2K
	mL8zZXy8vIPJ223PNqJpEZhDQyIb/n1aPh6qWUyMNa9wxpKBPf5taHKAa5nraqB8
	jkBUqlL0xzY0FibgASXsziXaHfkUV+aZczhzYtCfP3hYHXJCjyvJbpi/q1AyEuRQ
	whQ/sMJ2ROYjmH+irENNvIV59lQMzu+weiiE8tfi4TYAukhlnw3uhChigZe37Bon
	Eaukqg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtm2fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 07:16:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so8334767a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 00:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456602; x=1790061402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTqVRfaAxudbHUUsHz0djLyzEwtkEiMK6H/EzB30hZM=;
        b=bX2MQc3awKvcgs/OdGpoEyOSzl0T0SzEXMxnq+lhSWFLhxieVgCkGF1Z6w8n3WmKBW
         4njIBneY65hh/qwXxZ8OTsBAT+te/ZuuJn/U/07lPB5ImVDKM21ck9m06Fa835Gtah1h
         l9nv2nU3c2VsbsbK0dxzMz0LgBSByLlBeFOAPmKoYzGgUGtHGRxXPko4uhgrE8DvSnh/
         eQ+wEZtwu+60NTMD7ZlSZIq6vuoyGASGD23eXnCFHTmaaModX6TZsv5Gtx7G+/18Lqnp
         4wamj1prAgJweNQegZ5/UlufBHudU1VKbgH/6uAYEzbV40bMANF+8ye+w76CkESqmZMU
         2poQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456602; x=1790061402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fTqVRfaAxudbHUUsHz0djLyzEwtkEiMK6H/EzB30hZM=;
        b=GDfwT27pPqeI2Sg0LoPfRVi9kN/O8A1P1i4BhfzOk1krF6+g1IbgvjxbbOJVo+wJKz
         gl20vVjSggZv8b4llXRwAgsUmwj92QCq2tBRy9tuU0UDUEE+i0YKY6IHTgm5aXF6Cf+T
         jgubqm2gHVem+KCGSlhDl3IGtyO3v9GIGf5AjruwokA5QH38rbbgSXnCNR8bT+hvk+6v
         uoY4QC7Ib+/qkR9CFQ8nlZfxqVTtEUPAsAnYDmkl8OrQ1k3WekqkzjSkTFV4XK4xHHhv
         mzrmcXr+JHyKS2ODKA2NV6Big5zlONayK5LdrbxFUjM8sNe4U0m9ZqXziSoO144HXQlM
         nUQw==
X-Forwarded-Encrypted: i=1; AKwUvBxgWAPezYShKcviiZvQ+3BM2iZXUsJv7tfKb1WBQweGqp8RnBjH7hp7WqyXEky4ahaDbLBhpORR2h661QqVosI=@vger.kernel.org
X-Gm-Message-State: AFuF++l/cGYuFJgL+n+cfRWqb+neFW8GfZ2wCuxrN662w+9EEgbS1Nag
	MkLA+8BczdEiFooqa1NPcPbyHwjBBYKNDvounFgSN1xBLXjMWQJ5UMXsJe1VhQoNi1qy5e73lhr
	of2W0ocJcTdrEys5pL8KZWzHWE4c/VY7O+3KShmKoomX+6f4a0wi5Ogfae8RJlp+LOzG6tMs=
X-Gm-Gg: AYBFou289pU+ZgHaXITgXtpctNVePVj1HV4DzxDHeGbi0or1G1LOgm6Wt/QXjUVPF6W
	tK9LI+0awbuwvCUaEr4lKkiDldgbV03VDJQHYkw/d7SmTBFif4H2qrw661ePc6viXzmSe4wbmFz
	hBUFQYBV39d/2cl7ttyfj7J+L9ny/585t4IW/CFCpupuap2c0cnl1T6cWyvvJQtIedaLUCBpWHU
	ODCveb9AbhCaeg4pGvBTod/0BdspAjgj69WrAJ/BzuoASfNOixRGwX7bkyVg0tes2CmbwFslVJ8
	GpL7HNBYwApWjqOATuSoc4ACvdFXDnpE73xMJ/aX2KNtIlWG/4nw2wAfVzOK
X-Received: by 2002:a17:90b:5102:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39dec0bf7b0mr12098929a91.18.1789456601588;
        Tue, 15 Sep 2026 00:16:41 -0700 (PDT)
X-Received: by 2002:a17:90b:5102:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39dec0bf7b0mr12098875a91.18.1789456601134;
        Tue, 15 Sep 2026 00:16:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:16:40 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:29 -0400
Subject: [PATCH v7 03/11] dt-bindings: riscv: Add Zic64b extension
 description
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-3-aa35ebd9ae96@oss.qualcomm.com>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
In-Reply-To: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=ly0eko061Qlf/uDE0HQLjreuewjv2PPwW/vrF9/DA5g=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7bsm35G913HBN81Wzf3a3bs1NpjtdIlcEWMnePXp
 2bxH8y+dJSyMIhxMciKKbIcPtqSvfWVT7Tvc84fMHNYmUCGMHBxCsBEVjczMtzMub34xnGn9l7W
 /zcszmg/suqdseqESdThgMxjHitq5Scx/NNguprSlHnxx8zrkRXyn5eY79dXUuDZkRtiENp39/e
 2T4wA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa8f0da cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=B0juqsJzrbe9EOqzv1oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX3KGb3o9Zpema
 h9FPLkt2Eo5YNCoIjRsy92PJQcVBUHSRz4YYwhLJjNrON0RrL60Luhl6n9EUx+CTRLzAAYAqba2
 p8HQ65MweiwWtPfVSKt5c4mvTUOA3knn/gc2lUd0UfDFuZKJT7VbVrByuR1Z7WHsJJOS9Hax5xP
 cZOP2TVXM+8GCODKd8ocBGHVwmnXyfcyoJB+r/bGgNZc3hJyDiEO9/2UxrrjAtOxuriQQaZhuum
 VMkPuQQ4jeKxMNiwJI1dNSjZ9xzhJcpT54CtlcYsa7OBW45gkaaArTb9n+9s9AnIjdQje99/uve
 4YcdMGESO0OLol7K/QSBxBOI7XSdcbPufzDBEE5dimf+gc6JSmShXo+mnFJd5nhWfoF8OYtiPP9
 x//KoFJaaZJ82jk33aMB8HXaWO+7ErY7IYXo7NrlZlEiQHsbSmcyP3VmLVCshPj7sK/H8FiV2nN
 bYLmJ3x82bctI1l8ajg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX8SNjI8268xHF
 kmU86i94ivEmGFdPLwBLkcII7mT9DdwZDAcyV5Yzq9DXUzKjKd+ycroLtdsEIHPk/CBfXk2k7p9
 UxcA/kBHiiBa7C2exHNHFN8r+JwyUXc=
X-Proofpoint-ORIG-GUID: NgKlhZFdnvArFi8PYEZx0aDTQmLlupRf
X-Proofpoint-GUID: NgKlhZFdnvArFi8PYEZx0aDTQmLlupRf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102

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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: Collected Acked-by from Conor Dooley.
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
@@ -537,6 +537,12 @@   riscv,isa-extensions:
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
@@ -1211,6 +1217,22 @@   - if:
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

