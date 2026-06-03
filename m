Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59103D25A6
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 15:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501458; cv=none; b=lSIfi8qA8lpMBZHNsFE+tcL3QRF8sXzudsHcdlWRbacarH1khaBMM9TfDXLBQihvAIYzfeOjp4EEiSWYDWO8VITMbt4ytd0Yj+sgWRKo0yq7tPvLZSgqhYNUmksP7qqMVwbM4qObO/TdvATbGmTV+G7unHGZPYWUfrysybxJXBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501458; c=relaxed/simple;
	bh=IMbuGTukyT8IG40YTi+316UrswHf2CnDFbSS3RnRmnE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bQhgLiMFgqgk5/a0XsorZjL+4FKqYI4xpE7IM+ojShnmXiquML5UNSeAp7LiItN1t4UoAOhG2oEtUHpWApGwvSYrjx2QR6NW6KNTvUBjMnuP5Z3Duo0YG02gZwp3UyapTSINztE8uOe7gFZt/rxs0uX9pEAe2Luone5tfYO1i8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=DdNbKUsI; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="DdNbKUsI"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9157b895c57so153130485a.3
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 08:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780501456; x=1781106256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVlCXZe8SHDSOJUkKVBaYBikNvs5G4Pkl6SfmcOaAr0=;
        b=DdNbKUsIU5cZRabA2KkMfpHsJx9+gbaLDAO2hsFZTQLwT+dPPU50h1GalJSF0s6SDJ
         vgsUSLpdZ6P62da6JT+InKSSvkZzRZ4qQiDXuEKqazYyR63P0GV/ju7Ghz08/QnOUgn4
         bLlPGJ6S2ptv4MvgK7ZMC9aSA2aIJ9quqSZtEce1SupHyqHVdYRRQ/PrX5uCavtGKAZw
         uWHU53+LUXvUqntaw/aMI6AIptwGBZn4cIz7LLJmminRZWNp09HWlJyNbEPExt4opphg
         64OQOoCwQ4I+YN4yhoMiu8wG5AqAFUL45z0htUs5iLXW37xRBLHMn4RHSSpGPdcLtk7i
         aPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501456; x=1781106256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVlCXZe8SHDSOJUkKVBaYBikNvs5G4Pkl6SfmcOaAr0=;
        b=HzvJq/JjXSyKj3W/t1r7G5vDHzx2gnGw71gISTM8Jl1ycf1zwA8B2vg08K8iCtolUF
         jf0WQtdGoEu3To+2a+7d/U9a1IpA+zxazz6AQZ3ZpeqxcTsf1R2b3BZMODk3N8idjRrR
         62aMTkT9yVopwgeLYSur1VNky+YkXdpJflRUTygFKYP8ERUc7/KwwWSb16jJuyVEcfFn
         RzzRK6U1VtiCcAC0QxTXxqUAzetMeFPtxQMeO4Gu5tqMP3/DJtXvfyQO7FYUEieGK3fg
         UzQGPI4zTYBWPyBav99lG3wyaeZ/LG5WhsKH4WPgM7FW45fSO71/gDBFUK8C1MDXe3hm
         +CLw==
X-Gm-Message-State: AOJu0YznSW572S7XQKHKSxptJi+vS4mOTPrgRRSJGO6d8YkPiJIPTO1T
	4JFZMCmlyte4YUZNRWOxy8ptY0gq4Lr//1d5zC+xgDlXcM1ZC7jcsoSsSO8QIz5uKsS9E2j3zhm
	zcpsD
X-Gm-Gg: Acq92OFaeKQnSzZPE1tV5YZCk/F+/5lXYSmmumZasuUbHn4YbWBnwt7+FHKuZNEVfCf
	nOXbeutmegjqH4mFRwegn5Qenria+eAXhkUFKY1oxd5cdFTe0m/uc1LIhyyMOIw1srJPrPex4Ih
	DDo/PTagHoXi6GX0LMmari5uhBAT9cI+5EhfFksB7zyhrWHdJGmFI+md/ZiYcNfWidm0iETjVES
	kJzgLTLtd22RqMrIAFqmfcNXfAgr+3CjBG05YTGlQzrxYRC7O6WRm2i+SnvBkPJFfqhMlkEdWrV
	4uJVAyY7gCFf++femX1jl+VMMF5phLn4py1wtb/bvNbK5i1iIe1MIJq4FhBsOH8NzJZZ6MYVQPt
	QrZQVmvZGQpI2ck+1ByxaLoWBLdmcGz7/MN49qz2W1jIjN8DeIGyYw2hShCkrwcHRhCvnmImOJe
	sdjuy+Utyu7G7laDSBPN1XBN4qYIWqq1wbJASEBKNXu9Uz08PL/p32QoZISe0Xaw==
X-Received: by 2002:a05:620a:2890:b0:915:6cab:768e with SMTP id af79cd13be357-9158a849a62mr658252485a.60.1780501455872;
        Wed, 03 Jun 2026 08:44:15 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a40d566sm266574585a.47.2026.06.03.08.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:44:15 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v7 01/13] liveupdate: change file_set->count type to u64 for type safety
Date: Wed,  3 Jun 2026 15:43:50 +0000
Message-ID: <20260603154402.468928-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603154402.468928-1-pasha.tatashin@soleen.com>
References: <20260603154402.468928-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This improves type safety and aligns the in-memory file_set->count with
the serialized count type. It avoids potential truncation or sign
conversion mismatch issues.

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index dd53d4a7277e..ae58206f14ac 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -52,7 +52,7 @@ static inline int luo_ucmd_respond(struct luo_ucmd *ucmd,
 struct luo_file_set {
 	struct list_head files_list;
 	struct luo_file_ser *files;
-	long count;
+	u64 count;
 };
 
 /**
-- 
2.53.0

