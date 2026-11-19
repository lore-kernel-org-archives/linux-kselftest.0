Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046526;
	b=hpQv038N3ykua5L5+vOHMHjC9B6qUQ893Tch5ADvZjRbh+emRSdjBla5mSRVdgY4+xKT
	 klb4I7Va5ssjaE+lmWkpjvD8Jpwf2mrrkGPKvifV5ey4NhqKkqzXmzLT5BmKVdCQebtPQ
	 iyZadtqf4MBhNDhxiM2lN564HsHTO86UcxL6aa8FratJXp6TMBl3zAEzRxkVwuLGvQllv
	 ATSKJqyn+OUE20SWfM5SLO8ec19cNFW6q5W2kN+K2OCJ0b1kIGvSQMRI8ZOj+PRz8ymq2
	 1LxYsQA7wmymk74PIcc8H9FmEMu2cqD/zvL4W2diVXUrYXHfi54SH9xPIcok1OCLqdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Kf/xUikSTcSaNla9drEguiRcgIHVSZVJsfZjqN52TlM=;
	b=p/q7cjrPZjk3xikvwiuIABWwEMYXZz0F2uT4m8e2iQEW3qpMX5aTT1zaSBWT/IunT4fs
	 Vt+fNugFA7XDBNedD48GWtXCS5KTsV81rlWgublc9X92nqq+2hnDKliwM1sEYmmV21n8r
	 vmHCYH1sRbAmQdJm3qMbRKxl3moAN+wjbvVhzdIy5cdgP7JyInWwFH8Ju0bNoML7IuGCz
	 G7lyN8TKDIYjB/QMOwEk9fxHxd1cUBfwc+JRNYqHMLDhiUYSA4jVW5ETF0SY03anfvnar
	 Lbv4LdlDyKY4sU+RGRXkfnJ5cGeZPryo7MkVof/LtY09wOc+4Y9pdRM47utfqRPfHvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VtBJYuvg;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0393460A262A
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 00:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0393460A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VtBJYuvg
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4eb0b989f0eso533851b6e.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 16:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795046525; x=1795651325; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kf/xUikSTcSaNla9drEguiRcgIHVSZVJsfZjqN52TlM=;
        b=VtBJYuvgE6DA9d3Trvx/CDub8htw+jY558C/tA57TBfxaym3OEt4DsJICNdZ/uVLf6
         mc8GBF3/065gwbz0TuxO1KVzcv1Q/RDXwyi2N7UQ0SPxhhwZDh0gnR1XB+MK6fwGq4z+
         2twqHMrB9fB9SKZy4PJXOY7OFSX+gDSqwizd8CkrTnlE2p6N9fb/NzGqIKi3nF2eaOtM
         WMQLuqVOM4uFXYKgdiZ7cS6D+If3wzvCvaG/iOaAWR+a58+XigEZXcI3cHGbvwgpJkmX
         hJq2QvYGnHdjy3h1fqkDRKX+NmFdvFOh4tn0jZA4GWbxMuOcqf2YLQBKiTLZhL1sWPQs
         wwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046525; x=1795651325;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kf/xUikSTcSaNla9drEguiRcgIHVSZVJsfZjqN52TlM=;
        b=pa7rLFs4ts8Dbxoi5rAy9k7gf4DHmnQw9EAnrCgL/FpAbSu+y6/4/hBzjB16Q18isl
         SrQOYY9mJugtNm714ve2cvxzA1I5/CX/aznT2Sqdq4fewPEaSqq7IHBhi8wE7BTJJvUJ
         sqm6uuqElz0g1eyWMfIS/0+i4SrPNNORcfZcsT0+MCQ9uOw4GG29zWAluS88Sy+acTo0
         WypnhP+ehWrkVL1bIhddn6aKJSrXOU0XPX4EL4438Ma7leK8gEVzNhMtsG/PQisuHI0R
         8KyOXXTGFhCMqXBj3r/MzXA9Z3F3Ili80s0duAeI+kxAJa2yMOea8te/ZLRKz9I3sbKX
         Zscg==
X-Forwarded-Encrypted: i=1; AL+hErHWRQN6tj1/lRm+mzMfwmrlaP0up2K95jfguszziPNMoRRo0pL3fXa/fbnPv9K+AbRvJPkddQa2PXUL35EMVmw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n/t4PLneEgMlLWD8VV1h0XPdDIQT+NO/oAtp9Ij7xArHowG1r
	Cpz9f6FrDH299Oksg7GPOn+eFXSujnLhf7wXIIwn4jwWyKpbPwPVLO2eGXDp+TY6X5iV0qHIVKD
	eXpnoVXGpzUMkmg==
X-Received: from ilbdz27-n1.prod.google.com ([2002:a05:6e02:441b:10b0:54b:28b4:c3d5])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2385:b0:4c2:e32c:1ee2 with SMTP id 5614622812f47-57907050044mr339534b6e.22.1795046524477;
 Wed, 18 Nov 2026 16:02:04 -0800 (PST)
Date: Thu, 19 Nov 2026 00:01:49 +0000
In-Reply-To: <20261119000151.442543-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119000151.442543-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119000151.442543-8-dmatlack@google.com>
Subject: [PATCH v2 7/8] vfio: selftests: Add helpers to print kernel warnings
 from /dev/kmsg
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Cc: Abhishek Sahu <abhsahu@nvidia.com>, Alex Williamson <alex@shazbot.org>, 
	David Matlack <dmatlack@google.com>, Raghavendra Rao Ananta <rananta@google.com>, Shuah Khan <shuah@kernel.org>, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Add kmsg_open() and kmsg_print_warnings() to the library. kmsg_open()
opens /dev/kmsg positioned after the last message in the kernel log, and
kmsg_print_warnings() prints any kernel messages at KERN_WARNING or
higher priority that have been logged since.

Bound how much kmsg_print_warnings() reads and prints, since other
processes (e.g. tests running in parallel) may log a large number of
messages, and note in the output when messages were lost because the
kernel log wrapped. If /dev/kmsg cannot be opened, kmsg_open() prints a
message saying that kernel warnings will not be printed, so that callers
do not each need to.

This will be used in a subsequent commit to print kernel warnings to
the test log when a test triggers one, so the failure can be debugged
from the test log.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../selftests/vfio/lib/include/libvfio.h      |   1 +
 .../selftests/vfio/lib/include/libvfio/kmsg.h |   8 ++
 tools/testing/selftests/vfio/lib/kmsg.c       | 134 ++++++++++++++++++
 tools/testing/selftests/vfio/lib/libvfio.mk   |   1 +
 4 files changed, 144 insertions(+)
 create mode 100644 tools/testing/selftests/vfio/lib/include/libvfio/kmsg.h
 create mode 100644 tools/testing/selftests/vfio/lib/kmsg.c

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio.h b/tools/testing/selftests/vfio/lib/include/libvfio.h
index 07862b470777..dca9a9af961e 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio.h
@@ -5,6 +5,7 @@
 #include <libvfio/assert.h>
 #include <libvfio/iommu.h>
 #include <libvfio/iova_allocator.h>
+#include <libvfio/kmsg.h>
 #include <libvfio/sysfs.h>
 #include <libvfio/vfio_pci_device.h>
 #include <libvfio/vfio_pci_driver.h>
diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/kmsg.h b/tools/testing/selftests/vfio/lib/include/libvfio/kmsg.h
new file mode 100644
index 000000000000..9b9e89129b8f
--- /dev/null
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/kmsg.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTESTS_VFIO_LIB_INCLUDE_LIBVFIO_KMSG_H
+#define SELFTESTS_VFIO_LIB_INCLUDE_LIBVFIO_KMSG_H
+
+int kmsg_open(void);
+void kmsg_print_warnings(int fd);
+
+#endif /* SELFTESTS_VFIO_LIB_INCLUDE_LIBVFIO_KMSG_H */
diff --git a/tools/testing/selftests/vfio/lib/kmsg.c b/tools/testing/selftests/vfio/lib/kmsg.c
new file mode 100644
index 000000000000..a25770d2247a
--- /dev/null
+++ b/tools/testing/selftests/vfio/lib/kmsg.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <errno.h>
+#include <fcntl.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+#include <syslog.h>
+#include <unistd.h>
+
+#include <libvfio.h>
+
+/* Large enough to hold any single /dev/kmsg record. */
+#define KMSG_RECORD_MAX 8192
+
+/* Limit how much is printed if the kernel logs a flood of warnings. */
+#define KMSG_PRINT_MAX 512
+
+/*
+ * Limit how many records are read, so that this terminates even if other
+ * processes are logging messages faster than they can be read.
+ */
+#define KMSG_READ_MAX 65536
+
+/**
+ * kmsg_open() - Open /dev/kmsg to read kernel messages logged from now on
+ *
+ * Open /dev/kmsg positioned after the last message currently in the kernel
+ * log, so that kmsg_print_warnings() only prints messages logged after this
+ * call. If /dev/kmsg cannot be opened, e.g. because the caller is not allowed
+ * to read the kernel log, print a message saying that kernel warnings will not
+ * be printed.
+ *
+ * Return: A file descriptor on success, or a negative errno on failure.
+ */
+int kmsg_open(void)
+{
+	int fd, ret;
+
+	fd = open("/dev/kmsg", O_RDONLY | O_NONBLOCK | O_CLOEXEC);
+	if (fd < 0) {
+		ret = -errno;
+		goto out_err;
+	}
+
+	if (lseek(fd, 0, SEEK_END) < 0) {
+		ret = -errno;
+		close(fd);
+		goto out_err;
+	}
+
+	return fd;
+
+out_err:
+	fprintf(stderr,
+		"# kmsg: Failed to open /dev/kmsg (%s), kernel warnings will not be printed\n",
+		strerror(-ret));
+	return ret;
+}
+
+/**
+ * kmsg_print_warnings() - Print kernel warnings logged since kmsg_open()
+ * @fd: File descriptor returned by kmsg_open().
+ *
+ * Print all kernel messages at KERN_WARNING or higher priority that have been
+ * logged since kmsg_open() (or since the last call to this function), e.g. to
+ * provide context for a test failure caused by a kernel warning.
+ *
+ * Messages may be missing if the kernel log wrapped since they were logged,
+ * and output is limited if the kernel logged a large number of messages. A
+ * note is printed in either case.
+ */
+void kmsg_print_warnings(int fd)
+{
+	char buf[KMSG_RECORD_MAX];
+	bool truncated = true;
+	bool lost = false;
+	int printed = 0;
+	int omitted = 0;
+	int i;
+
+	for (i = 0; i < KMSG_READ_MAX; i++) {
+		char *text, *end;
+		ssize_t len;
+		int prio;
+
+		len = read(fd, buf, sizeof(buf) - 1);
+		if (len < 0 && errno == EPIPE) {
+			/* Messages were overwritten before being read. */
+			lost = true;
+			continue;
+		}
+
+		/* Stop at EAGAIN (no more messages) or on any other error. */
+		if (len <= 0) {
+			truncated = false;
+			break;
+		}
+
+		buf[len] = '\0';
+
+		/*
+		 * Each record is "<prio>,<seq>,<ts>,<flags>;<message>\n",
+		 * optionally followed by " KEY=VALUE\n" lines. See
+		 * Documentation/ABI/testing/dev-kmsg.
+		 */
+		text = strchr(buf, ';');
+		if (!text || sscanf(buf, "%d,", &prio) != 1)
+			continue;
+
+		text++;
+		end = strchr(text, '\n');
+		if (end)
+			*end = '\0';
+
+		if (LOG_FAC(prio) != LOG_FAC(LOG_KERN) || LOG_PRI(prio) > LOG_WARNING)
+			continue;
+
+		if (printed < KMSG_PRINT_MAX) {
+			fprintf(stderr, "# kmsg: %s\n", text);
+			printed++;
+		} else {
+			omitted++;
+		}
+	}
+
+	if (omitted)
+		fprintf(stderr, "# kmsg: (%d more messages omitted)\n", omitted);
+
+	if (lost)
+		fprintf(stderr, "# kmsg: (some messages were lost, see the kernel log)\n");
+
+	if (truncated)
+		fprintf(stderr, "# kmsg: (stopped reading, see the kernel log)\n");
+}
diff --git a/tools/testing/selftests/vfio/lib/libvfio.mk b/tools/testing/selftests/vfio/lib/libvfio.mk
index eff95828719e..f8af0c14c3d0 100644
--- a/tools/testing/selftests/vfio/lib/libvfio.mk
+++ b/tools/testing/selftests/vfio/lib/libvfio.mk
@@ -5,6 +5,7 @@ LIBVFIO_SRCDIR := $(selfdir)/vfio/lib
 
 LIBVFIO_C := iommu.c
 LIBVFIO_C += iova_allocator.c
+LIBVFIO_C += kmsg.c
 LIBVFIO_C += libvfio.c
 LIBVFIO_C += sysfs.c
 LIBVFIO_C += vfio_pci_device.c
-- 
2.56.1.708.g77570a6a1d-goog

