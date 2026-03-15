Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F315C37C916;
	Sun, 15 Mar 2026 21:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609428; cv=pass; b=NJasfA05yTmfr4Utnq7u5XOJGxZ/Y+afZ4OiuOHFXcPdxuq8HOe0wi+PKIcq+an/JgqvwLWvx5f9xHr/wg3kmjTPEQ5E5KJTZXIMguNDBZTQrg03OdMHH5TLWKgQyQr0RppFc3XrYHo268tkbHV13L+WLH4s9RIdk+9y7lOdfBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609428; c=relaxed/simple;
	bh=nDNdIz9w1v6GX9HKPOLSEpcSx9VPTmDZ0uZ7Lf2JPJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=if9hEJJ4V0oeHUISwttBFoUFN97fY4yGhCxi/maMXHMF4MGvM+hBw6OYWmLwAntTwNZI47FCjoeh3+CjYymHCGIvrcHUqH1i8/wWktIsA1ufk75b7tpRxYL4e3/2VkjA4/DgNKvmWZLPOI5AbUKx0NvmNDy38pql9f5sDO/RFlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=MQoCZPfA; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="MQoCZPfA"
ARC-Seal: i=1; a=rsa-sha256; t=1773609412; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=A79LWGUHiBGd6hZ14+/rGkKCS90fdDybm8lmdpHW5uwvE3S0Bj6PfsBkQqVmmefj9sYs7Voep2Eb+tDZ5EyvSEv5mE8tPuLeOa215bj5QKzJd5Fg+Rkd7lxwqs3ePh1veA0LS3HlFnCnQVksAjjePfXs+ZlVUQa5lBizMTgHGzE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773609412; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x5o3NZywWI/GlA27vRpItmX4VibMyB/hLnI+Hl7u6to=; 
	b=aCEIasKyOqoW7mbO7m9uwp4XDxvseoZJ3OtOThVr/Isst2V7apkidmUsZu+37LUaadYPJBKgmXBhpVgzM0BPiliagYjr9Iv1FB09vMn7Rb5TdrMBvZEDw0zFgR6te0EkJwCUqWL2k/8+DyqJQsyU0MtqF1PU/lW/z0WySz2rQBk=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773609412;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=x5o3NZywWI/GlA27vRpItmX4VibMyB/hLnI+Hl7u6to=;
	b=MQoCZPfAaFkO+OAeQ/o/tegzYfrQDPNgKrvI8yPtk66vDhIW56cakCuafNJT6Hvm
	F+fbJqa7GsQsHpB7ykAOoUz9p5y3/WH6NbSBfjFvAiUNC5VCjpxsVm75z1WGZWz4UQr
	oAOoxxeGo2LgS4dETelyYveD7VK4HOyv2IeAOZAc=
Received: by mx.zoho.eu with SMTPS id 1773609411488530.2548253520487;
	Sun, 15 Mar 2026 22:16:51 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v3 8/8] kunit: validate glob filter patterns before use
Date: Sun, 15 Mar 2026 21:16:41 +0000
Message-Id: <20260315211641.408318-14-objecting@objecting.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260315211641.408318-1-objecting@objecting.org>
References: <20260315211641.408318-1-objecting@objecting.org>
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

