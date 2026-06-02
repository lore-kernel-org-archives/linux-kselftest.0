Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB193AB466
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 22:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780440500; cv=none; b=CcY2qBegXoEwCz7uxXQ5AAI5PeM6IPqq6ePywafWTCJVow6/LR8r59prf1IluKyqFSdqJSf7Kk62724Ab1m1PJgXg8uSs/YqCtpw2Y2nzVbge/PeSVjYZsYBZIQzzV8esiOyIYao/bl85js5bMC8AGnj+sRs3NVPOItb1hBVw70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780440500; c=relaxed/simple;
	bh=Ybb0kJKNd2BJDDcZYbhZbCACFsLVAC7m/M+jXCdbe+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QmiG6oFxmHkt82g5PDImHx9f5el6kCAd0oFv4dt85SJjoGwq+vHCZyz/cKD9ta2Ew/rzf1EeZLQRlOGoa8L4R3aybo8ine263jYwpDx2/gyBwD67T/ec788ltdG4J+7KLPPb+LhQtyhKJ6yiO62ky9ayu5qiVcRiSW6r04t8vss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pBoE7Ur7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pBoE7Ur7"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so3687959f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 15:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780440497; x=1781045297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5zD1QygmB8fWogN5M5u4F28IFz6bLgLGYRTXYqao/U=;
        b=pBoE7Ur73OododeuuifWDn5wMtoQL7yOw348/abCpfK/wllh0lM91/84CEnCPPeUT4
         fJH9skgUnlmmjnBdYyeP+IAJ4pzy6HFFtdaT+eP/+Gmz5BOkpVTt/kGFp9DyAx45cmz6
         kT/+ShtNSehFz/kg22vKaPjpJvBx5dcpppX6HUpL8tzb2IE7BledM1NliSG2aTr4Z+Ke
         6tMztv/L+f2lw8qnP1RgHkqnKztJdZNv10rFEUnCbCjhRUBxY/FoRGSCfYNRvtbsVqgX
         VGph0jT3Db3uuOwQw59gwpsDC3ZOj5XW7KaqaUmXLkDRPnwdRPYxlfUKZtyW4cVXCCYv
         OMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780440497; x=1781045297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T5zD1QygmB8fWogN5M5u4F28IFz6bLgLGYRTXYqao/U=;
        b=kVNzn8XXcWYH4xzL/ESnH8OALzEuZyKFjLIR0UPpU5D7qUnEl6iyoZoyVokm3nr2lp
         TR1VAu4ztr9qilWRN1irQMKpdYo29lEPLOQPIZdf9aHIjZdxxCvcIsrMoFdn4lCraEBB
         Yb0x80r9SnsYbuK/3bUcZaC8ygFTaD75En98FzOYvHMY4+BGdhUSkjst3Lf00MVri3fO
         zK80ZjLcBayfwK/FNCFVhcxO5871qH5tWh/68NCgzroNepTH9pVUI4tw/VXZss+fqfs2
         ue5qFvDMtC8LNuKdTauw50qzOS/jfJtjzeDIRdtFk9a65w2PutIcVMsTcDHWKzMS+TF1
         cz+A==
X-Forwarded-Encrypted: i=1; AFNElJ/mj2gz8jf0W2jnm3H6K8tMbPg6pN5aZ+0JlmHw1ow8ZRNEfN85CqxWa710ZT8PAweJcViOvxhBNsHQU7BZQE4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4+abZSlpjR3GrCTkUvcklClM+YBtEgiHYUD14Nv+V+qk6KJkw
	q4YvJEPRsh7OhCRHcOG7fddATeNyfa2rfp09tIQAe5Vfa0qnq2j5IWc8
X-Gm-Gg: Acq92OG769xEjLZokp0OBIMtAjuy8PshcEiGciHh63Go4WDF3NFQQGZVkMCQRYcBkas
	qNYHbQKEU5xk8vUx/JSKkZKcHZj6Byd0wsLNVvED5O+c32GYJUVddJJG+W7mBVIsALL80aRcqzZ
	YHHk+VJiIba7bwu2vZHZuHfj46t2loj0XB60alEnykQf6GeRIzKuhbxyG/XxTGKANBHez8sCRR0
	1OQZdi/gU0w6bseG8k0vK9VqgIQUJpuYMbnYhhnXo97j9lHbzjcdnY/0VGq+HaCS8wu3nTfX9KR
	jzFJ+8yuDsil6w8OYtOI3wRJsLGfxmURefZS54LmBMgCePB6pE9Y7g4MxJUaNAKSn5xYjFs8TWt
	GxYbd65MZPcZ7BBlJLwYDszwNqefXdGrJfm1UM8MsFp2WSml8DHDi24r8PtzK7L0PRyml3MqiBp
	F+2egPFGO5zDvFCJmIHY3cU6BsSoWWqhKqZERAlaJZNw==
X-Received: by 2002:a05:600c:c84:b0:490:389:7644 with SMTP id 5b1f17b1804b1-490b5fe0e36mr10870455e9.17.1780440497119;
        Tue, 02 Jun 2026 15:48:17 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm1999791f8f.14.2026.06.02.15.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:48:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 02 Jun 2026 22:47:59 +0000
Subject: [PATCH v4 02/25] docs/dyndbg: explain flags parse 1st
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dd-maint-2-v4-2-19a1445585a8@gmail.com>
References: <20260602-dd-maint-2-v4-0-19a1445585a8@gmail.com>
In-Reply-To: <20260602-dd-maint-2-v4-0-19a1445585a8@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780440488; l=1814;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=Ybb0kJKNd2BJDDcZYbhZbCACFsLVAC7m/M+jXCdbe+s=;
 b=iGpCIeDHPVfQ770YcsgKYXv3tJwW3O+XIWlcq5CIrp9h5VC/6DBVR3xkR4b7Qcc8Pnj13ieeI
 Y4QZse5sLQqBLq9EL6k0vDUfzHjGV6rne+yovUgeHPiSQqfDC5aN483
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4b14d9fd0300..9c2f096ed1d8 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,10 +109,19 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+Note that since the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword and value.  Flag errs will hide keyword errs::
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
+keywords are::
 
   match-spec ::= 'func' string |
 		 'file' string |

-- 
2.54.0

