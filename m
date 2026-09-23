Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEDD582BBF
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 22:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202902; cv=none; b=DVzoIza4kTYTD0fLNpIxmy8zdtV1zcr5c3EQVaekveX844g1ybJS7f8B3I1ZPUNyEI6MyGtCrjNfAI2DN63bEcvQt7n7OD0+RBj7pKX+CQrXAB15s13nEvXcaxozsaThGL0DMy86OvAtJu6EQfbA4Q57rzv9pOtSyWuuRe/z6YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202902; c=relaxed/simple;
	bh=kcJmyR2ErJB3b2aUXQffOC1Yo8OFza9JdCBgcSweT8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CXwPnYZvqFmY8op2woGzEnBamF3oFBTovYVhYgLMtEWYHUdLBJ5Vne7gfJTJbWLhoo3V1DF2MRe5O4002uE45enMr7/OhEN4dXWYtsqJ89YtSS3bBud6/dIEW5D8S6rgu+K4/j/xgPTixIUTLRjLyICL2vYATBWe1DsnKQ5o7eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfTBkFwq; arc=none smtp.client-ip=74.125.231.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfTBkFwq"
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-48f0056ef38so1076635fac.0
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 15:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202898; x=1790807698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xNViDLZP/ndw6d10bbxAPq/kQLONZJvroL/iiRclils=;
        b=HfTBkFwqlxsh2gjM8+oO+HUYsgpHr+L8RIEvXMGQoDylzdUHNukSchpSIHsqLXVYp5
         9W2LC7dKTHuKsElfKDlIIdOs8KwGKY0emEaSiLB75sAy0T2tzmh/rfSDTyNaqY8bNart
         YC5mQill8F/8XLD+sJUsOvFhb/XNXlrb55gwKQ3Ff5yd76YhcSzc0FZsXA2YOPPGgVMF
         +HSprVmj6LNf8MhDjD+ynhlS2O+SynL4I/IKZk/tKCoHPRKUKx5tjBfXmSGaU5iQ2dHB
         YLsPF8C0zfNu/X4YSMLCC5mVBgqtxbraYZwMDg7K7eRxZYeM8eq1V6cY9frEF2IniOf+
         DwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202898; x=1790807698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xNViDLZP/ndw6d10bbxAPq/kQLONZJvroL/iiRclils=;
        b=owLLabOSbZsfxLaVmNvRRDVujV+oUnOSJdToX0WSkrSg4jXN6mSwrw7O4uEpphHUrW
         0I85rJ/p9mhvISErgFcqxP9oWazZrn8T8tKkE2luh5RjE7BbqP8RQ1wngdnEegdncloF
         abjRN3f++u9Vw0GU/droftH9HPQsXcLyVCJlafyzrv5MxD8K7XJdgo9Ser4iVJrN3z2x
         YY8k2aIFGA5KWseKZKWs6kbZ2XQGAmaJAFpwdnOaMNpxgApGJPz4OGrg5GaJ1etBhecM
         CbLcsI7pbrlqbVV43n1pyASYyBuAzChmsGxUUiU1NftYVuMCx1xtJtChvRlQ8BWhfqII
         QbPQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2LQJMp8bon/dVOdxpxZjME6bjAU1OGxb/PM9PCKMf60U9K42OMSnEA14EyA4NPPqVVPCDcV1MAwAaZUI4aO4=@vger.kernel.org
X-Gm-Message-State: AFuF++mvX4WaJRAb5CpS8t+GuJLrSk11P7I1lhKsCbdpwH907ky+7gHb
	TTOYh0t+aUbZjeMoQ+2WFfub5M/iSzEGpjtBDhiSqb0dXarIuKm12heD
X-Gm-Gg: AYBFou2J5qvV4YWCDyhBKj5bsJXSdcS2vqU9MhL9nZfLhwcUy5Qm+fObleGEO7qAFNP
	U2vDtV/RyKrIly5VGJaZmy5pkMnFdlqCjO9WNKYKOdoi9smZIVyVT7LI0LPdRnJvEyxK5FX9Pdw
	AVt6VlRL7m9aUUOScouTAAdSSanZwiK4dkgmxN8+h/cjqd4iwWa2u3OZVa6DBc4SNrNMbITpLrO
	GdDwo5pee1n0/wNebQ2syeVVZUvWsJXDzHJ/Z4dMJWG4Yv/QQXGXmYIDJfzToy/GFUVUYbNSK4n
	qctJRWyzMKd9WcQ2bykdam5mX96/W+j/NxvJBeWw6HODh15ktG1jXoPEzF3JVnlUSEvFxyRjwvh
	HKBzzOwbc0XdmnfBjtKfPtdYatZ9Z7zpPBtgslgJko3y3Gn4ymE3YhzJVHNV9C5EwdT4O2xYQ3a
	oldLYL6k+ZyWelwPLaS52TNOiUJsI+gsJHr2P+3dPc9E+VuXXXeCBUomg6u8vfk/iVm44lPNRRL
	mq3x4R2ruAFdrzOJxnBL+FdO1dUnoBjzN7MXizApZF1UiMbseee+hyj6N9M3Mubz2nVMyeCPOL5
	r1dOE+hh0xscZYx9nQk=
X-Received: by 2002:a05:6870:80cc:b0:475:e2e9:4f4b with SMTP id 586e51a60fabf-491e83eeaf3mr672694fac.25.1790202898430;
        Wed, 23 Sep 2026 15:34:58 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-491ee1ac486sm559401fac.16.2026.09.23.15.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:34:57 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 23 Sep 2026 16:34:33 -0600
Subject: [PATCH v11 09/38] dyndbg: reword "class unknown," to
 "class:_UNKNOWN_"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dd-cmap-part2-clean-v11-9-9b6c217fdf2f@gmail.com>
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
In-Reply-To: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
To: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Jonathan Corbet <corbet@net.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790202874; l=1375;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=kcJmyR2ErJB3b2aUXQffOC1Yo8OFza9JdCBgcSweT8E=;
 b=EbxJ8aNNn2N8JWyaS6BS7GNKrgNA37jjdazA0+2phkEkOMkVK1BeOeOwCsbS7bDOavlG0jg3E
 9f6ObqsU7WvBJArvz0Lx/Dn7IfQl791wTvtF+oh1MjjDRgkeEqKxwyh
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

When a dyndbg classname is unknown to a kernel module, the callsite is
un-addressable via >control queries, and therefore uncontrollable.

The control-file displays this condition as "class unknown, _id:N"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_ _id:N" to loudly announce the erroneous situation,
and to make it uniquely greppable.

NB: while this might be seen as a user-visible change, this shouldn't
disqualify the change:

a- it reports a classmap coding error condition, which should be
   detected in (or before) review.
b- SHOUTING the error makes it more visible, uniquely greppable.
c- the classmap feature is marked BROKEN for its only current user.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 8682c23b5fe7..13a3d1a8c3ca 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1174,7 +1174,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 

-- 
2.55.0

