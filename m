Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1643D7D8D
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 03:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630361; cv=none; b=JmumDKHEsX3DOVIfHd2+t4UgP5BmGcrHf34ymtXbVRmBUZBTKj8iH+40iTcEJx4HHxk+N27+I7PjC4zKoKx48w72vSd5kujTl7k8vI7fVKFRfbD9Qpdt3Yp+32skdhcbpxg1CbM67tWx4NjoU+T7NhZ9dsev8sGasD4tmV4C41I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630361; c=relaxed/simple;
	bh=1LwQcHct4xAgSyTlooLN5j+p8rVdMKhmicQCXkD6pPE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=AdDHPJy1RMk3vQtfTWzEwcUt1Ry1RVSm1yYEQaKyk3GyEc3N5HQR5kt+SRGEO12Mobd61PcaH1RV3GxCvjfmncgEGWrVa1DhWSThIXpdQnhX2L3h2yfSwnrxVvHfhz2GJQLgurMPkKnuBZ7LGlBtyqMaqe6v+BxgAxCI5FIbyuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=LeNBnUrs; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="LeNBnUrs"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8ce65629acaso16375346d6.3
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 20:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780630357; x=1781235157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iv2aPKIPLb4egTBCESQqff8jQhyqWNFkX14M23BwCsY=;
        b=LeNBnUrsteeGlCEQ7+0IUNgOD26ESmfuC7nDrdBgq/ZteMgFAq74hNaYynk+xiWYBY
         xdCVH9mDvYQE1BrUQtJPxvbl9lrB/PGHEwyD0c8rPTIGYi60A5I/rf4zNO0XinVLSzN3
         xpaSB/wRqi7IUTyjUaMtwjJTZvrV2xfR66VWnJkWi3/+UEF0mTFYhOjhzLuzjWtZZ8rz
         70y3fJVrRPAZr7+nHqctewvtA1YY5N08ntA/UV6ZvQZ1nA7QxiGFlnR22x/pMhXVF1+U
         8bDX/UULIu4Z3CL18iKZcAsv3k/kK3ADN5OS9Izm6VNpAiMziY2Ykja2scNv1f0Pa0Wc
         ZOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630357; x=1781235157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iv2aPKIPLb4egTBCESQqff8jQhyqWNFkX14M23BwCsY=;
        b=K+V/b4X5nDw67997SqyG/54fd4B9IA6XzajLU07Vc/XOoWZp3X+G2tbYuLV8DUl42x
         alZvx6bzmAc/ywBlvOGwcJS8hiVQuzfdYlZGHcPMmlLc1wgjNCL8jbNn7KHf6oA96zL/
         BJ46xtlW0SuO3wjzmsC70sFpy7iGJzR6s6GoYGsArjHokxg1eEsIrrgc+7u+CdeDDLYI
         2M7S2FV1k0aPXiFeyVih4wkHmLhkePdBAtxTAvgJ299wcKRZbTkKG8L95YzhAYA6GVMk
         3yA50eTNsZU5x77/dk/QJnbOYMLTiBLL8T6r91V5erxhmLMAHZIXZ4yVLFJEZqK6FKOI
         DxXQ==
X-Gm-Message-State: AOJu0YzzuIxmgFuXoexS6BLG3Le8AguxU7NcyynqpKFRfZtQMCv/iPYW
	5yteFSvK3vY6Tn9cf80egJnbOWii405CxafqGbHZk96QmPcF+N3ZyzEdfgtcWyXFc3bhzkW7ynr
	FfIYt
X-Gm-Gg: Acq92OGqLyqMtSOv2cvR24oftKrH8O0AuCjtzsAMEMoWfNPQRDS5a9NzAv6cJczE9+H
	0y4ZPuseQFFBOAbO3TgOY3lBGwUykX97JaJ3MsnuheH9latyW9PlwpFo3PF3ogTcFF6ExOndZZ6
	1fZMiwBFynndaA+dXbj1K8mDx4eBmSb16vJPmDBPinydF4/5pmQrF4PC1NjOv67uEiwlMym3Zcb
	SpoBsd1eZs2MiS4n5XKnykm2L5iZCTWXmuNckorSHdeG6H5zwCLsCNbnwX4XS9lwLUZtCYRK9GN
	yQO71hJVV8S9VWl+Werq5zTdaZXS1vTXYnhlIevj3OQkT/57jLkkAMdtfanBppq/lc/sIXEBVM2
	j8ylxHF+l9OtQMYYWP/pVi9Tr/iRKM/cg7l5Aqa5V8dvLPuMASRmCiaHU9/dc9KaG3n1j1F71up
	6UoxWWwiVdu8VHRT739WeP+Y7xL/3tBr0Xh0wlC8fMk8Yw8fjqz7RFsWVrRNzeYDt9bUuYkZvn
X-Received: by 2002:ac8:4809:0:b0:517:905d:dc78 with SMTP id d75a77b69052e-51795bbf697mr17436291cf.37.1780630357252;
        Thu, 04 Jun 2026 20:32:37 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd053210sm69052176d6.26.2026.06.04.20.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:32:36 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	jasonmiu@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	ran.xiaokai@zte.com.cn,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [RFC v1 0/9] kho: granular compatibility and header decoupling
Date: Fri,  5 Jun 2026 03:32:26 +0000
Message-ID: <20260605033235.717351-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series decouples the compatibility tracking and code organization
of individual KHO subsystems (radix tree, vmalloc, and block device).

The diff here is a bit larger than I'd like, but most of it is just
refactoring and moving code around to modularize the subsystems rather
than functional changes.

Specifically, this series separates KHO data structures from KHO
core functionality:
- KHO data structures are those that have ABI checks between kernel
  versions (e.g., vmalloc, radix trees, and block devices).
- KHO core is the functionality that involves passing the memory
  from one kernel to another.

KHO core depends on some of these data structures, but other users
of KHO also depend on them. The number of data structures keeps
growing: first we introduced vmalloc, then radix trees, then
linked blocks, and next we are planning to add an xarray-like
data structure. Keeping all of this within the same `kexec_handover.c`
file, and also under the same global version, is no longer sustainable.

To address this, this series:
1. Refactors and reorganizes the code by splitting out radix tree
   and vmalloc into separate files.
2. Moves and organizes internal and ABI headers into structured
   directories under include/linux/kho/ and include/linux/kho/abi/.
   Instead of cluttering include/linux/ with prefix-styled headers like
   kho_block.h or kho_radix_tree.h, we use the already existing
   include/linux/kho/ directory (e.g., kho/block.h and
   kho/radix_tree.h).
3. Introduces a standard set of compatibility helpers in
   kho/abi/compat.h.
4. Decouples the compatibility strings of individual KHO subsystems
   (radix tree, vmalloc, and block) from the global KHO version.
   This enables independent, granular compatibility versioning.
5. Adds a KUnit test suite to verify that the composite compatibility
   strings of different subsystems remain unique and sorted in
   alphabetical order, guaranteeing a consistent and predictable
   representation across configurations.

This series is to gather feedback on the overall design and layout
of the granular compatibility mechanism.

Pasha Tatashin (9):
  kho: split out radix tree tracker into kho_radix.c
  kho: split radix tree headers out of kexec_handover.h
  kho: split out vmalloc preservation into kho_vmalloc.c
  kho: split vmalloc headers out of kexec_handover.h
  kho: move kho_block.h to kho/block.h
  kho: introduce compatibility helpers and decouple block version
  kho: decouple radix tree compatibility from global KHO version
  kho: decouple vmalloc compatibility from global KHO version and update
    memfd
  liveupdate: add KUnit test to verify alphabetical order of
    compatibility strings

 Documentation/core-api/kho/abi.rst            |  11 +-
 Documentation/core-api/kho/index.rst          |  10 +-
 MAINTAINERS                                   |   1 -
 include/linux/kexec_handover.h                |  18 -
 include/linux/kho/abi/block.h                 |   4 +-
 include/linux/kho/abi/compat.h                |  33 ++
 include/linux/kho/abi/kexec_handover.h        | 203 +------
 include/linux/kho/abi/luo.h                   |   8 +-
 include/linux/kho/abi/memfd.h                 |  12 +-
 include/linux/kho/abi/radix_tree.h            | 133 +++++
 include/linux/kho/abi/vmalloc.h               | 101 ++++
 include/linux/{kho_block.h => kho/block.h}    |   2 +-
 .../{kho_radix_tree.h => kho/radix_tree.h}    |   5 +-
 include/linux/kho/vmalloc.h                   |  34 ++
 kernel/liveupdate/Kconfig                     |  15 +
 kernel/liveupdate/Makefile                    |   9 +-
 kernel/liveupdate/kexec_handover.c            | 531 +-----------------
 kernel/liveupdate/kho_block.c                 |   2 +-
 kernel/liveupdate/kho_radix.c                 | 290 ++++++++++
 kernel/liveupdate/kho_vmalloc.c               | 274 +++++++++
 kernel/liveupdate/liveupdate_test.c           |  56 ++
 kernel/liveupdate/luo_internal.h              |   2 +-
 kernel/liveupdate/luo_session.c               |   2 +-
 lib/test_kho.c                                |   1 +
 mm/memfd_luo.c                                |   1 +
 tools/testing/selftests/liveupdate/config     |   1 +
 26 files changed, 997 insertions(+), 762 deletions(-)
 create mode 100644 include/linux/kho/abi/compat.h
 create mode 100644 include/linux/kho/abi/radix_tree.h
 create mode 100644 include/linux/kho/abi/vmalloc.h
 rename include/linux/{kho_block.h => kho/block.h} (100%)
 rename include/linux/{kho_radix_tree.h => kho/radix_tree.h} (96%)
 create mode 100644 include/linux/kho/vmalloc.h
 create mode 100644 kernel/liveupdate/kho_radix.c
 create mode 100644 kernel/liveupdate/kho_vmalloc.c
 create mode 100644 kernel/liveupdate/liveupdate_test.c


base-commit: 5fb813ae0009d97fc414f08ad73286f562e9a123
-- 
2.53.0

