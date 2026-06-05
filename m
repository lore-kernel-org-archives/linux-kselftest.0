Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E9C3B19AB
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 03:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630442; cv=none; b=BgHmn5ukOSiDmzNlCa0y07rtfkwQ4Db1rfFuiankIUO61SGYQ/U/nTxeGqZKyIwT3HDbJI6vtACJB9XzyujSNMMtUFXFaLYoTlzzkH+SreISaJwQSSjLZukqX+89jqtCu9B1kEamuJvNYyiBYL9dzfxf0E3XzpFi4IASKxSZ5zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630442; c=relaxed/simple;
	bh=eU1fOM4eOd3z2yeGVKb+QlTsoAWC8tuz1WiFB/USShI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmEEXz0AxVOG65dv/EsmZVwnoNrEPxE8xevyrYPS0Br4mcdE3UI73Hg2ozJ10GcXTYBAERVvNSgL2Vn6dy052/JX8OmeTl67qfbQirsjzd7syKngR4HuO9S4mEmZOs0RfOtTEbB4m95iFA893cnhNrptdrL9e/Y950fAcZZK+wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=PfIkSFJC; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="PfIkSFJC"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-915aa0a9293so52384185a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 20:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780630439; x=1781235239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYmKPVlEdqw9nJIpln28SQxgNWXUbITnOaKq2Dm+DFI=;
        b=PfIkSFJC+zV/o6fdsI/6c3+0vJ0o0jwIIpnyxNvKze0ap7rp+yjGJrvLdY9QbEohFT
         Qwm2MCJZKPyHGXgPXHT0w0VK4JJUUboaQpsa5D9CgxK6olxY3ztzbr5o6OOaoVCe3e+I
         8zshjfRj0Gp5cXUcmFeBaaCSu6jd95Nzzj0fCty1RvrT59rrEWImby0ymEEIjh8Ad5Po
         6ERVqtLVOy6y4BI1bZboowhNwuZXMJKYt4EcleWES4eGY09Bpeq3LlhjD/14COipbQ+F
         9f0KsTt0nq03AIqxtbuLrS6tdsm4IO5ylKwCWE93go4VTTL6gbOJ9exGwdI3yPPXYajR
         zCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630439; x=1781235239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jYmKPVlEdqw9nJIpln28SQxgNWXUbITnOaKq2Dm+DFI=;
        b=ZF1CB6RavhV3vcQexnlMeyKozAFj6tMaP70JlcrMG3W6WLkDO/lVemg1d2ERilUxre
         0Cb+K0YFOOjwhzOvrE6DuqufhUiPw/eaqXBnBfm/Pxz64qgpxWbqdvbmzNQnMqdOmK/U
         VgGaLyD8HXs15t/hi9wujT5Iuy7c4K7n2EMgcoQiF7+f59G3zmpi9yG/GRxhcrodXlHM
         1T9VWiDG/RdEOc5u6CRWddBcMFCC7PPfLeIXpvB6dKkWzY8VMsZ3EwFI7E0qFeRrwVhE
         MhxCFt19xGz+pxpToTcUASKBzKukt5aAeQUgasVgYlILyzK6+zIjy0UtZlUP1TYBZEdJ
         nWYw==
X-Gm-Message-State: AOJu0YyNAVh0oPEzvW8em66VZLNSzf2iq8GWadprNvHJl4WbIUlcFau6
	6jRjpJlkJloHb7bvqODJWF6vZMlshm5Vha1mY+ON2gl+uMws2YbLqEeEc1xQf/vx8Xeh0ZURqcj
	IsjEZ
X-Gm-Gg: Acq92OFhjIWucMjvPdlcc1PHz7Rj8byajCR0pvUXUqI5I/16O5HmTsWhZJh+TfZqSGt
	TAoUzW0FIxCXyYAZrZpsKtlTs8ABLLE5BRh9JH8dvhxpqXNWGcR6e7QnWrunlkxVWB/8pEXuSTc
	ujh1Jbq+i4n5U5KQsqnKYFxz9Za8l7NO57ctg9sGuZBAaozjjADB1PFPlVPTtwZjynQKkFe6KFS
	gpyIchunn7+9WWvbbLjLdFR+6alnuBV2euQ1f0GgzZJVrVJZT07tWN3MI1YDeH6wZaWcH1Jt8/4
	pBTVJSvHYSVIMck58FiZ9m2bhrR0YdV/YRxmKuUTIz0kma9pqwqKYFw3eL4+n0IeJu7A5nz2gUn
	hQntiQjThMXFBM6j/hNmLxH4Fi4ueDhVxkzGOnreux5TxsFEG0D8Jzs6Lb4x8YfERG4GFIvUbUm
	czwnRiLRtsqq+m8SrwGVLyHhk4g5dOSHq5A7vIDhajgMx6q7hkeTj+QpVkNn1KTA==
X-Received: by 2002:a05:620a:450c:b0:8cd:d688:7aef with SMTP id af79cd13be357-915ad197c8dmr107318585a.19.1780630439344;
        Thu, 04 Jun 2026 20:33:59 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91589ea0bcfsm780607085a.0.2026.06.04.20.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:33:59 -0700 (PDT)
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
Subject: [RFC v1 7/9] kho: decouple radix tree compatibility from global KHO version
Date: Fri,  5 Jun 2026 03:32:33 +0000
Message-ID: <20260605033235.717351-8-pasha.tatashin@soleen.com>
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

Decouple the kho radix tree compatibility version from the global
KHO compatibility version KHO_FDT_COMPATIBLE.

Define the independent compatibility version "radix-v1" for the radix
tree KHO_RADIX_COMPATIBLE in radix_tree.h.

Integrate KHO_RADIX_COMPATIBLE into the composite root compatibility
string KHO_FDT_COMPATIBLE.

Additionally, document the new KHO Compatibility ABI under the
Documentation/core-api/kho/abi.rst section.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/core-api/kho/abi.rst     |  5 +++++
 include/linux/kho/abi/kexec_handover.h | 10 ++++++----
 include/linux/kho/abi/radix_tree.h     |  4 +++-
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/core-api/kho/abi.rst b/Documentation/core-api/kho/abi.rst
index b61363679829..6acdb7c85239 100644
--- a/Documentation/core-api/kho/abi.rst
+++ b/Documentation/core-api/kho/abi.rst
@@ -10,6 +10,11 @@ Core Kexec Handover ABI
 .. kernel-doc:: include/linux/kho/abi/kexec_handover.h
    :doc: Kexec Handover ABI
 
+KHO Compatibility ABI
+=====================
+
+.. kernel-doc:: include/linux/kho/abi/compat.h
+
 vmalloc preservation ABI
 ========================
 
diff --git a/include/linux/kho/abi/kexec_handover.h b/include/linux/kho/abi/kexec_handover.h
index c893b5045078..49ac4b47cc3d 100644
--- a/include/linux/kho/abi/kexec_handover.h
+++ b/include/linux/kho/abi/kexec_handover.h
@@ -8,9 +8,8 @@
 
 #ifndef _LINUX_KHO_ABI_KEXEC_HANDOVER_H
 #define _LINUX_KHO_ABI_KEXEC_HANDOVER_H
-#include <linux/types.h>
-
-#include <asm/page.h>
+#include <linux/kho/abi/compat.h>
+#include <linux/kho/abi/radix_tree.h>
 
 /**
  * DOC: Kexec Handover ABI
@@ -85,7 +84,10 @@
  */
 
 /* The compatible string for the KHO FDT root node. */
-#define KHO_FDT_COMPATIBLE "kho-v4"
+#define KHO_FDT_COMPAT_BASE "kho-v4"
+#define KHO_FDT_COMPATIBLE						\
+	KHO_FDT_COMPAT_BASE						\
+	KHO_SUB_COMPAT(KHO_RADIX_COMPATIBLE)
 
 /* The FDT property for the preserved memory map. */
 #define KHO_FDT_MEMORY_MAP_PROP_NAME "preserved-memory-map"
diff --git a/include/linux/kho/abi/radix_tree.h b/include/linux/kho/abi/radix_tree.h
index f4cc5c02f37a..89cd7eb4a91d 100644
--- a/include/linux/kho/abi/radix_tree.h
+++ b/include/linux/kho/abi/radix_tree.h
@@ -20,7 +20,7 @@
  * This interface is a contract. Any modification to the structure fields,
  * compatible strings, or the layout of the serialization structures defined
  * here constitutes a breaking change. Such changes require incrementing the
- * version number in the `KHO_FDT_COMPATIBLE` string to prevent a new kernel
+ * version number in the `KHO_RADIX_COMPATIBLE` string to prevent a new kernel
  * from misinterpreting data from an old kernel.
  *
  * Changes are allowed provided the compatibility version is incremented;
@@ -94,6 +94,8 @@
  * 4KB.
  */
 
+#define KHO_RADIX_COMPATIBLE "radix-v1"
+
 /*
  * Defines constants for the KHO radix tree structure, used to track preserved
  * memory. These constants govern the indexing, sizing, and depth of the tree.
-- 
2.53.0

