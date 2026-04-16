Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AB23B6C18
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 12:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342099; cv=none; b=gRE3RwF7tBM+dzFZggoFpRYVLIAQxBLG5kuRPYLT9qVG2w8RwAaadKLtu7oIUt21YoccmmBnFski9EvPwyDYhW9oLUDD9CCFK35CIgUkRqsLPxJUJs8231XSPl+zh7H/CkG3wVEiFcDfl9jqwf/XwQw7hYav5gVWXZBQD0NWa/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342099; c=relaxed/simple;
	bh=r4Eeeqlnty5JWhyFFs4PmBr0ldtcOWrItly6lcvC8Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jKkwFHAfxMsB/BvUK5+/dlM2Dxs4I7HN4h0ObH/FF5no6BBNYVa+Zpz/a0ZNIix9wLijktVvUTQGZiylM+ovg8/2xSxUsgFrKKrnqFkJwheXtC6dKwgUMUMG7z9RWn9DYcmfxsfqhjdzldy466GzKOdZb3Ugh7u9QfwGJclrh7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OvLTR9nn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OvLTR9nn"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso74081395e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 05:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776342096; x=1776946896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg2etNAfQKZBd7rcNCY3p33XRFv6QLBK/6YkWrjaoRM=;
        b=OvLTR9nnkUjqofBJqfc1Di0qjWYEDn6IJm+pFoN018SP5viSbn1YUeL+3ftZlSuxED
         +b/YmNdslq2qM0YTfW0mRWBddssKKSNLee/aFlmqkwO85xhRNncTQGslIzeUurLO2t5s
         bpIOpxm5qrAwmwG+x0k+xZurzcEbYpUhimFCBC4RSvy3dbLQ50LqIcfTgjkEebvYbxdV
         HjAPWYRIQOOlVt9L2mdk7aG8w2wTYBj4WQw1pHFhw/TMtpyFs0P/WInWk5rA6XW/WrQU
         mdSchGFbPy626dPOU09Dn9l7WLLQaRcj1U+wc2ouYOJs2sIrNuLC8uyMNHc/XFnwmZc1
         U5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342096; x=1776946896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sg2etNAfQKZBd7rcNCY3p33XRFv6QLBK/6YkWrjaoRM=;
        b=H6MCCysgAv1OH7lZpn7BQb9eQtuWKTspdPwNLECWIcO1taMmx51EJVH/VgGbie97yh
         MgXyW3ni45N/fok/cIB6UnnjMNWgU1/AMIP77MFB2/UuwqF5xFtQIWxM4yz38TbsQlR7
         wxTokdNZuGpqsqUl4+Nl2tKeiysxVPMxxlVbp54fIOAdyCzjLkpIULMaydM7Eq+yvv9k
         D85xHIiahgRYM+ixc6fKHNf4FpqfObvdQC0i3f4lY+naD27RSPchJ5DhFCrvE8ZCITHx
         9tYY2WZZE8uw0S8pQrx20lVL5MHEGSv7Lo1K0IgWKL2o9+y8lzdn9DjlN3Vq5cRqdY8W
         Z/Zg==
X-Forwarded-Encrypted: i=1; AFNElJ8b/SBj4SRnj3AlIDeez15SdRL5ymNapilpNPqjFLnz/aeiVqYkPaeJAnD4XNRMx1iuUP58Krwwnr/bq/VazwI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoj4k/bi8PtbzdPsvlF/QBTKyjK/yb09ht+H3FB6cU4KWdCY1L
	6Jph7orqnEUADkYHSnQFcrXQlsNye+XJv4KNsb7HkOprSFl1N7nnNXRcURMqu+OJp08gOjorpnJ
	asTAjffo=
X-Gm-Gg: AeBDieselS1qX23zmp0Hz2XRLX15qcABDSpK2QNDQgBryNX2AZY7aGuyuF2nwBY66rv
	EKMu9BjVaO+tpmNdmdWkG7112NP+g96agAgi0i4ClHdX0KG5hl48scjqZo9gDimoUDHIO+eEtRs
	A/gFkfM6ZUWWUi8RVmGTCzJahrPbwnIY73HCyy9+4jodfvcBMNyN0DhDwIpUsHAibmdT8VoN40Q
	dkKqXrrePW1m6dJvoZyMc5+Xb7bHhbTYcLSiwUnG1LX26iMTys7ySB5O60QS45FZfowMA1R6QiL
	07Vn8yHH8BaYmD8oLerbM1I3NMsmQ2yr9bhxzSd4n5sNVzHvxuCXorU2t+K79LL2j/MkT8GR+jl
	njHiLOOLw1ylHC2bw2AHuBQB0zuqF7DgB992m3JMGhvEpEl6m5RLLJbgwASQJDFQWolcMislsSC
	LLanNoZsy7IcY=
X-Received: by 2002:a05:600c:350c:b0:488:9661:2570 with SMTP id 5b1f17b1804b1-488d67ce8c2mr352427795e9.8.1776342096400;
        Thu, 16 Apr 2026 05:21:36 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f569f4bsm6849514eec.21.2026.04.16.05.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:21:35 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 09:21:18 -0300
Subject: [PATCH bpf-next v6 01/11] selftests/bpf: Add BPF_STRICT_BUILD
 toggle
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v6-1-7efeab504af1@suse.com>
References: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776342088; l=1377;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=r4Eeeqlnty5JWhyFFs4PmBr0ldtcOWrItly6lcvC8Ts=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMp7IYcl3451BzQO8aHK4F4373QgzlaelKKslfNxqJXSlPxFdg8eg4NfZcpJgAhyK95KEuAxrkG
 9g5UX8B023Qc=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Add BPF_STRICT_BUILD (default 1) to control whether BPF compilation
failures are fatal. When set to 0, failures are tolerated and skipped
objects are reported, as implemented by subsequent patches in this
series. When set to 1 (the default), the build fails on any error,
preserving the existing behavior for CI and direct builds.

Users can opt in to permissive mode on the command line:

  make -C tools/testing/selftests \
       TARGETS=bpf SKIP_TARGETS= BPF_STRICT_BUILD=0

Suggested-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 78e60040811e..c8ba8ccc2c6d 100644
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
2.53.0

