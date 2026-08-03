Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475F53B6BF1
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 21:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791690; cv=none; b=WnOsX3Ky1J1lsX2QtqVvh2S74eoTiKb4hqbpl0R0WQZguaERN6rmPNYXHVNasg1CQDi38os4XrJXroK7MJnh0BYg5jvPwtIm6fz9HIl9gRErTofYhWNvzrEvM4EEDtYucoLMy8qCNWy9Rj8OEAlFTJ04BPsl+GbsKYzB3hyii3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791690; c=relaxed/simple;
	bh=FZL9v2s6V8OT5jqjZ1eRmbGaCvw5y2UKD5VJGsOygJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AaheQrwMjLuYMvsfmsfSghUN5Lbx3BGglWhoYGFc7lNLvo/YSvxniahLgt8kCExafVg/4SBhcnx6bKymdBwn4lOYtBYEg9t2cDqLd7VXlNMXoyLrNEizdKYNSZU6PhtAU0yk3ZrhaN07pK4PXn8CkMZIgr+ZEuLst9JXJPC80Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Zh+Kgzcq; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Zh+Kgzcq"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cb2513ec378so217026a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 14:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1785791686; x=1786396486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/+0NVp90japE4LHVXnwsuexjdaVJbd+UcY0JpTVc78=;
        b=Zh+KgzcqsjZ9fYjx0VQ/MVPSZonJ6O/NVeSOSGyYNcIgONdfM1jR4b1EUZDTvtzo7T
         Ax+4iR7LWDUZSAbvhIILk/2IgnDJoIC/qUnFX4WAXmOIEdc5z0Pk/IV2KsRrz4pS4eky
         +1goBgeqks8KDihQVW0iq2F47kwXeZVJA6jmZngrZ6KcsUW5oVNu6GfK+/fhHfzbRncd
         FN7f3xV7w9Plyh5AidCfd906R2vvz9asRnRT+4zOL/HdjRQ8iu4iUsuA0zORX+mQOqiF
         PJyCit8DlApqogldVSmzQemURP11V+q90CutXFoUOxH4lK2mwqa5MmDuyVJdQ9vJecns
         zuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785791686; x=1786396486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/+0NVp90japE4LHVXnwsuexjdaVJbd+UcY0JpTVc78=;
        b=X3EwS4RkWUqXbcY6vDixd4DUoXEIQAjnSnNKWMk7huio670wA8kznabEF5DnPhy6br
         wrUAHgI54h7brR+DxoghH4d1WoFLu3OaWpriKC/qRlsGB5CeRV+hPNcO0omXvlloLVyD
         VZeVcKpStsr0u/cL9y1zqD0blWgQkan8JBcSdo/1E/Qa7Dv9d4UK8RkJ6IX7t27DWYT3
         vgCt8yGaKCKiHyggXnrDkBnvb2GrIprHjyyHYMrb7yXV3HFChhuEWTeMf/SfR01dBhSI
         7dMJ1IJVnA/DiMpP+DcyAP3CNWrj25l1i+sJuIVGUKGiDUnWO7jZCZcMvjC89iNQKu0A
         /MSg==
X-Forwarded-Encrypted: i=1; AHgh+Rpvw+z3BB5e5+UaWApz7tqfQPec3+bTo2CFdt17dvKWDG5bgU7yWiHdrty+Xrz/poPtQESukXZfziJV5fUBUR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXOyzrFGl3oRlmzp659+OICx784CHtmdCyXmQVER2LTPtmTkhj
	UD/2E/fULMU9rVwDtmVaQh4CxGka1DYQTba8N6ltNzgyvQuRC/zdhINuHGqcVLydID5I3GcnSDm
	yCr5bMI+5s7ku2+LBuggkHIVpk5XsleSwnK1jKlASjVkUeE0dnG60
X-Gm-Gg: AR+sD13ZBVY4poJDOqW7BnBDJ2NJJ9EsEqoX96FwbYK5bC9ZuXV1Hs/NuePz+sfUIee
	Zxc+GoMtdOVSmqsRThoBu3/syr7g3NAhKhdSGtL5BchDhhAMZpyqbqvSjZpVpzv1ra07Rmomk1q
	Yn7dr+aTbTaMGgUQndNbv6Zzr8NOEKw9wrgf60g+cd8OOxKyNHUGrmVjwdAJXaKaNjnS1SWzj2B
	tX4XT6ddQsVJ1bJuM5yxBSpXRRChvZOVS7CJvCIuxz9bd8gN2cEEsNvluku47a713B2Hmg5ZEIZ
	ivAhdEXX7Sz4c0kAs3zKPBQVHMqhcarz/zRf8jPmtdj7U2z6sM8rINBTAnuF96BEAsNojLUgkci
	tKVefeHPxhTIQKPkLEg==
X-Received: by 2002:a17:903:38c7:b0:2c9:8287:fd0d with SMTP id d9443c01a7336-2d052438c91mr158785315ad.3.1785791685662;
        Mon, 03 Aug 2026 14:14:45 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2d04b16e439sm11538945ad.47.2026.08.03.14.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 14:14:45 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.112.12.104])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 07E1F43663;
	Mon,  3 Aug 2026 15:14:45 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 0567DE4041D; Mon,  3 Aug 2026 15:14:45 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <tom.leiming@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 3/8] ublk: split request validation from io_desc init
Date: Mon,  3 Aug 2026 15:14:35 -0600
Message-ID: <20260803211441.2538144-4-csander@purestorage.com>
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

In preparation for moving the struct ublksrv_io_desc initialization from
the thread submitting ublk requests to the daemon thread receiving them,
split the fallible part of ublk_setup_iod{,_zoned}() into new helper
ublk_validate_req{,_zoned}(). Only ublk_setup_iod{,_zoned}() accesses
the io_desc and cannot error out.

Return a bool value from ublk_validate_req{,_zoned}() as the existing
error code ublk_setup_iod{,_zoned}() returns is only checked against
BLK_STS_OK.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
Reviewed-by: Ming Lei <tom.leiming@gmail.com>
---
 drivers/block/ublk_drv.c | 70 +++++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 22 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index d364a5d0ebc2..7f0549238d76 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -698,12 +698,28 @@ static int ublk_report_zones(struct gendisk *disk, sector_t sector,
 out:
 	kvfree(buffer);
 	return ret;
 }
 
-static blk_status_t ublk_setup_iod_zoned(struct ublk_queue *ubq,
-					 struct request *req)
+static bool ublk_validate_req_zoned(const struct request *req)
+{
+	switch (req_op(req)) {
+	case REQ_OP_ZONE_OPEN:
+	case REQ_OP_ZONE_CLOSE:
+	case REQ_OP_ZONE_FINISH:
+	case REQ_OP_ZONE_RESET:
+	case REQ_OP_ZONE_APPEND:
+	case REQ_OP_ZONE_RESET_ALL:
+		return true;
+	case REQ_OP_DRV_IN:
+		return !!ublk_zoned_get_report_desc(req);
+	default:
+		return false;
+	}
+}
+
+static void ublk_setup_iod_zoned(struct ublk_queue *ubq, struct request *req)
 {
 	struct ublk_zoned_report_desc *desc;
 	u32 ublk_op;
 
 	switch (req_op(req)) {
@@ -725,24 +741,19 @@ static blk_status_t ublk_setup_iod_zoned(struct ublk_queue *ubq,
 	case REQ_OP_ZONE_RESET_ALL:
 		ublk_op = UBLK_IO_OP_ZONE_RESET_ALL;
 		break;
 	case REQ_OP_DRV_IN:
 		desc = ublk_zoned_get_report_desc(req);
-		if (!desc)
-			return BLK_STS_IOERR;
 		ublk_init_iod(ubq, req, UBLK_IO_OP_REPORT_ZONES, desc->nr_zones,
 			      desc->sector);
-		return BLK_STS_OK;
-	case REQ_OP_DRV_OUT:
-		/* We do not support drv_out */
-		return BLK_STS_NOTSUPP;
+		return;
 	default:
-		return BLK_STS_IOERR;
+		WARN_ON_ONCE(1);
+		return;
 	}
 
 	ublk_init_iod(ubq, req, ublk_op, blk_rq_sectors(req), blk_rq_pos(req));
-	return BLK_STS_OK;
 }
 
 #else
 
 #define ublk_report_zones (NULL)
@@ -759,14 +770,18 @@ static void ublk_dev_param_zoned_apply(struct ublk_device *ub)
 static int ublk_revalidate_disk_zones(struct ublk_device *ub)
 {
 	return 0;
 }
 
-static blk_status_t ublk_setup_iod_zoned(struct ublk_queue *ubq,
-					 struct request *req)
+static bool ublk_validate_req_zoned(const struct request *req)
 {
-	return BLK_STS_NOTSUPP;
+	return false;
+}
+
+static void ublk_setup_iod_zoned(struct ublk_queue *ubq, struct request *req)
+{
+	WARN_ON_ONCE(1);
 }
 
 #endif
 
 static inline void __ublk_complete_rq(struct request *req, struct ublk_io *io,
@@ -1495,11 +1510,26 @@ static unsigned int ublk_unmap_io(bool need_map,
 		return ublk_copy_user_pages(req, 0, &iter, dir);
 	}
 	return rq_bytes;
 }
 
-static blk_status_t ublk_setup_iod(struct ublk_queue *ubq, struct request *req)
+static bool ublk_validate_req(const struct ublk_queue *ubq,
+			      const struct request *req)
+{
+	switch (req_op(req)) {
+	case REQ_OP_READ:
+	case REQ_OP_WRITE:
+	case REQ_OP_FLUSH:
+	case REQ_OP_DISCARD:
+	case REQ_OP_WRITE_ZEROES:
+		return true;
+	default:
+		return ublk_queue_is_zoned(ubq) && ublk_validate_req_zoned(req);
+	}
+}
+
+static void ublk_setup_iod(struct ublk_queue *ubq, struct request *req)
 {
 	u32 ublk_op;
 
 	switch (req_op(req)) {
 	case REQ_OP_READ:
@@ -1516,17 +1546,15 @@ static blk_status_t ublk_setup_iod(struct ublk_queue *ubq, struct request *req)
 		break;
 	case REQ_OP_WRITE_ZEROES:
 		ublk_op = UBLK_IO_OP_WRITE_ZEROES;
 		break;
 	default:
-		if (ublk_queue_is_zoned(ubq))
-			return ublk_setup_iod_zoned(ubq, req);
-		return BLK_STS_IOERR;
+		ublk_setup_iod_zoned(ubq, req);
+		return;
 	}
 
 	ublk_init_iod(ubq, req, ublk_op, blk_rq_sectors(req), blk_rq_pos(req));
-	return BLK_STS_OK;
 }
 
 static inline struct ublk_uring_cmd_pdu *ublk_get_uring_cmd_pdu(
 		struct io_uring_cmd *ioucmd)
 {
@@ -2136,12 +2164,10 @@ static enum blk_eh_timer_return ublk_timeout(struct request *rq)
 }
 
 static blk_status_t ublk_prep_req(struct ublk_queue *ubq, struct request *rq,
 				  bool check_cancel)
 {
-	blk_status_t res;
-
 	if (unlikely(READ_ONCE(ubq->fail_io)))
 		return BLK_STS_TARGET;
 
 	/* With recovery feature enabled, force_abort is set in
 	 * ublk_stop_dev() before calling del_gendisk(). We have to
@@ -2158,14 +2184,14 @@ static blk_status_t ublk_prep_req(struct ublk_queue *ubq, struct request *rq,
 
 	if (check_cancel && unlikely(ubq->canceling))
 		return BLK_STS_IOERR;
 
 	/* fill iod to slot in io cmd buffer */
-	res = ublk_setup_iod(ubq, rq);
-	if (unlikely(res != BLK_STS_OK))
+	if (unlikely(!ublk_validate_req(ubq, rq)))
 		return BLK_STS_IOERR;
 
+	ublk_setup_iod(ubq, rq);
 	blk_mq_start_request(rq);
 	return BLK_STS_OK;
 }
 
 /*
-- 
2.54.0

