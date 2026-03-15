Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7137260D;
	Sun, 15 Mar 2026 20:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773605928; cv=pass; b=ql8+CSvT5bPSmxpB3aFTPkVi09XyNDKMmEnzAvwGmU4uWKr5If4plV/Zg+ZS8v6op3VDROgersdgDGnFbBf/rvjD5M3eihXO0VwOxxHhqzSeW/0S79S3kc4PG+Ap3NFxyQ7AL1cCv5vurdSNh42L5C7GncWvPOypbIZOVQIRyEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773605928; c=relaxed/simple;
	bh=TvoodWqX4Zt9qaZn8/cmtP96TLJg6Fl3uNkMx+/OM/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GkheNPiFEI4p2smEhZ2PZgVtRPVfFfC0mnR+2zTh1eICUoMi5Q207CpoMtuMfR+oGZ0kD6EPpfX6KRDl5NHWZ2fJ51KsughkmmT7O0jNdzVtdtFYZQbYqxC3bzr/F5fg9EXSY7Ix14X2z+GZjK5vhLMrsNcbaViq5dLL4nYSZyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=G9YiP62M; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="G9YiP62M"
ARC-Seal: i=1; a=rsa-sha256; t=1773605899; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=iMO5rkVZil4xqap4z7PGcVxxfBRle3SMOFh7Op9OEMKgxckpOSksXOnlW4UAJgJ+evQ2HedIcj4PeFknMhQV25yhdR8QLmd0J42+lqzjiX0W6N+WQTmLrXy/TSKfVl67/WrPmvJl6NNZA041P14hvdIF5/VM/9HLKcuhSeplhb8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773605899; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IKJGSUF4neu8mf6CKhF1x8j3j8JrAeeYnr9Wq9xiqSo=; 
	b=Eq7DDB5T9eDeIFTpk2acAAbiNTtDkeACbZqPXH4fa4IN7bSZfmNgW9VokhzwW+CXd/7SvjiR48lC7yXHB26pRoCD+ysnxOA60vTzFkrsjjlIL8F+AFS6+CXH3QiPPfwZGUptWX7LL5+NE/zOzt22xz+MtSvqe1XiU1eLHi2iNo0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773605899;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=IKJGSUF4neu8mf6CKhF1x8j3j8JrAeeYnr9Wq9xiqSo=;
	b=G9YiP62MSDYMqlSoAR/ziqMrltcy9SZCES96/58tKOjfadJlFo5HbGUZK9p1ISgE
	3NKZJSEfg5lNqglVwEsG7HN1izpjEGTx6pRQgOwkmanJxsaleSDMXDeP/bt4Io6IVwO
	iOaapeqE5pTHswspp5xHWxqB977ODNqVBS5dbg7w=
Received: by mx.zoho.eu with SMTPS id 1773605898407517.8260685904943;
	Sun, 15 Mar 2026 21:18:18 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 1/8] lib/glob: normalize inverted character class ranges
Date: Sun, 15 Mar 2026 20:18:09 +0000
Message-Id: <20260315201816.362559-2-objecting@objecting.org>
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

