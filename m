Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E18345CAA
	for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 07:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520514; cv=none; b=aGIoopZgtb4Ox216pHpcDFMe3TgL8ULmf+SfAYp/TrGNXx1wnH2V5IDR1sCunOwnNPS046tVmejGHFU4wgS23gVxJ0/wx4n6X8SuEKhUAbrAbvxl/YZPVYFV2P1nkCGrwBNRSH1LyY2WWgk5WjNf+Jqc2K3L7ic662N83d5K5nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520514; c=relaxed/simple;
	bh=ytc0P/UZw6i8hpySK2Au28vrT+KoK4/4tvvmOq28NjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k8EqaEYJeeFdaOmXyCqCu+GmxP4IyQwlCH7/5VdTvC3aFapRQigVIL70Dd48MS9iXnQZ3lI+LURizFTd11yPs5IT1wORgo/5LDOIzyb9YwaMDVn7qnRSM616h9HzQn0kYCGNklrxPhRPTP/yAzKxIgSXVDIwO2AbEG+4gQBhmps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOHk0v/Y; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOHk0v/Y"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44e5624c053so4890410f8f.2
        for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 00:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779520505; x=1780125305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdDKIkZQT8kN6q6EUNEFoTcvXlPCpXkuxCaw1ETC1j0=;
        b=KOHk0v/Y4BkDZjDkXwM5TOzSZqZvmt0+9xV2btspHIs4du5ytuXuYMsD9nVpRMd/Qz
         c3oydRjROCKmlz3tJmR4okd0XcQ4h/lICfDAzDy0GXUMkHL40u9J+8T02Mt4DSTn8im2
         ZUQAmqXO2u0qzC0AZ7iEyxXUAqMtqdyhT9okDiVZoUFYnCwtv8hPOZsTNSreNp1E973c
         Y08eNIvVX1UZejXQUIOMNL9exAWtBVZJ0V7oArty5/yZ/MVcPG2QE9jnx+UCP/lIRVMO
         pzez8YShVoFIQbvNSBQxj+jBvc2LqKeQ2zzPvcV0YtZ4+lXN2kR/cEpDy83mPCoBVq1x
         Zzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779520505; x=1780125305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BdDKIkZQT8kN6q6EUNEFoTcvXlPCpXkuxCaw1ETC1j0=;
        b=nWWfIQ2jq7FbuqWNRL+n226lgbBAyr/DPrqN0cSZqQq+Ajf1D+SxTrDaClxqa1N4xy
         sCZ+ZcypsF93TsTFvG0vJ3zhmEzEx/+DO2/mEreR6q7zdmjrdYklOp7Nf4vcenKHLhNO
         NnEHdhomosLyin+eJA9Lt0yv6F242N+c1HqjijL1NtIlO3drQr0INLp/chTiAThQuf+0
         70LOKU2ywBZIaVton4MEgScAnGSnp6KeF1UKuu6ElvFYcbMA3r7Pph+hTAY0Us+cJwlu
         FcPG9ncss+gAUYHxGAK/DP84chUt5Mo3oQ2hId6eiPr2gCHGOz3z2Y8gm/dg5PRdI6y7
         FPuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+17hYugC+I3ZbcmB1xPVgL4ICVdTZpgsVJYGME/5/my30N40Tf3uB6U4jq2vxcGC6y9oO1fCf0aZqgHARsrb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQat8Gj8zmHex1TTezSv/OKQ7OoHs45yvbqoqfIGso261kb58C
	ELNTHODn5koeoJPFbhDcIZZLummYOZfSgVlHLUS4Gj1rUnNwFxhhkykq
X-Gm-Gg: Acq92OGctJ2wfGV7Hksf9Qlj4qvA3Q0Tg2Lh47xTcgTbMOOOj39il3ORe61zHJ4tw4w
	wbYmJG4xq1QHkY2OnZt/uK6UQ9h3EsostHpr/emt1QyurrUQIgFc2sJw7QnvszmVAljFCnFmvfQ
	ZQNlSeWtHphrI9hcov4+HK5K9tdfAvynrMIYfn/XKb4rIunruY/wpu1/tsFsfy38tyUpkJfH5XR
	X3EzpDE4tZWTUbMckFjRfoHdmrEesI0EKsW0b+E1KT7F3Pj7jzRbaPge1NE9fukPfJROCHPpUgg
	dJL51maZuR7Q6DyrFh+Vbr18DXTIBdkVmhPtxrAjtR9JQCJaGGpbpwK+O2EXpf9U4FjneaOakE0
	CZAxN477jtxba9eYQ5103J1ne5rQdkBU6WpPa76g7V5tIkYwmaeDQb7ZyePftByH5WESc3IlURJ
	BgO4LnlvN2igLWR4wlssTXumpqFHXX
X-Received: by 2002:a05:6000:41ee:b0:43f:e94a:e773 with SMTP id ffacd0b85a97d-45eb36b0818mr10298365f8f.27.1779520503105;
        Sat, 23 May 2026 00:15:03 -0700 (PDT)
Received: from [192.168.0.174] ([31.96.183.250])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm8639838f8f.25.2026.05.23.00.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 00:15:02 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 23 May 2026 01:14:41 -0600
Subject: [PATCH v2 08/24] dyndbg: factor ddebug_match_desc out from
 ddebug_change
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-dd-maint-2-v2-8-b937312aa083@gmail.com>
References: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
In-Reply-To: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779520485; l=4346;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=ytc0P/UZw6i8hpySK2Au28vrT+KoK4/4tvvmOq28NjE=;
 b=0FjUNJKqj7zcKpWVRK2n6ovvyNH2+oda32OW1WLwtDuWRnsuT5scN/UPpoLhYifa4yWRrthJy
 aTwPMijUnb1DvrrA+go89tdgBJwSTv77BQa50TUt4C4cH9JveciLEG8
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

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
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

