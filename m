Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F9A373BEB;
	Sun, 15 Mar 2026 21:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609506; cv=pass; b=hSF+T7P2oYbqtoRl4HeAYRwHlc2BiC3CXV0Yar910TU6yprfHsn4qBf7PXoa8Nhbbv+LtzZUVJ81MqNwG9F9HUgIaFw78CiZ/spMgcIzcW3UqhtH2zfoBD7l1mRwQz7R5NjN3fZl/HYUyVnwYoLca2UsqgzAGFxdXlc1xC3m1Aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609506; c=relaxed/simple;
	bh=XgWFRb8ONcA2GQ/HdeRNANjgs9ScGEr/4d+esA/Kb7c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TPuBm1+FSYEP7RBixgrI6gCJyFTJtr3D/+U52hy0lZfaFgZXTbecYgdPvFM0Oo4uL4a2nAxokhb3BOvWf1T3JfScMHuaFULBOIFLcz26NIxVt1P3eGJxcj0wiVrQA7uJX8Ku2ch4psfAqlY0ebFRKQRU9js1mlLgMEoXpHxTRjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=jdCDk1lB; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="jdCDk1lB"
ARC-Seal: i=1; a=rsa-sha256; t=1773609493; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=DLtvF2vFWhYz53H9UYF8pqTcKohZnSju1MW4OT+9y5+ltug8OyEAbkxMd3ziq/kOJEn+bMrgksyHEQXYUO5orhKZHOMS9qLg2iPa+Ch2ZEjKSu5SNAw49t91ePg4wLbqwTkzhHdScd49zmEAP3Lsr2G/RC3Yl8NwnZ2fjJ4c6kc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773609493; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6MFsWg559qWHVDZpDzdEbMHixOdjZsqRsUni07ha0iI=; 
	b=PzlSo2Dv4fbYyDZJga9pTeiWiTPxnPsrKW4dlGByMvntKOWyVTAmQn9ZK/g7/NLvNsbeCF3QWPvsSEMVERmX0jzDyTaQoRqk0wuf6P5FbaltwIcZM+Zqt/DvSqQrfC9usG/lLVje2FN12dvMU71Tpq2lJ9zHj1rAQuftOEMli6o=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773609493;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=6MFsWg559qWHVDZpDzdEbMHixOdjZsqRsUni07ha0iI=;
	b=jdCDk1lB3MsXmV6fKfBRgrLS5GN7h6uHaPDXn7vpv3/P7NqoOS5O+lqQhhrapB1u
	B0n8rhpCE9zBohZ4rAQDtCrjyrRewAmwlEuyfNLTqGm3s86AfGUicfXPISj7O1u29Sz
	696srY95JhwU83K5Q5BeE2YQ6YeP4krqsQa/NjSE=
Received: by mx.zoho.eu with SMTPS id 1773609491700998.1132090256842;
	Sun, 15 Mar 2026 22:18:11 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v4 3/8] lib/glob: accept [^...] as character class negation syntax
Date: Sun, 15 Mar 2026 21:18:02 +0000
Message-Id: <20260315211807.411173-4-objecting@objecting.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260315211807.411173-1-objecting@objecting.org>
References: <20260315211807.411173-1-objecting@objecting.org>
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

