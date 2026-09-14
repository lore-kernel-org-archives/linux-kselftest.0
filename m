Received: from mail-ua1-f100.google.com (mail-ua1-f100.google.com [209.85.222.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0A549C4D7
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 20:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417465; cv=none; b=C7tZ2muvq788IMYgcgIb9j+jEzm01KO34C2Vo9A1DH20i2JY/80fWJmF9hR1G4kKkGnJhmTMn/PAK+CpIF8XLoRilKjF8+3ZHQPMY/hXu7QDoMEUui+MM+zdNJl5QbrLim4hZ24UI035sH+cJsXuuk03dU+CwP3V8UaXE+lts4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417465; c=relaxed/simple;
	bh=QzGyE3gc3NE4McPOtuP5S55HZ8A8IfEQPntOV+MpgGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BTVc33VsEOtmitNnD5W4D8vJXWmaxW8UCu37sq5fZ3LtWmi3DoWt+tThhv60IPZ8h3IKMSuagpJP4QgfEBiJmAewO9F0Fo9YilmLs3Oza+YeMwzjc3cH1VSUPjKi6vzS04qDONP0w6jvrANQJ3KpSH9+7XNVuWgcZn+nljePWSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OkMlmVxB; arc=none smtp.client-ip=209.85.222.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OkMlmVxB"
Received: by mail-ua1-f100.google.com with SMTP id a1e0cc1a2514c-982cfbcfa4fso52266241.3
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 13:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417462; x=1790022262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PdHc/PVNJgEKpmU97s5aFFCrW71lWLYc+Sp0PVMH3I=;
        b=VNv6wIDUiVZntcW4eof2qA9Y/MJdSvg0vbRWUBF5bQ+/1SYyojphLcNA4rFYTVw2b7
         TmxLALBR3x3e3OyhH6GMbelD5zahbHAUXqZn6ZIeKazOsBOeQ7XueYDWLuQfpLrqs7SJ
         B8KT4Y+d2ICXjFfnH/UBR18LYQC8nQd0fWH+M9HRgVONnZNWr3k2YNjSJHIO3Au4+Xln
         BW7GYL/T4X7tHTXf9s3TiV6HgdV6TuDwJbdpHW9dLTLL/uwEsTGfgOHYWAAUfMVHSFco
         lzR9L+cbimuy/JhydPT0dL5AHvMtkJqf4wJehciIMKwX4biVJU1axS7bwhbh6HexZAfh
         YWkg==
X-Forwarded-Encrypted: i=1; AKwUvBzjiu60OgnyOYFWfmEPZQvPeKcb0TvKZNBGf4qly+Ui8kghlL9xYg7dqEsmoUE7/dUG4F6nxa7aishJBsn2iJg=@vger.kernel.org
X-Gm-Message-State: AFuF++kYzntq2u0dtyQlZJlw9/5wsuw3D4LSVw/LFZK1BCSaVGbkHq2Z
	2BR30D/sTm8g0BXtP5X+M5VN2oftlAlaIaHRtbJ93DWcrOpRSG52U9aTfC/6/mb3btlIrQwaJLu
	Y4iZ0hiqChxaZVccSU+iLKufIf0sMqC8nUyqudCGwNL0xSO/ASdP+919nUW62Pz/pK2vEiI+RXz
	y1XUjv+u3rcWp/fWCt3bAqvxA5wa3m52ROJWp9jNsu2jxphYtpVM6ZQhKHLDdUOX1jh5EP4Tvs8
	bvvz91wwAYQwmzyOBCPAfAZSw==
X-Gm-Gg: AYBFou3BjLBq5WQL9fq7iGts8C1wNrau6A+3TXAnFi/64OqepM3OYoKfbkmZRozGFAo
	m/FlVhaAwvAKaQw5lKWsN4sFN/g7Zp9f25tvHi9tlNEMze3kTl2LsoR0qBZ6rE3aegzmz6yrQQ4
	pc13TVYf359FMW7lyNcIewu+uUK++G9CM7hZ5HIcoM+LnzD+1vdDZL15VEV1hv3jeFuVrW+mdAM
	TgpR+BRxdXNt+n1qsBXwjhDs9GCg8BPqhcy7r9C7n4Yn9wmZUI0Jk2nhbqpq3rmSbtWOmfLyED9
	tgm2gycek8symLuOSw/myxqLHxY85v14mRwKXLd6Qy2hMlAcpCJv4m5VQL3sMoojKOuIY4EohtL
	5uoYgHTOT6SN8JSSbewB7Oh5sGOsCzeVU02sokQiREHoU2Mmmr2Pr1HZT3m6ePiaxtvTr6wXgSW
	qzg89qujUzfqKBDZvtxrUMIVjbfBxjysqNSx1RJlQL
X-Received: by 2002:a05:6102:26c2:b0:79a:61f3:2bc4 with SMTP id ada2fe7eead31-79b57cb33b0mr1942533137.5.1789417462235;
        Mon, 14 Sep 2026 13:24:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-982b9c9e787sm3375993241.5.2026.09.14.13.24.21
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:24:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4667f641a98so4100693fac.1
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 13:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789417461; x=1790022261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PdHc/PVNJgEKpmU97s5aFFCrW71lWLYc+Sp0PVMH3I=;
        b=OkMlmVxBDf6ujDO7831RpnCzvz4ocnitJ/JT1sCzf18S/H6QMJj2dMMnh/GVN4HAub
         gTTvmONnAb5EV7zXI8HCtLruWwjzBV/BWfkvxfFnb1slZ8O4TnqzWZnulvtFp0sg/C8g
         +qhcyxS/P/t0NRGAWOEJPZCBIBM6RbtJq9uqQ=
X-Forwarded-Encrypted: i=1; AKwUvBwmvDhi5Yta/IOn13HHaevgj7RUPwhlwom49RC2XmRmQNAxrvtAeqDDzyrVYGGlW5fXJfCgfcW/UheR5rE5XCA=@vger.kernel.org
X-Received: by 2002:a05:6820:1f0f:b0:6b1:b375:481 with SMTP id 006d021491bc7-6c53bf22621mr4454248eaf.0.1789417461193;
        Mon, 14 Sep 2026 13:24:21 -0700 (PDT)
X-Received: by 2002:a05:6820:1f0f:b0:6b1:b375:481 with SMTP id 006d021491bc7-6c53bf22621mr4454212eaf.0.1789417460636;
        Mon, 14 Sep 2026 13:24:20 -0700 (PDT)
Received: from lvn-dbc2489.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699bc6sm11623741fac.3.2026.09.14.13.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:24:19 -0700 (PDT)
From: Rishi Chhibber <rishi.chhibber@broadcom.com>
To: gregkh@linuxfoundation.org,
	arnd@arndb.de
Cc: bryan-bt.tan@broadcom.com,
	vishnu.dasa@broadcom.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	rdunlap@infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Rishi Chhibber <rishi.chhibber@broadcom.com>
Subject: [PATCH v3 4/4] selftests: misc: Add vmw_zerocopy selftest
Date: Mon, 14 Sep 2026 13:22:09 -0700
Message-ID: <bdd076790dccd495db77b1e932cf2f1236090df2.1789413109.git.rishi.chhibber@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1789413109.git.rishi.chhibber@broadcom.com>
References: <cover.1789413109.git.rishi.chhibber@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Summary of changes:
- Add tools/testing/selftests/drivers/misc/vmw_zerocopy: a
  kselftest_harness test covering the ioctl input-validation paths, plus
  its Makefile and config fragment
- Add the target to tools/testing/selftests/Makefile

Cover the input-validation paths of the vmw_zerocopy ioctl added earlier in
this series: an unknown ioctl number, a bad message pointer, an unknown
message type, a non-zero reserved word, neither buffer supplied,
zero-length and oversized data and metadata buffers, a wrapping
address+length, a wrapping PAGE_ALIGN() of the end address, an unmapped
buffer, and zero-length and oversized raw payloads.

These are all rejected before any datagram is sent, so they need no
hypervisor peer. Two further tests submit a well-formed message and assert
only that any failure is not a validation error, which holds whether or not
a peer is listening; they also check that repeated sends do not depend on
per-call setup surviving. The whole test therefore runs on any guest where
the module loads, and skips cleanly when /dev/vmw_zc is absent so it does
not fail on kernels built without CONFIG_VMW_ZC.

Signed-off-by: Rishi Chhibber <rishi.chhibber@broadcom.com>
Reviewed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Reviewed-by: Vishnu Dasa <vishnu.dasa@broadcom.com>
---
 tools/testing/selftests/Makefile              |   1 +
 .../drivers/misc/vmw_zerocopy/.gitignore      |   1 +
 .../drivers/misc/vmw_zerocopy/Makefile        |  20 ++
 .../drivers/misc/vmw_zerocopy/config          |   2 +
 .../misc/vmw_zerocopy/test_vmw_zerocopy.c     | 276 ++++++++++++++++++
 5 files changed, 300 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/.gitignore
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/Makefile
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/config
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/test_vmw_zerocopy.c

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 2d960626750e..325723e92bf3 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -20,6 +20,7 @@ TARGETS += devices/error_logs
 TARGETS += devices/probe
 TARGETS += dmabuf-heaps
 TARGETS += drivers/dma-buf
+TARGETS += drivers/misc/vmw_zerocopy
 TARGETS += drivers/ntsync
 TARGETS += drivers/s390x/uvdevice
 TARGETS += drivers/net
diff --git a/tools/testing/selftests/drivers/misc/vmw_zerocopy/.gitignore b/tools/testing/selftests/drivers/misc/vmw_zerocopy/.gitignore
new file mode 100644
index 000000000000..68941a8c0553
--- /dev/null
+++ b/tools/testing/selftests/drivers/misc/vmw_zerocopy/.gitignore
@@ -0,0 +1 @@
+test_vmw_zerocopy
diff --git a/tools/testing/selftests/drivers/misc/vmw_zerocopy/Makefile b/tools/testing/selftests/drivers/misc/vmw_zerocopy/Makefile
new file mode 100644
index 000000000000..195826f72f9c
--- /dev/null
+++ b/tools/testing/selftests/drivers/misc/vmw_zerocopy/Makefile
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+include ../../../../../build/Build.include
+
+UNAME_M := $(shell uname -m)
+
+ifeq ($(filter $(UNAME_M),x86_64 i686 i386),)
+nothing:
+.PHONY: all clean run_tests install
+.SILENT:
+else
+
+TEST_GEN_PROGS := test_vmw_zerocopy
+
+top_srcdir ?= ../../../../../..
+
+CFLAGS += -Wall -Werror $(KHDR_INCLUDES)
+
+include ../../../lib.mk
+
+endif
diff --git a/tools/testing/selftests/drivers/misc/vmw_zerocopy/config b/tools/testing/selftests/drivers/misc/vmw_zerocopy/config
new file mode 100644
index 000000000000..03e4a430c5ff
--- /dev/null
+++ b/tools/testing/selftests/drivers/misc/vmw_zerocopy/config
@@ -0,0 +1,2 @@
+CONFIG_VMWARE_VMCI=m
+CONFIG_VMW_ZC=m
diff --git a/tools/testing/selftests/drivers/misc/vmw_zerocopy/test_vmw_zerocopy.c b/tools/testing/selftests/drivers/misc/vmw_zerocopy/test_vmw_zerocopy.c
new file mode 100644
index 000000000000..af8035c4fa0f
--- /dev/null
+++ b/tools/testing/selftests/drivers/misc/vmw_zerocopy/test_vmw_zerocopy.c
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * selftest for the VMware zero-copy buffer sharing UAPI
+ *
+ * Copyright (c) 2026 Broadcom. All Rights Reserved. The term
+ * "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
+ *
+ * Every input check in the driver runs before the message reaches the
+ * transport, so all of the tests below are meaningful without a hypervisor
+ * peer listening: they assert that bad input is rejected with the documented
+ * errno. Tests that would require a live peer only assert "not one of the
+ * input-validation errnos", since the transport result depends on the host.
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <stdint.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <unistd.h>
+
+#include <linux/vmw_zerocopy.h>
+
+#include "../../../kselftest_harness.h"
+
+#define VMW_ZC_PATH	"/dev/" VMW_ZC_DEVICE_NAME
+
+/* Driver-private, but fixed by the UAPI's documented buffer limits. */
+#define VMW_ZC_TEST_MAX_BUFFER	65536
+
+FIXTURE(vmw_zc) {
+	int fd;
+	void *data;
+	void *metadata;
+	size_t page_size;
+};
+
+FIXTURE_SETUP(vmw_zc)
+{
+	self->page_size = (size_t)getpagesize();
+
+	self->fd = open(VMW_ZC_PATH, O_RDWR);
+	if (self->fd < 0)
+		SKIP(return, "cannot open %s: %s", VMW_ZC_PATH,
+		     strerror(errno));
+
+	self->data = mmap(NULL, self->page_size, PROT_READ | PROT_WRITE,
+			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, self->data);
+
+	self->metadata = mmap(NULL, self->page_size, PROT_READ | PROT_WRITE,
+			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, self->metadata);
+
+	memset(self->data, 0xa5, self->page_size);
+}
+
+FIXTURE_TEARDOWN(vmw_zc)
+{
+	if (self->data)
+		munmap(self->data, self->page_size);
+	if (self->metadata)
+		munmap(self->metadata, self->page_size);
+	if (self->fd >= 0)
+		close(self->fd);
+}
+
+/* An unknown ioctl number must be rejected, not silently accepted. */
+TEST_F(vmw_zc, unknown_ioctl)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	EXPECT_EQ(-1, ioctl(self->fd, _IOW(VMW_ZC_IOCTL_MAGIC, 0x7f,
+					   struct vmw_zc_guest_message), &msg));
+	EXPECT_EQ(ENOTTY, errno);
+}
+
+TEST_F(vmw_zc, bad_message_pointer)
+{
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, NULL));
+	EXPECT_EQ(EFAULT, errno);
+}
+
+TEST_F(vmw_zc, unknown_message_type)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = 0xffff;
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+/*
+ * The destination is owned by the kernel: @reserved is not an address and a
+ * caller that treats it as one (e.g. a binary built against the older header
+ * where this word was peer_id) must fail loudly rather than be misrouted.
+ */
+TEST_F(vmw_zc, reserved_must_be_zero)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+	msg.reserved = 1;
+	msg.u.data.buffer = (__u64)(uintptr_t)self->data;
+	msg.u.data.buffer_length = 64;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+TEST_F(vmw_zc, neither_buffer_nor_metadata)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+TEST_F(vmw_zc, zero_length_buffer)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+	msg.u.data.buffer = (__u64)(uintptr_t)self->data;
+	msg.u.data.buffer_length = 0;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+TEST_F(vmw_zc, oversized_buffer)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+	msg.u.data.buffer = (__u64)(uintptr_t)self->data;
+	msg.u.data.buffer_length = VMW_ZC_TEST_MAX_BUFFER + 1;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+TEST_F(vmw_zc, oversized_metadata)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+	msg.u.data.metadata = (__u64)(uintptr_t)self->metadata;
+	msg.u.data.metadata_length = VMW_ZC_TEST_MAX_BUFFER + 1;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+/*
+ * A near-top address must be rejected by the range check before any page-count
+ * arithmetic runs, whether it wraps on start + length or only on the
+ * subsequent page alignment.
+ */
+TEST_F(vmw_zc, address_length_overflow)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+	msg.u.data.buffer = ~(__u64)0 - 15;
+	msg.u.data.buffer_length = 4096;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EFAULT, errno);
+}
+
+/*
+ * The page-alignment-only wrap: start + length does not overflow, but rounding
+ * the end up to a page boundary would, which previously yielded nr_pages == 1.
+ */
+TEST_F(vmw_zc, address_page_align_overflow)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+	msg.u.data.buffer = ~(__u64)0 - 0x7ff;
+	msg.u.data.buffer_length = 0x800;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EFAULT, errno);
+}
+
+TEST_F(vmw_zc, unmapped_buffer)
+{
+	struct vmw_zc_guest_message msg = { };
+	void *gap;
+
+	gap = mmap(NULL, self->page_size, PROT_NONE,
+		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, gap);
+	ASSERT_EQ(0, munmap(gap, self->page_size));
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+	msg.u.data.buffer = (__u64)(uintptr_t)gap;
+	msg.u.data.buffer_length = 64;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EFAULT, errno);
+}
+
+TEST_F(vmw_zc, zero_length_raw)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_RAW;
+	msg.u.raw_buffer.raw_len = 0;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+TEST_F(vmw_zc, oversized_raw)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_RAW;
+	msg.u.raw_buffer.raw_len = VMW_ZC_MAX_RAW_BUFFER_LEN + 1;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+/*
+ * A well-formed send passes every input check, so it must not fail with one
+ * of the validation errnos. Whether it ultimately succeeds depends on a peer
+ * being present, which this test cannot assume.
+ */
+TEST_F(vmw_zc, well_formed_send_passes_validation)
+{
+	struct vmw_zc_guest_message msg = { };
+	int rc;
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+	msg.u.data.buffer = (__u64)(uintptr_t)self->data;
+	msg.u.data.buffer_length = 64;
+	msg.u.data.metadata = (__u64)(uintptr_t)self->metadata;
+	msg.u.data.metadata_length = 64;
+
+	rc = ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg);
+	if (rc < 0) {
+		EXPECT_NE(EINVAL, errno);
+		EXPECT_NE(EFAULT, errno);
+		EXPECT_NE(ENOTTY, errno);
+		TH_LOG("send returned %s; a hypervisor peer may not be present",
+		       strerror(errno));
+	}
+}
+
+/* Repeated sends must not depend on any per-call setup surviving. */
+TEST_F(vmw_zc, repeated_raw_sends)
+{
+	struct vmw_zc_guest_message msg = { };
+	int i;
+
+	msg.message_type = VMW_ZC_MSG_RAW;
+	msg.u.raw_buffer.raw_len = VMW_ZC_MAX_RAW_BUFFER_LEN;
+	memset(msg.u.raw_buffer.raw_buffer, 0x5a,
+	       sizeof(msg.u.raw_buffer.raw_buffer));
+
+	for (i = 0; i < 16; i++) {
+		if (ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg) < 0) {
+			EXPECT_NE(EINVAL, errno);
+			EXPECT_NE(ENOTTY, errno);
+		}
+	}
+}
+
+TEST_HARNESS_MAIN
-- 
2.52.0

