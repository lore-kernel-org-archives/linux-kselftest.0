Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983970;
	b=CUJx4dIdPHTu56m1w9gB3OtA6RWWaYQ68T3XCZCMyYG9buZDuF4j+ZAs8P3tRPKuTMe4
	 4yE61CuNDsg4qq1IbhA1lEEM9vdMxRdjVoQvcW9648oC/1D5FDGLM4Br66QxOw1vX+BpE
	 7WfAJGSO7y99+GnfPZGc5f3zCpvBdZJd7Fjw5Q/tNS3a5gN87HuP8q18KabXmcIx1k70B
	 ajLunaI1CMfcwJ8OYY8xu+GuumLpFKIwWw6uAlpj2gS9hMvX+kj6VSFKckFoYM6shAv08
	 aCu6Vxq7xoOsAuO71zg8jLxuvwP3LR339Zn6FED1GIZ9RcQYBJ79Dq6wISqkYF9VUeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XAcon0bPGB/oOjy8oTqDZo1BhwkcxrdxjLe278WDxJ0=;
	b=AQwILDow750u1pXNzRSWiFAmdrQNrPRH5kNZ3aZumFX7bEtwG+VZRGTUyvndcg+eBi2Q
	 NGJQ36zA43PS2gracxGijhkfTU9HRKKl3w8QqZFlRmGin4kneD3ayELrUb5uVHk8D4z96
	 W4h29Qd2LDq8Co2buQyJ9lEIuA1eOENp63oCTsdcN/Wl0oX1ElICT3x96D8l23QZUvc4s
	 XmqTeorBRhkI0TUzO1EeaLSSapqZekA/RdhkhbuHc5jx2US7/cQ+vAqkcnm1PuL+Gu10i
	 oX6KfoY784PnQLVyAjxcO2F5PYjQMezx0fG5jIVmTfuQkc/szkOly/m4PiIoiU44sxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbxSF1Cp;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F0A606A32A
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 06:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58F0A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbxSF1Cp
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b3b75aae4cso465594a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 22:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794983970; x=1795588770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAcon0bPGB/oOjy8oTqDZo1BhwkcxrdxjLe278WDxJ0=;
        b=EbxSF1Cpupu10/hGoiSCTVs35XFe/p0DNId9GVw+zqqQ1g2CFmVNipzSdS7btmYBz/
         gBDabXO+4Ro+d5+s/eIQZwxKGDgkQpAZ2sToN0Jl4Qwuh2om3GfROG8c1Sxxbxn+XccU
         rv9l9ck4IFGRqR2qlPcSoQl8v31CO/DPtVvoKTudcOAyXRptzxM/0MOgIaqVRZdSWa7F
         m8GjYrHL14fZJI2Z/K1U3dbNiEAJgKSKj75TybxsTQ5Q8uMJY05dwBLy8JwoGBDs9gTA
         kMWSRwKQfvwxw4L0sjqIQioA9mqXlw7pbFmOJD7xFLBZu0c8IK9q7+2SbigCYXgGV0qK
         G1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983970; x=1795588770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAcon0bPGB/oOjy8oTqDZo1BhwkcxrdxjLe278WDxJ0=;
        b=NY5Ny/LmrflIiZgXqq0pT/FrTutrtwR/x8f39Gnv3Y9qnAPF+LQORBjN4AwIaDBpnk
         MkcXCjXxOahu6MfdzlDG73U81ZsmWWN3Ks7tB70Aygj6JYeWYA2+uJ8vYYQ0c7QrXoXD
         jgBysyiRZs7xReTQZrjSsDelLIPT4V2EhM4j7pJ3vFpHaABYUoRaP6MWOsq0vj+fblXT
         fQqCL3yxo/6pKJcF6jCKzGbaYJGSHMt9Gu2vzy2tGAaOhZY0mOmsdzQKncQYVF/Z5YdW
         tzObiWexMfO39iUPejdqHnSG4NFy7aU5isHs/77M6CE6WsCUPlsEnoZ66fTEBO+ZAldG
         920g==
X-Forwarded-Encrypted: i=1; AL+hErHWPZ6MY0+i7iGFBNtJbPEZISwf3VajJWJIWD3+uaXdkIdW+iKXI0L56L/CgrWL+qOoyWpWlkChcQy6Mc9Bs7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OaVjv0Rj1q3rGH7XPftCuqbt9v2xZhWu5YZMRdYkPVFEuuxIt
	DsAkJLlAF9mhgxrvao6aGeYmSPclosyWazreJQQqOEg8K4nswqng1Rxg
X-Gm-Gg: AZFdTZdQ5f9pIBPrdv0PUAoXBQDmjcb5Hbcbb1AF3VESP0ZZf/azIFnfi/527xaMJsI
	sMXlKBB1VY1maLJDa+2swflm5KlxQKEf2+cC+5lYFKwvkPmMEf1yfZYttBHTabm2R/r00mU7dZB
	gKXUPzTt4RM2WVFzEd2JYrGkcd4psLbgfujMPjDtwSpS7Xgvl22/gFeNd/7gF2ByGZHa+AS9yjN
	ntJwlyaEFLB3Rq5+lU80w2l1HW+xYmpEHGuGZ90rhIt7pBp9AiXZhtBikyNkoBkKvesaSy/n3m4
	2UGZ+vK+7rlXQ1O9hjoyaXPXu+yX0tBIWnFuxMW2QH4Pc+BU8AGU5Nx9+JLGLWi7apdOXjwrrp4
	GnyDGwdzhV6KtrJ2Ak65WhcXuJt+U878IaS3d0Nugt961QlmURxzLUE4pHeBnFOFCQH0wC68yEY
	u9EDVdd0AfL+RYCDHjXSLwbwQIqPU+pJkN+wvccioZePdphThnoZjQyZNDH/xYwRfMGwXbrivJJ
	8fWpJUv94EcODYAxHYhU4wSVRlMJF+GXP1/afFHI/2y/cNZ2Fmao+OjvcAP2igAEh50BgSHvn7p
	LfHA6vXesOS2BzrBXDI/dSJ5w9wNIpoGYxHheEzgL6MzNEyBxXgh2k0oBdMlw2TK4iCkub5xW1l
	GLrDcIkJsx6gsTCsyRjwDMwXWfxveB7A=
X-Received: by 2002:a17:90b:1cd0:b0:3ac:b7b9:6471 with SMTP id 98e67ed59e1d1-3b3d07d2ab7mr1602445a91.65.1794983969538;
        Tue, 17 Nov 2026 22:39:29 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([104.28.235.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03e04sm2562322a91.15.2026.11.17.22.39.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 22:39:29 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: netdev@vger.kernel.org
Cc: jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	koen.de_schepper@nokia-bell-labs.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 0/2] dualpi2: fix queue delays after trimming
Date: Wed, 18 Nov 2026 14:39:20 +0800
Message-ID: <20261118143500.dualpi2.0.543a9a1be910-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changing DualPI2's queue limits can remove the cached head packet without
refreshing its enqueue timestamp. This leaves an increasing delay on an
empty queue, or the removed head's delay on a partially trimmed queue.
The first patch refreshes both cached timestamps after trimming. The
second adds regression tests through the net selftest framework.

I identified the issue, reviewed the fix, and developed and tested the
regression checks with AI assistance. I used OpenAI Codex for root-cause
analysis, drafting the fix and initial test code, automated validation,
and preparation of the commit messages and this cover letter. I asked
Codex to analyze kernel code, implement and test a fix, check public
reports for duplicates, and follow the kernel contribution process.
The archived results below are from Codex-assisted automated validation.
I found no matching public report or patch in the upstream histories,
Patchwork, lore and GitHub searches performed with Codex as of 2026-11-18.

I used Codex-assisted automated runs of the 11 companion DualPI2
selftests to validate unmodified and fixed arm64 net/main kernels in
QEMU, at the base commit below. Real AF_PACKET traffic was retained with
HFSC ls/ul shaping on a dummy interface in an isolated network namespace.
No source changes or fault injection were used to trigger the bug.
The baseline passed three controls and failed eight trimming cases;
the fixed kernel passed all 11. KASAN, UBSAN and PROVE_LOCKING were
enabled, and the completed runs showed no corresponding diagnostics.
An earlier eight-case standalone reproducer verified the fix on mainline.

I used Codex to build before/after arm64 kernel Images on mainline and
net, compile the modified object with W=1 under debug, allmodconfig and
allyesconfig without new warnings, and build the selftest helper through
its Makefile target with -Wall -Wextra -Werror. Both patches pass
checkpatch --strict, and applying the series to the base
commit reproduces the committed tree exactly.

I also used Codex to complete full arm64 allmodconfig and allyesconfig
builds on mainline at 7ccb044c27720d48175577080b851f047ddcfd1c with the
same fix, using W=1 and CONFIG_WERROR= to allow baseline warnings. Default
strict attempts hit the existing arch/arm64/kernel/sys.c override-init
warning promoted to an error; the same failure was reproduced on the
unmodified net tree.
After the full builds, I used Codex to rebuild the modified object under
both configs with default CONFIG_WERROR and W=1, without warnings.

Zhiqi Zhang (2):
  net/sched: dualpi2: refresh head timestamps after trimming
  selftests: net: check DualPI2 head timestamps after trimming

 MAINTAINERS                                 |   1 +
 net/sched/sch_dualpi2.c                     |   2 +
 tools/testing/selftests/net/Makefile        |   2 +
 tools/testing/selftests/net/config          |   2 +
 tools/testing/selftests/net/dualpi2_head.c  | 304 +++++++++++++++++
 tools/testing/selftests/net/dualpi2_head.sh | 350 ++++++++++++++++++++
 6 files changed, 661 insertions(+)
 create mode 100644 tools/testing/selftests/net/dualpi2_head.c
 create mode 100755 tools/testing/selftests/net/dualpi2_head.sh


base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.54.0 (Apple Git-157)

