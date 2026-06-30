Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF09134404E
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832886; cv=none; b=FHe95R8g3HdbSMiPGYe99h1dvsy0DD2bLVqsHijvknxEJWfKsBGRLiNm47SVIlTnc0ITSXq7GqelTHnDCm7ldcx2jOL+13nBsOQdfLet3fwz1EC3veavFFypSKgX0yiIVzxxxSJe5ES38Q6gMiPB04v/o0Tkl7fJvfH4u4I1dIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832886; c=relaxed/simple;
	bh=CMTLgB752m4f1oDZT6YVFJZSXI6YOCgYUjx6JnXzmQY=;
	h=Subject:From:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=fImt3Tt7Ug1HnG64f7T6shZrwq9Xbhj3lAybjLvm8FGD6pPFdVXUWqBpYAzdRnwq69fxCKE3n0wxaqQAtddbDnARdfccs30x0msI9tba+P8k3nahKjDXWjYq6yNF1g7uqrhURgFBdd13d78Lt+A0PAQLFSW3cydLMrogpQkAXy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLcd2BKU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLcd2BKU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c9dbd00f1dso16998025ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 08:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782832884; x=1783437684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :cc:to:from:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=XL7r3nX+4tuUw824gjUa7PzQu/yc0CIJbCIJiAlasd4=;
        b=LLcd2BKU5HkqISA7GpNv2KS/PLSearmPg+7hAVIdUq9uCONcgMUfnTgCpS4epEzElW
         4/y6tDMAambHL0j34w1nzEWZT+XfISWZpnZ6Q1D9g2XCD/JJIV1R5bg60HPPwJT5JcOI
         bmN7b8fisk7BxLC/tagGqHAfSp2z+sPJ8Q8kCRjjho3ZR2s3TYwOiENQoqBWdo9CBEMt
         l4OH/Z4JNG+yjHnagc0RfmLZJEBxesrg/8D7HQjAJ1GPtOaupnsJQCA00npNaFYqSNsq
         eONEGZ79cYxSh9R5iieOmG5+IhpkTroVOAmvoF6CTHkwnFLydoGINEhcyupbX1J3/Hne
         bwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782832884; x=1783437684;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :cc:to:from:subject:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XL7r3nX+4tuUw824gjUa7PzQu/yc0CIJbCIJiAlasd4=;
        b=Hg5wl8/f2/pWWJSLC6KKsltNbgLFnEyGXVH97Eu5OfavVYoA4iCagsGqBuDBPkOGUe
         FXOLW+hJxaatY+qk6i4nHi4QZt1cqxbQrnXAt2y8HDTeNnpjtTT+HWlxXFABx/LrNRDW
         j7MGxmasAs5yfAmG9JjEGqUzNXnSQIlstE0JU1IaEYTZNW87O08VxW7WMzPAD89bRees
         JnyonTB3Q8nijraYcpyriJd0VcEYI7NqgmYFn4QqKvcNB0cBFYF6GGEjf2ktuKNjwn7G
         a9ECe5G0xbjNYMIoQfnHoJo0uldfUPV0Mnwb0KZpYnixOiHjI6wEv3o9N4w2oTadicZv
         VHcg==
X-Forwarded-Encrypted: i=1; AHgh+RpVdv1XNPe5Jx8xnOaNK5rXHV0FX9DUvWjjZWu13fXzBMGf/SIrt8FeT+Ql3sGiwcI+v8UnGvcusolZuZCXzqs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym9AiqSt+e/AGiicSXFs6I+3g4kKk/zEEKAJk8sAjTyfDJrY4s
	osO8bC25ZNRr1uyxDkt1UaOl9uRhYRVGqJ06LQUenbSgyamVQzNWK+Lm
X-Gm-Gg: AfdE7clthiIvRRY8qV+6WKUG1ULVGVObUpu1KDKhxqxTCKEt4pjsEkM6KNsaTRu/pUP
	EdYd2JK5Owaqa63gTqIVBOia9f82tl+HoXNvdJkSSdhUIQ+Cifv4944wU2b4NLCPKkLTTdQ/WhC
	vYieXuQbqr8qCiAcKkdFCVlFiw1p+HcBlPoIHImeoyAfyDE7BZD5k02wTGIXfp/I/BV+hRGttXQ
	pg4WOhTj9XOVFJXUigcUxJh9CouwwRycrOpxnLBmkEGvvTaftWPzH4QjWjdeH42JSwiFVxxSgu+
	IEj/rjgbp4BS6v6A9bmVd6sQdoZBRqY8FVkqlEcNiPdRBMe7VbDkT/vnkPfMArd/HK5EAFy36Vt
	8eGdZOTKPx4+KSYl6+6esU/Ix9hLJ5dtr1D2h4roALlldebuZc8S+BFfXjEqeFUdaZ7UTIzxZvA
	N2vIBp9nRJh1azSrVhCZrYKkuvL3XBWe0LtXJ0RaAsaboei8/kgNQ5SjDjdfI=
X-Received: by 2002:a17:903:9cc:b0:2c9:c083:cd49 with SMTP id d9443c01a7336-2ca5a581aaamr8392545ad.14.1782832884074;
        Tue, 30 Jun 2026 08:21:24 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c930e8sm16720955ad.37.2026.06.30.08.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:21:23 -0700 (PDT)
Subject: [PATCH v4 0/3] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 akpm@linux-foundation.org, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
 leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
 shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
 vbabka@kernel.org, skinsburskii@gmail.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
Date: Tue, 30 Jun 2026 08:21:21 -0700
Message-ID: <178283277041.183052.6873574850714079228.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This series extends the HMM framework to support userfaultfd-backed memory
by allowing the mmap read lock to be dropped during hmm_range_fault().

Some page fault handlers — most notably userfaultfd — require the mmap lock
to be released so that userspace can resolve the fault. The current HMM
interface never sets FAULT_FLAG_ALLOW_RETRY, making it impossible to fault
in pages from userfaultfd-registered regions.

This series follows the established int *locked pattern from
get_user_pages_remote() in mm/gup.c. A new entry point,
hmm_range_fault_unlockable(), accepts an int *locked parameter. When the
mmap lock is dropped during fault resolution (VM_FAULT_RETRY or
VM_FAULT_COMPLETED), the function returns 0 with *locked = 0, signalling
the caller to restart its walk. The existing hmm_range_fault() is
refactored into a thin wrapper that passes NULL, preserving current
behavior for all existing callers.

Faulting hugetlb pages on the unlockable path is not supported because
walk_hugetlb_range() unconditionally holds and releases
hugetlb_vma_lock_read across the callback; if the mmap lock is dropped
inside the callback, the VMA may be freed before the walk framework's
unlock. Hugetlb pages already present in page tables are handled normally.
Possible approaches to lift this limitation are documented in
Documentation/mm/hmm.rst.

Changes in v4:
 - Rebased on 7.2-rc1

Changes in v3:
 - Return -EFAULT from dmirror_fault_unlockable() when the mirrored mm can
   no longer be pinned.
 - Add an eventfd stop signal for the userfaultfd handler thread to avoid
   waiting for the poll timeout on successful test completion.


Changes in v2:

 - Split into a preparatory refactor (new patch 1) that moves
   handle_mm_fault() out of the walk callbacks, plus a smaller feature
   patch on top.  Suggested by David Hildenbrand.
 - Hugetlb regions are now supported on the unlockable path; the v1
   -EFAULT short-circuit and the hugetlb_vma_lock_read drop/retake
   dance are gone.
 - Distinct internal sentinels for "needs fault" (HMM_FAULT_PENDING)
   and "lock dropped" (HMM_FAULT_UNLOCKED).
 - Outer loop now re-walks after a successful internal fault so the
   faulted pfns end up in range->hmm_pfns.
 - Kernel-doc on hmm_range_fault_unlockable() and the
   Documentation/mm/hmm.rst example match the implementation.
 - Dropped the mshv driver conversion (v1 patch 2); will post
   separately.
 - Selftest converted to drive the path through test_hmm with a
   userfaultfd handler (new HMM_DMIRROR_READ_UNLOCKABLE ioctl).


---

Stanislav Kinsburskii (3):
      mm/hmm: move page fault handling out of walk callbacks
      mm/hmm: add hmm_range_fault_unlockable() for mmap lock-drop support
      selftests/mm: add userfaultfd test for HMM unlockable path


 Documentation/mm/hmm.rst               |   62 +++++++++++
 include/linux/hmm.h                    |    1 
 lib/test_hmm.c                         |  122 +++++++++++++++++++++
 lib/test_hmm_uapi.h                    |    1 
 mm/hmm.c                               |  187 ++++++++++++++++++++++++--------
 tools/testing/selftests/mm/hmm-tests.c |  149 +++++++++++++++++++++++++
 6 files changed, 478 insertions(+), 44 deletions(-)

