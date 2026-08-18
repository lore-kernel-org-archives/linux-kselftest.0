Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE54C305692
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 03:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787024581; cv=none; b=SL3hp2AKpjtDb0b2ik75KdG7gpTDCwG9igAFXZB4PlsXFlfSRAloyrKC/2stejSQInK7NClIAxYsrh1cz56ZsdfpO/4GSehPbmkHG8L1I6Pfwd3zv+87loThCS8OG0yp/LyFrxGO1UsMJWDQ+FBPdCEtaM7Aini3KQmMPPWun7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787024581; c=relaxed/simple;
	bh=dRDoeNY2WfplCeM6Yc0GSWDWLkBmqI8DxH4apG0CyCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M/b1DlbQpSH4pjVx/H3oMT9RBOIXnigMCs3cNvfqdAgWd5PQbTkICzJTOoQ+EYyqWXBDNRJ9E41uBqFJjnZV643kTyXo7mXwlMZNhO6mpiOCIwltlLHd/a+VJgYFKisDZCyjROaBy2sCm1f9ChEe2VYdlmj714JaljYZAyVSCD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHk1GvpK; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHk1GvpK"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e88b60121so3163929a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 20:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787024580; x=1787629380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dRDoeNY2WfplCeM6Yc0GSWDWLkBmqI8DxH4apG0CyCA=;
        b=RHk1GvpKptXQHkTagYAVVoqhFkYctcRFQa8vaLgLtIgQh73pMf1m5QAQrJE85Kztig
         4qHwJSpdgXWmoJK5v03k5TfM46kRO4oPCmRgQYXx+7BfhFz+1ivdmYU3oB3qK1lvrK5L
         VZDQWDRqqSeMhrbRHFuv9XAGVzBKrwjTXkc1FqeOdUAnVfFQwTz4QRMuejL9q4hs9U/y
         njdGTfflSbV3WFgOrHc0OOA79YMk3FHtdq+swFhHd/8SUuoSC4uf9qbBUzKcTLE2Txd7
         MKWQ1VYMXGOdoGZOEIfMB0lnGLwYDF4KloDXxu2X7gFCee5TKTzV8zTsUhQkg5mAAAD2
         bcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787024580; x=1787629380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dRDoeNY2WfplCeM6Yc0GSWDWLkBmqI8DxH4apG0CyCA=;
        b=PMcWds4wJqMNkSB5jrtBrRK1H9o384R9sLM9EqvL1oxD0DIMDAEi24r/31nQqfYkvf
         6ByPOGOFJzLYfzMHBV2sPXk3ipuqPrqmY7bx1zddCjHRHgAXzuquJP2164ASV3UOE50J
         0DK2Q0bNeRmgFzNM3GMt2ecm0n84/Ru8WZdtF3Bke8W2nBsoHP6meRxxfdCsWfmpdSEW
         NswGGbH4l9IRyfOux3na79x6mzTRbfFJLI1P93XuR2JWT8jbDperJ2/uspdZbTDCRlEk
         3FBNpaqWg0K38d0zn/3aIU14Q2SC1UtXoF0klSI2rGZ3dLLJcl3a85AsU2cxM0fmWgTt
         EMMg==
X-Forwarded-Encrypted: i=1; AHgh+Rogm0iWjyp9Gf3piJ4+w0KM4xrXuMAk2JUNRIpPHwTqkXNuMjBHioWRIcmrxZhHdwkXyPuXefVELnUjc2+i8go=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXfTNzwgaKtjMyDBM769vTLfHf4JjxHLjOkRBi1xPvHBGRACWt
	bySSMLRbi0mSOsMZeMkJegjHlNqxYLy713FehSUePqtcH6pNQyOon39+
X-Gm-Gg: AR+sD13uz7hMRG3+RTWqmHCkx0F9gdyA6BzkWlL2sFejJ3COyuo0Mf2F1TRn0QUO0EH
	zAwgvdkWpPOvf+zCO+5TS+UUnHop/NDc7m1ZQeDefxAb9PV01AkFS8nyR3i++XJD7/ypDJenVtf
	pdWawIPzb8/+aC1eP3Cv0hH45cggKvnG+GoJ37gJ/Xt9Hme27MchU3og7vTz+ASzDhThXidWD39
	xFw2D0E8fRjJ58hjfNPOroYA2HxxwvloNQC403srSRowls3N6rJvmpIEOwxYXEMnMcJ9BjexN+K
	DmzYsNKsOeTc6ZVYhscenASADR5X5go4sJM0DmOqPx8pbdjyAvrK2a98gtzP3L1yCC68DQJ0bXF
	IfjO3z5x3S27la5lZQohcyp53823Qi0hv4Hs2LNKsYCAk1+2Mus7VfVsh6kY3tisApLezUkjQBw
	Om7Nbi5jnFd8OhxjJuKsFH0EdWwWLM/uwuOH/bcZ7heVb8t0nyaB1QxoYCVVjD61FXKiVngn44
X-Received: by 2002:a17:90a:e18d:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-3933b764d23mr33386383a91.8.1787024579941;
        Mon, 17 Aug 2026 20:42:59 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3b3b91sm4418656a91.13.2026.08.17.20.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:42:59 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/secretmem: prevent uncharged mremap expansion after fork
Date: Tue, 18 Aug 2026 12:42:12 +0900
Message-ID: <20260818034212.1761451-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260817154356.552ccde5d279f6e0a9ef0ff2@linux-foundation.org>
References: <20260813225328.2010303-1-4ncienth@gmail.com> <20260817154356.552ccde5d279f6e0a9ef0ff2@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review.

Yes, this patch was developed with AI assistance. I should have included the
required Assisted-by trailer, and I apologize for the omission.

The related issue is pertinent. Lorenzo's follow-up shows that the underlying
problem is broader than the fork/mremap path: secretmem accounting follows the
VMA lifetime, while the folios remain unevictable until inode eviction. My
VM_DONTEXPAND approach only blocks one path and is not an appropriate fix.

Please drop this patch. I will test Lorenzo's follow-up patch and report the
results on that thread.

Thanks,
Daehyeon
