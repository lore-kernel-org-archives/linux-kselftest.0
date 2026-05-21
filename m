Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCCB365A12
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 09:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354662; cv=none; b=SQZWm57hkMYJ0zT/BkbXHpvqVA/SOysAoc564m2eEjqlxeM2wfQNzxpbIR6Z/wuxZvNBih+7BtckHY9Mc7IR08B50Wb8JFdjX4ai/e4FN5M2jlfpmT+vdbJjOo9sUIyHVUlGqy9geykGjni84Gdm/o7taTNBbDaaV/FBz1rLpFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354662; c=relaxed/simple;
	bh=LUVEbF2qik6JDxZLdpWxQMrWMt8EdXOnTWHgU/bDF84=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tC+krSo1nBcsiyw7wMBPEa2xPfO6aeHlBGtKqODP+McJOZeae75bYU6CNsslRp8AHPUXZG7lORhKDOTdoBxdtc7KMiLqexC2qbZNF5rqZcYCVt5D5FazNXOHJi/6+p8M6lE8v50dVsQ6aVhruosWdZ4+RSk6yThpZ1bUxIBUFKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HjQqXJwy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HjQqXJwy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779354660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tL4bc9P4R8KGMQCjOMGjzl7XMoB1LctMJh1QnkgN/GQ=;
	b=HjQqXJwyFLCPItUIj3WQEztQQ5VTAHs9TPIqq6X6GePxEhhTTkRzgWXf4WK3UKr6XX1akM
	XHcQx3nXXf+dZi3IckcJ3DZ3TfwO8g088ClakrW6OzWBXu3Ru8yq17TzwK+f+huwx5d1gn
	6TmfxImgntoFtdhWmFt6/zDO2JNDC7w=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-395-3wFvOmq4Mn6ew9z9wV80vw-1; Thu,
 21 May 2026 05:10:54 -0400
X-MC-Unique: 3wFvOmq4Mn6ew9z9wV80vw-1
X-Mimecast-MFC-AGG-ID: 3wFvOmq4Mn6ew9z9wV80vw_1779354652
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 798831956056;
	Thu, 21 May 2026 09:10:52 +0000 (UTC)
Received: from [192.168.1.153] (headnet01.pony-001.prod.iad2.dc.redhat.com [10.2.32.101])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 380DD19560A3;
	Thu, 21 May 2026 09:10:49 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Subject: [PATCH 0/2] dma-buf: add DMA_BUF_IOCTL_DERIVE for
 reduced-permission aliases
Date: Thu, 21 May 2026 11:10:13 +0200
Message-Id: <20260521-dmabuf-limit-access-v1-0-26c01e27365a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSQqAMAxA0atI1gY6OOFVxEWtUQNONCqCeHeLy
 7f4/wGhwCRQJw8Eulh4WyN0moCf3DoSch8NRplC5UZhv7juHHDmhQ903pMIltYU2ua2yrSDWO6
 BBr7/a9O+7wfhdnW9ZQAAAA==
X-Change-ID: 20260520-dmabuf-limit-access-73261353841a
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Albert Esteve <aesteve@redhat.com>, 
 mripard@kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779354648; l=3435;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=LUVEbF2qik6JDxZLdpWxQMrWMt8EdXOnTWHgU/bDF84=;
 b=1nbNWgdOgax/ZiztigFfGJVUWcZKvRsY/6bLBBCxRH9PBuJ2gSbSAkKc9o7ctC21xFonFEIBn
 UfK5yxy7NMID+5Z66wciWiUPogDnxCkZe9uRxn+1h/0yrM9AwPOE0eF
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

When sharing a dma-buf between components of different trust levels, the
allocator may need to hand a consumer a read-only view of a buffer it
holds with read-write access. An example is a camera pipeline where the
capture component writes frames into a buffer and needs to pass a
read-only handle to a downstream processing component that should not be
able to modify the data.

However, no such mechanism exists today. The access mode of a dma-buf
file descriptor is fixed at export time, and the standard POSIX
interfaces for duplicating or changing file descriptors (i.e., dup(2),
dup3(2), and fcntl(F_SETFL)) cannot alter the read/write access mode of
the copy.

One natural candidate would be reopening via /proc/self/fd/<N> with
O_RDONLY, which works for regular files. For dma-buf this would fail
(that is, if we were to add a new handler for open f_op) with ENXIO
because the dmabuf pseudo-filesystem carries SB_NOUSER, which prevents
the VFS from opening its files through path-based resolution from
userspace.

Alternatively, exporting the buffer twice would produce two independent
dma_buf instances, which breaks fence synchronization.

Therefore we add a new DMA_BUF_IOCTL_DERIVE ioctl, which produces a new
file descriptor for an existing dma-buf with a caller-specified subset
of the original permissions:

```
  struct dma_buf_derive { __u32 flags; __s32 fd; };

  struct dma_buf_derive req = { .flags = O_RDONLY | O_CLOEXEC };
  ioctl(rw_fd, DMA_BUF_IOCTL_DERIVE, &req);
  /* req.fd is now a read-only alias of the same buffer */
```

Permission escalation is rejected with -EACCES. The new fd aliases the
same struct dma_buf as the original, same dma_resv, same exporter ops,
same underlying memory; so importers attaching to either fd see the same
fence timeline and operate on the same object. Access control for which
components may receive or pass on restricted descriptors can be layered on
top via SELinux file:read and file:write permissions.

A shared writable mapping (PROT_WRITE | MAP_SHARED) on the read-only fd is
rejected with -EACCES in dma_buf_mmap_internal().

Two small internal adjustments accompany the ioctl:
- __dma_buf_list_del() is moved to dma_buf_release() so it fires exactly
  once on dentry destruction rather than on every file close.
- dma_buf_file_release() is updated to call dma_buf_put() only for
  files that are not the primary dma-buf file.

This may not be the best approach, but after considering different
options and alternatives (as described above), we decided to raise the
discussion upstream. Thus, we welcome any alternative proposal or ideas.

The series is structured as:
- Patch 1 adds the new ioctl implementation.
- Patch 2 adds selftests covering the new ioctl.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
Albert Esteve (2):
      dma-buf: add DMA_BUF_IOCTL_DERIVE for reduced-permission aliases
      selftests: dma-buf: add DERIVE ioctl tests

 drivers/dma-buf/dma-buf.c                          |  58 ++++++++++-
 include/uapi/linux/dma-buf.h                       |  28 +++++
 tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 114 ++++++++++++++++++++-
 3 files changed, 198 insertions(+), 2 deletions(-)
---
base-commit: ab5fce87a778cb780a05984a2ca448f2b41aafbf
change-id: 20260520-dmabuf-limit-access-73261353841a

Best regards,
-- 
Albert Esteve <aesteve@redhat.com>

