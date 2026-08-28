Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45371684B0
	for <linux-kselftest@vger.kernel.org>; Fri, 28 Aug 2026 03:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787888267; cv=none; b=PDMVz4o9nEozaSqK8g4YLMHSWZSRBd242dzUut7Q2FHNDiaO2qvwJGOd7aBx4khU6w0CIgkNKu+GRqXbCVB5t6iim2svMIceCElx23jY3d0r+3A4uLGOJZHt4wDLXqizyYwJj0Me8N7V5phH0joCgHFFjOsG1y75hD/sWAbsCNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787888267; c=relaxed/simple;
	bh=aHUELh+5QTQvTY2lgbLEFQIKyjcUuZxlGydQgfB3twY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=noDcZ1OjMrYLy4N3cprXr3P3TCtyiCUnKXmCwfTFQsEbbLcINRHUM51vKGyXR727+jDQAzWYea0nZOhXQHUzZvn4i4yTUN0ek5BxooC2zZRQitZnJmECI6FTEnGVUP814/RgM27/lEaD25X8u5VnY05kejYFa0RycsKq+gfOOck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kj2gQpim; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kj2gQpim"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6df0a1e18so11659405ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 20:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787888265; x=1788493065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bBeMGceDtS7wvXAGGzR5dbY5boET7zUUnip9K7sfHCc=;
        b=kj2gQpimbr4i5H+xxApO2jIFDgneJD8XWd7dJ18WqKXe0gbOTuef3mc7qLvTrKw5G7
         fB+1ON9KO+jQEj6A/VJWwzTkwEyNmzEmB0hFoteTxeJPX0mQDBJFLtlhTuMlvrQT7HR9
         iVPGfp1FAoUc94kNRcD+DcD3BHd6Bc6p0LWxM0sVw61w5hnlRR5Mskpwg4ScnRjDccP5
         RUSSrbXhj2vaG5Lo5wJ/NwMnucwbxkZGtz06tgsENZt1H2nD1vRgDWFd3kqKnuIyAzAu
         5TLe4eCnnOmvs0pxGg+QiOvmy/P9KyZS+jvi6oh6Pb7Usz4ipY3SjT/OeORGCcPzNgxT
         xxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787888265; x=1788493065;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bBeMGceDtS7wvXAGGzR5dbY5boET7zUUnip9K7sfHCc=;
        b=I28IxCCeRLA++EO2gHO78VghpKvHAP3vM6Jl8mq0kfXLqtp5QDfo85GoYZi1f0G9NX
         1wMLVdeLMbOF1j+ExC+4sF5gzFs7c93vYBmjRXXuSpYiqDeUipFFGrYMouvQvJbFkYkh
         LYVFzwspo/i80RvPAJpsOja7e2lXa8FZGBhloTngHmfcjF4XGqDysbBOce098T7xJmIo
         QCXQaNyEVuCFCDcsceimn2vFLwG4hiRiWY9yJmO2gHr9qzut2oGZzfF3LoIupLc+A2Oa
         4YI/d5RpJVxtR8rtps/Vv8ppKi0kAp/2bX40SO9YXlskdJIPIAUI5Y5ET+Fshjj5SuYS
         bDjw==
X-Forwarded-Encrypted: i=1; AHgh+RrEsOPEEtW4T98nQFdtTBYJM2ktiRq14csENCGuoJwBd+Aa8MIyW7gAwLXtgbUMnut5zuEK1hJ+V4/HZKRxpbY=@vger.kernel.org
X-Gm-Message-State: AFuF++lmmhV03TseZQGXWutYi7IyOfRXu9XldnczZw0jByXh7o9N4h1N
	UQzhQedMTEh6AUVYwIPfDd8jSYl9T2S7r+Z3wrHV8dPKVd7f1x6cEkAUZJ/6EqTEw0Ec/gvY/XP
	kY+XpYjhGxg==
X-Received: from pld16.prod.google.com ([2002:a17:903:3550:b0:2ca:ceab:34a3])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:9cc:b0:2d3:716e:e2ae
 with SMTP id d9443c01a7336-2d74dc5f3f5mr61909945ad.6.1787888264856; Thu, 27
 Aug 2026 20:37:44 -0700 (PDT)
Date: Fri, 28 Aug 2026 03:37:30 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828033741.2184560-1-wfelipe@google.com>
Subject: [PATCH v4 0/2] selftests/cgroup: fixes for test_zswap on single core VM
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

v3 -> v4:
- Patch 2: Use `long long` for `delta` and `max_delta` to avoid integer
  overflow on 32-bit platforms (Andrew Morton, Sashiko).

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

 tools/testing/selftests/cgroup/test_zswap.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

--
