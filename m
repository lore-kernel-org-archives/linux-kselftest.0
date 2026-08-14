Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A77241A797
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 07:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693877; cv=none; b=u1jWUPt/sV1q2vTRmMuA5Ti5oCHbUye0T6w9WtfPSIgAYn2ssQKKgLJKPOUQOXIb+btrYyGYjvHNq5+0mXKBCTF9TKneV2g3coQGEhpHY5+7Oyic+8k/FI8ZalEuwVkc0oXG3ikGa8Dg+ogLgQTpL48rBLWp0PPccXZtnOmIm80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693877; c=relaxed/simple;
	bh=vGb2AL0Q+YFnzB3UTu2+t3nWJA5Bw9JDxdRJVkur5KM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EIWBtGF9vvbELwg7yLQDcDUeNSiDTt2BkbQUyoGtZSQJ3J/df1fKLFCzY1Ku6zQEXDQx3PJJOLh91oud1828dcmdEJrMVQtMb9UR9O+aumLFUmJrCPyQjZ+x6qGwn5xZPptiIHAbNCCQwI7+G0LiE5PneaWTgUB0tdrdaa1TKGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UbSrhDhC; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbSrhDhC"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc73e322dbso12344265ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 00:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693871; x=1787298671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P7NJF3oq4Hw+2dLyF07fyfL2A6PD1tYu7/+/ryOQgrk=;
        b=UbSrhDhCWvA4L4cafjRjHbp+4ly6kOf2U5EmqhfcSOd5kzBxTro9juz84C/CRquUv9
         KNEhLwk/ZoucsC+iTa7uwVG1z6l23w1LOYM7WL/wnlcu0hMCPqc6bSxfeCLn/zpx026l
         KoENBNpGNdykUtk8N58U5CT5JH11iLBnOUNQC47VH0vg2It8F5YAADmoonuH299ZG2X9
         fYxApt4ZdifEZ28tb5eNDtwAH2nrnlMJ8tOXx3rUpbT3/1TpSoJRTbOGxiuowFWPSGqM
         Ab5WsAMBQsMfat61sYtG58KYgrx1TtCrd1nta9vh3wEzZy/YrW1z/Kgt6bl9UAt++Gtn
         lVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693871; x=1787298671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7NJF3oq4Hw+2dLyF07fyfL2A6PD1tYu7/+/ryOQgrk=;
        b=Vas3WjZMgsUGeERX/sTGpezr8SK6QmKO2e3M0dDwv6uof7F3qylzs8ro0FuJnFJa3g
         uofAn3fJ5j2NLv1IMBDICKbu15tfUaUn9hBxn9DtuCmMsNw29qYSpgP/zfAwmh0JhrMK
         XFtg+BgrtVtMWomXjp1ZdSS8hsoCzJQ7Vh40iT2DNKqaTqo2GO3wROZQna3iP+b91LYS
         TStFNhTMbcrgDRnR4PrHqJuBxsIBHQBhqmCbXDshoNWc4R/QM5PeU8cC4Ikn8Hir0UDE
         7NX6Ngi90RHoae+Mr+DFy1o8gXtOu+SrZ1w6duWQZAmog+ll9wWcXSz4o/V7BI5DyiK2
         ecPw==
X-Forwarded-Encrypted: i=1; AHgh+RpLBbc3d+mgBznUvJYPxVqp2jFoSoiVfZlICJf1gfOS0NQy56DeWfA4fRf2a+FVb3IPH+PIUMK8sxWLvQsx0zc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqJjN58N5OH2vO6Xy4fmVR5ioWVUydwluHA6pIu4hSnjUF7R8a
	XkKStx2z/OjCJPfKkSJvkuRSp7gaJMoAz+Z8KTdocie9tXjQBPO5LtAO
X-Gm-Gg: AR+sD12E6yc3sFnJnPvPGO0bQTNmddGWfTJuPfIsEEFENrHGtdVrQdI5vtMyHgj37Ej
	q1sTAzwhIpaGpKJsoRN2mtX21hNljyzRXDidMjtDKfTDi9xXGsvSHeDcevoHTHxgwWIG7+EQSxq
	ajJmvwdtzYMtebwm7yvdWwlDii17IQPH0d4I4xPrwIvuQ6jk2RxO+dzvEfQvY5Cnw36MF30+ZEF
	OOX+TVRVOGvsjQeV45a2ffDh7UdXTtF+du7smlhg0xRbdgxJ+kewM5/MxtKjwaeb+CKcKYyU753
	h701FIZPihG8gaBMqdj/kSuci5fz7jmRg6+DM7bDMp2Z7Fga1q+hZbf1bqHVbucKgboXaRH7YXa
	Ya1Jdn1QhFF7Hx/6Elwlg5Z1ZgN6Ujj5ajyas/iHMq7MIfaKXOt1VCq9jZkHwHh+qlfAsXb/hlq
	iLIJORsUyZzIEzO8fuIownDW0lrt08JWM1cEUPLjGyiZXyLe43QDjEV/DYkax9rfCawmg1imasp
	igsUQ==
X-Received: by 2002:a05:6a20:748a:b0:3c3:a9e1:a819 with SMTP id adf61e73a8af0-3cc71fb5781mr4100219637.24.1786693870755;
        Fri, 14 Aug 2026 00:51:10 -0700 (PDT)
Received: from localhost ([2a03:2880:9ff:68::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387c6f95sm9201342c88.6.2026.08.14.00.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:51:10 -0700 (PDT)
From: Ziyang Men <ziyang.meme@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	David Vernet <void@manifault.com>,
	Eduard Zingerman <eddyz87@gmail.com>
Cc: Viktor Malik <vmalik@redhat.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	JP Kobryn <inwardvessel@gmail.com>,
	Mykola Lysenko <mykolal@meta.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Ziyang Men <ziyang.meme@gmail.com>,
	kernel-team@meta.com,
	linux-kselftest@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-input@vger.kernel.org,
	sched-ext@lists.linux.dev,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] selftests: shared lib.bpf.mk for building BPF progs and skeletons
Date: Fri, 14 Aug 2026 00:50:50 -0700
Message-ID: <20260814075054.507089-1-ziyang.meme@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series re-factors the bpf-related toolchain for selftests, which
currently duplicated across selftests/{bpf,sched_ext,hid}/. Unify them
into a single includable fragment, the tools/testing/selftests/lib.bpf.mk,
and wires up three consumers. We believe this will simplify the work for
configuring selftests with the bpf, for both the existing and future ones.

Patch 1 adds lib.bpf.mk mentioned above.

Patch 2 adds a new selftest, selftests/cgroup/test_memcg_stat_cross_cpu,
which checks the cgroup flush happens correctly by comparing the bpf
read value matches the file reading. Existing test
bpf/cgroup_iter_memcg only ensures whether the number is non-zero, which
is trivial in some cases.

Patches 3 and 4 replace the duplicated parts in selftests/{hid,
sched_ext} with the lib.bpf.mk

===
Changes since v2:
For shared Makefile:
- The lib.bpf.mk now use the USERCFLAGS (and USERLDFLAGS) to extend the
  CFLAGS and LDFLAGS. 
- OPT_FLAGS/RELEASE and EXTRA_CFLAGS now reach the libbpf and bpftool
  sub-makes as well.
- One rule per BPF source instead of a vpath, which is global and also
  applied to the caller's own %.c rules.
- HOSTCC/HOSTLD come from lib.mk instead of including Makefile.include,
  which also rewrote the caller's AR, LD and CFLAGS.
- A missing vmlinux is reported by the recipe rather than at parse time,
  so "make clean" still works without BTF.

For cgroup selftest:
- Only one cgroup tree is created, one flush is performed, follows by
  bpf read and file read. 
- More common cgroup functions e.g., cg_read_key_long() and
  value_close(), are used in the selftests.
- Use cpu_set_t rather than manually allocated cpu lists.
- Use test_memcontrol.c's anon allocator and moving it into cgroup_util.
- Other suggestion from the review.

Others:
- Bot reviews are fixed.

===
Changes since v1:
  - Generalized lib.bpf.mk (source layout/suffix, extra hdrs/cflags,
    skeleton suffix, subskeletons, configurable output dirs) so it can
    serve hid and sched_ext, not just cgroup.
  - Added patch 3 (hid) and patch 4 (sched_ext), converting those folders
    to the shared fragment.

Ziyang Men (4):
  selftests: add shared lib.bpf.mk to build BPF progs and skeletons
  selftests/cgroup: add memcg_stat_cross_cpu correctness test for flush
  selftests/hid: build the BPF program via the shared lib.bpf.mk
  selftests/sched_ext: build BPF schedulers via the shared lib.bpf.mk

 tools/testing/selftests/cgroup/.gitignore     |   8 +
 tools/testing/selftests/cgroup/Makefile       |  52 ++
 tools/testing/selftests/cgroup/config         |   5 +
 .../selftests/cgroup/lib/cgroup_util.c        |  83 +++
 .../cgroup/lib/include/cgroup_util.h          |   3 +
 .../cgroup/memcg_stat_cross_cpu.bpf.c         |  86 +++
 .../selftests/cgroup/memcg_stat_cross_cpu.h   |  21 +
 .../cgroup/test_memcg_stat_cross_cpu.c        | 596 ++++++++++++++++++
 .../selftests/cgroup/test_memcontrol.c        |  29 +-
 tools/testing/selftests/hid/.gitignore        |   1 +
 tools/testing/selftests/hid/Makefile          | 180 +-----
 tools/testing/selftests/lib.bpf.mk            | 296 +++++++++
 tools/testing/selftests/sched_ext/Makefile    | 146 +----
 13 files changed, 1204 insertions(+), 302 deletions(-)
 create mode 100644 tools/testing/selftests/cgroup/memcg_stat_cross_cpu.bpf.c
 create mode 100644 tools/testing/selftests/cgroup/memcg_stat_cross_cpu.h
 create mode 100644 tools/testing/selftests/cgroup/test_memcg_stat_cross_cpu.c
 create mode 100644 tools/testing/selftests/lib.bpf.mk

-- 
2.53.0-Meta

