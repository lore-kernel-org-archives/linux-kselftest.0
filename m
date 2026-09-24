Received: from mail-pz2-f21.google.com (mail-pz2-f21.google.com [74.125.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF524756CD
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 10:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790245411; cv=none; b=lMU9q9xjJ5nx6KRl4/t2//I8j+KK53j8snydka8IUcIz/EHh3vnovO1TKs3i58ytowgauI9EvD8DP/9jjFU0ILh0o5cnpY/bil3pByhdd3v4qDhLVxCRega4YBAcmoUcxazA0eh4KrtPVpBUGPdr0RNFncgspfVjlLslUZBlzdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790245411; c=relaxed/simple;
	bh=/ODbsO0ib9XHINNISR/G61Yufsf6FUpuX3+F97Dv1cU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WHhdcjuPaINO+mDWTsjvGxJUEgi3jxjgERubbd1lMrBVlA1J4dgDmfzoExtTfmy9Ti+YkMKbbC04a3VH4uieMWQRCsQ07OGzPAWktZw0++AT5y6jNEx1NcAwK9wNORaL+Jxw+PSzWS/BwjtGdrWXUdqtrbvwsw2bOp2uXVI1Q4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LerLZwDO; arc=none smtp.client-ip=74.125.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LerLZwDO"
Received: by mail-pz2-f21.google.com with SMTP id 41be03b00d2f7-cc4cacd3409so1254814a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 03:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790245408; x=1790850208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xJZ5kVFapcaMDUxwmgn/TUrBXfLGg98xcJ7wbSfqudQ=;
        b=LerLZwDOXDMktDZiKHYhSGkuE3yoNeNKdIBaffqELINxeu7438UyrR6v8p9nnhw+61
         nj5ZVYyptHccEDCt000RXLD54U4aPARZU0oH5xSK0xM6c4P9vGVCQt+41qS5rn6HEeH0
         1JsfASl8/mbxrdkbBSZMGss/EJZkPOJgJcK4XiTcLsJEMTri29w4wxQmCTta9OgLwd0d
         qehvlFEiJo9iH70fH57tV6+o61jOH5OrmWD3Hnc4oegTSNRRZXKEyYfl5etX60hmx2x6
         efK/aXmuyeShfSMBAHRlZvLNJKmOz1LnYNsnF1naIFndd6u7FFxM+MTSSYRYCIlpEdhi
         A74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790245408; x=1790850208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJZ5kVFapcaMDUxwmgn/TUrBXfLGg98xcJ7wbSfqudQ=;
        b=XlBchRYyn5l7MEnxcl1cOoED25D2JglPsWILcZEVBDASUWiFDSEHJhuMXf0oxugavu
         LAJ0d2gMTBCGHi/u2w8tOq/5HcczDyTJAwqTuQILTv1yw5c4cG/mCrpX/ivpvNzQ5am0
         hcjkSveEfoLjFP76uQ89EdleJL9NZ9GHLtztfz9pF254WkPYmXqikijShURHD1QnOIE0
         gjbZ6AAfrYN23msfCNHzgI3le9qZCKIjXsFf/p5HE+6/hwshbK4Une4qvjweZxlsX3u3
         xJCjEorSbuDkrm9PQ5mzeMraM1KtHRJjwPc6yiB34oVO7B5GQ5PgVNl/PvTf0HqVz0U9
         tv6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2EZEP36vAtDxb1xXje94vqW3kZUIOyPaveFkMsByFWvBMhVt3nchNNsZ29qw/fPVK3T2LsBsQDgvG2X4I6RY=@vger.kernel.org
X-Gm-Message-State: AFuF++lgMEwjrWHjDvcFnoYGqd01BNNXFkt+bHUWb/tepOboM5e/EJxq
	cgQSqidfIvdPKY8nzIR6zu2z04qy8ynGWH4sbnC6k7aBMdFfzR6T0Ao=
X-Gm-Gg: AYBFou3sjBn97CFx5CdRF03F7sf8FOJCM6/W4uV+staKxve+ZmlqsGfaCzLFHKKDbqa
	vOGoX13uKzQdDdmmtpfv2LDrzFmDXC/essq/BR90uEafRBmm2U6DOv+bg/Fr7+rwR9gHDpSCfO5
	Ru3vX7gfOmsKYUyDWP+rl+IjC/maQFya1ALztzZ/XPtT1UVpS5BRUi1mVmpYzZPgsZc6DjfuGFi
	TixqKNFq1nKnFY/nI2S6svTxznAFl/eawlx/wJ+79nSNDqs6pkQZvcxvzjPnEXuF1yu6pt2i+jm
	frU2I5zMREQx1JcHVM11h+1hbkZQuHASjlkkR2Cysg+DemxW6uwWpYOmoUXTdDPozGGJbi8qt1F
	XWQh1fN++NsxLruqUuojIDvdRPk2Uj2lX+VXyBQjIFHP8Lco5JPul6k4UsKWLovK1/3G0gPK4y2
	iRGlrYDsCTAp++XFdG+d0t+VYVV99YNuWG7M4tYqmCjk1vYFzhNBbrIpSgYjbQ88K6qOGvakMlt
	KXCghoTkCc9PjI+JTCBD6za
X-Received: by 2002:a05:6a20:7f96:b0:3c4:1916:9d40 with SMTP id adf61e73a8af0-3de0e6f4f73mr2034103637.12.1790245408389;
        Thu, 24 Sep 2026 03:23:28 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1afb9416sm2661582b3a.7.2026.09.24.03.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:23:28 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
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
	leon.hwang@linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH bpf v3 0/2] bpf: fix per-cpu initialization of a BPF_F_CPU created hash element
Date: Thu, 24 Sep 2026 19:23:19 +0900
Message-ID: <20260924102321.2120434-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A BPF_F_CPU update that creates a [lru_]percpu_hash element writes the
named CPU's slot and leaves the others holding the recycled element's
values, so a lookup of the new key returns a deleted key's per-cpu
values.

Patch 1 zero-fills the other CPUs.  Patch 2 adds the selftest: the
existing cpu_flag subtests always prime a key with BPF_F_ALL_CPUS
first, so the create path is not covered today.

v1: https://lore.kernel.org/bpf/20260920093153.439743-1-donggeunyoo.kernel@gmail.com/
v2: https://lore.kernel.org/bpf/20260923000801.1764758-1-donggeunyoo.kernel@gmail.com/

Changes in v3:
 - patch 1: key init_cpu on BPF_F_CPU rather than on onallcpus (Leon
   Hwang)
 - patch 1: re-flow the paragraph naming pcpu_copy_value() (BPF CI AI
   review)
 - patch 2: pin the thread across the delete and the create, and name a
   CPU other than the pinned one, so the BPF_F_NO_PREALLOC arm does not
   depend on staying put (BPF CI AI review)

Changes in v2:
 - patch 1: cover the BPF_F_CPU entry condition in the block comment
   above pcpu_init_value() (BPF CI AI review, Alexei Starovoitov)
 - patch 2: skip the new subtests instead of failing them on a
   uniprocessor machine (Sashiko AI review)

test_progs -t percpu_alloc and fourteen neighboring map tests, x86_64
under QEMU/KVM, 4 vCPUs:

  without patch 1   31/112 PASSED, 1/3 FAILED
  with patch 1      32/115 PASSED, 0/0 FAILED

Donggeun Yoo (2):
  bpf: Zero-fill other CPUs when BPF_F_CPU creates a per-cpu hash
    element
  selftests/bpf: Test per-cpu initialization of a BPF_F_CPU created
    element

 kernel/bpf/hashtab.c                          |  11 +-
 .../selftests/bpf/prog_tests/percpu_alloc.c   | 105 ++++++++++++++++++
 2 files changed, 112 insertions(+), 4 deletions(-)

-- 
2.53.0

