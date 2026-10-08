Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ADD389106
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791476000; cv=none; b=QuluBHEsQParGKpwT4oe4Nj9338PrJb2I4e7YPUvdI9lB6f7ToIDkdfvMO4wqrHrT7kKAOqyBmJxjNjvruyFxnZtsF7JJnnREXCd9dGekkN/hjge7sNT3se8wO1JskiqJaA8FJCyaYnSxNkByIBHILBuCOPPQbxGuZ0jTQVACWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791476000; c=relaxed/simple;
	bh=IhNLbauZGI/2fBL2LuFC8mj6FtPAx5+odJC5SAlbv3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OIIgWtXZFAtO7HqVBBI63H3kpMCD2n7IfbGht8cT7Z9PeDBwE2C4qS/uhStz7DzodJbESZsUnSt/Np8eD270hFYT7oCOQd2D00J1oQB8dyn6+Ap5GvKgGbjjCdKtQ40XIZhamQrdpKXonFDOy/lERUPa8965+lKCrTm3UykjREY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h80aqEyc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h80aqEyc"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a02718da81so25011195e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791475997; x=1792080797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2FZLNMG+7qodCzojxRqRtcJYLMEEmZppl93FJZkKgg=;
        b=h80aqEycU+BdOhwGBLoUuDnlF1KbMry6ESQLDKmVaEJd7lAI2pMz7eIW2Ui1ibshhU
         sCC+WBsZ46PZ3uE/NxaQswmHQfKS1bKCs9K4Q9QA9QY+WbDfUQhFh6nF+XmnQrldt44s
         UEg7GjhbzNTSPI22xR79PpCgzp+w9OSwX1Fho7/XwpRWec2Mzf/8S4gJcM0ZetIFtdQM
         0qZXc5E2GEd/k1MfTblb5n4PPZvJ3vPxaD6RdZCvfF2ZmRJH+nUMhUgQkC+hCCeMh8eG
         CoWu1oxAEA+h1M9B3iSrKtAOUBOjN0yo2HoCDdnFDqvyh01ly/oydjKEChgGBVCa+myb
         DoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791475997; x=1792080797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2FZLNMG+7qodCzojxRqRtcJYLMEEmZppl93FJZkKgg=;
        b=1LHy1kLQD82mUXd2IzGoibaKMG/3wCRRFUc/wQHssLGlQacsFAr3dkUrHNnIYEC8CR
         Vpbt1E+A0+n4ahqL6o4nfrZEgLeRcwbckSNYUlR/I96fbq4yC5aFvUJQcB0ol3Q12Q7K
         cdrHDz67okrVvQ+A9gARFwOBWRFcn21EDfvpSon/2EI8tn+oWpCwbDlSy7TThax6sqCW
         ge5tQsJEm7GFsYq0e3E/EiO2CKeuuTSyi87jS9y9+9jSRK5GXko5xdCSOT4N9khs8Ynr
         X9GLy/jUYCaf6v2qWD7PfFNOCsJYcM94lXLfsoEomf6dSSTJzutKBWPLOGNg+/lIVSEq
         MoKA==
X-Forwarded-Encrypted: i=1; AKwUvByX+9KtgTSZu3Fok3TV40Mjn07mXJCVd3XDeVpqPWI+KXxfxTj+4EardHiLHhRzCCHl8l3dI7+0LVzSdxwoYjM=@vger.kernel.org
X-Gm-Message-State: AFuF++nM7/VD9ZniDAKa3QU+jAcsTCV6Hepogyi3PbJFzhp7r6E01VM4
	lK36rcQ34JFx8T+JoFwhlB5cFpshhh7mBdr2a9dbmoZT5KrHLPDOPnOe
X-Gm-Gg: AYBFou3NQJfH5av6bQtuQphZuoiGUbdpvb1m9duv1PQbrOx+BB3GJOW2B8mnxJeWyuW
	cU/8+icUXMYF8wmb1IJ4rk+XI3XRhnLxcR9xxVThVXCZPGK0owtIKllN/wYH5O5nJ4MJdFllMTI
	ak120AkbVxoDC7w0Z8LquctteGAo0/gNUqj7qHX1y3xkoNS9MTtvAIhDTHBCSA3h5EGmKMLI8yk
	59GPFfO6wShq1AKTR4ig4CCHv9Bj8DJXTVUQ0llh3c/DYmdV3V+hefbOZtP7BmePqUW6+j4lFsh
	Eg1n/wK3e3Mh0OCyjoz+MuMyBGBM3YYZQSOYuRwApimAuQx7ojq/D7I7kT8PsQbM3ASj1HpWKpq
	N5BVHnO2fRp4geWEqdJF8FbygQNRvIE9mzqTDJjar+XiKELurpG+0MrDpM4nP+oJxXRxetsqXN8
	Cmswu1V/sjfL19H9c+MYR73VjHEMQ3Uacm3NrKIPaRb5nIwp81uVDgCCsgcdoRFshiOEX3IJSf7
	HR3X6colpMYiM16XKfUpdBZ8oTu8mDg4+Z6fA==
X-Received: by 2002:a05:600c:4688:b0:4a0:8b1:f5c with SMTP id 5b1f17b1804b1-4a18042a422mr109945825e9.22.1791475996918;
        Thu, 08 Oct 2026 09:13:16 -0700 (PDT)
Received: from MacBookAir.home.tenber.ge ([2a00:6020:a725:dc00:95bf:d5d1:d7d8:747f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db63401desm448005f8f.0.2026.10.08.09.13.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 09:13:15 -0700 (PDT)
From: Jan-Gerd Tenberge <janten@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
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
	john.fastabend@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jakub@cloudflare.com,
	jiayuan.chen@linux.dev,
	kuniyu@google.com,
	willemb@google.com,
	shuah@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 0/2] bpf: Fix iterator link update target validation
Date: Thu,  8 Oct 2026 18:13:07 +0200
Message-ID: <20261008161309.8179-1-janten@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BPF iterator link creation validates constraints that depend on both the
program and the selected target. BPF_LINK_UPDATE only compares program
type, expected attach type, and attach BTF ID, allowing those checks to be
bypassed by attaching a compatible program first and replacing it later.

Runtime testing in disposable QEMU guests confirmed that the resulting
out-of-bounds access can reach kernel-owned metadata of a separately
allocated live map and cause a deterministic kernel panic. Corrupting a
victim map's refcount caused it to be freed while a verified BPF program
retained a reference. A same-size replacement reused the slab slot, and
the live program read the replacement's marker through its stale map
pointer. A separate test obtained a selected-address eight-byte kernel
read by changing the victim to another valid in-kernel operations table.
These tests did not demonstrate code execution or privilege escalation.
The UAF/read tests and the identity-boundary tests were separate; no single
combined exploit was demonstrated.

In a split-UID test, a UID-1001 process with CAP_BPF and CAP_PERFMON, but
neither CAP_SYS_ADMIN nor CAP_SYS_PTRACE, corrupted a UID-1000-owned map
without possessing its FD. BPF_MAP_GET_FD_BY_ID and pidfd_getfd both
returned EPERM. In another test, a child user namespace mapped to host UID
1000 and given an administrator-delegated BPF token triggered a host kernel
panic; tokenless tracing-program load returned EPERM. There is no
demonstrated default-unprivileged trigger.

Patch 1 reruns both target-specific validation and the iterator
sleepability check before replacing the link's program. Patch 2 covers
rejected array and socket-storage value accesses, a rejected sleepable
hash program, preservation of the old program after a failed update, and
a valid update.

The flaw was introduced by commit d6c4503cc296 ("bpf: Implement bpf
iterator for hash maps") and remains present in bpf.git at ff47652a4b66
and bpf-next at e1d84a37cba9. A patched ff47652a4b66-based kernel rejected
the invalid updates with -EACCES before the programs could execute.

Source reproducers, build-specific layout details, and exploitability logs
are available privately to maintainers on request. They are intentionally
not included in this public posting under the kernel's guidance for bugs
found with AI assistance. The public regression tests do not execute an
out-of-bounds access.

Testing performed:

  - Reproduced the bypass, cross-object metadata corruption, kernel panic,
    stale-reference reuse, and selected-address read on Debian Linux
    7.2.9+deb14-amd64 under isolated QEMU.
  - Built bpf_iter.o, map_iter.o, bpf_sk_storage.o, and sock_map.o with
    W=1.
  - Built the affected BPF selftest objects and skeletons with clang 19.
  - Compiled the bpf_iter host selftest with -Wall -Werror.
  - Passed git diff --check and checkpatch.pl --strict --no-signoff.
  - Verified that the series applies to bpf-next e1d84a37cba9.
  - Booted the patched ff47652a4b66-based kernel with vmlinux BTF under
    QEMU and confirmed that invalid updates return -EACCES.

An LLM assisted with discovery, analysis, fix implementation, test
development, and review.

Given the memory-safety impact and the Fixes tag, please consider patch 1
for applicable stable trees.

Jan-Gerd Tenberge (2):
  bpf: Revalidate iterator programs on link update
  selftests/bpf: Test iterator link target validation

 include/linux/bpf.h                           |  3 +
 kernel/bpf/bpf_iter.c                         | 15 +++++
 kernel/bpf/map_iter.c                         | 58 +++++++++++--------
 net/core/bpf_sk_storage.c                     | 24 +++++---
 net/core/sock_map.c                           | 26 ++++++---
 .../selftests/bpf/prog_tests/bpf_iter.c       | 34 ++++++++++-
 .../bpf/progs/bpf_iter_bpf_array_map.c        | 17 ++++++
 7 files changed, 136 insertions(+), 41 deletions(-)


base-commit: ff47652a4b66c067c765a7ad464d930b5a9367cc
-- 
2.54.0 (Apple Git-157)

