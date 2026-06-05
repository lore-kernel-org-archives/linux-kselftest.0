Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1BA379ED5
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 03:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630418; cv=none; b=Os+lmMrLQg5nsO0tozQZpaQ+UVKquxj1qa8+/Jg6q6yZJI/avWXaw4MRFfBeyaipXsvE5+uFXMtGgkZlfa14n/NOOX1G1ppTdqfTM9fPMUQR3fnUXAQwog4y5V87S8UuH5zXt/NZ3qAN3zMPKXYQUBD6kOteLXTLPGbAZawHvnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630418; c=relaxed/simple;
	bh=DtZ9V8MH8JsGyHu6CF1ttsD49Zp4ajpPdH0dtGBNsU4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JCsbYq/NKEORltQhy9BWKOxAqRQNjmevWoG0D5Xftm/EpawYZ9s/g+pCyQrp9ZntwfhmTnGofX3QYKrdMPbdwhbfQPY9Wc+dOebwnwbpwjdlor6SAEH5vhtDW2KRdLNJSVnODkAHa7vVJrMcdUHoqLPPF9vKVmD3zOEgJ7nOOs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=FxvLg3S9; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="FxvLg3S9"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-915336b83adso175773085a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 20:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780630416; x=1781235216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9VRMQ5Ef8ulqUN7FHiGBWdV1K/iIYqxWaAhgeSwRK0=;
        b=FxvLg3S9vw3x4H+gYi6tndasKxlu+a/73bv82RhwcMtzPyTrvG6tJgjLDQTRs0k+1L
         rnKnxSUupV4jDW2OalnjkH+evs0mBBOdYE2OvkeriJMvJlA7CD+sW8t4A/FLmHQT1Fvq
         DCgCr/dmmu9YkqRbLo4KCB/dvPxw9vAWt9RtqQshMqXpr99ux+XZ0oVPia+fkGXzS4Ef
         qAEWO9+lcCBs6zAOdUyYW9IBbrCJWQz6nBhIHwOu8RlSjK/l6EtnkjzNHAZZ693wL7qH
         +owZzr0A7a800rgIRLNhdDFY4wluap92g8dp7h6iXDazGzguAtQT1KqEnkizCD8NkedQ
         NhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630416; x=1781235216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J9VRMQ5Ef8ulqUN7FHiGBWdV1K/iIYqxWaAhgeSwRK0=;
        b=TYFutVwqY21eo7fKmUSkKwSEVJevzi5rS1yc5MkoyoDmgH/pdmnBsSPZKUaN7sWnaE
         byLfSx+Fyg38azwRbwtW+2HHKuJ13HtVqJNH9GeBYbbUd/qwwCqGnOOtM/3/CqdXata2
         nTcwrPVEIkApLr5zzWuCFgqZalUzEcUcncT3YqNt1CGHDfgfbQ7YDEjElhrmm20vShe/
         5dKSO0c6zWaYn9hhprFMX7SwU9VJQDRDVjahtnhWUY8b9BVjTz2pVSflTy/05oAFk8Kv
         LwGF+0+WO2xmZgwROeJ9vf8TFBhP76lZbOHIbgg8zWoSa3MIqlu032AwjULHIfw8CxoQ
         XBUg==
X-Gm-Message-State: AOJu0YxMoAlTVUcuwsEiiQDMqW+XWm3vN44JYVVH7hR0+GoOg166pKWr
	7eLFsfnxlEQJNSCB0vGUf00saIUIwihHpY6RYxSNyweKfdCwt7OgWOa69eUomrWKr0stoKZXWdz
	9LS/C
X-Gm-Gg: Acq92OG5EH13jq6CkGDctqiXA+cuZPt7sDWq20mB8i5/YpJKCNHucxuEh6cMym+BArT
	gXwz90ZjsHxEeDiezEb0C2MbndQGlHd1tWITRpPxz1UIEIe3fNcbP4WCkQwPolkohN+PZUe3mwf
	2oLj/AjVgfOlZ6vSDIS+fyhq4Ydfse9izOaOQNQst117UckIkl8htlCniBMOj0Z7XlE2Q8mufF0
	RYSta5vBhm2AYN1rScfr8b1XfE1CrnTH3jRHPtbsZsIhyivMiCHWCBQXBGOOamrRefLzhDK7z+E
	NQn3uVMmmPoPbq76kOAGjCO8UlX4B3D4MvLSQypf19CApMBvxYklxVThwVYCBakZ4t+MSXiYU0K
	VHuV/N7YLwE5PWt6RabvmZlMkne7WWeHhl9MVFL1uNe9sTyCr1urmm3hPLu3wb/kKROMG/vnLoU
	I4iwtekMZUCRoQvO+KYPESEALb0CBkW2E/fbX4XgbIqYFsicBh2em8Y29FhpOMVA==
X-Received: by 2002:a05:620a:3910:b0:915:7f9f:8d97 with SMTP id af79cd13be357-915a9daef8bmr376847085a.53.1780630415906;
        Thu, 04 Jun 2026 20:33:35 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a37c645sm743050785a.30.2026.06.04.20.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:33:35 -0700 (PDT)
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
Subject: [RFC v1 5/9] kho: move kho_block.h to kho/block.h
Date: Fri,  5 Jun 2026 03:32:31 +0000
Message-ID: <20260605033235.717351-6-pasha.tatashin@soleen.com>
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

Move kho_block.h to kho/block.h, organizing it within the existing
kho directory structure as more KHO data structures are introduced.

This is a pure code movement patch; no logic or functional changes are
introduced.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/core-api/kho/index.rst       | 2 +-
 MAINTAINERS                                | 1 -
 include/linux/{kho_block.h => kho/block.h} | 2 +-
 kernel/liveupdate/kho_block.c              | 2 +-
 kernel/liveupdate/luo_internal.h           | 2 +-
 kernel/liveupdate/luo_session.c            | 2 +-
 6 files changed, 5 insertions(+), 6 deletions(-)
 rename include/linux/{kho_block.h => kho/block.h} (100%)

diff --git a/Documentation/core-api/kho/index.rst b/Documentation/core-api/kho/index.rst
index a10b10700fb9..4a5477221fe4 100644
--- a/Documentation/core-api/kho/index.rst
+++ b/Documentation/core-api/kho/index.rst
@@ -95,7 +95,7 @@ KHO Serialization Blocks API
 .. kernel-doc:: kernel/liveupdate/kho_block.c
   :doc: KHO Serialization Blocks
 
-.. kernel-doc:: include/linux/kho_block.h
+.. kernel-doc:: include/linux/kho/block.h
 
 .. kernel-doc:: kernel/liveupdate/kho_block.c
   :internal:
diff --git a/MAINTAINERS b/MAINTAINERS
index 920ba7622afa..9ec290e38b44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14208,7 +14208,6 @@ F:	Documentation/admin-guide/mm/kho.rst
 F:	Documentation/core-api/kho/*
 F:	include/linux/kexec_handover.h
 F:	include/linux/kho/
-F:	include/linux/kho_block.h
 F:	kernel/liveupdate/kexec_handover*
 F:	lib/test_kho.c
 F:	tools/testing/selftests/kho/
diff --git a/include/linux/kho_block.h b/include/linux/kho/block.h
similarity index 100%
rename from include/linux/kho_block.h
rename to include/linux/kho/block.h
index 93a7cc2be5f5..2b9d5a080a6a 100644
--- a/include/linux/kho_block.h
+++ b/include/linux/kho/block.h
@@ -7,9 +7,9 @@
 #ifndef _LINUX_KHO_BLOCK_H
 #define _LINUX_KHO_BLOCK_H
 
+#include <linux/kho/abi/block.h>
 #include <linux/list.h>
 #include <linux/types.h>
-#include <linux/kho/abi/block.h>
 
 /**
  * struct kho_block - Internal representation of a serialization block.
diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
index 0d2a342ef422..6cedcd36bfd2 100644
--- a/kernel/liveupdate/kho_block.c
+++ b/kernel/liveupdate/kho_block.c
@@ -23,7 +23,7 @@
 #include <linux/io.h>
 #include <linux/kexec_handover.h>
 #include <linux/kho/abi/block.h>
-#include <linux/kho_block.h>
+#include <linux/kho/block.h>
 #include <linux/slab.h>
 
 /*
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 64879ffe7378..349f6d141873 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -8,9 +8,9 @@
 #ifndef _LINUX_LUO_INTERNAL_H
 #define _LINUX_LUO_INTERNAL_H
 
+#include <linux/kho/block.h>
 #include <linux/liveupdate.h>
 #include <linux/uaccess.h>
-#include <linux/kho_block.h>
 
 struct luo_ucmd {
 	void __user *ubuffer;
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index b79b2a488974..01c0ccf09919 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -90,8 +90,8 @@
 #include <linux/fs.h>
 #include <linux/io.h>
 #include <linux/kexec_handover.h>
-#include <linux/kho_block.h>
 #include <linux/kho/abi/luo.h>
+#include <linux/kho/block.h>
 #include <linux/list.h>
 #include <linux/liveupdate.h>
 #include <linux/mutex.h>
-- 
2.53.0

