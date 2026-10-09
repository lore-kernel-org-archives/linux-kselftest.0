Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263C74E1C8D
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 17:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568097; cv=none; b=XLIAGJunTtjVzBXB4pXjZAK4EkFeUL0mBCDG70lBsHMEEvCj6FNbV6y3OtdGMYExcVcE0A75idVIfpyfO86SCtLvJgTnQXJeQTi09k3VdxtLgmyLR/osPYCsh2ytJ7x3jV9gPCbz6ZzezVhkyR0TY5WrQcPw2ipDRNONCQYoBEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568097; c=relaxed/simple;
	bh=JgPaicxCucfdMkRINMIAPBjQlAb0HOrhvBZzO59T1bw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=inmrjdF1nlFGrmHFyTn55LJUUwmcW2GdsQ6+356qVBd1ozaIpMmMhwanHUEhKaLLl6NvG6AhYy42ZANX/bChew1TJ+CadcKMTTlu5J5farnIYbrdehjNVngXAimOvW0kYwSr+pQ6PVSCeLCdQMZJnlypfotrk5n/xEF62JaYv/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YAuOrsvz; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YAuOrsvz"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a9787a14ecso718941fa.2
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 10:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791568094; x=1792172894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pA8E/ThbMiBTOoyIyD/1D76SZ7hCfLkGZWv68NB0mJs=;
        b=YAuOrsvzMD0e/VL0IBVH9fLziRwJqN1laynw2JFcVT/5CkA88bLIMuKnHiBxE5m6Zn
         +s/ZzLHaBWSNKrsXM7wp8o/eI2N1nOTlFB5V4Ty/Yq2N/Xf3/PW68IehFvokUbm08oAt
         DSFtzUMwZh1/Rj6XDF4QG4cjoTjptWv47hjgRCe5UbXmM01UbZePvAOXVrIHIlRDGKew
         x0cW9sGD0iLDP8SzcS/jhemyrn90Z6YKr0Wym/VSAPIZq7SeseqEwfoE9eOJxOHSYLIa
         UUKdYKVJo2ORtsBUhaIvGnIpNi7vfns0m+TbQDbkUHo4fKZO2m1gGxj6EolQNwAYARru
         E7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568094; x=1792172894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pA8E/ThbMiBTOoyIyD/1D76SZ7hCfLkGZWv68NB0mJs=;
        b=i+ydRIen0LGpo6H0YJmDsHcaMUXg0vnfrnsGkjGbdp+J++0ekJ2GGdNwYk0SJC4IoS
         3fO3ioWnxUJYvYCd/ZhIeYqO70mweTudbX+s856w7BuUtOjz5ulmV84hUQPDJ94GIraj
         N4m+GvLaRIDDF/HscQ2Jj8kRkMHz7Q24K9FzJBdCcGu3eLZWdPbaE0qGxKS0X5CWsPIo
         EmtNSC4Jli45z93NLJXpX4t56kAGGgG70XEVVOVJHjsl5kCFiZu0UfVdcl3QhqXOt8Fv
         QadJNXbZd1C4Z2VfKdVJt+ypA4Ys5hhzTzdntR/3u5ufGC4A4vJqqBLw3KkoxLNuAeAk
         6JdA==
X-Forwarded-Encrypted: i=1; AKwUvBysh5QNEoQdE/TbohhLSV6r+hIfEf9sQVMMFU9ZJjT4l+S7a6MvibuI1O9sZKk05/sti43m5cEISOc9ToUNa3M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFcVF4mktVSgGi1cHaf15mimlXyh2j5EvglWpREQt2XsA/9OUm
	ATK8U01CvEIkvsHWLpk7g4HE+YslS8fK7FukKtZfbwMGUPvWKulUA6SQ
X-Gm-Gg: AYBFou0cnqpJvmzeNGL/JD/HTuHE8sLiCMTDEaGY4wjIvpLoqr0JRpqaw37gpiBbkvX
	iWgnAzhI0gTA4+h2xVva49+lWLhCMIUl6qUeJ/nfIYJOsyuaHDt4t1OcjhbnB4DQwc4HNbqfGT2
	/cejD42aXtkm2qHH43YiljAnCLmFFiS4z4JzolFovrgrAMe5hQ2J9T7p9RPjkrA/+dZ+fg0lmrR
	T2RmJGjeQ4AgAlyL9Scds8g7DDOsNGxTKCfREskAtTwejNDO0RAyxkQ+zKUd075kwX7lOoOzGDr
	QzK0omwckxh9OTA/bv/kQp+N3tRGZtuXQYMdyP1qUPZy7bcCbFSB7WiK5RZ3A/IssjInv4ssnH5
	uKZAv1Z8YJ/UR/wHMfx41n8ZscQDCKvJGcEGSlhfQDFnZ+OozwK/kVnH7M9PmKV83Hn5QH+v1sm
	UmQj+EtceGqUF2ygU/tRlENcChuPATP5M1o0YNcwSVHz6eIFr7SZd0a+LQ7gPSkmfeWRYETrjpz
	7dNnOSIfER3Yke8vuw/dgYq9GdiSJexHnpdwTdw8FRhQq5r15YN
X-Received: by 2002:a05:6512:3f24:b0:5b8:f533:d439 with SMTP id 2adb3069b0e04-5bcde8c1acdmr1016443e87.38.1791568093888;
        Fri, 09 Oct 2026 10:48:13 -0700 (PDT)
Received: from localhost.localdomain (95-24-167-79.broadband.corbina.ru. [95.24.167.79])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddeb5604sm852635e87.63.2026.10.09.10.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:48:12 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	memxor@gmail.com,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	vadim.fedorenko@linux.dev,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: [PATCH bpf v2 0/2] bpf: test_run: Fix false -EBADMSG with BPF_F_TEST_SKB_CHECKSUM_COMPLETE
Date: Fri,  9 Oct 2026 20:47:46 +0300
Message-ID: <20261009174755.22026-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BPF_PROG_TEST_RUN with BPF_F_TEST_SKB_CHECKSUM_COMPLETE returns -EBADMSG
for correct tc programs that call bpf_skb_change_tail(). The helper
moves the skb to CHECKSUM_NONE and leaves skb->csum stale, but the
post-run check added by commit a3cfe84cca28 ("bpf: Add CHECKSUM_COMPLETE
to bpf test progs") still compares against it.

Patch 1 only does the check while the skb is still CHECKSUM_COMPLETE.
Patch 2 adds selftests for a trim, a grow followed by a write, and a
negative case that keeps the skb CHECKSUM_COMPLETE with a stale
skb->csum.

Tested in a VM on bpf, with two kernels that differ only by patch 1
(subtest results):

                           without patch 1    with patch 1
  change_tail_trim         FAIL (-EBADMSG)    OK
  change_tail_grow_write   FAIL (-EBADMSG)    OK
  store_no_recompute       OK                 OK
  test_skb_pkt_end         OK                 OK

Changes in v2:
- Put the opening /* of multi-line comments on its own line (bpf-ci,
  Sashiko).

v1: https://lore.kernel.org/bpf/20261007181249.352831-1-skokovmaksimevg@gmail.com/

Maxim Skokov (2):
  bpf: test_run: Fix false -EBADMSG after skb leaves CHECKSUM_COMPLETE
  selftests/bpf: Cover test_run csum validation after
    bpf_skb_change_tail()

 net/bpf/test_run.c                            |  8 +++-
 .../bpf/prog_tests/skb_csum_complete.c        | 39 ++++++++++++++++
 .../selftests/bpf/progs/skb_csum_complete.c   | 46 +++++++++++++++++++
 3 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/skb_csum_complete.c
 create mode 100644 tools/testing/selftests/bpf/progs/skb_csum_complete.c


base-commit: ff47652a4b66c067c765a7ad464d930b5a9367cc
-- 
2.47.3

