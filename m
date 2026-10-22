Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709443;
	b=zv++x+f20Ysbz1glza5DvTNtr5g2ykd7ms5Vdq+AwlozTZKyqla6BcofZxFK0k0vGqJG
	 GVxiEkM3TS8iqb/TrIg7aiCAAVAY0S3YY08r8+itWYcu3y/vQXSarWB0nEjIu8+nY1YGG
	 75c7h9ELGwWEmISfQUFniZUx4RY0M3g4laDQO1sDGm6HK/y1QQkxWeDyiNJm5wYUaPN7M
	 8tjJDUPGjRmyPCmjhnrzfdJlMO51IdjoQVkp/0y7Slt8iga7i+uljRh37jGCvKKXTLq5C
	 18+NSekTBGsSz2hs6cVPnaSfQydZ+JH7p0dnqtnKrCFhdYLiRjoyKRltIwOtE1l0QOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=QRGmnu+5Eb3jc4pybJnePwOeBfzJdgL5DEYasCwAfpw=;
	b=YEb7V94a9EZKKBvgJ1eHG9lZlDmmjjncXhtL+ISPhvsGLETQmDcBN8m2BZeSGqr6GHY+
	 EZ3tn4FMxBWyej+mQmGXcOov/XB5ByYxdBp7/npgClQWGxuG+yVNDpyW3/lU1fXlscd0j
	 3iC0T9ujOh/omMACvGqVijaOut/T2VYy144XyDkaYC1/R5Klkav1DHcRQE8aR6k7Ttqfl
	 OVPxGkUDnDtJKWeH0eQQpGFb4VtWVlXFAm3CSRr+f04AUgVC3ldUJSESSjxHGwgMZboKn
	 ulB/Eu3/lNBlAqmL0LD5iBgR34E/Fj8bvwt0B8TWvJ4ABXs6n+3rEVuN0ErmT+UGU6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="Z+/XXPUF";
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001B2606A33C
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 22:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 001B2606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Z+/XXPUF
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93e2f72bfso2654245ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792709442; x=1793314242; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRGmnu+5Eb3jc4pybJnePwOeBfzJdgL5DEYasCwAfpw=;
        b=Z+/XXPUFmVmC5mVsEOw9RDTDxL7sGpoEDkjYTwWRUb1pHFVL8eT0mJh0RDtmFeNwoO
         sb4IOO4ushBGVZOf/szyEenft9lCTcLloC8YgzjP6QWzPo1Rp9qadN8Xf5fD69CQiwe5
         FE+N9rOVj0v0uO/jHXNQg7d9ojYrcpDOZm/+iv20BD7mHFs90bE/Y1C5LfWBMuBB2Ngv
         5dJvmcGUBfCOHUA2wpo8pQJzOj620CmKEHOsI/4SgZmsVZ71af9tU5qUi4m8otR5r89O
         AE13JYaWG2cd53YL3fFxhPF2yEKO0Xq4+3SElXDXNIlJ46iFsQVek+1VsOgq4HGLQSv/
         atmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709442; x=1793314242;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRGmnu+5Eb3jc4pybJnePwOeBfzJdgL5DEYasCwAfpw=;
        b=Yf1J6QpUOTkfgohLwThf0FntajVtYfxOtbBWz0wLMPO6sY+32nOv8SdW7IUmjmDIVR
         OYiVnC/0QMxA1SwKSZY2cSaDfkBQEMyE8VQAlPAdOAKW9QdAdSuTuG5nrcVapTOWZQqS
         GpRyjcVyGkBr0YNi+1luaaN34qHWgmRsOdjs3gzukotl7b2gBNRZTLR2vGElWTO3aNUB
         jsekvJKpeKlWbv7+fzZrFODlf96Q6m1izPffzKLvPxCIDSyVhW7L40Ig3WNhYFYdGQES
         zed+1V71bxeFA7zgKbrH+4jTiZx8a5w+lQ9M4mrWyiDX+1eE3OVeQaJLNMBGefJg5m5u
         2+ZA==
X-Forwarded-Encrypted: i=1; AKwUvBxj5iYriEbY1JvZwgvclU4diI6WAR/ieFUv8E1yTHF4y9dKHVkc5LDOMq+fXyLaH5TGMxehy8HXQ+OObl9tPqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLi2IJ4dVjfYwJJP8S+ydH5npu26qSvkQ0ym/ofCV2AKEhnHECu
	zqXMsKFyChLZoYFPUtGZzn1zAgP0Y+vzubiYEjeeQv7qmbFSQjOWbw75xGXj8CaYdYnMO4T1oN0
	+oUUkCkxytExmvg==
X-Received: from plpa12.prod.google.com ([2002:a17:902:900c:b0:2e4:8c0e:97db])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e5c8:b0:2ea:192a:13b8 with SMTP id d9443c01a7336-2ea7d09b8ebmr5151125ad.20.1792709442296;
 Thu, 22 Oct 2026 15:50:42 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:50:30 +0000
In-Reply-To: <20261022225035.377445-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022225035.377445-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022225035.377445-6-dmatlack@google.com>
Subject: [PATCH v2 05/10] liveupdate: Don't WARN if tracking a retrieved file fails
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

Handle a failure to add a retrieved file to luo_preserved_files instead
of triggering a WARN_ON(). xa_insert() can fail with -ENOMEM, and
userspace can trigger that with LIVEUPDATE_SESSION_RETRIEVE_FD, so
warning about it lets userspace crash systems with panic_on_warn.

The handler has already consumed the preserved state when this happens,
so make the failure permanent. Keep the file until the file set is
finished, like any other retrieved file, so that its resources are not
released before then. Finishing the file set then erases the file from
luo_preserved_files, which does nothing for a file that was never added.

Fixes: 00d0b372374f ("liveupdate: prevent double management of files")
Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 kernel/liveupdate/luo_file.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 908ae124ea5e..5a82e45b9062 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -684,14 +684,25 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token, u64 arg,
 		return err;
 	}
 
+	err = xa_insert(&luo_preserved_files,
+			luo_get_id(luo_file->fh, args.file), args.file,
+			GFP_KERNEL);
+	if (err) {
+		/*
+		 * The handler has consumed the preserved state, so the retrieve
+		 * can't be retried. Keep the file until the file set is
+		 * finished, so that its resources are released at the same
+		 * time as those of other retrieved files.
+		 */
+		luo_file->file = args.file;
+		luo_file->retrieve_status = err;
+		return err;
+	}
+
 	luo_file->file = args.file;
 	/* Get reference so we can keep this file in LUO until finish */
 	get_file(luo_file->file);
 
-	WARN_ON(xa_insert(&luo_preserved_files,
-			  luo_get_id(luo_file->fh, luo_file->file),
-			  luo_file->file, GFP_KERNEL));
-
 	*filep = luo_file->file;
 	luo_file->retrieve_status = 1;
 
-- 
2.56.0.257.gf7497c7d27-goog

