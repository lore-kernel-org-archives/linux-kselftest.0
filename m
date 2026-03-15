Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396A437AA88;
	Sun, 15 Mar 2026 20:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773605928; cv=pass; b=L32+YvQdYwGFBeeVQ7pc+Y1uF3uRlB9EG39PnBarzMKcxEPC3RDIxYqPvTYnFzqqD5g6agsSGGmLK5wjzUORbZixQZTEUUn3/ZwQq7VUJCyS3rh7thPDzhriEM6MgLayjYU3J05PG3GSgjeQ3Q165/gTrLs7fRrCo66034EJc5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773605928; c=relaxed/simple;
	bh=POeuv5ojK94O2H++yVuXxLI5I7CW0YJOM4PIKL2jne4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sv0s/7m7UZ6ffxBtCAEI9izsnsSmyB/mNcLHNn4rlHi1wMQb+ase7j51D6McllihxhqVymgMl4CS28IOYv1D4+rfIusFdQXW/JMj82n8d3xOgZqXEJL6w9FwrLoQm+2LY4p7qPwIRQdrk+oRgaYwkurZ4neKex9ibh8VspbF50M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=knw5ysLv; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="knw5ysLv"
ARC-Seal: i=1; a=rsa-sha256; t=1773605901; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=T6EkKpS1aqTEH3NgP7HMQejNp/n4QIM+rAVmeSe3sZ+2PcM4Q26IvEQpRZ1M9vYKG+d+dPbE0fR5wvuOHQKNuTeAsyZGoM4eQtkMJMXbYg9Hmnp01q/jlf8J+/5AKQTtSigAreBu3tufnQajpJo65nc33xDnhwqt78NiB1zpIb4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773605901; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KiXJHWYlNASgwx5Dzu2oYmEDoJbAXIYgByl3vF7pLEc=; 
	b=gi+X5sCEPXXotL0rcJQ8c7mEbOj8YewOLQ0Quk8Sa4pvKID6L9StWeHXyxQC5SRsz/SOfEgh22RXt8wgwZ2ZGqAta8cSR4WJQDIKhuPXsjB7fYbQwcYkNk1qdGOPomvwIKYc+8Jjb+DDGyG2cPQK9D/U6pIzxAV0PCELWdb2koI=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773605901;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=KiXJHWYlNASgwx5Dzu2oYmEDoJbAXIYgByl3vF7pLEc=;
	b=knw5ysLv9QnB9OPPfMBpcH7LZZiE/cPj1SB8uYoZqj3FQrMVwP/athq/qu7MXBgm
	JrEwayT9+4CQn4Av3E3UTnHqZDiRKX9JwdqiGeSKZ4v3bprSNewWobNegT8cFErYPla
	6zywRcmYDkeGVOlKXxr1NZMWHh7J8UohYmQzJUlw=
Received: by mx.zoho.eu with SMTPS id 17736059003251012.471441025747;
	Sun, 15 Mar 2026 21:18:20 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 4/8] lib/glob: add case-insensitive glob_match_nocase()
Date: Sun, 15 Mar 2026 20:18:12 +0000
Message-Id: <20260315201816.362559-5-objecting@objecting.org>
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
 lib/glob.c           | 73 ++++++++++++++++++++++++++++++++++++++------
 2 files changed, 64 insertions(+), 10 deletions(-)

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
index c5508be0d215..9c71ccc15abc 100644
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

