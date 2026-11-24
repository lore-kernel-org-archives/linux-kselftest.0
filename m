Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530289;
	b=vm2Wm/rvQ1ltNxOwMJ7ZJ8KBTAIRr/abVQe9994YUNtpvDlj5NjnuQHI66+ZHkNj6oTw
	 3eDd4QqX3cTVY9lJdIOWHAG3DJ7O/EvUxBq5beMqATG2opQ0FzGRT/tbfHND9ZTLLmTtb
	 qjsgOUYUaKML6ZhTSDRX9FhsBgDxVQhG0uu0oyh7aH+lU3CLld5gJGj1wE3xY0SBapH88
	 LUpI2mbaeoyeEZYCuTY2cYxcFF3mPmFyfCIry+ZP35OmeognwpuyH5YS+tAbvzphcuOUY
	 Gopys7tfzWBFvbpVTJNiiZnP1Z6tsrN3X3ZwC767WTUJnbEh8YfIx+JF0EHJVE8xz5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KXE7cnFOP3ln9NR3eVHLPVzp6B5Ml9Wh1PqMmVWUxaw=;
	b=S+b4mUk9gFYUavxdGXGMGSLKtmS8AmAsYu95yPN5k9vzk7nadanPAjS46oDT5yl2elLl
	 7gKILqBpiSlX+OxeYpbcCjSbbE3w7aMdXCWf6UeT9t+PJbfjat2oPDe3P3siG1jcGI/Q3
	 vRMLN9N4DDJT2k8hboX2GZvA3/qW6pDWi+LBIllilHrsETsR6Jql/XrFlg8s74qOVCxm2
	 +iEc66FgJMPJDU3uNo+GKBVg8P1VnbOBhRINPczshUeZG7bltwov4u/erjVNLB+eS43ds
	 wY9a/y5Y5QIWFYUWOc+ha6PI+04zYJ+JLp+SNVXvb/13BmXMnth3UNh11iGblw7qHrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=NsYXFd4w;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726FA606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 14:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 726FA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=NsYXFd4w
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4dbdc9592so12192597b3.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 06:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795530287; x=1796135087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXE7cnFOP3ln9NR3eVHLPVzp6B5Ml9Wh1PqMmVWUxaw=;
        b=NsYXFd4w1jowqyHVsz+D0NKs5uG9b1AQQZIL27miMJkZX02Uf1ioJfz7iPtRa/QXYo
         iEp036fziKdqn6D6sDQoIZDiJf1sK4CCgmX0UbSUf8l6piP0WhralLuFU6k6GbkIUKtc
         cXlnorAM40+68QjcAh8y9dBdrqMh9gWhSLMmzx5Yf8VMWSr4sTDjwsWD2hqfSx8KUShq
         4LcbcbtuYjTYQL37uNkXyn3YbVBzY0mujKvoq6WL0vm9Klm2i9H4KYihKsm+3PQncqap
         niZVh5pe8g/LRphMUZK3W4xR9a5pioVJJCTSbCPI6zCsbYv+RGIT1A02s5AnoCEAgpBj
         xPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530287; x=1796135087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXE7cnFOP3ln9NR3eVHLPVzp6B5Ml9Wh1PqMmVWUxaw=;
        b=YE+kgZh8lHGTqjXxvDGWh5mC3hQ1AewJqEAs501lQ8e5gmoefkXVJGxEoSyZlImzQD
         PShTy91N5SQ4rII0T3pdio0uPfp22Z5IcM3nv/U8seKPvQkHGrkI3GfOokq7QP7pa0B6
         cRafBCqeJtvGPj6jcDXE9xPo+7Loy1whTjuVEdDr41h90qVMhejXcfX8DEs8FHH1uC0Y
         MJCwus+C5XUWct7Qdmwj0ErNikblEBT1W9fph22ab9LL7GjGaU8SM2kOMSWBbZdqeAtS
         jwwXI3BtIMUhlXbJPu3VODti1JCIxl1h/ALhhp2VUUN5G/JwZxjeZDstD+0R00d7W0Cs
         Bn2A==
X-Forwarded-Encrypted: i=1; AL+hErH5VP0cuUzbZR9M/IwtpgfXpQytxi+DkwGZ7P8L7tMW10+HqgZN4rZm7VwMyPIbD6bl3MGuGNruO/GRttHm0i4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xseqEU4+eRn26svGR6PkIb75BwMHXx9jf1uCL70B9wq5yRQYF
	d84HdlRoyKpzcBM52TSAdxRc8zLR8bV0/ErPm5JsDmFucP02ePW7xACAMA8Mo4/5s4U49WbRZcc
	r70JU1V4=
X-Gm-Gg: AZFdTZe3wMBIt+MlafVTmZX4aUGHVFZy8lK+2zhviDg0HOdlguwCyeDfpV3f2gQcBSQ
	kkzFGHGQa4n9CLVECXXptNFbiatpr7zpDmq+WCGzxECwixIgoxjJt7W474ItGBYvsqOVgTK/Xzj
	qO7eu7KNIJh7IHWw+OVy8N1NQpBCHOq4vHf8U0ZfbMXLHw4ecYyh3H5i/kX5ai3qrQyj5za3Eep
	ZPhl0W4NgljlxIyBQYpAa81qDDF4ZwDbGtfYn7ydP0QsNL9+iQrnCv5MmQBZkFx7jBIn5g4fyfE
	Kqcc5BaEMTYFYnYmp+QRmgYpfBzW4uEbX4goPA94kJ9yGAJvRRu82c+3IOF+LOgFh4YJAPLnCIa
	k3TKo47AvyvOVDx3PdIYySCw3UxYBFVYLz+Gz/CSnMbyA/AoKUQEsiMccLxCdj4wFw6b7CFZ9cO
	OZyInANRxx9ON9++pNvTpgOYsld7qpvJXJabcEb01V8Gvlw0mjYw2/ANJL2dO+ygcYHcfgcmI86
	eEg2hDazmjHcT3hQW9ew0PUplueu/62st/nspOvRfer1hektqQXKvncSvMDULCMjPDKpa6MLxpG
	fDuSRbDGLnyHRi6gEAQ4Tx1Egiaqx1m3F/hZgg==
X-Received: by 2002:a05:690c:4d47:b0:8b3:22c:b420 with SMTP id 00721157ae682-8b520329516mr63869277b3.5.1795530287265;
        Tue, 24 Nov 2026 06:24:47 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52033c2d4sm58062957b3.36.2026.11.24.06.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:24:46 -0800 (PST)
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
Subject: [PATCH v3 2/2] selftests: tpm2: test that io_uring reads are rejected
Date: Tue, 24 Nov 2026 21:24:32 +0700
Message-ID: <20261124142432.368943-3-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261124142432.368943-1-rmustafin@cloudlinux.com>
References: <20261124142432.368943-1-rmustafin@cloudlinux.com>
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

Test that IORING_OP_READ on /dev/tpm0 and /dev/tpmrm0 fails with -EIO and
that the following read() returns the whole response. The test needs
liburing-ffi (liburing 2.4+) and is skipped without it.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Rustam Mustafin <rmustafin@cloudlinux.com>
---
 tools/testing/selftests/tpm2/Makefile      |  2 +-
 tools/testing/selftests/tpm2/test_uring.sh | 15 +++++
 tools/testing/selftests/tpm2/tpm2_tests.py | 72 ++++++++++++++++++++++
 3 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/tpm2/test_uring.sh

diff --git a/tools/testing/selftests/tpm2/Makefile b/tools/testing/selftests/tpm2/Makefile
index a9bf9459fb25..44630fb980fa 100644
--- a/tools/testing/selftests/tpm2/Makefile
+++ b/tools/testing/selftests/tpm2/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
 include ../lib.mk
 
-TEST_PROGS := test_smoke.sh test_space.sh test_async.sh
+TEST_PROGS := test_smoke.sh test_space.sh test_async.sh test_uring.sh
 TEST_PROGS_EXTENDED := tpm2.py tpm2_tests.py
diff --git a/tools/testing/selftests/tpm2/test_uring.sh b/tools/testing/selftests/tpm2/test_uring.sh
new file mode 100755
index 000000000000..516985ef20af
--- /dev/null
+++ b/tools/testing/selftests/tpm2/test_uring.sh
@@ -0,0 +1,15 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
+[ -e /dev/tpm0 ] || exit $ksft_skip
+[ -e /dev/tpmrm0 ] || exit $ksft_skip
+read tpm_version < /sys/class/tpm/tpm0/tpm_version_major
+[ "$tpm_version" = 2 ] || exit $ksft_skip
+
+python3 -c 'import sys, tpm2_tests
+sys.exit(not tpm2_tests.uring_available())' || exit $ksft_skip
+
+python3 -m unittest -v tpm2_tests.UringTest 2>&1
diff --git a/tools/testing/selftests/tpm2/tpm2_tests.py b/tools/testing/selftests/tpm2/tpm2_tests.py
index ffe98b5c8d22..6fe60e00ff06 100644
--- a/tools/testing/selftests/tpm2/tpm2_tests.py
+++ b/tools/testing/selftests/tpm2/tpm2_tests.py
@@ -9,6 +9,7 @@ from tpm2 import ProtocolError
 import unittest
 import logging
 import struct
+import errno
 
 class SmokeTest(unittest.TestCase):
     def setUp(self):
@@ -331,3 +332,74 @@ class AsyncTest(unittest.TestCase):
 
         self.assertEqual(rc, 22)
         async_client.close()
+
+def uring_available():
+    import ctypes.util
+
+    name = ctypes.util.find_library('uring-ffi')
+    if not name:
+        return False
+    lib = ctypes.CDLL(name)
+    ring = ctypes.create_string_buffer(1024)
+    if lib.io_uring_queue_init(1, ring, 0) < 0:
+        return False
+    lib.io_uring_queue_exit(ring)
+    return True
+
+def uring_read(fd, size):
+    import ctypes.util
+
+    lib = ctypes.CDLL(ctypes.util.find_library('uring-ffi'))
+    lib.io_uring_get_sqe.restype = ctypes.c_void_p
+    lib.io_uring_prep_read.argtypes = [ctypes.c_void_p, ctypes.c_int,
+                                       ctypes.c_void_p, ctypes.c_uint,
+                                       ctypes.c_uint64]
+    ring = ctypes.create_string_buffer(1024)
+    ret = lib.io_uring_queue_init(1, ring, 0)
+    if ret < 0:
+        raise OSError(-ret, 'io_uring_queue_init')
+    try:
+        buf = ctypes.create_string_buffer(size)
+        lib.io_uring_prep_read(lib.io_uring_get_sqe(ring), fd, buf, size, 0)
+        ret = lib.io_uring_submit(ring)
+        if ret < 0:
+            raise OSError(-ret, 'io_uring_submit')
+        cqe = ctypes.c_void_p()
+        ret = lib.io_uring_wait_cqe(ring, ctypes.byref(cqe))
+        if ret < 0:
+            raise OSError(-ret, 'io_uring_wait_cqe')
+        # cqe->res follows the 64-bit user_data
+        res = ctypes.c_int.from_address(cqe.value + 8).value
+    finally:
+        lib.io_uring_queue_exit(ring)
+
+    return res
+
+class UringTest(unittest.TestCase):
+    def read_response(self, flags):
+        client = tpm2.Client(flags)
+        fmt = '>HII III'
+        cmd = struct.pack(fmt,
+                          tpm2.TPM2_ST_NO_SESSIONS,
+                          struct.calcsize(fmt),
+                          tpm2.TPM2_CC_GET_CAPABILITY,
+                          tpm2.TPM2_CAP_TPM_PROPERTIES,
+                          tpm2.TPM2_PT_FIXED, 1)
+        try:
+            client.tpm.write(cmd)
+            res = uring_read(client.tpm.fileno(), 4096)
+            # The rejected read must leave the whole response in place
+            rsp = client.tpm.read(4096)
+        finally:
+            client.close()
+
+        self.assertEqual(res, -errno.EIO)
+        sz, rc = struct.unpack('>II', rsp[2:10])
+        self.assertEqual(sz, len(rsp))
+        self.assertEqual(rc, 0)
+
+    def test_read_tpm(self):
+        self.read_response(0)
+
+    def test_read_tpmrm(self):
+        self.read_response(tpm2.Client.FLAG_SPACE)
-- 
2.52.0

