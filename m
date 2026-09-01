Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B634CCDF1
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 05:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788240176; cv=none; b=FGKtWeSf/hg7RxsKekRkGpl9/uOiMEj/oS/svC1tHH81Ga7Kp5DMAiJ+3lYKAJXtqf96v4ii8qUZpAAu2PFS8NMZ/TTNqnaAwyI7J7Q1ezKlfgJXbEaJ9B7P6qlCpEyWT6chYAjxkksOcX2sxi+jiS+qhV4y1cVhK92QRBFedhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788240176; c=relaxed/simple;
	bh=7d66+wdVMUZe9erjh/FQ3VIFIP8pmZBxt/bxh2mg0aI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=lQp/9vnU7vrlA4DRa6TOhbjFd20w1SxR1/QFoXqCwYUH6g8fvWC4FIQbJ//kbU+tnAykJNAvfyk3SCLXa/ROF7FBrvQZB40DkxeYcN9FCdJuAt/+va5+mRXq5pw24T8eMxo9hE8QHdFEWVnZUVEGvNxT64bqmEFkvxy5NzJda2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bB5gX+2p; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bB5gX+2p"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d54187d8b0so11825335ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 22:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788240173; x=1788844973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pSEvj+MC1crqw1bkvOqmX0QxnYX53YLokZZ2psek5FY=;
        b=bB5gX+2pcxYFUF9kL+k2N8z9jEK+pzWuLyj28wHLMwVi8v8RYMU5f1uwr2EsMLIjCW
         9nCmb/N1WEtN89L+PmiKBc1C0XB9DZ+3fNw5MT0+0LI91U3ecvYfppNW8MBZr3a5firh
         E0BcXGIQjfQupE4GRUeFcnu0rLmT5jWfWL9sNjD7QJqUAvjM/FPjEE4Z6eRX1ojtr1wb
         OGMgVxksfhGe0gFCKv/qPIw8909/cEeHDiynuQucFtzkoR4A+/ESdK9j0aUc7VdUh+NU
         aXiwdg2rB1ry1Lb7D8lPW07/CEZIRqN+GO63AgiAILh2NCoHn9M49tP2V3DfuY+66oHO
         +NyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788240173; x=1788844973;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pSEvj+MC1crqw1bkvOqmX0QxnYX53YLokZZ2psek5FY=;
        b=OZ7cd5T2yag3VyMW50dUOvaTQb0ktFGYnUrF4KoEeq4LrlXTWcj6gndROd1xgcBGbJ
         mYywor1Yw6CRki4a8FZCpdtzPa8eOTsul7LqqmwDK6hU+z4Wc2KDikcEwqifJ8YQAE5C
         99Hy8cZCciibgDYyrmWxqMR60yAH3uATAfnCdHKyTE7F7nPFaG/7fXa1qvM1B1C+Cd80
         nplofSk5xjxl2MMWdKgR2j6QGREIK4pxfWrqX7SLZCgZpGSKj301G+mdTLcUiq8Dj+mm
         SpzLqvQSFPw0WIpm+ExcNSe1jpb+qNY4oefkBAdNBpiU2ywDYZS/N98hsBNiRPoHyZCu
         frog==
X-Forwarded-Encrypted: i=1; AKwUvBwmnhB0xiU/HlNfc33acsN2sO5h0maFo84WunQiKF/NYElioJdAu6rH91CpT/O6RkkBYlSTEIHRrv0ih281H2A=@vger.kernel.org
X-Gm-Message-State: AFuF++nWoJeBwYTKMfiTrBm8TVg7PVP/VIJdjVGqMCMcpGYRIsLAVmDF
	WIq5uuyG9Oug3GjPkvZykgDFcWeDofUhVle7QNnTh0WVkVHZcyE2tVS3Y+LAO9lME6qeW4ZK+X8
	qmy76oGxxDA==
X-Received: from plbjy16.prod.google.com ([2002:a17:903:42d0:b0:2d9:1541:2cac])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef52:b0:2d9:383a:30f1
 with SMTP id d9443c01a7336-2d9383a326bmr129023445ad.4.1788240173018; Mon, 31
 Aug 2026 22:22:53 -0700 (PDT)
Date: Tue,  1 Sep 2026 05:22:26 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260901052250.154532-1-wfelipe@google.com>
Subject: [PATCH v5 0/2] selftests/cgroup: fixes for test_zswap on single core VM
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wilson Felipe Pereira <wfelipe@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This series fixes two test failures in test_zswap observed when running on
a single-core VM (-smp 1) with 4GB of RAM.

Patch 1 addresses a race condition in test_zswap_writeback() where
waitpid() returns before the exiting child process is switched away by the
kernel, causing an immediate write of "+memory" to cgroup.subtree_control
to fail with -EBUSY. We fix this by waiting for cgroup.events to report
"populated 0".

Patch 2 fixes an implicit unsigned conversion bug in test_no_kmem_bypass()
where small negative timing differences between debugfs stored_pages and
cgroup zswapped bytes caused the comparison to falsely fail due to
unsigned promotion.

v4 -> v5:
- Patch 2: Introduce `cg_read_key_long_long()` to return a `long long`
  value, and have `cg_read_key_long` use it and convert to `long`.
- Patch 2: Make `zswapped` a `long long`. This prevents a overflow on
  32-bit platforms (Andrew Morton, Sashiko).

v3 -> v4:
- Patch 2: Use `long long` for `delta` and `max_delta` and explicitly cast
  `stored_pages` to avoid integer overflow and implicit unsigned promotion
  warnings on 32-bit platforms (Andrew Morton, Sashiko).

v2 -> v3:
- Patch 1: Collect Acked-by from Michal Koutn=C3=BD.
- Patch 2: Explicitly cast stored_pages to (long) in delta calculation and
  inline the return comparison (Michal Koutn=C3=BD).

v1 -> v2:
- Patch 1: Replace EBUSY retry loop with cg_read_strcmp_wait() waiting for
  cgroup.events "populated 0" (Michal Koutn=C3=BD).
- Patch 1: Clarify task lifecycle in commit description (Yosry Ahmed).
- Patch 2: Remove abs() and declare delta/zswapped as signed longs with a
  signed threshold comparison (Michal Koutn=C3=BD).
- Patch 2: Add Fixes tag (Michal Koutn=C3=BD).

v4: https://lore.kernel.org/all/20260828033741.2184560-1-wfelipe@google.com=
/
v3: https://lore.kernel.org/all/20260827034807.2822234-1-wfelipe@google.com=
/
v2: https://lore.kernel.org/all/20260824033533.2147900-1-wfelipe@google.com=
/
v1: https://lore.kernel.org/all/20260804042053.56940-1-wfelipe@google.com/

Wilson Felipe Pereira (2):
  selftests/cgroup: test_zswap: wait for cgroup to unpopulate in
    test_zswap_writeback
  selftests/cgroup: test_zswap: fix implicit unsigned promotion bug in
    test_no_kmem_bypass

 tools/testing/selftests/cgroup/lib/cgroup_util.c       | 17 ++++++++++++--=
---
 tools/testing/selftests/cgroup/lib/include/cgroup_util.h |  1 +
 tools/testing/selftests/cgroup/test_zswap.c            | 13 ++++++++-----
 3 files changed, 21 insertions(+), 10 deletions(-)

--
