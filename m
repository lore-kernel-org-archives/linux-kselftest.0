Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F54B364045;
	Sun, 15 Mar 2026 21:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609417; cv=pass; b=QAsOznxMTIQDYICnDq0awVYODxPyFCYb5TzDaC2Kvos+LGRI6VuC5DqKmot3SJUjbbVHPBwevz6eU8ASTz4S8qoe+6t+vaD5ZFYhhKZ1hk5luGOtTYuvf+43G2FxrNIKD8TRRWK1CSqZyqEyCEUKMidOQeelSeRWKXa+HxHQ7sU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609417; c=relaxed/simple;
	bh=TvoodWqX4Zt9qaZn8/cmtP96TLJg6Fl3uNkMx+/OM/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UoFdGsAjCDb9LkYZC43baPw67dzfdg0ldIcKyqRdFnGsT94QnAnncTaCf5gTS+1PPn80QmLKXMb5xTW74ZM/K5iIl7winYIphohxvDn9QwmX4bAUkEGatDeG5O4q8cwWd8kYSw8oaZMvF4mxvkOXckqdoDssvaO7X/OevKJ8W50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=h5xlBtQc; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="h5xlBtQc"
ARC-Seal: i=1; a=rsa-sha256; t=1773609406; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=DsZldlkd/UBh6TfV+VHX+s1TRPO0SZ5H9vFvhicpZPMvqIHMzSjAJQgn5WK69hdvDeNEF1lJdU3h5GQQu0kQ6OqEJpCCjilCf+rFHJR0p9BaW9cyRWfVr6TfNKx943V0DMwsL4hKXhIj1L8EMi/TrKRRxk6kiN2ONeu/OrcK/wQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773609406; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IKJGSUF4neu8mf6CKhF1x8j3j8JrAeeYnr9Wq9xiqSo=; 
	b=QQZWrMfSMLFooplGjSEPcl+GZLbulxSVmKiS9WmXmurk5wLhPqzyuwHSnjCThN6X0aIgP8jhimS1i0WdFwNfT45ZwJLbzUV9lqxClW5GVcAQ0HEBQzqLLyB0g+zFJiXoeYHimkxpbKUBC84l8NMTXODm8z/ZSdC6BQCdfnNr0oA=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773609405;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=IKJGSUF4neu8mf6CKhF1x8j3j8JrAeeYnr9Wq9xiqSo=;
	b=h5xlBtQck2j9haXSZCGvm6+VQwVZ/OY5Ig96qg17//X6BcGh1Xcnc6Bce+/bNmZJ
	kNUQdxuGrN90FiutGh+ezPFjhqWGfrtgBxnJag2DI+vbpfOY45CS3BUrKwjeH9ieQgK
	gncmHn3fPK0UMxdN6B6qXCX8ezLp7iUIGgv4VfZ8=
Received: by mx.zoho.eu with SMTPS id 177360940411717.37568035027789;
	Sun, 15 Mar 2026 22:16:44 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v3 1/8] lib/glob: normalize inverted character class ranges
Date: Sun, 15 Mar 2026 21:16:30 +0000
Message-Id: <20260315211641.408318-3-objecting@objecting.org>
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

