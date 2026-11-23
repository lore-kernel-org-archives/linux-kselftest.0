Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477181;
	b=datk4CtT7gEftQjOf0ScDCdq+bupUy968X+BKlUpzyaI2w9CHczB550u+hj6Bl1H4Foq
	 N1L+0HoxPt2dd+l7Wiac679VSiEEl/Q9sKbTexyvTQioGE2Ueoofwd+YNrTAWYympGySj
	 UEZ0M7uXwYNY8fewNVNYzNLRkMI+kPi+BnmPpbHmWRdUr90pXMmdTmnb122/gPJmU65xw
	 6ypi0m1Nphs4O062CInqCT549V/aaoll/YhGZXGTNh9yi+4VSFtVTMdsOnCvLwXm2Mi3+
	 1O3EMYEBSy++ZQ0o/4RIF/QhKTOp5ABgifoI1kk4vjaxeIwIxWkKECaGOW2urHbBpbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0U5hcBRCn7DYeLCXQ7hEVh/crdm6HmQ04G7xSZHONUs=;
	b=ewnLZUPM9PvX/uB4JW1Oe93+eElQQZNdXrB0ZuOIWwwRGeJ7+79FdtlMItbaDviR2Arv
	 bDnkSZ/Ob0bq77dgQ+3ij/cS2DGrONLT/VLpK6us22Ro7Nboh8W/FFOSMOtCmfuuH371y
	 4W1TUcAd/Semn6uFUgIYLFVvUqIRveO5hvf7TYmoR/KQwnq1sLqlg8iExzHfMSfVxy0u6
	 QhvHt51UEJZHpamdRxfH9B/jVqAklIFLuesqW+Kuws7gjmCN7yUulJAt0Zm9TPFLkXUWI
	 AUepDAilPi+kY9Ueh9jBgkkAuNvLCLz30I+aYmV5PrAoywSe3jaxuCEeeg2Y/IToX6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WCDrUpQw;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421D1606A684
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 23:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 421D1606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WCDrUpQw
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-85c1135c289so2690061a34.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795477179; x=1796081979; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0U5hcBRCn7DYeLCXQ7hEVh/crdm6HmQ04G7xSZHONUs=;
        b=WCDrUpQw4KJhHcdJiYxKeYAhc3EQtTDCanAzb9KhDmQ4KMlW9CFOInrIq3rHkY/rf3
         qsLT/dIKBM3mDKz1q09xH4QbdsFwyEyAkCO0w/HwOHCgo60mv+cRPSsR2uD/WSXBks+R
         EEiFkxVtpXXmfo6CwTp7/Utri18E/qzyJ7y+lRWW5NVCtFEeWJ7fSQKvmOq+tA7kqQO8
         ko0Atg3xLk92yWrgmT8n+h+PuV4LQvQWUP8zXy4mhUQUIZjbefCfE4GmrPXixO01fZB3
         FOhJMjlos86mfIO6roqSLPbPiVMPIPlEzc3ulcF7V6OAmZKAqt/XzDvqZqQFQImgWg38
         LtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477179; x=1796081979;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0U5hcBRCn7DYeLCXQ7hEVh/crdm6HmQ04G7xSZHONUs=;
        b=Vs6N0P1VxNLJBCs8KHXbZ3sf0RT7S7hpEW3ug4hI1u1Z1iWX2iM6zVLgGiCqt5yML9
         W1Yp+lbqYYc1i7SVNmJ8r3EHdaGzwaYHQP5W1foYXLZVFDiM8Nso8gW2z930d00cWSkc
         ZgiTKuHpu04AMpDdGt/F2afYHBdQQ6ZSqrJQikK1JJhSo6npkSLAYVKEjHvqAOoecOxi
         ApRiaqL+OSLIcXyOk0BnJuIpRlKhm+p4TREcgTCR+gkF9arWMttddqkwVuFYb4tjUr/9
         dXDqzoyY8SZNJKakIuhIDR47bM4TvFlue6+YW+2OyV2OSuJmnGDBlik3PT74TqeCMZJu
         0byQ==
X-Forwarded-Encrypted: i=1; AL+hErFrXCtd+WKvBPNuPx80yhWIVP8Y/GBf7VIJrM7KLsTMCvvgvOTEftWKydRjfCukEPjfLJVSueEAfqXZNoCfw4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XrRBbgCiSaH+sns/mx/P5Bbbs3yifwr/ASZr7k/prtpjE9ihY
	IUxWEHG/8bb97W86ovfvQuhEH4WwWA63FU5uj/683iz4l+XckpJFGrMI/ZNXBtzFuw4B9PpdoDK
	Ve75KR/xtFft9Gw==
X-Received: from ioi10-n2.prod.google.com ([2002:a05:6602:c64a:20b0:9c7:7dbd:f35a])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4fc9:b0:573:4ad5:7e4d with SMTP id 5614622812f47-57a0ac2fa3bmr15601210b6e.35.1795477179082;
 Mon, 23 Nov 2026 15:39:39 -0800 (PST)
Date: Mon, 23 Nov 2026 23:39:12 +0000
In-Reply-To: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123233924.3970932-8-dmatlack@google.com>
Subject: [PATCH v5 07/18] liveupdate: Add helpers to track the files that LUO manages
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Add luo_track_file() and luo_untrack_file(), which add a file to and
remove it from luo_preserved_files, and use them instead of open-coding
xa_insert() and xa_erase() with luo_get_id() for preserved and retrieved
files.

The next commit lets file handlers make LUO track the file they retrieve
into, which adds more users. The helpers keep the key and the -EBUSY
behavior in one place.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 kernel/liveupdate/luo_file.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 0755a6478aec..d51bd75723fa 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -192,6 +192,19 @@ static unsigned long luo_get_id(struct liveupdate_file_handler *fh,
 	return fh->ops->get_id ? fh->ops->get_id(file) : (unsigned long)file;
 }
 
+/* Make LUO manage @file, or fail with -EBUSY if it already does. */
+static int luo_track_file(struct liveupdate_file_handler *fh, struct file *file)
+{
+	return xa_insert(&luo_preserved_files, luo_get_id(fh, file), file,
+			 GFP_KERNEL);
+}
+
+static void luo_untrack_file(struct liveupdate_file_handler *fh,
+			     struct file *file)
+{
+	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
+}
+
 static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
 {
 	struct luo_file *iter;
@@ -312,14 +325,13 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
 	if (err)
 		goto err_module_put;
 
-	err = xa_insert(&luo_preserved_files, luo_get_id(fh, file),
-			file, GFP_KERNEL);
+	err = luo_track_file(fh, file);
 	if (err)
 		goto err_free_arg;
 
 	err = luo_flb_file_preserve(fh);
 	if (err)
-		goto err_erase_xa;
+		goto err_untrack;
 
 	luo_file = kzalloc_obj(*luo_file);
 	if (!luo_file) {
@@ -351,8 +363,8 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
 	kfree(luo_file);
 err_flb_unpreserve:
 	luo_flb_file_unpreserve(fh);
-err_erase_xa:
-	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
+err_untrack:
+	luo_untrack_file(fh, file);
 err_free_arg:
 	kfree(args.arg);
 err_module_put:
@@ -401,8 +413,7 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
 		luo_file->fh->ops->unpreserve(&args);
 		luo_flb_file_unpreserve(luo_file->fh);
 
-		xa_erase(&luo_preserved_files,
-			 luo_get_id(luo_file->fh, luo_file->file));
+		luo_untrack_file(luo_file->fh, luo_file->file);
 		module_put(luo_file->fh->ops->owner);
 
 		list_del(&luo_file->list);
@@ -675,9 +686,7 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 		return err;
 	}
 
-	err = xa_insert(&luo_preserved_files,
-			luo_get_id(luo_file->fh, args.file), args.file,
-			GFP_KERNEL);
+	err = luo_track_file(luo_file->fh, args.file);
 	if (err) {
 		/* A retrieved file is new, so it can't be tracked already. */
 		WARN_ON_ONCE(err == -EBUSY);
@@ -796,8 +805,7 @@ int luo_file_finish(struct luo_file_set *file_set)
 
 		/* Only a successfully retrieved file was tracked. */
 		if (luo_file->retrieve_status > 0)
-			xa_erase(&luo_preserved_files,
-				 luo_get_id(luo_file->fh, luo_file->file));
+			luo_untrack_file(luo_file->fh, luo_file->file);
 		if (luo_file->file)
 			fput(luo_file->file);
 		module_put(luo_file->fh->ops->owner);
-- 
2.56.1.809.ga0b61035b5-goog

