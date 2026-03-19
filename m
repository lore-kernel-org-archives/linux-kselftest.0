Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5558405AA3
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 23:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773963057; cv=none; b=NRpOf1zWKif7vt/5/esKqYMhIJKWKGehMhZjr4ofa1vlauY4QrBH1snEac3DgAnmWP1AtUm9c3ZbbJyNsJn2Pdui8ZimLHRH8eAqUVOwRceoVvgi5wbw6gCK5fpSAuedy/H6Ab5X6cdZCLJD4a8XpP5mosVEKvQM0myEsLQ/DD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773963057; c=relaxed/simple;
	bh=wOqfNAc1NvD9OIIK2IFuT9hSXcRKmOriHgtHRjPE5Bg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t69UGEAbA3iXT+li/hwIv91B3886ppESaGSxYZEHxKSUcWhUDRaf4J0PrEPWpGyTUDOnoKZlfCZ6t8/DUIGHqyRGn0oZbjIjoLgL4N7CJhc0c8rWaEEaLax3B7YQpOIRUjn5LxyGs4/WXonQ9Cmso2ba1ir+oTIGEC68zk9RnYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HGaV+NDi; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HGaV+NDi"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3568090851aso1108419a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 16:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773963056; x=1774567856; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sCHbx83iK3r3PTq425PBvHDhuCzYUl5sN2W6Ton0yI0=;
        b=HGaV+NDiMEwkOvFzpApfF2e5KIRVd0goCxK0Vx35cSeGT4nTdQxZDfuD+EonWkY5xl
         H6sjXYoeqhZtC5aOe4qNdluoVvTV94G2nOK7uDVTzUa/EzbQTvA3DPyS9uwt/SJWNZxD
         01++syQG2Jb9rOkselcyNyfm+cdlcSOtJiW3qpzu4bBsRCQ7YyQYJiaVoRwiJPRFRFu4
         9b8eR10pOV+FdQOHr/2UI8eChLDSsIAIE7cKqLUahZVjtTS6ZH2/bEqp1UfidqWMNRPy
         deXTlBic0mkjlrHzxSuabHLHjDRCmh/p9xAUqiagBUXbQMsJ/nWKVMpFXmUWO1IchJDR
         kQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773963056; x=1774567856;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sCHbx83iK3r3PTq425PBvHDhuCzYUl5sN2W6Ton0yI0=;
        b=XIUBuo2+qQ9YajUQlTOe7IePgKCNdoTXrsyRzcBD09ICR4LTt0JjFldbwtopK8cEWi
         IzFxh5TFoBsFm7J9DPPDSwo99BdHYct6i4F3rqUm+hCG3cDeq7Ro5ssSTvNSBuxHMVnj
         g2VDEBLCez+CN2ffuOhnFdZLdfVtXc8SETEYKS16T2+OHR3jZcS0LQgiKKckJwMyWnJd
         e1zhYqjhFg0uefzy01NR/JXJyoCJO0bDFJNve5MOFJqbO7NckNPKJdR8KPn4XVHULSAg
         28FkI0jtfVwkkut8foEW5t+nyPfoBrRNHdOwiN8GnLvYMrtsNlNtNIHPEDPqCNsSuEqz
         nAZw==
X-Forwarded-Encrypted: i=1; AJvYcCVwqNFFIPkQ9BTqZBz0ckdEuyUXc+GzLyVtgz29hqboLEBtH8CgZT1gfCaUXMrS6mVPrjKxY6m6LnMGbgzzIiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ9QEYQjksCWf/e7TdndqscNlOK8RQad4tUd5Q5NObgZkjDonM
	Y3oXhaL2ewnvb6xwviO8tjo5MhC9PVX9yVQ+H7Lw9GmkdL+DnvdLtsRgqZU8bFEdx3Ra+89b9sT
	w7ZSlSQ==
X-Received: from pjvi6.prod.google.com ([2002:a17:90a:dc06:b0:35b:9c1e:a503])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3e44:b0:359:9158:7459
 with SMTP id 98e67ed59e1d1-35bd297b148mr776486a91.0.1773963056138; Thu, 19
 Mar 2026 16:30:56 -0700 (PDT)
Date: Thu, 19 Mar 2026 23:30:28 +0000
In-Reply-To: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-0-92c596402a7a@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-0-92c596402a7a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773963053; l=1352;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=wOqfNAc1NvD9OIIK2IFuT9hSXcRKmOriHgtHRjPE5Bg=; b=YPNL8jxwq4kWmS/RsAYB4N4wCDzvDeNXcDvt36H56rqlisScdhaT3wHvfkS9+Dbew0Z0kkT6f
 pQOjgJ05T0TC8Im8YK9ko5dIngtrrkkjKMNkE/VDDjMrdxjo70z5Djw
X-Mailer: b4 0.14.3
Message-ID: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-1-92c596402a7a@google.com>
Subject: [PATCH RFC v2 1/7] mm: memory_failure: Clarify the MF_DELAYED definition
From: Lisa Wang <wyihan@google.com>
To: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: rientjes@google.com, seanjc@google.com, ackerleytng@google.com, 
	vannapurve@google.com, michael.roth@amd.com, jiaqiyan@google.com, 
	tabba@google.com, dave.hansen@linux.intel.com, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

This patch clarifies the definition of MF_DELAYED to represent cases
where a folio's removal is initiated but not immediately completed
(e.g., due to remaining metadata references).

Signed-off-by: Lisa Wang <wyihan@google.com>
---
 mm/memory-failure.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index ee42d4361309..4f143334d5a1 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -862,9 +862,10 @@ static int kill_accessing_process(struct task_struct *p, unsigned long pfn,
  * by the m-f() handler immediately.
  *
  * MF_DELAYED - The m-f() handler marks the page as PG_hwpoisoned'ed.
- * The page is unmapped, and is removed from the LRU or file mapping.
- * An attempt to access the page again will trigger page fault and the
- * PF handler will kill the process.
+ * It means the page was partially isolated (e.g. removed from file mapping
+ * or the LRU) but full cleanup is deferred (e.g. the metadata for the
+ * memory, as in struct page/folio, is still referenced). Any further
+ * access to the page will result in the process being killed.
  *
  * MF_RECOVERED - The m-f() handler marks the page as PG_hwpoisoned'ed.
  * The page has been completely isolated, that is, unmapped, taken out of

-- 
2.53.0.959.g497ff81fa9-goog

