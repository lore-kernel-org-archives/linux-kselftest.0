Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794788387;
	b=xWXIaZ3H4u9LxHqzaooqucbkElWSm3F6cv8IV/smt5khPjksfX1JYAUbB95nqg1OIAt2
	 XAzzPT0LF7TfoDWAw2PwjSmmrx86BYMZf0LzsjrOecxNmo3LA/YjKc2TKvR06ayDq+bZ/
	 s5UGNYXx6PkNEUNSrSi12RB9WQPYZp6fKX6q1mE1eH0oSJACtqU2iVb7mpThcYMM8mzlW
	 8+yjDmcsiOpjG8CEY5wQEMGN8YSRvk3gnAWFsOTBfFOAMNTMusbT60kVIk0Jffrp+GqM1
	 0W9ZdVnviq5fbB24+KaIe8PGo4cKc1ddzSg1IOBJzd2ltksolMD5m4O3/VfQwssSjZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794788387;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=9OStO3XpvK3k+PUkD7ul+6iWKdXwPfmgyWWGJGVXbNI=;
	b=mFjjzY93FoFT1/LDTu7hYsZ5M/8OvvegXLYlXAKSXZ9xjK3qeMF2iM0DJIBEwDzP1rvI
	 3VPjNXTILgSB3/pk4ONJBgPCYJgiaRHDpimMhiJWXy0LfUHI5GcRCNJnhHXnpJbwiwE1d
	 TqHIzq57NrMW5okBV4gJU94IuD0rSq4EgSvmB5ztBF9j7oCvdZmc3Fe0l3Ar++CDk52Ic
	 iVVF9P5YqxJRjL/F8T3MNJqBnEmSTVO2g0XZ0kTPAx78GVmkzFi3LYjZUMLzf6j8TtQbJ
	 DYq0hGPq2e9uG2x0btqia7iz5lvc7cyslxc/tDP8HHDy76Sy8sVQzWM0tV0j0RTeTcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZHLfmw21;
	arc=none smtp.remote-ip=95.215.58.194
Received: from mta1.migadu.com (out-194.mta1.migadu.com [95.215.58.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9978606A332
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 00:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9978606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZHLfmw21
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=b6c0p+8qGe6fdEvzWw3nxZMdiGnGZNhVZSbLhdhc0a0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794788384; v=1; x=1795393184;
 b=ZHLfmw21omlX2cExa2PccOEY2mX4KS/ESojA0xbUZSx7pgDTojBQNr1LddtGtBYRxeuEKakg
 GDycCNk/WGs9p1fR6FR4/3Yn5J4Xt5rHnKP+kYGjEhmwMrCbg6eZ73WMo9iLOq+PP/6xNXmf1hg
 qeiFBVEL+fh/jZkR8VA66rec=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 81dfeb230ea28558;
	Mon, 16 Nov 2026 00:19:44 +0000
X-Mizu-Trace-ID: 81dfeb230ea28558
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Sun, 15 Nov 2026 19:18:06 -0500
Subject: [PATCH RFC 13/18] scsi: target: uring: Implement UNMAP
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
Message-Id: <20261115-feat-target-core-uring-v1-13-28cdc137eac6@linux.dev>
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

target_core_uring passes reads, writes and flushes to the server.

Thin provisioned storage also needs to know which blocks the initiator
no longer uses.

Add TCMUR_OP_UNMAP and send one for each range of an UNMAP command or of
a WRITE SAME with the UNMAP bit. The core expects execute_unmap() to
return once the range is unmapped, so queue a struct tcmur_cmd that
lives on the stack and wait for the server to commit it.

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/target/target_core_uring.c     | 39 ++++++++++++++++++++++++++++++++++
 include/uapi/linux/target_core_uring.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/drivers/target/target_core_uring.c b/drivers/target/target_core_uring.c
index f39bf7bf36d0f..366c5e9820956 100644
--- a/drivers/target/target_core_uring.c
+++ b/drivers/target/target_core_uring.c
@@ -49,6 +49,7 @@ struct tcmur_dev;
  * @ref:	Held by the tag or the pending list and by data copies in
  *		progress
  * @deadline:	When to give up waiting for the server
+ * @done:	Complete this instead of @se_cmd when the last reference goes
  * @status:	SAM status to complete @se_cmd with
  */
 struct tcmur_cmd {
@@ -59,6 +60,7 @@ struct tcmur_cmd {
 	struct tcmur_io_desc	desc;
 	refcount_t		ref;
 	unsigned long		deadline;
+	struct completion	*done;
 	u8			status;
 };
 
@@ -148,6 +150,11 @@ static void tcmur_cmd_put(struct tcmur_cmd *tcmd)
 	if (!refcount_dec_and_test(&tcmd->ref))
 		return;
 
+	if (tcmd->done) {
+		complete(tcmd->done);
+		return;
+	}
+
 	target_complete_cmd(tcmd->se_cmd, tcmd->status);
 	kmem_cache_free(tcmur_cmd_cache, tcmd);
 }
@@ -268,6 +275,36 @@ static sense_reason_t tcmur_execute_sync_cache(struct se_cmd *se_cmd)
 			    se_cmd->data_length, NULL, 0);
 }
 
+static sense_reason_t tcmur_execute_unmap(struct se_cmd *se_cmd, sector_t lba,
+					  sector_t nolb)
+{
+	u32 block_size = se_cmd->se_dev->dev_attrib.block_size;
+	DECLARE_COMPLETION_ONSTACK(done);
+	struct tcmur_cmd tcmd = {
+		.se_cmd		= se_cmd,
+		.done		= &done,
+		.desc.op	= TCMUR_OP_UNMAP,
+		.desc.offset	= lba * block_size,
+		.desc.len	= nolb * block_size,
+	};
+
+	/* Wait here, as the core completes the command after all ranges */
+	tcmur_queue_cmd(TCMUR_DEV(se_cmd->se_dev), &tcmd);
+	wait_for_completion(&done);
+
+	return tcmd.status ? TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE : 0;
+}
+
+static bool tcmur_configure_unmap(struct se_device *dev)
+{
+	dev->dev_attrib.max_unmap_lba_count = UINT_MAX /
+					      dev->dev_attrib.hw_block_size;
+	dev->dev_attrib.max_unmap_block_desc_count = 1;
+	dev->dev_attrib.unmap_granularity = 1;
+	dev->dev_attrib.unmap_granularity_alignment = 0;
+	return true;
+}
+
 static void tcmur_tmr_notify(struct se_device *dev, enum tcm_tmreq_table tmf,
 			     struct list_head *aborted_cmds)
 {
@@ -941,6 +978,7 @@ static sector_t tcmur_get_blocks(struct se_device *dev)
 static struct exec_cmd_ops tcmur_exec_cmd_ops = {
 	.execute_rw		= tcmur_execute_rw,
 	.execute_sync_cache	= tcmur_execute_sync_cache,
+	.execute_unmap		= tcmur_execute_unmap,
 };
 
 static sense_reason_t tcmur_parse_cdb(struct se_cmd *se_cmd)
@@ -959,6 +997,7 @@ static const struct target_backend_ops tcmur_ops = {
 	.configure_device	= tcmur_configure_device,
 	.destroy_device		= tcmur_destroy_device,
 	.free_device		= tcmur_free_device,
+	.configure_unmap	= tcmur_configure_unmap,
 	.parse_cdb		= tcmur_parse_cdb,
 	.tmr_notify		= tcmur_tmr_notify,
 	.set_configfs_dev_params = tcmur_set_configfs_dev_params,
diff --git a/include/uapi/linux/target_core_uring.h b/include/uapi/linux/target_core_uring.h
index a1d8ae47ebf7d..9df10558cfa9e 100644
--- a/include/uapi/linux/target_core_uring.h
+++ b/include/uapi/linux/target_core_uring.h
@@ -68,6 +68,7 @@ enum tcmur_io_op {
 	TCMUR_OP_READ,
 	TCMUR_OP_WRITE,
 	TCMUR_OP_FLUSH,
+	TCMUR_OP_UNMAP,
 };
 
 /* Put the write on stable storage before completing it */

-- 
2.43.0

