Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667751;
	b=NQ5jhMkL9IzmzTWZanuo2+6WginqE557vx+Pb9F0QrknLkIgyttOQVV2vvzMgA7YnWS3
	 nC0Eo50wTgA4OOAOASaNJcoodYRAde36wuLdIZhBZd5Vmor900PeRLOKy6bUahyBXSCMp
	 ND8UX0dTTrFApfjWx/uNe1dMzbtQy7OJDUroH3dTTC20OILGfy2kgQobssIkKwd2LrreY
	 sVbcHvxpWNmlzLqkrXsqB4BrfxOVrwPO2FN4KhKLDM5R/dc/bzNEvryEngA1ZtLoBPlCf
	 4mmB1e8/8L8ZZbJDclsUbOdOhcuuGEJj3pFJM3bxkTSkBuZUuXy+1Brq0ZIWJNkMzFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=cNS9XkUpb0odYgcS4hw74G9m0QCGpHkW7/U/VrcLoMQ=;
	b=hXsL3cISbQGbiuurhJrxHV/e8HB7V6fWAdOAdB/7LFvcxKIhj7d1iikI3QurPx0BiYp/
	 Q3VEl8P7S3ehNuXKhWKm9ZvqeDDcXljB13xsliUV7vh1dmFPYxpjY6JMxWHYr8QH8GPI8
	 WTPCB0bUpLsLU7qjC11TELNnn4pkPtPkRIMYi8jGP6xZbSVXSogygyVpqzQrIIGH4Nqk0
	 Dy0LHxUG0mv4e0nGlv+vG0pf46/Wa3rK9Jl9FAoWvELIrcqXI2+cWTSW2mfm73w7LhxIC
	 6wZg0O35XuwKBpS+AelKUcYVSWtHnRw4BwFg9XdTU8Z/EhW2ZMjf/ZMfoDBjUdv9AoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mJbpzdJe;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A524E606EE83
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 01:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A524E606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mJbpzdJe
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso2840904a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 17:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793667750; x=1794272550; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cNS9XkUpb0odYgcS4hw74G9m0QCGpHkW7/U/VrcLoMQ=;
        b=mJbpzdJeCyu3yLHXZt69+nxo7Lzx8OIPb7UjQxO3/IG0xDecGkx8g7oBQj+L/Vmgak
         hFwhFvkjkivAwFqBqFjI6cR07zDgZ3xu4sKysNz8o+rbZGiqP5XmkQ30RXBmknw+JocO
         aN7ppu+Scs1Sou3v80lw6C+mkOI9RJ2vclculwNEBgoI/j4eqvEZWR1/NL8luKM1yR4f
         i1PJ+VrhfbufiLygLzqdMEcDRDIA3j4twQyV9uX5jetASmz1Xkb00cl4QFLaXfRCFlV7
         6f1llRizf1eCppAtXWBpdhZyODADSkRrFX5nrvxYHExc52yN8D2Pqci1rwboebJsRX0w
         s2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667750; x=1794272550;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cNS9XkUpb0odYgcS4hw74G9m0QCGpHkW7/U/VrcLoMQ=;
        b=Ng5sholntF5UK/rEVMmyt/j2j6bn/eqPpLzWZOZcAJxaD4TTLv8SdnmvmW7rK7s7tt
         G05kNcV3zsnqxpnym2G1afMv6iG0hrqcXOeLQE7Gw33fRYO+0AIQzBPhhb/E1syTRo/l
         hGUoFS1CbgD5Yxc1jKb8mc4FWmlBI7xgfN2kmdwFp8qkayphl3eublK3OSWHCbP2selW
         01rjJIc1kk0zG/nJVSpxSQhDMovuUgCxTkcKzGzxvv/INg70fXxwWJNcST/yjXF0VNhZ
         AFQRECtNNB5YWOjSn/b3oNcvsDEV11nQXH0JOGYOrLvFf8Uw9gNvvEhUzZaVlFV2VgEq
         u4kA==
X-Forwarded-Encrypted: i=1; AKwUvBzxgMo0vbTGSsL/5QYadct3wnCYrauEQY0++RRR8cD2W92yixe/jmH2asFOv0mYVkq7FRitTadv4PoH1IDsAP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/y1OguVpF6DlWkg0n6gr1fUzbb/7mS2UoItdeN/ANvkSu3TX5U
	lf0yi1dfC6q2dTshn5hqtdP295lvucur6FROa9MUzpTyIb/oeUTeTrS6bq22x3Su1RaUjVMDfqP
	fh0tgjqv66eaG0Q==
X-Received: from pjbgd1.prod.google.com ([2002:a17:90b:fc1:b0:3ad:5136:109b])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1b11:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3ae897dd40fmr9335117a91.66.1793667749818;
 Mon, 02 Nov 2026 17:02:29 -0800 (PST)
Date: Tue,  3 Nov 2026 01:02:12 +0000
In-Reply-To: <20261103010216.3447716-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103010216.3447716-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103010216.3447716-7-dmatlack@google.com>
Subject: [PATCH v3 06/10] mm/shmem_luo: Don't make early retrieve failures permanent
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

Mark failures in shmem_luo_retrieve() before it starts restoring the
folios as retryable, and return the error without freeing the serialized
state. If no retrieve succeeds, finish() frees the preserved folios,
like it does for a file that was never retrieved.

Nothing has consumed the preserved state before the folios are
restored, so the retrieve can be tried again.

This also fixes leaking the preserved folios when one of these early
steps fails, e.g. because the file has seals that this kernel doesn't
support. The retrieve freed the serialized state but not the folios, and
finish() then skipped the file because its retrieve had failed. There is
no Fixes tag, since the fix relies on args->retryable, which was only
added earlier in this series.

Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/shmem_luo.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index b8d86055912d..bcac1bbb3db3 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -390,9 +390,9 @@ static void shmem_luo_finish(struct liveupdate_file_op_args *args)
 	struct shmem_luo_ser *ser;
 
 	/*
-	 * If retrieve was successful, nothing to do. If it failed, retrieve()
-	 * already cleaned up everything it could. So nothing to do there
-	 * either. Only need to clean up when retrieve was not called.
+	 * If retrieve was successful, nothing to do. If it failed permanently,
+	 * retrieve() already cleaned up everything it could. So nothing to do
+	 * there either. Only need to clean up when the file was not retrieved.
 	 */
 	if (args->retrieve_status)
 		return;
@@ -526,11 +526,16 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	if (!ser)
 		return -EINVAL;
 
+	/*
+	 * Nothing has consumed the preserved state until the folios are
+	 * restored below, so failures before that can be retried. If no
+	 * retrieve succeeds, finish() frees the preserved state.
+	 */
+	args->retryable = true;
+
 	/* Make sure the file only has seals supported by this version. */
-	if (ser->seals & ~SHMEM_LUO_ALL_SEALS) {
-		err = -EOPNOTSUPP;
-		goto free_ser;
-	}
+	if (ser->seals & ~SHMEM_LUO_ALL_SEALS)
+		return -EOPNOTSUPP;
 
 	/*
 	 * The seals are preserved. Allow sealing here so they can be added
@@ -539,8 +544,7 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	file = memfd_alloc_file("", MFD_ALLOW_SEALING);
 	if (IS_ERR(file)) {
 		pr_err("failed to setup file: %pe\n", file);
-		err = PTR_ERR(file);
-		goto free_ser;
+		return PTR_ERR(file);
 	}
 
 	err = memfd_add_seals(file, ser->seals);
@@ -552,17 +556,20 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	vfs_setpos(file, ser->pos, MAX_LFS_FILESIZE);
 	i_size_write(file_inode(file), ser->size);
 
+	/* The preserved state is consumed from here on. */
+	args->retryable = false;
+
 	if (ser->nr_folios) {
 		folios_ser = kho_restore_vmalloc(&ser->folios);
 		if (!folios_ser) {
 			err = -EINVAL;
-			goto put_file;
+			goto free_ser;
 		}
 
 		err = shmem_luo_retrieve_folios(file, folios_ser, ser->nr_folios);
 		vfree(folios_ser);
 		if (err)
-			goto put_file;
+			goto free_ser;
 	}
 
 	args->file = file;
@@ -570,10 +577,10 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 
 	return 0;
 
-put_file:
-	fput(file);
 free_ser:
 	kho_restore_free(ser);
+put_file:
+	fput(file);
 	return err;
 }
 
-- 
2.56.0.385.gac671c819a-goog

