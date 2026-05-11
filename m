Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166FE3C061D
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 23:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543320; cv=none; b=fXuae6f0hxQtBTmGbKHPLST/3NJWxhd6IwV2pslbYksNpyjH7Y/1GPbDtsSyEWNxSHWpYJG3Hx7pnYCyrkhIZsR50Y+ZZWfNj/NgeqD7pFmEa+3e23zlgxeFTUMVNzTWP0G3lv5rysoxvHmSEWXt8gO1I11TkSa8UKpqtm/mD+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543320; c=relaxed/simple;
	bh=21W6Ql13lrjgrDgG4oHa5rhHZslFZu4s8ImhCjMl8pw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ickIb/bg1HP+cMcTMXbEk//MPiQr30mjAT3s5fsmT5qZ8GxpkZQEDTlfxtEGqkz/oDyRYV3D9v/ALZ7EprnwSeg2826EtdTi0GVdUKvadfP2uSM7NnxolqaiqCP5cIci6RKjKrMDtY9uS539wbA30ztyS2dKgJrsoAbbXInK/a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DGhRHcFo; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DGhRHcFo"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-367c2d149efso3322325a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 16:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778543317; x=1779148117; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7WP44kmfFcYhlyRsivHdlontJq1i9E72JydBw+wZ7hQ=;
        b=DGhRHcFoRSbWLKENOCnbGVN6u2kvANDJj1uUOhONgntWUtPEEKUpXJaeQrfElEMgOk
         N0Iv8SPEr3NY/kpJv40UOM9DknWpgpqUbQcKXFGXeSfnOg89yED2/9t2ubqKgeQ7z8Tm
         5Sdg3lUCkmNuyQTmsj2cT7l//XqTHkN5ch2np2d7+kvU3vowjQ9KpugSxUQs67d2IMJV
         w5Uc+IXE9ex3FImVFsvcBhPxfiP3dYhA1+PMS1pgR3llekBVb/gClqelNHEn4HOYqlLS
         EPNQfCuWEsaoecSyMpo23Zojc21v8cpF4Mi+9uh2VdhRATEuRtmlueEGpZa/0TNdfvvP
         J2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778543317; x=1779148117;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7WP44kmfFcYhlyRsivHdlontJq1i9E72JydBw+wZ7hQ=;
        b=SWuaGsAhaepeyIfF0l9Cad2/4UP0zY0ed8sP1cvTmnA3p4wHouTt94OQ6BomkzpV0p
         +EQiH3m+ek1TBjuGe+zBMur9bld9CtTstKr5tLW7yEG5PoyYN+EaZRdH9wRp2z55gtnt
         HERyQkMXirHcIs4U6klb8kwkk+iN1rRplihflTuwx0KPfiNGC9Qjce7RYZetO63fS3V4
         BJEsDupcKML68TOsRKrqsau0oHzN6gd+Jquxk/sSP9Bd9j5Aq590JF6VpU+bi/yQ9zdE
         5oAGzLILApOPXebp+DPJiMSnrIHa/y+zLgujDvDA9POd4KooqoxIaPZY7PZv5xhqddYv
         9p8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9JFlwjy1CNlT97dKio06tH2yawked7LlZ7Ai/Be+yZ2WnyRbCkTzqcDwB8ZFSFrhZGC11LPnmGJt/JMI7VSGk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyck+CDCpXV53trEPsXTMwxtbDlrp4QOwoGTOj2KAGonEZcJlPO
	vKFdZ/8+Nkb2om1SMUub28cCHA+fA5o3W4NHjEHH4X2MrWZDVzyVwDi852sHcYXNpNijlrkTDzm
	jSBUYv3yu2Q==
X-Received: from pgjw1.prod.google.com ([2002:a63:fb41:0:b0:c80:15fa:8bd5])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b0a:b0:368:3030:4a65
 with SMTP id 98e67ed59e1d1-36830304d85mr7869135a91.13.1778543317042; Mon, 11
 May 2026 16:48:37 -0700 (PDT)
Date: Mon, 11 May 2026 16:47:54 -0700
In-Reply-To: <20260511234802.2280368-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260511234802.2280368-1-vipinsh@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260511234802.2280368-9-vipinsh@google.com>
Subject: [PATCH v4 08/16] vfio: selftests: Build liveupdate library in VFIO selftests
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-pci@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, chrisl@kernel.org, corbet@lwn.net, 
	dmatlack@google.com, graf@amazon.com, jacob.pan@linux.microsoft.com, 
	jgg@nvidia.com, jgg@ziepe.ca, jrhilke@google.com, julianr@linux.ibm.com, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	michal.winiarski@intel.com, parav@nvidia.com, pasha.tatashin@soleen.com, 
	praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, 
	saeedm@nvidia.com, skhan@linuxfoundation.org, skhawaja@google.com, 
	vipinsh@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"

Import and build liveupdate selftest library in VFIO selftests.

It allows to use liveupdate ioctls in VFIO selftests

Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/vfio/Makefile | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 0684932d91bf..7865b2aa011c 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -20,6 +20,7 @@ TEST_FILES += scripts/setup.sh
 
 include ../lib.mk
 include lib/libvfio.mk
+include ../liveupdate/lib/libliveupdate.mk
 
 CFLAGS += -I$(top_srcdir)/tools/include
 CFLAGS += -MD
@@ -27,11 +28,15 @@ CFLAGS += $(EXTRA_CFLAGS)
 
 LDFLAGS += -pthread
 
-$(TEST_GEN_PROGS): %: %.o $(LIBVFIO_O)
-	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $< $(LIBVFIO_O) $(LDLIBS) -o $@
+LIBS_O := $(LIBVFIO_O)
+LIBS_O += $(LIBLIVEUPDATE_O)
+
+$(TEST_GEN_PROGS): %: %.o $(LIBS_O)
+	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $< $(LIBS_O) $(LDLIBS) -o $@
 
 TEST_GEN_PROGS_O = $(patsubst %, %.o, $(TEST_GEN_PROGS))
-TEST_DEP_FILES = $(patsubst %.o, %.d, $(TEST_GEN_PROGS_O) $(LIBVFIO_O))
+TEST_DEP_FILES := $(patsubst %.o, %.d, $(TEST_GEN_PROGS_O))
+TEST_DEP_FILES += $(patsubst %.o, %.d, $(LIBS_O))
 -include $(TEST_DEP_FILES)
 
 EXTRA_CLEAN += $(TEST_GEN_PROGS_O) $(TEST_DEP_FILES)
-- 
2.54.0.563.g4f69b47b94-goog

