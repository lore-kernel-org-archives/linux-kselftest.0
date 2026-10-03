Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5A7332EBC
	for <linux-kselftest@vger.kernel.org>; Sat,  3 Oct 2026 10:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023443; cv=none; b=MWiu9JxMySe1xgxCj0DbsDQ0iF1QjSNQoYYWF2YD3FCmXcp9J/rvexsEQZYOsQSGZ2uMpXx2SlVTByeWv6KqXLQo8hKgbTU/IzO5HG0rnvGPOrbsbLC2won2KqItZtfA8v7xsboinqBuAm1gllpnOZDZ5ykl2j/AMK0nwlYJfoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023443; c=relaxed/simple;
	bh=kUSPUwbix68rAzascc7JVGxipvu4edBvCRCwo/tJwIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MZBAvGcybvq5WILyu3cvBJkpZ4/ZfgtDFpwuk7dGJJNtFT277sTGlzq9buyAvL2nawjEEuuMyy5du5U1utCe7NYh+0PZeGn71RUJgkPK8MKpeRrbERXj5+lJPWIo+sb+kJi73irieoK4AoKckyZMlMtNAifShX6lv8UVCUKy8ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4hTKU5/; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4hTKU5/"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39d654f02baso103690a91.3
        for <linux-kselftest@vger.kernel.org>; Sat, 03 Oct 2026 03:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791023435; x=1791628235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wPZq7gjHJpcJmgR7EaOFKtvjMOo9Jsmtk8qeZDcxeRE=;
        b=N4hTKU5/5E6OI45gvGrHucztR9ZOL5bDnHYQcwchRPFTkS3XxjDAsUK0PYZHisCmzz
         9ixQaEbDRullHcW499wD5grR08/yeyt8IsY8thDrDVBCyQQl1mplWDPGlQZEJ8j4XHVD
         w5wayrzbuG+W5k5U3ELymrhob5XUPPjsD9XuyTaloUbjUodpfexY+J808xj7S6dbVgEU
         N/arPyFuQqnJKqw6CDi6saRHyHVC/ugjAm5fYrn/80QPsH4k6+kOZBFeg7HST4IcyNQj
         23EXZirGCWap7QQJKsJ2AYT/riSuIUfUAtu2QQYLK04PDjXT+CeY5JcDz0xX1cilHBZP
         p2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791023435; x=1791628235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPZq7gjHJpcJmgR7EaOFKtvjMOo9Jsmtk8qeZDcxeRE=;
        b=MMzB3QZ2R9GKPZoreLvfskgWCSDYHNFtmwEuCxfde93b5MKD/XuL10itJ/dj6awBjC
         zT8hsDuPkcMdJMH3NRCNm0cR6AxTKPNS9b8R9oFjhrRptITFePEVI7eR89JJ71GVTVD5
         6Uxr41C3xgqFtNzeDXVYUR6e5oA+NVIHKPf0FwEkSRnIKxBl5cv2rtHOwqmPR4gmDjzU
         iH/+1rYPfzFaY16zLj8stMB6rFSjtlkMPfpyKcas+osIdYtG6lR4p5XzLEEgIY8KEV32
         +QjZQUErRdxAgD2EdTeS8STALeoqjZNbGm9qc/E+WWSN2oX82TJhjgXDOUzYsZI4VLnR
         wFSw==
X-Forwarded-Encrypted: i=1; AKwUvBy2/IEFwcye0GgCgQzhQZINY/N4dJptoSv9XjvQNueYnG5MDAQzmVE8A82nom738jYstGVFM5T66ncXIeHDHEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeDl+y5YB/ncOHfKhb0ictr4nvKkZl9IRWd6d59fijSey9KfPH
	+DOYINDVjy7O3mdzVEvjOhHSnR0kD46PsQnDN0Al9+YGfOcASQYTXhY=
X-Gm-Gg: AYBFou2JrfXEmlxbJo6mJ4k1vlz87gHI/PH0Ea/oCNPd5ZWxdeYVrGAsECecT55XUem
	wNtVYILst1PQ3Ytzfsf5mkpV1Xzj1e1ka2AC7rktyjztAKkalHEUNdxydKWRrmgTbG5oy+zhThE
	U7ynuTbp+0pW7CVyn2EAwZszInbxDOiSRqc76NlFYhYEXOV9dcO0WMq8Hk59DrhRTx7K3d8d/Xb
	3PpcuB7mRU4RHvk2Yck84YwWo5sIQjKLY5K+elaHj+kGGroPeHdxP8r0Mj1a6GeshobnnM/bO6T
	fhPpDr5oL2IL171fvCiUMVxz0JbPBTJFO3C+49BC2jIeyPMkulwS9FnRpNRSDPKbqev5ApOjGHB
	qButXEBrpy0u9R8f2xuSND46lBJ+lEN4bM8S7ghkEamxnpupYJXv/nApKSAYc6+9Myui5kPoAeB
	4f0urstU1C5YH1+V23BbmyhLSebv92A1uOBPes6lR5I7lRYfu56lUbATCFIR9KFVHPHgr/r5oEw
	cgnSXnzGCAe0+iUPZAhNAhw6w==
X-Received: by 2002:a17:90a:c105:b0:3a7:aa1c:476b with SMTP id 98e67ed59e1d1-3a7aa1c5b5cmr149517a91.31.1791023435221;
        Sat, 03 Oct 2026 03:30:35 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a709a4e80bsm2121961a91.4.2026.10.03.03.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 03:30:34 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: akpm@linux-foundation.org,
	rppt@kernel.org
Cc: peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	kas@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v4 0/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Sat,  3 Oct 2026 19:30:28 +0900
Message-ID: <20261003103030.63380-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UFFDIO_MOVE on a swapped-out page installs the source PTE at the
destination unchanged, so a uffd bit set on a write-protected or
RWP-protected source lands in a destination VMA that was never
registered for either, and nothing clears it afterwards.  Patch 1 clears
the bit, then re-arms it if the destination is RWP-registered, which is
what the present-page and zeropage move paths already do.  Patch 2 adds
the tests that catch it.

v1: https://lore.kernel.org/all/20260919004630.1159895-1-donggeunyoo.kernel@gmail.com/
v2: https://lore.kernel.org/all/20260925042907.2330519-1-donggeunyoo.kernel@gmail.com/
v3: https://lore.kernel.org/all/20260926124145.2878520-1-donggeunyoo.kernel@gmail.com/

Changes in v4:
 - patch 1: add Acked-by from David Hildenbrand and Mike Rapoport; no
   code change
 - patch 2: protect the source right after registering it, open pagemap
   at the top, and use a designated initializer for the move (David
   Hildenbrand)
 - patch 2: fail only the test case, not the whole run, when UFFDIO_MOVE
   fails (David Hildenbrand)

Changes in v3:
 - patch 1: describe the userspace-visible effects and the backport
   (Andrew Morton, David Hildenbrand)
 - patch 2: drop the MADV_PAGEOUT retry loop (David Hildenbrand)
 - patch 2: add an RWP case (David Hildenbrand)

Changes in v2:
 - patch 1: clear the bit unconditionally (Kiryl Shutsemau)
 - patch 1: rewrite the changelog for readability (Mike Rapoport)
 - add Assisted-by: LLM (Mike Rapoport)

x86_64 defconfig plus USERFAULTFD, TRANSPARENT_HUGEPAGE,
PAGE_TABLE_CHECK_ENFORCED and a swap device, under QEMU, on
6812ce4e4379:

  uffd-unit-tests                    before   after
  move-swap-wp on anon               not ok   ok
  move-swap-rwp on anon              not ok   ok
  the other 103 unit tests           ok       ok
  uffd-wp-mremap, 38 tests           ok       ok

  11 unit tests skip on both, as CONFIG_GUP_TEST is not set.

With UFFDIO_MOVE forced to fail (len = page_size + 1, local change only),
v3 aborts the run after 15 of 116 tests; v4 reports the two move-swap
cases as failed and runs the rest.

  pagemap bit 57 at the destination  before   after
  swapped page, dst not armed        set      clear
  swapped page, dst WP-armed         set      clear
  swapped page, dst RWP-armed        set      set
  resident page, dst WP-armed        clear    clear

  MADV_COLLAPSE over 2 MB at dst     EINVAL   0
  fault on the moved page at dst     WARNING  none

Donggeun Yoo (2):
  userfaultfd: clear the inherited uffd bit in move_swap_pte()
  selftests/mm: add tests for UFFDIO_MOVE of a uffd-protected swap entry

 mm/userfaultfd.c                             |  1 +
 tools/testing/selftests/mm/uffd-unit-tests.c | 84 ++++++++++++++++++++
 2 files changed, 85 insertions(+)

-- 
2.53.0

