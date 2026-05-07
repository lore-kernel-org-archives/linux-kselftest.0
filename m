Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89DB24E4C6
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 07:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137572; cv=none; b=lhkeS/4YF3/DMYyEyrh9XtdpvBNfHSp/PcBuThPF0iflnT9AJU5fAmk94iEPzIJ0xDFGvZYAnyQi+iiP8dYzkt1yB2lJhjiicgvUesuOaTGDH5wqxGzQxxfiFKmCR4ZEH2Ot0OaOrxvTa9LqNaBqdoGfox9RvA7VrjRX9ngg0Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137572; c=relaxed/simple;
	bh=iSva+MRtXTCg/dBOqxHocreKEH5HxjlggZ+FzIndonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f70N91kQG0xmqf4RnYmt7D+J7wYWmXvt6eJlrKyncgXkkq+ymnR8gxw/hQk1NhNqvJZ2lheTcIpNLrpjiLlk+ejbBTSRAdHhow0K4V7qw3N/hvAFNdQnbL22TsZASbAQICL85Sc5kQDgcnkCvHXggy4k0pCqirRhtuCA0OT41/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ik6PFhb4; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ik6PFhb4"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c6e2355739dso175855a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 00:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778137570; x=1778742370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BO67I+tc6fpB9njFQMIo7PJhrH5oEFtHvkZxfrMXbW4=;
        b=ik6PFhb44z0ncgr7J6LqQ0vVQ3MvMTOeYC9Ma1wFtakWZ8lyCN4CElFj+uJQ8ycDy0
         TBXQWrzb85TjCwOSGXzcDpuIU3tGcnuVFfplc+UqwvsmVkJqfmOWCcen4ZwmX1TOIxr+
         3d7doXPYwlk7L2rCn9CgzlxqCWpFSAJymI1L62oOTOpXCNGjD9gps0HTFCVssdf3czvQ
         mNL8C7LkV2rp8bhG25aRiOjwkmRAQglTXlqVO5kEUerm3epfN7H9f3OQ00l5SERWUlEY
         htf8dCfhxlY33awhwRmimoHVaOPsxGYEG3tb3apqp6G3p7Twm5G6LartWWUZg3CASVjT
         uYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137570; x=1778742370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BO67I+tc6fpB9njFQMIo7PJhrH5oEFtHvkZxfrMXbW4=;
        b=PsHRI3guhezkeGJjnp2cWq7IyGR48m0xNtc+H3bevzXbJHv8stKmVyequ9AL22kuLk
         19T3789/nALQ9XogICRzmEAYsszjm4fy1P3Zi8GWnvuUDVc8YA7i9LoOnSNPcxPgtnJT
         KwEeSbq07gcny0VL7+6LoX2DN2ywi+sYDNdiB7pHGV/Q6Gy21j8ZZRZMnd5glbvOHAk5
         BbnaNEt/IoGFCaOrSZde+GvV3+UyoDW9AZBRRK9T68hQQ5uvBIsnLqoWVebi10N5r8AX
         TfsdpbQWBYRLKsbu3ehwQZZ1Oia2LDn8taC5D3tQSZ4L8g/8CA9NaZv7Dpdjx6LmumJi
         l7sA==
X-Forwarded-Encrypted: i=1; AFNElJ9T6hjqaB3aWUAr9Z8jzdRhNpBs3mJkGE2lqAL9AtYO5uGpf7G1q9aA+HTm7vM9q8pZhSp6ghPfz1GanMEXYMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNpHnQ7J/BuIl4LEkJxSDE5KVjWC+9vL9qMTDmqSDN4LHxWHGL
	UeO/RZzwiJsfzZNYgwZM+RdJSlgZGG+cjqJPcREsdAF5ODll4GsSBkVu
X-Gm-Gg: AeBDiev1Z0H7mOAlw3kPpSQ0RiQrDVvZcbCHSJoFLL33bMq2ETOU8XrNie8d8iHuyD6
	LbjSabtEY2biSbyyo5+CH4qPAnC0cf3gGChmY9qe8CmUPaxHqud4y6w2A4w8MIqbLb+/g+CVDd9
	XOrX6gX9zcI0Rqz5Msm7aRDNR9gxSIhl5HyVcYWJHaXdtcHe2lXn6PMyPo+flPvAFG+bfQfokaK
	XRjzjhi/JGoUeR3dMhCKu9od45c2xPNaJP4dJsd7AJqLfG3zaquRIInOhFVitZoeLrT71CU+Bzl
	OcdqieWTrbFAPSIkjO97i8HHkrTSRH+QQo+RFiRSt81mFNblpM0wjsx6qQ1xkAgLLtaqTP0u9hR
	2lpycy94+QyLslPzWZADJzowDquA9IDqZzZh11RcK1bs41ETtgyLccRwmkl8prl1QzOEoRmozdy
	y7l/2twKvtDGXd/enE2z+AFo9Fby/NV5YT00bb6Yeqs7j2H1UL363lJJPzDBqguff/Y/zd0g==
X-Received: by 2002:a05:6a21:33a7:b0:39b:edcd:d92f with SMTP id adf61e73a8af0-3aa5a9056dfmr7399916637.11.1778137570265;
        Thu, 07 May 2026 00:06:10 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c825379099bsm1200164a12.14.2026.05.07.00.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:06:09 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	shuah@kernel.org,
	zokeefe@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/2] mm/khugepaged: fix spurious -EINVAL from sub-PMD MADV_COLLAPSE range
Date: Thu,  7 May 2026 15:05:57 +0800
Message-ID: <20260507070558.3064142-2-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507070558.3064142-1-chenwandun@lixiang.com>
References: <20260507070558.3064142-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

madvise_collapse() computes the THP-aligned window:

  hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK  /* round up  */
  hend   =  end   &  HPAGE_PMD_MASK                    /* round down */

Previously this was done after kmalloc_obj(), so problem arose when
the range contained no complete PMD-aligned window (hstart >= hend).

When hstart > hend, (hend - hstart) wraps unsigned to a huge value, the
final comparison fails and -EINVAL is returned instead of 0.  Consider
two single-page calls on a 2 MiB-aligned address:

    /* hstart == hend == aligned  ->  0 == 0  ->  returns 0 */
    madvise(aligned, PAGE_SIZE, MADV_COLLAPSE);

    /* hstart = aligned + 2MiB, hend = aligned
     * (hend - hstart) wraps unsigned  ->  returns -EINVAL */
    madvise(aligned + PAGE_SIZE, PAGE_SIZE, MADV_COLLAPSE);

Both calls cover less than one THP and collapse nothing; both should
return 0.

In addition, kmalloc_obj(), mmgrab() and lru_add_drain_all() were all
called before discovering there was nothing to do, only for the code
to kfree() and return immediately after.

Fix both by computing hstart/hend after thp_vma_allowable_order() but
before kmalloc_obj(), and returning 0 early when hstart >= hend.

Fixes: 7d8faaf15545 ("mm/madvise: introduce MADV_COLLAPSE sync hugepage collapse")
Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
---
 mm/khugepaged.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index b8452dbdb043..92473d93e837 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2836,6 +2836,12 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	if (!thp_vma_allowable_order(vma, vma->vm_flags, TVA_FORCED_COLLAPSE, PMD_ORDER))
 		return -EINVAL;
 
+	hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK;
+	hend = end & HPAGE_PMD_MASK;
+
+	if (hstart >= hend)
+		return 0;
+
 	cc = kmalloc_obj(*cc);
 	if (!cc)
 		return -ENOMEM;
@@ -2845,9 +2851,6 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	mmgrab(mm);
 	lru_add_drain_all();
 
-	hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK;
-	hend = end & HPAGE_PMD_MASK;
-
 	for (addr = hstart; addr < hend; addr += HPAGE_PMD_SIZE) {
 		enum scan_result result = SCAN_FAIL;
 
-- 
2.43.0

