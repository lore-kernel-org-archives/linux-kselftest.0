Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB3835B624
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 12:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770900599; cv=none; b=gwC2xlOIHoh+F19AdJ1WN+SkOYtLrF589KIgUHzriVW/3kYeipMCsjZimKDtXWMsUfoPWyD/SYPKyHX+4ktVaXhqxwMCN/rytnQTtDK9ZUPlfvZeA2e273huLU0NahmJzmw9Dc0jIHS1rbRabj4k08FNwxorJWbvEDUP588D8NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770900599; c=relaxed/simple;
	bh=fsl5WWtxmrPoYYSBvMqVKpVNxXkKLQ8r9VwBrQ/Jy/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SSOFl+QlaF6b6UL+PqxWAJLgaB+no/vFkdskDarOPQQTYCl5IxjJFQ98sKurJyenptfAyXDoeAT7TIfD56WmTiAebJiwQgqLKLjaUsYGKFv5FJghnPrg87v6NccDKEvQN5OPJTxaTHw1fDKmhAAS4P42T1pzvzsZwvsuWPJTIhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JL2IfzWg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JL2IfzWg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770900596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NP6nGvqKlqDagKZzO0NOYQJzeM+gUb7XE5Q9hm3WVoc=;
	b=JL2IfzWg+4/R6WM9eA3Ht0rGP/0pAY5nLP14CP9nl2h4KROCIrXpLx1Zfkgw++R2BDXmo0
	JSI4cDt6r/LH9koe5AiVK9nYF3AWPr2qrKtQQCwoy8QbKwQ66RORXQoir9FuSg/jw3CHlo
	XK7sa38u8xMfZcIAk6VqhB0GgIMsi/Q=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-155-PIHUj5TjOe6cmHPqU6Os3w-1; Thu,
 12 Feb 2026 07:49:51 -0500
X-MC-Unique: PIHUj5TjOe6cmHPqU6Os3w-1
X-Mimecast-MFC-AGG-ID: PIHUj5TjOe6cmHPqU6Os3w_1770900589
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5675C1956052;
	Thu, 12 Feb 2026 12:49:49 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.22.11])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB2E230001BB;
	Thu, 12 Feb 2026 12:49:43 +0000 (UTC)
From: Gabriele Paoloni <gpaoloni@redhat.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	brendan.higgins@linux.dev,
	raemoar63@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Cc: acarminati@nvidia.com,
	linux-mm@kvack.org,
	safety-architecture@lists.elisa.tech,
	kstewart@linuxfoundation.org,
	chuckwolber@gmail.com,
	gpaoloni@redhat.com
Subject: [RFC PATCH v3 2/6] /dev/mem: Add initial documentation of memory_open() and mem_fops
Date: Thu, 12 Feb 2026 13:49:19 +0100
Message-ID: <20260212124923.222484-3-gpaoloni@redhat.com>
In-Reply-To: <20260212124923.222484-1-gpaoloni@redhat.com>
References: <20260212124923.222484-1-gpaoloni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

This patch proposes initial kernel-doc documentation for memory_open()
and most of the functions in the mem_fops structure.

Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
---
 drivers/char/mem.c | 196 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 190 insertions(+), 6 deletions(-)

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 52039fae1594..9aa589ea2ef5 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -75,9 +75,34 @@ static inline bool should_stop_iteration(void)
 	return signal_pending(current);
 }
 
-/*
- * This funcion reads the *physical* memory. The f_pos points directly to the
- * memory location.
+/**
+ * read_mem - read from physical memory (/dev/mem).
+ * @file: struct file associated with /dev/mem.
+ * @buf: user-space buffer to copy data to.
+ * @count: number of bytes to read.
+ * @ppos: pointer to the current file position, representing the physical
+ *        address to read from.
+ *
+ * read_mem behavior:
+ * 1. it checks if the requested physical memory range [ppos, ppos + count - 1]
+ *    is valid;
+ * 2. for each page in the requested range, it checks if user space access is
+ *    allowed;
+ * 3. for each page in the requested range it copies data into the input
+ *    user-space buffer, padding with zero if access to the page is restricted
+ *    or the page is not mapped;
+ * 4. increases '*ppos' by the number of bytes successfully copied to user
+ *    space.
+ *
+ * Context: process context.
+ *
+ * Return:
+ * * the number of bytes copied to user on success
+ * * %-EFAULT - the requested address range is not valid or a fault happened
+ *   when copying to user-space (i.e. copy_from_kernel_nofault() failed)
+ * * %-EPERM - access to any of the required physical pages is not allowed
+ * * %-ENOMEM - out of memory error for auxiliary kernel buffers supporting
+ *   the operation of copying content from the physical pages
  */
 static ssize_t read_mem(struct file *file, char __user *buf,
 			size_t count, loff_t *ppos)
@@ -166,6 +191,49 @@ static ssize_t read_mem(struct file *file, char __user *buf,
 	return err;
 }
 
+/**
+ * write_mem - write to physical memory (/dev/mem).
+ * @file: struct file associated with /dev/mem.
+ * @buf: user-space buffer containing the data to write.
+ * @count: number of bytes to write.
+ * @ppos: pointer to the current file position, representing the physical
+ *        address to write to.
+ *
+ * write_mem behavior:
+ * 1. This function checks if the value pointed by ppos exceeds the maximum
+ *    addressable physical address;
+ *
+ * 2. This function checks if the physical address range to be written is valid
+ *    (i.e. it falls within a memory block and if it can be mapped to the kernel
+ *    address space);
+ *
+ * 3. For each memory page falling in the physical range to be written
+ *    [ppos, ppos + count - 1]:
+ *    3.1. this function checks if user space access is allowed (if config
+ *         STRICT_DEVMEM is not set, access is always granted), if access is not
+ *         allowed an error is returned; otherwise
+ *
+ *    3.2  if access to the memory page is restricted or if the current page is
+ *         page 0 on HW architectures where page 0 is not mapped, the content
+ *         from the user space buffer is skipped;
+ *
+ *
+ *    3.3  else the content from the user space buffer is copied to the page
+ *         range falling within the physical range to be written;
+ *
+ * 4. The file position '*ppos' is advanced by the number of bytes successfully
+ *    copied from user space (including skipped bytes).
+ *
+ * Context: process context.
+ *
+ * Return:
+ * * the number of bytes copied from user-space on success
+ * * %-EFBIG - the value pointed by ppos exceeds the maximum addressable
+ *   physical address
+ * * %-EFAULT - the physical address range is not valid or no bytes could
+ *   be copied from user-space
+ * * %-EPERM - access to any of the required pages is not allowed
+ */
 static ssize_t write_mem(struct file *file, const char __user *buf,
 			 size_t count, loff_t *ppos)
 {
@@ -327,6 +395,38 @@ static int mmap_filter_error(int err)
 	return -EAGAIN;
 }
 
+/**
+ * mmap_mem_prepare - prepare to map memory into user space (/dev/mem).
+ * @desc: virtual memory area descriptor of the user mapping.
+ *
+ * mmap_mem_prepare behavior:
+ * 1. This function checks if the requested physical address range to be mapped
+ *    fits within the maximum addressable physical range;
+ *
+ * 2. This function checks if the requested  physical range corresponds to a
+ *    valid physical range and if access is allowed on it (if config
+ *    STRICT_DEVMEM is not set, access is always allowed);
+ *
+ * 3. This function checks if the input virtual memory area can be used for a
+ *    private mapping (always OK if there is an MMU);
+ *
+ * 4. This function sets the virtual memory area operations for iomem mmap
+ *    access;
+ *
+ * 5. This function prepare the virtual memory area descriptor to be
+ *    remapped to the physical memory range specified by desc->pgoff
+ *    and size (desc->end - desc->start);
+ *
+ * Context: process context.
+ *
+ * Return:
+ * * 0 on success
+ * * %-EAGAIN - invalid or unsupported mapping requested (remap_pfn_range()
+ *   fails)
+ *   %-ENOSYS - private mapping is not allowed
+ * * %-EINVAL - requested physical range to be mapped is not valid
+ * * %-EPERM - no permission to access the requested physical range
+ */
 static int mmap_mem_prepare(struct vm_area_desc *desc)
 {
 	struct file *file = desc->file;
@@ -579,13 +679,44 @@ static loff_t null_lseek(struct file *file, loff_t offset, int orig)
 	return file->f_pos = 0;
 }
 
-/*
+/**
+ * memory_lseek - change the file position.
+ * @file: file structure for the device.
+ * @offset: file offset to seek to.
+ * @orig: where to start seeking from (see whence in the llseek manpage).
+ *
+ * memory_leeek behavior:
+ * 1. This function locks the semaphore of the inode corresponding to the
+ *    input file before any operation and unlock it before returning.
+ *
+ * 2. This function checks the origin value (orig) and accordingly:
+ *   2.1. if it is equal to SEEK_CUR, the current file position is
+ *        incremented by the input offset;
+ *   2.2. if it is equal to SEEK_SET, the current file position is
+ *        set to the input offset value;
+ *   2.3. any other value results in an error condition.
+ *
+ * 3. Before writing the current file position, the new position value
+ *    is checked to not overlap with Linux ERRNO values.
+ *
+ * memory_lseek constraints of use:
+ * 1. the input file pointer is expected to be valid.
+ *
+ * Notes:
  * The memory devices use the full 32/64 bits of the offset, and so we cannot
  * check against negative addresses: they are ok. The return value is weird,
  * though, in that case (0).
  *
- * also note that seeking relative to the "end of file" isn't supported:
- * it has no meaning, so it returns -EINVAL.
+ * Also note that seeking relative to the "end of file" isn't supported:
+ * it has no meaning, so passing orig equal to SEEK_END returns -EINVAL.
+ *
+ * Context: process context, locks/unlocks inode->i_rwsem
+ *
+ * Return:
+ * * the new file position on success
+ * * %-EOVERFLOW - the new position value equals or exceeds
+ *   (unsigned long long) -MAX_ERRNO
+ * * %-EINVAL - the orig parameter is invalid
  */
 static loff_t memory_lseek(struct file *file, loff_t offset, int orig)
 {
@@ -613,6 +744,32 @@ static loff_t memory_lseek(struct file *file, loff_t offset, int orig)
 	return ret;
 }
 
+/**
+ * open_port - open the I/O port device (/dev/port).
+ * @inode: inode of the device file.
+ * @filp: file structure for the device.
+ *
+ * open_port expectations:
+ * 1. This function checks if the caller has sufficient capabilities to
+ *    perform raw I/O access;
+ *
+ * 2. This function checks if the kernel is locked down with the
+ *    &LOCKDOWN_DEV_MEM restriction;
+ *
+ * 3. If the input inode corresponds to /dev/mem, this function sets the
+ *    f_mapping pointer of the input file structure to the i_mapping pointer
+ *    of the input inode;
+ *
+ * open_port constraints of use:
+ * 1. The input inode and filp are expected to be valid.
+ *
+ * Context: process context.
+ *
+ * Return:
+ * * 0 on success
+ * * %-EPERM - caller lacks the required capability (CAP_SYS_RAWIO)
+ * * any error returned by securty_locked_down()
+ */
 static int open_port(struct inode *inode, struct file *filp)
 {
 	int rc;
@@ -720,6 +877,33 @@ static const struct memdev {
 #endif
 };
 
+/**
+ * memory_open - set the filp f_op to the memory device fops and invoke open().
+ * @inode: inode of the device file.
+ * @filp: file structure for the device.
+ *
+ * memory_open behavior:
+ * 1. This function retrieves the minor number associated with the input inode
+ *    and the memory device corresponding to such a minor number;
+ *
+ * 2. The file operations pointer is set to the memory device file operations;
+ *
+ * 3. The file mode member of the input filp is OR'd with the device mode;
+ *
+ * 4. The memory device open() file operation is invoked.
+ *
+ * memory_open constraints of use:
+ * 1. The input inode and filp are expected to be valid.
+ *
+ * Context: process context.
+ *
+ * Return:
+ * * 0 on success
+ * * %-ENXIO - the minor number corresponding to the input inode cannot be
+ *   associated with any device or the corresponding device has a NULL fops
+ *   pointer
+ * * any error returned by the device specific open function pointer
+ */
 static int memory_open(struct inode *inode, struct file *filp)
 {
 	int minor;
-- 
2.48.1

