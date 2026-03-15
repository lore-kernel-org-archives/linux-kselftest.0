Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ADF37C913;
	Sun, 15 Mar 2026 21:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609426; cv=pass; b=E4Og7vm5ZJo3cJ/nNlNjd5W40Ra8nGsSLcdXUSp+pm5H5PusPI6JdJITllSgBm143Jxe8krTJAwPGOG4tqqNL6g3nbzrf1fCfFhW2TXnQEEwTuN9IdK3trswYWH1l1hlGtOCBsJLTkryzsIhhImKM2wQzHg2F+GALvGd9qXRpRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609426; c=relaxed/simple;
	bh=MrFEroHwYorqSWGBoY5ocHzyEC+JzAla+WphZ3zVa6Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M4bCVU61sLYO0A3LJVM3lQWO+o9vjnuUS8xyh9I/WHmx9zuZc0Ekm0i2dW1D7JD296wDOyNpx9gU0nQ7spLWim/9jbisXcFNoSY8YDkjrsuloyBmIgB77A0Dwtv2ZpLXbB9rLDZ8JPRB4y2WRlXomJED6bPD7oTUpBJ9sJb3YCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=HZTg+LP+; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="HZTg+LP+"
ARC-Seal: i=1; a=rsa-sha256; t=1773609409; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=jzE9RKYreXfyZgmscpA1JrQkgUlTIbPKzqdOmg15ebAeV9eEU2cGRWUHL0PRN5+7Q6NQCa0gTTzQAWQZmVS9QtPtFQZ/9FkcVViP0yXvaEPZXjzmDmuF17f3qh6J/HjmEe+SEEALzoSFma3cNLsxBjpViSeF5tMxF6xE6pQtINM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773609409; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/JtZCIPsgGracX5Mx/4hRAMi9BpwqYEGpkwpzrg8Moo=; 
	b=IuxZRZoLdHFL7wqG0/0MhtWw5wRA45JYzUVoZ7NgUuDLcuz1l5cWLFjieP1zgYNr3AZhamJj4QpJ2JrlxEgoEW5noUTto34W8Qy9IDiHkbLtDQXJVdIw7EPVCNlL1xUQEAdmeCCApRH11p78+1c4Pk1frMOOjZa8JyMZlU0KVRo=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773609409;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=/JtZCIPsgGracX5Mx/4hRAMi9BpwqYEGpkwpzrg8Moo=;
	b=HZTg+LP+2SkjNBe3fBD31ccvGwn+hJFbifX1ofVVvcdFfOH0boML6UoPEqFRmgBR
	Sxwtf/kj6Dqcu4c3VhcfarVZi94FNrBrdogDY0q9UWIIPudOv0bbuiehgr/vrrhz9Sx
	gKNyiIgCi4CGzdxfhh0aXMDJsWFKPDAW48i10fAw=
Received: by mx.zoho.eu with SMTPS id 1773609408132790.0034136864398;
	Sun, 15 Mar 2026 22:16:48 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 4/5] lib/tests: add kunit tests for glob_match_nocase() and glob_validate()
Date: Sun, 15 Mar 2026 21:16:36 +0000
Message-Id: <20260315211641.408318-9-objecting@objecting.org>
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

Add parameterized test cases for the new glob API functions:

glob_match_nocase() tests verify case-insensitive matching for
  literal characters, wildcards, character class ranges, and
  backslash escapes -- e.g., pattern "a*c" matches string "ABC",
  and range [A-Z] matches lowercase 'm'.

glob_validate() tests verify detection of malformed patterns:
  well-formed patterns (character classes, escapes, wildcards) return
  true, while unclosed brackets ("[abc") and trailing backslashes
  ("abc\") return false.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 lib/tests/glob_kunit.c | 77 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/lib/tests/glob_kunit.c b/lib/tests/glob_kunit.c
index 9b53060e7c8e..711cb44d1fc8 100644
--- a/lib/tests/glob_kunit.c
+++ b/lib/tests/glob_kunit.c
@@ -157,8 +157,85 @@ static void glob_test_match(struct kunit *test)
 			    params->pat, params->str, params->expected);
 }
 
+/* Case-insensitive matching tests */
+static const struct glob_test_case glob_nocase_test_cases[] = {
+	{ .pat = "abc", .str = "ABC", .expected = true },
+	{ .pat = "ABC", .str = "abc", .expected = true },
+	{ .pat = "aBc", .str = "AbC", .expected = true },
+	{ .pat = "a*c", .str = "ABC", .expected = true },
+	{ .pat = "A?C", .str = "abc", .expected = true },
+	{ .pat = "[A-Z]", .str = "m", .expected = true },
+	{ .pat = "[a-z]", .str = "M", .expected = true },
+	{ .pat = "abc", .str = "abd", .expected = false },
+	{ .pat = "ABC", .str = "ABD", .expected = false },
+	{ .pat = "a*z", .str = "ABZ", .expected = true },
+	{ .pat = "\\A", .str = "a", .expected = true },
+};
+
+KUNIT_ARRAY_PARAM(glob_nocase, glob_nocase_test_cases, glob_case_to_desc);
+
+static void glob_test_match_nocase(struct kunit *test)
+{
+	const struct glob_test_case *params = test->param_value;
+
+	KUNIT_EXPECT_EQ_MSG(test,
+			    glob_match_nocase(params->pat, params->str),
+			    params->expected,
+			    "nocase Pattern: \"%s\", String: \"%s\", Expected: %d",
+			    params->pat, params->str, params->expected);
+}
+
+/* Pattern validation tests */
+struct glob_validate_case {
+	const char *pat;
+	bool expected;
+};
+
+static const struct glob_validate_case glob_validate_test_cases[] = {
+	{ .pat = "abc", .expected = true },
+	{ .pat = "*", .expected = true },
+	{ .pat = "?", .expected = true },
+	{ .pat = "[abc]", .expected = true },
+	{ .pat = "[!abc]", .expected = true },
+	{ .pat = "[^abc]", .expected = true },
+	{ .pat = "[a-z]", .expected = true },
+	{ .pat = "[]abc]", .expected = true },
+	{ .pat = "\\*", .expected = true },
+	{ .pat = "\\\\", .expected = true },
+	{ .pat = "", .expected = true },
+	/* Invalid patterns */
+	{ .pat = "[", .expected = false },
+	{ .pat = "[abc", .expected = false },
+	{ .pat = "[!abc", .expected = false },
+	{ .pat = "abc\\", .expected = false },
+	{ .pat = "\\", .expected = false },
+	{ .pat = "abc[def", .expected = false },
+};
+
+static void glob_validate_case_to_desc(const struct glob_validate_case *t,
+				       char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "pat:\"%s\"", t->pat);
+}
+
+KUNIT_ARRAY_PARAM(glob_validate, glob_validate_test_cases,
+		  glob_validate_case_to_desc);
+
+static void glob_test_validate(struct kunit *test)
+{
+	const struct glob_validate_case *params = test->param_value;
+
+	KUNIT_EXPECT_EQ_MSG(test,
+			    glob_validate(params->pat),
+			    params->expected,
+			    "validate Pattern: \"%s\", Expected: %d",
+			    params->pat, params->expected);
+}
+
 static struct kunit_case glob_kunit_test_cases[] = {
 	KUNIT_CASE_PARAM(glob_test_match, glob_gen_params),
+	KUNIT_CASE_PARAM(glob_test_match_nocase, glob_nocase_gen_params),
+	KUNIT_CASE_PARAM(glob_test_validate, glob_validate_gen_params),
 	{}
 };
 
-- 
2.34.1

