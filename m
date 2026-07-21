Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C293C8716
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 20:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667435; cv=none; b=SGBPk6Ox4LC4WTvlxAw6GHi0oFGQP7i+tQ6dnx+jLmtKGTUaJ3Owh3MZIcgC0goyFnfJkd5hXPHN/7KcccFAz+vHXJnJ4Hpk2i43zSt2SOzb+9AWN10+P29O1IX6rQxuJZROIGoRlmnbfyZqyhn/mcCJso6pLhLVgtk4sJZZ8Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667435; c=relaxed/simple;
	bh=NjeO3E3aXTlf0Rmaw0bPO/yZw26XHF8e4PdgxVbvO5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LV1o4d6AOok0YAdQI10osmXJNCuNarm2YWyo0pRghhgLi/dObgpqWKGA97cu/2C1NURKEMxyUh3qRQOKpZDS28yQs8oG95qe5TRuwbrAp18pQpgT34nn2iH99YmyiB3k0NXBo0KA9jOBhb8j46SDjk32ZOP+yNa11OUx8Nb5884=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nUykYl3Q; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nUykYl3Q"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e6b554044fso9243373a34.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 13:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784667432; x=1785272232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgVpgKXUNJtrWSKTwQbIOxGGmQfqameHK1lD3QBhDhA=;
        b=nUykYl3QoiDu5jbOvn3qCaiKUlwmTqW4BoVrYO9Yhf07IFuXVp3JRaHf2BG+pLQoVN
         bqw4M0HwbYKz1cnjGgYXNvfdoCiryT27iJA/qA6gYpsEDwB7C03tQ1Rz+gLxFYTR8Bs2
         jh6qkca6JXZj0sOY2s28+UAT2A6z2tTf2PxB1+wvuPl/bdLhCU/OC4occQR+UhrGtMiY
         KzB021Dr2nOQeLt/D6v1VFw6L/AR7J6lo9LQv9c9Erv0y71mPNCAbSi8W/NLjyABJizk
         E513I/oTUWt+b9G097P0lGjx9tC5xMtWNmCt90m9hZeAQCFlmJeFODnd5gdgSiGYkOvU
         yOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667432; x=1785272232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgVpgKXUNJtrWSKTwQbIOxGGmQfqameHK1lD3QBhDhA=;
        b=f1qpZTz+jKJ23aZLZdum+PJfD1O8AOJk8GidYp9m9DTeOHLJ4tMqP/Jzz0aUvd1y7s
         xRujDrocwBUawTdWF7LJ9gPw0Q0CAR1IcaoBPJKTkp3Lvwxfh2hxTZp6xFBkLe8ir2e8
         r1v4TSkok4da36SYMXry7z/6gKAKRunN8ewh4Haigwjnzw/32vdne87jI+fNy+m1KuEm
         wCqqC58pSamZAelCH8JzGin5ZDndmj8ZQedoC5s/QcuVTwurhhRpvB55HKoHzkhuZj1M
         rabsJ8MAlH0qmb2vOJWo+1gloHhy4BWGj49dbkP4JiAPAXfFZ6wMVBXS+zGYj6wmz56q
         bOCg==
X-Forwarded-Encrypted: i=1; AHgh+RrYrghfjh6P5d279J+1ZBYaF+Vk/Ydv6VgJ9CPocbsEMR70I6x5dJ35KezYG7234ncgu0Za+yMcLfelXtAD2As=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzZJbgfjojVKmoXHHpPf10mOwzu2Oi9bmipVq9v5Arvh0V2fGk
	VgxAsbGA+wN2RFZ8bYDBHL9VA6oFuwBVSSvlpsMzS0ZZZ72231jGCXIk
X-Gm-Gg: AfdE7cmx49V4nSYqchq7Oy0exhMjfZRlJWkpcAUDK4aiNtdjlHr4h2M1rXvRnAgBUCp
	kZoAtgDhuIALE6opx5Rmca8G8b6vQX2PhX3VubFQzLQFvczAR4G8I0xMhmPUNTW5vnlgLxbFpNH
	cH90lUWE0x+D6dESl4xhY9po26PBEYmcMJdGiHk77/uvxZBJHB+mOtaeIcNZZZ/WpnyhIRgupjz
	MeFFg17Rgg/Nbds1Y77p0HYLlJxRjOKUewI2X0MzZYv4xzk+2PTK3KPnS7v5HTFprN7PiOh4VrG
	Dd8ey3mBRbfZAnlH2ixLJ9gQKMQL2nFRxfxThf7NFtPMQJSRDUIuX4kCD7ekjrEa93bbEuRSzY4
	Ajhh30spwEw7qGLEBCBHQIh2gKEf3Z+cZ8xsN/Ldt1TTrkoOhzyuJbgJDDl4qoJ3WGnmpm517tF
	ZuhCgXQWXU1e7QChd3uFdRB8C6Dy7Z0wjeAmdBhoon/5mcO5fLSWAYPiXs4poTi5HYtjJ8xzWVC
	DtICro9H2KdSTu953TnWtFXFg==
X-Received: by 2002:a05:6830:6518:b0:7eb:21d:70b9 with SMTP id 46e09a7af769-7eda0e701bamr9566145a34.22.1784667432329;
        Tue, 21 Jul 2026 13:57:12 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7edaf94a494sm11134501a34.13.2026.07.21.13.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:57:11 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 21 Jul 2026 14:56:50 -0600
Subject: [PATCH v7 01/29] params: fix a pr_debug(" %p ") use - already in
 MM-*
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dd-maint-2-v7-1-010fbe73b311@gmail.com>
References: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
In-Reply-To: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, Simona Vetter <simona@ffwll.ch>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784667429; l=1125;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=NjeO3E3aXTlf0Rmaw0bPO/yZw26XHF8e4PdgxVbvO5s=;
 b=JnG4Hd6pByV6cBcRHCdIJRICgp5wUjzEQUOylmvD27efVdhP0Cn/ay5LhcR7goGzLrNO9vFYm
 yTpsgAAsjCpAWnQCPpIRZXIEjFbutFhwOQKtI2azaOPhH5Ccc68vKuf
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

NB: this is already in mm, but I need it in this patchset because
kernel/params is subjected to testing by the selftest script, and the
test depends upon its stability.

kernel/params.c has a pr_debug() which prints the address of a
parameter setter function, this is not legitimately useful.  Since the
value is known and useful to the user, print that instead.

Cc: stable@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 kernel/params.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/params.c b/kernel/params.c
index a668863a4bb6..5c8a05921e28 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -136,8 +136,8 @@ static int parse_one(char *param,
 			if (!val &&
 			    !(params[i].ops->flags & KERNEL_PARAM_OPS_FL_NOARG))
 				return -EINVAL;
-			pr_debug("handling %s with %p\n", param,
-				params[i].ops->set);
+			pr_debug("handling %s with value '%s'\n", param,
+				val ? val : "no-arg");
 			kernel_param_lock(params[i].mod);
 			if (param_check_unsafe(&params[i]))
 				err = params[i].ops->set(val, &params[i]);

-- 
2.55.0

