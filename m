Received: from sender-of-o53.zoho.eu (sender-of-o53.zoho.eu [136.143.169.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C716C37C920;
	Sun, 15 Mar 2026 21:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609428; cv=pass; b=biJGjMFCL7t2D8rvbvQbn5L+VnSDnshXMhb8dNB6keL63CrcgYx64NuPdrw7aC2lUDO200WR+NFCoRhzfWznqV+XFxQoqcKj615ezsCNBA/4GgoUm/TNoPkOXjSREQA1LWAXZXhtEtpABnbTyl4O1UAS/p1EtPEUIRCdr6icWfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609428; c=relaxed/simple;
	bh=DqDIHMd4MJlmLaUnm4FNNfD7TmiR4u66qXh4CXNuOwo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rBix0KL3kKC4EHCaVOXQw+RmbpoHIcxSAemdWoxQLV7CYUvbzOgiX66GmnRpe0hJ45vr1IX+hruTXQsmEx31xIlodm38HLzQBytjO893YMviMTSdyq9FOWYGVU/PKiKmqfMjwmdzs5KtbK9qgm7UAeIYBnBIcl4K9BCe66CpXjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=FOXNVdlC; arc=pass smtp.client-ip=136.143.169.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="FOXNVdlC"
ARC-Seal: i=1; a=rsa-sha256; t=1773609411; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=f65gojbao9VWdme8gkz5snyZix8TCMOjn3WstebXdYGWzRhs2uwwlga7hF2nlhpmA+PYZ4P/MhuQKIBZU8nuJJktxiYSAbGkl4j/U1LOjl+ChK40U4hkZSrNAK6w1kwukDUEnBi6JG1Bm7dv9ioQbyTlqBlWYFQzUnXz6GsmjJU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773609411; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=f220kEhJ66X+jXJtp71OpS8vD3cCaDjeBL3VruhruPw=; 
	b=Wi4acQ0E0JtwrEZz5dZQ4ZvhRxY7lVYA1xoaTlLEHViiZBo8VjjncueCcczYrdSlmETBhCQeDtSQa9R449HuiYf2fBhGFgzulNzw9qD8r/BPicFrN6RbQenYMbn9e2FLdr5xLkOp8PloPItFBLNfB6liE7mKxenIpPvE1ODSxkA=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773609411;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=f220kEhJ66X+jXJtp71OpS8vD3cCaDjeBL3VruhruPw=;
	b=FOXNVdlCrqL05u0tX3TNJ8Te65mNOw1uYqKwFLFFpYSJcmLCu/9qvsckfMVDjTPv
	gPn8othOUwzAxh0Nkg5fVO8dOxRM/irKjRqgbdOksDuCB+JE3fMYEAROqzviY9ROgge
	zTsryyrS5RX4mcPO7OrpnEnjE6Jo26N99+XkIR8E=
Received: by mx.zoho.eu with SMTPS id 1773609410152946.5648712984375;
	Sun, 15 Mar 2026 22:16:50 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v3 6/8] lib/tests: add glob test cases for escapes, edge cases, and new features
Date: Sun, 15 Mar 2026 21:16:39 +0000
Message-Id: <20260315211641.408318-12-objecting@objecting.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260315211641.408318-1-objecting@objecting.org>
References: <20260315211641.408318-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The glob kunit test suite had no coverage for backslash escape
sequences, and was missing edge cases around wildcards with empty
strings, inverted ranges, unclosed brackets, and consecutive
wildcards.

Add test cases covering:
  - Backslash escapes: \*, \?, \[, \\, non-metachar after backslash,
    and trailing backslash matching a literal '\' character.
  - Wildcards matching special characters in the string (*, [, \, ?).
  - Wildcards with empty strings: * matches empty, ** matches empty,
    ? does not match empty.
  - Inverted (backwards) ranges: [z-a] and [9-0] now match thanks to
    endpoint normalization.
  - Single-character ranges: [a-a] matches 'a'.
  - Caret negation: [^a] and [^a-z] as alias for [!...].
  - Unclosed bracket: [ treated as literal.
  - Consecutive wildcards: ***a, *?*, *?*?* patterns.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 lib/tests/glob_kunit.c | 47 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/lib/tests/glob_kunit.c b/lib/tests/glob_kunit.c
index 362b1eda8e5b..9b53060e7c8e 100644
--- a/lib/tests/glob_kunit.c
+++ b/lib/tests/glob_kunit.c
@@ -80,6 +80,53 @@ static const struct glob_test_case glob_test_cases[] = {
 	{ .pat = "*bc", .str = "bc", .expected = true },
 	{ .pat = "*bc", .str = "bbc", .expected = true },
 	{ .pat = "*bc", .str = "bcbc", .expected = true },
+	/* Backslash escape sequences */
+	{ .pat = "\\*", .str = "*", .expected = true },
+	{ .pat = "\\*", .str = "a", .expected = false },
+	{ .pat = "\\?", .str = "?", .expected = true },
+	{ .pat = "\\?", .str = "a", .expected = false },
+	{ .pat = "\\[", .str = "[", .expected = true },
+	{ .pat = "\\[", .str = "a", .expected = false },
+	{ .pat = "a\\bc", .str = "abc", .expected = true },
+	{ .pat = "\\\\", .str = "\\", .expected = true },
+	{ .pat = "\\\\", .str = "a", .expected = false },
+	/* Trailing backslash (matches literal backslash) */
+	{ .pat = "a\\", .str = "a\\", .expected = true },
+	{ .pat = "a\\", .str = "a", .expected = false },
+	/* Wildcards matching special characters in string */
+	{ .pat = "?", .str = "*", .expected = true },
+	{ .pat = "?", .str = "[", .expected = true },
+	{ .pat = "?", .str = "\\", .expected = true },
+	{ .pat = "?", .str = "?", .expected = true },
+	/* Wildcards with empty strings */
+	{ .pat = "*", .str = "", .expected = true },
+	{ .pat = "*", .str = "a", .expected = true },
+	{ .pat = "**", .str = "", .expected = true },
+	{ .pat = "**", .str = "abc", .expected = true },
+	{ .pat = "?", .str = "", .expected = false },
+	/* Inverted (backwards) ranges */
+	{ .pat = "[z-a]", .str = "m", .expected = true },
+	{ .pat = "[z-a]", .str = "z", .expected = true },
+	{ .pat = "[z-a]", .str = "a", .expected = true },
+	{ .pat = "[9-0]", .str = "5", .expected = true },
+	{ .pat = "[9-0]", .str = "a", .expected = false },
+	/* Single-character range */
+	{ .pat = "[a-a]", .str = "a", .expected = true },
+	{ .pat = "[a-a]", .str = "b", .expected = false },
+	/* Caret negation syntax */
+	{ .pat = "[^a]", .str = "b", .expected = true },
+	{ .pat = "[^a]", .str = "a", .expected = false },
+	{ .pat = "[^a-z]", .str = "0", .expected = true },
+	{ .pat = "[^a-z]", .str = "m", .expected = false },
+	/* Unclosed bracket (treated as literal) */
+	{ .pat = "[", .str = "[", .expected = true },
+	{ .pat = "[", .str = "a", .expected = false },
+	{ .pat = "[abc", .str = "[abc", .expected = true },
+	/* Consecutive wildcards */
+	{ .pat = "***a", .str = "a", .expected = true },
+	{ .pat = "*?*", .str = "a", .expected = true },
+	{ .pat = "*?*?*", .str = "ab", .expected = true },
+	{ .pat = "*?*?*", .str = "a", .expected = false },
 	/* Multiple asterisks (complex backtracking) */
 	{ .pat = "*ac*", .str = "abacadaeafag", .expected = true },
 	{ .pat = "*ac*ae*ag*", .str = "abacadaeafag", .expected = true },
-- 
2.34.1

