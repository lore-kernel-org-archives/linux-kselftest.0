Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D74442377E
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 17:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360526; cv=none; b=IrAWYtEifBfN8o81gmWM0wdiNCu9Wej3jsSMGhICVpg0GHbFQ+dh27nnwelXDW8bquMXJ8Lz/MkMh6I7+KY6ZRLgsdtM6CxB2rZC1ZfvowIQkVNsDoxiKlLCupFwSmzWc9aaatXrSqm4tJ/F2WqGm7+Bf53y/Q433twdVcBTkcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360526; c=relaxed/simple;
	bh=Qwjjdhxc1DcpvjFxKNOKhBVoMAZizvPc+3Ojfi5wZJw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sTvSacK+CDIKCTrI/YVjN2+Oi0Q3Kv8Ca48lHpL1BPW9akWc7lTdrvftWVJjv0sxSH7/SppDDF5JOvZDhKlb3xI+H5hZ8umkg6UWw48c6vu8vwDNYVwVkmrspy5CrRXUgmz/DRfgurmH5l3S/2i6St67DBGpbjhuA3OUSzUXJxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fP5YRTWc; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fP5YRTWc"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84592b55832so3256835b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 10:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360524; x=1783965324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gda9EnNaq+fnHp+pBJqOcXDPF8q5yM+z5/crGMT/FCk=;
        b=fP5YRTWcInXEJpUGE6ALaVUQKlMIDWpYrtQ8iVOdjSaKcOg4OecNE8nUEKCN9NzM47
         FRytmT3f5odfFRHq/wWOBqFc/lKgBmBZsb37MnzgH+JE3GutvoFHgHMQau7zIsZqnIXd
         6FlEJpcFGZI7VcfKlBUabrHpfDOc7obMSUgcDdJUca3g3+NSbXm2TvWVyFV5bp+LorKw
         4nYP9ibGcA1Nxd5R4/aa00yVS3vSVlbDe4eq9ambDLfEC3VTqUs3YJIa7OEyM8UQ3oPk
         W8AWUiOTSS5HiPr+ADlbOkk24oqMueiyIRY/qJae3GQsk6IhwHZBI201AnCKx8184jbb
         aKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360524; x=1783965324;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gda9EnNaq+fnHp+pBJqOcXDPF8q5yM+z5/crGMT/FCk=;
        b=D1wD9nNadGwA3UnljFHDF6f/TA/ahbIM9FJjYoBzNWtYpfpK/q2JZJtkGM2bhgtGdd
         feEbsmNDjICeOMm9Hq3Mf8+mccQz0ueu6SwKfB9JNu+LhDnSG1bK2barFhOSeK1QiC/n
         +jlOUlLGomgGnird68qqGXP1s0cFFbI45unjxlK+QpvwLBvVXwwD+enDqKAgGSkaRUQc
         iaIqLtM5qPcT8eEl+zieNBbuiJWjOslfd5Ahus34oudCtapm7/UCGzYl9emcKqGKjJc/
         4B2O8YyXy8pzWULkkJmJTNMDP7I0cYnHUtdYd4YjiBHEC71ujLkCVUX06dSALB4G+T4l
         Q9Tw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8H5zHO1cdZFaOyFFXhQlyafBG18o55IF7N9+TXN1rJDSPeljIV6+G1kGadFUQSeFkpeuGAv72b1ESVurbqtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgSi1iMOXlu8VGhDg1mLsOiX3RUBKT3AdTnBzZ3LXwpafnqkSd
	38LcJ9bNxj0wA7QehCETWge/KUv2EFb0ybDUyRV8HW8SAGnT+RR31fHY
X-Gm-Gg: AfdE7clS896BGJVrIIqpePWu4BhdTkjehq2mJ94V/N3g+dXKAbR+rjJJqPDiEtCrCXm
	4upDTBoKIXZTrijnJGaFd1eNS61/9ov4Zg947eeaGe5aETNBtyraSl/dL08VOJcRu3OOwMbIQIA
	3j039Iw9fFINmNuRmbNtm429PDnqm2L22F7lUwdIiECVvMB7XK9F3WjPbGCPwWamLuEiAyC3avG
	d2X2nS93yyMIFJRFLn6udIVIUdLYF9Kk0eqiRi76OJ94UivAazgn5Rpj7YT7RffWsiERCJTyKEm
	6zf1UqAiu9FMrMdTsOdtddSxpRwWdrSDvkBp4NWOeVNdOiU17hR0QjWs85NuOBdB04KH3XjXuYQ
	bYZys90xgiClslMAUONrLP0dnDZ0bXtNdGhr+fy98vonKrwX5ar4UIB0HxPJqyqFvmHo4WUX9CQ
	x1Ca7/JpnE3aE02VSfulTD0ok20cSYp+lZ6PCVTIgx6hucYw2uZVHMqIpiXWE=
X-Received: by 2002:a05:6a00:2a08:b0:847:7ece:3426 with SMTP id d2e1a72fcca58-84826da830amr1487737b3a.58.1783360524459;
        Mon, 06 Jul 2026 10:55:24 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b95c89sm4375268b3a.15.2026.07.06.10.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:55:23 -0700 (PDT)
Subject: [PATCH v6 4/4] mshv: Use hmm_range_fault_unlocked() for region faults
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 akpm@linux-foundation.org, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
 leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
 shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
 vbabka@kernel.org, skinsburskii@gmail.com, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, linux-hyperv@vger.kernel.org
Date: Mon, 06 Jul 2026 10:55:21 -0700
Message-ID: <178336052192.504354.1841795575701703197.stgit@skinsburskii>
In-Reply-To: <178336023903.504354.7500950448226027718.stgit@skinsburskii>
References: <178336023903.504354.7500950448226027718.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Convert mshv_region_hmm_fault_and_lock() to use
hmm_range_fault_unlocked() instead of taking mmap_read_lock() around
hmm_range_fault() directly.

This lets the HMM helper own the mmap read lock and allows the MSHV fault
path to handle mappings whose fault handlers may drop mmap_lock, including
userfaultfd-backed VMAs. The existing caller already retries on -EBUSY
after refreshing the mmu_interval_notifier sequence, so no control flow
change is needed beyond using the unlocked helper.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/hv/mshv_regions.c |   14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/hv/mshv_regions.c b/drivers/hv/mshv_regions.c
index 6d65e5b42152..04676f06c5c7 100644
--- a/drivers/hv/mshv_regions.c
+++ b/drivers/hv/mshv_regions.c
@@ -388,13 +388,11 @@ int mshv_region_get(struct mshv_mem_region *region)
  *
  * This function performs the following steps:
  * 1. Reads the notifier sequence for the HMM range.
- * 2. Acquires a read lock on the memory map.
- * 3. Handles HMM faults for the specified range.
- * 4. Releases the read lock on the memory map.
- * 5. If successful, locks the memory region mutex.
- * 6. Verifies if the notifier sequence has changed during the operation.
+ * 2. Handles HMM faults for the specified range.
+ * 3. If successful, locks the memory region mutex.
+ * 4. Verifies if the notifier sequence has changed during the operation.
  *    If it has, releases the mutex and returns -EBUSY to match with
- *    hmm_range_fault() return code for repeating.
+ *    hmm_range_fault_unlocked() so the caller retries the range fault.
  *
  * Return: 0 on success, a negative error code otherwise.
  */
@@ -404,9 +402,7 @@ static int mshv_region_hmm_fault_and_lock(struct mshv_mem_region *region,
 	int ret;
 
 	range->notifier_seq = mmu_interval_read_begin(range->notifier);
-	mmap_read_lock(region->mreg_mni.mm);
-	ret = hmm_range_fault(range);
-	mmap_read_unlock(region->mreg_mni.mm);
+	ret = hmm_range_fault_unlocked(range);
 	if (ret)
 		return ret;
 


