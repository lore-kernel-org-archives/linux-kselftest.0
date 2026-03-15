Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA95373BEB;
	Sun, 15 Mar 2026 21:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609418; cv=pass; b=Wkt0b0adkfxyu928NHNmAh5FWSMYX4mdqu2EsLWHPuPLexA2dFKxqA8dH2H2fz1g2SqdDmRStWN5EjelXi/x1hIb+us0Q5w6VuriqSmoc6sDVSPstV6389PPBDOuVT6PsRXq+Hw/Iijeo8uEGpH96h8/kh4JNqg5DQrOeo2yHZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609418; c=relaxed/simple;
	bh=NK8NcdJxCO2LV2WJNqfKBaNOOeGuUndAUUlIXnyHtxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H3nW32DntJ/09nfm/X9xZ6nlF7XDTFEnhhVVMIVhJpWvX1/IysAVhvr/JPZEkt5XHi+NapjrEQLMXpTTRPJiuiv2x/zuLh1NAF834p/mqVaGBFIKk3j/yHOsikdJIRWTvydpJXoZV3rMps9u7czoilbwIVJibIVKQjqLqr7u6wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=DQbuRLv9; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="DQbuRLv9"
ARC-Seal: i=1; a=rsa-sha256; t=1773609407; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=MQr5XGHJXKJkbYEZIeuTv/NsJcK89hPd7BCNpq94AXLqojHIQSpBNZxclUBvtv5do+OUo7RidLrzfzzhRk5vTUmgxYehVrTuBfYOL2G+y5Y5D6/4qyIrPGAz3bjugbMfrju4vdYfy6SO2eRF1FT6wXhzyQpsvQAqKFCupFlr+iE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773609407; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZH0GCSbT5tKftFXXPeA2gjcQUx1mgWMeocoKefb8MuM=; 
	b=gbkh8yxNkntj84QwT4Hz3Gx2EvbZzyRFi1rcXT1AbOtbQU1lKN4AV4AgJY3NeYUCFc7LcwsanVmiHsYlK4jTKq3jG/8/hcZc9w/YCsC33k/XCsYBX7xFJkGRvOZElTzI8Jd/LjveOHtnV5TzNJlRB0bLS1NnAGB3dfMb7sX7OrU=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773609407;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ZH0GCSbT5tKftFXXPeA2gjcQUx1mgWMeocoKefb8MuM=;
	b=DQbuRLv9JvoJc7Q8K+e9f2Yvkwc6bxeSA98uSjeUwyOgKPmeacZqsyURquQQbmmG
	ckwZxyBiyS+XxFNya2+O14HhGA/PDkwcjNbWDOE0ikrGxQ9fLYDKn8RIBfcGwVrO/rz
	CXCfKh47gIOWY74ZiS2zOIvrn+LpFvNwsBvLGcQI=
Received: by mx.zoho.eu with SMTPS id 1773609404755626.5514401154636;
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
Subject: [PATCH v2 2/5] lib/glob: add glob_validate() for pattern syntax checking
Date: Sun, 15 Mar 2026 21:16:31 +0000
Message-Id: <20260315211641.408318-4-objecting@objecting.org>
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

Add glob_validate() which checks whether a glob pattern is
syntactically well-formed before matching.  It detects:

  - Unclosed character classes: a '[' with no matching ']'
  - Trailing backslash: a '\' at end of pattern with nothing to escape

glob_match() already handles these gracefully (unclosed brackets are
matched literally, a trailing backslash matches itself), but callers
that accept patterns from userspace may want to reject malformed input
upfront with a clear error rather than silently falling back to
literal matching.

For example, the kunit executor accepts a filter_glob module parameter
to select which tests to run.  A user who types "snd_*.[codec_test"
(forgetting the closing bracket) would currently see the '[' matched
literally instead of starting a character class, producing silently
wrong filter results.  With glob_validate(), the executor can reject
the pattern early and report -EINVAL, as done in the following patch.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 include/linux/glob.h |  1 +
 lib/glob.c           | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/linux/glob.h b/include/linux/glob.h
index 36527ae89730..deceaa2e4a74 100644
--- a/include/linux/glob.h
+++ b/include/linux/glob.h
@@ -7,5 +7,6 @@
 
 bool __pure glob_match(char const *pat, char const *str);
 bool __pure glob_match_nocase(char const *pat, char const *str);
+bool __pure glob_validate(char const *pat);
 
 #endif	/* _LINUX_GLOB_H */
diff --git a/lib/glob.c b/lib/glob.c
index 172b8ba3cd8e..8ee539d19cc4 100644
--- a/lib/glob.c
+++ b/lib/glob.c
@@ -186,3 +186,46 @@ bool __pure glob_match_nocase(char const *pat, char const *str)
 	return __glob_match(pat, str, true);
 }
 EXPORT_SYMBOL(glob_match_nocase);
+
+/**
+ * glob_validate - Check whether a glob pattern is well-formed
+ * @pat: Shell-style pattern to validate.
+ *
+ * Return: true if @pat is a syntactically valid glob pattern, false
+ * if it contains malformed constructs.  The following are considered
+ * invalid:
+ *
+ *  - An opening '[' with no matching ']' (unclosed character class).
+ *  - A trailing '\' with no character following it.
+ *
+ * Note that glob_match() handles these gracefully (an unclosed bracket
+ * is matched literally, a trailing backslash matches itself), but
+ * callers that accept patterns from user input may wish to reject
+ * malformed patterns early with a clear error.
+ */
+bool __pure glob_validate(char const *pat)
+{
+	while (*pat) {
+		switch (*pat++) {
+		case '\\':
+			if (*pat == '\0')
+				return false;
+			pat++;
+			break;
+		case '[':
+			if (*pat == '!' || *pat == '^')
+				pat++;
+			/* ] as first character is literal, not end of class */
+			if (*pat == ']')
+				pat++;
+			while (*pat && *pat != ']')
+				pat++;
+			if (*pat == '\0')
+				return false;
+			pat++;	/* skip ']' */
+			break;
+		}
+	}
+	return true;
+}
+EXPORT_SYMBOL(glob_validate);
-- 
2.34.1

