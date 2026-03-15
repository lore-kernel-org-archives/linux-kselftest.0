Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB1C1B142D;
	Sun, 15 Mar 2026 20:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773605917; cv=pass; b=q8n0aJDT0XpPPO7u9xqCff4heIK0vXqq8v216TsWUlOoQnmhROhklvwTGdXGoMc5ip3E8WEYneKITJjXWgLhcNfYSGy3Ld9nz9VZ8V0J8ubMmXhbicJp5tvVP8aWtIPPRGdFS22g2gdAEhuSpa5P+HrBvj5wB6LJq6jTh5esKmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773605917; c=relaxed/simple;
	bh=ynosWAVdTZjwHIldBKnJyOHFf6YCnzrYK/oMhyqjJmI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uMGuniaUyujwpzDgF/SDD3UDXi2eWYvDT4BbJjXHPHb1p1eLdJ0uF/3MqEq6Ou7q/5GrGNhu8o+hoFgy/6Sml9JIaddxJv4xfJe6XTXnn9SieDW37197Oq1hIrZFQyE3RpO753u+YevtxU1qndupu8lVV+1vpvUHn5DCYop76yQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=hqCtVocb; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="hqCtVocb"
ARC-Seal: i=1; a=rsa-sha256; t=1773605901; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=jwrvhCdloAiOwVm04ghWTPy9MlQd+hVTA2niZU+cmMG7FbrLrCDbPnRLId4AfArEZRj2UtqsK5iL2xsgrz8p+bj4RIHIzKR4OMB4yZqggW/LJsqRAJoCCe+Q6Um2jcRRBH2t1+jaOWo8abhMJVX9nVxOLl10FmkckcBeEn3Ymbc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773605901; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ueSZI5AfyJ2dJY/ym+gJvwLv50twR0Whfk1qSI94zoM=; 
	b=NQVXi0yyAmh6340zM3nLahuTAeRSrnIhN+rBi74S0l6kBdAnfKc7S8qzrZ3urEoMKOcM9qEabnrT7Y6FZl2ycs2bFQChQx8ZV36hk6Ci9NkawXl/H2tUiCFfHxKFPTXZBGXV0e5j5y8WBsORCXG8qESDosR5P6HVNXzSfiir/rg=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773605901;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ueSZI5AfyJ2dJY/ym+gJvwLv50twR0Whfk1qSI94zoM=;
	b=hqCtVocbGAScaNMQqVtBWiFqwYueNl790mulJ/yQs1sXsDywMZj6IMNkzffCcM00
	suT6MUp/1ZkPCbeRU5f/KNjv0QsCDGJF3o8vkyFF0RaNllV64CI0aYVxOR2PoChC7U5
	lneBT5Ovt+g2VvyBl1F5871eRSYyAoRSgUBtozKw=
Received: by mx.zoho.eu with SMTPS id 1773605899046757.2274425986716;
	Sun, 15 Mar 2026 21:18:19 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 2/8] lib/glob: treat trailing backslash as literal character
Date: Sun, 15 Mar 2026 20:18:10 +0000
Message-Id: <20260315201816.362559-3-objecting@objecting.org>
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

