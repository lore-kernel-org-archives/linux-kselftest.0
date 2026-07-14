Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E41042BC54
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 22:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067685; cv=none; b=pEPrWzSSP/MlBV+djob7HPZ23GxG05xlD+8MXVb2FT5jJz36SoA4qh1EIo9qNkYr4utuvAfg70RTKIvl0OrpigyGU7pyQSo3uuxuzdxPkbN7R3tGQ6nhOe6nRRWbzogp2FbzkRapjK4kQng8Et4BcIz76ahFjTRQASusc3yX2jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067685; c=relaxed/simple;
	bh=baqF8AmnWKjBCJqEowFp8BuHg9T8XAks+xfH5wKSIy8=;
	h=Subject:From:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=dR/7EVz2zKNI0WJeURyFpkdT/Ex7vJSpOvag/t1qiGid2jYhA1pgrBMPYFDiAYXaua2SHSdBplb5vnBFPrOL8SBq/N8vQkmten35Zvi9OIS/Stxn6RWonxcLQwu+XEUhfkUwREnnDSpxUD4GNhFpkpceWxzR0/34AUnvhhUBPHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcNipKXv; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcNipKXv"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso3013621a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 15:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784067684; x=1784672484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vv0t/+7auxcbtGWpvakmJ0ritrqSQFOQmC0jKQCZU2I=;
        b=pcNipKXvX6w9m52Uie0ZbWhEqv7c2yWACBgxCRWNfzqvz9nfaVeNbcMDzMXhFb/mo8
         viXdEgN7YCmj4B+PlsqAPXPgL6c9hwqu19stFCd2QQX2oBCBCv1wVje+kLzzmT7QTHqS
         slNnVlFlUvvZdM4G9AaTgreOJTZJqI9pBz38oi7E5y/OC20YA30IcmDfnovmrqyW6dzf
         bdBvcO0WbU5k7YADa3EMRNUS9YHCXLSea6oMzVM7GSwKzURIX2P5EAQ5om9Gb1hcyYVU
         b+rnqY9B9iFiUeTwLiAtdbSva3mQScSJME3RjDSuLErWJ6/XSepBC7O/qO5WgTydfpVj
         TMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067684; x=1784672484;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vv0t/+7auxcbtGWpvakmJ0ritrqSQFOQmC0jKQCZU2I=;
        b=dFJYQuRmgn8WKqcniJG3FoEsQwvGhQfWKE4UiYo22y+GlYCqjGxlQaylGtvb5kos/1
         SLsEy5D1x8K96d1pSBLIFM01djGeMQGBMPlLKqvWMkXrP0PIffld0H1nNzOJ1cjDnxNe
         jKO6FNc8KMOoHC4yBF1QY+/mXWDxk9Fh6dZONclztJIWYohLZjLXBye1V4tg3nWBj9iu
         CDmgfQuZL89MmCwQZ4E/bU0EAcnc4Yr6qXxXnMgruF8YfRtnpZmoL4fvSpekb8Lma56Z
         h/iUqrf3Vy45WC2BZtfUyGgw2UmSMy8zqxIN3Gd84Athf3hl85nBSC7CIbblohMjlTHZ
         4quQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5hOYTigr23hNlRznRQPWASDx/AOyrD7izEFulDGLyuHB0FCesQ2Wgy/cufkg6pKD8eq+tu/95/qOS5axLk6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdAI4LY6R3yB4otGuMANYTz0hO8ozrL2fCz/xOc0LDk6DotLjI
	a1WhQ3BstZZPzzmRzu9dx6uWwHZgEfSqHECbcsTJAmK4tLPsk1+GbSXA
X-Gm-Gg: AfdE7ck1n/kC+ey7+4+tlg5bBrHDiJHpxJHlEv+gwBbFvksDDXg/eRHZTdaHo7JAbnO
	eU55OcSuqlwZozxBNBWWcDirQJT7DuBqKgax5wbapKF4MfU+GGvDRuTpswNHWJOq1G3U/bO7dBx
	FU/dhHJc0s/j2zWcKOjjmRn6rWwxwOdUg3rP++BpJ2i89ed3SISDDTw+SYonK/Z4K/232JzSehc
	jAScPCKA564it0sXfsrUsIXleXJ57vKFDVIt/P++ASGYjO+NN7M6+e6hW39mg4wQljdkWI1mytZ
	iUKCuDaQlUMO9Z1VcLEv9OKZ9ItU2m9pHOJlpkZvYA3pLnxkJ3bEnAEa9pcu6IRA4QEZ+B4W7hd
	dz303Qdqij5QLgyRNSJtZ8eqRWUtJcUDHzdCjGJ49O1gOODuBn7ipDeKMc62viqj9Pr77jTRtRS
	aXM4C1VwIXGaiPqHu9R61qxnBPyP5auVPE0cAQwe21j9yneZNfHygYZJOoAQc=
X-Received: by 2002:a05:6a00:b4c:b0:848:6895:b763 with SMTP id d2e1a72fcca58-84a6735881cmr262012b3a.40.1784067683556;
        Tue, 14 Jul 2026 15:21:23 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643cd6sm10622134a12.26.2026.07.14.15.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:21:23 -0700 (PDT)
Subject: [PATCH v2 0/4] mm/hmm: Clarify notifier retry state and scope HMM
 timeouts
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, jgg@ziepe.ca,
 kees@kernel.org, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 ljs@kernel.org, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
Date: Tue, 14 Jul 2026 15:21:21 -0700
Message-ID: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This small fixup series applies on top of:

  [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for userfaultfd-backed mappings

The first patch updates the HMM documentation example to make the
mmu_interval_read_retry() state explicit: callers should use the notifier and
notifier_seq stored in the same hmm_range that was passed to
hmm_range_fault_unlocked_timeout().

The remaining patches adjust nouveau, amdxdna, and drm_gpusvm users so the
timeout passed to hmm_range_fault_unlocked_timeout() is treated as a relative
HMM retry budget. These callers no longer keep an absolute deadline around
their outer driver retry loops or pass a computed remaining time into HMM.

This keeps the timeout scoped to HMM's internal mmu-notifier retry handling. If
HMM succeeds and the driver later observes an invalidation through
mmu_interval_read_retry(), the driver retries the operation with a fresh HMM
retry budget.

Changes in v2:
  - Kept the nouveau outer absolute timeout around the
    mmu_interval_read_retry() loop. hmm_range_fault_unlocked_timeout() only
    bounds HMM’s internal retries, while nouveau faults are handled from a GPU
    fault worker, so userspace fatal signals cannot break an endless stream of
    invalidations there.
  - Updated nouveau to use time_after_eq() before calling HMM, so the remaining
    timeout passed to hmm_range_fault_unlocked_timeout() is always positive and
    never 0, which would mean retry indefinitely.
  - Updated the nouveau fixup commit message to explain the worker-thread
    timeout issue and the time_after_eq() boundary behavior.
  - Fixed the amdxdna fixup commit message. It now describes
    aie2_populate_range() correctly instead of carrying stale nouveau prose,
    and notes that command submission still keeps its broader timeout while HMM
    gets a fresh relative retry budget.


---

Stanislav Kinsburskii (4):
      fixup! mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support
      fixup! drm/nouveau: use hmm_range_fault_unlocked_timeout() for SVM faults
      fixup! accel/amdxdna: use hmm_range_fault_unlocked_timeout() for range population
      fixup! drm/gpusvm: use hmm_range_fault_unlocked_timeout() for range faults


 Documentation/mm/hmm.rst              |    5 +++--
 drivers/accel/amdxdna/aie2_ctx.c      |   12 ++++--------
 drivers/gpu/drm/drm_gpusvm.c          |   21 ++++++---------------
 drivers/gpu/drm/nouveau/nouveau_svm.c |   14 ++++++++++----
 4 files changed, 23 insertions(+), 29 deletions(-)

