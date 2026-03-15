Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0E8374730;
	Sun, 15 Mar 2026 21:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609418; cv=pass; b=LiZvnsnx+8jfSLZeMeVU7Gdit/RT85Xyd04aMb2WF49VadADFG6geOvOM6fxW1GLTgySu0O6jn8YWiOOZynHNgfzjyZFDRtK2SY0id6LdiYsqjWLRGA4T3g0nQW92aA11hoRSsTGkTj5HNUvGrhNhA5T9faKKDQU9icri27X8uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609418; c=relaxed/simple;
	bh=XgWFRb8ONcA2GQ/HdeRNANjgs9ScGEr/4d+esA/Kb7c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nGxmulUTmCQfWRrFGFTw8P/W8pwEPfPsOtAVRgmUl7QGF37209Ivkgd+wO/hEQb7+o9wT7N/Oq0iPGgnCmQKv2FPsQkA1SG0PZc0tw29qW7V4nJdDCSdbk28VKSVU7/HiyZh0lqUl/QdzmBOXkNnwEXWtu/dMjI5yyHG96VRg6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=kPN6H4LK; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="kPN6H4LK"
ARC-Seal: i=1; a=rsa-sha256; t=1773609408; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=lNef373UeMm0iTQWWKrHcct/tu4eWkXuoq1YrcJmXNoowTPVX2utToTSG8VUJkKlkcYKdZj/OzMgxEcGpAELDDMWTPMZsd5BTe3nZsbVTXJpDpFz4C9+hgs4mmaEGCSwtq9Enh5vJEVsVMo4U90yFsTijguR1idtLkyHpmaV8OE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773609408; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6MFsWg559qWHVDZpDzdEbMHixOdjZsqRsUni07ha0iI=; 
	b=OLFDFzqsVZLxXpDriXqvNhsuu2C8Eu7+XopA5yfh6K5DQ2u2PsNcAdYOrQssr4ys03B12MpC4TsVkIVsAZu21YV0AM6CAqbbOA4B6I5H2qkrdbGpfT5mthKtYhax+z11umJL2Be7/uQS2bFFsTIel5jQszzYpFrtPxRC1ZLf3o8=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773609407;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=6MFsWg559qWHVDZpDzdEbMHixOdjZsqRsUni07ha0iI=;
	b=kPN6H4LKvc7zWCP/shk0uVhACzcOMqOsocQa6iSygoiYD9kKeOdYHvGj4RniL4F3
	PfCOzo13yrDkItGYdRcjUmt+xC5fd9M8RK5pT5gWFuqtsKZ0WiQGWMV/TdL7Q9Twf6M
	Z85fwPYHHEjgbXoNiskqR93fOBNLf9FH4S9mq7/w=
Received: by mx.zoho.eu with SMTPS id 1773609406065337.3837088591996;
	Sun, 15 Mar 2026 22:16:46 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v3 3/8] lib/glob: accept [^...] as character class negation syntax
Date: Sun, 15 Mar 2026 21:16:33 +0000
Message-Id: <20260315211641.408318-6-objecting@objecting.org>
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

glob(7) specifies [!...] for negated character classes, but many
users are more familiar with the regex-style [^...] syntax.  Tools
like git, rsync, and bash all accept both forms, and the difference
is a common source of confusion when writing glob patterns.

Accept '^' as an alias for '!' at the start of a character class so
that both [!a-z] and [^a-z] work as expected.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 lib/glob.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/glob.c b/lib/glob.c
index df7f00619b1b..c5508be0d215 100644
--- a/lib/glob.c
+++ b/lib/glob.c
@@ -33,9 +33,9 @@ MODULE_LICENSE("Dual MIT/GPL");
  * Like !fnmatch(@pat, @str, 0) and unlike the shell, this does NOT
  * treat / or leading . specially; it isn't actually used for pathnames.
  *
- * Note that according to glob(7) (and unlike bash), character classes
- * are complemented by a leading !; this does not support the regex-style
- * [^a-z] syntax.
+ * Note that according to glob(7), character classes are complemented by
+ * a leading !.  The regex-style [^a-z] syntax is also accepted as an
+ * alias.
  *
  * An opening bracket without a matching close is matched literally.
  */
@@ -72,7 +72,7 @@ bool __pure glob_match(char const *pat, char const *str)
 		case '[': {	/* Character class */
 			if (c == '\0')	/* No possible match */
 				return false;
-			bool match = false, inverted = (*pat == '!');
+			bool match = false, inverted = (*pat == '!' || *pat == '^');
 			char const *class = inverted ? pat + 1 : pat;
 			unsigned char a = *class++;
 
-- 
2.34.1

