Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBAC366059;
	Sun, 15 Mar 2026 20:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773605917; cv=pass; b=pUyOwFo+7O5wqjBmZkTuP3df/K4I6em7+4tXCGSLnJrPVtsCfPKJbTQE+vjiQ3Drle/64Csnh0++7GmNMLl+yY64SJb/P3jbCQqA42xJuap4Hq4L8bvwdYZ+fikGdgDVAU10819Az4KJipq41rX/fRniIe0YfsQ6KzR8KepXl8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773605917; c=relaxed/simple;
	bh=JlM/DTQFGQHqwLq6UiA32ma6yqFkfErO0tEgkHgjSgE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=JEHmh2SDfRcDXqc17jHPR6mgqnEvUroeMlvmCW0CwwKFdueujNfBmf/8qURgwuK1Q5rju0/jT+3SKEIAKlx/YW6nlGmxGsU9LqGQbaQTODi3wakdcQMyvVX2rbDy3RfR2CBoddwCiE7CRKltHQpVpOfqeM5FLrRg+hdBYe1kH34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=F7sTZM7y; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="F7sTZM7y"
ARC-Seal: i=1; a=rsa-sha256; t=1773605899; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=VD3SSk2CoQuawF4zd3bq9kML/LrRBUcZh2ToVKH/ud9XmbwDJu+pVWoOx6O1ihBeMJJS6BoD5wOzHjkevr5SOnHZxSInfquT2RkeVFWLQOPpkPcIZIxGpCbf9njnv6l7DdJPtY1UDV+JwUZLHPVp15PEsHzTXFSWKyIdB9WDMO0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773605899; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zMYhfwtZakUQeIMlJAeiUAxoWl5+QSDwqxRzbg7pAb4=; 
	b=NxU7FNybKI4bdR4o1wVW5G7IgmWnBes/a34BOBxs5q0imh+m84G9pM8v6Ch/LxWjTXFRdoKM1sMMN5OJQh4Vz7dzy0y1iH3mGK6ixoS8HmANZ+GcQfqcZ2SZ5joVS2psSxKoCjGqRvMlrr/fkeKCCM3c4bJ89Rw8/rLxUf7sXkQ=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773605899;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=zMYhfwtZakUQeIMlJAeiUAxoWl5+QSDwqxRzbg7pAb4=;
	b=F7sTZM7yr8o8SEXytT6qYKTqL1odmQXgQpC+hbB9Q7kPcQ4wVbjoqQ1JZohaWpN3
	KmEJ3hKvs3YDA6PDEAN6db4pmDqEZ3KsghB4tySLIMm+0AoOK0k+cC0YCdXS7Md7tVO
	vMA4HNgkVmuP+qBa4hjXpltfORmkkobTfBQGgu7M=
Received: by mx.zoho.eu with SMTPS id 1773605897493321.7420196583013;
	Sun, 15 Mar 2026 21:18:17 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 0/8] lib/glob: bug fixes, new features, and tests
Date: Sun, 15 Mar 2026 20:18:08 +0000
Message-Id: <20260315201816.362559-1-objecting@objecting.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Bug fixes, extensions, and test coverage for lib/glob.c:

Patches 1-3 fix corner cases in the existing glob_match():
  - Inverted character class ranges like [z-a] are now normalized
    instead of silently failing to match.
  - A trailing backslash is treated as a literal '\' rather than
    reading past the end of the pattern string.
  - [^...] is accepted as an alias for [!...] to match the
    regex-style negation syntax documented in glob(7).

Patches 4-5 add two new utility functions:
  - glob_match_nocase() for case-insensitive matching, useful for
    subsystems like ATA that need case-folded denylist comparisons.
  - glob_validate() for checking pattern syntax before use, so
    callers can reject malformed patterns early with a clear error.

Patches 6-7 add kunit test coverage:
  - 47 new test cases for glob_match covering escapes, inverted
    ranges, caret negation, edge cases, and unclosed brackets.
  - 11 test cases for glob_match_nocase.
  - 17 test cases for glob_validate.

Patch 8 adds a real in-tree caller for glob_validate() in the kunit
executor, validating user-provided filter_glob patterns and returning
-EINVAL for malformed ones.

Changes since v1:
  - Added patch 8 (kunit executor caller for glob_validate) so that
    both new exported functions have in-tree users or documented
    intended users.
  - Updated glob_match_nocase() commit message to reference the ATA
    denylist as the intended caller (follow-up patch).

Josh Law (8):
  lib/glob: normalize inverted character class ranges
  lib/glob: treat trailing backslash as literal character
  lib/glob: accept [^...] as character class negation syntax
  lib/glob: add case-insensitive glob_match_nocase()
  lib/glob: add glob_validate() for pattern syntax checking
  lib/tests: add glob test cases for escapes, edge cases, and new
    features
  lib/tests: add kunit tests for glob_match_nocase() and glob_validate()
  kunit: validate glob filter patterns before use

 include/linux/glob.h   |   2 +
 lib/glob.c             | 122 +++++++++++++++++++++++++++++++++++++---
 lib/kunit/executor.c   |  13 +++++
 lib/tests/glob_kunit.c | 124 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 252 insertions(+), 9 deletions(-)

-- 
2.34.1

