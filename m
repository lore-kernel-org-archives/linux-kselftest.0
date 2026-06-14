Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5373339A057
	for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 09:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781429189; cv=none; b=bqvZGMw/2MlXkg6mxrllZ1hhK1yzSGFXjHMg9jzKdm/BGvp1BeEtOm5PJBwP82avQGwqNEGCGfkeW/om4kd2k3XaGNp5dyAb0K+yvCXBW39wxFn/LwbVPm1PyurLNSAYRtwBGHa+bfFxwzGt+m4j183KqXDeoTwj6UJQBU65ycY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781429189; c=relaxed/simple;
	bh=tl1gbtf86a0S1llqs4X38XTvX69cB6KA93mt/uCE6DU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GKtayy1gF7DDQJZjB16WkW0fA5G2LLBsE74gSXdyQogI9Sn9qeP+/Gh0wDHbWrrSa5aiARRtqv9bqLVWy4DjId0n5oXHzyePs0QX5SYez5jaqup6QJhTrNeXeqfsyadqTLc1Iwe7L/NpmMr/0NuYJdi5W0dQnv4/w6U2fzkkRpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJxYLBHY; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJxYLBHY"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c86214eead7so969426a12.0
        for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 02:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781429186; x=1782033986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d16k0vZR1zettaTdZ3HXP0MjQdOsOHiGY8GKp79+E2s=;
        b=nJxYLBHYRr6bFb4koagSWnjAp6lTGLoCkFZJzRsoGSN1dT/1xDST6P72Y1rS4BBU1c
         /ksxdMoKaCFg7E2lOuTSwgDuOs6h1YkOhakArzUIdQhtTBByERozUohhr7mfOfEoK7V3
         0BNzn6CPonQ3WFkv9POg3+TS9a74S1jnU8jXget7Q/XfKXKB5fJF7gfxbzyKzHmUhM1N
         R6ZE6pHoq8UBJg7x3oKdcUGTC/PT+CgeJMPR+uJOwU3hed2+5CtwSPacXHBCSgsHlQpX
         r7Xcbi3hM8aZAYTYNTSbZJINtEu8SzEz1SFviVZmgUcrsQKTI/q59ows+4fRtb87EyMc
         RjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781429186; x=1782033986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d16k0vZR1zettaTdZ3HXP0MjQdOsOHiGY8GKp79+E2s=;
        b=oCrq91MaAlU21OsA3XomnpFbBQTYiq8/FpUeaiFvdSLOtNF7ABELwwNioabsDHbwF2
         6ETDakwabp9tjagiZJSVolFCqLLz1r2N1Qn/TcvvwKO+EnfPrZqHKxc/yTIjuP2kxwoh
         PicuHg83qOfgaIVtwNVWqBVo5rr2wjOJuOGUOj3ZgjKnrwJxqCcnkfEf7tOtMw0dSRBH
         R0O8RClBJkH/73aY3vjhESI9s2mH6J7jQF7x3OtZcUBf5Y4DLzU0LcF1a0SM3oTIUHPU
         W7hSNh8MF503n4imBnPzFjXYoSeyxBuC8XnScJTbfN5SmDo8NUZA2uFXFkFP1AVkHjlU
         gN2A==
X-Forwarded-Encrypted: i=1; AFNElJ96c72Umbd4aE1jiYMG3HxLR5SihYIdKXJeS3W57szjxU62oXLyQ8Snl0qBfy2YCaNw96Etq2HHtGo83RUtqdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyWgn154yvqJ0wilVwlQsa6TQnCmSIL8lFblSXrAuxCumV1CY6
	OZ66K6AzR6r/E4Ta1kFyv/SPMhMgmWgFCORCLhBmykq5/pzeIAw1I2rC
X-Gm-Gg: Acq92OG6AswvzFcMUHhlanTlE+jfHspJsEKTd/XhblS55wr+NEOTNbGJEvbh/hgnD7O
	+TIAy/eQA9WL8W8wp99FInefV3Alj26gxELm59v0kkKsp/rv4MSt6TWyc7e/0vnXbUglVd6CQdg
	AajCYXx9j61Q/3rJ/Uz+1Z5NeGoJzg3yM1/t0WEqWg3+ld8P0NSwEFjKTJ1dUG8XECQHuXh583R
	nZ0kPpehSAsnwkmjSgMyBxtyf4jzklRecw951GhFDrQV2ixY6esgdSD6o/OsgEXt5jw4qoZAFYa
	CW+4IdaOtrPq3wI95Z+2f1VNJupBQM7ul6fhxdsn9BB9vfygZ9X/ThhCkFk7vmCYwpfjZ6gpVXG
	Ck2qTzih6qYjoBAqoYMyMnFjY10toizwY/5EnY+wX7S7SffYvWX6kvpsxfmflI96KDwd8XsY6JQ
	I1FNgolcTJ6B4x8Xj9Wrh3T900tC7Lv5vBXFEQB2GNkaB0AYLKICeAuCF+sGruwjkqS4+vwJhTL
	53vHq3gTAFq3+nm
X-Received: by 2002:a05:6a21:9207:b0:3b5:530d:d96d with SMTP id adf61e73a8af0-3b7857de1b2mr8737610637.12.1781429186348;
        Sun, 14 Jun 2026 02:26:26 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b057461sm8198423b3a.58.2026.06.14.02.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 02:26:25 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH bpf v2 0/2] libbpf: Reject out-of-range linker relocation offsets
Date: Sun, 14 Jun 2026 18:26:14 +0900
Message-ID: <20260614092616.165337-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The libbpf static linker validates relocation type, symbol index and
instruction alignment in linker_sanity_check_elf_relos(), but does not
check that the relocation offset is inside the relocated section.  A
malformed BPF object processed by the static linker (e.g. via
"bpftool gen object") can therefore carry an out-of-range r_offset that
linker_append_elf_relos() then uses to index the section data, reading
and writing past the buffer.

The normal object-loading path already rejects such offsets (libbpf.c,
rel->r_offset >= scn_data->d_size); the static linker path is the
missing sibling.  Patch 1 adds the same bound.  Patch 2 adds a selftest
that builds a tiny object with an out-of-range relocation offset and
checks that the linker now rejects it, with a valid relocation as a
positive control.

Reproduced with ASAN: before patch 1 the out-of-range relocation is
accepted (and triggers a heap-buffer-overflow); after, it is rejected
with -EINVAL.

Changes in v2:
- selftest: set the generated ELF object's EI_DATA from the host byte
  order instead of hardcoding little-endian, so it works on big-endian
  hosts (e.g. s390x).
- selftest: add fallback definitions for EM_BPF and R_BPF_64_64 for
  older system headers.
Patch 1 (the fix) is unchanged.

HyeongJun An (2):
  libbpf: Reject out-of-range linker relocation offsets
  selftests/bpf: Test linker rejects out-of-range relocation offset

 tools/lib/bpf/linker.c                        |   6 +
 .../selftests/bpf/prog_tests/libbpf_linker.c  | 231 ++++++++++++++++++
 2 files changed, 237 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/libbpf_linker.c

-- 
2.43.0

