Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184497;
	b=Ji7aBkdNJHzGWaiMwnjiF9TL/n+sTx0PXyi2hj2FakRGai5YkZouxkU3teA0/j8H6N6W
	 mYPhwt4Fhk/fLiIouMIjB2NusF1ErK3GPxKCUb5LDD0lBt1Gut+KRVRb995xyCfffbtRV
	 B4IE/ijuZ5ikb6uR0zQPEuLJfxYVahYt5TEL0RCpULjbRdaUHr1d27Ytf1a7DogHafaIg
	 pqLuzRf3no39RQxeJ4lDQ18TtM4d4cgqyezy55JBUS+mNqT7LTvUIfFKdzkPxv4+dLloa
	 Ug87+zuDRJrZIgK/T/vs627nso2ahL1NrCQYEIyJa04LHE7/BxOr5vaEWYWJ31x69dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=io64yMtWPvT2ay6lHqxeklVMER313LWgv/RG8ihTBBA=;
	b=4BDIaXaPaEqxvJAmnM4QjAzKd88/dzCQc8HQ7yjtOQYgVzWoX2uNJ+MTAghrO0TbYVDI
	 CHzUSn5oKMArl4j8MEKI6IbHPefj/wmZDP5VE/dZD4yVKvXcSgEKhduteYcO3r2ltLJUB
	 yWTJKIaiO0Pu/4s8FEDoUfqnor5SvMMVFdS+LoRgHZ4Ltf4gHf+C+q1E+G/91HXLgqqlx
	 /OMCl7EmqUQ9KNCAg33pgDLfpcUFwrO+IdYT458s/gorTSEpOj3zlBOPM63c0YPoSxF2X
	 hRjV6eil8liDMxqj7dyecRfJIlT1if6a9zVjljSZsiPYisj3icAE0JGbdlHJ6fx+tCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=h+h0Rnjx;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA66560A2601
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 14:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA66560A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=h+h0Rnjx
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b43d30822fso83537a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 06:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795184496; x=1795789296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=io64yMtWPvT2ay6lHqxeklVMER313LWgv/RG8ihTBBA=;
        b=h+h0RnjxzLfsMpYwrbeUOkFpJ7rcK27QMJiQjhcfCtUCaOI2K/wjyiPw+Br3OPuWvX
         AublXVUKuXbflspPq/EQ3XRaZGVWG2iGJl+dTFrqbLWfDpIq+6xwgzXVohcrt0DEBbZ2
         J2klAbtWnIeqQUepnX1KliLT9Ima094zThauD63e/EqspTVAVGfHgFsWbbel4wr+Z3BO
         belCIOc72Zzb7GGy4S1d0AjwH6MR9Qstwy+lNM6+IUsRTysOWQEzQEJ0zRqMM8STY2Z0
         bwowX1F6VWct69OQn8unGt8gxcRfLJa9hyMNN2pCTV9QllfL0zrAuqaUYRKwy5fppiIr
         pTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184496; x=1795789296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=io64yMtWPvT2ay6lHqxeklVMER313LWgv/RG8ihTBBA=;
        b=KTso/7CxUwEERXrpC/RfqgIMiNrQjWs7JKOLc6d2qX6KLuW/4foj5lyOu03xL/TEg/
         W0exe3Npj0cCopaD2R+q6aHUmoZdnJsFLd1GLD0n2NB2Z/oqfvJUTdfRw3CE9tpwU6sB
         TETonNX06XiqHnJWt6Vznz7ci4+Ry4kCRqsNxhTyHm+Z5C58TXGvZB5vcccLz8QbDICi
         nuZ6MPJfQjiVEGbfJKndO9ZTk/fmRZcSHP3egftRw3yYLw5gNIzKpRGFJczxKvoHfSXC
         bRoYeoV9vkbAe+bvGnfEkU49OpCgLzPsfethgCAiNF3tFaOKtWcjsfDkSnuYqjVSB8Ss
         bx/w==
X-Forwarded-Encrypted: i=1; AL+hErETv31t7B9Ej5tieKIdvDqylBSR1MkGfTMQ/DzqHggLUYDtiy7d0iNiSqjNQoANsYdSeTUw990GYsubfU5llME=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fbB2m6NP7dZbT/NlccSUNMZwVUBj+Bbxn5cMr+wAjdxfv1VTl
	glJP0CiSCjRoi3w+xbGZnUEdHuA+yUtlnHmTvW44bhZrdRaoyXApnk6/juQEozBwciMCDmmnjOD
	3OTuR
X-Gm-Gg: AZFdTZfDRqm3qrKPQhxcBa+1BpkXL18F6mw2yU+X658lRBfilwkMOOqQ7kcK2VcXYXa
	GSx5lFKjRQHdjph+6p5v151Dydxu7PttkHh6TqTK2EAKWE2NXjbw/QXRNw38qNT6GOMhruUn7kC
	cPmL2n7RwOXgTWyP5otxLoaDtLb5vse6XG+kxO9g6FVN1Q4yh7H1Pc/wJztiEOqNW7WP9oIlubD
	4slFZvlLACIPI86cSitYOQqt1LYhBjrzpAiGs+NcmgcF7Akn6DoeKLj3ePSl0050yTex8nxRjkV
	uut2H5Jgb7yjGyvKRe+95Q2qU8sq0ELI136AsZVACI/GfM8h/wg6MGkjdh4rP+jjW2BrQcU4Pju
	UJXz+2hn6QB8x7TBl8fwVQqB1hwGwl9UYFio4aK7wKLWNw4tBOdanfOoor6d90/jV4fbkNDLv8k
	1wHppxhv1/1SpK/eKUGHvCpWwLjZhh2YWoRl6csZzMfbTpkrIg9ac/CgbmKgBHVGqjSZKjN1fOU
	3RSAwXiWoH2Fx0T4lP11659i9/F+4No69S3bV27ZW79ZlgpBfsOygE0Fqtm13OdStZAv6TB0c3P
	9s/x/mm5rrKB7Um21vbulSyxTFMlH77E5X/Q
X-Received: by 2002:a17:90b:4a90:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3b41c95b541mr3002905a91.42.1795184496011;
        Fri, 20 Nov 2026 06:21:36 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm4622229a91.6.2026.11.20.06.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:21:35 -0800 (PST)
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
Subject: [RFC PATCH 1/1] tpm: Do not allow io_uring for /dev/tpm0 and /dev/tpmrm0
Date: Fri, 20 Nov 2026 21:21:16 +0700
Message-ID: <20261120142116.1630010-2-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261120142116.1630010-1-rmustafin@cloudlinux.com>
References: <20261120142116.1630010-1-rmustafin@cloudlinux.com>
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

Add tpm_common_read_iter() and tpm_common_write_iter(), which fail
io_uring and AIO requests with -EIO. read() and write() are not
affected, as the VFS still calls ->read() and ->write() for them.
readv() and writev() now reach the new callbacks instead of the VFS
loop over ->read() and ->write(), so the callbacks keep that loop and
call tpm_common_read() and tpm_common_write() once per iovec.

Update the tpm_uring kselftest to expect -EIO, and check that the
rejected request leaves the whole response for the following read().

Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
Link: https://lore.kernel.org/r/av23L5HBpy2gbm3m@kernel.org
Signed-off-by: Rustam Mustafin <rmustafin@cloudlinux.com>
---
 drivers/char/tpm/tpm-dev-common.c        | 72 ++++++++++++++++++++++++
 drivers/char/tpm/tpm-dev.c               |  4 ++
 drivers/char/tpm/tpm-dev.h               |  4 ++
 drivers/char/tpm/tpmrm-dev.c             |  4 ++
 tools/testing/selftests/tpm2/tpm_uring.c | 14 ++---
 5 files changed, 91 insertions(+), 7 deletions(-)

diff --git a/drivers/char/tpm/tpm-dev-common.c b/drivers/char/tpm/tpm-dev-common.c
index 553fc6aca94d..e40a251315f3 100644
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
@@ -253,6 +255,76 @@ ssize_t tpm_common_write(struct file *file, const char __user *buf,
 	return ret;
 }
 
+#ifdef CONFIG_IO_URING
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
+#endif /* CONFIG_IO_URING */
+
 __poll_t tpm_common_poll(struct file *file, poll_table *wait)
 {
 	struct file_priv *priv = file->private_data;
diff --git a/drivers/char/tpm/tpm-dev.c b/drivers/char/tpm/tpm-dev.c
index 74488f0a7b78..56751be46d90 100644
--- a/drivers/char/tpm/tpm-dev.c
+++ b/drivers/char/tpm/tpm-dev.c
@@ -62,6 +62,10 @@ const struct file_operations tpm_fops = {
 	.open = tpm_open,
 	.read = tpm_common_read,
 	.write = tpm_common_write,
+#ifdef CONFIG_IO_URING
+	.read_iter = tpm_common_read_iter,
+	.write_iter = tpm_common_write_iter,
+#endif
 	.poll = tpm_common_poll,
 	.release = tpm_release,
 };
diff --git a/drivers/char/tpm/tpm-dev.h b/drivers/char/tpm/tpm-dev.h
index 34efb1ffa491..22ea88156833 100644
--- a/drivers/char/tpm/tpm-dev.h
+++ b/drivers/char/tpm/tpm-dev.h
@@ -28,6 +28,10 @@ ssize_t tpm_common_read(struct file *file, char __user *buf,
 			size_t size, loff_t *off);
 ssize_t tpm_common_write(struct file *file, const char __user *buf,
 			 size_t size, loff_t *off);
+#ifdef CONFIG_IO_URING
+ssize_t tpm_common_read_iter(struct kiocb *iocb, struct iov_iter *to);
+ssize_t tpm_common_write_iter(struct kiocb *iocb, struct iov_iter *from);
+#endif
 __poll_t tpm_common_poll(struct file *file, poll_table *wait);
 
 void tpm_common_release(struct file *file, struct file_priv *priv);
diff --git a/drivers/char/tpm/tpmrm-dev.c b/drivers/char/tpm/tpmrm-dev.c
index 19e8f2779265..95788c6bdd4c 100644
--- a/drivers/char/tpm/tpmrm-dev.c
+++ b/drivers/char/tpm/tpmrm-dev.c
@@ -49,6 +49,10 @@ const struct file_operations tpmrm_fops = {
 	.open = tpmrm_open,
 	.read = tpm_common_read,
 	.write = tpm_common_write,
+#ifdef CONFIG_IO_URING
+	.read_iter = tpm_common_read_iter,
+	.write_iter = tpm_common_write_iter,
+#endif
 	.poll = tpm_common_poll,
 	.release = tpmrm_release,
 };
diff --git a/tools/testing/selftests/tpm2/tpm_uring.c b/tools/testing/selftests/tpm2/tpm_uring.c
index 9caa3cba5bf0..37b41c7d295b 100644
--- a/tools/testing/selftests/tpm2/tpm_uring.c
+++ b/tools/testing/selftests/tpm2/tpm_uring.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
 /*
- * An io_uring read chooses its own file offset. The TPM character devices
- * must ignore it and return the response from its start.
+ * The TPM character devices must reject io_uring reads.
  */
 
 #include <endian.h>
@@ -39,7 +38,7 @@ static void test_read(struct io_uring *ring, const char *path)
 	struct pollfd pfd = { .events = POLLIN };
 	struct io_uring_sqe *sqe;
 	struct io_uring_cqe *cqe;
-	int fd, ret, res;
+	int fd, ret, res, n;
 
 	fd = open(path, O_RDWR);
 	if (fd < 0) {
@@ -86,10 +85,11 @@ static void test_read(struct io_uring *ring, const char *path)
 	res = cqe->res;
 	io_uring_cqe_seen(ring);
 
-	/* the offset is ignored: the whole response, from its start */
-	ksft_test_result(res >= (int)sizeof(*hdr) &&
-			 be32toh(hdr->size) == res && !hdr->return_code,
-			 "%s: io_uring read %d\n", path, res);
+	/* the rejected read must leave the whole response in place */
+	n = read(fd, buf, BUF_LEN);
+	ksft_test_result(res == -EIO && n >= (int)sizeof(*hdr) &&
+			 be32toh(hdr->size) == n && !hdr->return_code,
+			 "%s: io_uring read %d, read() %d\n", path, res, n);
 out:
 	close(fd);
 }
-- 
2.52.0

