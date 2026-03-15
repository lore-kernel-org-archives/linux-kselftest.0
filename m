Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021A037C935;
	Sun, 15 Mar 2026 21:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609509; cv=pass; b=fHN44APsxfBEWw7ahYNQ+IhuwaYaXIpmf66qOjmByP8zUzcmIsMOFm/X48RqaGYW/n3dEj39RQVEfXWh/SmxCv86mdy5Wt84jxXcNJgwTkdAo4J95nBY4LUwUtojQ7sE8i9PW8RNCCnHGJJj14Js9T1kbihCl3DdcXNPsEvLPk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609509; c=relaxed/simple;
	bh=NK8NcdJxCO2LV2WJNqfKBaNOOeGuUndAUUlIXnyHtxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Or333EtE14bncgX6hzEsr59Bgj7ydX5VnswMfFuQBu7y29CyMCKzZu9Ups+n7OeHjOGM305q5eMKM2DRfa7EkWUX3u1c2x1/23X9SXSLz//iX5YmiLo+/YKZLqBvFUXZsasABRC7d3wWGtAi/DiP/+CBWxuU6F9Vrw8DeEzT/yE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=CILVSGnW; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="CILVSGnW"
ARC-Seal: i=1; a=rsa-sha256; t=1773609494; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=j9/v+5bua3+bhcBOQTQ2VVeMdGwIgxR07xdEGeU5dPzL35KFTP6otf3+qYYtNY7xDGsIhRLXd515nMCJ5wmexfRuoK2UQI/jJBDRbytBpwfa/+5gxMzU3JbtAAILDaNFktJtnBizr+czSu8kspauroz6TWGIvw9PTubb4+zA3W0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773609494; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZH0GCSbT5tKftFXXPeA2gjcQUx1mgWMeocoKefb8MuM=; 
	b=b0WcXK1a2PYxC7t1IbQbKXFBi2EALNHeGL8bU1KURmJrUlahzFbjaPQ91sUR4Gj0GRy5eWSQ7aMSZ+h+R22mymANBhVXy/bJZ9m4WysGVwjmUqfiicBru8V8W8o/tts33uzrq9SlgITZwtgIWUXoxBAfhETgsCtjRMqh4ksN5jw=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773609494;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ZH0GCSbT5tKftFXXPeA2gjcQUx1mgWMeocoKefb8MuM=;
	b=CILVSGnWPEvRdYjboZp+cAJpoZupJxfEHFvmHNFga75YCg6O1KyLyPAYTlrCC+Em
	NpLPoqFNmz8gK0NQOE6+f8Q4Pel/DyoB7l4gYphIUrx1MIF/GK7xCg12jTQhLF1WYzj
	KkFWk1vnFRuegMOkBZ3JNNGZkbWjLEqBPsT4QhAE=
Received: by mx.zoho.eu with SMTPS id 1773609493106193.04598114097564;
	Sun, 15 Mar 2026 22:18:13 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v4 5/8] lib/glob: add glob_validate() for pattern syntax checking
Date: Sun, 15 Mar 2026 21:18:04 +0000
Message-Id: <20260315211807.411173-6-objecting@objecting.org>
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

