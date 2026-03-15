Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E55437B016;
	Sun, 15 Mar 2026 20:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773605921; cv=pass; b=ecy78ecHsH+rzd72HG8I2NCdrKJagole8y11QSgH0SoHnoHr/kzKdZe6/TPZqp55KgfMXih3/N9M2cOqS/i0THdaMmKBl42baOHDdzteFPzfmOWdIo+VYI2X8xnxqcIymDSoGYB758AmtZuMMzJU0pYEhP/wmtFtZb+6Osi6OBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773605921; c=relaxed/simple;
	bh=MPc6BFCGSACM368hqh07vzRexP5rxqkSUbTOB1V8GJE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EKGqhnhfbX1+VWAAjHrjuAKL5lAJ9ZRwdwz3TwWyjYTmcnJqN0upr1KxyaCCthoA9cEEBIPVIZXdvXhoG/k46xue/JeO1BK8+x40xj3a7RaOebHKDyxXWO1djiu5j2hFXSoEer/yclx2dsPNznau6YCUAX9aOKD4oyCBy0xb2D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=UU/QDsVx; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="UU/QDsVx"
ARC-Seal: i=1; a=rsa-sha256; t=1773605903; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=lHTeTi0WN+nWDz3fVfuNwSJimy9fl+bbjaOforw1vf/RggTWwTm7BLc0bvlZfp63406OiBoF4k1+QwqXI/ZYX1rSmOACTE9qan6qcUzDSQvp51NGT+4hDMiWxevdU1Zoxhz8m0IOqzDoT2vLc1aiQP1lOVBJlVkhgMfAhyGI40Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773605903; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2WBm7tkyxyrrzugqbtjBKtsFz7871CMH0LPPBAiszcQ=; 
	b=YIosLydX5M3FgZ/jzUx4rPARfV0eCD2Aou5ZSJjUMyAMe7ZrA9Cn8vkfDJ374AW6GcPyCI19ym2YZBi0HobnzxizUsuIz8pct2wDRGgklPhfgO8kMEaskvLV6gDmLVUFvs00+e2mdAmO7ffKc8BTi5o4lR7DlAt4PMhb+Jukmfk=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773605903;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=2WBm7tkyxyrrzugqbtjBKtsFz7871CMH0LPPBAiszcQ=;
	b=UU/QDsVxwBNu3lB/AZjbs4b/UYzhhukJvAp1hZqeJfHXnKxGYF1r6tzzpOcEGjwy
	pxTXFwfj5OLQP+LaRAZ4m+wyY0VSFR3/I/WXbqiCfeAWMUKeETuJYwyTt500+wDpwxb
	4c+FKjb4NFF0zQrT2oZwm65QUEUvgDvZBHaOgRcI=
Received: by mx.zoho.eu with SMTPS id 1773605901032232.15027274943418;
	Sun, 15 Mar 2026 21:18:21 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 5/8] lib/glob: add glob_validate() for pattern syntax checking
Date: Sun, 15 Mar 2026 20:18:13 +0000
Message-Id: <20260315201816.362559-6-objecting@objecting.org>
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

Add glob_validate() which checks whether a glob pattern is
syntactically well-formed before matching.  It detects:

  - Unclosed character classes: a '[' with no matching ']'
  - Trailing backslash: a '\' at end of pattern with nothing to escape

glob_match() already handles these gracefully (unclosed brackets are
matched literally, a trailing backslash matches itself), but callers
like ftrace filters or sysfs attribute stores that accept patterns
from userspace may want to reject malformed input upfront with a
clear error rather than silently falling back to literal matching.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 include/linux/glob.h |  1 +
 lib/glob.c           | 44 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

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
index 9c71ccc15abc..800163ed4dbf 100644
--- a/lib/glob.c
+++ b/lib/glob.c
@@ -186,3 +186,47 @@ bool __pure glob_match_nocase(char const *pat, char const *str)
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
+		case '[': {
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
+		}
+	}
+	return true;
+}
+EXPORT_SYMBOL(glob_validate);
-- 
2.34.1

