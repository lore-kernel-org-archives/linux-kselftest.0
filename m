Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1B23064AE
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 22:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721390; cv=none; b=sLJrQudHwsvgmo6+T5KXU2u2M9qFQ/pfXI1+SdnsZr+pIiBWzxwUNHB5/eIiEUYMFYaVg8QYfWLBXIZ8YB1tqjJ8YCICZmrxth9AZbLfecVg92qmYhoa/HDVTbxMXcgTzReyr10FvHMzM4lLQGtwJizNd+BUBVDTEsJFh5yXh/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721390; c=relaxed/simple;
	bh=KiIk1DYjOUloINvAvnekFCUGUXP1nq/AaAuUSzWBGVY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=stxkB1OTtD9VO5Q8a9WIjQ8OuwB7bTmTY6eGyecrywtCKVYXB6FyhV7II0VVNXtmgIxKjSIAKnAlezbmIgxtBeK6WnMuMxX3OQxOdo+2/BKGs8kBqruiIzlZtltzdnhXEvknBDyhzF6XnIYdPJ8tkCfWlgcS9OhiYoV1ZvrYGhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YzxlqKVe; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YzxlqKVe"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso11760415e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 15:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783721387; x=1784326187; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1PNnNvCgpzChit070oXsjn1A2EIExdltJ82kGiNYaNo=;
        b=YzxlqKVeDzMWD89eB13qk/RiMgas51VtZBSelIsX7cH+wtaWUnJKfwEW833zen5m7b
         LDYpcQ5bMqJ/8ZIOg+mbKa8tx5TqgFwlBG3vAhPKPtl0blIyNDxQ3ozw2HVT47MAAcYs
         8b0GDhPhVTkWACEpODloZV0GCm09jqMS9vl6Vav2j/C5t1jNVwFd4/K987d8CZj1raey
         cqk9tmU+O42THg6UziN+fZoxFDUoeRQ3A7HFaK0E520zQX4/oQwxvSKrNktcIrW6r1HX
         FkCzYxwO+NfLOW7VFHEo6TLGjFcif9e3BlqX4RayV1RE+cECdNW5pTFk+FVWBK/jZTps
         lw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783721387; x=1784326187;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1PNnNvCgpzChit070oXsjn1A2EIExdltJ82kGiNYaNo=;
        b=mhVJlu+zlpiVJPxYDskPR0+YWm+xHO27J7ny7F+lONVS0w4xtHvmCjD2crqgEzaAUW
         HZeVVqmi0SwHiY+RoH1oXYxPiAIyT8Is3SHVjG8mDVOTmDQqktIJxJGOag4kyyXeCZPN
         uL5vNqEKadfJBqD4LXYYrSw5iC4fDnq8QF/duNcmwg60aWqJ3dt4fvWMaNzMPlzzoG2n
         vlBMllDPyJfSt9K/N5hsRAXmeQNHrS1cKYfCpZAOm/JA+WjlUi7FtFv9m4ieDqZMKiWX
         dkGvkyGJYRoRz5yycX38yZjtZ7oNQpxlHI+yKI4yhoba0KfS3GJEj3F9tUNCIp5If/Uq
         2mcA==
X-Forwarded-Encrypted: i=1; AHgh+Roo6vK+pHkl/wgTdTtkTeXg0vTTCk4F4LgVZ8H97crnPAOga1A4dnUki5a9+CrU9KfU9AK3Md1Msqv7X3tOfHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgRCjh98Vqlj19E8ReEeLqjY0VA8lPEWhUS/qG5BBEeS1aOAI0
	eSOcpV56f478Z2T2Bhgi8PWoY2la8zkmYdI0RV4wDxfJvixuOBliv1G9ixGvb2a/nZC0fQHu36G
	EjabWPBM=
X-Gm-Gg: AfdE7clIRtoUF3oYOqNAXB/xbl7h9+J0B9DaQt4KWT1+KALcCDlrKCkDrKoXIfzkbPE
	POrTFA32t6RxKo2GCPwie3bww4O5BxEjb4ouprSBns5jYUJJYvPcw7z4lTp4Ll36Oc9jZmgFb1D
	W1oNFAqoTXOELrBK8uRVHfFcE9u7BoRDMIPKGgkBoVLhHObaMvFz2S0hUphGkT5FHhSi3issP73
	ZHVrDnX0LJ4lqe71mwkS2s/o75V6ACIQ1IdwtYTCefCUevtvcDBsZKAVEKFyMHCgf87Z2H00IEr
	P+sYWdC16Q8qL0LDeIUevYK38Rb01WlmWZBYBhfVTkBp1VzgPVOmsa6t0/rg0YT5RnomCS43EuX
	w3lbzf6vUr94DgGovx9RdZyJyV2P5Tlb4WFmTzZjJiALaNSVzu4Jtp7VwknViQZwR2xFQb9zarp
	Pc8Q==
X-Received: by 2002:a05:600d:8444:10b0:493:f5bf:4da4 with SMTP id 5b1f17b1804b1-493f8826c64mr3653665e9.28.1783721387368;
        Fri, 10 Jul 2026 15:09:47 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:157e:cc5f:6c4b:db0a:5d2a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-667c2efa583sm3842584d50.15.2026.07.10.15.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 15:09:46 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Subject: [PATCH 0/4] selftests/bpf: A few edge case fixes
Date: Fri, 10 Jul 2026 19:09:36 -0300
Message-Id: <20260710-selftests-bpf_fixes-v1-0-aa24dfd6f4f9@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKBtUWoC/yWMUQrCMBBEr1L222AaIUWvIiJJnLQrmpZsFKH07
 ib6+WbmzUqCzBA6dStlvFl4ThX6XUdhcmmE4ltlMtpYPfRaCR6xQIoov8Rr5A9EaYujM/CHYAe
 q5pLxK6p4vvxZXv6OUNpVW3gnUD67FKYWzZlHTvunk4JM2/YFPber75cAAAA=
X-Change-ID: 20260710-selftests-bpf_fixes-06e9a2eb3c67
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Christian Brauner <brauner@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1783721384; l=1884;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=KiIk1DYjOUloINvAvnekFCUGUXP1nq/AaAuUSzWBGVY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QE6vmBvYeK3wq/caKe/q7ZCOx0FnvDiuWbvmSipHUqZ5u3dv9ziuY9HMjEcESGWFamT0c7etChZ
 7r9ejKN8ujgY=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Hi,

Please consider merging the following fixes, found by means of targeting
BPF selftests through openQA [1].

[1]: e.g. https://openqa.opensuse.org/tests/6087703

1/4 ("libbpf: Search /lib64 and /lib in resolve_full_path()")
- Hit by testing an older SLES root filesystem.

2/4 ("selftests/bpf: Fix lsm_bdev dev_t encoding mismatch")
- https://openqa.opensuse.org/tests/6087703/logfile?filename=test_progs.tap.txt#line-2706

3/4 ("selftests/bpf: Install resolve_btfids.test.o.BTF where the test expects it")
- https://openqa.opensuse.org/tests/6087703/logfile?filename=test_progs.tap.txt#line-3332

4/4 ("selftests/bpf: Install bpftool where test_progs expects to find it")
- https://openqa.opensuse.org/tests/6087703/logfile?filename=test_progs.tap.txt#line-806
- https://openqa.opensuse.org/tests/6087703#step/test_bpftool_build_sh/1
- https://openqa.opensuse.org/tests/6087703#step/test_doc_build_sh/1

The build process is done at runtime with BPF_STRICT_BUILD=0:
https://openqa.opensuse.org/tests/6087703/logfile?filename=serial_terminal.txt#line-1937

Assisted-by: Claude Sonnet 5
Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
Ricardo B. Marlière (4):
      selftests/bpf: Install bpftool where test_progs expects to find it
      selftests/bpf: Install resolve_btfids.test.o.BTF where the test expects it
      selftests/bpf: Fix lsm_bdev dev_t encoding mismatch
      libbpf: Search /lib64 and /lib in resolve_full_path()

 tools/lib/bpf/libbpf.c                            | 3 ++-
 tools/testing/selftests/bpf/Makefile              | 5 ++++-
 tools/testing/selftests/bpf/prog_tests/lsm_bdev.c | 3 ++-
 3 files changed, 8 insertions(+), 3 deletions(-)
---
base-commit: a635d6748234582ea287c5ffeae28b9b23f91c7e
change-id: 20260710-selftests-bpf_fixes-06e9a2eb3c67

Best regards,
--  
Ricardo B. Marlière <rbm@suse.com>

