Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874379;
	b=ylmrgEIEmXEAhgZtVVHByWHtJ/dwvlOc67+kgDvrK5xjMmEueuLMHNFn8kv5dovb8whE
	 K1ogb62z1yzxgvZQw5QvQUo8vlTnjAWVhpZZfRq7VAkH7/uDKegMh+HZ70nSfRMmYBz9E
	 Mt+zqsGo2q0oilF6+DxahVJ5ROIlGKDegJu87ngNYFNs+pPLnrxbXaFbvDJDB8q3RWHty
	 /4WWu7vv7fmNUN1piK6dN3sfJmYcfBoOKaUT53R3HEm7g0/xM5dIp3JjdWF7Ihl9nsw0r
	 j531d9JCJJEiAoJhT20qNONisQ0ChXW5OsGyT5g2xRrmWWQbEpKiBdvpw4IcCQ/Tv8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7sCcp9GVaRxjsnZJno3GxOc2KDrFHpoSBIpls8ghdgQ=;
	b=Y5JvHZk4PP7cv5Eeopa5+gjCgk0lOMdVt9+swI1S0VTSrgItFhcjEaYWY1J/N+tpapoL
	 oMUAKIQ4BrMXllTfh6oWMq0dsBBgNlYX/+IAwJKmdq8QyrZgYwG6CB7jMuaNVC3X4XV4Q
	 NLGbAwM1eA0Sw3sRU4h5zDhwCygh7IH0LgBG5JFjMoASWD7OVpk2l0gMRvUHUEd0OT5bZ
	 rV7g2sOPedpclZhiaMnkdNPCjAFSwjyK3b8pRX+jaQluEt793QoZ9Ul+XVWOn7FIj7pRX
	 80NzpHjSbhcXU09JmL5mBzS8rwzupBalH67xjZK4HeLab3qvyewEcQnw687b8Nf+Rrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PMy7oqnb;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6958D606A326
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 20:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6958D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PMy7oqnb
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35c76e9614aso2965200eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 13:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792874378; x=1793479178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7sCcp9GVaRxjsnZJno3GxOc2KDrFHpoSBIpls8ghdgQ=;
        b=PMy7oqnbMqRkj+wlnM5ZI1BakhZ+3ZaFxEmgkOIziba4zAuFu8XH0mG5P5Yyai1H/x
         +QH+oK5OGdRNCa7sQFJV0r3uwyCNlybfzetfkXQCdSXhtWwMIYN4XSsw2/ehCbjHMx61
         /lUzF/kdZF8nGIwY8qI4yJ7YkI0kEqIe9gJBG9mvSHmV4lh34Kx9egnyECo+L/XAkAKs
         fcUAX3Fxrmtl7mnFyiR/AZrquRq8Om+TudZByRYZm5QWNl88CNw4UQ6U78BcJTtSRwcr
         b6Y3DoAYYNwhyJ69Q63fCQlrJaywk1UXgeILfti365/f0Sm1qzpquWykLni/Hq8wBnL7
         /oVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874378; x=1793479178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7sCcp9GVaRxjsnZJno3GxOc2KDrFHpoSBIpls8ghdgQ=;
        b=ezZVoOVYUDUsSQLet+3hIIGBiwljceT0bHdTluom/1IfYeD6PDYX3DVKzKh390uy4y
         5prjFTDutZ8nlDY2WA58xHj0Ysg3J9r5DLfMLQxwyNq9tSpaqlHC8/W4zR+ljgihK0na
         OoepOdJ6sJrY045VGHRnoVthPDTnpeBb+We8xWiCMlTO3G30XeGbP+XWSw4pBakP98qW
         CDgr3PYgONxvbOX/nKIbkx+L9EEZP04Iv50BZJAnvBLtnbOzbFV4tPgoL5LosLdRssET
         ZCm7eV32Dtx8z+mNtM7LKAHs6jaZ8F2/fgxFYozGhBXNCvIQB+Oqjq5kBslkxrRgB4e1
         dLBA==
X-Forwarded-Encrypted: i=1; AKwUvBxb1e2A6asXyfAgJ4dm5AS1InFLxs0ADvst0Mm8yzc0ggqWg2z618VtaSSFNf7TxXJtLkQ6l4zp4rB0atUzj8A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmvVV0DO6SQJ3jJRrnvGH18KeEVnxghiWKj/HXI/Te4xxRGrfN
	4hW1J4MQhJygGHXry71XpptcWBsIqc9uIftdAq/Ejw78SP4Y8QufB/M+
X-Gm-Gg: AYBFou34FtAGmyDKB9piZNgSzbLq3MoB2vf/iMXFIvKQPI0aYYt1bPOXGAjz06BvyH0
	tCvUDT5tvpzodIL+f08xS534PeGhNleD2MawxSQyyzyDr9C/T5lAuJTRpiedEPwqGizfD1Urwx2
	dPlXREuJn/xHkX+yyiXuWvRDgE9P5+q4lVFQt1Lik6ZIGDgIMueSynslYF97FrbK+UmcGRdGjCH
	4ELRrMmr2kiEUivtDcqgUhEzuqk9w++caUN8qvstIQc7lpaQIb72cqyQvCJEzDZkwei4/h8PJb8
	o/VhHYF73u+pKKIw1BEzD/KsvJWPpreX/Z4u3poWWTusjZgosNYzNp2t3HFoo524Ig8r1+9YgvP
	5ewyvi+11V0tAH2AJdu63b2HNfrzO/jN36kSPwsF8Wk+cT/Ui8aFilJBia4BJ6EtnDRv3O8FfvF
	aLoVx26v/hmBwxOnRhi1hItaIU2tYLLxexFym3PpVeBcV5YPeLzKfNAERUFtN5wU+M78N4XVdNP
	ex0El4C1prfSzYXQipSzutP9URDbEW7/wX/OwzOni+EXA7X9n8j+WNesxsUzQ==
X-Received: by 2002:a05:7022:204:b0:188:ecb4:489 with SMTP id a92af1059eb24-19937307a0bmr5814234c88.34.1792874378320;
        Sat, 24 Oct 2026 13:39:38 -0700 (PDT)
Received: from [127.0.0.2] ([73.222.46.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm9764737c88.14.2026.10.24.13.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:39:37 -0700 (PDT)
From: Farid Zakaria <farid.m.zakaria@gmail.com>
Date: Sat, 24 Oct 2026 13:39:17 -0700
Subject: [PATCH RFC 1/3] lsm: Call inode_init_security hooks without xattrs
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-landlock-created-rights-v1-1-77c8db3f6bd2@gmail.com>
References: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
In-Reply-To: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, John Ericson <mail@johnericson.me>, 
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Farid Zakaria <farid.m.zakaria@gmail.com>
X-Mailer: b4 0.15.2

security_inode_init_security() returns early when no LSM reserves an
xattr slot, so the inode_init_security hooks never run on a kernel
whose LSMs provide no xattr. An LSM can then not use the hook to
observe inode creation unless some other LSM happens to label inodes.

Call the hooks regardless of the reserved xattr count, and only skip
allocating the xattr array when no slot is reserved. LSMs that write
xattrs still need a reserved slot, so they are unaffected. Landlock
uses the hook in the next patch to track the files a sandboxed task
creates.

Assisted-by: LLM
Signed-off-by: Farid Zakaria <farid.m.zakaria@gmail.com>
---
 security/security.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/security/security.c b/security/security.c
index b284e24e3771..bb94c94d97a5 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1353,10 +1353,11 @@ int security_inode_init_security(struct inode *inode, struct inode *dir,
 	if (unlikely(IS_PRIVATE(inode)))
 		return 0;
 
-	if (!blob_sizes.lbs_xattr_count)
-		return 0;
-
-	if (initxattrs) {
+	/*
+	 * Even without any xattr to provide, LSMs (e.g. Landlock) may need to
+	 * track inode creations.
+	 */
+	if (initxattrs && blob_sizes.lbs_xattr_count) {
 		/* Allocate +1 as terminator. */
 		new_xattrs = kcalloc(blob_sizes.lbs_xattr_count + 1,
 				     sizeof(*new_xattrs), GFP_NOFS);

-- 
2.55.0

