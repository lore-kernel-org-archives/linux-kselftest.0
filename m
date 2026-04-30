Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A73E40B6ED
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 12:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553610; cv=none; b=k3kU1nkMCDcStlSFWHO/6YIaargcGLOF6AJSZjtm0uXEstBpX9W2c9MvjE7uj4uTgBnpaeG/vZ2i2x1fFhyYR9qh1OINmKbUF3FGevyYJUSV4L79PcJdkuJB3VMTu9e53E7Y5Nbtcicf3oFvEjSUYud150OYmEiP6HweMXOpBtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553610; c=relaxed/simple;
	bh=/jGlD16wwf+LKViAk9+60yGEYsvt20pYf1s5W49VBcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oH10MH/jOynHsw+/S9fzjSXt+R1CY4t+jsPOK6IPA6CwSjwmkQZto6O6f+NmyWnG4etZaSbGA4Gx5LikfKmRfnwt+a5hIvDHBbjTy3NMgu0tdPi1FHQd0npJoKFF8gLTwd5uvqnc4MdUnFCFzf+3JSqbJ24X84bSjP03LGgNJdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BX/s3/eq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BX/s3/eq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so8804305e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 05:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777553607; x=1778158407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+aXTQmh1BdIEplotgCd37rKzWea3sfpPCHgEBxHTL4=;
        b=BX/s3/eqocHaqWKJXOL3SUlNJhDlHybH4H9pVEm/u0D236n2GOm393cjnX59C/n3RA
         /eTEvaR3oxA1PPU0ToBEiui/XsKbcQ+uGCIIS8zf2IzkGkcvMBNCJ17aZTvY2YS557X2
         L8lUu/ZZYwm6J6GYD8TU8r2E087WTXD/6qRgOIk0wr7Urf1YQRiRqzyltDzTCZ/fEa91
         T2jwbjh4ofISZFN6BRF0GMacimBRH7Yw6zFI9l3IxKM9XUKrEZ+70IVnNggmvxSA846e
         iDG3378SyDY+djASI6ewl46kLpDIexGfKHF798yi9I/WT4OQG6J91uWwLRNRTQ/94O/B
         Oh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553607; x=1778158407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K+aXTQmh1BdIEplotgCd37rKzWea3sfpPCHgEBxHTL4=;
        b=VjKq8/ClWzj3V+PW9g5Lw1zboOk+sJ/eTyksk5c6YEl96HW7jS2BlqYRy8QARw3uUQ
         ehTZWp7hFJJVGE97Qc/pdWGyD7YuJItFxNjfCvqIYfdpidhjZ9hGQtqUxQ4aOf9kLps5
         y+4JJAb3OEwdek7nIDreUvY601i2NA9Zrf1PH2dCa/VE24ifUh1jWVl8JFwcVbsneYJ/
         RvfIL1H2+0Qm+im2Yda7zSUpfDYSf2TqulOeGoAOwf8KrmjIZGQvyIM4IAgcjlEc51ao
         lrEvPzr5kONXf6wNoRQUnuv8CH1u1uwYjFivdm1yFeJYVqp5q/oCB9Ee1W1C6sZs2kJS
         Of9g==
X-Forwarded-Encrypted: i=1; AFNElJ+Litc4qSAlw47wa5eNWL2VFI7oCKXipebvBLLjJ/n1V+Fi8gpSTDWRJ5j4IcPByFoIa86w3mdpTChF5Nkfd4E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4w0XkFrLwbNrAJXso5/h5ttIFmpBB49b8ziZETAEXCFnoo6Qo
	W3sVB5o5kuEXFjfWox2VgaVxOuhwfzfhJXX4D44X7jyAwB0XGNQrNZaphGOKmPf6aBU=
X-Gm-Gg: AeBDietzgUvQeCtPGfcPQpUueaMdVP+mfPGx3BLy2Abdi7gGxYXcvqqREsNS9d5rF9D
	+ip5RdaVATphK3/vDpPz3U4iX3SqfRs2aqCfQGhrs03zDv1f7NiPXpiRMDi1jNwpZdJSQkWsj3c
	cV4LtbuhUGUGX2wS0NI/cASYx56AbZiCmUcXFReU76TD4qLhLFrZhaakeWOlHjjzFZH5PDU6uKn
	PwSMsA9a/5RjI/TIyxMUfgx3+EOLdBXX7pH6S7hTfbZRGyig0Qusn1LUIZd3HkFHSsAUSnvxiKO
	60Ibfd6XZhPt1Rv7LFEyTbfivxLmN282DtUyas/R03P99s9ExBxmpv9ObbJmV30Aa/2JPA/IQtc
	SuBfDdm4hjlEATwAopveXh3QZM3hYFlbYp2lSzw7NAQKqpa+LAcQMLOX+4P8ix0dCR6WFO2oq/n
	rAc1YWKn25PY/qF/3go5SbKeaA
X-Received: by 2002:a05:600d:8451:b0:489:1c09:6c4b with SMTP id 5b1f17b1804b1-48a83f6e2camr36515955e9.6.1777553606714;
        Thu, 30 Apr 2026 05:53:26 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1c0d218dsm6470287eec.27.2026.04.30.05.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:25 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 09:53:13 -0300
Subject: [PATCH bpf-next v10 01/11] selftests/bpf: Add BPF_STRICT_BUILD
 toggle
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v10-1-cd302a31af16@suse.com>
References: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777553600; l=1573;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=/jGlD16wwf+LKViAk9+60yGEYsvt20pYf1s5W49VBcc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QH6rhM5l3D06tpi0qU8Si1/N1l9Wd2RxcyfC/tNWuUnFz9wkBshuox3jwVTAQY8IE4x05O95ehI
 qWHtqeAxplgs=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Distro kernels often lack BTF types or kernel features required by some BPF
selftests, causing the build to abort on the first failure and preventing
the remaining tests from running.

Add BPF_STRICT_BUILD (default 1) to control build failure tolerance. When
set to 0, the PERMISSIVE make variable is assigned a non-empty value that
subsequent Makefile rules use to make individual build steps non-fatal.
When set to 1 (the default), the build fails on any error, preserving the
existing behavior for CI and direct builds.

Users can opt in to permissive mode on the command line:

  make -C tools/testing/selftests \
       TARGETS=bpf SKIP_TARGETS= BPF_STRICT_BUILD=0

Suggested-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 97ee61f2ade5..6094fe99b5f6 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -44,6 +44,12 @@ SKIP_LLVM	?=
 SKIP_LIBBFD	?=
 SKIP_CRYPTO	?=
 
+# When BPF_STRICT_BUILD is 1, any BPF object, skeleton, test object, or
+# benchmark compilation failure is fatal. Set to 0 to tolerate failures
+# and continue building the remaining tests.
+BPF_STRICT_BUILD ?= 1
+PERMISSIVE := $(filter 0,$(BPF_STRICT_BUILD))
+
 ifeq ($(srctree),)
 srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))

-- 
2.54.0

