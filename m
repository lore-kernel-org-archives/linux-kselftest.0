Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55FE3D4101
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 06:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791612806; cv=none; b=mPUBmDmAgNmuOpqo8S/pVcXQNmE8BHuYFoJNUTENuxPcB0gjW5l2n4Aosmmou1c8Sm22uHaJnZB8geGeAPyGTLZr/PSPCI4OchBaR1EXccXobdS2xXXULnA8O8dEW6wLFX1V9meZ5z6RSAMm8jTA97ZbibmNkNw4QIaRzO0yVzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791612806; c=relaxed/simple;
	bh=tMJkYvulMtZoHXCIMDBtyux3VJSGnuKAgnQddvB449o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RhLSLPZtS5ZJg66J8vO+4cnycBcqtiSzDcC2tMKneWzDxTeVA0MqUgC4mrdLLlnMtY4JUY9ECZraV1EL3Pjur5F4IO3eg2TGVslBfugyPKNHxQlAS+/JXSYkMAEnYs/x2fVyEUna0aNjyQiijTO8ZrLmuL6SZlFhUtHFiCDSKu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXUph91v; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXUph91v"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-157fe9d771bso195601c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 23:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791612804; x=1792217604; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RIrcEstVTogFp9RImwQFeI9nI9jL2oL8CAZZwCd1xaU=;
        b=HXUph91vJyZA8qAfpuaeEb+oK5VIlhmR8r3dsjwg1CuY/4N1RKkceEAJGDCHsdL3A6
         Q+xo0UvD9V1GlAuS+Pr4frMUu2I5tqMh61gtBEaJbWyI6qL644E7ALhGSg0GKBXA6+PQ
         +pSEOcRlQpvKgS0uWuMuVaKLRlIt24HxLTDPfshB5vuIRYXamAuKUmUdjui5oBMit+v8
         xxSoRxzZLS2eHCc4J8kEQIP7d9yQo1+/HaC8E36o7It5OE5QXvbVSqnbXFdNs9VAjH2E
         oXnjXrdX236qIQ5Yg3y4+D2UL2WYURaGP+9y43U830EhMcSX/mhc7IEyoPyqT5q/R1O5
         VuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791612804; x=1792217604;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RIrcEstVTogFp9RImwQFeI9nI9jL2oL8CAZZwCd1xaU=;
        b=cqkzLR6JYrv8dz6IHzc0i4KKKCtee9I0P9M3Amliu/Fs6I9ulNaYa/MHZCjEoGTQ6D
         AnaWPDUsYXW5d7ENBOP8D/PB+SR2CjzyfzQb6y1tgLQR5s+oF1LpI04idWjaGqSMUwR4
         pAdY23wJKB/4PjQxGWeIEn9q8Azkm77OJ788esyRGgDe34ZkFlRmGOcpWiE1xZmYquQ+
         GESOQWnvBQeASy0fILlkSPW+2v+ZRX4pzfiP11HWtavDw+MMoPyvAcJT8SxZHEmOg3vO
         0hZLDIQO26dWI3aWiUnYrV+Yc6zRbyS7EfaZlrpjaiXAVfhRynosXsBY/9Ia+CABsio2
         97iA==
X-Forwarded-Encrypted: i=1; AKwUvBwQ07Yc+Fwqw0jsBWafD9c7HV9gS534h1INZtboyewOWJbH5TIJUjz8x1BehvBsR2gAdK3zIuDgTYEkkZ68Jj8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKc08RnwZoLnh3TUT7ZYa5TETYJk9S4fAM9yyzk/TeK9p+Z5J5J
	ZODAL4AI3xqt6krFdir+qGBeOiCamWAEJHv0Y0agFMYgBbqyUeUDKzKP
X-Gm-Gg: AYBFou01kM70vNeJgcPKTjBh4A6vDVmL6aBCJWNMbGY/Np+Omya8yxGy9u6NnVGsKPd
	10Htfn0AxZ6969O9dD0Ynh2otrjqkSvFW6l9jD8FIXJXYUjMumij5hc25Tu0EM1xx90LLf2+Q9S
	8LKuyFE5FQzwfjvWnvOqggha2v+HIlBbg0d655AGz6S8PdLBo6T5T8EGwL/egYRDhzXd0h7eSDy
	GS98cCRI6xYU1YIaPjLeTNDLL8s9b39HWKxcWD0us5E6qhUNaGAsivAn1HE48NHRR9nBpPXbfY6
	P62imEE+XTRtpqkPW0XgYamDttXhF16PUUoycrsTuFqnI9TCItQb0Uae1zcMpstzJo5SBhPnwZR
	a3yNAd1aUSxyNNnlco2a0fSdtxv97n8yCc/JVf8fHzWfx+UX4qLIvKvov7go8MTBgGC6EUtGw1q
	5TYJo99jKQE6RxxxDUyxgaeHiWiAAXE7LaqFPtw/UQUcRvDHPaHtrbv4xrYItfxMxtdg==
X-Received: by 2002:a05:701b:230f:b0:14c:8461:b3ef with SMTP id a92af1059eb24-16a5f112ae7mr5922654c88.24.1791612803634;
        Fri, 09 Oct 2026 23:13:23 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a5866477sm10558036c88.22.2026.10.09.23.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 23:13:23 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH bpf-next v2 0/3] bpf: Fix a struct_ops use-after-free
 behind a flaky assoc_in_timer test
Date: Sat, 10 Oct 2026 14:13:17 +0800
Message-Id: <20261010-selftests-bpf-struct-ops-assoc-timer-v2-0-d7a43896dbf1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH3XyWoC/5WNQQqDMBBFryKz7pQkYku66j2KixhHHVAjmVQs4
 t2beoMuH4//3w5CkUngUewQaWXhMGcwlwL84OaekNvMYJS5aaUsCo1dIkmCzdKhpPj2CcMi6ES
 Cx8QTRayoUcZW5EulIF8tkTrezswLfruZtgR1NgNLCvFz9ld9+v9Sq0aN1tm7s03Z6rZ59pPj8
 erDBPVxHF8H33M94gAAAA==
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
V1 -> V2:
- Add patch 1, fixing the use-after-free behind the flaky test (CI bot)
- Add patch 2, a test for the use-after-free
- Point Fixes of patch 3 at 5db69b0fbdc8 (CI bot)
- Move the restarting of the timer into patch 2, which needs it too,
  so patch 3 only turns it on for st_ops_assoc_in_timer_no_uref
- Rebase onto current bpf-next

v1: https://lore.kernel.org/r/20261009-selftests-bpf-struct-ops-assoc-timer-v1-1-9a97a9b3d1db@gmail.com

---
Qiliang Yuan (3):
      bpf: Defer freeing a struct_ops map until its progs are done
      selftests/bpf: Test freeing a struct_ops map under a running prog
      selftests/bpf: Wait for the struct_ops map to be freed in assoc_in_timer

 kernel/bpf/bpf_struct_ops.c                        | 30 +++++++++++++++++++++-
 .../bpf/prog_tests/test_struct_ops_assoc.c         | 29 ++++++++++++++++++---
 .../bpf/progs/struct_ops_assoc_in_timer.c          | 16 ++++++++++++
 3 files changed, 70 insertions(+), 5 deletions(-)
---
base-commit: 15b578b1715d9a318c804350d98af87c203672bc
change-id: 20261009-selftests-bpf-struct-ops-assoc-timer-5eb0295ec300

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

