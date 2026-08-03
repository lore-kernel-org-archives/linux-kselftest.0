Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DA340F732
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 21:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791692; cv=none; b=ng1u+eW3UcjOIFmMqlMMHMZnCa2w+emL44CQTjyOZ8/qZcvAjRuPo2hBi6q+WmLmzoX5qy0qcHtARGrG3wx8R9nAlvib3KZoD5lxB2nbWB1phBP2X2XPSi5K9IfO57dFjimZOJzv+GwVdxMvlhJbJO6F8q6dmJAcSmK4J/UTdXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791692; c=relaxed/simple;
	bh=BT5boy5Fu+AFD1SW3WqZ0I9VD3CFZAoEYdiqVc8OFzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l8KYsbajHeIdYl2ULDgnYJwEoMv8NH+49MOmdzp+/MsQgyPbsXrRHwv/qas+aG5FKxSQLUpJq6eSdop/DgHq492e21MEY4bJ4BQH0L0bl1ew/3RzscDRZdhLs02bxMjMTjLsoUYNfXoWekd9maf9dG2nXqmnm9yWGV6WxnQqfaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=ISZeIZV7; arc=none smtp.client-ip=209.85.160.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="ISZeIZV7"
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-51c0858d127so4291171cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 14:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1785791685; x=1786396485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dRHLyDMl1kx+dELOE0vsaooFjIJVjUh7ESGTg3U4394=;
        b=ISZeIZV7rYva5+HsxTgGnfbE9g9qJO9AeBOoTUALEH6JOujkmCni370cc8qx5h3XKR
         4/TYZXLPwkyBPAO1tKph49/mP4KUez2I24Qkh7nXl0VtqgCaMjjQS86JwMY2CjzJ5FVc
         JUjFzkvi3IFoD78a++VEv7yiCxsREfQAtonyB2SLPPi07fEqmcJFkjaYqRWgIRNiU1X9
         HAjpU8xSwdak6bdW9s1sAo4nIKQLikRepifyWJKCdTMDmcQ1m8R1JmIMZEuCpZkiGLLp
         xToA8q9i2dpNYhMAXeiURKf83kgej5zFXbAaE0rU2uypt5O37E3qgmQeILX3kuztQlCR
         OEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785791685; x=1786396485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dRHLyDMl1kx+dELOE0vsaooFjIJVjUh7ESGTg3U4394=;
        b=Wxf6+8ClvGBYhC+gq+ode3S12GVyyJ73Zc05yIpAc5MufG4p8C6Yg/5e7eZhEGfgjv
         3dxD9Pec6Gn2VSkN/rH+kgkWpOQgwK7YrSXzAZvKVTrqDmKAcb4jsym/P44W+FfE3kxH
         GA9V3czz5Lvko90kh8WfOuwJjGYQ4hQKuGOT+MrpDRUKlc9/P5DTKezzF2zFB6jet/Xm
         x1ANcyqP+2LBZre96piBmZkaPdeDs16BODfBuC75k/OXMwZAGcIDTpx7LzjcfssAPtNp
         501qtgJv8Qg53AVV+28Zi3WrrySFY5KVz0I7pXYHcqkj3UBHCMVTQ2ttS9iN2ojHM+n0
         QK7g==
X-Forwarded-Encrypted: i=1; AHgh+Ro1jzAy2vgCx4Qkw7kibvfTSaivev+yzDqFk+0sX8+jYR9ynk71T9n5/Gu4XKgDNH3K1c+NGoD7S/QxIudw0Og=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4rnT4YAOGuYeN5brUejVcenKZ8pDc8AQIoeZySHAvwtHI3xa8
	wW0nlXmJnJfYzbgbkCZEyRbzIBwFs27tdblydaI0r6qXeOn/EenoOxuC2DxJ9NA0NwJrWi6rzwe
	AbCOdr7cTpicc1abHBG9kCDL+Yaecje/aQFgnguZUznp8UwK11TKl
X-Gm-Gg: AR+sD10lyQf+P/x38AAb5hV2XWbUJ5E3XkeRMqjXrKyg6QJZHcH5+y+o+dzY0G0cDf9
	WLtaW+WoSa5bQkfp7X11G/SWKFusmRvWqyNZ7Q1z4tgNrLyiGOKGmBdgqHbz5XdxMjX0Yx0fxXG
	45pLrvMcnBGupSPZW0zKMMO9CtXg+XzQZwaJzdm8fdON+S6BqBQDr3oHyL2xMSwfaifZ3mU4qhO
	N6D1PrPIyhnnndtVXz9zELCKvfdkdNeJ2TwxZr+7vwLLTAmEU/6x6IM4GTe3HI0uzdsNCrYQpz6
	VQkTzmDSGh6bbaV0c1Uy+We1OMLloZXj+HG0ux+JHpbUabYHYBvoj7/tzt3UJhF/6tx06MCR2BA
	fclalcXLKgK27hGzxgw==
X-Received: by 2002:a05:6214:4289:b0:907:83be:27d with SMTP id 6a1803df08f44-90849617816mr198273146d6.3.1785791685433;
        Mon, 03 Aug 2026 14:14:45 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-9085703f7a4sm3913306d6.12.2026.08.03.14.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 14:14:45 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.112.12.104])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id CF73643524;
	Mon,  3 Aug 2026 15:14:44 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id CC856E4041D; Mon,  3 Aug 2026 15:14:44 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <tom.leiming@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 2/8] ublk: remove struct ublk_zoned_report_desc's operation field
Date: Mon,  3 Aug 2026 15:14:34 -0600
Message-ID: <20260803211441.2538144-3-csander@purestorage.com>
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

struct ublk_zoned_report_desc's operation field is only ever set to
UBLK_IO_OP_REPORT_ZONES, so remove it. Replace its one load with the
constant.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
Reviewed-by: Ming Lei <tom.leiming@gmail.com>
---
 drivers/block/ublk_drv.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index da88c8042db6..d364a5d0ebc2 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -526,11 +526,10 @@ static void ublk_init_iod(struct ublk_queue *ubq, struct request *req,
 
 #ifdef CONFIG_BLK_DEV_ZONED
 
 struct ublk_zoned_report_desc {
 	__u64 sector;
-	__u32 operation;
 	__u32 nr_zones;
 };
 
 static DEFINE_XARRAY(ublk_zoned_report_descs);
 
@@ -656,11 +655,10 @@ static int ublk_report_zones(struct gendisk *disk, sector_t sector,
 		if (IS_ERR(req)) {
 			ret = PTR_ERR(req);
 			goto out;
 		}
 
-		desc.operation = UBLK_IO_OP_REPORT_ZONES;
 		desc.sector = sector;
 		desc.nr_zones = zones_in_request;
 		ret = ublk_zoned_insert_report_desc(req, &desc);
 		if (ret)
 			goto free_req;
@@ -729,19 +727,13 @@ static blk_status_t ublk_setup_iod_zoned(struct ublk_queue *ubq,
 		break;
 	case REQ_OP_DRV_IN:
 		desc = ublk_zoned_get_report_desc(req);
 		if (!desc)
 			return BLK_STS_IOERR;
-		ublk_op = desc->operation;
-		switch (ublk_op) {
-		case UBLK_IO_OP_REPORT_ZONES:
-			ublk_init_iod(ubq, req, ublk_op, desc->nr_zones,
-				      desc->sector);
-			return BLK_STS_OK;
-		default:
-			return BLK_STS_IOERR;
-		}
+		ublk_init_iod(ubq, req, UBLK_IO_OP_REPORT_ZONES, desc->nr_zones,
+			      desc->sector);
+		return BLK_STS_OK;
 	case REQ_OP_DRV_OUT:
 		/* We do not support drv_out */
 		return BLK_STS_NOTSUPP;
 	default:
 		return BLK_STS_IOERR;
-- 
2.54.0

