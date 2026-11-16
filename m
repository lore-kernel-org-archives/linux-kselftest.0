Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794788381;
	b=fMD6aQ61tvIY11uXfW6CA7OytP0swRmTGoJlanV3hJkVWYlHktssjyNeaJziObJJONyp
	 QwzAwB2ATxxfyBawRWDdrmrLv7FXIZWNOp29GGfYLszdbssE5qJsAWdJA83m2Sj2G3oi5
	 xVXFLKVxHfPDJLrjMnF2YoGLGD0EkAPOmuAoXOr+oyJ2gtynrFG7dQsswifNkdF2P8NCW
	 zyh8z0TtdiYKv2X1H1R7+RhaevnNqQqEnbKTR5uIB6cg/NTGG4xb7Jr5buebaP083HXHX
	 8xBHSwPkrs1UxLd4Eqbfpf9/r+5FIxh6Pkm8mWHUZRabyBucTiKIzt5DrmF9f5IeUEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794788381;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=YWNWzU+sAi4YSRb/iVqUcJ9Q9hOUWI/RmfSUeN1egCY=;
	b=xXhPi925OWXCFVwYTL3ONc0bqU9RM8mNNDVna86TAIrdxUZ37Ej/sirZgsMGRguTEqzC
	 /79cMVr85fU38EDzUQH5PjWYZYMB9W4GlWo6IurAERjwqLh7UiKFsKc3QSZMpK87+84wV
	 Ttgj3ybP3OE4OMYC+w3BMCW+xmtIull8BlzAaGSaCoBTpli0xxCOqLbC4fLKa0QWVLjpw
	 NOEpXzKjWaBHl5juZfBh/IdqOvRmuZ5H+3jqVi/1PAxsqVWlpUAGFHRdeqyPzbCNmZzdF
	 uFUTKH65ELeVhnR/bJwXuAfFgP8uY6PR3nDE1Kp0Ze7jQyz55DfnV7coDnIM4O0E+kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F49pYo7g;
	arc=none smtp.remote-ip=91.218.175.39
Received: from mta0.migadu.com (out-39.mta0.migadu.com [91.218.175.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F876606A33F
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 00:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F876606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F49pYo7g
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0FWeIS8U8U2Ah43sIfGLQVftVHXgr5aFNYqRFVAa/bc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794788378; v=1; x=1795393178;
 b=F49pYo7g9XflLiD2uRIc7vPKmHg6r8bOlVnUy+Pj0jI3Ru3rggZU3A0VIu6mdOozLcI7j7HT
 7/gmh3oJAtdXMtSQRMSZns3n6aZELw2pWE8cj4YS04KZWy8Q4ogj7w8Y+z/G9uYE+6Cn+tf4i0x
 9i0uxMlE1Wk33Nys9eMvREiI=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1cce60d9ce0f2eee;
	Mon, 16 Nov 2026 00:19:38 +0000
X-Mizu-Trace-ID: 1cce60d9ce0f2eee
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Sun, 15 Nov 2026 19:18:05 -0500
Subject: [PATCH RFC 12/18] scsi: target: uring: Support SYNCHRONIZE CACHE
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-feat-target-core-uring-v1-12-28cdc137eac6@linux.dev>
References: <20261115-feat-target-core-uring-v1-0-28cdc137eac6@linux.dev>
In-Reply-To: <20261115-feat-target-core-uring-v1-0-28cdc137eac6@linux.dev>
To: "Martin K. Petersen" <mkp@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
 target-devel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
 io-uring@vger.kernel.org, Mike Christie <michael.christie@oracle.com>, 
 Bodo Stroesser <bostroesser@gmail.com>, Ming Lei <tom.leiming@gmail.com>, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

target_core_uring only passes reads and writes to the server.

A server that caches writes has no way to learn that the initiator
wants them on stable storage.

Add TCMUR_OP_FLUSH and send it for SYNCHRONIZE CACHE. The descriptor
carries the range to flush; a zero length means up to the end of the
device.

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/target/target_core_uring.c     | 14 +++++++++++++-
 include/uapi/linux/target_core_uring.h |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/target/target_core_uring.c b/drivers/target/target_core_uring.c
index 629419a4c8f46..f39bf7bf36d0f 100644
--- a/drivers/target/target_core_uring.c
+++ b/drivers/target/target_core_uring.c
@@ -237,7 +237,8 @@ static sense_reason_t tcmur_submit(struct se_cmd *se_cmd, u32 op, u64 offset,
 	tcmd->desc.op = op;
 	tcmd->desc.offset = offset;
 	tcmd->desc.len = len;
-	tcmd->desc.data_len = se_cmd->data_length;
+	if (sgl)
+		tcmd->desc.data_len = se_cmd->data_length;
 	if (op == TCMUR_OP_WRITE && (se_cmd->se_cmd_flags & SCF_FUA))
 		tcmd->desc.flags |= TCMUR_IO_F_FUA;
 
@@ -257,6 +258,16 @@ static sense_reason_t tcmur_execute_rw(struct se_cmd *se_cmd,
 			    se_cmd->data_length, sgl, sgl_nents);
 }
 
+static sense_reason_t tcmur_execute_sync_cache(struct se_cmd *se_cmd)
+{
+	u32 block_size = se_cmd->se_dev->dev_attrib.block_size;
+
+	/* Pass a zero length to flush up to the end of the device */
+	return tcmur_submit(se_cmd, TCMUR_OP_FLUSH,
+			    se_cmd->t_task_lba * block_size,
+			    se_cmd->data_length, NULL, 0);
+}
+
 static void tcmur_tmr_notify(struct se_device *dev, enum tcm_tmreq_table tmf,
 			     struct list_head *aborted_cmds)
 {
@@ -929,6 +940,7 @@ static sector_t tcmur_get_blocks(struct se_device *dev)
 
 static struct exec_cmd_ops tcmur_exec_cmd_ops = {
 	.execute_rw		= tcmur_execute_rw,
+	.execute_sync_cache	= tcmur_execute_sync_cache,
 };
 
 static sense_reason_t tcmur_parse_cdb(struct se_cmd *se_cmd)
diff --git a/include/uapi/linux/target_core_uring.h b/include/uapi/linux/target_core_uring.h
index 8b95be853753c..a1d8ae47ebf7d 100644
--- a/include/uapi/linux/target_core_uring.h
+++ b/include/uapi/linux/target_core_uring.h
@@ -67,6 +67,7 @@ struct tcmur_io_cmd {
 enum tcmur_io_op {
 	TCMUR_OP_READ,
 	TCMUR_OP_WRITE,
+	TCMUR_OP_FLUSH,
 };
 
 /* Put the write on stable storage before completing it */

-- 
2.43.0

