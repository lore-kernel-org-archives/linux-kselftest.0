Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4693559F8
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 19:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792180124; cv=none; b=PMkSQSwei1ty5wNch3JBNcNtmEa91R6e4K7/HA6XmtNMOB+hnMt6Mmjsrv+S4Cj6f/W89lfBaI5xd15roBln8HmADhcaIYZEpr6QssFbooBEDoXjpStd9SAKNWFnq6gKgfXUSGqrdnFv6d7Vs3ZO6lmRJ4Tq05T8oJJ5i2pWebM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792180124; c=relaxed/simple;
	bh=WiKNW/PdZA6AsaEUnVk4RvU+IxiJoDI+wIAVqyvgIvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nMPD6E1wL3Oy3qyZ1YP9mqHDgzzby/xG3I0AODiIo7dOdIHxCm6SgAUs5kgfTmaTs3SObnN78CKAtAy7AuK/rWezT30X5tnAXEXzlIPgf/ftfuN9gDDy+So6vBNXj0ndA3SF53vmOH6LA21AgUAxMVM739y6DBd0Br79MWIqwSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqP+xRmy; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqP+xRmy"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so4259231fa.1
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 12:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792180121; x=1792784921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0hoxXb4s3UEidbFXZi/a4D2GBpFbA4+399URLR3r0/A=;
        b=LqP+xRmyoZjlOGbfkLxhOZll98LV3Ohn7GatOx7CwSIqbbRnWfvMw2Fp6yvAO1ADjO
         oaomxRsdif5cAP872mbOfhfZXCvVKumQui4/9xqVi+tWvcRDAC7QqiV3+wdy8soKcJ9G
         vrswl8xcqZZ1D5C0PKGCWxChw/1V0/wFz5TFq0jc4p8KNJwCxd6CUMYnJ/EJ5mByQy5F
         V+/wfHFXz8nt7dEaqSAj7xMu/EZs3LzKJFGbYARUPo3GQVlibo0is5sFpU9YtVnXElu7
         Otns6wH3FxiPMGs3hkWutn7ElT3a9dHDCxESuB0hSlw5KMUsvUAVV/5w3MAJO47/9IdM
         J2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792180121; x=1792784921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0hoxXb4s3UEidbFXZi/a4D2GBpFbA4+399URLR3r0/A=;
        b=N2szQzxm/wqF1OfsEFdebRrXGnySuSmOm366flmJ/8HuY/I6x3xlveJKegrTyY3om6
         xv4MJzLM8BJ25qJjNHcZQH3Q51nJE7DXHiYiRg1/gBd9M0KT5WyqCq89NJWqMIUnQ9U1
         K25j0OCa2BwiE19zTJh2pxCwbIbWH0ILDYPzm5d49NPFlReZiBDc8m6P68U48pFIlS/6
         4u9sD1iICUw/BhXNNVvdQlC2KiKDbCGjlIRRqL02KKUjvmYbDXZTbeKf4vjeotwYXAQu
         IZk43y/mEQwZ51KJYMTfLkSxaMH9SRh49WYk1zmoEfyw89CntbWJZ/pWCAJp/pY6G54s
         Tqyg==
X-Forwarded-Encrypted: i=1; AKwUvBxGGlDQDgDB/keq6YMlxdaQwqST6cJJ1zzY/Wic3R0H8MJ9vlldsRXrWpGFGLfr/k5uZ7nu+BzB+x6AWhMrqaE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoBlU+32INA/hoiWsnx4b8TsiHESdqMEpwiXh698xZkA8rFEmY
	OI2zMd5/ZfZUw7P/N9VsCc/sHRO4CJ9GLs9/TE1juS1dsfZXxFwsbLSZ
X-Gm-Gg: AYBFou01D+DsGZQ+DrQROLKWabI5WDUZ2dtVAbay4U5jGapjtVEtEnG8N4n+B6HzlZH
	fUK1sb32z5xU7Z880WzoTe+4Mm+LhV1r3QMJS0nLysTUkCc4tXdtmGIjEjTS79KtNFlpBKnPmY+
	n/8Tu2DXdHlNNTTUMTjMRbRnrZdw91w77TwDAxlTpQm+q10Pl5yYNUcTuCNxKzXzct/Lrg77Cfq
	34dAijwvYZcIiztDyKpjP1W0yyKXv3MLJi9y8MkGJycLW8z4DHVOFLapTTahs24/8uR8Va7CaDw
	n6d+8tcytQqPIcVth7SEKVbaGRbaPeZRx/dRTmXfTN0OIWx0bDDP8OaZWa+xjOWphqtV05unvwG
	pghbOfZFzmQcxqjj74mn+Jpa2ai/SYmbC2wNRlsYC0TP3QugS/CDqAR/vo1nk1rAQNfGTlOR42W
	nm4mlcqL2HnVCFIfXQLJ2RKlEmuXvGj32aU+DNw6fSO52HcZfTtkUpHpDEq8AxMGGukc3z8MFoT
	3WrL5CI6Gkn8O03hfpEOt0YhRy3VN6qfyePIjNLEMf8scnGVGNy
X-Received: by 2002:a2e:a988:0:b0:3a8:7caa:cd4e with SMTP id 38308e7fff4ca-3ab147c819dmr9590771fa.13.1792180120831;
        Fri, 16 Oct 2026 12:48:40 -0700 (PDT)
Received: from localhost.localdomain (95-24-167-79.broadband.corbina.ru. [95.24.167.79])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab2a4691f2sm1179411fa.19.2026.10.16.12.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:48:40 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: bpf@vger.kernel.org
Cc: qmo@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	kuba@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	hi@tychen.cc
Subject: [PATCH bpf-next v5 0/3] bpftool: Fail map dump for maps that can't be iterated
Date: Fri, 16 Oct 2026 22:47:55 +0300
Message-ID: <20261016194825.230433-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"bpftool map dump" treats only ENOENT from bpf_map_get_next_key() as the
end of the map. Map types that can't be iterated (local storage, ringbuf,
bloom filter, arena, queue, stack) fail on the first key, and bpftool
prints an empty dump, "[]" or "Found 0 elements", with only a non-zero
exit status.

Patch 1 adds a helper that prints ENOTSUPP (524), which the kernel
returns from some BPF commands, as "Operation not supported" instead of
"Unknown error 524", and uses it for map create, map element
operations, map freeze and prog run. Patch 2 asks for the first key
before printing anything and fails with the map type and the error.
Patch 3 adds a test_progs case on a socket storage map, and on a queue
map without BTF for the plain output path.

The new test fails without patches 1-2 and passes with them; the other
bpftool_* selftests pass. v5 was tested on x86_64 under a bpf-next
kernel (d2141481a764e). The ENOTSUPP message was also checked by hand
for map getnext, lookup and dump on ringbuf and socket storage maps,
map create of an LRU hash without preallocation, and prog run on a
kprobe program; map delete, pop and freeze use the same helper but
were not checked by hand.

Changes in v5 (patches 1-2 of v4 are now patches 2-3):
- new patch 1: helper for ENOTSUPP, used in map dump and the other
  places where bpftool prints the result of a command that can return
  it (Daniel)
- patch 2 (map dump) uses the helper; kept Quentin's Acked-by as the
  change is only the error string
- selftests: check the full error text for socket storage
- rebase on current bpf-next

Changes in v4:
- selftests: socket storage always has BTF, so the "Found" check could
  never fail there; check the count on a queue map without BTF instead,
  and fix the comment on create_sk_storage_map() (bpf-ci)
- selftests: split into sk_storage and queue subtests, new subject
- rebase on current bpf-next, patch 1 unchanged

Changes in v3:
- shorter comment on the probe (Quentin)
- selftests: unlink the pin on every exit path, so a killed run doesn't
  leave a stale pin that fails every later run with EEXIST (Sashiko)
- collect Acked-by on patch 1

Changes in v2:
- probe the first key before any output instead of printing a hint for
  ENOTSUPP only, so every non-iterable type gets an error and stdout gets
  no "[]" (Alexei)
- drop the Fixes tag and use a neutral example map (Alexei)
- selftests: check that JSON output is only the error object and plain
  stdout has no elements or count; clear the output buffer before each
  run (Sashiko)
- multi-line comment style (bpf-ci)

v4: https://lore.kernel.org/bpf/20260928001513.7072-1-skokovmaksimevg@gmail.com/
v3: https://lore.kernel.org/bpf/20260926170149.541352-1-skokovmaksimevg@gmail.com/
v2: https://lore.kernel.org/bpf/20260925162031.27259-1-skokovmaksimevg@gmail.com/
v1: https://lore.kernel.org/bpf/20260924160732.485650-1-skokovmaksimevg@gmail.com/

Maxim Skokov (3):
  bpftool: Print ENOTSUPP as "Operation not supported"
  bpftool: Fail map dump for maps that can't be iterated
  selftests/bpf: Test bpftool map dump on maps that can't be iterated

 tools/bpf/bpftool/common.c                    |  11 ++
 tools/bpf/bpftool/main.h                      |   1 +
 tools/bpf/bpftool/map.c                       |  40 ++++--
 tools/bpf/bpftool/prog.c                      |   2 +-
 .../bpf/prog_tests/bpftool_map_dump.c         | 133 ++++++++++++++++++
 5 files changed, 175 insertions(+), 12 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c


base-commit: d2141481a764efdfaac70965ea28e8925f6a6b80
-- 
2.47.3

