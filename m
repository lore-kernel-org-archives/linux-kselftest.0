Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA8137BE8D;
	Sun, 15 Mar 2026 20:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773605927; cv=pass; b=gCfIPW4BusArP+GXaIf5e+JYLc6JSE9GwW8npdccku8uAg7tbeOg7D5sJtBMxk9FqrcSD//yb5mX7910oX4PCg3bz5cU/Qm8ZwHVFi/3uSMK5uKrYaXiMdlP2EQaSFVrfRXxYqzkWympcrZTHqg193OgcGENwVnjT1Ca1dJznDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773605927; c=relaxed/simple;
	bh=nDNdIz9w1v6GX9HKPOLSEpcSx9VPTmDZ0uZ7Lf2JPJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lqg7/mCft83MMX5EZxtO/UeiMoo7tzWzyL1+4a4LbZm4Nb0IGFwJpoBLS2BGWbqWJp8A1bR9BPURetDmw9mEtv/60U5lS7mlA0i2Pan107ptMXz4e2GvQ3DVZMxzBLuOBE2DPlSRz87Z8IdUaiU8gs/NcLNQp//Hu1vstaFbdnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=hVbAphBK; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="hVbAphBK"
ARC-Seal: i=1; a=rsa-sha256; t=1773605905; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=gS0JqNsZ5Wp0G1oNtIrWYd0RqfhRhA9e8ZEsqdujJ3EArdl/geopXwzZOnlBaelGcIIOi4VAV+uqbnfiXPGVlfRCkHkHNyihUwbgWxoutwQl8UYnbuSNoo1iWk2STFgoB4Nz+x596DCb+0kFzkeCJdd5n4gpOvxFSCID/fgu0gU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773605905; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x5o3NZywWI/GlA27vRpItmX4VibMyB/hLnI+Hl7u6to=; 
	b=YeA+u9XuDqq6vqLMHxAVTSYj0h3X8YdnXe3IS3OLOIskGGy4KX7dnFIs32JuAE2Sisee3zZCzbrNfodmPqRppBZ0MW3hC327boAWNQovio7u3WuDn1qJ6eB9vm/itlBdZ5NtC8nu15zsH/B8A1Q+W368eNzkv1DagxkxSyFhdlg=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773605905;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=x5o3NZywWI/GlA27vRpItmX4VibMyB/hLnI+Hl7u6to=;
	b=hVbAphBKXsZqcMy4KjzS3AUQ3b04q3AeyQVYS8y1oKQA06QCebMuuFst6wstTMQM
	por6JHJHGzRZtVB9JrpYTNqE65NoyOcJ5Jdy7jX9QRjkA8ZsTw+peL2d9COiSZUft7a
	WrOrJeqrQYMajFpVk4aYmU81naGP+ggE94fyxtpw=
Received: by mx.zoho.eu with SMTPS id 1773605903081814.8605519676821;
	Sun, 15 Mar 2026 21:18:23 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 8/8] kunit: validate glob filter patterns before use
Date: Sun, 15 Mar 2026 20:18:16 +0000
Message-Id: <20260315201816.362559-9-objecting@objecting.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260315201816.362559-1-objecting@objecting.org>
References: <20260315201816.362559-1-objecting@objecting.org>
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

