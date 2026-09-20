Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617773DB31D
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888798; cv=none; b=dODB5NSqzapIKLZQK9rDYovASjdjgtltAsWimxZn41rOBwavgZ/5wGWum+rTYTAwQDqLjkkQt3o7iZxiodWhoTScDbR1Y2e2fZe6PwHWCXVaIOAyWansF4/AqMF4hEgujmlSyhMYAXT4vtDAZI8H1wZOoZVMnQuDDUBXyX1BIVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888798; c=relaxed/simple;
	bh=LiWE+wlkueULRI6+/+fF5gGTm3Y2rs+sPskRz14DADA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ma+a2XcrxxDZA4nIXQCiQNtLuXyLBlbtBhNBiOODF+1ac0xi1BHvWIIKxX1Y4Yhji7RzYunzu4ULfX7bGPQZ0EmYsYpWHMxXMeyrbNNLTw4CZUmK78mae3wnKP2rvk8Y7u2vkjd4uO1IXwJxJ9cAtUlYfd9aPgDh14oUb/gfI3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjXAMP09; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XWCpHIdt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjXAMP09";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XWCpHIdt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K54lXV1609024
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 07:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRrOS3qQ0Zhz1BrEtOqvhhXHAjA7eetTPAsY7CT/3E8=; b=VjXAMP09Ggey6wVW
	k6Wt82ZlJOTex+hbBMd3dQfhZo8+dT3hRgGPgLTO03P0vlWf6CSebHvPUqrqlMYz
	r0LBVqeMrUldbHdaXaL2Q9PA6vhgM1FSSaNdfkMDzSNfNwVTNGYoKMQgREVD4oEz
	2pK/8NAV2m6ldCV+aEZpLxSLmDnww3jwF0/rlCuKMNDcCKFlDmyB0jD7YaSYQ9o3
	am8PGPsE4fQL4RXLSLWI/bBpRsH3jDQxLOP3YN6sl+cMYhgxa6pOkM9KB+ryMJfA
	zDkltq4Cor+m19iGEuTEuAr0CXAOZg40ds836ZGC0f4Fjykb4RdgKlJGL3fljJam
	M96+7g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjm32fp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 07:19:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3734d06dso37131685ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 00:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888795; x=1790493595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRrOS3qQ0Zhz1BrEtOqvhhXHAjA7eetTPAsY7CT/3E8=;
        b=XWCpHIdtvbFygfRrBQyQuZZm8JVCpOPVx06dPAcYsCf7CcZyidKt8Zh2FuEZAWjoE+
         H2kum444kz74xlQaRRq8x/lclTDnJKBmjmLDmuIeltda8frUvWRryEQqk2fJmIc1NSjC
         lwG4V0/X9d/v+nAW1ACVzaXiZamNIWd/wfMn1xTW9AqsHXdmBaFQKIrbT8eDqJM86ESY
         RuEybbeH3AbzIp59LRRLE0P4xcBmPkcQumPRKc2bqca1XNSh4flrBGDkH+VsBoyx2h0Q
         Jn1T7zNtBpoX3kx71lDjyGNG5czHhBJHMarwqouDt+9geG1RsWZ9yp5zMA/OGrQpvV8s
         V8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888795; x=1790493595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRrOS3qQ0Zhz1BrEtOqvhhXHAjA7eetTPAsY7CT/3E8=;
        b=GITaEUSy+xn37pLKXNJYr0Nf7mHa9BNsNEMivjHwuU0hntQvdv9L3R7DqS/emIGLoP
         KqfYhXmPJDLaJUNwIPYEeOUD0MUH4k+EjdjinVEnG43G1bD8jgZj+VeWlXhSsxTbMRQ8
         I5TAz5tl53hxwjN2ULpHNOmFyzI3Mr2k30I3YBEqnZhSM0z3BIIwM3/+3NlZ+WVJO4cz
         IsY76whuqkS28gCJpCB7JXhNEmCCLB1HjSmdZh6uS+0cJnOo6L5/XAz4FVJKVkBKCsjK
         TDE3aWO7uqanJ6/H2RWQLZZULQVmhupKeSkWaEyU7E5uZdyfWn8lDFlhiStlpI0xqbvS
         Gelg==
X-Forwarded-Encrypted: i=1; AKwUvBw+aiV3sHJ2ClxYF2n+xSG+aP+zoTryFpRK+jkAdivow75O8mREGxk8EzhoILJBMPLqLNJlXHK4BlqZP978QWc=@vger.kernel.org
X-Gm-Message-State: AFuF++m+4NbQFECjs8LqwSuzNjBwJ0wp9f7li8pKlL98rlu8bTxBR7if
	5WAMhQW9/RAWbLY/uzuAKHGailMLO/gT65w9kWGRq/c2RDMflCFiLdaGn8GI2TVr+yS9Djyt+SH
	c22pjAawDsMqvrirwy7wTLyndmLivGKQvRqJWHXuedBDelvjq2f8epXHB4WwBq12QaWLI3SYdfI
	mnw9TI4w==
X-Gm-Gg: AYBFou3GbH/6pWRFvWPDljhQaBgaveI6wCSL5rnd/2WXNshqKIlkKHfqlIcVvDaUvkm
	o+LdHd79SHxEMMrDZNIhGExGws7OI7f6CJiQaI76I9QSWF/UDqxM4x9z8dHkl5wapPuh1olpKMk
	/YAibiwHpRqzjaBaJAn2T34L6NSGmIlfQ5sy4A36OT8C4TkONGfyo5oTNISmOQHDhg5poMcYTRK
	tLwM4dUaqn2HdRfc1kyGPLKgjF8/qEDsMh/ecsPTOlYnauLUwvJSjHMDpCvnUDEa0EbRwAyLlBT
	GeVL+B53E/HO94qkyqNr8DaXzly4ushUORT9VtTnAbfZC5mu7ZZKXY5AWTo=
X-Received: by 2002:a17:903:1988:b0:2dd:c053:c20c with SMTP id d9443c01a7336-2ddc053c2d3mr61371235ad.40.1789888794689;
        Sun, 20 Sep 2026 00:19:54 -0700 (PDT)
X-Received: by 2002:a17:903:1988:b0:2dd:c053:c20c with SMTP id d9443c01a7336-2ddc053c2d3mr61370925ad.40.1789888794067;
        Sun, 20 Sep 2026 00:19:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:19:53 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:29 -0400
Subject: [PATCH v8 09/11] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-9-5f14bc5c23d3@oss.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
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
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7913;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=LiWE+wlkueULRI6+/+fF5gGTm3Y2rs+sPskRz14DADA=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HafmauqU2LZqJ+c/N9MOjGGbJlTzae0Kab799Tbq9
 U963Js7SlkYxLgYZMUUWQ4fbcne+son2vc55w+YOaxMIEMYuDgFYCIHNzL8L/q0t3Sb5GvWB5pc
 lid9NCp13pw9rFGgPaXNJlrjsprjNkaG/TXq919aTmKzmN8eOS0yi/uY9jk9ppLdtne6A9WslVd
 zAwA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: Ax3jEoBylcEokgmH2EW5hJ39p4jC1_7M
X-Proofpoint-GUID: Ax3jEoBylcEokgmH2EW5hJ39p4jC1_7M
X-Authority-Analysis: v=2.4 cv=DtfDa2/+ c=1 sm=1 tr=0 ts=6aaf891b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=2dgCOJfQ_T_1aLmlT9AA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfXyOqhHxwiGNOq
 F5J6VDmLIw745FX3deiTLjmWjCmTnrk3C4/WfyDQkiJ2P0rlyAzhXX6RkWd4zONa0FqzCBwJcLu
 kfuCjEGJKzBkdx98XS/bky5Twv+Un2O510/qDK401XStJz0WruF4KSMoQ8h/QZQcgBlmirP2S+T
 2pyYxgO/XiobkFHVQZ/ooxWt2XZlZOIgWjpdeXpH7Wb5PRl/oT9vr3bOb95DdomJ9KkuVoAF17n
 P19JYh59jR9ViD0xy/UmNzX5UzKMD4Vra0zMfBvfA//FPlYpGlc8o+jyNsBaSTstqZDJJITQJf+
 yIPj1nZimTjYYX77eguYNC+vDHkLSvoo/O95Eufq7i1EYgiLKPm7vavZkcjLIs5wykC8/K5cIe8
 MvV+n6eXjbZ0HiV/+6Jp+ZM3Pat+o/rE58orb8yeoZZqtk1E7WvpFdJBM3zd2YSso7L5ebgyBD1
 DvzIzsbFlLj06LpXhXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX3V82Hbb5k1C3
 wE1O1O9XKDVPs7Ds7DBXS2bOkFVnDSMc02NrwjjBSHqba+YNaCoTbE7UvWWUaWQ4wVvgajJ3Fio
 rBKd9u+WCwO1rL4lrFePsJdNDF/i+/A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104

Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
(named profile-class sets such as IMA and RVA23U64), computed at init
time by riscv_init_isa_bases().

Register riscv_init_isa_bases() as an arch_initcall. That is late
enough that core_initcall(tagged_addr_init) has probed senvcfg.PMM and
populated have_user_pmlen_*; without that ordering,
riscv_have_user_pmlen(7) would still return its default false and the
RVA23U64 detection path would always bail. It is also early enough that
arch_initcall_sync(init_hwprobe_vdso_data) finds the bases populated
when it snapshots the hwprobe values into the vDSO data page.

Consider this as the cache that subsequent consumers (hwprobe's
RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
can read without recomputing, which keeps them consistent with
each other.

Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8: Add Co-developed-by for Andrew Jones (Conor).
v7:
- Register riscv_init_isa_bases() at arch_initcall, ahead of the vDSO
  hwprobe snapshot at arch_initcall_sync; v6 returned 0 for
  RISCV_HWPROBE_KEY_BASE_BEHAVIOR through the vDSO.
- Keep riscv_isa_bases static; add riscv_isa_base_available().
v6: No change.
v5: No change.
v4:
- In riscv_set_isa_base(), reorder those __setbit(RISCV_ISA_EXT_X,m)
  lines to make them conform to the order they appear in the RVA23 1.0
  Profile.
v3:
- Add a blank line before the subsys_initcall() registration (Andrew).
- Set the local ext_mask with __set_bit() and test the mandate set with
  !bitmap_subset() (Sashiko).
- Require the Zic64b ISA extension in the RVA23U64 mask,
  instead of open-coded cache block-size check. (New, thoughts from Andrew)
v2:
- Implement riscv_init_isa_bases() that runs at system init time,
  after tagged_addr_init() populates have_user_pmlen_*.
- Split RVA23S64 placeholder into a future patch.
---
 arch/riscv/include/asm/cpufeature.h |  13 +++++
 arch/riscv/kernel/cpufeature.c      | 113 ++++++++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b2..89c64d42ee745 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -25,8 +25,20 @@ struct riscv_cpuinfo {
 	unsigned long mimpid;
 };
 
+enum {
+	RISCV_ISA_BASE_IMA,
+	RISCV_ISA_BASE_RVA23U64,
+	RISCV_NR_ISA_BASES,
+};
+
+/**
+ * struct riscv_isainfo - per-hart ISA state
+ * @isa: bitmap of ISA extensions this hart implements
+ * @isa_bases: bitmap of profile bases this hart conforms to
+ */
 struct riscv_isainfo {
 	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
+	DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
 };
 
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
@@ -130,6 +142,7 @@ extern const size_t riscv_isa_ext_count;
 extern bool riscv_isa_fallback;
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
+bool riscv_isa_base_available(const unsigned long *isa_bases, unsigned int base);
 static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
 {
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index ef3133a52c0ea..126d5466a6f4c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
+/* Host ISA bases bitmap */
+static DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES) __read_mostly;
+
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
@@ -81,6 +84,26 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
+/**
+ * riscv_isa_base_available() - Check whether a given ISA base is
+ * available or not
+ *
+ * @isa_bases: ISA bases bitmap to use
+ * @base: bit position of the desired ISA base
+ * Return: true or false
+ *
+ * NOTE: If isa_bases is NULL then the host ISA bases bitmap will be used.
+ */
+bool riscv_isa_base_available(const unsigned long *isa_bases, unsigned int base)
+{
+	const unsigned long *bmap = isa_bases ? isa_bases : riscv_isa_bases;
+
+	if (base >= RISCV_NR_ISA_BASES)
+		return false;
+
+	return test_bit(base, bmap);
+}
+
 static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
 			       const unsigned long *isa_bitmap)
 {
@@ -1350,3 +1373,93 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	}
 }
 #endif
+
+/*
+ * Compute the set of profile bases (IMA, RVA23U64, ...) a hart
+ * conforms to, given its resolved ISA bitmap.
+ *
+ * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all harts) is
+ * used.
+ */
+static void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
+{
+	const unsigned long *isa = isa_bitmap ? isa_bitmap : riscv_isa;
+	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) = { 0 };
+
+	/* IMA */
+	__set_bit(RISCV_ISA_EXT_I, ext_mask);
+	__set_bit(RISCV_ISA_EXT_M, ext_mask);
+	__set_bit(RISCV_ISA_EXT_A, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_IMA, bases);
+
+	/* RVA23U64 */
+
+	/* Supm with PMLEN=7 */
+	if (!riscv_have_user_pmlen(7))
+		return;
+
+	__set_bit(RISCV_ISA_EXT_F, ext_mask);
+	__set_bit(RISCV_ISA_EXT_D, ext_mask);
+	__set_bit(RISCV_ISA_EXT_C, ext_mask);
+	__set_bit(RISCV_ISA_EXT_B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIC64B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_V, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_RVA23U64, bases);
+}
+
+/*
+ * Populate the host ISA bases bitmap (riscv_isa_bases) and each
+ * hart's per-cpu isa_bases.
+ */
+static int __init riscv_init_isa_bases(void)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		riscv_set_isa_bases(hart_isa[cpu].isa_bases, hart_isa[cpu].isa);
+
+	riscv_set_isa_bases(riscv_isa_bases, NULL);
+	return 0;
+}
+
+/*
+ * Registered as arch_initcall: late enough that
+ * core_initcall(tagged_addr_init) has populated have_user_pmlen_*,
+ * and early enough that arch_initcall_sync(init_hwprobe_vdso_data)
+ * finds the ISA bases populated when it snapshots the hwprobe
+ * values into the vDSO data page.
+ */
+arch_initcall(riscv_init_isa_bases);

-- 
2.43.0

