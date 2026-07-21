Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5426B476CEB
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 20:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667464; cv=none; b=e3ihPJ9XlJkjgoL/KjlxHL1BjVfO2kxtB0XLMZIwxW8CGmnGbh424/xF5sIVJX6Xb5emZnChq3nclSQ9jBL+JYbd8Zefg95RWaNqO5uP2hIx7eazkavr3vtkSoZnjiF37A2xDqXscTEn1g0D7G/emzWoarPYGfZSA6TH+cLZ79g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667464; c=relaxed/simple;
	bh=WOmyylvrbCAUj/PLsv+3DwmsEySP9ZA6ob9OIeZJi90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kbxWHfI323gYtPqZW0EhW1J4rDbStyJlxJSmf9NHENunE0ZSSM2ds1gPifPpajW1qfhVI4ihzCtUnK4fswSLu552WhvkCr2vi/M0dbBFsePt+yXJZyl3Qo3aoCfBdxYYg//O/GP5u8JJAXiud+AO4nQn/QZ3godNJj6JWzKdL84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emVk6lKD; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emVk6lKD"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e9eaf04bfaso4048545a34.1
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 13:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784667459; x=1785272259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4aVJpn3vfy3xA0GhAwM1FOdL9CLIB76+lVPPxbP18Q=;
        b=emVk6lKDu18ozZJguVewv1WbceSwzlLmEdnRhdoprNw0mOTX97/bGUFRf64nIDw3Sg
         hS/Mx9Kj8EKATwTQhvZnMVCRUQXSFxVcl7eveK5wN4btkAnmrSz86xrpzzZReydRpYT8
         1JHd8W8F188XpvPHdU1WpQsizU0X1PnY5erdE5ZkY28FHuVzClyX0z/XdtMFzBGdzRyD
         NL+2C/C9eSYe0odJd0osoNiz4H788ct+JbjvSS45rOeoG6S6McHsW3HvHYtTgExWz2sn
         NsMFyuJ6jV28nvi/HHwi7ubPphrtU29nDTNw0EjRMtXAWathBpo0BgnxolwJxEoe495Q
         yFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667459; x=1785272259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4aVJpn3vfy3xA0GhAwM1FOdL9CLIB76+lVPPxbP18Q=;
        b=mcqziNIbvrTTmCuxTBvIGvm4/SEIRDfaQiJWlYhfgaVDdLnKOgyrnOBveSE91Azf5C
         lQ0BEalcBnsMoRin8+80FduQ47leYX2KuH0Qe2lQHRhrpFEZ2uOTdLmtgpujDyEfz4kT
         5kU4cEzvqTAH0LRBW31vIQocoVE4gSyUfdJRtHUxE+NZoEu9p94iiD+Z3RCZYADtFcCy
         CTpPUUIOBbrvbYxhwRGt4HkP4A+XlyOIjIbRIg+JdZsLB8rUrsqzxB0CbDQlk/9afq6+
         FquiN+NVeq9vhhbDws3BhM22PSJdemOoKmAY+uw0gak0T6u+TMQG0nyIfpTtwZHBHSxU
         hgbA==
X-Forwarded-Encrypted: i=1; AHgh+RoX/cY0M3zqvGiGhnrQd8qLcoR9Ii5maxVUp1qYN7nA/qhhWjgZ+rXkd+xdV7stGedqPYvZCfyQhZJj1kudcHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVd/zU3sQxtqUvv7Xb1XRlFpILeRZEIM1u+PPWJcr7ODGgi0ta
	4qsIKlPJfDBNy4VO1/tDOmK6RGQFjr+ABjAV7YlTHVllRyCJFcStnF5W
X-Gm-Gg: AfdE7cnJ8iCwR+T4oXmutg0Xhpj1Vgj5pS/48KtUDX1DazkydQfOXdp7l3LvunplmDA
	XT9U0fwYuPX00kP3CRCK7S288+MT1Rg2aOAOVT8zFPbXb5PMRM7mIJNprjB5KQ06hzPtSGs9a0+
	GvwLDzxbYeA9YrzM9UpEqr7niYZUPi6qtxbVn0Hmx+AxE73MSUIjbQ/+WMkRgNGovhNRPeXRCm3
	IhEzi96vMvMMvARbxpOr1Opu1oqqhZA/Sn6vQw6yF34F61zNogpc2Ax0edPBAlRrGWkzjmcMQNf
	h6/pwKw/Nftf6AEUNeOy7sqNGLA2Q9JtFDTyMqjL9aD/WQ7kSj8ZRMQCzX0ztiy3RRbtD3dRy6R
	cdka5Qv+96VbEbuy2qPq3VJjWstxWBn7DZoNyEH29YH1JM00BQ47kMKtHmSaqkegoAB6xJPHOET
	fwCQStRhbBa0QgBOmFKMYsqpnF8aGugyaQ2Gniiy0Jzqcz1upXyBAiYaPBY3CCb2v902DimUY/l
	BuXa6WI/fVpGciV6LPnA3Dvxw==
X-Received: by 2002:a05:6830:6aeb:b0:7e9:e860:6e7 with SMTP id 46e09a7af769-7eda4d72f70mr10535815a34.30.1784667458978;
        Tue, 21 Jul 2026 13:57:38 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7edaf94a494sm11134501a34.13.2026.07.21.13.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:57:38 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 21 Jul 2026 14:57:12 -0600
Subject: [PATCH v7 23/29] dyndbg: macrofy a 2-index for-loop pattern
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dd-maint-2-v7-23-010fbe73b311@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784667429; l=2812;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=WOmyylvrbCAUj/PLsv+3DwmsEySP9ZA6ob9OIeZJi90=;
 b=02Iv05IbxKt1QWjxVRLF70St4DFAX5xXM9zyzq9Rm+AajqCCP2nj8VKq4vfdRX1wOgILqsa/b
 12PseQGUzacDbQt+tP427j5AG06Pxl8LgVAKYqL2Oy2TqvTcllkf2zu
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

dynamic-debug currently has 2 __sections (__dyndbg, __dyndb_classes),
struct _ddebug_info keeps track of them both, with 2 members each:
_vec and _vec#_len.

We need to loop over these sections, with index and record pointer,
making ref to both _vec and _vec_len.  This is already fiddly and
error-prone, and will get worse as we add a 3rd section.

Lets instead embed/abstract the fiddly-ness in the `for_subvec()`
macro, and avoid repeating it going forward.

This is a for-loop macro expander, so it syntactically expects to
precede either a single statement or a { block } of them, and the
usual typeof or do-while-0 tricks are unavailable to fix the
multiple-expansion warning.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v2: move RvB after SoB
---
 lib/dynamic_debug.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5abf6ff6be52..59e3c0eccbed 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -149,6 +149,20 @@ static void v3pr_info_dq(const struct ddebug_query *query, const char *msg)
 		  query->first_lineno, query->last_lineno, query->class_string);
 }
 
+/*
+ * simplify a repeated for-loop pattern walking N steps in a T _vec
+ * member inside a struct _box.  It expects int i and T *_sp to be
+ * declared in the caller.
+ * @_i:  caller provided counter.
+ * @_sp: cursor into _vec, to examine each item.
+ * @_box: ptr to a struct containing @_vec member
+ * @_vec: name of a member in @_box
+ */
+#define for_subvec(_i, _sp, _box, _vec)			\
+	for ((_i) = 0, (_sp) = (_box)->_vec;		\
+	     (_i) < (_box)->num_##_vec;			\
+	     (_i)++, (_sp)++)		/* { block } */
+
 static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
 							const char *class_string,
 							int *class_id)
@@ -156,7 +170,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1168,8 +1182,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	 * the builtin/modular classmap vector/section.  Save the start
 	 * and length of the subrange at its edges.
 	 */
-	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
-
+	for_subvec(i, cm, di, classes) {
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
 			if (!nc) {
 				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",

-- 
2.55.0

