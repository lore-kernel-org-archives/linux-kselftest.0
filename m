Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B862D37CD3E;
	Sun, 15 Mar 2026 21:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609420; cv=pass; b=dkIk7eU7iuIGuvViGuR7WOzhtkXd2ypzbfvQr57qA8iU6yHZxKvFJqFPMg+9O8k56n8wT+sb0EVNxonI3Uf53mtw8xvgYQkCw0Ebz3C14WJvBqSZ/snYsqJ9ri37FA+coiNu5O4Qllwsb1gTjZ5xBdKzNiChPS4mOzhfqc6dpxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609420; c=relaxed/simple;
	bh=ynosWAVdTZjwHIldBKnJyOHFf6YCnzrYK/oMhyqjJmI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sM1O+I3Y8MkqpcnetIemRbQ9fPRofuPwSD9ZGslwoRW+kfVbuONsXtLEU+0z6MJqTqHe3ch3pQ9HVYS8TPJkazwf/nzBTG3kWUuhrUJCgqcBH5NnRoMNZ2bQmteAJlRVED6pm9xcNiQUcpzy3Q476lJ+IoYJN/+Ht/rhl9PFwIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=brJk9q0q; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="brJk9q0q"
ARC-Seal: i=1; a=rsa-sha256; t=1773609407; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=chiN4gIxo0hfVrKKVuDiCdQ5EaQ98yniXABHBmWoKRF/geDAPZSvCtS9l0YQGxe3FQPPaB7SVwYEt2CRyiwohHZ8v7v8d297EXKwFhjsn7KUECY/+BbfRIlUv+2QUDM+9LTQIfJUHI0Pk5i1TA0uGOaRTpH7DDj0iljC/F7usSg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773609407; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ueSZI5AfyJ2dJY/ym+gJvwLv50twR0Whfk1qSI94zoM=; 
	b=CB7XBeJSUKXvy8PO9ODREv9Ep/eVIfz29TsL4a1RC4v7m88qIz4u28R5xfNTed5MD591vzohULzXSSBsWbnNRq938BpZhaICQ8+ZfFANUo1ERqxZcf5G4cyE+IbE0cyljGyQ7WUbsmSwTfdCLTEFmcE0TcSovOkzX7E9m7heMBc=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773609407;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ueSZI5AfyJ2dJY/ym+gJvwLv50twR0Whfk1qSI94zoM=;
	b=brJk9q0q3rN7RoE9kXMqyM/aQ4U8jQjXupnFvNXTdpgVLXqH4g1mnuOUAyHyi2Tk
	vKwQeRh+fTu4/1dBkLedUPtgh37bdQhXrJGqL4vzwoFMiOYDLIm8bUDvpUZOVzU44gC
	t4oF1YLoo0W5ODPZKrRdsLNGJAnVXbdzVG0i4WT0=
Received: by mx.zoho.eu with SMTPS id 1773609405416218.4258200308409;
	Sun, 15 Mar 2026 22:16:45 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v3 2/8] lib/glob: treat trailing backslash as literal character
Date: Sun, 15 Mar 2026 21:16:32 +0000
Message-Id: <20260315211641.408318-5-objecting@objecting.org>
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

