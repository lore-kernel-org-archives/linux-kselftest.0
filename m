Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDCF2ECE91
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 04:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756707; cv=none; b=SEQHKYYLKrQl48iSsMathfRaQ4vNyN/b0EuF/b51pGUlBPuL6E/JOteCSJ8lOCOwgV4rMHPBhkQA1uJ/oKyc0/CcR2ZSm8KwJqjOV0M+hH45WT4t49g+td8D3KC/vlaQ3Lm46T0zjXg0F8vIcY8Mt/AZJ6OMXzXMpMYL+6kJ2oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756707; c=relaxed/simple;
	bh=GYLGPTz7B4DR+c4lAIA8hn1QEzqtbEK6fanc+u3joVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=idIisLnu8agI8MVd7dPesCce7zbXxNm9y/Nk3WZhWg0Kk0MckLsalAvdh4l1UMmUWha4FHn2pVc2BZednvNkpw60tPuym7C9u9vpUZ485w1dpzhIxXutf4GNmCJYgPcmqbPyiNJAq4834PPr7vkUzVvo/xV8wwG/8BEyUi2vmR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnRN3Zzx; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnRN3Zzx"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d91ded8174so23642455ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 21:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756706; x=1789361506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSkZ75+revt0e4KyfnrpcrTujkH4yPeuqSBvDGGLspk=;
        b=fnRN3Zzx+m/zlZ8cev3X69P2unCU/hKmk9KjTIB3yjMi8U152ulGdkf7hT/RomEYNI
         XuYqllVVPpP67DyqhwAO5tpBTEatOmP/7k5ybHQErlPeSHslie07gjN+XwRst7xjKrtt
         8YFQNXz4EqT0gN7d289pFJ0/TyownBzAv1nJKSsshKAVbPUSed1KJsb/dgFRzqDaSPPL
         OSWkArHfoZK/XeqQnBvR4j8olsKFu9t528W0R/d0+ahTHcfwTqkNVWjamdJ7cMmkLpVz
         q9R4iQ5uYJoAyPcXs58eKuia1X4/81NoH1Kg9HTUOXRa7j21BfB6Phi9wJ1dfFatS0Kp
         N2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756706; x=1789361506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSkZ75+revt0e4KyfnrpcrTujkH4yPeuqSBvDGGLspk=;
        b=NrBBenp9I5V1ywpMWMHi0a2eQfi2zS29TjkZsDWG/4X1kEtWqtLxrTTw1qD6VVlZaw
         UDpKsv6+Pn5Qw+Us1hYPfFcun/CQUpjlX/7EjrrduG9yAVxLvzYiKxM9sZuPhobawO3B
         JzavSP5MxKDtiROI3GVmZkHpZSAGfCwzVs9im3Bdyk2h1jHNbZ+Vz4kTWDT585k/bc6U
         K6gRhM47NbrfjukffwmPx0c5gLeVThxcq1aK4knG38RGp7dSyUwnxJ9qxyZWnvnf5I1r
         +VeodtIpVyCqpSL+cXkzM9ps7/hzOndWwI4cw2+jIvwz7QtEnVVe7dv2gcUEzKY1OQmh
         h1qQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOg1a1s+9flnaAIQSWikBPxFVQRLHc0nC9FLMJnl9QaiTKeb8HwW475RrUL59f3/c3DOU9KZriFjDHs4mKsqo=@vger.kernel.org
X-Gm-Message-State: AFuF++nUcOcDfvkLJsCshhUU3ZlGkEA+MZGX5gtfY0QSjRpY+04zacbg
	pZOtGtk0vO9HUMJCJx5hRNWU13yTreMdbTwucpJ2HMZjyiF/J6HAH7dR
X-Gm-Gg: AYBFou333547yp12bl6BUtY1lkTMti6KBBGehSzvFK1pqvjSlXNINP78NkMhErjNePG
	oNUqizq8bdhhnCHcj6Z6yOjf7p4pbSF3n8QGxe96zRyDEUzgNocFFez6HoiaE7Nd4MlZeazseUM
	ptJxJqO6mygAbVp5LiuX9Z1KSjQMXw33G9SLBjG1/NbP0aJ85XIVgTrrp3WcC0MtcxEYCQgjvnn
	a3Qzj9+YJmYM64s3upBJibI9r2BQvtEWgujN9csOCZX58MBKEfT0gR0PINDvWMiiJqGa71Wteb6
	yt4oel86M8mNS+SLCtA9CPFwotWDEvEgZ2YcCwy+dhoSK1HFQyOpZ8I9zw5Nue+uJhzK81QFkHp
	KKqrENh8JraVuP3+1K2vEFzzSp0/2qwS5r6yVOTHCWw+keNGUbB3WVinS8tqOBtaNmv546pgXQa
	udgKk6UO4SRpgSM2TQvmfOeeRFD9zxlsVCFt3E3Zz8dpnj6FRkMu3aPmqJ2BkgD/y8pA3cxEVo2
	nmlDIuulTUFEA==
X-Received: by 2002:a17:90b:1643:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39b26272f04mr30192034a91.14.1788756706071;
        Sun, 06 Sep 2026 21:51:46 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm21979675c88.14.2026.09.06.21.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:51:45 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Puranjay Mohan <puranjay@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 0/7] bpf: fix typos and repeated words in comments
Date: Mon,  7 Sep 2026 10:21:28 +0530
Message-ID: <20260907045135.13317-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the spelling fixes for this tree.

Changes since v1:
Subject prefixes corrected: 'selftests: bpf:' becomes 'selftests/bpf:'
and the tools/lib patch becomes 'libbpf:', as the CI bot suggested.

Only comments change; no code is touched.

 arch/arm/net/bpf_jit_32.c                                    | 2 +-
 arch/powerpc/net/bpf_jit_comp32.c                            | 2 +-
 arch/powerpc/net/bpf_jit_comp64.c                            | 4 ++--
 arch/sparc/net/bpf_jit_asm_32.S                              | 2 +-
 include/linux/filter.h                                       | 4 ++--
 kernel/bpf/reuseport_array.c                                 | 2 +-
 kernel/bpf/stream.c                                          | 2 +-
 tools/lib/bpf/btf.c                                          | 4 ++--
 tools/lib/bpf/usdt.c                                         | 2 +-
 tools/testing/selftests/bpf/libarena/src/asan.bpf.c          | 2 +-
 tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c       | 2 +-
 tools/testing/selftests/bpf/prog_tests/task_local_data.h     | 2 +-
 tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c | 2 +-
 tools/testing/selftests/bpf/progs/iters.c                    | 2 +-
 tools/testing/selftests/bpf/progs/verifier_var_off.c         | 2 +-
 15 files changed, 18 insertions(+), 18 deletions(-)

