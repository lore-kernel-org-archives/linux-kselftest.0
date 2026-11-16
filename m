Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794788426;
	b=exnPXIZ/UFOAI/SFvcnK6V/ppziaW1tGPWXW6HxZ8hJrJN4bWV956Q4eb/fBTyhoGGab
	 Fb6jPTneGEpFCu90bgwROjyhuuacNEi1n+xQIJ50s2b1qwkzoii0O/aDFQKo52ZQCMSAB
	 8LeZBzSiKCm05baDBNbFQF5jGOhRB0D2gvSg0VtQyLerCYIvLj87A36eMH/QJr7/LTemh
	 jbVIMf+DNEahC0KH29sFZylvNGg/ptox5/3G7Bj6UpFhaEpqA/QxpE6DD0BEpWvCkrtTp
	 ukUkGNu81Mu1US8yopORu/laggRrhwXg8nyZhDxcQN6FwZ//5Q6F5KG141TXR3UZoLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794788426;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=4eG5CVxVnNeWp3KUkHiU/UFqeHQnVoeyxI1ZUaXIdH8=;
	b=nNF0FaP4dcI5kjr0IdguwtbRGxedEW77U5PzBJBBVi/dy0OStiQMaZ+Yn8LAWdiurtfF
	 h76Vc6sl8G4eRHB/nnNqs9VHuBPO3Qqp6cQTu5rUiEOt9audyek0k5taOvoPEa3j2HVsM
	 bHpmnKH+gSz3aCJRF103GMFoI7g1C9Bg1HHysdHFf1WKej0Ioml8nWz7DC22wXP8u28UO
	 FXFPuN5Nn0Gwzn6wQAzVr/U/f8A2Dj4DsWFwCdqCKTpP6f/ryx90d4tcmEOfPAsu5uR5p
	 YNxenHo0VbGmSREQGi1XfOqg/JBb+QGXkgLoPY8gRImMLgc39+67/5VCJswCPrMISVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sLZzD7e0;
	arc=none smtp.remote-ip=91.218.175.72
Received: from mta0.migadu.com (out-72.mta0.migadu.com [91.218.175.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF0C606A31F
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 00:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF0C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sLZzD7e0
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KWOMiOdqLTUcS7AFYWTNaPVfHdHsr6JQcL0b0AXvC5o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794788423; v=1; x=1795393223;
 b=sLZzD7e0b3nfYGKOQD9nm191fM1dT0DEuaQk2W7QEypeGPCoZeliBLvcGr+jGQLmSUWIEnoB
 Mkh7KWT+SDkXJIiOI4AEcPSI2kOr2BKzyfeYRcyAbWCC2ElNpdpWbq3inbhtW+Nk9fK3XPz+yqE
 s6LqHEeYQx2dU1L5g1LknG2Q=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 67c85e73c015bfed;
	Mon, 16 Nov 2026 00:20:23 +0000
X-Mizu-Trace-ID: 67c85e73c015bfed
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Sun, 15 Nov 2026 19:18:11 -0500
Subject: [PATCH RFC 18/18] Documentation: target: Describe the uring
 backstore
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
Message-Id: <20261115-feat-target-core-uring-v1-18-28cdc137eac6@linux.dev>
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

target_core_uring is a new LIO backstore served by a userspace process.

Its configfs parameters and the protocol between the kernel and the
server are only described by the uAPI header and the code.

Add tcm-uring.rst, which explains how the backstore differs from
TCM/USER, how to create a device and what a server has to do.

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 Documentation/target/index.rst     |  1 +
 Documentation/target/tcm-uring.rst | 84 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/Documentation/target/index.rst b/Documentation/target/index.rst
index 51fa8ebc652ef..253b5fe422732 100644
--- a/Documentation/target/index.rst
+++ b/Documentation/target/index.rst
@@ -8,5 +8,6 @@ TCM Virtual Device
     :maxdepth: 1
 
     tcmu-design
+    tcm-uring
     tcm_mod_builder
     scripts
diff --git a/Documentation/target/tcm-uring.rst b/Documentation/target/tcm-uring.rst
new file mode 100644
index 0000000000000..2911d80721f75
--- /dev/null
+++ b/Documentation/target/tcm-uring.rst
@@ -0,0 +1,84 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================
+TCM io_uring backstore
+======================
+
+target_core_uring is a LIO backstore whose block commands are served by a
+userspace process, like TCM/USER (see tcmu-design.rst). It differs from
+TCM/USER in three ways:
+
+- The kernel emulates the SCSI commands. The server only reads, writes,
+  flushes and unmaps blocks and never parses a CDB.
+- A device has several queues. Each queue is served through its own
+  io_uring, so that queues do not contend with each other.
+- Data is copied once, with pread() and pwrite(), or not at all when the
+  server registers the data pages of a command as a fixed buffer.
+
+Creating a device
+=================
+
+A device is created through configfs like any other backstore::
+
+    mkdir -p /sys/kernel/config/target/core/uring_0/disk0
+    cd /sys/kernel/config/target/core/uring_0/disk0
+    echo "dev_size=1073741824,nr_queues=4,queue_depth=128" > control
+    echo 1 > enable
+
+The ``control`` file takes these parameters:
+
+``dev_size``
+    Size of the device in bytes. It must be a multiple of the block size.
+
+``block_size``
+    Logical block size in bytes, 512 by default.
+
+``nr_queues``
+    Number of queues, 1 by default. A command goes to the queue selected by
+    the CPU it was submitted on.
+
+``queue_depth``
+    Number of commands the server can work on per queue, 128 by default.
+
+``cmd_time_out``
+    Seconds after which a command the server has not completed fails. 30 by
+    default; 0 waits forever.
+
+Once the device is enabled, the ``info`` file shows the character device
+the server has to open, for instance ``/dev/tcmur0``.
+
+Serving a device
+================
+
+The interface is defined in ``include/uapi/linux/target_core_uring.h``.
+Only one process can open the character device at a time. The server:
+
+1. Reads the geometry with the ``TCMUR_GET_DEV_INFO`` ioctl.
+2. Maps the descriptors of each queue read-only, at offset
+   ``q_id * TCMUR_DESC_AREA_SIZE``. The area holds one
+   ``struct tcmur_io_desc`` per tag.
+3. Issues one ``TCMUR_IO_FETCH`` io_uring command (``IORING_OP_URING_CMD``)
+   per tag. A fetch command completes with 0 once the descriptor of its tag
+   holds a command.
+4. Handles the command and issues ``TCMUR_IO_COMMIT_AND_FETCH`` with the
+   result, which also waits for the next command of the tag.
+
+The server owns a tag from the completion of the fetch command until it
+commits the result. Meanwhile it accesses the data of the command in one of
+two ways:
+
+- pread() and pwrite() on the character device at the position returned by
+  ``tcmur_buf_pos()``. Reading returns the data of a write command; writing
+  fills the data of a read command.
+- ``TCMUR_IO_REGISTER_BUF`` registers the data pages as a fixed buffer of
+  the io_uring, which the server then passes to ``IORING_OP_READ_FIXED`` or
+  ``IORING_OP_WRITE_FIXED`` on its backing store. The buffer has to be
+  removed with ``TCMUR_IO_UNREGISTER_BUF``; the command only completes once
+  it is gone.
+
+Commands that arrive while no tag is waiting stay queued in the kernel.
+When the server exits, the commands it was working on fail and the queued
+ones wait for the next server, until they time out.
+
+``tools/testing/selftests/target_core_uring/tcmur_server.c`` is a small
+server that implements all of the above.

-- 
2.43.0

