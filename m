Received: from mail-oa1-f97.google.com (mail-oa1-f97.google.com [209.85.160.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6D33B4EB5
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 21:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791691; cv=none; b=J3Y4L56Db9fjoMPmoBwpqg2ig3Av5BUXGrql1NUQQBsr3ywlfgqCNoSJg4T/16UyaYlGG0So26+p2PYSgNUow7gVp7UazT5nyrodUlfS1NNQCum2m8/GQZo9iZnMDkRjJTv4y0fu5fPXgIc4ArnLIwMY63LQ95sCxzRok6+NZp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791691; c=relaxed/simple;
	bh=oHXxfW5IlQ1V89s+68++ytVnFnwh2NLZMo3nuYY1G5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XPB7nKvboNpn/s72m5vgQovDJV+uX/yMrf7UpQHxTp2clH4ZSWpQBRrUtD+dQgKQx6miCB5p5tBxAcsctWq4mfcFe7NuXSXEs28J+7B2S2UvFawdpVQfYygkSGRBQbjea6hN6bVA7q6i/Zp3NSJM0yt1tLyFfpViG8mW4K3BB2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=UWDGt9mh; arc=none smtp.client-ip=209.85.160.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="UWDGt9mh"
Received: by mail-oa1-f97.google.com with SMTP id 586e51a60fabf-43ccd57a931so866724fac.0
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 14:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1785791686; x=1786396486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vpVnITloaB/CuxZF0cmwJEghk018GUmAzlcAcdSo+j0=;
        b=UWDGt9mhF/OTKVAuvww/x54apzfGy0eMmHMQ1mIy7pq+ki5uzEk7s9q6x/ycKSan3o
         OWxS3E5WpGo4PcqGxrU4tPdQHpM9tyEGoSTKiRtwqJYekU+hvhK4fxC3bYUKyKqvz5DG
         0w6y/4CnwzuRsm1APj4TSc8BW+7vwVagrnYDTVX9V3nhxf77THFCSCG3OpXbrKj5cHA0
         Q8wwF2CJjllV5yUkTaoMipQWn0bpsbVW+Tol+BmIu57egMqmsk07ZHcabVW4rphDNJnx
         ThFo/tJFJyLVp3FZuaMK7O7aHqOLvac1xY+NktMZ9MoT/iz62suidjoU1JX1S0dkH0qx
         7XEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785791686; x=1786396486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vpVnITloaB/CuxZF0cmwJEghk018GUmAzlcAcdSo+j0=;
        b=nsYdHT4gdUaEdMqjmoVBuxz4wa3HA+aHTEnqkepSLCRxJ3wYyaS39UGhuHGdggAGxS
         7bRuqgZdtqSXeQ1cBowDJSWzWMQ+CKVH6gHYFUz32Fisfb5OTaXrSDsyoX4uHXxmKaBK
         NgXmB6EigQzDJmyqB1gGCVQlwZ4OjFtylib8i0V2QLxTt8xOXmyGp8TcvMILjpTRxZym
         AGvQEW29G1Xilo+Zcylf8eoZbUxTROBZ6gj2rZm/4kV12oKqv6eG4PKocXMMdCzHzBmr
         O78+1CtOw2YiYLmELo4AELUK45ej0zWUGzbmMvwtiWY2XZq0qwcaU4g39FtKgaBdDX+4
         KNkw==
X-Forwarded-Encrypted: i=1; AHgh+RrahJwNW6IAxqyJ+e6xu9KzgCQB7FmNQ4ZHiWEtGAbmquKvXLCkBsHlLD42+f7O4YTOwc6TXDTdmYYkGBIRcsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgwAd3EatMunXq+8ylG+7ge8YobuSjP9+51fZbykH7kPjnejvZ
	BqvxJusDCYQ1sfpQzaJsyCdZVwZAtMhqF3uXekfmRl1S79oGBgBrTHGwLH9DR5zUy5xloM1bMng
	uUMfFvIkFdLgdnSUhScvNyAkZRbQgXl/UExeDjSvyOLTXn5ZOKnuZ
X-Gm-Gg: AR+sD12ha8IkhYxnCTHa0MRmB1LASluRH9a/2C6YzbKbQDtDSJrtoAMY0BjawybRyyX
	3H6WAGN4cvTcIEyddfi6PvYTP9IX42nvJloHqcqMQjiMvYL6LXUBd1CiyK50ztU958dtHPh9EJF
	FIGXgwkXQRIh1t7XsqlVk6dDV6XhOx/+zMf+WChrbKkT5sl9qxT3BDWuIkMZCuYPhzCjguqaxLm
	1MabavJrDW+C6HIVhmbTFEjYzVbSXaS/jdikKxaP3y0zZdf/HRhlYOL7lhq8ENTQjkXhgOy5k2v
	/r/HRYgJ9veOAqm9bYrypmc6eEwAASwAcH7enGGFLzI/CoS+yIUdrJzkzOpAUSW/bn8tw+6ZRzN
	AttOQF2UKEOa0O8aBlQ==
X-Received: by 2002:a05:6830:8d1:b0:7e9:c631:98b6 with SMTP id 46e09a7af769-7f196f85314mr10975146a34.3.1785791686286;
        Mon, 03 Aug 2026 14:14:46 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-458f66afb19sm1030795fac.12.2026.08.03.14.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 14:14:46 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.112.12.104])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id D495B402B3;
	Mon,  3 Aug 2026 15:14:45 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id D220EE4041D; Mon,  3 Aug 2026 15:14:45 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <tom.leiming@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 8/8] ublk: lift checks out of ublk_{,un}map_io()
Date: Mon,  3 Aug 2026 15:14:40 -0600
Message-ID: <20260803211441.2538144-9-csander@purestorage.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260803211441.2538144-1-csander@purestorage.com>
References: <20260803211441.2538144-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ublk_map_io() and ublk_unmap_io() are no-ops for ublk devices that
enable user copy or zero copy, as well as for requests without data to
copy in the given direction. However, the implementation is a bit
convoluted, returning the full request data length and relying on the
caller to check the return value against the request length.
UBLK_F_SHMEM_ZC recently added branches to skip the ublk_{,un}map_io()
call for I/Os using a shared-memory buffer. This is a more logical place
for the device need_map and the ublk_need_{,un}map_req() checks, so move
them there from ublk_{,un}map_io().

Checking these conditions early also skips the expensive pointer-chasing
for the ublk_iod_is_shmem_zc() check in __ublk_complete_rq() for the
common case of a ublk device using user copy or zero copy.

Drop the req_op() filter in __ublk_complete_rq(), as it's redundant with
the ublk_need_unmap_req() check.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
Reviewed-by: Ming Lei <tom.leiming@gmail.com>
---
 drivers/block/ublk_drv.c | 70 +++++++++++-----------------------------
 1 file changed, 19 insertions(+), 51 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 2f5de735b2d2..9249d25dceed 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1466,57 +1466,33 @@ static inline bool ublk_need_unmap_req(const struct request *req)
 {
 	return blk_rq_has_data(req) &&
 	       (req_op(req) == REQ_OP_READ || req_op(req) == REQ_OP_DRV_IN);
 }
 
-static unsigned int ublk_map_io(const struct ublk_queue *ubq,
-				const struct request *req,
+static unsigned int ublk_map_io(const struct request *req,
 				const struct ublk_io *io)
 {
-	const unsigned int rq_bytes = blk_rq_bytes(req);
+	struct iov_iter iter;
+	const int dir = ITER_DEST;
 
-	if (!ublk_need_map_io(ubq))
-		return rq_bytes;
-
-	/*
-	 * no zero copy, we delay copy WRITE request data into ublksrv
-	 * context and the big benefit is that pinning pages in current
-	 * context is pretty fast, see ublk_pin_user_pages
-	 */
-	if (ublk_need_map_req(req)) {
-		struct iov_iter iter;
-		const int dir = ITER_DEST;
-
-		if (import_ubuf(dir, u64_to_user_ptr(io->buf.addr), rq_bytes,
-				&iter) < 0)
-			return 0;
+	if (import_ubuf(dir, u64_to_user_ptr(io->buf.addr), blk_rq_bytes(req),
+			&iter) < 0)
+		return 0;
 
-		return ublk_copy_user_pages(req, 0, &iter, dir);
-	}
-	return rq_bytes;
+	return ublk_copy_user_pages(req, 0, &iter, dir);
 }
 
-static unsigned int ublk_unmap_io(bool need_map,
-		const struct request *req,
+static unsigned int ublk_unmap_io(const struct request *req,
 		const struct ublk_io *io)
 {
-	const unsigned int rq_bytes = blk_rq_bytes(req);
-
-	if (!need_map)
-		return rq_bytes;
-
-	if (ublk_need_unmap_req(req)) {
-		struct iov_iter iter;
-		const int dir = ITER_SOURCE;
+	struct iov_iter iter;
+	const int dir = ITER_SOURCE;
 
-		if (import_ubuf(dir, u64_to_user_ptr(io->buf.addr), io->res,
-				&iter) < 0)
-			return 0;
+	if (import_ubuf(dir, u64_to_user_ptr(io->buf.addr), io->res, &iter) < 0)
+		return 0;
 
-		return ublk_copy_user_pages(req, 0, &iter, dir);
-	}
-	return rq_bytes;
+	return ublk_copy_user_pages(req, 0, &iter, dir);
 }
 
 static bool ublk_validate_req(const struct ublk_queue *ubq,
 			      const struct request *req)
 {
@@ -1588,26 +1564,17 @@ static inline void __ublk_complete_rq(struct request *req, struct ublk_io *io,
 	if (io->res < 0) {
 		res = errno_to_blk_status(io->res);
 		goto exit;
 	}
 
-	/*
-	 * FLUSH, DISCARD or WRITE_ZEROES usually won't return bytes returned, so end them
-	 * directly.
-	 *
-	 * Both the two needn't unmap.
-	 */
-	if (req_op(req) != REQ_OP_READ && req_op(req) != REQ_OP_WRITE &&
-	    req_op(req) != REQ_OP_DRV_IN)
-		goto exit;
-
 	/* shmem zero copy: no data to unmap, pages already shared */
-	if (ublk_iod_is_shmem_zc(req->mq_hctx->driver_data, req->tag))
+	if (!need_map || !ublk_need_unmap_req(req) ||
+	    ublk_iod_is_shmem_zc(req->mq_hctx->driver_data, req->tag))
 		goto exit;
 
 	/* for READ request, writing data in iod->addr to rq buffers */
-	unmapped_bytes = ublk_unmap_io(need_map, req, io);
+	unmapped_bytes = ublk_unmap_io(req, io);
 
 	/*
 	 * Extremely impossible since we got data filled in just before
 	 *
 	 * Re-read simply for this unlikely case.
@@ -1769,14 +1736,15 @@ static bool ublk_start_io(const struct ublk_queue *ubq, struct request *req,
 			  struct ublk_io *io)
 {
 	unsigned mapped_bytes;
 
 	/* shmem zero copy: skip data copy, pages already shared */
-	if (ublk_iod_is_shmem_zc(ubq, req->tag))
+	if (!ublk_need_map_io(ubq) || !ublk_need_map_req(req) ||
+	    ublk_iod_is_shmem_zc(ubq, req->tag))
 		return true;
 
-	mapped_bytes = ublk_map_io(ubq, req, io);
+	mapped_bytes = ublk_map_io(req, io);
 
 	/* partially mapped, update io descriptor */
 	if (unlikely(mapped_bytes != blk_rq_bytes(req))) {
 		/*
 		 * Nothing mapped, retry until we succeed.
-- 
2.54.0

