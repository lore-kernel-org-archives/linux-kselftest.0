Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4B73F39E5
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 03:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630432; cv=none; b=Wex5FsZi5FIv5pvEiddq8K+86QRKVERyngHHrx3Al2zg9KRbDP3WyOrBASMA3kFh7xyUQfxU55RIiS4QpuQ9f+sjzSkoaoE6NGWMllp2IEC4sZF/nGmcZmMeC3IJyLLWDKJ8Znxa0Vk3bhAe68gAuONv+8+9SZu+j9pV8TkBnr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630432; c=relaxed/simple;
	bh=56yqutzR1Yl+W9ZaMZOq3iC0gVO2m06Akdi9QmEvda8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r30YMs2Fnla9jaM55AFacSoG3B1kkt2Zr3ANmNHKGq//2jklS/5jD7IrZkb9PA20HR98AA6gFW1sJf+asjX+VTDwy8Kn1jmtfXBmMf3aq82Mj1jDu0BJP3871R8y4gfYwpyYlsC+nTGAmAII2yWg8chF9aGrirE6gPyrz74OrYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Rxx5Y45N; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Rxx5Y45N"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ce9ddeddefso15025626d6.0
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 20:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780630428; x=1781235228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTLNc6RdVPC/3p3BVrwRRbnK/J4mwuIt5WmEdvU+mDY=;
        b=Rxx5Y45Nr6Qb/IkTNurQAvapSkN1zF+IDadotoPc26sHZlQGD4jHANXejHiESOV9Tq
         TlojiYVCl8Dlv7MWiqou+hknf5jFihysVbH0VHJR2PG1ujZEZ5ScOGWI6kb82B96Vjp4
         sEIrtXtnr7yM795K1MVkb45w51DKwkqL7rzUsLw8pAmU0UoCPKEJdpczZrfUXhL10+SH
         i+8FviEA1lJOdGBZKEbmqcA4/qszZShQT0j3hOKlKe9x9VOmcO5S8EDJDItARn42kdQq
         frM8zmp2HqI4Wmf/QRDm4aGhUlhrogHKczK/vkuW21yqO916T+pwrrpTXFZBOU7JPzc8
         lO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630428; x=1781235228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MTLNc6RdVPC/3p3BVrwRRbnK/J4mwuIt5WmEdvU+mDY=;
        b=ZINyDUhHn8WEwrGuK3vPq2lnjfb1PtEtvkfO4ecp2v13vzSgvFKi/aiVJdGNn8nqMb
         Fkcjl4ZtYW2eSNsIFTHWIUAIOEDLie9CozuDu6jQ02f7Y6/mBkY9jcZ1nffyH4a/S9xB
         BkuxJSMhIEDUgffET9sVejXfpPOeoD0HyIpL8ssRyxmM9k5HErMsUSh/nXcUUsn7jhg0
         lGj29y6abRH6zLN7ZoUuvyq7U/k8sonu1vI20rDe1PM4Xj8VNvEVKAdoc8BBmtCsUfYe
         5bDtz1ZnadbfIjHIVIDOXE8tRQU4TWtnFNG8iyYHsFtgZAJHzDRRv/yeTZIyWrYU8ZYL
         j/yw==
X-Gm-Message-State: AOJu0YwktGQpFXUNN8hQ7Kjhjzl62enQKZ2QTacgS7Is5UGg3z/V6XZj
	QMyqwWbpYs/nC1Z6Y7MhvRp+EpTyvRrXXaD4cUsw6sY0b5KlcYahZn/Hy5tmvQ+0dp02FvdY/I4
	qKKmj
X-Gm-Gg: Acq92OGTyGK+hLWXdP+SAp6sUXpqcWBEZ9ql3tj8KHkfRoqDlmQyvMeVckGGkrA6pnf
	MaM7PtEpAmvve/kAM9Hak7191jxJ4rUt9EcfN1pQlm7pj4TF9C58wHjIs2nCsPM/wG/kA2q1so+
	wtdY2nCtC8IvvLBg952Y35ykZr8LKt4tVeBknpUArvJeNutdT2wzkR5P7CPaSGmz4axQQQTns8w
	ptepoLkFP/K3/PHk3lCvLbgQanhW/p2bXkkT9gCAtvK8QeStTBK6whq8gfenkfJfpJNZVYbud6e
	jZWNbpd5hZL5Etrdbs7OXl4FWwXeYqUFDC88Vbuv3IwsH+YR8niaWo6vTxsPT6I+gFAZfoxTiur
	gyH8P3OlQtYoGFpQyoOKQzcm08wXsrBRERdBFKK5LkEz5tlDdfQKmH3LIEfVGDyPNhMk9lMYmgC
	6tMQFdINCrv+kzQBeIDttxjr75Il1h3lWootiaXzwKP/PwNod6dMVClPESNT7Xrg==
X-Received: by 2002:a05:6214:8088:b0:8cc:58f2:339f with SMTP id 6a1803df08f44-8cee601673fmr33023096d6.16.1780630427604;
        Thu, 04 Jun 2026 20:33:47 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccd9fc7dsm70512926d6.5.2026.06.04.20.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:33:47 -0700 (PDT)
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
Subject: [RFC v1 6/9] kho: introduce compatibility helpers and decouple block version
Date: Fri,  5 Jun 2026 03:32:32 +0000
Message-ID: <20260605033235.717351-7-pasha.tatashin@soleen.com>
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

Decouple the block compatibility string from the global KHO version.

Introduce a compatibility helper header (compat.h) defining utility
macros for constructing subsystem compatibility strings, specifically:
- KHO_SUB_COMPAT() to append sub-component compatibility strings using
  a semicolon separator.
- KHO_COMPAT_ALIGN() to align compatibility string sizes to 8-byte
  boundaries.

Define the individual block compatibility string "block-v1" in block.h,
and integrate it into the composite LUO compatibility string (LUO_ABI_COMPATIBLE)
via the new compatibility helpers.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kho/abi/block.h  |  4 +++-
 include/linux/kho/abi/compat.h | 33 +++++++++++++++++++++++++++++++++
 include/linux/kho/abi/luo.h    |  8 ++++++--
 3 files changed, 42 insertions(+), 3 deletions(-)
 create mode 100644 include/linux/kho/abi/compat.h

diff --git a/include/linux/kho/abi/block.h b/include/linux/kho/abi/block.h
index d06d64b963be..95d13cf677cf 100644
--- a/include/linux/kho/abi/block.h
+++ b/include/linux/kho/abi/block.h
@@ -14,7 +14,7 @@
  * This interface is a contract. Any modification to the structure fields,
  * compatible strings, or the layout of the `__packed` serialization
  * structures defined here constitutes a breaking change. Such changes require
- * incrementing the version number in the `KHO_FDT_COMPATIBLE` string to
+ * incrementing the version number in the `KHO_BLOCK_COMPATIBLE` string to
  * prevent a new kernel from misinterpreting data from an old kernel.
  *
  * Changes are allowed provided the compatibility version is incremented;
@@ -28,6 +28,8 @@
 #include <asm/page.h>
 #include <linux/types.h>
 
+#define KHO_BLOCK_COMPATIBLE "block-v1"
+
 /**
  * KHO_BLOCK_SIZE - The size of each serialization block.
  *
diff --git a/include/linux/kho/abi/compat.h b/include/linux/kho/abi/compat.h
new file mode 100644
index 000000000000..25edd964c390
--- /dev/null
+++ b/include/linux/kho/abi/compat.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+#ifndef _LINUX_KHO_ABI_COMPAT_H
+#define _LINUX_KHO_ABI_COMPAT_H
+
+#include <linux/align.h>
+
+/**
+ * KHO_SUB_COMPAT - Helper to append a sub-component compatibility string.
+ * @str: The compatibility string of the sub-component.
+ *
+ * Appends a KHO safe data structure compatibility string to a sub-system
+ * compatibility string using a semicolon ';' as a separator.
+ *
+ * NOTE: Sub-components MUST be added in strict alphabetical order to maintain
+ * a consistent and predictable compatibility string value.
+ */
+#define KHO_SUB_COMPAT(str) ";" str
+
+/**
+ * KHO_COMPAT_ALIGN - Align a compatibility string size to 8 bytes.
+ * @str: The compatibility string.
+ *
+ * Aligns the size of a compatibility string to an 8-byte boundary for use
+ * in ABI structures.
+ */
+#define KHO_COMPAT_ALIGN(str)	ALIGN(sizeof(str), 8)
+
+#endif /* _LINUX_KHO_ABI_COMPAT_H */
diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index 288076de6d4a..b502670cd2a6 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -58,6 +58,7 @@
 #define _LINUX_KHO_ABI_LUO_H
 
 #include <linux/align.h>
+#include <linux/kho/abi/compat.h>
 #include <linux/kho/abi/block.h>
 #include <uapi/linux/liveupdate.h>
 
@@ -65,8 +66,11 @@
  * The LUO state is registered under this KHO entry name.
  */
 #define LUO_KHO_ENTRY_NAME	"LUO"
-#define LUO_ABI_COMPATIBLE	"luo-v5"
-#define LUO_ABI_COMPAT_LEN	ALIGN(sizeof(LUO_ABI_COMPATIBLE), 8)
+#define LUO_ABI_COMPAT_BASE	"luo-v5"
+#define LUO_ABI_COMPATIBLE						\
+	LUO_ABI_COMPAT_BASE						\
+	KHO_SUB_COMPAT(KHO_BLOCK_COMPATIBLE)
+#define LUO_ABI_COMPAT_LEN	KHO_COMPAT_ALIGN(LUO_ABI_COMPATIBLE)
 
 /**
  * struct luo_ser - Centralized LUO ABI header.
-- 
2.53.0

