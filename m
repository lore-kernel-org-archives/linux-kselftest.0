Received: from mail-dy1-f226.google.com (mail-dy1-f226.google.com [74.125.82.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327D020C00A
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 04:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775449534; cv=none; b=D0SGUyvPlstaFmUCb/I3T8QdY0gFNvovjg/svDy+2MzHNdC2rfkDHfDRxvoVSVWfxGnSbqyR54bUohHnOTQEcQ4g2X1JDiJ7AhiEpGS28d4oOxENbudLC7HHzHBX0vC1Nt4G7e5z/WnawF6rSgP9FyXOCl2BmnudF2sQBK1o/0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775449534; c=relaxed/simple;
	bh=NYiNrf1m+usN85Dbh0+F0m5BpO5qZqMWkcz20OKnhR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=POi1tse4tFWId2J9h2f/SXbtqRh3Z4WK5nWNDRkNzvyf1WfOxMprUBLNzHUsPWFap4d5apA9KArn4w+wOJ8Rzq30JIlq43IlXLyyJ8+ETzK3ZMsUQww75qkNwbFSkUKXfkkIz1saSJVq2LXvZzn2jzuL4HtvfKRRfbIdSwzO+kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=NB32vq8q; arc=none smtp.client-ip=74.125.82.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="NB32vq8q"
Received: by mail-dy1-f226.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so9105692eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 21:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1775449532; x=1776054332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62bRSDeTpVA3G/ejEet2ndeFOHy2K2YoDaPpaJqQpXw=;
        b=NB32vq8qk2bdqsJMLO0dqJ4VdjQqInLro20BhHVc9pfQjxAliHmDySbdDJRPeKzJOm
         cTNw0i3tkXND5RmcbYa9r7Vo2TnTcNiWStQgoagp2LCaw0636/NhOLRtXWOuVpbxseta
         sONSfAhrxwkbwfTGPIwPgaTNB8rJafBO78AlbxkiLqMlrLCS/Kx04jCZsgGc18qqhKTI
         yrYBh3gizfzL8TJ9LqK5DGl4d41Vhekm0VjKm/6n+Mwhg8rfIZJnnyank7ZtlijOEuSA
         PIwrXFkkzeSOendVfqFdo8l/Hc5kFDQLti6hBohbGSIR7Yozey9IS/Yvlff4fqGQwEpX
         MwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775449532; x=1776054332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=62bRSDeTpVA3G/ejEet2ndeFOHy2K2YoDaPpaJqQpXw=;
        b=gEGfCGxyakN5bFinOLapTiDO5Z3dVUgFwcV8hSE8CmOTcr9RuhGXk2p4Z4QOVKq594
         gI9hP6hpZrsZHAw6KabzHbfUBgc8nEP/L7AGTB5x/4oU31rX+P/TUHg5FBK3TRTum5vv
         m9Hve8buWUZ/6nH2hrS0MAFEcsvMgSc+E5P8idoHu0ct71DdpspIZmALeFooWIICjuPV
         mJ9wsmrZJy6VtAQK5vSFGCpKlZHC4+68frtlbUyHU3sy7x+YKfagXoaKKd5RwFf7hIZM
         LtnRLOu5wPfMCfMHhKEtnE9uYgaEvAmXlrvR5YOy9JRTmcliFQShSBys7mHeHoBHcdrL
         +AsA==
X-Forwarded-Encrypted: i=1; AJvYcCWie5KwNXGsjN0HI2nHVh4RR3BrGGG3mlxEoZiHhWOenLw/aafl94yM9f48ExiwXgj0tqS/sczp7obtKuiLUe0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNVQyBlCian+/QVJSYcWd8mkzauX4p9Tc/4yD25kRMkXevjfH4
	0toWFNkPlQmJ6D5h39YO0wE+QXuxN9DGxcZVK7l2s3no833eWy3E7NmLbjRnyFp0NqwfUmw1st6
	x8pDgVL93HLCeb/NkL8wrXUZoD6L2g0jjSLnJ
X-Gm-Gg: AeBDievmBhmFmRGVNFm6XDWRMlvOgnGodk1f4whwhKsCHMagxhoESQVRg20FfNlIKGB
	eiT3jpeQ5pNAja7d9tIRp4GuCT74grfgDWGwWfuZSNzJOmI1eK1adhlAYFwF8WZOvpu2OiD+QvB
	Hm+fs4StDGxCu46rjn7a8w9Lru1poC0BhFQTro0ZPO2dLIfTuY9SxBviMbTVitJj5AHrOzPkXjf
	ltHhOTdb92OyJXJzVdBsKG/0ZKw7aqtfLT7DqPxnKiZgHypLCL37hW39sbcxvfhy4eNkWYV6Qmi
	mV24FLDe/2OmlF2fqGNIwwmHGdA//tf8OyHJv2dO6Y0p2c1SJID90nZ6Xg2kI3L++mudkP+1a/W
	JAELLwhMTdCnqF37IYT4zi3SsbIkFPtazQ0N3CIm4Ah4ftJLDC642CDU=
X-Received: by 2002:a05:7022:43aa:b0:12a:6c84:6054 with SMTP id a92af1059eb24-12bfb770514mr5207916c88.35.1775449532246;
        Sun, 05 Apr 2026 21:25:32 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-12c03576f99sm261142c88.4.2026.04.05.21.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 21:25:32 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::2c94])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 6D05D34018F;
	Sun,  5 Apr 2026 22:25:31 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 56750E4010B; Sun,  5 Apr 2026 22:25:31 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Sun, 05 Apr 2026 22:25:30 -0600
Subject: [PATCH v2 1/2] ublk: reset per-IO canceled flag on each fetch
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-cancel-v2-1-02d711e643c2@purestorage.com>
References: <20260405-cancel-v2-0-02d711e643c2@purestorage.com>
In-Reply-To: <20260405-cancel-v2-0-02d711e643c2@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, 
 "zhang, the-essence-of-life" <zhangweize9@gmail.com>, 
 Caleb Sander Mateos <csander@purestorage.com>, Jens Axboe <axboe@kernel.dk>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

If a ublk server starts recovering devices but dies before issuing fetch
commands for all IOs, cancellation of the fetch commands that were
successfully issued may never complete. This is because the per-IO
canceled flag can remain set even after the fetch for that IO has been
submitted - the per-IO canceled flags for all IOs in a queue are reset
together only once all IOs for that queue have been fetched. So if a
nonempty proper subset of the IOs for a queue are fetched when the ublk
server dies, the IOs in that subset will never successfully be canceled,
as their canceled flags remain set, and this prevents ublk_cancel_cmd
from actually calling io_uring_cmd_done on the commands, despite the
fact that they are outstanding.

Fix this by resetting the per-IO cancel flags immediately when each IO
is fetched instead of waiting for all IOs for the queue (which may never
happen).

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
Fixes: 728cbac5fe21 ("ublk: move device reset into ublk_ch_release()")
Reviewed-by: Ming Lei <ming.lei@redhat.com>
Reviewed-by: zhang, the-essence-of-life <zhangweize9@gmail.com>
---
 drivers/block/ublk_drv.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 3ba7da94d31499590a06a8b307ed151919a027cb..92dabeb820344107c9fadfae94396082b933d84e 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -2916,22 +2916,26 @@ static void ublk_stop_dev(struct ublk_device *ub)
 	ublk_cancel_dev(ub);
 }
 
+static void ublk_reset_io_flags(struct ublk_queue *ubq, struct ublk_io *io)
+{
+	/* UBLK_IO_FLAG_CANCELED can be cleared now */
+	spin_lock(&ubq->cancel_lock);
+	io->flags &= ~UBLK_IO_FLAG_CANCELED;
+	spin_unlock(&ubq->cancel_lock);
+}
+
 /* reset per-queue io flags */
 static void ublk_queue_reset_io_flags(struct ublk_queue *ubq)
 {
-	int j;
-
-	/* UBLK_IO_FLAG_CANCELED can be cleared now */
 	spin_lock(&ubq->cancel_lock);
-	for (j = 0; j < ubq->q_depth; j++)
-		ubq->ios[j].flags &= ~UBLK_IO_FLAG_CANCELED;
 	ubq->canceling = false;
 	spin_unlock(&ubq->cancel_lock);
 	ubq->fail_io = false;
 }
 
 /* device can only be started after all IOs are ready */
-static void ublk_mark_io_ready(struct ublk_device *ub, u16 q_id)
+static void ublk_mark_io_ready(struct ublk_device *ub, u16 q_id,
+	struct ublk_io *io)
 	__must_hold(&ub->mutex)
 {
 	struct ublk_queue *ubq = ublk_get_queue(ub, q_id);
@@ -2940,6 +2944,7 @@ static void ublk_mark_io_ready(struct ublk_device *ub, u16 q_id)
 		ub->unprivileged_daemons = true;
 
 	ubq->nr_io_ready++;
+	ublk_reset_io_flags(ubq, io);
 
 	/* Check if this specific queue is now fully ready */
 	if (ublk_queue_ready(ubq)) {
@@ -3202,7 +3207,7 @@ static int ublk_fetch(struct io_uring_cmd *cmd, struct ublk_device *ub,
 	if (!ret)
 		ret = ublk_config_io_buf(ub, io, cmd, buf_addr, NULL);
 	if (!ret)
-		ublk_mark_io_ready(ub, q_id);
+		ublk_mark_io_ready(ub, q_id, io);
 	mutex_unlock(&ub->mutex);
 	return ret;
 }
@@ -3610,7 +3615,7 @@ static int ublk_batch_prep_io(struct ublk_queue *ubq,
 	ublk_io_unlock(io);
 
 	if (!ret)
-		ublk_mark_io_ready(data->ub, ubq->q_id);
+		ublk_mark_io_ready(data->ub, ubq->q_id, io);
 
 	return ret;
 }

-- 
2.34.1

