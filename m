Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB07651617F;
	Tue, 29 Sep 2026 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678041; cv=none; b=X9g9qcucLg9nTL71Yj4ztV6FflCoQrBlZl81+RpaNSFeG4/Hnmlwqyx3Q1NBTPNmPT5eFE5FDfenN0VFUyLckM6GQdtvDQCscyYK6gXiQppQZDgxv5a2/x1Y8L4YizSrKirz0nfMJ7JIzXwvQYIm2KTuYTFJP/TMRGJN+cfD8Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678041; c=relaxed/simple;
	bh=eV5lqS2npUIZnoSAYX7UiQBLBDCa+eZARi2ceYOyVCw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FBY1GsW2HhSNZns2sTeVlWiSkoZzTQrmieb3KaUUni7KJ3YrrfuE1wJBfpMi5jDKKCDqmHEwtuHPqCEnF10DN0+w0Z2OFlOJC5OJooGxI8lhqb1nByV9qYY1U1kVjyoaYPpX7zcIOwDs2cyzQFERxAoeVzN3IQktCKsuauMHOGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lYe1EwY8; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lYe1EwY8"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13284497;
	Tue, 29 Sep 2026 03:33:44 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 546643F86F;
	Tue, 29 Sep 2026 03:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790678027; bh=eV5lqS2npUIZnoSAYX7UiQBLBDCa+eZARi2ceYOyVCw=;
	h=From:Subject:Date:To:Cc:From;
	b=lYe1EwY8DwO7+J7j52MD7A/TQLzikpNOO11GzjKqoGFprZGEn00qaYDu/Z9fTlGw5
	 SoOml5LaeyA0YGyacrf9uinXHhW3RmZS/im82Mw+MuR3QkApsQWAEnFA6IZtj6bXlJ
	 Sjl4jLVxIji4Vq5ZxGwdm2PuOqGgjq9Zk5euWGOk=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v4 0/2] kselftest: mm: fix intermittent failure khugepaged
 test
Date: Tue, 29 Sep 2026 11:33:17 +0100
Message-Id: <20260929-fix_khugepagd_fail-v4-0-2169c18f2576@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO6Tu2oC/32NWw7CIBREt9LcbzEtaCn9ch+mabBc4Eb7CCjRN
 N272AX4eSYzZ1aIGAgjtMUKARNFmqcMp0MBg9eTQ0YmM/CS16Xigll693f/crhoZ3qr6cEqyUX
 N7bkxlYQ8XALm1i69dpk9xeccPvtHEr/0ry4JVrKbaCQqbrHS6qLDeBzmEbpt276fF3sfsgAAA
 A==
To: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 "Gregory Price (Meta)" <gourry@gourry.net>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3274; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=eV5lqS2npUIZnoSAYX7UiQBLBDCa+eZARi2ceYOyVCw=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqu5QGVeBBp6tar+v8bI+fW5DKxbPrbgKzSblUm
 I/EQ3fxmZqJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaruUBgAKCRBt1cPRWsUx
 M3MNDADG5woL0VLW+Y+vfB0vU+OeGg+Curv1eH15X0CF0c38pqdDED7OE0AX4zbl7xsJASMnX4n
 IlaS3Cj8OL1jhOXwcWwELevqc3cQ7FBDgFpHGSTk+ClyxBWpZ04lBm6OpEyufOo281yW5U5b92z
 zCvv9y0NdCU+IDf5rVSu8ikwGj50sjN/vkOAkssuj7KOmFp6G6tzXl9xwht8eAPdGx3rSFni82E
 hfrBORSxbHJBFCIcRQdqYqMEJ/rWX2iT7kTJtNkefOuNyKILoPZ8u5zvZiTNYlKO7J+YkYYCUMP
 qJBG9eSYXu46yJ9hwozKBG+PndvcsDeHUwE+dEyOvQ31qMD6yNzCKe9e2OiDdFCOh/qDHOBXcmg
 ICDN0PTtK5AF86RQKI/jVWauWbIGAia40zYcHbOe5J6ectuM8elwS3u3qhFG00eFfb/1pfbKE5S
 Si3s++y9Y4EvVCQKi7c7y59mhVPNMXWb9zaJcM7chgBJ2EHEpv+AZTD67BBanes32esUU=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

There are intermittent failures in collapse_max_ptes_swap() and
collapse_max_ptes_shared() when using the khugepaged_context:

  # Run test: collapse_max_ptes_shared (khugepaged:anon)
  # Allocate huge page... OK
  # Share huge page over fork()... OK
  # Trigger CoW on page 1023 of 2048... OK
  # Maybe collapse with max_ptes_shared exceeded.... OK
  # Trigger CoW on page 1024 of 2048... Fail
  Bail out! Unexpected huge page
  # Planned tests != run tests (26 != 23)
  # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0

  # Run test: collapse_max_ptes_swap (khugepaged:anon)
  # Swapout 257 of 2048 pages... OK
  # Maybe collapse with max_ptes_swap exceeded.... OK
  # Swapout 256 of 2048 pages... OK
  Bail out! Unexpected huge page
  # Planned tests != run tests (26 != 17)
  # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:0 error:0

This happens because khugepaged may collapse the pages before wait_for_scan()
is called, causing a sanity check that expects uncollapsed pages to fail.

For example, in collapse_max_ptes_swap(), after faulting the pages back in
and paging out up to max_ptes_swap pages, khugepaged may collapse them again
before c->collapse() is called.

To prevent this, mark the VMA with MADV_NOHUGEPAGE after it has been
collapsed by wait_for_scan() for anon. This prevents khugepaged from
collapsing it again before c->collapse() is called.

Also, fix false-positive results when a child process fails in tests
such as collapse_fork*() or collapse_max_ptes_shared():

  # -------------------------
  # running ./khugepaged -s 2
  # -------------------------
  #
  # Run test: collapse_max_ptes_shared (khugepaged:anon)
  # Allocate huge page... OK
  # Share huge page over fork()... OK
  # Trigger CoW on page 1023 of 2048... OK
  # Maybe collapse with max_ptes_shared exceeded.... OK
  # Trigger CoW on page 1024 of 2048... Fail
  Bail out! Unexpected huge page
  # Planned tests != run tests (26 != 23)
  # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0  // child failed.
  # Check if parent still has huge page... OK              // parent hpage success
  ok 24 collapse_max_ptes_shared                           // considered as success
  ...
  # Totals: pass:26 fail:0 xfail:0 xpass:0 skip:0 error:0

This failure was observed on NVIDIA Spark with 16KB page.

---
Changes in v4:
- add comments.
- add r-b tag.
- Link to v3: https://lore.kernel.org/r/20260923-fix_khugepagd_fail-v3-0-b387e92fe1a9@arm.com

Changes in v3:
- using is_anon() instead of comparing name of mem_ops
- add r-b tag.
- Link to v2: https://lore.kernel.org/all/20260921-fix_khugepagd_fail-v2-0-3c2877beef61@arm.com/

Changes in v2:
- remove temporary enabled setup.
- Link to v1: https://lore.kernel.org/r/20260915-fix_khugepagd_fail-v1-0-bb6f04c8759f@arm.com

---
Yeoreum Yun (2):
      kselftest: mm: return fail when child test result is fail in khugepaged
      kselftest: mm: fix intermittent failure khugepaged test

 tools/testing/selftests/mm/khugepaged.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
---
base-commit: 685086170033a6ab334f0068cd25dae90fd1bb4e
change-id: 20260923-fix_khugepagd_fail-172362f58d17

Best regards,
-- 
Sincerely,
Yeoreum Yun

