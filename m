Received: from sender-of-o59.zoho.eu (sender-of-o59.zoho.eu [136.143.169.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A0C37C917;
	Sun, 15 Mar 2026 21:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609428; cv=pass; b=FCSsQw5z7DfI4N8enr0q27KT1u0eneKPnzG7dJ1saKQy/cLOaCNKJQTo5qm+as/moM1PhXX/Od2EmvHrrwP2VDsyWsG0NJFLbF9S4v9F756JuRQeQgk2GUQsiAYvqJ0CEabVWpaU2fIRWbvEqYgK6btXDdQKmqnCGVbinu6u0YY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609428; c=relaxed/simple;
	bh=polKK+TVvNhEByk+/eHx32xRBSbjq2Xd9H4Z2XJ6PcI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rWSf56jgrdhaiMrbjyefqcLMp2IQn0CrBkaKqATaqPp2qXYz94Wm72b71JwN4OV3d9Cec0Y+EHF8PkUd3GrLGLS2FemccmJ2XYfmKgjQcVIsIiSOvTI+ytLBw9O0rHRGkcgycKiXNVslZ0+Ii0yG5jueKfQu13ukzFxG3Zh9PB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=LZXScVzQ; arc=pass smtp.client-ip=136.143.169.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="LZXScVzQ"
ARC-Seal: i=1; a=rsa-sha256; t=1773609409; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Bno4pcyLqOL9o7Bi79y9GprmpW3yMTKbk6d9otL9c3i0zsE+cwgce1yiuyvWarrN9KNZ3bQlxRhzhpV2mdXtmU6i5rdfRsDv2VYrzhW4/bdni2OxBlm4kvB0A1/He39CmMMr/cHofL6HUUQvNSjDfGKl5p7d8LotHv+LF7WTF10=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773609409; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wV6NoXecECb7bqi4ET6OkCEvhdV779F9FKJzjGTMHkA=; 
	b=kHDMDzbgMvlnRc6j/zabnj8zZgSDvYcpznt5FG1G8tblGOQeJ04ov5V6kWuisyFqI0RoXduF4WMd/frELEo0Gh5Tg+RleFu2tMr2sgEokYi4RCdUxBIJs9ieb3zYO/j0L79jA2/x2kmONpgTHlgY9Ru+h5Con45hd3SELSr0v4g=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773609409;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=wV6NoXecECb7bqi4ET6OkCEvhdV779F9FKJzjGTMHkA=;
	b=LZXScVzQZ4oeTxAilTYH+ntky06J6KenJEbszKszIIPWR+wyH3rwm00JjCmgExcy
	f5a1Wtl/YRPPinS5IuHOhqS9XNB6Lblrs03k4QIUzdmnrFnyVDcCftvNb/cqQqkymqF
	Cn0OBmdia8FBTN6dryv/n3YhzTFhPvCQCzT7QzsQ=
Received: by mx.zoho.eu with SMTPS id 177360940741925.854410502414908;
	Sun, 15 Mar 2026 22:16:47 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v3 4/8] lib/glob: add case-insensitive glob_match_nocase()
Date: Sun, 15 Mar 2026 21:16:35 +0000
Message-Id: <20260315211641.408318-8-objecting@objecting.org>
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

Add a case-insensitive variant of glob_match() for callers that need
to match patterns regardless of case.

The immediate motivation is the ATA device quirk denylist in
drivers/ata/libata-core.c, which uses glob_match() to match drive
model and firmware revision strings.  ATA IDENTIFY DEVICE data is
space-padded ASCII and the specification does not mandate a particular
case, so a denylist entry could miss a drive that reports its model
string in unexpected casing.  Switching the denylist to
glob_match_nocase() (in a follow-up ATA patch) would make it robust
against such variation.

Refactor the matching logic into a static __glob_match() helper that
takes a bool nocase parameter, and implement both glob_match() and
glob_match_nocase() as thin wrappers.  When nocase is true, literal
characters and character class endpoints are folded through tolower()
before comparison.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 include/linux/glob.h |  1 +
 lib/glob.c           | 75 +++++++++++++++++++++++++++++++++++++-------
 2 files changed, 65 insertions(+), 11 deletions(-)

diff --git a/include/linux/glob.h b/include/linux/glob.h
index 861327b33e41..36527ae89730 100644
--- a/include/linux/glob.h
+++ b/include/linux/glob.h
@@ -6,5 +6,6 @@
 #include <linux/compiler.h>	/* For __pure */
 
 bool __pure glob_match(char const *pat, char const *str);
+bool __pure glob_match_nocase(char const *pat, char const *str);
 
 #endif	/* _LINUX_GLOB_H */
diff --git a/lib/glob.c b/lib/glob.c
index c5508be0d215..172b8ba3cd8e 100644
--- a/lib/glob.c
+++ b/lib/glob.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
+#include <linux/ctype.h>
 #include <linux/module.h>
 #include <linux/glob.h>
 #include <linux/export.h>
@@ -11,8 +12,8 @@
 MODULE_DESCRIPTION("glob(7) matching");
 MODULE_LICENSE("Dual MIT/GPL");
 
-/**
- * glob_match - Shell-style pattern matching, like !fnmatch(pat, str, 0)
+/*
+ * __glob_match - Shell-style pattern matching, like !fnmatch(pat, str, 0)
  * @pat: Shell-style pattern to match, e.g. "*.[ch]".
  * @str: String to match.  The pattern must match the entire string.
  *
@@ -20,7 +21,7 @@ MODULE_LICENSE("Dual MIT/GPL");
  * succeeds, or false (0) if it fails.  Equivalent to !fnmatch(@pat, @str, 0).
  *
  * Pattern metacharacters are ?, *, [ and \.
- * (And, inside character classes, !, - and ].)
+ * (And, inside character classes, !, ^ - and ].)
  *
  * This is a small and simple implementation intended for device denylists
  * where a string is matched against a number of patterns.  Thus, it
@@ -39,7 +40,7 @@ MODULE_LICENSE("Dual MIT/GPL");
  *
  * An opening bracket without a matching close is matched literally.
  */
-bool __pure glob_match(char const *pat, char const *str)
+static bool __pure __glob_match(char const *pat, char const *str, bool nocase)
 {
 	/*
 	 * Backtrack to previous * on mismatch and retry starting one
@@ -58,6 +59,11 @@ bool __pure glob_match(char const *pat, char const *str)
 		unsigned char c = *str++;
 		unsigned char d = *pat++;
 
+		if (nocase) {
+			c = tolower(c);
+			d = tolower(d);
+		}
+
 		switch (d) {
 		case '?':	/* Wildcard: anything but nul */
 			if (c == '\0')
@@ -94,13 +100,17 @@ bool __pure glob_match(char const *pat, char const *str)
 						goto literal;
 
 					class += 2;
-					/* Normalize inverted ranges like [z-a] */
-					if (a > b) {
-						unsigned char tmp = a;
+				}
+				if (nocase) {
+					a = tolower(a);
+					b = tolower(b);
+				}
+				/* Normalize inverted ranges like [z-a] */
+				if (a > b) {
+					unsigned char tmp = a;
 
-						a = b;
-						b = tmp;
-					}
+					a = b;
+					b = tmp;
 				}
 				if (a <= c && c <= b)
 					match = true;
@@ -112,8 +122,11 @@ bool __pure glob_match(char const *pat, char const *str)
 			}
 			break;
 		case '\\':
-			if (*pat != '\0')
+			if (*pat != '\0') {
 				d = *pat++;
+				if (nocase)
+					d = tolower(d);
+			}
 			fallthrough;
 		default:	/* Literal character */
 literal:
@@ -132,4 +145,44 @@ bool __pure glob_match(char const *pat, char const *str)
 		}
 	}
 }
+
+/**
+ * glob_match - Shell-style pattern matching, like !fnmatch(pat, str, 0)
+ * @pat: Shell-style pattern to match, e.g. "*.[ch]".
+ * @str: String to match.  The pattern must match the entire string.
+ *
+ * Perform shell-style glob matching, returning true (1) if the match
+ * succeeds, or false (0) if it fails.  Equivalent to !fnmatch(@pat, @str, 0).
+ *
+ * Pattern metacharacters are ?, *, [ and \.
+ * (And, inside character classes, !, ^ - and ].)
+ *
+ * This is small and simple and non-recursive, with run-time at most
+ * quadratic: strlen(@str)*strlen(@pat).  It does not preprocess the
+ * patterns.  An opening bracket without a matching close is matched
+ * literally.
+ *
+ * Return: true if @str matches @pat, false otherwise.
+ */
+bool __pure glob_match(char const *pat, char const *str)
+{
+	return __glob_match(pat, str, false);
+}
 EXPORT_SYMBOL(glob_match);
+
+/**
+ * glob_match_nocase - Case-insensitive shell-style pattern matching
+ * @pat: Shell-style pattern to match.
+ * @str: String to match.  The pattern must match the entire string.
+ *
+ * Identical to glob_match(), but performs case-insensitive comparisons
+ * for literal characters and character class contents using tolower().
+ * Metacharacters (?, *, [, ]) are not affected by case folding.
+ *
+ * Return: true if @str matches @pat (case-insensitive), false otherwise.
+ */
+bool __pure glob_match_nocase(char const *pat, char const *str)
+{
+	return __glob_match(pat, str, true);
+}
+EXPORT_SYMBOL(glob_match_nocase);
-- 
2.34.1

