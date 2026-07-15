Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4914B4657F3
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119190; cv=none; b=LREUDGtaM/q2z4NCvBfZi2Y/V9XJTDBNogZY/lYUG8mRqFDkWYTHY7ojxH1NeF1Jt4iTnREMe3fI5EA8eRk7MzzMeIbyGoOB1So4BcQBZkVQ7eT4ejgaxqH/DDm6QmPQq7F5xyN12muB+jEs2F6LOrg6cXnmz54G/1C3uKQabr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119190; c=relaxed/simple;
	bh=455wlYCUNnMcrIdVi41A5Y7HIm5ipb4kz3mpabm/Y0w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QzxTM9UcDP0UUVj9/epg9rMGkuAzquij/sAHt8iC60nausal4P5tmLJTMzdTpMq1Se1iPM86GT1kt1+kNjxq3vKVw2sGTsr/ve4QfEfibxSy+NhwTngAKk5/jngdser6hnjqVfKQpZajYcYQYg5y23B7ApXjXcrfeK58qqEmhqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kgncm9lg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kgncm9lg"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c19bad03so48191705e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 05:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784119186; x=1784723986; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pqmS0wGyyzISZUi2iZDsoqebuB59CdpacRLQw8zIRIw=;
        b=Kgncm9lgIzJm83nbLcjcEhzgHLFSmNh6ygNjhvozc40NOySKqDv5qn7pAzvri0uATH
         IbW/OhHugTXmzO7HNKN5clCWay4yXnzcdUYvjna7Q717ytkcZLEtBPX0ZEvum+ta3PpO
         Fm0uN+JaUr1gNI238ZSeVwmEUAg6e2QWILnnyFzRI+mh8U6OJY/9I8PXJTWtBMQSNE86
         Yo3x+AOH8bqQxITN+xzks4nO3wjg+c0nBQ8xb4OEbAWAcPXZon8BjF6e9h9ae1HvUNdB
         Z0/Hj27+ntGUDHg5cUB93Y7/q/1G7X4ar7k4Bay/jG97b9f8p6QsUwuBvUuncIwm1MwQ
         7F7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119186; x=1784723986;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pqmS0wGyyzISZUi2iZDsoqebuB59CdpacRLQw8zIRIw=;
        b=iD5LtQPeCeUL4zTBz8tewcW0T7+OFSVNSQ54Rb4xkY3PmWy2cqNke52X+wPoUJ0E9Q
         DJNQC0x/4BB0q8idTHaLNiifVCLyKhwPTkEe4sE0v6+xdSFSiRjzAg3xj4T2wIbH1fNe
         bP1ejF1n7qALTkhIFe3wPqvveJVPqFVt6DF8/GuVp2IVfWxbY8ZHDD+qGQNAKNcKxYWF
         IoHaJCK8EKRJsNDU/m7CEij1RZnRVlbmZMA8LvG6ol2dEfbpLGFwyZeoOTdfg4V1xfdp
         xHwrekSyTNk2kHP+//usdifPugss54K1iz1YZcuNB+2FUcba2I+8e7Xlzki0ZXJO3dBs
         +8kg==
X-Forwarded-Encrypted: i=1; AHgh+RomkYi+IU4khJ06DRnxp4JgGhrWJoZTcDFLFy+Uh3xWgbkLsadtocrGd7Qns1ihtAmaCqWUvntuoajYq/wnJdo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd4v+BHDKPA+XuAcDXT93cw6HkyzXnLzPfk52duQif3xuffpvi
	gKeL5dMyxAI2EbYEZOzGKlPV+3JDcTbTaHtBcsQ+qyZHznwHJ5xhazH+EcG1vdgUs0E94uDyB5b
	t72R4
X-Gm-Gg: AfdE7ckUyzxN8Fv6r0wiFHixa2UuMAeyLjgUyNDcPkjmg56SL+HVswi7LGpHvWuugo0
	wHuDJl9dCvkZz+05ascZ4yJGlsgQZL9jxq78tMQkZYskXPz69Ewj4AXkVVVRaaLaKN7xIHkqr3E
	W0h4dumFW84ElkyO8ypADbftgLuX9kiRLpo8pvk8xb8mtp0h3rJc8zVhMV/aEdQLB/Aij8BzrOL
	3nnMQrqjdT4M0/diJQ/38HzOmNsS5J0eTyCgCxtc0WfKuBmup96h4tQmlLFi3JEUajlo/qevgt1
	V3w4DHg1qOY60MOVPTr62S00HCjAgVgls5SY7EbQXa7FUdo08wus3H0JDNHzFbs4b9UV+g0kQKT
	vhki6yFbdxUFXGZO4gTxAZ+V4eZB7P8KzGoD4gQdzsT6ZkyfS8SHK3B191rK8/PFNCyWvyFePmM
	SRRKU/wZ6YS0reikix0iW99ptGWM+ta105
X-Received: by 2002:a05:600c:6a0b:b0:493:d2b1:48c8 with SMTP id 5b1f17b1804b1-4953c28b6e7mr23273595e9.33.1784119186462;
        Wed, 15 Jul 2026 05:39:46 -0700 (PDT)
Received: from e133063.arm.com ([212.187.182.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c710facsm32360695e9.2.2026.07.15.05.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:39:46 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 0/5] tools/build: Allow versioning of all LLVM tools
Date: Wed, 15 Jul 2026 13:39:16 +0100
Message-Id: <20260715-james-perf-llvm-version-v3-0-8854bfe5af7e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHR/V2oC/3XNQQ6CMBCF4auQrq3plILoynsYF2VaoAYomZpGQ
 7i7hcREFyz/Sd43MwuWnA3sks2MbHTB+TFFfsgYdnpsLXcmNZNClqIA4A892MAnSw3v+zjwaGn
 dcJXrGrAuajwZltYT2ca9Nvl2T9258PT03h5FWK9fU+2aEbjgJWoEfdYKK3Pt3ajJHz21bEWj/
 IWqfUgmqAGJqBqRg6n+oGVZPneZK28IAQAA
X-Change-ID: 20260511-james-perf-llvm-version-43ab1cb5bc7d
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.2

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
Changes in v3:
- Add warning for empty $USE_LD
- Use $HOSTREADELF in bpf Makefile
- Rebase on v7.2-rc3
- Link to v2: https://lore.kernel.org/r/20260518-james-perf-llvm-version-v2-0-f12cc4f031d8@linaro.org

Changes in v2:
- Fix selftests/bpf build. LLD needs to take the full path to be used
  with -fuse-ld=
- Link to v1: https://lore.kernel.org/r/20260514-james-perf-llvm-version-v1-0-6cac1a9a4c8d@linaro.org

---
James Clark (5):
      tools/build: Allow versioning of all LLVM tools defined in Makefile.include
      tools/build: Indent if else blocks
      tools/build: Allow versioning LLVM readelf
      tools/build: selftests: Allow versioning LLVM lld
      tools/build: selftests: Remove some duplicate toolchain definitions

 tools/bpf/resolve_btfids/Makefile    |  3 --
 tools/lib/api/Makefile               |  4 --
 tools/lib/bpf/Makefile               |  8 ++--
 tools/lib/subcmd/Makefile            |  4 --
 tools/lib/symbol/Makefile            |  4 --
 tools/perf/Makefile.perf             |  7 ----
 tools/scripts/Makefile.include       | 79 ++++++++++++++++++++----------------
 tools/testing/selftests/bpf/Makefile | 13 +++---
 8 files changed, 56 insertions(+), 66 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260511-james-perf-llvm-version-43ab1cb5bc7d

Best regards,
-- 
James Clark <james.clark@linaro.org>

