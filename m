Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE6C399372
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 09:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751153; cv=none; b=tW2HBsBfunNZzG4IzGtUb8FPj1iKym6Wh4Vp2uG6w8K8PL05ngk4DUYXTfpx0cO68mac2tqp1Ql52r7Coh6MR5pcLbHAS0lilJqs1OHUER7QqFWYdKtacbUSCSRLG7hnE/Z6jQswMkgyaTjRqKwtDyShpmJPWHawZoWXIfcqajI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751153; c=relaxed/simple;
	bh=g4qN1qiOL6eoyFGTvuGJsgsnQ0jH3lElMo1cnFmnA00=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bs18LKxQ5SIqvrfNagxSJE/YCWSdtKo46oku2niXToGMkGiuH8ovycT9ysErdOZjMm+V4XJczEWrDsy5Rj1erTKxe5SRVpCe7XV77AlRrT5rzD7/PO8dbLybQQTMAHPnnEIlaX1Z26zWN8zAlyvB5LPwfcWzLLy7UBykxmy7liA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kyeKNy93; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kyeKNy93"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so5671384f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 02:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778751150; x=1779355950; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jIhsStlSAZdSG6VxaddFdlwdDOVd+4VLWmlrEpic5HY=;
        b=kyeKNy93HloOQAPUGi9QaNC2baV/8JPS/4t4SDA+KiqJq22SN9hkNsMn7iD82X4bju
         tRyWrySNJja+xn1gSHqp9d6h1qjzUWX4SoPlieA3NUK0nWrWz+7OjOliJYD6QPLb4hP2
         wAful7H5dmDbH0Vo5ZZOirp5CmTrTpg8CNh7PGPaBwhpUQKNLn6t9VQE4571Hgv2yXo0
         WAD8RRy/qeDn2WtyaVrOmi73UKCkiA6EEore2iX/3j553e7b9ByT8Yq3SLDAoYc5b16N
         +nD8PEPaxN8cwoEXU/ZRLk3QF2aBenGIBst04QBZrxItlno6nT6IU3Z3xtir93EtjnJU
         f7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751150; x=1779355950;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIhsStlSAZdSG6VxaddFdlwdDOVd+4VLWmlrEpic5HY=;
        b=FISWq1jAxXEGKYf806LMqfMeZs+Yx/seUQXXJ/AlJVW4T7tZriQ/sllY37M6K1KrrD
         kogzhVtCXjyD6idUERY9MW1k4cbnjnh51LIM62flR+u6E6byG2HiLefx7M7JELFN+2Fc
         YilDC38+FYLM/jL4jR+FwQCuoP1HFdDf2+uck4as4dY76UMTRevkPfKrmZ5IYRxaCn/G
         0wFI32s7q27S+XpgfRR+CJWiXwa2jBl+FV2JHGZtJ0Jy8WSoXQOVXBWK3u3zGc4K+VZt
         bKfFzSzdB+d0hAPq8AgOuLT5gWivt10HU7DHN/ny7TMSvLifQ67GiFdZnZVsGhGoH98V
         aQog==
X-Forwarded-Encrypted: i=1; AFNElJ9HukQRrmgxtdsuP9el4Nn8LR36SZy/ynaYpMv9C2kxu/X8vBzMOTyNNXTJJC71kIMbxaqS3JJsVz51X/NiO04=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp5OtuUz8st1qJpI34iHQ4kd3x39ODi359N5p081KdcUcQ6O0r
	L6Nd4JM9ZWT73WpjQ1rBDqL04tvoFTAChFo4sJAVKLIvvDKo1rBDZf6ACFsh7shnmKsQxc3FXYN
	oc8xjbYY=
X-Gm-Gg: Acq92OGkArZCQA64WgczOfjBazQ8rAhjAoKdA3HrxjD9VIYykxw/l6546JTu+sGhCF5
	qD89NMs8LYdhgPSMVK88oWx37p7DmL8bkrQl4vAkG+HKSxGHATB0KaXN/oN/h1Bo9Ws6p3rPHAr
	exsBqd7iyrACyZgA4XtKblQ+GBjTv3rSLBPAEhfn9ptMXhsW1+2JrCk3cOYEqaHD5+3JNwLQ54x
	dXS7HpwW8m1Mjj39JKflENycuUwe+RLXKswWB5c4L5ZhGLv8BbF0bDNbMjgIZi7ZBfOZ+gDcikL
	YkI9cxw8iHGAAGGBCz2khW6M/JWN5BV09JNB6WxDi5T6PCBMvlhg+sifSVof2CA3zIGYwMDgH9z
	2QbASQyEa6A9gLXxxwYsndYZNE23I+9MRwWgPkfinr+V56vHV1EOBIlaXgJIG0hBdx/fr7R8Sbk
	fHpo0WF3KQqvUFIivueREl/c9qY30HDLo6
X-Received: by 2002:a05:6000:2401:b0:43f:e721:76b8 with SMTP id ffacd0b85a97d-45c7a7dc644mr10324893f8f.37.1778751150103;
        Thu, 14 May 2026 02:32:30 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm5097164f8f.26.2026.05.14.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:32:29 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/6] tools/build: Allow versioning of all LLVM tools
Date: Thu, 14 May 2026 10:32:07 +0100
Message-Id: <20260514-james-perf-llvm-version-v1-0-6cac1a9a4c8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJeWBWoC/x3MSwqAMAwA0atI1gasWgWvIi7ammrEHykUQby71
 eUs3twQSJgCdNkNQpEDH3sKlWfgZrNPhDymhrIom0IrhYvZKOBJ4nFd44aR5DNYV8YqZ7V17Qh
 Jn0Ker//cD8/zAm21c3VpAAAA
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, leo.yan@arm.com
X-Mailer: b4 0.14.0

I ran into the build issue mentioned in the first commit, because using
an option like LLVM=-15 is a documented way to build [1], but only
some of the LLVM tools defined in tools/ support this.

After fixing that, a lot of other tidyups fell out. I didn't go too far,
for example some selftests include tools/testing/selftests/lib.mk which
reimplements some of the LLVM_SUFFIX stuff, but other selftests include
tools/scripts/Makefile.include and I stopped before touching the former.
Some other non build scripts hard code toolchains and I didn't touch
those either, this change is only focused on things that already
include Makefile.include.

[1]: Documentation/kbuild/llvm.rst

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (6):
      tools/build: Allow versioning of all LLVM tools defined in Makefile.include
      tools/build: Indent if else blocks
      selftests: Remove unused LLD variable
      tools/build: Allow versioning LLVM readelf
      tools/build: selftests: Allow versioning LLVM lld
      tools/build: selftests: Remove some duplicate toolchain definitions

 tools/bpf/resolve_btfids/Makefile    |  3 --
 tools/lib/api/Makefile               |  4 --
 tools/lib/bpf/Makefile               |  8 ++--
 tools/lib/subcmd/Makefile            |  4 --
 tools/lib/symbol/Makefile            |  4 --
 tools/perf/Makefile.perf             |  7 ----
 tools/scripts/Makefile.include       | 77 ++++++++++++++++++++----------------
 tools/testing/selftests/bpf/Makefile |  9 ++---
 tools/testing/selftests/hid/Makefile |  7 ----
 9 files changed, 50 insertions(+), 73 deletions(-)
---
base-commit: 09d355618f7ccc27ffc7fc668b2e232872962079
change-id: 20260511-james-perf-llvm-version-43ab1cb5bc7d

Best regards,
-- 
James Clark <james.clark@linaro.org>

