Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0967738CFEE
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 20:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286791; cv=none; b=ZcGhq+ngUzh53ZXJjJQKTjtFoZHLqWvJGbsog0zVl9MTS1TASSXXO2EnLnbYh4DVaaKtrRb0gKGAmnGBI7ZBNrmjJnMnRdZtB3Lz1+T9WoTwm+zkCDWL8miu6S/XPiw7BhhDlnMNln0wgX1HOVnShh8DXuEG6e75kdrZq33B4xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286791; c=relaxed/simple;
	bh=Dr4PihMoMr3qRKNSDl7IrxVJ9HeBlG623zgxVHaeaQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o7xlPJ7d87+8IYRa40ZWwZryACj0rn2fjx2LsphQPBJeauXpkUmI8UEvENSKQ2Hq8+6K/1YTHZNnWIPwcZMwua6ZgudPS59BHzYd7YTaszoJazy5DcGmj167vtXRh4rnSthgMk/Ju6hlA9pQm5MEioJUchqiHb4YvDeS2y0Eu+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MYqJi0HC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MYqJi0HC"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ba840146so71740565e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 13:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776286788; x=1776891588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFBLQbbwJlUBHhR630uwL3PndoUaJYspuC1LBCHiL9A=;
        b=MYqJi0HCydTQp86v/hFbx6c5FmsOJJKWo27vVhVSkKtWEzpDCXOqYG/9Zn9uti0+8F
         ICvTJou7Xet9lMXHD+4UUI5IqK6Nl0DPJm/1qznQHovAq7XY5jLPiZvgnxvBCkz3TPmn
         I97rHQlT4x+3yIPU5io4hX/zfTHUJeu8BlglLRdOWCkeZasTziDzYL22i6+BZpJZIEAJ
         7m/5W6fajU2MC+/yccoKeykozhF3L8FZVtREjLyB/Ve7Z0CbBOUSclZsoPrdMcKapQjb
         P1zDKeb7qIoRN2+P5Pn/TW9OGc/b52odStlSSUAioGPGu3O7Br4mzBxMlN/s6zkAYpVN
         tsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286788; x=1776891588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HFBLQbbwJlUBHhR630uwL3PndoUaJYspuC1LBCHiL9A=;
        b=MGZZSqQZXDnbACpi51Mf39WfgvG23Q0muuQbGJQ7hIx10kcqI983fwAX46ArtIKRJj
         HSFXRaTAPgmHG/0fTvsjruRhN78DphgE5wrbhfJA2SpZ+VbSUP5PBl7LynJ7vEhgLm3L
         ILNk+A7YOtfOpb8HKxbGzMRSBWPRagEBkvJoX6uWKbfpB9ye2N++cPx2lRGLGwX3M9Le
         Bg6f/exBLDePNYfT2LcBJ3HPKt38X/vKzCmF4uYjigu8aa2c+K+iKmuBiLh4o7keD3hO
         RPdTMoHrf+MqQDdaHc0UWDfv6WDm/AjwXSgCGf2PZXw3JdywUMhtVXqPGYJP9tHDATHb
         SmHA==
X-Forwarded-Encrypted: i=1; AFNElJ/1HF5JjQ2aNlt40qvzAqFPWrtnucRgf6h/TLWbLrJbyBs+3xKF66E9jQVLiFIpB3RGpNsS/Wg5wOYUcyycNHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR3NYcbq2ETH8mgJqWmvZIa5fKjsAUo6vdL0UjY9Zsf2skroEW
	bnj3S3eNIYG6tqtaqWLEe7Wu53u02MgxNw9A1Hzv/7geLpPpC9N/7QxGjSH57cZni5I=
X-Gm-Gg: AeBDietPDt+o3EuUKJazAZ2S2gK3lLgt6m1hMwBcxz78YP+Ny8P6IKZtxhPyDzvfwRH
	N8CkfK9T/elMlAOQeLTnrAbKSElIiM/S7a1KpwI7BHoLEoFtwUW0ODc72vem93XQLt2lWeKqXXl
	7kMfgRbbLde9v5AEHpldgyI0vtFsckw/HVI5zVw4u7X93qScDhDidV81GOzYGwONVVcXK4O/gCx
	ZJrrHTP8KTfTN/t7K+8SFPakVKb03B1Cnhf4zgX4GrERE4OemyqO6Q82RXTJVHJVwprjDOvMPOO
	t0JwyjBviDHSm6z7MLP1GGO9Q7XKdz9d+2hVnH/F9PNpnSdakWHadeAJSq0p8Tzqhk8Tuu4bssn
	K8ZX6HupiAb8cRyz5ZADKgAg8RoD0zh6YfU3rRBLNQEFrvCAVZftcs3oTKM5mPoW2wePcCWngTT
	aNvtJjC12jYqA=
X-Received: by 2002:a05:600c:630d:b0:488:79a3:f04c with SMTP id 5b1f17b1804b1-488d687cfd0mr320769305e9.27.1776286788430;
        Wed, 15 Apr 2026 13:59:48 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e6a8496sm3468696c88.10.2026.04.15.13.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 13:59:47 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 15 Apr 2026 17:59:23 -0300
Subject: [PATCH bpf-next v5 05/11] selftests/bpf: Make skeleton headers
 order-only prerequisites of .test.d
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-selftests-bpf_misconfig-v5-5-03d0a52a898a@suse.com>
References: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
In-Reply-To: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1776286765; l=1610;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=Dr4PihMoMr3qRKNSDl7IrxVJ9HeBlG623zgxVHaeaQ4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMGWWbzfWEk41CsDSxTzXZll/JOC2pUkK6ZFcauKpPfsNAx1Y5sHy8bgQ7+Tme92jV66sKfhQJU
 1pmDrrEwGUgE=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

The .test.d dependency files are generated by the C preprocessor and list
the headers each test file actually #includes. Skeleton headers appear in
those generated lists, so the .test.o -> .skel.h dependency is already
tracked by the .d file content.

Making skeletons order-only prerequisites of .test.d means that a missing
or skipped skeleton does not prevent .test.d generation, and regenerating a
skeleton does not force .test.d to be recreated. This avoids unnecessary
recompilation and, more importantly, avoids build errors when a skeleton
was intentionally skipped due to a BPF compilation failure.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 040617c01bbb..3c9d61023414 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -713,11 +713,11 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
 $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_TESTS_DIR)/%.c			\
 			    $(TRUNNER_EXTRA_HDRS)			\
+			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)		\
 			    $(TRUNNER_BPF_SKELS)			\
 			    $(TRUNNER_BPF_LSKELS)			\
 			    $(TRUNNER_BPF_LSKELS_SIGNED)		\
-			    $(TRUNNER_BPF_SKELS_LINKED)			\
-			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
+			    $(TRUNNER_BPF_SKELS_LINKED)
 
 ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))

-- 
2.53.0

