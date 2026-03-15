Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7253737C11D;
	Sun, 15 Mar 2026 21:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609512; cv=pass; b=KG0NCytmH75+NipcJzxpC9pWOfEIcGU7CLrW4BsVIkkKqAiWZUwT1a55Lr9oJiEO1f0/5Qpg7KZU2KsxkrzVQet/iJGLiLKHXBq9hIveuuc9xZ2DDjWOFPAAbVNynek7hq4kYigwzOIkUiU2sShQM2Pw0T0IZQEcpiPi674XcgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609512; c=relaxed/simple;
	bh=nDNdIz9w1v6GX9HKPOLSEpcSx9VPTmDZ0uZ7Lf2JPJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VhtR5k7fA1SnDG5pK0VP9fSn741HiO9Q7xO7SQUIlfW3f+74CzAKFqMbuIWDC8dgwKZCPerZ/DxvnAnDSlCeqPOIZqLnexz33XfvgLIxZOGsgjyhL7p4hMp+lPz6KOyVZVZskOJizH7S/qSOaPdLt+fM2IDq4wbJzy1TjWiUuHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=l36v47qb; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="l36v47qb"
ARC-Seal: i=1; a=rsa-sha256; t=1773609498; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=j2NQ4NaCPXhUZg34VA6Qc4tuEQhPUd+bVyGSoOyifS4zEKb1uACYYAgC1yEpmoe7nSQi7HgmPV0ToJa9CnpjWX8xF9QklCb+NDxUor9zgFJ7mOlDr2XAzzBeEyt3eQgHjOzGrXe2NlUqhM45fUix/5JdoMjWAWYs9BZX4NxisT0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773609498; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x5o3NZywWI/GlA27vRpItmX4VibMyB/hLnI+Hl7u6to=; 
	b=Db2IYWbuiG7BCFVihBBMD9gYCz65QuvpZ3Byb4Po/YpjllmPiAVXGEFYNBcBk2sQHF7xbUDIyPImO8VbGHozx4G6QAsuxWUdYq+dLeEBNRXG2mgZJgj4FdO0J3QiVZub85lH97UHSoovUUrSGrpE8CH3IvXXmMDG/jYtlOwUGdA=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773609498;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=x5o3NZywWI/GlA27vRpItmX4VibMyB/hLnI+Hl7u6to=;
	b=l36v47qbQKkOb7PfQaP9j7WCsgu74BQRK+YHQXkEiWo5xmX+Ys8HG6IJr8zIL7I7
	8GUPbegq6MnnmzpMrjo3m2k1gJedQMEGtGX3DLGyn3n7p3X+Kx0LlqMv6RWygz2+C6p
	tuK5W7gU7VOIyFi9Tl6NPDXmbmU81ph6E4DHkX5o=
Received: by mx.zoho.eu with SMTPS id 17736094951831004.9757762051256;
	Sun, 15 Mar 2026 22:18:15 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v4 8/8] kunit: validate glob filter patterns before use
Date: Sun, 15 Mar 2026 21:18:07 +0000
Message-Id: <20260315211807.411173-9-objecting@objecting.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260315211807.411173-1-objecting@objecting.org>
References: <20260315211807.411173-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

kunit_parse_glob_filter() accepts user-provided glob patterns via the
filter_glob module parameter but does not check whether they are
well-formed.  A malformed pattern like "suite[.test" (unclosed bracket)
or "suite\" (trailing backslash) is silently passed to glob_match()
which handles it gracefully but not in the way the user likely intended
— the bracket is matched as a literal character rather than starting a
character class.

Use glob_validate() to reject malformed patterns early with -EINVAL,
so users get a clear error instead of silently wrong filter results.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 lib/kunit/executor.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index 1fef217de11d..f0cc15e4b34d 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -91,6 +91,8 @@ static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
 	const char *period = strchr(filter_glob, '.');
 
 	if (!period) {
+		if (!glob_validate(filter_glob))
+			return -EINVAL;
 		parsed->suite_glob = kstrdup(filter_glob, GFP_KERNEL);
 		if (!parsed->suite_glob)
 			return -ENOMEM;
@@ -102,12 +104,23 @@ static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
 	if (!parsed->suite_glob)
 		return -ENOMEM;
 
+	if (!glob_validate(parsed->suite_glob)) {
+		kfree(parsed->suite_glob);
+		return -EINVAL;
+	}
+
 	parsed->test_glob = kstrdup(period + 1, GFP_KERNEL);
 	if (!parsed->test_glob) {
 		kfree(parsed->suite_glob);
 		return -ENOMEM;
 	}
 
+	if (!glob_validate(parsed->test_glob)) {
+		kfree(parsed->test_glob);
+		kfree(parsed->suite_glob);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.34.1

