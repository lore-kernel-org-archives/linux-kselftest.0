Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C64E37C900
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 12:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315522; cv=none; b=ZVfAJfL05wMWk9TZMpvEJl2BjHPh1cPll4AXLHvwtq66OucN2nhlo/EdsMl8kjct/9B5NYq7d9PejHdOAsF9cQBi4KOjnzZYkHsRXgbnjxPMcuL4vtXtS7//VmfnyIj1/Ks+HgSJ8fPT/ZNDVGRCt447ICj2tBw9TQHL8XVDzMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315522; c=relaxed/simple;
	bh=ytc0P/UZw6i8hpySK2Au28vrT+KoK4/4tvvmOq28NjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dS3MQI5iS0WEt+bNQ2vHX/iu2fHlwcHmo7fLNUI/+tk7oYbdF/K+drkVizZ1vHUBFCAXtOhET3oahEp3cNRbDc+/tD5LVfxxbl1MXZ1OpJzIzryZEJCU3jhWCBby3xYzKa+mL9S//b53Uxv7/Q38eJkEmTlIAkD88DRG8QCxBg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzCZV4e3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzCZV4e3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490a7876f8cso11451225e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 05:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780315520; x=1780920320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdDKIkZQT8kN6q6EUNEFoTcvXlPCpXkuxCaw1ETC1j0=;
        b=mzCZV4e3m4by+nrNsGuy9P/0wDVHS7bRicxmoQYeo5nSV5OUi0icrh9UlF6JTkR4VL
         dRiPiypSG/nB10h/UDFkbtd88YOsie7CLbCr3/fSwba9rFsifgOE/c8gpnzytMt5AO09
         v0eD+zEuWlv61cA2fIKjvkgHDrKaf/jyB4yzn08tBUySdc7nTkdZk9ruG5j4CnF3w87F
         jDPefr2U3ILOm3ZQO+mD2u/IDoQhIryFXA26TvUr4rCF5ZpOPalq+QVfMsRIjM36bc6U
         gjrEcdoB3Mb2YfuW8YobhKQ7slgomK0l5fBKA3Biet9G1VA+SC3mdXL3uRJgTUbL8BME
         A14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315520; x=1780920320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BdDKIkZQT8kN6q6EUNEFoTcvXlPCpXkuxCaw1ETC1j0=;
        b=GL1sDJqQ8llU10Q14mk2WfcSH/mvUkil824CZlitA5E6uefVcdnzXHcpSAn8yZeUWV
         oSNxigJcaHJmtTx6nWjjOeMcl2qKglxfQ0cknZalLkCZGOCoFncgitAZ9zVxbApmaMOo
         Gpo+jxAgM/CtU8tIrpWeNZwpswhDQkBz2RAb+lDLiG7LdX5yRbWU8E+kChrZGLiNYS0K
         WFgxgM0I5nnSUUVKAJjBg0gjQoLHnRWKK2n+DVSVar287YTcMoLfBd8BY1arG5D2pWvl
         TSBgNu1rBOI64PLya0PxQPbAdCHpVEXSK72IS7fX7HKVrAqG7G9EqzTj6TH2VLiNWZ9y
         npqg==
X-Forwarded-Encrypted: i=1; AFNElJ/QUcCAIjndOtDLMeBoB07g8kM0nQsuWg3ZFa7DcGP8NpMNrLdTNw4SEKGbfIazRVEXEh1TaQkfgTvuA4Yiyuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGDsOvsy/HastzqhGyf2pADkm/9++5sHqciszvx3Z/++Itl5Zz
	NdXS5Em74c7MSKciBpT/BHR5Fy4QcfANTPqbwMXWwrZG1wENmWDjDeZW
X-Gm-Gg: Acq92OFKQVS3HMSuKikKfwvgzeEBxyqxwEJuY0BOMnZP7suRHqUhjkSry2tFKX+MUIK
	ZrXMT2MIHuHI+lFguUVsUDGICrbYlxSBf21NSVJny5YiO3JQkraSQiN0k2RLnZWUHtlgdIkt9bJ
	Gc86lgtE6eOpv3OgYj45NTZGdB+3ocVAkGaR5psSraPhuUOMzlsdQvOVCJmRmjX3b+PIH9XcLo4
	Wp1UHG0Sk7tHB0qRiNmp0OAjCZ9i+rsV7zQ2rOe+el3BiCtf/fCgtPQiyM7X+uXmdIPgBhw2l5A
	UwiYbSl1+SQv3gOAHPseGfJuphfniJS1kZf5FrE3Y9ex9IGmkS2I92qwHTjUbg0qoI38MllRFMy
	V/1e7MHjCoHN7+bgRTSh7hbIn9IJyrzs3mGUKMz/TUza1DNpHD8Z6VvzIgmWyjB+tH723jI7DvS
	pwdy+7Pr9VECnOxIhrVqzKRTtVAETgfGPM/tFl1ZgIzg==
X-Received: by 2002:a05:600d:8499:10b0:48a:525b:e148 with SMTP id 5b1f17b1804b1-490a29122d3mr149472665e9.4.1780315519308;
        Mon, 01 Jun 2026 05:05:19 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm103972805e9.9.2026.06.01.05.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:05:18 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 01 Jun 2026 12:04:54 +0000
Subject: [PATCH v3 08/24] dyndbg: factor ddebug_match_desc out from
 ddebug_change
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-dd-maint-2-v3-8-4a15b241bd3c@gmail.com>
References: <20260601-dd-maint-2-v3-0-4a15b241bd3c@gmail.com>
In-Reply-To: <20260601-dd-maint-2-v3-0-4a15b241bd3c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780315495; l=4346;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=ytc0P/UZw6i8hpySK2Au28vrT+KoK4/4tvvmOq28NjE=;
 b=+ufThVv6ucRec0InwE1oCIlL6liuHDUePM3lBke3OZ+hQCGp+ZsnENSLAGbcypyjP9YmxLFW1
 VBzb0Ler2QqCfTSkZKIsWBtoCA6TP04CmDZHb1FiMbti/6RhHDWlB/W
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

