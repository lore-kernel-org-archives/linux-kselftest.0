Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922463;
	b=YynvRdY02ksLoOQf664Lm6DDMMObJMIdaWjBJ9WBN/b5zfQQk/MtXajj/ITa8x5/yccm
	 EI+6sq/Y6h4TfR+L7JK2l2KLVJ/X7FkRHEpPlFcHMr3Mjy7AmnS9+FJimfO/tBgWZfF4J
	 x6HrgMhXIEnaoVqMpNYLpCP3A05WWU+wxP2HyKaiUT7Mjeb4M5Zi7Rp8GIppOz+ZxzkxO
	 W/jvL/vA6SsgmYcpuf47wwEABQPC8d2enIm12ciKrvt5nXrDDnf6CCYpcLy78nXrzAIbv
	 6AFipvTyrcX2xetDCUejPXcpWe1UF7Hrx4D77gk4r1POvjTQ5VTx9cVSrtmG6kpabpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=tDICajUls+MVU3nlT8BKXeQcBxsJx76UetcWcsPTkIY=;
	b=WGG9M06Gflm+O9SrRxt2qDv2W16jBhdDugwBA2+tUatRoq1qMwqGwfEcL2RBkZryzhHM
	 GV49fAT3KdH2mNH3KDYNt4yO7hg2T+WvqLeB98w6OuGohjmfGnt9qtlJEJ2PH5MUa5xy6
	 /taXGs+fr1mA0IomU3EVihjTKUV6EKd6j2DPLN7DUIlr4wrch2SLCInj7zDJ0mTi7j00J
	 tJFwFYBCc4/p0TIm5i57KHp3AH9xy/sXm9JspUfrtNtE2eKFJ4SE059tWk0YtFy/Nfqu+
	 xlHdg24KV9p8LRID/i7MjmIeKIlzgolWWp595EMsuPVTVm/We6AJNiZShh6RgN7kBUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pmYE2HT1;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86366606EEA3
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 23:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86366606EEA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pmYE2HT1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eced5a4cb9so420855ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 15:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922457; x=1794527257; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDICajUls+MVU3nlT8BKXeQcBxsJx76UetcWcsPTkIY=;
        b=pmYE2HT1PcVqgvrHLgIWEZZ4qCR42Qv5bXVeM0Ng6q3xKckEHuH3f9g9uGfYCn99KT
         SHygWaI543l/yPFyrn/F0fmmf+vYazoCH7f/RyabX1NfE1QWfBh+tr5Vbl5PMVcBCwiv
         QTShbBl5edW/s9FoKS8LQ0+T8pPOC9aQGq1UTcC8X/vX+Vvp/pbwPH0aFYumdy0LK7Mm
         oHUAO0svgUzV3FogLfObgK91My4FlJ4kqk+eleB5xhz1FVypxOV6IK9AOHrN6FoqomWo
         FkjE432E8IR4YXhPER8IJ6hrX5jZYVlvucNTKMVcdszmG8c3wU926rCTXRyR38LULWGR
         J+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922457; x=1794527257;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDICajUls+MVU3nlT8BKXeQcBxsJx76UetcWcsPTkIY=;
        b=xAwAKa3tQKW+/UoyDQ4yP9neGxQho59JqaE0k8ur94NxajJSKLA+5pZAaM3JB2J9qj
         Xz/qbK0WZ/CN3poplk1dtet0fGG9ddtvr6p0WdsGev4DlzjJpuG07C3YcLgKI7+ulGAW
         aEvAKjXt7x5rzdSd0Oq9eWgTTvfXFoKUJsB+8s/7Kj1XnqPjqqoDbx4fwCTDy22xtFNk
         Rv3KAoZuqEDPpB/NvNwrLa4IFkWD9mMW4MymA7YcFsORu4pToZEDFb5YwceAAIIeYeDy
         jf6JJ95Bow16iopt27g7YsC4Y2q3APsiW1ToaZvGEqRkOXlWRET40DWeeO9trN7fYo2Y
         bj7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzz77fTM8lxS2BnFgxo8RKLw8eCqPuBxADLq5KmAbztSMtIuvoQ8Q3tHn/Ix7/wodEaw/lNntLQb6YnMHVbanY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qoof2AAg1SZafPW7xV9Y8+VosLoPL8a7B/LvlCOEFaBsEMH3m
	7O0JxQxxMxUq9RKWRf2cGWd2txY/OmBzIFCSoStgo3hHBoP1dJ/bu+B00QpDi8Xrk1jPSUTTTBu
	PVn3vMA==
X-Received: from plby6.prod.google.com ([2002:a17:902:ed46:b0:2e9:6f2c:71c3])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d586:b0:2ed:1df2:8b3c
 with SMTP id d9443c01a7336-2ed40bfdea1mr11999425ad.35.1793922456623; Thu, 05
 Nov 2026 15:47:36 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:48 +0000
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=1874;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=IUPFZFhS7USNqKMmulO0C0asUQ2Oci8U479LkW/s9KA=; b=AR5YKEO3dhz9+FQd/gbj96lSfiYyiK9uIPX1gpsBLe2AZJFI3pI8PL/ZgFBfiz3mTltPh4Eqr
 JHjwka7cH0lCTq6KIBdUR42ALzeVAoz1L0b2N2Rzd7iP7yvVyB1wpHE
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-4-2024e8fa517a@google.com>
Subject: [PATCH v16 04/20] KVM: selftests: Expose segment definitions to
 assembly files
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>, 
	Ira Weiny <iweiny@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Extract kernel segment definitions into a separate header for assembly
files.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/kvm/include/x86/processor_asm.h | 12 ++++++++++++
 tools/testing/selftests/kvm/lib/x86/processor.c         |  5 +----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor_asm.h b/tools/testing/selftests/kvm/include/x86/processor_asm.h
new file mode 100644
index 000000000000..713b6bc0aeb7
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86/processor_asm.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Used for storing defines used by both c and assembly code.
+ */
+#ifndef SELFTEST_KVM_PROCESSOR_ASM_H
+#define SELFTEST_KVM_PROCESSOR_ASM_H
+
+#define KERNEL_CS	0x8
+#define KERNEL_DS	0x10
+#define KERNEL_TSS	0x18
+
+#endif  /* SELFTEST_KVM_PROCESSOR_ASM_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 7bbc0df49a18..fe56df0c7aa4 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -8,6 +8,7 @@
 #include "kvm_util.h"
 #include "pmu.h"
 #include "processor.h"
+#include "processor_asm.h"
 #include "smm.h"
 #include "svm_util.h"
 #include "sev.h"
@@ -18,10 +19,6 @@
 #define NUM_INTERRUPTS 256
 #endif
 
-#define KERNEL_CS	0x8
-#define KERNEL_DS	0x10
-#define KERNEL_TSS	0x18
-
 gva_t exception_handlers;
 bool host_cpu_is_amd;
 bool host_cpu_is_intel;

-- 
2.56.0.455.g6c5a503b38-goog

