Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718F435CB87;
	Sun, 15 Mar 2026 21:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609417; cv=pass; b=m8TGmSsI6YYbJ+B0CRy6KNjjE/P2u66rXMV5emveRiXU95h3m4HbvVrMeK6NFd9BUfg6lfQ4Ppf/AO40X258nUckyyqtzlY/nI1R48MYNahv4cDd5Rt8mGqgYDgFjWZO9tU+LWn5V7qPsAThbU/Wtl641mmmENYBCLekqJDTzb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609417; c=relaxed/simple;
	bh=EmkU7UbjGv4BmhfB0EuMC/DC4Jeg3nKCrMJ2XvnfglE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=fUV0gGhAFe5XteE3UAegV6rwEAv6LBlISxXqLr9z9sHKZZxhkvInHA0jiIZi9gQW9v3gymNlrgStRmup+Jx/NzD+EFsQOXbaTqvl7gmqDeOrrlVHJE6K9VzBkQou1M+ixUUU0+GOERONRfYco4aQSHO3I6G5X3kB0mB2mzQWAUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=GIVGYEwX; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="GIVGYEwX"
ARC-Seal: i=1; a=rsa-sha256; t=1773609405; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=MfR8GooyU3XDiaE34cE/NGYhXeKhrP3qz9Z6uxCpzKYrqYNHYY9xalBJsGCmc1N1DMe5ikgSVznl/GNUGDOE0DstFEgUXKg8bZ5SNqvgE4Nl1b78JedxfAg0IggxRPfLuBpZ7Yt19x9tX/sG/QHJ7ivNsR2ns7+0AsvrqT5RuJQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773609405; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yjTRbqN9ToJXz18P1+fyAZEGVRlIP0ruNh3dZQ3rOB8=; 
	b=TXSPRBf8RF2uUn5KLEfrWM3RIhGTsoAUodsMW3I6tTFSCfCCXyvhcPMd4add/bEXbKSn+PpDkvlSUcZUcIVyNieccVlOn3GGxSnRVYqGqWFVwx1VXJ1O12nlY4WkRRHUjjaxCxV6y+BKZic+W6CjGlik+8vDQVBd/V27OR6FQAI=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773609405;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=yjTRbqN9ToJXz18P1+fyAZEGVRlIP0ruNh3dZQ3rOB8=;
	b=GIVGYEwXJh0qOfsWQdswXS757BfGKoSapVhOiLasjiWI6ulpgV+KKc+p8336TmRY
	0bAMLK8oV4UAJSCw2Fvhwtvi0P4y0ZfY4yJ54OaoOLG+GzwBd+FCKkA8dgHMre4uuFs
	sf149VcYJJLLusDKx4Of3r2pt8Y8SwMwkbVgaCvo=
Received: by mx.zoho.eu with SMTPS id 1773609402283998.2106867532927;
	Sun, 15 Mar 2026 22:16:42 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v3 0/8] lib/glob: bug fixes, new features, and tests
Date: Sun, 15 Mar 2026 21:16:28 +0000
Message-Id: <20260315211641.408318-1-objecting@objecting.org>
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

