Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5A047AF57
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 12:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782457; cv=none; b=KLCbdBJDvVk+QiCuN8FvXfBJu8t58F8dlnn6CCXtSHcDTpHPIVe2sd5a9kdJkaUVDsVHXM4A9JXs8j4mihv+RaHZR/O4ELM9gYbruWuPrvQR606kiR4fz4Q5wfRfE0sFKQmbadBTVHvwIfNAFI0n81Me2l5HgR4yYOAnCSmbxsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782457; c=relaxed/simple;
	bh=h+Kh8E3B9cClVtp2kBnxMFwcb6cfCI06S4hH9JR3j0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BZHCxybIh3lndMkPIvkqR7h4xtRcFviF1LfDQztn70coCE3609XQA+RhMV3epWmedJhE/FGW2fJRR5iINTZF3tH06C2PnRy14dEBPev8rJpM5FcmEeGt5z2kQdC93w/AK1cg84UwiY3yIABC7VtbQX3JSZGdRyr4fA8k4Qa+Eek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qa9hLRnH; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qa9hLRnH"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f4ea388ba6so3322154a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 05:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782454; x=1789387254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jE91T1YbcHjh2wKlRe2CKmWmk4DasShLxHNl5T/s+ds=;
        b=qa9hLRnH8KTotU++6Abntr/U7PtE4EUsLnC8qBLzzETBcFszxpWYBGxA8es1dQWNlk
         fOEx9XpkG3SY/0hb2qHXLIejfkNYWkSYZQD7ioK+ZyzBK4Qw5KFklDBmrtBu/VWIs6oy
         4OOKrzESANPFa/cLHQZuD+3u7pq+ouUtrikpLISY+KP0VM1E0gDhPxzO0p5rBe6pLzx5
         I919vVd5pPOS56tRuK2L9IKqKKeifo7BKWDCrhW9OsXf08XFGaek5UrOOzJ6QFyHG7Jn
         MUG2oSgxghfypy+6jiWS5GgECPGYf59bmbHtnwgVv7FNGf8Hb3Fzl5tajL7SsZaA6Dxg
         TSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782454; x=1789387254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE91T1YbcHjh2wKlRe2CKmWmk4DasShLxHNl5T/s+ds=;
        b=M6tUeChWQ3aCAekYMnd5tpwQmDKrXRp9P6efSUmAXhUbvZ0uqJ6VBDbBalgLNMuw42
         CRWFfNfeuE3Lq8WvttP1yEFuiHWXV8Icdnub9qqHlObhehOwv7GWsqHmNyFlU00O4rqn
         +8WTW7eAR5Ov+iAi8IuzTJ7GR9vx94VK0EfFLsaW3DpT6ztCeP9aAMcsh8rA6nOLDg9b
         Wb5Gmf+L0ujD1nnj9uEopHIquMoJTHgri9svzoCrdUP07STlpmDx6E8J0fCvB6xIq77r
         sSkVe38oM3b4OpGGg+mNfdpq5+oLRYm690P0XBhQ7ILcJY+j5xtwaXk9MsSL30JlpGYr
         8mlg==
X-Forwarded-Encrypted: i=1; AKwUvBxlJwjrZj+0tkMkfo+Gihw0PPPUR2DmBSGTN9fOIvn0FBt5IgjKjjPE4taZdqADgxIoKsZ/zqtLZGC6z6sZL7E=@vger.kernel.org
X-Gm-Message-State: AFuF++kP3VILDq5fFoVd5SZX0q3hMDdofPkxKhDxQxDiS57y4DplDUKu
	vqoMJ6ZnJQ7QQ9xQEkLR7beHicD5h7M2eCMoD8cMbmw8fyV+2XufO0P5
X-Gm-Gg: AYBFou0iom/uj4k7qGSRvKqj0W9TpPXN8ac2qHg5GU1ZIberIE23SsJYQJlP2+FvOXU
	bl8gvWLYbOVCxgmyTc9bI+IdXQVNJ65vlTpFc3cLDnKItAHW4kgH0DFia1Crgr9biLXGP1dEHYe
	GJMPtJma+A1WGe/v6TtpWJZZCloQa3fZpmY+tCqtS33SQkAYdbrLyuebvgjvmQOxJ0UP4BQsbEU
	kZSIgi8rxealHs2fZ3eUMs4P9jBWFwFZ1x/aH3OkkIPJ13nLW7aE30R6cVtVlIExK1Qznsasvpz
	9r8vk0HmoiMj4SlasEMO9/WSsSrd1uBDlYz5SUBDuB/7e+1neEfIDtKIcT8p6frDUlUsYpPKxZu
	td1l6iJylDUPDPQvh3YsTLS2rJDzYnrLDm4dSr0qSRMu/yilXfNtQPpm56C3t5jP1m5g9BpXH9V
	lIHGaLR1q4ITaYvsTUf+wCPWb3fII6Ij8AZ58h2emNtmbFNSKXUX4pjHPLybbR6USUXHj8WqzBP
	ilOglMq+3tO6Q==
X-Received: by 2002:a05:6830:4424:b0:7fa:5c49:5243 with SMTP id 46e09a7af769-7fa5c4954c8mr12688858a34.28.1788782454447;
        Mon, 07 Sep 2026 05:00:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm31244462eec.1.2026.09.07.05.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:00:54 -0700 (PDT)
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
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH bpf-next v3 0/7] bpf: fix typos and repeated words in comments
Date: Mon,  7 Sep 2026 17:30:36 +0530
Message-ID: <20260907120043.36894-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix misspellings and repeated words in comments across the BPF
code, found with scripts/checkpatch.pl using the misspelling list
in scripts/spelling.txt.  Comments only, no code changes.

Changes since v2:
 - rebased onto bpf-next; v2 was based on mainline, which is what
   the BPF CI reported a conflict against
 - dropped the kernel/bpf/stream.c hunk: the comment holding
   "accomodate" has since been rewritten upstream and the typo is
   gone, so there is nothing left to fix there

Changes since v1:
 - use the selftests/bpf: and libbpf: subject prefixes that the
   rest of those directories use, as the BPF CI suggested

Hemanth Selam (7):
  ARM: net: fix typo "arithmatic" in comment
  bpf: fix typos in comments
  powerpc: net: fix typo "upto" in comments
  selftests/bpf: fix typos in comments
  sparc: net: fix typo "evalute" in comment
  libbpf: Fix typos in comments
  selftests/bpf: fix repeated words in comments

 arch/arm/net/bpf_jit_32.c                                    | 2 +-
 arch/powerpc/net/bpf_jit_comp32.c                            | 2 +-
 arch/powerpc/net/bpf_jit_comp64.c                            | 4 ++--
 arch/sparc/net/bpf_jit_asm_32.S                              | 2 +-
 include/linux/filter.h                                       | 4 ++--
 kernel/bpf/reuseport_array.c                                 | 2 +-
 tools/lib/bpf/btf.c                                          | 4 ++--
 tools/lib/bpf/usdt.c                                         | 2 +-
 tools/testing/selftests/bpf/libarena/src/asan.bpf.c          | 2 +-
 tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c       | 2 +-
 tools/testing/selftests/bpf/prog_tests/task_local_data.h     | 2 +-
 tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c | 2 +-
 tools/testing/selftests/bpf/progs/iters.c                    | 2 +-
 tools/testing/selftests/bpf/progs/verifier_var_off.c         | 2 +-
 14 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.48.1

