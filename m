Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0361E31197B
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 20:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777927519; cv=none; b=mzT9Oma7etzGG1DjoYDzmftLnNH5E5qdghToz2qWeCFCbMdQFArZpmdVRg2jGwiIuZf3KoKH0cpN0PCL3+FXX5/agyLSJTPvxGJQGiWDuknhEPKX+h6rqnbJEg6X6N9nnbz+JKAwSOVY0fBu6QfVhMRQuDRevNJhZRklrv3PPcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777927519; c=relaxed/simple;
	bh=j5GAqgH1tDYgb6kzTcUFN1yLPWoPsRlOPzCxW4/MNeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZIKgxzDBa/4YC2/iUooAAwcuFjXQn1PcoDELSisl9qDzFhUl5CdYs7ZFNQwVBBSIhuEkjYTfjBUT/p1ggHua7KR4lEvUwkFiinTdx8Ea3eRFGJQYIjJiGzpoGsIRgPUyH7LlAeEgLEalZOLvNrR07Cj5wh7OpGBBU+Waj9KryPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mK1JaAOi; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mK1JaAOi"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-67e09232daeso3016108eaf.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 13:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777927517; x=1778532317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96+CnjisvPUb0CWRbReGwZxDAY9Evf8qYjQBtyb4fJA=;
        b=mK1JaAOiU0MxiV25TY/KRw94MLAuyKqhzAZdISaXe+7cuGgQLiSJ8bQ6RhwS0UUg4P
         UtLN22u0FvCWbPrd79BtrI9oSob296I08tj/SbWlMUR+1fFH8++UBclG7vez2+e8h44H
         x5y57abi9R1CIZr6izzrqLAIwy+zWMJwqOWA7RpRBJCUoQqICC1jyoGId6AYl1uxoZj0
         CIF69B7XaXotLp3GI1EKY2CXe+nV/7ole/usj6jWyrPEO5qMA3n9fpaizAY01tOLjNGb
         Ry+KXjGUGHKF9kNhrvPkw65tUhm+eGDEVtS9dTgdgwGXw+h/xF1wqb8wC93AAq2qqEi5
         CLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777927517; x=1778532317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=96+CnjisvPUb0CWRbReGwZxDAY9Evf8qYjQBtyb4fJA=;
        b=hJWecBjngrXW/EvINzz2WdMAuIrANvEjYMeYYVvN9q6p5FDWU0ZZr/710raZDRi/5K
         jUOo0m22glnkDXFdhUHAyX5w/ZOBoJaL2sn81l9xvZAEvYCmpxO/dMyuUppgFoOaHu9A
         molKw2zdawPyOhzbaSezZQ3QVbaMJZEl7ylDrKd6spa5jkESH1pmQziCwIY9QNQ/x/y2
         HLXsdMMngrmdJQNdpquiAWH529a1ZDbhzHACYrtlUzuOaqG3J087VB54Pwsr6KrS8LI1
         aIYx11Y5XIeY/yjUitdF4xxgnOwh0BOzYVQJibUFf0f+Rm2HOcdhdl7bUHh6/NCXnTfr
         khFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/dLMpuIdCwJ2qfNy9a0pxdZbu0Ql0lGClJXOANx+25cQDNCto+DTo7hEh3r20r8RJQGKCVgQINj1wuJdN+mh4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ib8DKNNr3UFaFEDbj61r9ShXFfe6aUNjKFbaRndZu54fU5TE
	kASrL89VdwD0rBhl7HkiYLwxGL6zzY4RM/KMOnBI6z2rovgyUmL3BZES
X-Gm-Gg: AeBDiesawGLx7PcJrGDXq1sNcnqEUZ6Z3qBphrakUr1yM/OyQwbx4hcYmHGpRqJEW+2
	ksXK1CLrPla0qVMRfEET/RMh6sIqhRYZhT9gPERjSQd+MEyAdd1gNzu/M4Nnk5Llk0m27eP2WMM
	htZYBPQ4RsWOxDvD3kgPBDRaoryyk6P0lCB3+SWK6xEbbSzAKrCqJcZ97pWHeMs/ghJ1kvqY5+F
	2Pt9OwuhnMIqmgLxvJJqbeUCA3zXn+bdm2jQTxPh5FbnfEDWnBuAQUCX7HlFx7KXGqCuSHsbUOq
	ou9qEClGN6ZrEXZ9+NSYAiUEewjELJUDfCu6qSbEmp5C/w+nIv/ziBpHiY2OXV8vVMUcuJZLypS
	bbisklc0ZjIdQjeKCP6zFz9/IoWEpSYDF0Ugwa+CPwPJ4TGv737aTcUM/cVNUINnhE+am0KYgfp
	1uLurrYkCJgTh2g7KCxb8stwgEpjA03hyMyJ7eD5//grTI63xLfK8ZlGyclAabS4yg3ngZxX1K
X-Received: by 2002:a05:6820:2109:b0:696:25d4:1e62 with SMTP id 006d021491bc7-696979cc0eamr5130131eaf.2.1777927516839;
        Mon, 04 May 2026 13:45:16 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-69689266bacsm7144713eaf.0.2026.05.04.13.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 13:45:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 04 May 2026 14:45:07 -0600
Subject: [PATCH 01/17] dyndbg: factor ddebug_match_desc out from
 ddebug_change
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-dd-cleanups-2-v1-1-6fdd24040642@gmail.com>
References: <20260504-dd-cleanups-2-v1-0-6fdd24040642@gmail.com>
In-Reply-To: <20260504-dd-cleanups-2-v1-0-6fdd24040642@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Shuah Khan <shuah@kernel.org>, Louis Chauvet <louis.chauvet@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777927513; l=4346;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=j5GAqgH1tDYgb6kzTcUFN1yLPWoPsRlOPzCxW4/MNeE=;
 b=TnKzQJCtvtPa2kyeezQXWnc8ZQbBfl1uUt7zNXn5K9tUjUSqOj0Wvdj5kmmpddLZTQIFEXCl7
 iAV5ZJDwtMCAdTNqcnRnZqjq9kw9lSXIsIJAcZsj1AREKUQ/Bw/NuGf
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

ddebug_change() is a big (~100 lines) function with a nested for loop.

The outer loop walks the per-module ddebug_tables list, and does
module stuff: it filters on a query's "module FOO*" and "class BAR",
failures here skip the entire inner loop.

The inner loop (60 lines) scans a module's descriptors.  It starts
with a long block of filters on function, line, format, and the
validated "BAR" class (or the legacy/_DPRINTK_CLASS_DFLT).

These filters "continue" past pr_debugs that don't match the query
criteria, before it falls through the code below that counts matches,
then adjusts the flags and static-keys.  This is unnecessarily hard to
think about.

So move the per-descriptor filter-block into a boolean function:
ddebug_match_desc(desc), and change each "continue" to "return false".
This puts a clear interface in place, so any future changes are either
inside, outside, or across this interface.

also fix checkpatch complaints about spaces and braces.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 83 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 47 insertions(+), 36 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 18a71a9108d3..6b1e983cfedc 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -172,6 +172,52 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
  * callsites, normally the same as number of changes.  If verbose,
  * logs the changes.  Takes ddebug_lock.
  */
+static bool ddebug_match_desc(const struct ddebug_query *query,
+			      struct _ddebug *dp,
+			      int valid_class)
+{
+	/* match site against query-class */
+	if (dp->class_id != valid_class)
+		return false;
+
+	/* match against the source filename */
+	if (query->filename &&
+	    !match_wildcard(query->filename, dp->filename) &&
+	    !match_wildcard(query->filename,
+			    kbasename(dp->filename)) &&
+	    !match_wildcard(query->filename,
+			    trim_prefix(dp->filename)))
+		return false;
+
+	/* match against the function */
+	if (query->function &&
+	    !match_wildcard(query->function, dp->function))
+		return false;
+
+	/* match against the format */
+	if (query->format) {
+		if (*query->format == '^') {
+			char *p;
+			/* anchored search. match must be at beginning */
+			p = strstr(dp->format, query->format + 1);
+			if (p != dp->format)
+				return false;
+		} else if (!strstr(dp->format, query->format)) {
+			return false;
+		}
+	}
+
+	/* match against the line number range */
+	if (query->first_lineno &&
+	    dp->lineno < query->first_lineno)
+		return false;
+	if (query->last_lineno &&
+	    dp->lineno > query->last_lineno)
+		return false;
+
+	return true;
+}
+
 static int ddebug_change(const struct ddebug_query *query,
 			 struct flag_settings *modifiers)
 {
@@ -204,42 +250,7 @@ static int ddebug_change(const struct ddebug_query *query,
 		for (i = 0; i < dt->num_ddebugs; i++) {
 			struct _ddebug *dp = &dt->ddebugs[i];
 
-			/* match site against query-class */
-			if (dp->class_id != valid_class)
-				continue;
-
-			/* match against the source filename */
-			if (query->filename &&
-			    !match_wildcard(query->filename, dp->filename) &&
-			    !match_wildcard(query->filename,
-					   kbasename(dp->filename)) &&
-			    !match_wildcard(query->filename,
-					   trim_prefix(dp->filename)))
-				continue;
-
-			/* match against the function */
-			if (query->function &&
-			    !match_wildcard(query->function, dp->function))
-				continue;
-
-			/* match against the format */
-			if (query->format) {
-				if (*query->format == '^') {
-					char *p;
-					/* anchored search. match must be at beginning */
-					p = strstr(dp->format, query->format+1);
-					if (p != dp->format)
-						continue;
-				} else if (!strstr(dp->format, query->format))
-					continue;
-			}
-
-			/* match against the line number range */
-			if (query->first_lineno &&
-			    dp->lineno < query->first_lineno)
-				continue;
-			if (query->last_lineno &&
-			    dp->lineno > query->last_lineno)
+			if (!ddebug_match_desc(query, dp, valid_class))
 				continue;
 
 			nfound++;

-- 
2.54.0

