Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C3B41B8D3
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 20:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784060030; cv=none; b=FVbV7poQbnc3b0Ws6r9xGnYN/QVI9FKn7MtmOq0M2T//L66bSUZ679mLrte58os1yQeMqISx32WNMLm4ne2ILJ4ayD2uz+9sGoVUx6zVzzRULoBF3e8zNQ5MbZ6DyxJ/JfpBIZmyV1gCVPGrBIlexxMzPRr9TX9zhpfaIGO0Lt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784060030; c=relaxed/simple;
	bh=KZcIzmwaCHsF/oXSa3XD2VjZoWtXc+ZOgaxQjm2rE1U=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kIGSi77qjyQZ+J1AJDwHVTj8MgfUo1GNjYWG3I8WsVTdosbwbcPRpVlIYlz/vwI591rVtXMAZXOw+hu3OgLXlqWGWqZQgZK99pp91amLPjGMU4Zw66G210RYyM/0xj1mNIfvKSjzJlJgvk76Yg3wyObjUX9PQ5od8CL1IHjHebc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moJRbPeZ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moJRbPeZ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc73e322dbso56087175ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 13:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784060028; x=1784664828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d214MLGyf83e1Jqi9SjyzgCBFipAoJ9SSnt0shamnDY=;
        b=moJRbPeZuuK1Zw0TeuRKOD3VC8HH+vbDw+XXRp8EIO8IAmiEie6jLlw2Il59iQp8RF
         DI8Cl2cFdiAbpqZmxa1COwfJBrwoyHuoA58QmPU88atgYnNjGzzYc2MjKQU8J51sYnOE
         T+3vAA7ZXoyqATGjwydpsKsp3u+TW5zbkUw6UG2QEdx8I83RoeLjIzyyFKY/4zsC3VtT
         VOXHa8woFd8+2vJPda/Vkr3y9LPlgfr1EUJQgBlaSJtFuly2vr5nYvIMqrFMa7yeANFT
         1cVr3tNV9UiTMU0W6rHNxokp7odK63/MbgUeljSlQBqn/thl8wx0zCoriz7iTJNtNK7m
         GcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784060028; x=1784664828;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d214MLGyf83e1Jqi9SjyzgCBFipAoJ9SSnt0shamnDY=;
        b=roE/tdqL+2mzJj243qXYrPuHGZDcm3iZX7sVdrT551nLKZaCwE/Z575SkdTI0NIj81
         n2pezHoIsOcSR5WwQnl3M2M5Pf2FccPM5b0bSdDZii+Z2/Yh9f6X6dNYUkBEQqzzvWv+
         oh/rYdT1gvKKs+y1X5+ySMwAXfcMHhPCJ/hlldDfEbHH8mWKp+Q672yUOZOB1nyWLO2d
         /Nl+OyutGEO+4XPe1Eq1E2xayUY3BFE+5D+lMHvXuigkZx9bQ8YLLzuaYdzRpwpWoS9G
         nu8H3yxUaeu2emtfi2smqkdWur1vS3auOC8P4lNvYhfr9RSY5Xk+5hbYz56UZ3LsVtRc
         NKkw==
X-Forwarded-Encrypted: i=1; AHgh+RpbJyU33LVMoCwa2Ow5VLEjagA86GqsRN2EeelnAYddH7W02cvA/9iaBc9o+ZvCU0ymK/KpHs+t43Mp9SfY+3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLjtmcOXnAFIHlhxnp0R9c0tHXyO15LW6bA5AQDq7Z6N0tBUJx
	CUMT3D2nwihTr3LninV7LgDYJwSD20T98AfouIacMEuyupcYkxAR/cPXFzi4RQHw
X-Gm-Gg: AfdE7cnQJ8Xo1umS2VvR2QclFdUMtQJqRpkckVB4BnF0Ha41QpH5VHRlMMYIr/c4+kw
	gJGoERDV8HyX512tjOsgOp1CZ7IFTzGQOAoaEgu3Srf4jrjy62Nsz2x28KPuSXpSsrT4q7ON7yi
	tpcM7z6JbHvYOWE89uDKtsRFnG2X2qYiKVR0iVUE56uVjHy8Z8kKrBmh23ILlQO7MJfLcKJKz24
	e0VI55jCrVrXVfB40qFzwFFFMJxFRCTYEDMbz3mJYuPoiQ+KJ4ERovPAZNmdJ9Nap0mKbYVRVUZ
	TwClST7WyUb8a/RnEtB4zcs4el/rtyFVaDajxKJJwXBTNK20woPekHbQsbpJfAKCO1brvBLk4ue
	al81OY/Dq068nrSJCA41HPXLIZA9NpTDnyxblUaVVZ0KhcbUrCeI70MbrHEdzhDJji3QqbK3hZL
	Vv+gmxHCFLjM5ktHRq+VWY0MQC3nHGMT3njSCOrmZ+IvfbmbZms316XfOq8Yg=
X-Received: by 2002:a17:902:d591:b0:2ca:c68:c554 with SMTP id d9443c01a7336-2ce9f15d1f6mr140607525ad.38.1784060028032;
        Tue, 14 Jul 2026 13:13:48 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d45csm120844995ad.62.2026.07.14.13.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:13:47 -0700 (PDT)
Subject: [PATCH 3/4] fixup! accel/amdxdna: use
 hmm_range_fault_unlocked_timeout() for range population
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
Date: Tue, 14 Jul 2026 13:13:46 -0700
Message-ID: <178406002613.1082778.11295976907808029605.stgit@skinsburskii>
In-Reply-To: <178405975214.1082778.5193079941156341151.stgit@skinsburskii>
References: <178405975214.1082778.5193079941156341151.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

nouveau_range_fault() now uses hmm_range_fault_unlocked_timeout() for
the HMM fault path. The timeout passed to that helper is meant to bound
HMM's internal mmu-notifier retry loop, not the whole nouveau retry loop
around mmu_interval_read_retry().

Pass the full relative HMM_RANGE_DEFAULT_TIMEOUT value to
hmm_range_fault_unlocked_timeout() on each attempt, and retry from the
nouveau-side mmu_interval_read_retry() check with a fresh HMM retry
budget. This lets HMM continue when it has made progress, while still
preserving a timeout for repeated notifier invalidation retries inside
one HMM fault attempt.

This also removes the open-coded absolute deadline and remaining-time
calculation from nouveau_range_fault().

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/accel/amdxdna/aie2_ctx.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 548ba4315554..21f2817751f9 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -1037,7 +1037,7 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 	bool found;
 	int ret;
 
-	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 again:
 	found = false;
 	down_write(&xdna->notifier_lock);
@@ -1062,13 +1062,9 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 		return -EFAULT;
 	}
 
-	ret = hmm_range_fault_unlocked_timeout(&mapp->range,
-			max_t(long, timeout - jiffies, 1));
-	if (ret) {
-		if (ret == -EBUSY)
-			ret = -ETIME;
+	ret = hmm_range_fault_unlocked_timeout(&mapp->range, timeout);
+	if (ret)
 		goto put_mm;
-	}
 
 	down_write(&xdna->notifier_lock);
 	if (mmu_interval_read_retry(&mapp->notifier, mapp->range.notifier_seq)) {
@@ -1086,7 +1082,7 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 put_mm:
 	amdxdna_umap_put(mapp);
 	mmput(mm);
-	return ret;
+	return ret == -EBUSY ? -ETIME : ret;
 }
 
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq)


