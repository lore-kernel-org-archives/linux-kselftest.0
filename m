Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519B737C911;
	Sun, 15 Mar 2026 21:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609504; cv=pass; b=jxmzu7LNIWf6yaBwrPFr06UIJZo0DeD7hd4KDGccO+8YGdBkhXpMA5opm4Rpl9/aX0GxMJKqyUIkjTW+ei9578DLGmMkF8Cqe491NBJZ7DtRwzxHmru0m2MwBv871yiM/imC6o3tU80Lb6sR9EW0Z04I0zNNx2H9ks7wee9boKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609504; c=relaxed/simple;
	bh=WX2/caOzTqJjJ4CPjo72l6Kmsr9G+H7p49VD7aN0A5M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=gmYfpIxl6Yv4yuTTosJ2VV8GJESBZtoI8Qt/YDwnPda+KLadTnBWRuWrMx7SjCobl3vHOatsVIEDRXGOTTzwLYIsTyYMR1Emx0NFwmBXH0c/M006GrSmTGnsPTU3TApHmTuJXCdcLnpE+N1FhoI/PybE5z1V2npuay0/08UjaEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=DPjvyUUh; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="DPjvyUUh"
ARC-Seal: i=1; a=rsa-sha256; t=1773609492; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=CbDR5zcg+CnJydlcOl0Uvtr7YW4+yr2m55bUMyTxJugSEqtyJVyFSD583g40K0Ikq6MwWmX8yHUx9G6RftsNAmEtw3ZBcHHCPF5EXoGBKRpQGy+YdXymVW7UEyoDp0XpLNUtzKWtPmL3NvULmT3ybI0KSOJ88/4Awlg+hUUYOoc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773609492; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jd2XD3+wIxdMa9KT9tIWqd/OQaO2ewTMAEMUKKGdd5w=; 
	b=f0i8tey4Vg34vq4dQ6bJWRyNfJ+WjVp3EudGxWqXTQuRttpcn9YadOLXB0fYMhBnHuMbAKL2IYf1gYOjPe0OEZpiQv7b58Oinn/SUautCB/XjB09vzbSxVQXB7l0syyg2PEiqNU7p4hL9fGefnHmIYmBoJVaYfcEq6WVF2j/qD4=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773609492;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=jd2XD3+wIxdMa9KT9tIWqd/OQaO2ewTMAEMUKKGdd5w=;
	b=DPjvyUUhqOQFkqGnfF/05J7VwT64RP2DWApqtx7lL278EgDByU+niBic7nCYQPZg
	xjs+rrZsgYCEfWU6bWsrX8AGiURLv/a7+AF7tIQzhh/ITruk5tIYg9qmZWdBGAoVOq4
	38nWWH2OYGt5ybofxqlIWyEub1OsWyqeY6ehQA/k=
Received: by mx.zoho.eu with SMTPS id 1773609489368287.62172996836296;
	Sun, 15 Mar 2026 22:18:09 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v4 0/8] lib/glob: bug fixes, new features, and tests
Date: Sun, 15 Mar 2026 21:17:59 +0000
Message-Id: <20260315211807.411173-1-objecting@objecting.org>
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

Changes since v3:
  - Resend: v3 accidentally included stale v2 patch files in the
    same email thread.  No code changes from v3.

Changes since v2:
  - Fixed missing '^' in __glob_match metacharacter comment (patch 4).
  - Dropped unnecessary braces in glob_validate case '[' (patch 5).
  - Added real-world example to glob_validate() commit message (patch 5).

Changes since v1:
  - Added patch 8 (kunit executor caller for glob_validate).
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
 lib/glob.c             | 123 ++++++++++++++++++++++++++++++++++++----
 lib/kunit/executor.c   |  13 +++++
 lib/tests/glob_kunit.c | 124 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 252 insertions(+), 10 deletions(-)

-- 
2.34.1

