Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CDF52F28B
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 19:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883530; cv=none; b=AN/qVXfB6XB0MlRusLVqkCDoIzjA3659kAO8rxfM9j+JJGtSoO3ML97JspgoDotPRYofI0iqIrr9vqboEadVWgc/udqlryJW1JxJov1OLXJAgaNrT6fa0OllX304a3LV/faB+RF2o15MHg9fE+GYCwWs1KzbCPaL7cHbX3PsoW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883530; c=relaxed/simple;
	bh=MrSXmZdvpiE1/bEayuyU4c5ocMTn0Rj/1+38q0B0xHk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WrMqYWn9mKoun6G/IEwoXQ9MAJkARyiijZ15fPhNFFF7HEVPnZFtHLHO1xMyHI4RVv5wa+lbQoQ8zKZs7p9HbkocL2wKcijschsgwOH6z0j+Wq083SFGYceMhtPTChWX6tUnIHajrt4sBbK7eSBLPnl0s1lbvVvhOXGPXflZEwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ByFZ56hD; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ByFZ56hD"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso3211223a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 12:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790883527; x=1791488327; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ABZ938N+BwrUnvWzaQZFv/PCXSFM2iXLE7WCZ3ELhKQ=;
        b=ByFZ56hDGsMp62BMyUIXPRl8FhpOk3w8dBT/te2Nxy00Cn/Va/LRjvWUcSXaXVs4cg
         t4pWMh+Tt5RgFFnfuLxdg3ieTJPD5a0i01Jwm2gPmGl93o6MmaFTf2RWtf0s93cLHKal
         ajKbySpMdctwohIRXYMFbdVEnpbgGWiysHAfbhiDZMF8TxYm0Hn2o1cjlr0DrqG0W9fa
         jEuCOGiViRBQYIULOIBcd6g5vw7vtS1Q4kY6LKqoBoqJ3ktO+zj71Fw5F5CEy5Y6Duy0
         3FZzCtj52k+w7NOWXtr/McCBCxGv78a1rqIWMQSd/RhsgC9WvUi7zJfMPSgynZ0OgZ/h
         Dh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883527; x=1791488327;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABZ938N+BwrUnvWzaQZFv/PCXSFM2iXLE7WCZ3ELhKQ=;
        b=artLFamzQ98xaYKe7Y4Ao/X8jNEOemOKJRSdDTX7UbLCNeCF6oGdLEw5E8ldvhQ6tq
         oh/uvBf/q2IDWUu9IapC9stCjdTrprW/iSZ9PEkIR89gC7n/SOyDx1JmkIdSXQL3d9hj
         uOh49ZqW56sENuCmRfmAWONqknov8msW+5uhVO6jSN3sRCv8lFr/HuhoYQFcDSCvLczI
         gNXpbOOn3izV26r99ykScNX0vgszTkmQ+Ipj+HAbkiNPqviJB1O+FdIey0kZVQ7mishy
         WvW5hgTRAXBxFbycckpqlxpBsHZXVsHqYqACXfl7erhXZHRE6vUZj+UFzZ+vc3OsRCFy
         uVZA==
X-Forwarded-Encrypted: i=1; AKwUvBwoe0NfxN28JPckf38Zrezmvp1XWlQj6si9Vl8kQDSm4SHq50ODaSlupr3yDuvpSMjc76+8i6M504umDuJV7+Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzpsuI5ng5OoF+FArUXv7WKL4/hS3poOdFjQiTWwxLwvMY7h5f
	or4rVoYd7RsqJbbkxfOOBesmguvRg1ckmpzHV/PYyw0is29WqvpLDdypbc4YHF/kvoc+20pi//o
	zM/46RQ==
X-Received: from plbd9.prod.google.com ([2002:a17:902:f149:b0:2e1:3498:c5bc])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:10c9:b0:3a6:dc51:ccec
 with SMTP id 98e67ed59e1d1-3a6dc51ce9cmr39607a91.67.1790883526427; Thu, 01
 Oct 2026 12:38:46 -0700 (PDT)
Date: Thu, 01 Oct 2026 19:37:32 +0000
In-Reply-To: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790883521; l=1611;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=nNPUtDDLL8ioadnHxWtAymAR4QeiExPI2Y33kr7rHIw=; b=h3xyWEzTeW0OqM2GHeGD3sihd2wfH9g0E9TgHGNRTcf18fvUVdzrRa5sWq90CdT/2ZU9M/A+0
 PQKQ1H1zjJpAooa/zRIzljVS+/PEkO55W1ALx5HMccRPnttGr6R9xe5
X-Mailer: b4 0.14.3
Message-ID: <20261001-tdx-selftests-v15-5-7c62a5d8a992@google.com>
Subject: [PATCH v15 05/23] tools: include: Add kbuild.h for assembly structure offsets
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

Add the Kbuild macros needed to enable the filechk_offsets mechanism to
generate C header files containing structure member offset information.

Tools depending on assembly code that operate on structures have to
hardcode the offsets of structure members. The Kbuild infrastructure
can instead generate C header files with these offsets automatically,
allowing them to be included in assembly code as symbolic constants.

For example, the TDX guest boot code requires access to parameters
passed in the C structure (struct td_boot_parameters). This header
provides the macros needed to extract these offsets from C code and
expose them to assembly, ensuring the two remain synchronized.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
---
 tools/include/linux/kbuild.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/include/linux/kbuild.h b/tools/include/linux/kbuild.h
new file mode 100644
index 000000000000..957fd55cd159
--- /dev/null
+++ b/tools/include/linux/kbuild.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __TOOLS_LINUX_KBUILD_H
+#define __TOOLS_LINUX_KBUILD_H
+
+#define DEFINE(sym, val) \
+	asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
+
+#define OFFSET(sym, str, mem) \
+	DEFINE(sym, __builtin_offsetof(struct str, mem))
+
+#endif /* __TOOLS_LINUX_KBUILD_H */

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

