Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176989;
	b=vy91vMhf8ivsJBIuLWDRv2OzhThEsAC08ylU5Y8Q3IohiYZ+QW/vqVAFrqOlP5rM9Bfy
	 TPAah3pDnbZ0kh2Zr6inx8eZGEetDX1yBbsrcHB70mzlEu8cFTIFxtX2dO7coQiKnk0+l
	 b1QQwrVEm0kCPBHEvXq3+4U67r5xNKfUmJyA0Icc7Tj7Ds5PKVE5hwx2KwWd29Mo8MZLB
	 ZJyLhTY3ZewczgfkWPCzO5OcImm5f4jCo4Q2Y6lJfsAzcikeCSIbZI0NWlwRTIIEH8FhO
	 oqqa96MhoDQv1fpRz6IuUC5lq3wB6bGFs/6a0oBtWT27Owo7FjKy7eCJmBnhFDNlGtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mlU16s7/03iuntqpjZE6TiJEWGLy8t92iax2eFIVvl0=;
	b=i2hq5J3MwcBg0/AfV7IDC4uBDmw4TBILg9qh/PUTfqHIX0KkI9WvFb1AZPBgzToH/5Qu
	 UNTMNJrwirvOspZUaYrOBrzH7MFUqaPmKGSpxZrwUnHzM/Usidmb3kruC+BZWz3/3D5Jf
	 /Qd1yB4b/ns2xsA8I3AUynEe7HNEijvMyvJbH6O5PJzik7MsPXzycvOkSmF30JZRAGAVi
	 O2Y0clkuoBfqPHEwZgDTMsfEJIqOg5nWYLge9BHj/Tg8QUAl7ffGs6JTx3qtg5ZnmtWSK
	 llINFIbcVvzf4SswW2H8Pamm3nscmrQ9HKlnJK1Ax4hX4v/kaYkvmVFevC3s6tmck1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=kfoOGbry;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE8C606A326
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 12:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EE8C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=kfoOGbry
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f04fab527eso1796795ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 04:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795176988; x=1795781788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mlU16s7/03iuntqpjZE6TiJEWGLy8t92iax2eFIVvl0=;
        b=kfoOGbrycMj8gAlPRrvZhLEE5plzWJ0rrbPCTwN+YUDLqGJQdo1WQ17IOvMdC15jdU
         mr3j4t5KGIf8SFTp5sO/TNcd6BSQn2Kkca/VHP0ApcOOmg7osWK3xsmQ23+jvFXFyngM
         m8VrmCyduGhEwissLMQLwfiFq8D6qRz3k1yOB1bcw+Mn4AzKP9du+CTeAnUTkbqBAJIe
         QgGQYfRfrlteoMTJIT+MmcwZMlPk42hxXkZCqc/u0dxfyHucGPLHuYo0weA6fcAYMQpy
         qE+FLWfN+k/iHHxiBCN87IX85FN4shl0lDL44aU68093YWxA1DVYYXRNh52C3oXkBmW4
         Or1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176988; x=1795781788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mlU16s7/03iuntqpjZE6TiJEWGLy8t92iax2eFIVvl0=;
        b=kvPP6jI863Q6lclFWdnlMuyD6rYSVyN0/42td7ooptgQ9FONKls8QSoGb6CtD+wj5j
         bCtXmm8fZK5rad0y7AumgVZLhCXWc9m4RCV2uZetiqVCkRe0NOln+qiTR0NF/qZ6/+Uv
         qpNp6ES80TsL3daWUeWQboiZzeLbiP67X0ocP31dysYetSzvo7YJv9oRALGqvLHTygRn
         FDcULQjnM6nJYQbUVrmj+AWadmgODhfD21R+3VZNbU6JwaSOGYnaae2cDgw3IZe9gx/7
         tzq1kKYZyDZgVGb6oWh3yM0z/RLli+NqUUX6eYJJucKeHFpLC4h48gRAr3lMw1yLMZsr
         CYyA==
X-Forwarded-Encrypted: i=1; AL+hErEge1PLmvCbgwOOoCFsK+GyXc2H6xsfcVEywHYmYhbSmqMN/1uefVWI2bqZhWMje4WuQmiOvUss7/p6esnyKf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sX076GckwgfcW5NxeTQgSJTX2oKznJsQLV/RErbWn5CLH/KLS
	hXWpJgusxDUwTmM00eK07mcJTDh1mPdgWwq5vbg8tRS8leBgeMc3B99DHfdkQ5vJR0E=
X-Gm-Gg: AZFdTZcl2sr0dlWdkTMicYxPNaBFXPfw6HhC18QwOa1Lz18I4pWjH/S6hHiE3Gcr/rO
	wQi9SNB1ikZWwHPQVmXeGKPajE6XjpH3CFegg6HY2kU7nBiHxXoBwL4c/TDVswLfZanL/ihmhna
	4bl/pApJhHVJMD2+gOQ9KJiac9bQQ5S9n6WpgubtG7sFLNFiWOLyQt0jca4NQ1VwfTGLX2mzTsV
	wuA2MsASrZ/RkZGDFHmXIJB2YMA5XslGevX0GdDag9+BK4Ljpbv6lFAB3MsJPFB8qFOzLuNsp5z
	FCNht0REOOLkwqFzWf/E2XhULmG4zfMO+TXrTT/HaPQB+y9T4yJQKmSYEJlCTxh66zCry6X9O9T
	VDfrZuR+i3Dc+oUTznpf4cvdV89Xe5PRPwYY6K+Y9arOdkJMXUV/RrltixJtoEwbJkIVkXWVZLG
	Xq6PSt4tgYOw5AWtvZ6YZ8bCFsYSibBOOZIGgSqs+jNI6rpIh+1L8Xhhwlv05AbWudu6h17tlix
	sdGnWlJxIdUiOK0IQiL+Zv5R3ugUelzzR9qvq+JZ8Xob3YlfIFfa/btxN0if/KmOLG754xN0Yv9
	7kfOENOd8FOVE4C8yf35BZHP1vZaiuwqqx53
X-Received: by 2002:a17:90b:5289:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3b41c8fe855mr3017017a91.15.1795176988548;
        Fri, 20 Nov 2026 04:16:28 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm4463146a91.1.2026.11.20.04.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:16:28 -0800 (PST)
From: Rustam Mustafin <rmustafin@cloudlinux.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Shuah Khan <shuah@kernel.org>,
	Jaewon Yang <yong010301@gmail.com>,
	linux-integrity@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rustam Mustafin <rmustafin@cloudlinux.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] tpm: Track the response read position internally
Date: Fri, 20 Nov 2026 19:16:13 +0700
Message-ID: <20261120121614.978396-2-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261120121614.978396-1-rmustafin@cloudlinux.com>
References: <20261120121614.978396-1-rmustafin@cloudlinux.com>
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

tpm_common_read() indexes data_buffer with the caller supplied *off.
A read issued through io_uring reaches the driver with that offset:
loop_rw_iter() passes &ki_pos to ->read(). This allows out-of-bounds
reads and zeroing of kernel memory:

  BUG: KASAN: slab-out-of-bounds in _copy_to_user+0x4b/0x70
  Read of size 16 by task iou-wrk-148/149
  Call Trace:
   _copy_to_user+0x4b/0x70
   tpm_common_read+0x16e/0x2c0
   loop_rw_iter+0x235/0x5a0
   __io_read+0xc6e/0x11a0
   io_read+0x8a/0x180

A plain read() racing a write() reaches the same access: read()
samples f_pos before taking buffer_mutex, so it can consume a new
response from the offset left by the previous one:

  BUG: KASAN: slab-out-of-bounds in _copy_to_user+0x4b/0x70
  Read of size 75 by task trigger/151
  Call Trace:
   _copy_to_user+0x4b/0x70
   tpm_common_read+0x16e/0x2c0
   vfs_read+0x189/0xc00
   ksys_read+0xf9/0x1d0

Replace *off with a read_pos member of struct file_priv. It is only
accessed under buffer_mutex, so the offset passed by the caller no
longer matters.

Fixes: 9488585b21be ("tpm: add support for partial reads")
Cc: stable@vger.kernel.org
Signed-off-by: Rustam Mustafin <rmustafin@cloudlinux.com>
---
 drivers/char/tpm/tpm-dev-common.c | 11 ++++++-----
 drivers/char/tpm/tpm-dev.h        |  1 +
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/char/tpm/tpm-dev-common.c b/drivers/char/tpm/tpm-dev-common.c
index ee91f456f975..553fc6aca94d 100644
--- a/drivers/char/tpm/tpm-dev-common.c
+++ b/drivers/char/tpm/tpm-dev-common.c
@@ -107,6 +107,7 @@ static void tpm_timeout_work(struct work_struct *work)
 	mutex_lock(&priv->buffer_mutex);
 	priv->response_read = true;
 	priv->response_length = 0;
+	priv->read_pos = 0;
 	memset(priv->data_buffer, 0, sizeof(priv->data_buffer));
 	mutex_unlock(&priv->buffer_mutex);
 	wake_up_interruptible(&priv->async_wait);
@@ -149,21 +150,21 @@ ssize_t tpm_common_read(struct file *file, char __user *buf,
 			goto out;
 		}
 
-		rc = copy_to_user(buf, priv->data_buffer + *off, ret_size);
+		rc = copy_to_user(buf, priv->data_buffer + priv->read_pos, ret_size);
 		if (rc) {
 			memset(priv->data_buffer, 0, TPM_BUFSIZE);
 			priv->response_length = 0;
 			ret_size = -EFAULT;
 		} else {
-			memset(priv->data_buffer + *off, 0, ret_size);
+			memset(priv->data_buffer + priv->read_pos, 0, ret_size);
 			priv->response_length -= ret_size;
-			*off += ret_size;
+			priv->read_pos += ret_size;
 		}
 	}
 
 out:
 	if (!priv->response_length) {
-		*off = 0;
+		priv->read_pos = 0;
 		timer_delete_sync(&priv->user_read_timer);
 		flush = true;
 	}
@@ -214,7 +215,7 @@ ssize_t tpm_common_write(struct file *file, const char __user *buf,
 
 	priv->response_length = 0;
 	priv->response_read = false;
-	*off = 0;
+	priv->read_pos = 0;
 
 	/*
 	 * If in nonblocking mode schedule an async job to send
diff --git a/drivers/char/tpm/tpm-dev.h b/drivers/char/tpm/tpm-dev.h
index f3742bcc73e3..34efb1ffa491 100644
--- a/drivers/char/tpm/tpm-dev.h
+++ b/drivers/char/tpm/tpm-dev.h
@@ -15,6 +15,7 @@ struct file_priv {
 	struct work_struct async_work;
 	wait_queue_head_t async_wait;
 	ssize_t response_length;
+	size_t read_pos;
 	bool response_read;
 	bool command_enqueued;
 
-- 
2.52.0

