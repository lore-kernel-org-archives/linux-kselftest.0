Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641445;
	b=vJTZ/d1hY2mgQjAKMM1betuKxlF2HqPl1k6+80uMNRkSy8E+lJZzygqh29I+3mf0lmnd
	 gxEx3R1SgrkzSY0uUWlbB3VD8/ZXGZALJ/OIc2VtN+1JhdELSu0oobksJ0Nzvab4MzOO5
	 ak6PMBkqBDb2sfbCdFyE4kbmgfy6IIi7rBqyfVJZe7uTaO6aCrAKvMGJ9U+5ac+krS8dd
	 pEFM260pVcS5eHvrKIIIBnwF1Ujm2AZNrY1+Da97ZKucsVK70rCZN82h+y6T1Jp/Q0nAf
	 Rns5JXNs8ESftDJwrWyiOGtF18Q3NPUnCV3WFrJP9rAddO4tzP4yH2tI8GVFsDa2jEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DU6n5xddllI3TFFpGzdMLCmW2JMizz1ppgKr4JRiny0=;
	b=MNeyCyTuJrkifwxIX7q3jX73q2SDbwVt2GMCKup3jAosd1aQppj1Ssqo3Z3jp9UR+pYl
	 9dOiaOFffYyuYFl0BkfcD8l9LKeYR/zK3Kw+H+mSiAWbh2Y5grpl5PJ32Jv0EMjPvPUwK
	 9BpdAKnitrDUt5bLb+hv/gJiADaScU1w0wCZyS0ZlTTHvUolyWQ7qR/51aDCZ7jsqXj+Z
	 qWugVL81iu1qM9fS8IrXixypcJBkxc50VBZJcYv+vKRI4rTT0NhrC6suevNLuVPE7t3Wy
	 oEFgzjWL7GNIPGC9pPc0TQ5V8dYel6WsuOcZKlVKQv53tMEnxX7Xkee63PU+zzvdVGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ELreSK/6";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04031606A32E
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 17:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04031606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ELreSK/6
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so31921785e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 09:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641443; x=1794246243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DU6n5xddllI3TFFpGzdMLCmW2JMizz1ppgKr4JRiny0=;
        b=ELreSK/6sFM2LAmhADhCQ+Je840uXhfuSmlxBE2nyYecZDxpNCEdvZIZP5MgGlerwN
         2bgPw5WGEZEfZ033KjYNcUP1+lOJmHbbChgRRqJhSpFcHXg8sUokgDDste67WVukBG5/
         nrW7Ho0LPvfbLnj8L6PkQKwAJCu1zz8d5ZXRcvFFZ69B4/OljG32iAn922CXQzvSfwmj
         JN27kOXyV1+LqkbrgJMW9xjKS/cWpKaVhcnSOJ0eD85iyBrsnHmXO6bXN2K+jP59ZoJh
         GnnrE26mDV7Svi4EToXq8/JYskzjJru9AgygJJvB35aBgSwpDO7ZGARzxTPAHHtdWvxy
         t46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641443; x=1794246243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DU6n5xddllI3TFFpGzdMLCmW2JMizz1ppgKr4JRiny0=;
        b=Pm+RXM04frVWunl7pqBIvYHVXciyw4IGZ8vAVqqXGBPJgAajKc0U/jCdK/xIGyX0Qy
         71pEZX0B+o3Pj/AZrRvigzGHcx1/s+xtzu1uspNjNdenA1Mg4qvIsYwYRFdBwMS3COX4
         l8sdHSfCdasMMbJAaoVh0BCLjhTUckecfxe8YaYlaQhh2tgZotxlCo9GnVoI/vmhvMzU
         jwPEGfA33Vv5tvDiiLHHQZWjpYbmex8zYuooDozubRdZwgFUi8Ap1npwmcmScRsNjBMg
         BikcgLCijRcE8urOHJzzF6UKs7MgAdTOORgq1BZKFnWG3pvujqXXZ8dt/3XRPagEv2YB
         1ZCw==
X-Forwarded-Encrypted: i=1; AKwUvBxC5WklV8Zwf0mv4J2QkImkNFX0V2ZeLmDFL0/VuOmdV650Kr1/cUTPvNtqMWi9nvevTC8nqAubLRMBgR1iDQw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJo4vr0il6dfrmWgeOeaB8eH/wdctakTqeZcQF8mBX4DJjH4dAD
	bC5LtwI9It73o8gcQgJMrD4diCqbuSbSfuFJk9fzTIoSwPAHLC4jJiLK
X-Gm-Gg: AYBFou1/xIh9Zyt3GpBpzv8LpoLDD9ma6BZvUrmzbZvkiVN2mqPgzy/dom2l1GwKtAX
	wWPPtj+uwifr/57a0iFd2WzFctoB2MnxDa09+k/7xh+dDDv9uM2jnIT39Q2R5UtzwgKREyk1BK3
	mqUTn5M3svy2m/ftVniOvA01QWSj6gRsMNfB1HM9BLSeRqLW/d1jmRDAbdOM4qYTSN6Tn1dOEEC
	3VCm3PHDc/M6OZTcMgez9/pF6xW2FSnjJ4kvadQUrEJo28djiT9h2AaEHE5cvbWQqlssLgt1uYO
	GWqGTM5Snzslj+LE3Sylp9l3qwMVTg64p6be+OrDsHPPHjYFPw90ZHeS2ukNNWJx1rTmg1X8ria
	/Z7gxNxObEbUuoId0l6rHc2uN6Z5aFDVClAy67d4hNqKwl9yUdteFZ8RehlpBECB/y+23Y6DIyg
	ABzcxDGgPeRBsU8czNt4e5n8Tvyv0z+hmOUv6APNv5Rof03mm57mhVBbU7NbGBUpLSQmjGST6TX
	zJB3kaFxph3ZfkC6Kx/TJFFBL/kDGkhek13wnF7+vXm6fyquZwpJVXNXkzQ0MrnfIKhNMrrWSZn
	PsUxiEqFktd9bUKjWJqff82wnZJJ9xfRN/sndWeixgePVdvBLXdocygBV41vHRaa1fEuJEQEgfW
	q2w==
X-Received: by 2002:a05:600c:870f:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4ac185bcf74mr238434735e9.15.1793641443318;
        Mon, 02 Nov 2026 09:44:03 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm196311865e9.1.2026.11.02.09.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:44:02 -0800 (PST)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bpf@vger.kernel.org
Cc: Quentin Monnet <qmo@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
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
	Shuah Khan <shuah@kernel.org>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	Tianyi Chen <hi@tychen.cc>,
	Gyutae Bae <gyutae.bae@navercorp.com>,
	Hui Su <sh_def@163.com>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next 0/5] libbpf: Support gen loader attach
Date: Mon,  2 Nov 2026 17:43:45 +0000
Message-ID: <20261102174350.472592-1-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hey,

I've been working on this in the context of Shirudo[^1]. The current
limitations we face is that gen_loader cannot attach the program it
loads so we still need a userspace component to be allowed to
BPF_LINK_CREATE and we'd like to gradually remove the allowed operations
done in userspace to solely rely on the signed program.

Note that there's no kernel modification in this series, it adds the
gen_attach options and code generation to libbpf and do the wiring from
bpftool. The kernel side was already allowed thanks to 'b1d18a7574d0
("bpf: Extend sys_bpf commands for bpf_syscall programs.")'.

Also note that I did some analyzis with Sashiko and it's been
complaining because I've followed the approach with the prog fds being
initialized to 0 (and not fixing the two fds to init to -1 sentinel
value), so maybe we should pre-patch this.

Lastly, I don't know much about bpftool so unsure if the way I've added
it is the most appropriate way for the lskel attach option.

[^1]: https://lpc.events/event/20/contributions/2437/

Mahe Tardy (5):
  libbpf: Count entry programs for bpf_gen__init()
  libbpf: Track generated loader link FDs
  libbpf: Emit BPF_LINK_CREATE calls in generated loaders
  bpftool: Add attach option for light skeleton generation
  selftests/bpf: Test gen loader attach

 .../bpf/bpftool/Documentation/bpftool-gen.rst |  11 +-
 tools/bpf/bpftool/bash-completion/bpftool     |   2 +-
 tools/bpf/bpftool/gen.c                       |  67 +++--
 tools/lib/bpf/bpf_gen_internal.h              |   7 +
 tools/lib/bpf/gen_loader.c                    |  41 +++-
 tools/lib/bpf/libbpf.c                        |  56 ++++-
 tools/lib/bpf/libbpf.h                        |   3 +-
 tools/lib/bpf/skel_internal.h                 |   4 +
 .../bpf/prog_tests/gen_loader_attach.c        | 229 ++++++++++++++++++
 .../selftests/bpf/progs/gen_loader_attach.c   |  48 ++++
 10 files changed, 436 insertions(+), 32 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/gen_loader_attach.c
 create mode 100644 tools/testing/selftests/bpf/progs/gen_loader_attach.c

--
2.43.0

