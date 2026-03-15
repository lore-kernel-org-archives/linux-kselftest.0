Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC0437C905;
	Sun, 15 Mar 2026 21:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609506; cv=pass; b=hBYBGgF+1g0ABMhPmoHkhZ4Wz+2nNatN1J3VQZJpUvH7ieoWDs856cotpoKsM5UaGQlp660dZakMWL7Yn5ZifqpLdCDuIIF0nfzPsg/0Jnp5rhaT9WJF5wHqN4XQc1LRzf1WdNimbNgagdtbG1AKYtAJxymr8qP4v3YRn/CLmyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609506; c=relaxed/simple;
	bh=ynosWAVdTZjwHIldBKnJyOHFf6YCnzrYK/oMhyqjJmI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iylygffwPn5vQc9BYosiZUskB2E30NCd9udvOYuT1CqZrzVt+7dzDtnE9uNsHrdt/4B2GPM0wAx5NQMqAllkgJDXXveytzuKZGL/j+JltFY7t+DfuCTVT6I8RmM4a+lnwCDh0sXbYqZJ3Zf0V7qXiT5hkZaVEnn/yZgLqoMtpPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=MO0+nxCC; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="MO0+nxCC"
ARC-Seal: i=1; a=rsa-sha256; t=1773609494; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=bqAhOLkT7Icvu2QqavJL/iw51LDrPG14Z0VNsGbSIf4DSGfJmOWPe+YlrEbOIx+T8Qp6IRGv6VvV2ZpyOeV/IVpT4spAaNMi5Hki1bE1jV7BlxjljTqBDHhX9+0GULgUKgHe7/qPib2mOa4C7UXiF5Gn6EU/WPm7xu4FLQBD/O8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773609494; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ueSZI5AfyJ2dJY/ym+gJvwLv50twR0Whfk1qSI94zoM=; 
	b=eDWt1RpSLmHMpK2Nb3O4KrJt1cPoMvxUZStfGXgTqhVIFXMLplWiFi/0O+nJvzFBjerCCQJv5dezFK4r4/naljbR/m/hRGIvPPORyzeitC5BUQCDRgLhjAmy0IhWBmOmLwDaMZ26C3WeLSJarPzi5gpYav4d5edngE5Mg16O6s0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773609494;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ueSZI5AfyJ2dJY/ym+gJvwLv50twR0Whfk1qSI94zoM=;
	b=MO0+nxCCxDRN7R4yk/FiIJmKg9RdmoSlVXwHHCsTj52M3MTdmDlASLU4e4kjFvZh
	hhYb6V3ATWUBFLA54Xp9qFiPcM0Tq7cqvSRtvY5T1HsrHXd0qYk+igzzA44ug/ohn6o
	HpQa9ikS7runi6O7gnGGObNvcGWngDPnf2T+mbAw=
Received: by mx.zoho.eu with SMTPS id 17736094910331006.6615326755374;
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
Subject: [PATCH v4 2/8] lib/glob: treat trailing backslash as literal character
Date: Sun, 15 Mar 2026 21:18:01 +0000
Message-Id: <20260315211807.411173-3-objecting@objecting.org>
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

A pattern ending with a lone backslash (e.g., "path\\") reads the
NUL terminator as the escaped character, making the backslash
effectively match end-of-string rather than a literal '\' character.
This means glob_match("path\\", "path\\") would fail since the
pattern consumes the NUL early, while glob_match("path\\", "path")
would unexpectedly succeed.

Guard the escape so that a trailing backslash keeps d = '\\' and
falls through to literal matching, which is the intuitive behavior:
a trailing backslash matches a literal backslash character.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 lib/glob.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/glob.c b/lib/glob.c
index cb45a9a47f28..df7f00619b1b 100644
--- a/lib/glob.c
+++ b/lib/glob.c
@@ -112,7 +112,8 @@ bool __pure glob_match(char const *pat, char const *str)
 			}
 			break;
 		case '\\':
-			d = *pat++;
+			if (*pat != '\0')
+				d = *pat++;
 			fallthrough;
 		default:	/* Literal character */
 literal:
-- 
2.34.1

