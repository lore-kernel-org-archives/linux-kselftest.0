Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356660;
	b=YdqJ2bToX56J4SGTcyxS4ARm+gxc5Pqb9HWNUjhCzJbghHcyRTpJzSBCVbMOkaOHqTxf
	 dj37JNdCg8vDoFl5u2kBd+p4x/76BnA0sV1Fc2C2yYipvZVMMO6yJB2cwAMvQJdjYfR1E
	 xBrgsQPDA1B3WqR6+pEJdNhRFZPGtTcTZxzjUI9XCactmws40hF5ceTmQLo7scJbwWtE9
	 6FVUggYxy/snB3ELLLex3jOwJuBRS6lcwkhM/mIYZNwcD6iZ9HT8Mzax1HHC99sjGKjDg
	 nd3YuNe3h+JlN5aKU/xXqTJho7adh/s0dAHepd8SVDxSJrYPpgKrJkepSxijNsFcm2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=vbpaElakptIh2hFwmXWUs/sq4k+QmnD2y26Qhgoo1AI=;
	b=AJCKBOZTvQZF1x++xe2rtVPajif/K4YJcA4dvlrGgpw4N+gX7weVKgqDUHX/AaPftDqP
	 +SflVcI90jIzzY01cAmj+FbFycUK+jPoPhP90QYMX30SClYv/RzFNt/u+9iyHK4ctReZh
	 AHNo2lRcoMf9kaaUWnxuOMvsv1HsrW8GDE9ObpRy6p2VNGPqhpnjBV/H/MT2vw8sopJXv
	 byOWivYiaLLnk2SH3Hd6tlDRkbU2TTy4T3xrPxqAcEc6Wg9s1Zfxdbdp4y6BRqsB04PwX
	 /gAdhC6XFm67rzy3eLeicjatX8rue15yox4PYCwUH+V52DYVZJ9ivqg8WgYk+2Opo3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LbTkLkT8;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDA260A5BCA
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 00:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CDA260A5BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LbTkLkT8
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5587351d419so2013833b6e.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356659; x=1794961459; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbpaElakptIh2hFwmXWUs/sq4k+QmnD2y26Qhgoo1AI=;
        b=LbTkLkT8laBq1avVHHPTq7AeTg1yGlj+jizTp7NlFZ5LoqkpiVNMWLGQBCxr1iC+kb
         /K8ymlNrIA49xi2lMuATNMAml8PfsVlQM4kS4JZ5tKUH/V0Vske2MuK8bkhbnkb6f/QO
         nt8Ea0YYLYFKyxBmH/WXOllO8pM0HLZtiyxS/qumFB3vDGZPVlBGqgzZgUazlfV5w7p9
         QPbxNDdsZL0gAzy2gwzo0ICuKEkg283Qy4+DX0/DdhxIxP4T5B6YWuwoivuByDwXp2+g
         tLI3lcDP9qOCErxlEvlzxRrgjxhUaVaFbzIN93pEFoK+5apS8gWc4jji431bU+xcLtlJ
         kkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356659; x=1794961459;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbpaElakptIh2hFwmXWUs/sq4k+QmnD2y26Qhgoo1AI=;
        b=P0CTs8hlWSy1WL0w+/BaqmcjLOKPp/F2/z1nwcVMsDEW2NV8Zf9Xd/FsSziZknyv8w
         trOeXR/hLctAu3/5KMqGPg1jH3vYEsntdwAdqBVNvpuTIWzmZFs3YpH3TrjexN6XH+NV
         FQKwL1IvnuHE6BbDMyOQTXPpItyf9OcqLu7sXVgpskNDBMN9WWPTMjThGUCkpcdRMKr/
         ORLqGJuDNupzyWNaHkLYdtoKzaugOGNU2M0Rw9tAZdolvSQ/a9UR2540LrSqAc32cDHk
         gVtXg93rZVkTTWhCunOPp7LELvdp+MCLOPdlodXsQNAcyAlP10YjGp+3yIrq6/8RA/Po
         n1HQ==
X-Forwarded-Encrypted: i=1; AL+hErE8g+Ys8edVFkIDN4anwnoXPpiuTHb64lbGWVxEO88CS4AFE9ii1VWl3/QubSnuUdKUAhS/NaDicAJSMvzVXpI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1dZr9k7rdJqCQ03qk7bPxn+6e9Dp1IuPZjfjoTH336OPgnTf6
	xY36jQ5BabAWGhtVfmoVrTiLnjoJbeKfZ6k1M2iK717hNN1q2ymvSoPEIvhwGzrQIcXDehbInVt
	ZTGo82fXUkace0w==
X-Received: from ilben19-n1.prod.google.com ([2002:a05:6e02:5113:10b0:524:c21c:a8de])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:19a8:b0:539:596f:6623 with SMTP id 5614622812f47-56b98228b8bmr731061b6e.64.1794356659004;
 Tue, 10 Nov 2026 16:24:19 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:47 +0000
In-Reply-To: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111002358.1842967-10-dmatlack@google.com>
Subject: [PATCH v4 09/19] mm/shmem_luo: Leave freeing the preserved state to finish()
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

Don't free the serialized state in shmem_luo_retrieve(), whether the
retrieve succeeds or fails, and let finish() free whatever is left of
the preserved state of every file. Once retrieve() has restored the
folios, it sets nr_folios in the serialized state to 0, so that
finish() only frees the rest.

This fixes leaking the preserved folios when the retrieve fails before
it restores them, e.g. because the file has seals that this kernel
doesn't support, or because memfd_alloc_file() fails. The retrieve freed
the serialized state but not the folios, and finish() then skipped the
file because its retrieve had failed, so the folios were never freed.

Preserved folios may also be in use until the session is finished, e.g.
by a device that was preserved with DMA mappings of them, so they must
not be freed before finish().

Fixes: f85b1c6af5bc ("liveupdate: luo_file: remember retrieve() status")
Signed-off-by: David Matlack <dmatlack@google.com>
---
 mm/shmem_luo.c | 64 +++++++++++++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index e747a0442295..b48d7f460493 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -390,13 +390,10 @@ static void shmem_luo_finish(struct liveupdate_file_op_args *args)
 	struct shmem_luo_ser *ser;
 
 	/*
-	 * If retrieve was successful, nothing to do. If it failed, retrieve()
-	 * already cleaned up everything it could. So nothing to do there
-	 * either. Only need to clean up when retrieve was not called.
+	 * Preserved folios may be in use until the session is finished, so
+	 * retrieve() leaves freeing the preserved state to finish(), whether it
+	 * succeeds or not.
 	 */
-	if (args->retrieve_status)
-		return;
-
 	ser = phys_to_virt(args->serialized_data);
 	if (!ser)
 		return;
@@ -515,9 +512,34 @@ static int shmem_luo_retrieve_folios(struct file *file,
 	return err;
 }
 
-static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
+/*
+ * Restore the preserved folios into @file. This consumes them even if it fails,
+ * since they are then either in @file or freed, so make sure finish() doesn't
+ * free them again.
+ */
+static int shmem_luo_restore_folios(struct file *file,
+				    struct shmem_luo_ser *ser)
 {
 	struct shmem_luo_folio_ser *folios_ser;
+	u64 nr_folios = ser->nr_folios;
+	int err;
+
+	if (!nr_folios)
+		return 0;
+
+	ser->nr_folios = 0;
+
+	folios_ser = kho_restore_vmalloc(&ser->folios);
+	if (!folios_ser)
+		return -EINVAL;
+
+	err = shmem_luo_retrieve_folios(file, folios_ser, nr_folios);
+	vfree(folios_ser);
+	return err;
+}
+
+static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
+{
 	struct shmem_luo_ser *ser;
 	struct file *file;
 	int err;
@@ -527,10 +549,8 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 		return -EINVAL;
 
 	/* Make sure the file only has seals supported by this version. */
-	if (ser->seals & ~SHMEM_LUO_ALL_SEALS) {
-		err = -EOPNOTSUPP;
-		goto free_ser;
-	}
+	if (ser->seals & ~SHMEM_LUO_ALL_SEALS)
+		return -EOPNOTSUPP;
 
 	/*
 	 * The seals are preserved. Allow sealing here so they can be added
@@ -539,8 +559,7 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	file = memfd_alloc_file("", MFD_ALLOW_SEALING);
 	if (IS_ERR(file)) {
 		pr_err("failed to setup file: %pe\n", file);
-		err = PTR_ERR(file);
-		goto free_ser;
+		return PTR_ERR(file);
 	}
 
 	err = memfd_add_seals(file, ser->seals);
@@ -552,28 +571,15 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	vfs_setpos(file, ser->pos, MAX_LFS_FILESIZE);
 	i_size_write(file_inode(file), ser->size);
 
-	if (ser->nr_folios) {
-		folios_ser = kho_restore_vmalloc(&ser->folios);
-		if (!folios_ser) {
-			err = -EINVAL;
-			goto put_file;
-		}
-
-		err = shmem_luo_retrieve_folios(file, folios_ser, ser->nr_folios);
-		vfree(folios_ser);
-		if (err)
-			goto put_file;
-	}
+	err = shmem_luo_restore_folios(file, ser);
+	if (err)
+		goto put_file;
 
 	args->file = file;
-	kho_restore_free(ser);
-
 	return 0;
 
 put_file:
 	fput(file);
-free_ser:
-	kho_restore_free(ser);
 	return err;
 }
 
-- 
2.56.0.542.g3ef89b7020-goog

