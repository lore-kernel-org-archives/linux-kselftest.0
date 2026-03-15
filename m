Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD21B37BE83;
	Sun, 15 Mar 2026 20:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773605919; cv=pass; b=UTPJk2r9dlpDM7J3TCYoFjCZT9PfLE2E/uMmorR4p+qiGABLk0LrVYeeCq0PELTnV5nqx0FLYxKJIFNfpcXsPm6nUStUSH0cPk/KP0AOHAE0+YluBGYPvR9gbKunfaGCOcfVxX0MQ9Hhl4ACwSDAxtj/20331ZRNUQUTPcpIbCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773605919; c=relaxed/simple;
	bh=DqDIHMd4MJlmLaUnm4FNNfD7TmiR4u66qXh4CXNuOwo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nDMVefINPAnmyn6cy2hgpc2xIvEj5feYD1sfi4aJ7ydfbdDHYvwo90VYSprkVdeK9yQsWBpSJmfYIOdGjCfWg3pl8TvIc9k6yoD0fLv4B5v2xAGI0JeL45EQe/rH3wbtU+ALlOdWSoCcO25f6sRNOq4Q0HjvVuKn8pC8hs9cV7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=abE7v3nC; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="abE7v3nC"
ARC-Seal: i=1; a=rsa-sha256; t=1773605903; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=hEayP/4Ges+ZsRbkOMpqyi2t82z8yC5HcOOu2nlJlNH5mGo5BaMGBDNTHB1W1MLmkqUo0kE2NyHEYaHRK94oWQ8lSj1XuTWjNFjVuiCQ3uxc5aTswONGFEQd+xexbwQZb/oOsGYB4N+5lyPiG+DB7jnziZlX/VlN/ansV1ywa5c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773605903; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=f220kEhJ66X+jXJtp71OpS8vD3cCaDjeBL3VruhruPw=; 
	b=OLoPSBJ23fnv+HEcjrtvcRhZx4lS7gb2IfbLMiDdlT5nsIMDUlsTt+UQPLyiBrU1ikZxd0Ih9pfnfeUAmTdu/NszIaY26Ajv0n/0auVfS0EQRiBk/T1vkumWqyF4PrExIQzyCJ8fMdDI1XilR/unXI9ktAEED8Y6eVonKgWquL8=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773605903;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=f220kEhJ66X+jXJtp71OpS8vD3cCaDjeBL3VruhruPw=;
	b=abE7v3nCZdcrIfpZKSa0Bl15NIpuG8cWtQdEWenBko7x86BJlfkd6vATdFs9nJCU
	+VupqZEaWaKzrsSltTcyXznOyz2LEdc03MBzLp+v6+4Bn6hPlI3Icx+XIEotMWdnIxW
	EvP/rWjoqJKQhkiCTJvT6B9siYxDEHAQbqiuaVCc=
Received: by mx.zoho.eu with SMTPS id 1773605901733664.9290395481537;
	Sun, 15 Mar 2026 21:18:21 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 6/8] lib/tests: add glob test cases for escapes, edge cases, and new features
Date: Sun, 15 Mar 2026 20:18:14 +0000
Message-Id: <20260315201816.362559-7-objecting@objecting.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260315201816.362559-1-objecting@objecting.org>
References: <20260315201816.362559-1-objecting@objecting.org>
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

