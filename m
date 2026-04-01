Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A202846AF29
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 16:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060137; cv=none; b=nNOsnBmoiTcmUeixI7O89zeUUEFnjp8S/Sv0M0RXoucWOzqzzgnsKQGMiYMBDLfpa9INoE21kZl36TjJZ7HTj0Xc01Om4u1xf1zba90zJKW+OFH7S8HzfGqOI5zgIgEkSiYYfj8H0bFk2ZjrLgTJ+CGXUq0m3cuFT1yzAl7dRtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060137; c=relaxed/simple;
	bh=39Oa2loJA7hp7uvZHKhwdxu0ZLV6qyUTOt1cn55M7w0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DLV2mIjag9LB/3IJHmEF+nMwIhBkY6RWa3Om5MVybOU8BZ62EnjXSHWqVTP3WvW6FG3/YC0i6v3K4P/ioeoV9Mn1eeAuhDDf3Vw2P+mxE+uD+msQOS/XXCRwLaNX4kjrXRg4F9NeyfCLBNJXpze7x0SD4wWM967KBhaU9Lz3lRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RnmoBVEM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RnmoBVEM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so65709695e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 09:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060133; x=1775664933; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PVrOnlJE4y/6fgO3OqR7CiW+cGL6Q90xMJNV21DISQY=;
        b=RnmoBVEMwwZTTltuUDCol53d87HnI8mC56oYXW+kEfwt1UEKdEbz4XP9Wi4V4Gd0hm
         2saboE2rNXBAmTDNWOit2m84j+r4gIp+Vns0uQla5amoH8NUYsbCSMsQu372Fr9kQd2R
         z/X9oKXz/ALNexYZs8xR7U+ap8N0K7sd0DIDO8xoNXeL1Dy8Kr+mMADd0pa2OPiSUkQt
         EpvObWuvWKgHRbfU1AeK3wSOwpe4J+K1qmT+4p5B4+bUhEezFVIxUzl0X1K5gHUpAbgH
         GZ8iCzS0jbYPUXnd7JkppZgL9W7l/8i7C5Xria2TUhrH3Inqxp4pa9slMvUrw+bltJPk
         i+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060133; x=1775664933;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVrOnlJE4y/6fgO3OqR7CiW+cGL6Q90xMJNV21DISQY=;
        b=kOiJROlpcYZMci8TTpQLl2XZr5sG0+vQQRj3Q6vNx8dwr0GwMMR5hA0oQPB5lqhPQP
         QPOg3Wx/f+oqK6uRC2ZVo1wX7Cjp3ahVoZJgfZ+drE48Zv0i2XZqZdWHVT0Ab4UdBXtY
         cwGDJOkJbWMiLJmw/JU3jaOTI3d65sMHq+a5lpapUFMfVv6zCqdAkEsyF7/z1pK01dTW
         rF3PVjblLgywxBHpIP691+mTiIt9Svz7L9W/pz8oIlOYYOCZQg1KqVIO0M8p41jtkdL/
         TmQ8ve+vSK2fUUvSFJUQzI63q7Ea/dq2oXyV5CoJXPmfnLgR8nUNDBj9+WMOrdySRg1i
         TijA==
X-Forwarded-Encrypted: i=1; AJvYcCXQP7oaopUpDYLvnxahpBr41oqbUCzjK5jn8cAkJp3HZfZxYgFOAmQTPtPEkGeY1k7k8Ap/cwkHR2KnUvEVHMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2fnflm1dTZJgyA/ogCpL83dF+lNDoYZz4Jb/bEoCG3W3/U8a/
	1e2uXUyqzdiJozemHMR/tsPW0t1/Vt9RpiEXkKlWunEssDyuqtAvtlj6PaErIcneYwk=
X-Gm-Gg: ATEYQzwVjrYXMB7aFBWvwUqMWKy/4P181mM7TSOpU0+zao2C/RTjyw6dwlSxnf0txUB
	2ZwXFlSel6hvZlVCc8ZNTkCDMpJkGubblSGsebXT5RborkZCxTMcOYoJcoPi/czXz0qTpv5QoYI
	x8vMbe97rxdaCF2+b8WianekcjfZ68+LzL7jv5Cr7JXE3dELMjuhnmoWTjDlTA6WZqxJxAGJUea
	9lfRe+jZ2pQUTOVEdyLD7bF8HvfwhDv1gJpzOD53Z8nlCt+p/CGH+MV8s97vlnbEYVMax+O4uqK
	0E4rlnMhJT5+fH/jFjEcw1whzNRWbysgYufTzpbxculW3WhYSPHaBxMB8casV94XSU0C8gfJEIE
	0JgYs2Gm12zNhXsWcCXDCtVrS5J3HZ9NSBAWmgQCfuKC4Yha8q+uB/k87zuPg98HWNVb+5OiGOx
	Jpu2XEB68P
X-Received: by 2002:a05:600c:8b08:b0:485:3f1c:d897 with SMTP id 5b1f17b1804b1-48883572159mr70556245e9.9.1775060132990;
        Wed, 01 Apr 2026 09:15:32 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9ba81b53sm13782e0c.4.2026.04.01.09.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:15:31 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Subject: [PATCH 00/10] selftests/bpf: Tolerate partial builds across kernel
 configs
Date: Wed, 01 Apr 2026 13:15:07 -0300
Message-Id: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAItEzWkC/yWMSw6DMAwFr4K8rtXwXfQqVYUS44CrElCcVkiIu
 ze0y3l6MzsoR2GFW7FD5I+oLCFDeSmAJhtGRhkyQ2WqzjSmROWXT6xJ0a2+n0VpCV5GbKiu2bf
 UdoOFbK+RvWy/8v3xZ327J1M6c+fDWWV00QaazinnMPCWrrPVxBGO4ws6B3YEnQAAAA==
X-Change-ID: 20260401-selftests-bpf_misconfig-4c33ef5c56da
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=3207;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=39Oa2loJA7hp7uvZHKhwdxu0ZLV6qyUTOt1cn55M7w0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QE5dIUSreOCoDYxhzPTEq3DJLb2+vGdSKNAVzISqlkYZVoHLRq6mwXKx0oQ44AaKNqx2hIvqJzb
 LJUWjO0NHigw=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Currently the BPF selftests can only be built by using the minimum kernel
configuration defined in tools/testing/selftests/bpf/config*. This poses a
problem in distribution kernels that may have some of the flags disabled or
set as module. For example, we have been running the tests regularly in
openSUSE Tumbleweed [1] [2] but to work around this fact we created a
special package [3] that build the tests against an auxiliary vmlinux with
the BPF Kconfig. We keep a list of known issues that may happen due to,
amongst other things, configuration mismatches [4] [5].

The maintenance of this package is far from ideal, especially for
enterprise kernels. The goal of this series is to enable the common usecase
of running the following in any system:

```sh
make -C tools/testing/selftests install \
        SKIP_TARGETS= \
        TARGETS=bpf \
        O=/lib/modules/$(uname -r)/build
```

As an example, the following script targeting a minimal config can be used
for testing:

```sh
make defconfig
scripts/config --file .config \
               --enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
               --enable DEBUG_INFO_BTF \
               --enable BPF_SYSCALL \
               --enable BPF_JIT
make olddefconfig
make -j$(nproc)
make -j$(nproc) -C tools/testing/selftests SKIP_TARGETS= TARGETS=bpf install
```

This produces a test_progs binary with 579 subtests, against the total of
708. Many of them will still fail or be skipped at runtime due to lack of
symbols, but at least there will be a clear way of building the tests.

[1]: https://openqa.opensuse.org/tests/5811715
[2]: https://openqa.opensuse.org/tests/5811730
[3]: https://src.opensuse.org/rmarliere/kselftests
[4]: https://github.com/openSUSE/kernel-qe/blob/main/kselftests_known_issues.yaml
[5]: https://openqa.opensuse.org/tests/5811730/logfile?filename=run_kselftests-config_mismatches.txt

Assisted-by: {codex,claude}
Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
Ricardo B. Marlière (10):
      selftests/bpf: Fall back to distro build directory for test_kmods
      selftests/bpf: Tolerate BPF and skeleton generation failures
      selftests/bpf: Avoid rebuilds when running emit_tests
      selftests/bpf: Make skeleton headers order-only prerequisites of .test.d
      selftests/bpf: Tolerate test file compilation failures
      selftests/bpf: Allow test_progs to link with a partial object set
      selftests/bpf: Tolerate benchmark build failures
      selftests/bpf: Provide weak definitions for cross-test uprobe functions
      selftests/bpf: Skip tests whose objects were not built
      selftests/bpf: Tolerate missing files during install

 tools/testing/selftests/bpf/Makefile               | 107 ++++++++++++++-------
 .../testing/selftests/bpf/prog_tests/bpf_cookie.c  |  11 ++-
 tools/testing/selftests/bpf/test_kmods/Makefile    |   6 +-
 tools/testing/selftests/bpf/test_progs.c           |   7 +-
 4 files changed, 88 insertions(+), 43 deletions(-)
---
base-commit: 0eeb0094ba0321f0927806857b5f01c1577bc245
change-id: 20260401-selftests-bpf_misconfig-4c33ef5c56da

Best regards,
--  
Ricardo B. Marlière <rbm@suse.com>

