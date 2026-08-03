Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15373B71A2
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 21:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791689; cv=none; b=pg+LxfLMKuaRzLP0ymgxb24GIJvWuby7fRS8Uy+nLJw1O4fhn0HtDtUNemr7vWDzq6zPoAruRn6zLBvFz8vGozhfi8YmiBhflNZxB2W+6bCnqODLmcQnxuZc1vAmjQ+g1QEYTE9tP9Kr3R4/wsnQS3tn1YDM4yI61hHgVEHchq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791689; c=relaxed/simple;
	bh=UpmEnx3awHseJWWLI2g6v8qVQIy9TviUGqb9Opoaoo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jheW2Q58aI2H4kocd+3hOBDZxSBGgwW01zzU+q7CdD2UvZdEJT1V9bcAbgmIzTOMzSQG/v3hIMhU//rCuFz5HccxLfrdEWWQ7tHM7kDZ3v/tWVpSGIrm3ZcI/xj8SzTkFGqGR5zqLz5Jl1idzG5p27BX3583iXrxtPGez65DQjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=AiOY6D5Z; arc=none smtp.client-ip=209.85.215.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="AiOY6D5Z"
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cbe41618110so164029a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 14:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1785791686; x=1786396486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTIvj8Z/s40cHu4vpiMgFm0KJRfpdgU7PpP6Ih2zxbE=;
        b=AiOY6D5Z9rB4MRoPETkGxa7yeSC0O9KfWqdxj1WuCngzlLPBFHYuiwhMwH9ubujtdI
         DZguM8d0X34Wn0pTjzIaBHxlLzAKHgFihOKheyfpylAUDehGGZySl6/frA7a/g5gCPFU
         YuPqiciOlh7TYCKFJgUNgqqjznsqeMPmIqsa8JyS+TDgZ3nl4iy8tY70KZoYV1PXFEqS
         CgHiCjA3ge6PQycGOIC9GuU1xvuEr16IfGdCA72JZFC5ZpY5FCkbUlW4it6g1g+K6+NJ
         5R9CS0EWr/kmHxVrED6aItEson3z2AqjXr85Fx9nwN3i8oH1XamvExqcIsvlH5GZku6x
         cmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785791686; x=1786396486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aTIvj8Z/s40cHu4vpiMgFm0KJRfpdgU7PpP6Ih2zxbE=;
        b=bHp+2wwrCCNI2pPN3km1NOUSJwiO89NvOpadd8OfdHeR8rZ51ojUubDmGoj+ovBP8D
         6JRZHKN3rCDKf43E7iyquutXE5iKbPQOiMnGZ1pPYA2LuwOdeAuta6Q8Y2NSQaKnYV7m
         Dzsckoa3o/12lXB35OGkVGtRIA+qfJ5fa3IvqqxyeOtaRdjUzJ1lT2VDVFi3J0qMZrkS
         +n7GC5smHzqL7SnaW74dZToOFxTcPqXv/LJC8C/179ZIn3HmLHSw3Ipnn7gZ6rq2Ir1X
         MV2qmqm8cL/evfVF/PcPvjaA0FcUw6VkK6xaOL91FkIPN8m3Eea35b2pwka3QA8vL/g0
         AeHw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+r0QddyllO3PKjbvTkTgoKYZM+ZnMs4tuU/7cSGk3TTKQv92DPA0TTTUmseknfy6Gm4qspN3BV0n65OX1yR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhFXSHv3rMxP20flZVur3ucKD9yU4DWytK/0pA9Mkq5E9lfD6Y
	EuchqJzPwbSejhricML8cb6wfPZNQCVHMBaFbyjYLadFuR26X7qw1UaDcO9kb8ph7w3K48izmCm
	Q9tr44mtzwB/Io1yCMoV3DABz2aiiRX7CAYeTDPxixCTOLcWS3v3q
X-Gm-Gg: AR+sD12FcEuKnNyQKmjnropIcQ1pGF3CKorBI/SSbr8OYQPXNVFLdxs48Y7I+femwEP
	y24v+vqZy5u4rIrPJBafpTFFlhnflc/c3WqOjgJ3mxRtBsDzXb0ahFMQPSH/YeJKxnFRwGKJFh7
	pfmypP5d6cOoWuqIaKhwscQkoRj5Ad0wV1zs3xLjOXfhMJQr5ynHuxEuJgmGhuJldoIaLkOMGj1
	s/C33eNsuExFA7ioEGfPDaSZfCE95uLWVI8cjyAdt/LMcXLqZiB/Ntby4ci4hLQS9Bq0MVq0ECR
	YgquSElfooJESVipe4tuk7BFoXEep3xp75/8SOKAMzsSyOcn/tHg4nzbkCzPUJbKuhUsQNQF7Bb
	nGXPHamwWpZQ5wGjpNg==
X-Received: by 2002:a05:6a21:501:b0:3bf:99ea:aeb2 with SMTP id adf61e73a8af0-3c92a900f91mr17076379637.4.1785791685907;
        Mon, 03 Aug 2026 14:14:45 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cbe39643987sm856581a12.1.2026.08.03.14.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 14:14:45 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (bond0.slc5-n17m28-k8s.dev.purestorage.com [IPv6:2620:125:9025:20::a31:41f])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 3561A436B7;
	Mon,  3 Aug 2026 15:14:45 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 3213DE4041D; Mon,  3 Aug 2026 15:14:45 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <tom.leiming@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 4/8] ublk: initialize io_desc on daemon task
Date: Mon,  3 Aug 2026 15:14:36 -0600
Message-ID: <20260803211441.2538144-5-csander@purestorage.com>
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

ublk_setup_iod() is currently called to populate struct ublksrv_io_desc
on the thread submitting I/O to a ublk device. However, only the ublk
server threads read the io_descs. This basically guarantees a cache miss
on both threads for each ublk I/O. There's really no need to initialize
the io_descs on the submitting thread. Move the ublk_setup_iod() call to
ublk_dispatch_req() (for non-UBLK_F_BATCH_IO) and
__ublk_batch_prep_dispatch() (for UBLK_F_BATCH_IO), which runs on the
ublk server daemon thread before dispatching the I/O to userspace.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
Reviewed-by: Ming Lei <tom.leiming@gmail.com>
---
 drivers/block/ublk_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 7f0549238d76..291461e1b236 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1798,10 +1798,11 @@ static void ublk_dispatch_req(struct ublk_queue *ubq, struct request *req)
 {
 	unsigned int issue_flags = IO_URING_CMD_TASK_WORK_ISSUE_FLAGS;
 	u16 tag = req->tag;
 	struct ublk_io *io = &ubq->ios[tag];
 
+	ublk_setup_iod(ubq, req);
 	pr_devel("%s: complete: qid %d tag %d io_flags %x addr %llx\n",
 			__func__, ubq->q_id, req->tag, io->flags,
 			ublk_get_iod(ubq, req->tag)->addr);
 
 	/*
@@ -1851,10 +1852,11 @@ static bool __ublk_batch_prep_dispatch(struct ublk_queue *ubq,
 	struct ublk_io *io = &ubq->ios[tag];
 	struct request *req = blk_mq_tag_to_rq(ub->tag_set.tags[ubq->q_id], tag);
 	enum auto_buf_reg_res res = AUTO_BUF_REG_FALLBACK;
 	struct io_uring_cmd *cmd = data->cmd;
 
+	ublk_setup_iod(ubq, req);
 	if (!ublk_start_io(ubq, req, io))
 		return false;
 
 	if (ublk_support_auto_buf_reg(ubq) && blk_rq_has_data(req)) {
 		res = ublk_auto_buf_register(ubq, req, io, cmd,
@@ -2187,11 +2189,10 @@ static blk_status_t ublk_prep_req(struct ublk_queue *ubq, struct request *rq,
 
 	/* fill iod to slot in io cmd buffer */
 	if (unlikely(!ublk_validate_req(ubq, rq)))
 		return BLK_STS_IOERR;
 
-	ublk_setup_iod(ubq, rq);
 	blk_mq_start_request(rq);
 	return BLK_STS_OK;
 }
 
 /*
-- 
2.54.0

