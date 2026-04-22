Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A188D383C8D
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 08:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776845106; cv=none; b=Wv/KyLqCtmDw+75pnzWY5RjYA+SOubhna4tOiFnpoOSoAzEXvDVKOj3rxqZLaoaEQkHxqVT/DGa8cQCseRDPS9bHSO5HcDWXOlgCmFe0mJ2zqg2jbdsLCvHQqdvtvAjgfg2ffWXzMqUFeF9cnVcSjB05bbVQYWN4cqXulrlQVt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776845106; c=relaxed/simple;
	bh=wED/8uiDYXQ3er+mEA5UyDwO3Aj8eeu5M6WUxw3jp/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ir9QIVRCbUJlZekLw7ylfGE1xIC1Oudh3e2IEKpUpF/o3VvDsIOgAxu2xLWpuPzzK3QRFYinA8A8DaXEQRE4VHMT10JTl1q6W33zIMOqh5Mcoh641y57WTgSYQRYkFSjP2mZ2JEMxTRDIDbRm0Ol2ZtxIocyGDsBAURC4sEepgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ij9Kvs+s; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ij9Kvs+s"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so4909168a91.3
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 01:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776845102; x=1777449902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7P3WPkfA1Saa+jmrVSo3FMd6D9WCAJMGXoYkKyQ3YxY=;
        b=ij9Kvs+sABGBtTcGicPL7jlFPr+Jqat/53tmFgxCbE68EQKqGDzpsNGgFFHJvu+iym
         30tafpAnqtryg8O5mHMPr+YXOpBeIIKrz0/wptFcxA7/X4UPD4105YfAb6sOicozFTwb
         GO4iOtRu0+zLVIHw+pW31bPv2y/TVdU5vQv7ddiD2q1c8eJFDW5ZRRpFKXF+gK6qErzX
         67FqI6I5HWKPtJUzrZ3LtsHXKsay9hqVUVQlL620uf7DjBy8P1SKMJFNZ+YztIRHwcrx
         lDoLzUMjxCv54YfXh32KerH5Xvs2INgD8hKxveBkoOFBedBy8PX8mlmRvx+OxtgJLodt
         uOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776845102; x=1777449902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7P3WPkfA1Saa+jmrVSo3FMd6D9WCAJMGXoYkKyQ3YxY=;
        b=G9BXqUInbrHGJA8Sx2Qa6D7yFGtwAzs6/UVHU7G6C/LqERPwmLwdQ2dHFh4HtKFmZM
         F2SAfu065+HJ8AVNGMQ3jhKALSxq6F6OW4XIpSqmKhBvcm6uwMaXjLkrUeQ8CstYszIc
         lKUDQUx0DvsyLPEoq5HYEKR7JyDTC14gsZ57T4WzIHQukqAoplkFJudwqfmcoInbCJJj
         C3cq5FFQkO89NWr05hPEUgcQ+JcYuIcP+5pGHGIgztNNIriVKzNzwDbLetD4KqtVlR6I
         KdXIrfvUgkH/yjQ+L5X42lmxVIsZPEhFYQPxihbK/xKUH3RpcrNNcP4+jZwk3+4+vrvr
         0E0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/X/fRmJYhREmZ7qTbTU/ApQ8VVaNRyJZ9D9vOtTKSSqpk5nnvahXRTHN+dxf6M5E0kCHIafhv9TY/LTGdQJ9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC1MiwMb7Zh0pxuU+9RhBdgI2/5cM4+XDmoRkYwiniS98jcMkN
	yK3DNupG6lj6aElAbPk1IqRzZ3OC3tJAUSKoKSrq2o3230BvnoErsPvFPxGIw+Paafiw
X-Gm-Gg: AeBDiet3IiGHSaEofDRrqi1oJsQRqSlcmxyf2GwP+M+oHYRL+pezMv09XIgtOBtHvEr
	dS/bnGAsK/k7HQUyC1/1aQEU3f2EJZD40ZoMZDwm3drZ27G15ypJHckew8rvcfiHlHYiCGHZaOR
	h4/PpGjW+LytkPrTpEC9n1gRZq5VD81ZwkZzva9CZ6PYOOaVsn8jNm+xU3UdislXdfRIcRJWEl0
	QMPPXEdqSlfCJUfNKnZtDbTZjIyeUoYlsbp9GjtOsEqFXopygIW/8iOTCR6Co3QI+a+MVZ7Y46p
	VRIA2s3fZ0fllgOuvN56Gxwuwopo0R+yU7n526qZKoSLzOkhqmVBwSc/XNWKJI2QMphKEVPSYxo
	75lH4wRdeAd3aRXR/nsrcpreRJ68gbTmfyxloFKtVCkv8bQcxwqI2jvkvWhhbCiNKWgaeZ6poML
	YEvu+jNFYkhhY1Y4z8gMbx9R9PFekwKQ8w
X-Received: by 2002:a17:90b:4b44:b0:361:3224:2f65 with SMTP id 98e67ed59e1d1-361403bdd07mr21489530a91.3.1776845102478;
        Wed, 22 Apr 2026 01:05:02 -0700 (PDT)
Received: from thoundrobot ([43.154.64.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fb9b121sm8508494a91.5.2026.04.22.01.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:05:02 -0700 (PDT)
From: Li Wang <wangli.ahau@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] selftests/mm: respect build verbosity settings for 32/64-bit targets
Date: Wed, 22 Apr 2026 16:04:45 +0800
Message-ID: <20260422080446.26020-2-wangli.ahau@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422080446.26020-1-wangli.ahau@gmail.com>
References: <20260422080446.26020-1-wangli.ahau@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 32-bit and 64-bit compilation rules invoke $(CC) directly, bypassing
the $(Q) quiet prefix and $(call msg,...) helper used by the rest of the
selftests build system. This causes these rules to always print the full
compiler command line, even when V=0 (the default).

Wrap the commands with $(Q) and $(call msg,CC,,$@) to match the
convention used by lib.mk, so that quiet and verbose builds behave
consistently across all targets.

==== Build logs ====
  ...
  CC       merge
  CC       rmap
  CC       soft-dirty
  gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..
                -isystem /usr/src/25/tools/testing/selftests/../../../usr/include
                -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi
                -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE=
                -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests
                -m32 -mxsave  protection_keys.c vm_util.c thp_settings.c pkey_util.c
                -lrt -lpthread -lm -lrt -ldl -lm
                -o /usr/src/25/tools/testing/selftests/mm/protection_keys_32
  gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..
                -isystem /usr/src/25/tools/testing/selftests/../../../usr/include
                -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi
                -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE=
                -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests
                -m32 -mxsave  pkey_sighandler_tests.c vm_util.c thp_settings.c pkey_util.c
                -lrt -lpthread -lm -lrt -ldl -lm
                -o /usr/src/25/tools/testing/selftests/mm/pkey_sighandler_tests_32
  ...

Reported-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Li Wang <wangli.ahau@gmail.com>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
---
 tools/testing/selftests/mm/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index cd24596cdd2..6195770eba6 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -216,7 +216,8 @@ ifeq ($(CAN_BUILD_I386),1)
 $(BINARIES_32): CFLAGS += -m32 -mxsave
 $(BINARIES_32): LDLIBS += -lrt -ldl -lm
 $(BINARIES_32): $(OUTPUT)/%_32: %.c
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
+	$(call msg,CC,,$@)
+	$(Q)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
 $(foreach t,$(VMTARGETS),$(eval $(call gen-target-rule-32,$(t))))
 endif
 
@@ -224,7 +225,8 @@ ifeq ($(CAN_BUILD_X86_64),1)
 $(BINARIES_64): CFLAGS += -m64 -mxsave
 $(BINARIES_64): LDLIBS += -lrt -ldl
 $(BINARIES_64): $(OUTPUT)/%_64: %.c
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
+	$(call msg,CC,,$@)
+	$(Q)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
 $(foreach t,$(VMTARGETS),$(eval $(call gen-target-rule-64,$(t))))
 endif
 
-- 
2.53.0

