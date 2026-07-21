Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCC044213F
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 20:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667450; cv=none; b=bIFAbgdksJLgyllLrXk3fEcZ/kwK/y9ZibTI9zSqdKtsJ8+gM/eF9f8W9LGKLsOP08PPRwfDkxQzDdI3ixud2WQMQfV18/Fc2JzQYG7W+2tWKbbr9zX/tdjhSUAS8LjBGec/qDKzAVUMADdVh1TyOJaNXCB5MUsDlQZ66hHI5AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667450; c=relaxed/simple;
	bh=c5WIgaUW86zxkVqcui5pvUWjMpEd0rPqQJs9nD03Rho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GnFjdXmHKkiybD8JRYvLIB8l6SYGmgOa6dt2DkOadpIaKBxOBMBRY9yz6hpxP3oh9UwlqRhMTOED1Ep51lKgHSQHtFAQuveFFoyScLxxNQksMKjAPVIcOO5PEEyIqkPahWnavxk36rKu6f6vqaYGnxVyfB6q3k1SMEG5uUicugE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5mUViyz; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5mUViyz"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso4247403a34.1
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 13:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784667445; x=1785272245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mMbFBVb+54AdS6XN7q8pHuRmeyLjOD33H8GcCbRh278=;
        b=W5mUViyzIShxIyJExuTvcDokQWqH8/hX6Uu0Qi6lsBnDJvi1IHlbzVwJY2ebjuy1jv
         UG/nSLYT2HN/4ohCFxlf117asTJ3m8RrMK+auo7T2pa0fgQVlxPEzkz8pLmevIfLnaT2
         +97Bg0NW5yV6RtOhJRT0q5u//WVItYvV+7lxYWg/K31I1yPZLvXSZ4oxLpGvfuBSk8x+
         k3nQzsy7eKTmLSJ29NmFs5IR10yrOVJQy5CEvIzCh59Z0ahJ2J3Fl7dyQb+iMbD59Up5
         260yxqm40OlGJsQMzX7ea8M2hEEAI0gU4+Nn/x0LHJnG8phEAm1kVYR668iU1By5B8d4
         jCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667445; x=1785272245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mMbFBVb+54AdS6XN7q8pHuRmeyLjOD33H8GcCbRh278=;
        b=MHrjpFJd3yb3iNJ4NDQTU7wWIIsapHBedGdVfx90YycPKrK8MS7ZTRk2+m74si6D+6
         p5d6QvV69yuemfkdLQyGfQ88/6OdNNfFQ1/RFGMM2oJH03XIpmOVWIJZl+e6iQ2xX0U/
         y00dhPwi9hTA6wGT8tihfh2M0k/qoX25EL1BuudGyJWYgcGMyKR2rME1gvbPxolf6WW1
         3Y1kgQKAPOA0tV+9L8GSGlFN0CVGJf0jSJz4s/jkqXZi6rIAQHXWcRSvdk3sJaqf2Rgz
         aGTv4rFDgzeguzlYuWgDoQGwszzzA1KEU69BWxecS1wQfqNraLI+OyJYD6H70yXaQQT4
         GT7A==
X-Forwarded-Encrypted: i=1; AHgh+RqoF7nS3iYrOS4EzfIzoGcM2wId3NynHnjdbS6uPfdotXer12XlqduVkVYnRhTU4EsgJEZnb+EtMKkH6I9p18c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqSaNB8EYntISheUXGpLBUguTgJZCB3R24ZZ60djrv3BXsgnAD
	YzKfcEwDXRlTxDLW7JfVSFv7cfq8n8ITakg0elD6VU2NHGUzYiYoeLmw
X-Gm-Gg: AfdE7cnSb1mkgh6/m0H9XnrYPkjnevZHVhReS2GNQF+hp3gsP0b2oZwiCE/GTkzmd5B
	ZVLKkRECMufzhYNyPwIlsNxsXamxVeC6al82Gd5IDaIi06flZ71Fk3IWEQR93ozzVApzr7v8yeW
	MNOIlrC1nEfwBWGjbbYIYH4g6tRh8Xd6HJ3KhRLogyry8QWhZFQKZwNK5MWF4yBnV9lMi3Cktbh
	SexyYpxpjU4Lfk4bDH1ZZBCu3FyZQydenz8xcb9Y3rSoYZqOtHyxRBCnWv2V/lPTp4x8GSxDa+U
	osXHd7sZCEJ5HFbpB9ShSpWqM40+JLL3qnDcWgQFAaND4JpQ+UJBiGLXxLszbqGafVNPRHCBivB
	ExQilmN6Sr5twTASBrPodZEf+bX+f/+/B73Yv6pwClxU9NF7jfLzPOY6VfSCfXG3iVKUAznbtsb
	8bs6b7Ca3E5VJZptswAaUl5/9xPGTxCkUPBwnWsk0vbS1qFpE8HDjG1RzeXmVks/CbYXHEKa8zd
	W1LEvSyj5xcz45DbFQpaoUtX6TOxFAnhsDV
X-Received: by 2002:a05:6830:210f:b0:7e9:cd7a:7c34 with SMTP id 46e09a7af769-7ed9aa2704dmr10974468a34.10.1784667444956;
        Tue, 21 Jul 2026 13:57:24 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7edaf94a494sm11134501a34.13.2026.07.21.13.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:57:24 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 21 Jul 2026 14:57:00 -0600
Subject: [PATCH v7 11/29] dyndbg: factor ddebug_match_desc out from
 ddebug_change
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dd-maint-2-v7-11-010fbe73b311@gmail.com>
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
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784667429; l=4529;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=c5WIgaUW86zxkVqcui5pvUWjMpEd0rPqQJs9nD03Rho=;
 b=2XzxbK4At2mhCtWlDgUBewmM96HOIsSDXExdTJnlSiRicQ7UHFWSgn/VLr8QVNpxM7l+fgvKD
 oMYVGG1pNqlAHlEDdHhtjwJVkr7ZMz8SuBiYDkJcn6YDkhh/KneVxGV
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
v5: check for null format in callsite. shouldnt happen, but pr_debug() isnt illegal
---
 lib/dynamic_debug.c | 87 +++++++++++++++++++++++++++++++----------------------
 1 file changed, 51 insertions(+), 36 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 18a71a9108d3..577a07916072 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -172,6 +172,56 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
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
+		if (!dp->format) {
+			pr_info("encountered a NULL format\n");
+			return false;
+		}
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
@@ -204,42 +254,7 @@ static int ddebug_change(const struct ddebug_query *query,
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
2.55.0

