Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C192736F433
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 05:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846547; cv=none; b=itSIeVpaFmmwyT1+t7jkmkWwaVt3lafvaSpOmusVYjNET/smm2uyN/FpOW5OjGgSCZm7a0ef8BuKZoywgCo+Vq/cv/eVXN7cNVpi2/n/M/pIp1zvG0TygcGI829vlPKRjWIVl0yBGM0aQk6VaBN4dctiHdERiVfVSMWUvvpcnLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846547; c=relaxed/simple;
	bh=VyhIDkMGxjIHBAZdaTDfNNTavhuZAK2+hkjy/GcRv8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iqAFN5iutRWRy4FuD9ZTKh8CJxKvPJBX8LU84fu5Qqp7RxMusKVrnnU1aV0IbaRisa6a8J/vCk34VQp6fBDa1tHf9XtT/2Po5GKgw6MaipuDfMAI/uKP3SUSVJie7GLkxkrMEiTU1PnOJTAflCDh46pBRbSbZEgoYdcjBHbFjvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIxqxowJ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIxqxowJ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso2817032b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 22:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846545; x=1789451345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Hk+XNhijnUk0JrFp3DVPvigSnryVRt/+DzNzROaqfU=;
        b=XIxqxowJdju9k542yAl5qdvceLTQwlt5Enxen4g/8x5W0oKqWFiURRWEBZmkac+h82
         k0BsV1KKSaJKStBBqxqBnLGkI46TCD0/0NYfC2CP/9oa+3o8UF/A+NOkDwbZOvn1sBIM
         NBUXWWrcc8dI70Gi8uQ0WxVuGppknP5LWHWjULAI8vENPOOmCOFGRHgnEO9vjhqpcn3t
         hAq866hwuAFW6uHkme/Mf+ketRBxfT6DKjLeGLY4wwHkrE36s9DG8YmMKjEQsP95gXAQ
         r47C6bellblHD53QH2c3h508qgd6nwzTwuaBUgNNjBQNttkcqGLQSJqGoVSFmBxVrV/9
         S7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846545; x=1789451345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Hk+XNhijnUk0JrFp3DVPvigSnryVRt/+DzNzROaqfU=;
        b=NkawBdn2fkIYWhPp2YrWhfIzgTQ1ISbhAaJTmgXcEctC1CbIBvv8XJl/7lzsPQNwIN
         0hvNokkZY3IbkWT0mn49ZDxAvVHFyvoQ+YU/36wpGQtVPS8wWI5bXgNYbSKyZQuh8Qbt
         /wijNob1YV0wfXdvuUUjFM+Bb5u6rJpus3tI1MBahTWmudr8SZ9E8ZjEnWA8OfI8FWvO
         Hny7Gbgp2VZv4DjtnbUmj2z3zPNnPTAiHWD7lI1AguuxN9W8ByCwTLO72tSaKzGdPXOX
         WgU+OAJlY81O8APanlWbHRTMCQlz4+fKHKQXJ2zVd5dkkHKm7LHSX0Mu5Iff5Ws7yck9
         Heqg==
X-Forwarded-Encrypted: i=1; AKwUvBxiJ/UMD5H63/Pk6uHzrU0j7u+ISAfcNBxRx3m03jTFA7BfTqESEMEYsV4tM9eawVbBJ45TnV/jTMjxVldR8A4=@vger.kernel.org
X-Gm-Message-State: AFuF++mg5DHE/JSNMJtZr4n8YMxgbJOqmNQ9adGCzq0lBBvDIeD24rOk
	8131elvJDpLkszipDq0o+OYv0Ne5k3Lbe9Unmh55a8tp7S5hG7/Bq1FD
X-Gm-Gg: AYBFou1L7divdUwUw9xxIKJjDh82H11K5cyy88VWyS4Vg8gQomAF4BnDeuad+yUBy7i
	N8VVOoXnVtOo1u1nyDwzE0nc5ECDo1OceldwJ+KbU/JVsq9u/CbquFiPg/X5PfyKcim4u2etNKC
	O34gesWfcEWywHmQpuek+7N84xzuWCIuiaDUbJ1jL5U8w5Lb026M9RKDoKP7bLvl0ycZV93c/uF
	J7A5XYqUCv6SIoARk+QC6stDZwdAit4+47x4MM3PIhm3Aal44EkU0q33nVtFKl0vIOtydDico6Y
	oO87cKGWawVxXBWEfYVWtVwDRt8qtU5672ux5PzFDmB7Ekv2bGlWW8qveL/E+U4b++Jy2GuHox9
	xK0qZSwI8b2KS2KOo09y3/c6Aqev/HUoh+2D5s002Wc9ppltAq8S+lcVo0oZeihGotj4svfiTsY
	dy7aYUDo9B6r4pZsQnrXdA8RWth8iWx2gxgNgIxGABZGVJQsuGfv/I1rbRW8OedbDMwdzvqlVt8
	b0+KWoBOpzk9g==
X-Received: by 2002:a05:6a21:38c:b0:3d3:ae1f:d7f8 with SMTP id adf61e73a8af0-3da3a0cc91cmr42893779637.24.1788846544946;
        Mon, 07 Sep 2026 22:49:04 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-334fbd5e6f6sm25690109eec.23.2026.09.07.22.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:49:04 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 0/7] bpf: fix typos and repeated words in comments
Date: Tue,  8 Sep 2026 11:18:46 +0530
Message-ID: <20260908054853.13820-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix misspellings and repeated words in comments, found with
scripts/checkpatch.pl using the misspelling list in scripts/spelling.txt.
Comments only, no code changes.

Changes since v3:
 - rebased onto bpf-next.  CI reported a conflict on v3 and asked for a
   rebase and resubmit; the tree has moved on since and the series
   applies cleanly again.  The patches are otherwise identical to v3.

Changes since v2:
 - moved from mainline to bpf-next, which resolved the earlier conflict
   in stream.c where the typo had already been fixed upstream.
 - renamed the selftests patches to the selftests/bpf: prefix used by the
   rest of that directory, as CI suggested.

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

