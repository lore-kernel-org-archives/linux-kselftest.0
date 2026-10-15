Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D555433939D
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 01:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028158; cv=none; b=ZhXkEGbM3d3Ik0+ceNRDQiEehAzJRLaVnj4bZ/H07+vDcPL3bRid0Eo8m6UTHOpRgJJD911s7ke4XSlqvufud9IKwNMDDXpZbVv1HUMD/oiubUClzzIR4xfMIWyZfCy0ZbWfJvu73xkw7nWeEWKWY3Wk7e+Os20H6nDf4rsAaz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028158; c=relaxed/simple;
	bh=gK5PY1OT9yv1/NoZPTi5LWL1X20Hd8w5vnSN79I2Pao=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WlF+Rr+SqzfsvDske2Kqg38E0abdL2w0EgrvWyYt1tVVG3KH5nKIAKieHW0DYDyrHNDGFdF9eBPUEaCli8H/QH4PtBS9WBcuZDeUJ3qwRQmTtm7Y7re5MCQnfT6bZZEHsKX150cHakQSE3pIaw00gX9In7Fvp5jOzIEwSQ3oz3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEqYVcUj; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEqYVcUj"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35b2c599f43so6431651eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 18:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028156; x=1792632956; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mCnACKvG4MRrTjd1g/xqjI+myDz+CMtt+RIzz8qHbtI=;
        b=UEqYVcUjrX6HUBeLu7HSlEGE0IbqHBbHziXGLi2MxNpWaSFg+B6gAwAYIgKyJN2otF
         YX1UC0/7nerfekRB1IjWY7Judij5A/Cy5dFAQfPP0ywKIvIwFsXmZIUa+KxtNNZYZUUH
         9psFeD8AvwvmkvMLXOJrejzFEpwJGvHtZ6n94ajErqzin1HyrT0YFFvOZqLbcBXw3MB+
         uP8IH/hdte9l7FljlCriJujQZDP6hgMZ4QRsiR7aypUM2xHNO/JZQV0aPzKv6RMZ+Q84
         mwjywGCjOHLKOSMA+OtmescEzP/1uHMiipZ1ploj4DVmT4g3ugNq59ejJJLH9+pRcn0w
         l90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028156; x=1792632956;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mCnACKvG4MRrTjd1g/xqjI+myDz+CMtt+RIzz8qHbtI=;
        b=BkL+BrHhlauz7jVU11xHLp+x2Dcu63A17m9jCuBMxAvG1GFqEf6/xuSI46wxvyKeAn
         r2b9u17XcJE2z3oFazzsV+B+KXPT5c5Zk/oK7qXoUUPQuUX4HD6J8iYDcFiHQnCgRyfq
         dyfVYo/goVqlVHPPvrbNZnd4/wiF72LWrOHCHoI2O8uQp+X0051de7GGAU2FDsbjgOcV
         Rch6Fpwbj2omIxyTlkJGxHE9iUG2JCaqg1+LRcBY03k9uHuVNp+Trt3RJUFF1CxARpsj
         cOP8iK5FMFtK3dmyPppHiePlUfqjMpyDAY2jhnFICNoxnUwIvQ/uO0hRwvh/c/pXvUPR
         R04A==
X-Forwarded-Encrypted: i=1; AKwUvBxtsYdLCNL+KppLr2avKvWS1+HrmbVWu/xQ027tHPEQd9dCBLjxdv8cYAL9ZilR0QBx3N5BXvd6u8uTv7cmT5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJP7BjyInBHN9QcfnXurOtOj0J6uElaOC/Icl3i1poOHTD6Sqxs
	sTRVWjedwQraY+IBy9ioeQiZojgj7TsM0uJhEtxp4fz/tHcacCdM8Smb
X-Gm-Gg: AYBFou2Sjf3xEk4Pux86rZg9b2FwR1PS8MsOnnaClCl9/Mx5chWdNdtCHGeZoshRVbX
	R52w0BHufRFSDl/eoO683RSDBdYU5P5I7l8RiqU4U5aZ4fxSo61f5Vm/rPNn/y2oSQY5pt9AKzE
	gtLUZLqP0p+Fr1hSMkoMBNcx+VyiZ8NbVa8ujzKaZiFEno63f8RfqhOtZfNzFmcKdDgKznJg0Oo
	VTl/JdVqdiS+I/ZlzUEgg+EeFetdoTpqDjbTKsJy+Wuq4/54TLMXuP4k2laK/6dSaDCD/okE1UJ
	b0zuJPgbxjImnE0iOLVvYEIen2UybaXKjyNAu9sKxFKRgCFRI/AWFQufXejPLdNNYQrxvt3zye2
	hY9ZYEUkMHymQpRr1DIv5Zfc/EETH5ATlUEhpeUO7XMfNnW3MogQCGaEqM+F5djmcF5LP6oRunW
	AZHE+SeV2/nSaNwPPAVsGNHWQE81a8bXBHL/smYWA9NLBw/Hub7lMt6W4CMA6C+rX52Q==
X-Received: by 2002:a05:693c:880c:20b0:358:cded:5f8b with SMTP id 5a478bee46e88-358cded5fccmr19483108eec.8.1792028155864;
        Wed, 14 Oct 2026 18:35:55 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm47863101eec.15.2026.10.14.18.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:35:55 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH bpf-next v3 0/3] bpf: Fix a struct_ops use-after-free
 behind a flaky assoc_in_timer test
Date: Thu, 15 Oct 2026 09:35:49 +0800
Message-Id: <20261015-selftests-bpf-struct-ops-assoc-timer-v3-0-efe643d4b2a3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPUt0GoC/5WNyw6CMBBFf4V07Zi2CFhX/odx0ccATYCSTiUYw
 r+LrFjq8ubknrMwwuiR2C1bWMTJkw/DNvJTxmyrhwbBu20zyWUpOFdA2NUJKRGYsQZK8WUThJF
 AEwULyfcYoUDDpSrQ5pyzTTVGrP28Zx7s+xtwTuy5kdZTCvG99yex8/9SkwABSqtKK5M74cy96
 bXvzjb0e2CSB6ngP0olcHCVvuRXVTpTi6N0XdcPbII9rjcBAAA=
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Amery Hung <ameryhung@gmail.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

st_ops_assoc_in_timer_no_uref drops every reference to a struct_ops map
and expects a timer callback of its prog, 500ms later, to find no
struct_ops associated anymore. It fails now and then while test_progs
runs other tests in parallel, and v1 [1] made the test wait until the
association goes away.

As the BPF CI bot pointed out on v1, the association goes away late
since commit 5db69b0fbdc8 ("bpf: Make struct_ops tasks_rcu grace period
optional"), which moved the RCU grace period of a struct_ops map in
front of clearing the association, so nothing waits for a prog that
reads the association in between. With that window widened, a timer
callback returns into a freed trampoline and the kernel hits an int3
Oops.

Patch 1 frees the map only after a grace period that follows clearing
the association, and patch 2 adds a test that catches a map freed under
a running .test_1. Patch 3 is v1 of the test fix, which can keep calling
through the association until it is cleared now that this is safe.

[1] https://lore.kernel.org/r/20261009-selftests-bpf-struct-ops-assoc-timer-v1-1-9a97a9b3d1db@gmail.com

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V2 -> V3:
- Wait for an RCU tasks trace grace period in patch 1 for every map, so
  that progs reading the association under RCU tasks trace, e.g. from a
  bpf_wq callback, are waited for too (CI bot)

V1 -> V2:
- Add patch 1, fixing the use-after-free behind the flaky test (CI bot)
- Add patch 2, a test for the use-after-free
- Point Fixes of patch 3 at 5db69b0fbdc8 (CI bot)
- Move the restarting of the timer into patch 2, which needs it too,
  so patch 3 only turns it on for st_ops_assoc_in_timer_no_uref
- Rebase onto current bpf-next

v2: https://lore.kernel.org/r/20261010-selftests-bpf-struct-ops-assoc-timer-v2-0-d7a43896dbf1@gmail.com
v1: https://lore.kernel.org/r/20261009-selftests-bpf-struct-ops-assoc-timer-v1-1-9a97a9b3d1db@gmail.com

---
Qiliang Yuan (3):
      bpf: Defer freeing a struct_ops map until its progs are done
      selftests/bpf: Test freeing a struct_ops map under a running prog
      selftests/bpf: Wait for the struct_ops map to be freed in assoc_in_timer

 kernel/bpf/bpf_struct_ops.c                        | 28 ++++++++++++++++++++-
 .../bpf/prog_tests/test_struct_ops_assoc.c         | 29 +++++++++++++++++++---
 .../bpf/progs/struct_ops_assoc_in_timer.c          | 16 ++++++++++++
 3 files changed, 68 insertions(+), 5 deletions(-)
---
base-commit: 15b578b1715d9a318c804350d98af87c203672bc
change-id: 20261009-selftests-bpf-struct-ops-assoc-timer-5eb0295ec300

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

