Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EFC3E6390
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 18:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777919709; cv=none; b=LCgBF/XfqRotvOc1elc63WG0G0kpz70C+b4aIA85g9gB+YZijZxLPrWMgOKmM5lfK1RhsipomVgEYI8kFyiSPOPMs3bRKV9g0XWeqFVLmWsfYWWOoudVU7n03FVpu3h3r/4ljQ9eA5ioS7F7SDujO20W1Y0/KNZVWp1zyFNe7pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777919709; c=relaxed/simple;
	bh=bsQGxHVEbWFMcU98H+Usr8BrpVvRynWHs4uJrO7ovMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FXoXFZnrGkgYEQzXvB93ejrL249gNXl52SjbmQSfWrCrWDMJHP7RXNNSZKh2fTwGKk+bFanHW9ixuGq3VReRLpg5BIFt7uSifq6jv2ljn/0edWcaL5P3q1ABgJnnkWUCSjK6bD41bgxDJZh+OTKFioVsm6vkIe7biJMoFge0/70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KiBYygIP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KiBYygIP"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso1675800f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 11:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777919706; x=1778524506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0N/qPZtLyDR9JYuc7La36zdYueKjOOpudQKv7E6xcTI=;
        b=KiBYygIPPai1vF+9X0SB07esZAWTaQKmjxFHNkYc4QE0+vz8SBRxccSmmqXDEkg0GF
         9VGXzD855YEVK+1JPh8scdB3Lis+eJIuO85aPkix2eLLMarw8ViSIbbJkeIdiobcvjxi
         9JxFxp6Q0mxanW4Vl/iOhAIAD79cGM0dyfzj9tK2+17utWMqAHpqN6Z9rN+1e1xj2nMO
         6WTwhf/JJNrUGkIVzwUYrD/wcRUl1bv+vwJ5qelesjToKFZWCYuJTcaIp6H+MHhd8JCP
         qVvIswOx2HDhmEDAMb7yXpAqfv4BI7VMRBR8HxZZhTsnyHzIol6biH/1XZSrkcRI7mQ5
         Yxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777919706; x=1778524506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0N/qPZtLyDR9JYuc7La36zdYueKjOOpudQKv7E6xcTI=;
        b=UhZPPJB20V/kJGY6qqSPS+ADGy28p/f/gyu4m3V6/iNFGu3PHMgi+q3shd9dBF4D8y
         5IKmRxaNaieW+l72CO6Fna9YABhvMyRfyuOcCE63Mj3sQCYN1H0LMT9q3e/D/wwsOlM4
         m0LDeZMfnaLfaxKuBNjQGsMI8eD6B2nlyQbrcCar2pC1SJ2QW7YLhLYatcrhGzSq4azc
         00lRXyuh4CXNxXZVKeTCmyZMQMe9hWpyEBULPZNuCF9T82VAIMnPOiN74sW2xOBhPjdJ
         StC47JOMgP7j1rp85FrAZ5+PnZK7BQMuRXVyKNC/jeycdGRxXR1MgAmuMQDpMgoZO2HR
         8jMg==
X-Forwarded-Encrypted: i=1; AFNElJ9cPK4ShS+0WNiifuQlrLTOlhTj1KajQpiggX1FlT88LuDZtRpXdKjFVshPGYuppN0F8Ctm/tuGQQ+ClpbqKJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlhjUXRQuhz0vUBE8zwPQR3MMMJR+Nygl9rWGdtlJ+qrP+lbCT
	JCDKjF1eLl7chaNNMJLTSRGUNmM6JVHTg7WAc5vPcyOQyhu9xyWQUzQnICTpfwIZelY=
X-Gm-Gg: AeBDietS4vEXb2lQEba35iA1DRJaBbEi0LxQG+qWFJs8UhQWS7qsJnfu127jOIR0MWY
	hjn2G8y1wryPyEiw30iLhGal099XHwEZuxqg3VbnDLV0J8rzzcmqvFcsRer6rMpKk0PxVPMKdAL
	Dye/71QTZ4ES+V9dou+eoTZSR59pwaWSDta85mdrRRTZXGaCxy+nRPKXnF+zSxLm5lDZjpOy2Xk
	cKkLb/9As0FfvZcDACIG1BZjxZk0+fPxJeWlOSXlYiZ2Hw5ybFbEqOoT4IicdDWCpFD7q/Tmwa2
	vFiPfyCFOKh+vq2pSzZk/GW+JOCXKbQnUbut1+pBA3Pu+5ZgrAYPXykFnnWkn0bY1aB2MBOAerI
	SPGaD58w427VgUbcttZWk2800OfpuvNBkJoBJ/lyYWNZ1twUsRmfDfNAnslSp6kDXDkUAq5zspS
	BtkUmXQaG1H5KsAFDTh/QHICU90bH+rZyJEA==
X-Received: by 2002:a05:6000:220e:b0:43d:77f4:7145 with SMTP id ffacd0b85a97d-4500476f6e2mr142276f8f.19.1777919705746;
        Mon, 04 May 2026 11:35:05 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76eddsm26745511f8f.34.2026.05.04.11.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 11:35:05 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 04 May 2026 15:34:42 -0300
Subject: [PATCH v5 1/6] selftests: livepatch: Check for
 ARCH_HAS_SYSCALL_WRAPPER config
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-lp-tests-old-fixes-v5-1-0be26d94ab9a@suse.com>
References: <20260504-lp-tests-old-fixes-v5-0-0be26d94ab9a@suse.com>
In-Reply-To: <20260504-lp-tests-old-fixes-v5-0-0be26d94ab9a@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>, 
 marcos@mpdesouza.com
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777919697; l=1999;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=bsQGxHVEbWFMcU98H+Usr8BrpVvRynWHs4uJrO7ovMk=;
 b=MxLHXzKClp0LDuPuXWIAf6yyKxcAG5hsA/Gib7N3J9fRNg90pqPKEo1UQYlZ1lFzPt/35dy61
 O1/NpYWScH1AxUDieaBSRacr5/ujVHk/CBbZ0ESktAHxMRbzEXutBZ6
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

Older kernels that lack CONFIG_ARCH_HAS_SYSCALL_WRAPPER config don't
have any prefixes for their syscalls. The same applies to current
powerpc and loongarch, covering all currently supported architectures
that support livepatch.

The other supported architectures have specific prefixes, so error out
when a new architecture adds livepatch support with wrappers but didn't
update the test to include it.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 .../livepatch/test_modules/test_klp_syscall.c      | 27 +++++++++++++++-------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
index dd802783ea84..0630ffd9d9a1 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
@@ -12,15 +12,26 @@
 #include <linux/slab.h>
 #include <linux/livepatch.h>
 
-#if defined(__x86_64__)
-#define FN_PREFIX __x64_
-#elif defined(__s390x__)
-#define FN_PREFIX __s390x_
-#elif defined(__aarch64__)
-#define FN_PREFIX __arm64_
+/*
+ * Before CONFIG_ARCH_HAS_SYSCALL_WRAPPER was introduced there were no
+ * prefixes for system calls.
+ * powerpc set this config based on configs, so it can be enabled or not.
+ */
+#if defined(CONFIG_ARCH_HAS_SYSCALL_WRAPPER)
+  #if defined(__x86_64__)
+    #define FN_PREFIX __x64_
+  #elif defined(__s390x__)
+    #define FN_PREFIX __s390x_
+  #elif defined(__aarch64__)
+    #define FN_PREFIX __arm64_
+  #elif defined(__powerpc__)
+    #define FN_PREFIX
+  #else
+    #error "Missing syscall wrapper for the given architecture."
+  #endif
 #else
-/* powerpc does not select ARCH_HAS_SYSCALL_WRAPPER */
-#define FN_PREFIX
+  /* Do not set a prefix for architectures that do not enable wrappers. */
+  #define FN_PREFIX
 #endif
 
 /* Protects klp_pids */

-- 
2.54.0

