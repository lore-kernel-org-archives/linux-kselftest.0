Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282458;
	b=2hIT8Xin73KJy/smLinpd1J1AQmHhE8nGqJ21H+7fj+4OVPgI8tagISOlq83ZxXEFxdz
	 uxbbGsDidHLHIvfHv6l5QsMKSG/Qv7LHn3e+AoqHcsiikh9kqc4+s+YPI8LeWmUxaZjQ4
	 2oQLgoK9+EZ16Tlvn3tLZWg9s2qCnI3M+8af4qblBYou5Jbtin+13IHPt5CeVzmEdauII
	 s+ltbM+eiWXzOx4U+9VrUlZR+OK1Jc5FV4KsC2kjdi1DuxFulPQNz5j+aeoKWXGj+ukx4
	 Nb6qElBC8Nsl9WkwhU6eEzjBu8HIqnXKaVp8ZuBCry8au8HxMMEkkGG0ECvXgcmYSHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282458;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=YCDhUrSgjNdk/K5jPzg/ggXsYFm6g39g9OKWkp0qG5E=;
	b=h++jSsNdUm/JmGNYqsb61lrdjpE8xAV6hrvdSIiDWCeEejJ/Hb3+xAwdw71j+pmUlXMy
	 Tq3217lbYMFgRHQ+Ui2O9m64GF4YbxFeql2BQcVAJLa9gAPc+qYBcuVTz8xvmDxYZHG4D
	 dKw8F4eLS8TChAFCSK1Pbe5HQSW5v4fgtJmBzJNwm1wep9PM8zXNE0SmsRqihjGfOQA9O
	 6KRv0oVrdrOzYhVBOkg5sK1Kj0m6joW0awWrfU3wZ2Geq4bj3TJhOusBJc/RnW9cUThr0
	 jw/N2TxMwBicO+QgGv7nS5FuQD+WsI/KZw/BryHfyawHO81uMMk1kfLFYncPTD594Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XjvHn+1U;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249FE606A31C;
	Thu, 29 Oct 2026 14:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 249FE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XjvHn+1U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=YC
	DhUrSgjNdk/K5jPzg/ggXsYFm6g39g9OKWkp0qG5E=; b=XjvHn+1UGXYQZ9c77T
	jFr9YjX6/IJZIJTZr7O8J5G+VOidnJIdo10kDEFINpfPHTQEuiQ8CYDiBwvMVS5j
	aQSGToubgr74bC5en/2KIEZAyc1cr9J8ZCF5EFmmt1ae1Pfvp9av/dt80mpopyM3
	GzZwwOYBDRaQjVyp2P9dC8fsk=
Received: from iZbp142fio164970eurit1Z.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgA3faSKUeNqOAYoCw--.33705S2;
	Thu, 29 Oct 2026 22:00:42 +0800 (CST)
From: linfordWu <linfordwu@163.com>
To: brauner@kernel.org,
	shuah@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linfordWu <linfordwu@163.com>
Subject: [PATCH] selftests/pidfd: skip setns tests without namespace ioctls
Date: Thu, 29 Oct 2026 22:00:42 +0800
Message-ID: <20261029140042.1788909-1-linfordwu@163.com>
X-Mailer: git-send-email 2.43.0
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
X-CM-TRANSID:QCgvCgA3faSKUeNqOAYoCw--.33705S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr1UZw4fAr18Wry3KrW5Awb_yoWkurcEk3
	9Fqrs7CFWDuF10kr97GF15urWrCw4xGr1rtFyYqFy3Gryqva15WFykCrZrW3y7WrZ0q39F
	gF1DCrW3KF17XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRGg4fJUUUUU==
X-CM-SenderInfo: xolqw0pugz3qqrwthudrp/xtbCzwoKqWrjUYpePwAA3V

Kernels without the pidfd namespace ioctls return ENOTTY. The
current_nsset fixture expects only EOPNOTSUPP and reports a failure for
every namespace before running the tests.

Skip the fixture when ENOTTY is returned so unsupported kernels report
skipped tests instead of failures.

Signed-off-by: linfordWu <linfordwu@163.com>
---
 tools/testing/selftests/pidfd/pidfd_setns_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/pidfd/pidfd_setns_test.c b/tools/testing/selftests/pidfd/pidfd_setns_test.c
index 107edecff..8856e3e19 100644
--- a/tools/testing/selftests/pidfd/pidfd_setns_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_setns_test.c
@@ -126,6 +126,9 @@ FIXTURE_SETUP(current_nsset)
 
 		self->child_pidfd_derived_nsfds[i] = ioctl(self->pidfd, info->pidfd_ioctl, 0);
 		if (self->child_pidfd_derived_nsfds[i] < 0) {
+			if (errno == ENOTTY)
+				SKIP(return,
+				     "Kernel does not support deriving namespaces from pidfds");
 			EXPECT_EQ(errno, EOPNOTSUPP) {
 				TH_LOG("%m - Failed to derive %s namespace from pidfd of process %d",
 				       info->name, self->pid);
-- 
2.43.0

