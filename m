Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8856D418A40
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 20:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784060007; cv=none; b=EwUOGSlpFoGr03aA7ZkgCdYJqvKBaI4wEovuv3LH38JSDaIYrOcEJAuwlc4UrE9KMDOY5XdpqP7QjDt3RdXTcR4HXw8tZY8JatciszebxqdId2QsA+FX65qRhVGD9IEvd0L0Sy/v2KiVRrwxHCvyMcaDIOv+i0q9JpvHaXSQdzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784060007; c=relaxed/simple;
	bh=M3iXyfmpsqnLTOm4C9JQljZWWPFlOSzSAIkxUKB+CuM=;
	h=Subject:From:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=o1QDf4HVP9UV6dPhWRM1v3GqlS29UCKo1AEo3OCNL/Drb1ilNNbkpK5jFoniVkBSB/h9099uAmFR/ytNxrkEUWlH+w+JGShB5l18HkpNwSAIS75tGZy5yFpI17Q1ejRsNrZGVBBcF6z9tiUWwviLKBhXfgUjp3cU81jyim0H2SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6lFJE3e; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6lFJE3e"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8485b358552so5219755b3a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 13:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784060006; x=1784664806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgA5/ZNNqpom9Ojeo649tW4NqgfWq3ikZU/yXXQBBgI=;
        b=k6lFJE3eKj2hmZ3Yy4wyePNrZYKYIgZz5P/UI4UA4IKlS0oB/+8bq4IoSuCCLwsHuJ
         IvQtFLkaoFqtMUobJ805Gtn6+BUGYQGBpeb2Y9opKbcnf8j/VqD/DnsqnPHFsvHSX+wx
         zRVn0rE2MoUlWf9mAKT/c4YdzI2R/np9m3yAB8BtLfL0J5qt+1fd4JrwaP1xwUJGXewj
         oFbEKm350y+MYJ53a3oMAdOTEjfNhoTLIuUyB5N3z7wRAWQZ0ZX+C2WHEIaC5A4/hrAd
         En3W/kTVRnX/IOTcPCdHH0Pu11FyFyXpK7ruyXY5/bJMSEwwD/z9XKH/yPs6BpIUzQhQ
         Z3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784060006; x=1784664806;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgA5/ZNNqpom9Ojeo649tW4NqgfWq3ikZU/yXXQBBgI=;
        b=rTLPGhRe1Khqx62x7p6lDivBr16F4lFqoM4ZVjAu5y74/WitBAo/pDvs8q0AlYqF//
         UNWJ7VSkB/AYSV9QTRoSgvB5QkYyz4i9gskO2TyYPLwS9fwiXA3JY/+5Qf+O/XAlPkar
         JE7YmFRdE23KR02YcNV5U4nB6/A3pnqcGb85xMT2IdScwdeR0h8QgqXt1AyWrxRg+qtp
         cojPDm5yF6jA3NstnWRfZFrTW3lSOi4Zu22SyvOPPEg5NDGar05TXtv6F8L9GKBROAOI
         Qtxe5kwbX2CxBwFmq8+f7VO0WbA/sxjpTV/cNtHl199vMfBIa/27oQlES9zL4JO120cn
         s5nQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8c/Xk8YNUbETS/zBX5UuOin5Ybf2X8TroDhYls4hIF1ShqfRYdosqZZDQh4L52zg6ExGHlKzocopOnKwC/3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlB8Wk4d3FCuyCj5WBZDYGHpWk78OGvLNSxeYltECmrSb3dp2O
	mY8shHDXGXPkARTxDXXyss1ECmIxBVk8DTuYqXmQWyOPheIf06UJlgF1H0qwUXwI
X-Gm-Gg: AfdE7cnvIeZxQsw0tqOw27LvYkojqv/Rd5CDC643YOUUSASAbDbXMh94l0G8WETVirs
	kBSO9XPTo8MX2DHQsiuN5Yoqc3nVgi+AptMNvvT0BX9HNPe/opPDv5P59nE7KB7d0rtin2JCKMx
	hcbs5ef6sXHrlwG9OtnFOVcVENnhB8ajg1BqefeDNloA3jhmqlwP42iarqIBFkiGAiVZ8B4ULiY
	J0lCL/z5YEJbMILBmvok4fyDOZ4Xhilomfp755T6/7RqckvZps5rgKBDcWkTSW5PJi1u6rnC2DO
	i9y6wVke9FA3I2s8m5AxnENGc9YKUhhzYSYvCSAvi++0/0mlnpAMSovJz5WZqcB02hCOmAvFReX
	9Ez7bQp610zBZ24sFpkPEbj3fc+oFiaTbbKtYBFvY9xZMOkWdgCkshZZosAVDTza/WCOUTkBIZa
	pn63Xc+DFknI5kAZlB6/J511IehHVuebYnCvWsRfJz2ZWieEg46KrSngvg9LPEvObwbVk2Sg==
X-Received: by 2002:a05:6a00:1f14:b0:845:e9e5:cdec with SMTP id d2e1a72fcca58-84a559bb7dfmr3412771b3a.62.1784060005776;
        Tue, 14 Jul 2026 13:13:25 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7dade0sm1998127b3a.46.2026.07.14.13.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:13:25 -0700 (PDT)
Subject: [PATCH 0/4] mm/hmm: Clarify notifier retry state and scope HMM
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
Date: Tue, 14 Jul 2026 13:13:23 -0700
Message-ID: <178405975214.1082778.5193079941156341151.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

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

---

Stanislav Kinsburskii (4):
      fixup! mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support
      fixup! drm/nouveau: use hmm_range_fault_unlocked_timeout() for SVM faults
      fixup! accel/amdxdna: use hmm_range_fault_unlocked_timeout() for range population
      fixup! drm/gpusvm: use hmm_range_fault_unlocked_timeout() for range faults


 Documentation/mm/hmm.rst              |    5 +++--
 drivers/accel/amdxdna/aie2_ctx.c      |   12 ++++--------
 drivers/gpu/drm/drm_gpusvm.c          |   21 ++++++---------------
 drivers/gpu/drm/nouveau/nouveau_svm.c |   30 ++++++++++--------------------
 4 files changed, 23 insertions(+), 45 deletions(-)

