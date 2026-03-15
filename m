Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C8737C91B;
	Sun, 15 Mar 2026 21:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609506; cv=pass; b=ZcVp+myt89OOE9c7TINScWmdQgKucOYdXJps6sOQhT8N81lLQyoPnawOwbR6XDyNx0B1loB1WoqdKX+h7IqTmTWaaNQZtbK6kXXLrVCCJBtGoZJ3NP8YVYGxfgSdsQHfIJ6pNe1IaGzL4REI9QLbznZmoKYVxoRr7fNPFMsgrM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609506; c=relaxed/simple;
	bh=TvoodWqX4Zt9qaZn8/cmtP96TLJg6Fl3uNkMx+/OM/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P0yLiXqYiEy3bc73K6AtugDsT5mt7vXbdAWv5E5CfQ7CKfY2HIyUwCTmgVNNzJX/vHaFqZ7x2mRyaIcxymWFAoxT9aLN6D+z5Hw3UZWNaaNoo/5UigKvb3x+N8HF0evV+XdFi4NlhbfbcWx4JqFZcbb9u1DoxlCXy7t8COqUAJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=AgzFNifG; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="AgzFNifG"
ARC-Seal: i=1; a=rsa-sha256; t=1773609492; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=JH2QV2+2tcbhefrcjvhF8EKq6bja82PNdSM5r5YyLMe/YX4O+vgpcZ0eU0K4B0XTDYAKijAG/jlMyQzWk5ve0sZ7Qd98wnAxfqmO4QZqnqzCUE9HQoZEMpzxQ/77vXXfMkTBnlj3JXAw4HFb7Lot4bEDGi+0l65Is037WsgeLRc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773609492; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IKJGSUF4neu8mf6CKhF1x8j3j8JrAeeYnr9Wq9xiqSo=; 
	b=Nq0cWZ1GeXglfN4nMjMn+qda85lIGWIs7rjQq/yR8tW3ywp/3G5P7bom4h1Dia8snHvzAiJNX2n523RMqkJiX52sH0svgILOh7DlwRe/BURYeWzmKPyPx51WY0BLWgEaqV+xAnq69WRB/T9N+oBVALNx/LIZe6vno/+gasMRRJE=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773609492;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=IKJGSUF4neu8mf6CKhF1x8j3j8JrAeeYnr9Wq9xiqSo=;
	b=AgzFNifGd6vGVqNDdpTgmh5TAfb/36LAaAQoj0gYqal1y2pkOkk3xwTGCltD8/EZ
	JZlszpqXYxYKlU24vcOU+X9dv1GFIdPxJGf/8EaiOsOBDfz+mAMU+Wq3nngwhfzpKWi
	AnPTTtjIvn4rAjEZPc4boA1jYF4MawqDKTNVkzxs=
Received: by mx.zoho.eu with SMTPS id 177360949036224.816485491883782;
	Sun, 15 Mar 2026 22:18:10 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v4 1/8] lib/glob: normalize inverted character class ranges
Date: Sun, 15 Mar 2026 21:18:00 +0000
Message-Id: <20260315211807.411173-2-objecting@objecting.org>
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

When a character class range has its endpoints reversed (e.g., [z-a]),
the comparison a <= c && c <= b can never be true, so the range
silently matches nothing.  A pattern like "file[9-0]" intended to
match any digit would fail to match anything, with no indication
that the range is backwards.

Swap the endpoints when a > b so that inverted ranges behave the
same as their forward equivalents: [z-a] matches the same characters
as [a-z], and [9-0] matches the same as [0-9].  This is consistent
with how GNU fnmatch and other glob implementations handle reversed
ranges.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 lib/glob.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/glob.c b/lib/glob.c
index 7aca76c25bcb..cb45a9a47f28 100644
--- a/lib/glob.c
+++ b/lib/glob.c
@@ -94,7 +94,13 @@ bool __pure glob_match(char const *pat, char const *str)
 						goto literal;
 
 					class += 2;
-					/* Any special action if a > b? */
+					/* Normalize inverted ranges like [z-a] */
+					if (a > b) {
+						unsigned char tmp = a;
+
+						a = b;
+						b = tmp;
+					}
 				}
 				if (a <= c && c <= b)
 					match = true;
-- 
2.34.1

