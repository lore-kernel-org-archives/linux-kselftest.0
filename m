Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EA035B63D
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 09:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354667; cv=none; b=c2OUUS+K42NcXQm0CKVGCDsGZyaneaFLKlbZDyaMf34BagRH7YAud5ESePQeAzFKbAYMPiNlhq2N0tPnpp1KlGpElCrhA4VckVcCPJTAnO1Rww6OQKo7uB24KY3UyOhWXalQvxnGSFcacupnLFDok8Jq/2HGj6I2wzzYuU31xVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354667; c=relaxed/simple;
	bh=/ApxYmdq3kHu3thKFegK+YtWMiL83D621EF8tkmYSG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dcOsXb1r+WpeXnMN7/ad6T33EaUwh4S1gL7BsunTlpoSgz4+9TYhhFMt5H9Qdskkxow0++j5z6R0jrgce2RQGG9oFeBxt4wJbRsH4CwmZIgCpwQgTcRhux7REa37/hrrRUhs3MSDW/63c1T6lWFgVbC4UNjJrxq36WiiaqYINx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dakjvNme; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dakjvNme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779354665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vjxV//gOyz/n+AtRONHMGYrZm4NAi0bq2+NJ8phfFu8=;
	b=dakjvNmeblZKjtxoJ9AwzAeoABWC02XdhyuLhANt5pOytUeod+rK4xLAEdmADI0wLaahEu
	gWwmT3uTfthZr0u7P+lRQxVPZ/lrOkKy/ZBoorejcWDWSOH/RshWb0eEouNTRgOR8ZVskX
	vpL7EfGby4oxVOTJB6EVJ37Vny8iysc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-160-qNw0hdrzO3mUsAwMX-eh-w-1; Thu,
 21 May 2026 05:11:01 -0400
X-MC-Unique: qNw0hdrzO3mUsAwMX-eh-w-1
X-Mimecast-MFC-AGG-ID: qNw0hdrzO3mUsAwMX-eh-w_1779354659
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4CD221800343;
	Thu, 21 May 2026 09:10:59 +0000 (UTC)
Received: from [192.168.1.153] (headnet01.pony-001.prod.iad2.dc.redhat.com [10.2.32.101])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 33E7C19560A3;
	Thu, 21 May 2026 09:10:56 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 21 May 2026 11:10:15 +0200
Subject: [PATCH 2/2] selftests: dma-buf: add DERIVE ioctl tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-dmabuf-limit-access-v1-2-26c01e27365a@redhat.com>
References: <20260521-dmabuf-limit-access-v1-0-26c01e27365a@redhat.com>
In-Reply-To: <20260521-dmabuf-limit-access-v1-0-26c01e27365a@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Albert Esteve <aesteve@redhat.com>, 
 mripard@kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779354648; l=4904;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=/ApxYmdq3kHu3thKFegK+YtWMiL83D621EF8tkmYSG4=;
 b=Xw1Be6/9oJc7tUp8Mo1663PiOX1fvKwqDaWX3WJ3OMPYs/gXgAh7yML6JMuLdi5QSXy/RKbdE
 8UmbeD0gzGDCHTDVwDgZf86kMG0+6oi6wy+eK+Yz6BDr1US2pGcJXSz
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

dma-buf now supports aliasing an existing file descriptor with reduced
access permissions via DMA_BUF_IOCTL_DERIVE ioctl, and enforces that a
shared writable mapping cannot be created through a read-only file
descriptor.

Add two tests to the dmabuf-heaps selftest to exercise this behaviour.
The positive test allocates a buffer, derives its file descriptor as
O_RDONLY through the ioctl, confirms that a read-only shared mapping
succeeds, and verifies that data written through the original read-write
file descriptor is visible through the derived one.

The negative test confirms that attempting a DMA_BUF_IOCTL_DERIVE ioctl
call with RW flags on a read-only file descriptor is rejected with EACCES.
Same for mmap() escalation attempt.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 114 ++++++++++++++++++++-
 1 file changed, 113 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
index fc9694fc4e89e..c3856189200be 100644
--- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
+++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
@@ -390,6 +390,116 @@ static void test_alloc_errors(char *heap_name)
 	close(heap_fd);
 }
 
+static int setup_ro_derive(int heap_fd, int *dmabuf_fd, int *ro_fd)
+{
+	struct dma_buf_derive params = {
+		.flags = O_RDONLY | O_CLOEXEC,
+	};
+	int ret;
+
+	ret = dmabuf_heap_alloc(heap_fd, ONE_MEG, 0, dmabuf_fd);
+	ksft_test_result(!ret, "Allocate RW buffer\n");
+	if (ret)
+		return -1;
+
+	ret = ioctl(*dmabuf_fd, DMA_BUF_IOCTL_DERIVE, &params);
+	ksft_test_result(!ret, "Derive as O_RDONLY %s\n",
+			 ret < 0 ? strerror(errno) : "OK");
+	if (ret < 0) {
+		close(*dmabuf_fd);
+		*dmabuf_fd = -1;
+		return -1;
+	}
+
+	*ro_fd = params.fd;
+	return 0;
+}
+
+static void test_ro_derive(char *heap_name)
+{
+	int heap_fd = -1, dmabuf_fd = -1, ro_fd = -1;
+	void *rw_map = MAP_FAILED, *ro_map = MAP_FAILED;
+	int ret;
+
+	heap_fd = dmabuf_heap_open(heap_name);
+
+	ksft_print_msg("Testing read-only derive with mmap:\n");
+
+	if (setup_ro_derive(heap_fd, &dmabuf_fd, &ro_fd))
+		goto out;
+
+	rw_map = mmap(NULL, ONE_MEG, PROT_READ | PROT_WRITE, MAP_SHARED,
+		      dmabuf_fd, 0);
+	ksft_test_result(rw_map != MAP_FAILED, "RW mmap on RW fd %s\n",
+			 rw_map == MAP_FAILED ? strerror(errno) : "OK");
+	if (rw_map == MAP_FAILED)
+		goto out;
+
+	dmabuf_sync(dmabuf_fd, DMA_BUF_SYNC_START);
+	memset(rw_map, 0xab, ONE_MEG);
+	dmabuf_sync(dmabuf_fd, DMA_BUF_SYNC_END);
+
+	ro_map = mmap(NULL, ONE_MEG, PROT_READ, MAP_SHARED, ro_fd, 0);
+	ksft_test_result(ro_map != MAP_FAILED, "RO mmap on RO fd %s\n",
+			 ro_map == MAP_FAILED ? strerror(errno) : "OK");
+	if (ro_map == MAP_FAILED)
+		goto out;
+
+	dmabuf_sync(ro_fd, DMA_BUF_SYNC_START);
+	ret = memcmp(rw_map, ro_map, ONE_MEG);
+	dmabuf_sync(ro_fd, DMA_BUF_SYNC_END);
+	ksft_test_result(!ret, "Data written via RW fd visible through RO fd\n");
+
+out:
+	if (ro_map != MAP_FAILED)
+		munmap(ro_map, ONE_MEG);
+	if (rw_map != MAP_FAILED)
+		munmap(rw_map, ONE_MEG);
+	if (ro_fd >= 0)
+		close(ro_fd);
+	if (dmabuf_fd >= 0)
+		close(dmabuf_fd);
+	close(heap_fd);
+}
+
+static void test_ro_derive_escalation(char *heap_name)
+{
+	struct dma_buf_derive params = {
+		.flags = O_RDWR | O_CLOEXEC,
+	};
+	int heap_fd = -1, dmabuf_fd = -1, ro_fd = -1, ret = 0;
+	void *bad_map;
+
+	heap_fd = dmabuf_heap_open(heap_name);
+
+	ksft_print_msg("Testing read-only derive with escalation attempt:\n");
+
+	if (setup_ro_derive(heap_fd, &dmabuf_fd, &ro_fd))
+		goto out;
+
+	ret = ioctl(ro_fd, DMA_BUF_IOCTL_DERIVE, &params);
+	ksft_test_result(ret < 0 && errno == EACCES,
+			 "O_RDWR derive on RO fd correctly rejected (errno=%d)\n",
+			 errno);
+	if (!ret)
+		close(params.fd);
+
+	bad_map = mmap(NULL, ONE_MEG, PROT_READ | PROT_WRITE, MAP_SHARED,
+		       ro_fd, 0);
+	ksft_test_result(bad_map == MAP_FAILED && errno == EACCES,
+			 "RW shared mmap on RO fd correctly rejected (errno=%d)\n",
+			 errno);
+	if (bad_map != MAP_FAILED)
+		munmap(bad_map, ONE_MEG);
+
+out:
+	if (ro_fd >= 0)
+		close(ro_fd);
+	if (dmabuf_fd >= 0)
+		close(dmabuf_fd);
+	close(heap_fd);
+}
+
 static int numer_of_heaps(void)
 {
 	DIR *d = opendir(DEVPATH);
@@ -420,7 +530,7 @@ int main(void)
 		return KSFT_SKIP;
 	}
 
-	ksft_set_plan(11 * numer_of_heaps());
+	ksft_set_plan(20 * numer_of_heaps());
 
 	while ((dir = readdir(d))) {
 		if (!strncmp(dir->d_name, ".", 2))
@@ -435,6 +545,8 @@ int main(void)
 		test_alloc_zeroed(dir->d_name, ONE_MEG);
 		test_alloc_compat(dir->d_name);
 		test_alloc_errors(dir->d_name);
+		test_ro_derive(dir->d_name);
+		test_ro_derive_escalation(dir->d_name);
 	}
 	closedir(d);
 

-- 
2.53.0

