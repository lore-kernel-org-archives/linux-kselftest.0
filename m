Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE83E35F615
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 22:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067714; cv=none; b=FmthJw3PAKsX1BWepbLBHbXarSpPVK62L2jbyvrm5cjqgnWM2LRTnquxtEET9I1uAluQudsUTRd4NkkMQgWNsRRjbuQQ9CoUgvtgqnTYDa29FE4e2hSZxFa8wLEuufeIjYfRjRNjvIqvWpkXdy4cD21BrIIU14K05U4tsBYmLxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067714; c=relaxed/simple;
	bh=Q8uBbE9XdPRVXQaZ0ExTI42TK7zcMOJJhXBlrcrT8a4=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TVZzsm5AtdUeMZ/1lawPsNK70Mnb/kanVh/VBBDdu3XB6JhxOI24ZHpLsNfEqxCONsu1jgMKllf7BI1ZHzFsvwgdGOO47fhmOXv12d5XW5l5yk/eIBlnsetfqCR5QmgZXfNzC4JZxR71VihjvNSnxYRWQaH/1vmPl8JbMk5UVYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCcqBd6p; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCcqBd6p"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cedda2ce6fso17383775ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 15:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784067712; x=1784672512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EUZJ2b06rpE59kyPt/lRc7T/ATHNB4Peeih6JEYSOE8=;
        b=bCcqBd6pLM1VKsXErISfU78JfZjhPvwtrPLKWjhOTWaMKlw3MkCu6iNgjz3nvZ8Y5I
         GP55kEVQPhUwQn4WehX6KPsxRiyraoW0q1ySXyPEWHL4NBQ23BAX6CsWVmdzcV2ZgAdp
         aZCp/AvReu1EG1gm8RsE5U08mCNNsa5AfntU5TOVoTceDeRTv1Vo68SSKmIR7E6SKVHC
         gZEQ3+1AMnpYRI3WXOpLobTzLIdIA51HznWH7crClBm2IiiKrRTBivXZ49MTwkrSb4Nw
         KbG5UQd4WpH6FWp277B6k6OR8PfZ+mHEiUls7Et9WM8WyxgzSUSyJqkk2rLsf8BcTtH9
         AOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067712; x=1784672512;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUZJ2b06rpE59kyPt/lRc7T/ATHNB4Peeih6JEYSOE8=;
        b=DkUrVhswJbYiOTbGsBUx+m87tFvjOKIJIL41cT6tEp8G5utbBpHEqT+BmEjGHteC5l
         ddnapAziTmlqhglG6QEuT4eUno76dfuVsNSV2/W2ROFnmmMT1nE2N84zrjBLdvUbgZ6U
         +aMGyUFvpw2PuFsjCQoXRCcKP43Wtue9Hn5oBbGMnezhBXMDlHAb/TIDnTYHzw+5aR3x
         c8FqOMWw/lR7TWUJ85XQLo1i4INb+BnmseZuVXFqTXEaBkcTrH92vwQAN3r3Zj5qw3S5
         j2GyFGlQRtzcxw+B+88hNxjDvQE1bSPvC9z1qAxHefowluQmrWrOA9a9Pv1SgIYdChxo
         yKWA==
X-Forwarded-Encrypted: i=1; AHgh+RqWqFsvrDSetWnvtCZ5wAyLdkqyI8cjOYD5AgCZVH3A5PcCfGuMo36C2thXhS4VjfScpoj2R3M55YlVxK01ge4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3AznRQ1Kf6SZ0ue5FRkbhh1lpZ6Y8w6fLBBvX71aSLyYUg6FP
	Ug7RvB81Y0oLH2G6fKMNrmbx/SXugqapglw2SiYHwpbk7i4G20M3cNq9
X-Gm-Gg: AfdE7cnxd26F643HE9vnBOPF8Ga7coE3xmvr5furLEgJ6UlLqTwLtg87dUwSCpYVoyP
	gogcRjQf1eDJEqYdBHMvz1EDdPzUCjklUrgbBWc+CY6Fz2IezwJ2A64DAhyQlHffpwUK1iZDvMR
	GRG+OO68rz0beG07TxWAykb201lVc80cIMjtMe2vEj6pZusnjycKfTiey1BHDfK7sBsej501Ec5
	UbKrMYlwtuFEnkOxxQhjjRFJ0N3nLmbJ9pWBk/JiOdt3V3h47zP9cGgukRbf4MVTOgltOFm2ENO
	kFh+ZHn6BBcJQlKi9QPhf3jRsTbdmeh71wg3VsJbALOtqzGgoCjc/TR+elQr/qo6EXJUwRfgb3m
	DAs95hTCQlI6ixt+/mFrKZUphwCKtq8dkC9vXZoka9aHK2k1YOMX+IQMwwOZ944B8um3HYXCbfN
	KqoIk2fuBhfLswE1N5vscTmvFv9tSqIYaQYF3VenAbftkJZtTjrROanip1qGg=
X-Received: by 2002:a17:902:e751:b0:2cc:307c:51f2 with SMTP id d9443c01a7336-2cef143aec1mr42102315ad.22.1784067712200;
        Tue, 14 Jul 2026 15:21:52 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1f030sm122554955ad.51.2026.07.14.15.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:21:51 -0700 (PDT)
Subject: [PATCH v2 4/4] fixup! drm/gpusvm: use
 hmm_range_fault_unlocked_timeout() for range faults
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
Date: Tue, 14 Jul 2026 15:21:49 -0700
Message-ID: <178406770964.1106335.10099816010446253543.stgit@skinsburskii>
In-Reply-To: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The timeout passed to hmm_range_fault_unlocked_timeout() is a relative
retry budget for HMM's internal mmu-notifier retry loop. drm_gpusvm was
still keeping an absolute deadline around the outer driver retry logic
and passing the remaining time into HMM.

Pass HMM_RANGE_DEFAULT_TIMEOUT directly to
hmm_range_fault_unlocked_timeout() on each HMM fault attempt instead.
If HMM succeeds but the later drm_gpusvm-side mmu_interval_read_retry()
check observes an invalidation, retry with a fresh HMM retry budget.

This keeps the timeout focused on repeated notifier retries inside HMM,
while avoiding an outer deadline that also accounts unrelated driver-side
work after HMM has made progress.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/drm_gpusvm.c |   21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index b8f2dd9982f5..76e8a0028c7f 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -852,8 +852,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
 		.end = end,
 		.dev_private_owner = dev_private_owner,
 	};
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	enum drm_gpusvm_scan_result state = DRM_GPUSVM_SCAN_UNPOPULATED, new_state;
 	unsigned long *pfns;
 	unsigned long npages = npages_in_range(start, end);
@@ -867,8 +866,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
 	hmm_range.hmm_pfns = pfns;
 
 retry:
-	err = hmm_range_fault_unlocked_timeout(&hmm_range,
-					       max(timeout - jiffies, 1L));
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 	if (err)
 		goto err_free;
 
@@ -1459,8 +1457,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		.dev_private_owner = ctx->device_private_page_owner,
 	};
 	void *zdd;
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	unsigned long i, j;
 	unsigned long npages = npages_in_range(pages_start, pages_end);
 	unsigned long num_dma_mapped;
@@ -1478,9 +1475,6 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		return -EINVAL;
 
 retry:
-	if (time_after(jiffies, timeout))
-		return -EBUSY;
-
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
 	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
 		goto set_seqno;
@@ -1495,8 +1489,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	}
 
 	hmm_range.hmm_pfns = pfns;
-	err = hmm_range_fault_unlocked_timeout(&hmm_range,
-				max_t(long, timeout - jiffies, 1));
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 	mmput(mm);
 	if (err)
 		goto err_free;
@@ -1718,8 +1711,7 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 		.end = drm_gpusvm_range_end(range),
 		.dev_private_owner = NULL,
 	};
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	unsigned long *pfns;
 	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
 					       drm_gpusvm_range_end(range));
@@ -1734,8 +1726,7 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 		return -ENOMEM;
 
 	hmm_range.hmm_pfns = pfns;
-	err = hmm_range_fault_unlocked_timeout(&hmm_range,
-				max_t(long, timeout - jiffies, 1));
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 
 	kvfree(pfns);
 	mmput(mm);


