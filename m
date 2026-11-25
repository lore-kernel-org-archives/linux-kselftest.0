Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589676;
	b=hkhvUfTv1qjoktV+xmqrVkLc9lN9vMOZogjXeej/fQFQfxGd/iuA0sc0coPSmnaE0L1z
	 BFCL7hqqsYt7S9wUzsj5J6ldbFwMzpxnRUKoV9oJndSxyaGouLcIxMLvqnxEcJxOUn2KX
	 PEVlVB7/1MOCCLtZfd4i+QrqOylsaq9+O4bW1NsIrsswmxp45DvOBo4Y2vA2ihWoLMo2R
	 MZA1JcgXxuOxzymDeXza225QpS/KpDB5rnKM7HcH6/G6yqj3wW4eObaFnBFk2JKEJkZni
	 sTGrW65SxTBAaRK/7u7Z7Luq3LkSM6KuXgol2g2aJLgHpPt+vh28L4y8ndct5gp8J7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FA3OAU6eEjC7L1C6zX7t1wOu8qvpScaN/CAqUhfL2dY=;
	b=GOmDcruQyLCVDAMqqh7pav5hT+vpFoKlrc/WR3uyF8dy5sh4Ow2wwi2MdIqdcNFTqa4C
	 UB496csMzsay5iKtwz6R6jLyP3k4v1JwoTiVahgnF8M1QjEd35bGPB52OLVgubMrMguoR
	 +LlpfmONTPbZ4VPy/KEyFjqZpeSlL67PL2xiuWkUC33N6L30KtjqX3n00cyfOrnmb9hZ6
	 oTPUCIOIZb7w28pYqU+trCW0Pk4g5umhUysqMQNTLg1Nu81qGkwn2eW0MKY+1R6Doz6Pz
	 Ek8GGHYFTZo7Ubem/5aCMvTw4aEh2YkyXT+mtOjiiGWTZuW0evG8QYiaxU4VLWuerlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b="OeKocc/j";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0457606A323
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 06:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0457606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=OeKocc/j
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so4100176a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 22:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795589675; x=1796194475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FA3OAU6eEjC7L1C6zX7t1wOu8qvpScaN/CAqUhfL2dY=;
        b=OeKocc/jgkyphXPYZoQ9dQj0qTRbGrxddODEBN6yK8n7q7LWAz4e0ov0eX5oAnfB3Z
         kxvN1cPZBlJRaDw8PUfQd0EisM4BBJkrc8eqKR7cZdynf3rZ6yjlLcHmEogaevayPMZx
         e2Hgqz+QlvJFXFBbVUUZN+EwLde0DyPyi78qQrBVlOTQLyB1A/Jy+iV8kUCUsBfD0Uj+
         6NbktBTepkHQ/V6dPMc7FyJ2tHMU4/4gZsxIoY2Y7fL1TnI/XUX1XLbPNZcQamudpu3M
         SCAdoXRxYKAe+2yRtd6v3m+SQrdi/Bl913ZoWo7YOL5KJq3SgZ9DQ0sbxyn3AVqgkGDc
         ybDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589675; x=1796194475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FA3OAU6eEjC7L1C6zX7t1wOu8qvpScaN/CAqUhfL2dY=;
        b=yssqaxBBNVU1Iwn6SoMRA8C8N0TUnV0EyylKJlCCIA2/4/LCpVOKgoz+7yRBoNZCny
         i+4aPkeYyWQVYjE1VaBMe/NVI2ep3+N8JIiXT8ciACsaweugP5TzyAzzxw2Ic2hOPBto
         FgspbMzXvhHT9R6U5tzsrGoeq/N9laNmLhbQH5R9ahpHPvOPpu/Z2lSOsvyHJFT8PoMD
         4U+gPTSBukrzNUCOnOBkAexPAXyvl00OZoeIiOXTbeS1Q2GKASXIMdkZzRHjR4zX2AQu
         xoFXLA/UbPTNwrj//P1fxhcjy4NIUDHr70H/eoqeymbnMVZqfGOuvJezdac1AGXqIya/
         AedA==
X-Forwarded-Encrypted: i=1; AL+hErH+QcCbI4mPAJCjnOGE8LsC4TiXNzr+mhFQYPHxaIXvN4RAGU32GXktEvgF9HrGjuXQDhDBcyyrzvvvn8CUCfQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/llBYnd007O6gfK9bQaesypPgWMQ82bhjhJGq/SUUGDikxXLYL
	VvqxdUnjcMAb8/RDmJH54ivCMmn+Op86E33CJj2giuH5ZKtcHB3o7CQX1nqgGDMYd68=
X-Gm-Gg: AZFdTZfuQrmkKVzhoIaf868ZYfHfkcORt+Mioallb2ui9JhGA4zI25z3N70aX1erAfS
	S8FGRbAcNPmJ3syBEa2TiimQzDHBmWpRg2u1FyQ3y8ukV/KgDMIZwU7Qrqa6Jx7vxznxIhSMCaK
	wqyhdpZbMCWV2bQREK7C4LFmljGtyu/HrRAAJYTIIjc0NZPWUxNX6Rzy1STWJOWPye6Hic45xzY
	wMDGxYH75hXVsKAsK/58IQQSb1WzmcPQpNubvGyYuYTweXB8pY8MhvA1XxiQ7wivsI/77us7GjM
	DSvocKDj/Gt7T48dPaq09BxV6iUGNyYGWV9OVdlHnqQuIAZQCS663HLMZrBM0H6LBvyMPmzpEp+
	T48doc0Wb0Tq6WGcLnQLWAnpJXdkfO8W+mX0PrybxYbm3JQAMvf8HlJ0Z6iCvnaR1AeNlMqmrAS
	OxqatsQX/mEd/MXiwmtZVj5oP9uZF/I3pyiW2/wh8VnqxZZbiQ8LC0iUe208XBhcs9HvIAzAJNQ
	nmMNvrKU4g3PxYFELvsMDOeOiexE5wgtY72Jy2g3v5TTalJ1t76/35X/fUM10f0LxNyupA4+Sdv
	nLzAQ6hi8nkKf/hQtLoW8ZJbwPqR0hXS/lje
X-Received: by 2002:a17:90b:5109:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3b41c953f98mr17148999a91.49.1795589674969;
        Tue, 24 Nov 2026 22:54:34 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm26149320a91.8.2026.11.24.22.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:54:34 -0800 (PST)
From: Rustam Mustafin <rmustafin@cloudlinux.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Shuah Khan <shuah@kernel.org>,
	Jaewon Yang <yong010301@gmail.com>,
	linux-integrity@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rustam Mustafin <rmustafin@cloudlinux.com>
Subject: [PATCH v3 1/2] tpm: Do not allow io_uring for /dev/tpm0 and /dev/tpmrm0
Date: Wed, 25 Nov 2026 13:54:28 +0700
Message-ID: <20261125065429.1483868-1-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <awXHzblUfp05jZSQ@kernel.org>
References: <awXHzblUfp05jZSQ@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_uring passes its own file offset to the TPM character devices, although
they are opened with nonseekable_open(): IORING_OP_READ copies sqe->off
into ki_pos without checking FMODE_PREAD. The devices also keep a single
command and response per open file, which does not fit asynchronous
requests.

Add tpm_common_read_iter() and tpm_common_write_iter(), which fail io_uring
and AIO requests with -EIO. A multishot read uses a synchronous kiocb, so
also reject IOCB_NOWAIT and io-wq workers. The callbacks call
tpm_common_read() and tpm_common_write() once per iovec, so readv() can
still split a response into the header and the body.

Signed-off-by: Rustam Mustafin <rmustafin@cloudlinux.com>
---

 drivers/char/tpm/tpm-dev-common.c | 70 +++++++++++++++++++++++++++++++
 drivers/char/tpm/tpm-dev.c        |  2 +
 drivers/char/tpm/tpm-dev.h        |  2 +
 drivers/char/tpm/tpmrm-dev.c      |  2 +
 4 files changed, 76 insertions(+)

diff --git a/drivers/char/tpm/tpm-dev-common.c b/drivers/char/tpm/tpm-dev-common.c
index 553fc6aca94d..5189c1d72058 100644
--- a/drivers/char/tpm/tpm-dev-common.c
+++ b/drivers/char/tpm/tpm-dev-common.c
@@ -13,8 +13,10 @@
  * Device file system interface to the TPM
  */
 #include <linux/poll.h>
+#include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/uio.h>
 #include <linux/workqueue.h>
 #include "tpm.h"
 #include "tpm-dev.h"
@@ -253,6 +255,74 @@ ssize_t tpm_common_write(struct file *file, const char __user *buf,
 	return ret;
 }
 
+/*
+ * Reject io_uring and AIO. IORING_OP_READ_MULTISHOT requests use a
+ * synchronous kiocb, so also check for NOWAIT attempts and io-wq workers.
+ */
+static bool tpm_iter_is_async(struct kiocb *iocb)
+{
+	return !is_sync_kiocb(iocb) ||
+	       (iocb->ki_flags & IOCB_NOWAIT) ||
+	       (current->flags & PF_IO_WORKER);
+}
+
+/* Preserve the VFS fallback's per-iovec read/write semantics. */
+ssize_t tpm_common_read_iter(struct kiocb *iocb, struct iov_iter *to)
+{
+	struct file *file = iocb->ki_filp;
+	ssize_t ret = 0;
+
+	if (tpm_iter_is_async(iocb) || !user_backed_iter(to))
+		return -EIO;
+
+	while (iov_iter_count(to)) {
+		size_t len = iter_iov_len(to);
+		ssize_t nr;
+
+		nr = tpm_common_read(file, iter_iov_addr(to),
+				     len, &iocb->ki_pos);
+		if (nr < 0) {
+			if (!ret)
+				ret = nr;
+			break;
+		}
+		ret += nr;
+		iov_iter_advance(to, nr);
+		if (nr != len)
+			break;
+	}
+
+	return ret;
+}
+
+ssize_t tpm_common_write_iter(struct kiocb *iocb, struct iov_iter *from)
+{
+	struct file *file = iocb->ki_filp;
+	ssize_t ret = 0;
+
+	if (tpm_iter_is_async(iocb) || !user_backed_iter(from))
+		return -EIO;
+
+	while (iov_iter_count(from)) {
+		size_t len = iter_iov_len(from);
+		ssize_t nr;
+
+		nr = tpm_common_write(file, iter_iov_addr(from),
+				      len, &iocb->ki_pos);
+		if (nr < 0) {
+			if (!ret)
+				ret = nr;
+			break;
+		}
+		ret += nr;
+		iov_iter_advance(from, nr);
+		if (nr != len)
+			break;
+	}
+
+	return ret;
+}
+
 __poll_t tpm_common_poll(struct file *file, poll_table *wait)
 {
 	struct file_priv *priv = file->private_data;
diff --git a/drivers/char/tpm/tpm-dev.c b/drivers/char/tpm/tpm-dev.c
index 74488f0a7b78..9c2f0ad826be 100644
--- a/drivers/char/tpm/tpm-dev.c
+++ b/drivers/char/tpm/tpm-dev.c
@@ -62,6 +62,8 @@ const struct file_operations tpm_fops = {
 	.open = tpm_open,
 	.read = tpm_common_read,
 	.write = tpm_common_write,
+	.read_iter = tpm_common_read_iter,
+	.write_iter = tpm_common_write_iter,
 	.poll = tpm_common_poll,
 	.release = tpm_release,
 };
diff --git a/drivers/char/tpm/tpm-dev.h b/drivers/char/tpm/tpm-dev.h
index 34efb1ffa491..2f2186e6f094 100644
--- a/drivers/char/tpm/tpm-dev.h
+++ b/drivers/char/tpm/tpm-dev.h
@@ -28,6 +28,8 @@ ssize_t tpm_common_read(struct file *file, char __user *buf,
 			size_t size, loff_t *off);
 ssize_t tpm_common_write(struct file *file, const char __user *buf,
 			 size_t size, loff_t *off);
+ssize_t tpm_common_read_iter(struct kiocb *iocb, struct iov_iter *to);
+ssize_t tpm_common_write_iter(struct kiocb *iocb, struct iov_iter *from);
 __poll_t tpm_common_poll(struct file *file, poll_table *wait);
 
 void tpm_common_release(struct file *file, struct file_priv *priv);
diff --git a/drivers/char/tpm/tpmrm-dev.c b/drivers/char/tpm/tpmrm-dev.c
index 19e8f2779265..0c8c1a1b0b3b 100644
--- a/drivers/char/tpm/tpmrm-dev.c
+++ b/drivers/char/tpm/tpmrm-dev.c
@@ -49,6 +49,8 @@ const struct file_operations tpmrm_fops = {
 	.open = tpmrm_open,
 	.read = tpm_common_read,
 	.write = tpm_common_write,
+	.read_iter = tpm_common_read_iter,
+	.write_iter = tpm_common_write_iter,
 	.poll = tpm_common_poll,
 	.release = tpmrm_release,
 };
-- 
2.52.0

