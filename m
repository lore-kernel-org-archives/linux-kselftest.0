Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90693B19AB
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 03:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630454; cv=none; b=TUC8z6iOVY95fangDfwB4nrzPcawJRIfrsyN+x4JY/Txzl/ktVx4yaXcPLDWEW3btqjkitOmbSy0DhO7XX5/jG7IxAuEcaAFMQhuMwZr88Y1dwHQLkMhbagdXRCPFjmewphR/qZ7Mv4bzdi2TduqoUg8B5pLi8kUhBA56Sl2ddg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630454; c=relaxed/simple;
	bh=gG+BMzTQAvQ99ajXilaSRudbxpmfCpeFzhzw+IUPT7Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eOzd0y/Y6o4z38+cYxfTbuv10TkQTOY0+A8y1Wx6md57FtauEzqyxr8LnXLzn3yK8cq7vUCLZvlu521jgKY/hz+uBBigV9+SEl8OrLa0oOlVLEFSD32A164z/5SDdLqBUc6jbguxITIdp/na6vQjMNoSq5DfGkBJ3kbLDIiKpc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=lGJL4ynJ; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="lGJL4ynJ"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-91587626a3eso182710085a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 20:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780630452; x=1781235252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YcWKgEizOcY9z0vq5q3df4Dwqk/3q2KHCFvnTeL730=;
        b=lGJL4ynJqM5hV2myVR4/CaQ0T32pZ5fy4ZVzaNNabzCaj0xXm9co9facJb0a2boji3
         YRtpNZVdrcCoqWRh9LL9YTI2nquCLecmsJIlqWuDItCpG+rKuV9/7ZPbD6iFxR38AJvT
         J1lVBTiaj3eVEiBBUOJgeGygq2+gYEDXHVib157pFnbR6g9gEgmdUYN1pJ1GhLBHduuD
         gK5ZJ/V5sfQ/jUgQrkaXHmoIbvlzEgn32w/bgr7MKuetzuDz0kWPGZdlywMtQxtRqfKK
         VbUU+5fBF7+KGKd5T7YUlb9Gt7KpZd3sk2X82RC5eBYOjA2naZWxpoqVtUDYdXx9IPSS
         VAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630452; x=1781235252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2YcWKgEizOcY9z0vq5q3df4Dwqk/3q2KHCFvnTeL730=;
        b=nri4jQcQVs2uvZhdlZiep11i1a7IEAMHdXDbiEg36ObTxSWY6jCLim6C3EHoiHWC7n
         CNF959poLK6mk2N00tjY+bpu29oP+xkAEh91OsxrLnmbKEr1JRmQJeridxCamjpSmAWJ
         6JcbKeuOZlXNWr15Ll2O3l0TUm0IBOINsWbb4Mg2ODaHTXYpBNpzH7Tzc910leaLEdXx
         Bo72+XVGjMvjZ9gKx2FlR4ibJxdbqcCprbDcll5vs5k7qICftsxfNvdF5DKV1+P7lewG
         VxGKq/Rg/KqFOY6ElZ2eak8vEvj3tc77+Rqu26l5fL+HkOcRf/G9wPqH+NhBsroPCNBu
         uUsQ==
X-Gm-Message-State: AOJu0YwpCj4hOPZqqym1EjDSlKRltmo/fK+MWYYsobk0gJyjeQDgDNgz
	PNGfkFbkgGObF83l5JFoWQVyct7PKhtwuERtvSE+69rCL79v4Nvz+Xd5CEKEmSuxSFVTZ+0DqPo
	YRTnN
X-Gm-Gg: Acq92OG63wkV7bPOgZo4jpjYQmWg76oiHEPOISuExX/ddj/GF5upNm2B9h9iZ8Ziomh
	G1q2V0A+fI90cAuURdJxExDm9DQT2XCzE6b2EMjgtvr7GEeyVuH+hKPxPx0iA++vSQLurH8c8Bb
	+Zp23qAZCIA/F5djCi/xozI5K96kWqh4wkB0O/vKgOcKt2nEVLZrlye6rbzjaz7ETKHGvQS1sUc
	JJD0dk2i2OILks+/dNuyqirJOHOFvSuVfoq2bNvTELbGU260mDHviHOY1OTaAgw/BWJVBW30mzJ
	ZftJuTQVp14RShDu73je0CMCwbdB6HeNbBf3SQv7dFvzmUl/zCor7bzP8WItALyTvbo9A9uRIwB
	Bsb/3hR5QdZLZyQZSQfM/xeZuErtdBi4uSuCDbbnfxQO1mcuDPqAgdWezFg99d4o3Zi2/LYGig9
	Ms9LivleCrYMT3CfIk4ErXxXFDzRS1E8zs9Djl1JT3E3KpzzPZXkFD7xNuhrKktA==
X-Received: by 2002:a05:620a:f0e:b0:915:a953:4b93 with SMTP id af79cd13be357-915a9c4b267mr362733285a.3.1780630451754;
        Thu, 04 Jun 2026 20:34:11 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00b474sm768496585a.10.2026.06.04.20.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:34:10 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	jasonmiu@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	ran.xiaokai@zte.com.cn,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [RFC v1 8/9] kho: decouple vmalloc compatibility from global KHO version and update memfd
Date: Fri,  5 Jun 2026 03:32:34 +0000
Message-ID: <20260605033235.717351-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605033235.717351-1-pasha.tatashin@soleen.com>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Decouple the vmalloc preservation compatibility version from the global
KHO compatibility version KHO_FDT_COMPATIBLE.

Define the independent compatibility version "vmalloc-v1" for vmalloc
preservation KHO_VMALLOC_COMPATIBLE in vmalloc.h.

Integrate KHO_VMALLOC_COMPATIBLE into the composite root compatibility
string KHO_FDT_COMPATIBLE.

Additionally, update the memfd compatibility string
MEMFD_LUO_FH_COMPATIBLE to include the vmalloc compatibility dependency,
and add a static assertion to verify its length limit.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kho/abi/kexec_handover.h | 4 +++-
 include/linux/kho/abi/memfd.h          | 9 ++++++++-
 include/linux/kho/abi/vmalloc.h        | 6 ++++--
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/include/linux/kho/abi/kexec_handover.h b/include/linux/kho/abi/kexec_handover.h
index 49ac4b47cc3d..f048bc95fed3 100644
--- a/include/linux/kho/abi/kexec_handover.h
+++ b/include/linux/kho/abi/kexec_handover.h
@@ -10,6 +10,7 @@
 #define _LINUX_KHO_ABI_KEXEC_HANDOVER_H
 #include <linux/kho/abi/compat.h>
 #include <linux/kho/abi/radix_tree.h>
+#include <linux/kho/abi/vmalloc.h>
 
 /**
  * DOC: Kexec Handover ABI
@@ -87,7 +88,8 @@
 #define KHO_FDT_COMPAT_BASE "kho-v4"
 #define KHO_FDT_COMPATIBLE						\
 	KHO_FDT_COMPAT_BASE						\
-	KHO_SUB_COMPAT(KHO_RADIX_COMPATIBLE)
+	KHO_SUB_COMPAT(KHO_RADIX_COMPATIBLE)				\
+	KHO_SUB_COMPAT(KHO_VMALLOC_COMPATIBLE)
 
 /* The FDT property for the preserved memory map. */
 #define KHO_FDT_MEMORY_MAP_PROP_NAME "preserved-memory-map"
diff --git a/include/linux/kho/abi/memfd.h b/include/linux/kho/abi/memfd.h
index af310c0c9fdf..24ecbf48cbe1 100644
--- a/include/linux/kho/abi/memfd.h
+++ b/include/linux/kho/abi/memfd.h
@@ -11,7 +11,9 @@
 #ifndef _LINUX_KHO_ABI_MEMFD_H
 #define _LINUX_KHO_ABI_MEMFD_H
 
+#include <linux/kho/abi/compat.h>
 #include <linux/kho/abi/kexec_handover.h>
+#include <linux/kho/abi/luo.h>
 #include <linux/kho/abi/vmalloc.h>
 #include <linux/types.h>
 
@@ -89,6 +91,11 @@ struct memfd_luo_ser {
 } __packed;
 
 /* The compatibility string for memfd file handler */
-#define MEMFD_LUO_FH_COMPATIBLE	"memfd-v2"
+#define MEMFD_LUO_FH_COMPAT_BASE "memfd-v2"
+#define MEMFD_LUO_FH_COMPATIBLE						\
+	MEMFD_LUO_FH_COMPAT_BASE					\
+	KHO_SUB_COMPAT(KHO_VMALLOC_COMPATIBLE)
+
+static_assert(KHO_COMPAT_ALIGN(MEMFD_LUO_FH_COMPATIBLE) <= LIVEUPDATE_HNDL_COMPAT_LENGTH);
 
 #endif /* _LINUX_KHO_ABI_MEMFD_H */
diff --git a/include/linux/kho/abi/vmalloc.h b/include/linux/kho/abi/vmalloc.h
index 87650e1dd774..1847b82e147b 100644
--- a/include/linux/kho/abi/vmalloc.h
+++ b/include/linux/kho/abi/vmalloc.h
@@ -9,13 +9,13 @@
  *
  * The Kexec Handover ABI for preserving vmalloc'ed memory is defined by
  * a set of structures and helper macros. The layout of these structures is a
- * stable contract between kernels and is versioned by the KHO_FDT_COMPATIBLE
+ * stable contract between kernels and is versioned by the KHO_VMALLOC_COMPATIBLE
  * string.
  *
  * This interface is a contract. Any modification to the structure fields,
  * compatible strings, or the layout of the serialization structures defined
  * here constitutes a breaking change. Such changes require incrementing the
- * version number in the `KHO_FDT_COMPATIBLE` string to prevent a new kernel
+ * version number in the `KHO_VMALLOC_COMPATIBLE` string to prevent a new kernel
  * from misinterpreting data from an old kernel.
  *
  * Changes are allowed provided the compatibility version is incremented;
@@ -36,6 +36,8 @@
 #include <linux/types.h>
 #include <asm/page.h>
 
+#define KHO_VMALLOC_COMPATIBLE "vmalloc-v1"
+
 /* Helper macro to define a union for a serializable pointer. */
 #define DECLARE_KHOSER_PTR(name, type)	\
 	union {                        \
-- 
2.53.0

