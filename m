Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663D94349AC
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468189; cv=none; b=aUpBX3PpXFgtR5zgzdtWZ5XWNXxzmx0vC0EN0Fm30B1h6I9KRA+NVN3hcHXvEY2ziVqAMM3QUoA0KbvUnaKsp9VfiWuhDxKy+ockvEZ6wZW15vhTkmUKPWGsAfhesiUwATYvZN8BkFUvO5f83V1SYSM2TkhRdjOaitPneFROjXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468189; c=relaxed/simple;
	bh=TduKdUdvpYsx+vKoLKDJFnx+p27z0gNvFZRpqUeStXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gAKy6tXvqZyzTkI6iA+K9cha799ItyvBRTh4Ii5sUyeoj1Z2qii4IcOTpO5KGBX3MuSlxXLXsxSiJkxI64/7oX4d/xWLdqSxL0Xqe8AT4Le1DdjtJ1riXwB89lSf+7ErQZiKyzDi4x60N+nVy+m0z2JtPMNQmrwTXkE0Sdqy4S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgA+Nroi; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgA+Nroi"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1517bda04a0so1883186c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791468187; x=1792072987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7aqRldBbUb2LjnnslvdppdHBI9edzN43tyUFwloD4yA=;
        b=ZgA+NroivYLmwYCmihSkftwc+M9q9j5DC5gsVNeg0DpNXdiVN9DR42O2+aA0VH/imt
         T/xqkZCKnde2JPQtOjfXzvXB2b7R2c9CiJPls9zxJ3mlPQOjXDUsoDbPTr0m0duBuRUW
         I2hKOghtbmeCpvXZCpMvu4O+NOROV9z/J13Jx7cC7T4QLRF1PgEr/LkpW50Ebxy2lwt5
         BiMq1GII/+fpP52XRLZ55jQOzJPpRA2wCrpxLn8KPx444YDTjZc4/swFwi8NVZwhHVW/
         e32yzXZs1G6UKLxwDV6zsqK0YdJBNx2GR4kdunR9Vxy2meXheyIlLjuJaSWQy4jqODow
         rbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791468187; x=1792072987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7aqRldBbUb2LjnnslvdppdHBI9edzN43tyUFwloD4yA=;
        b=Go5uhJUp6GxPfNNRnlw5OTojKRcpm+yqx9pK9dulvhU1gtamTnu2QR4SMkjSjL8zE4
         aBODDwQsUwj7BQno44LaS+2fGw3y6jGgUPWrH8F18ChjIHvIm23BINxTnVMXXJVgC886
         irv1zbZRPKKkzi5sddPkXb15PjiMAiYl1ZukmI2ud7xkAAyWkTOjbDH8NjlpVWKSNHVz
         hrAjHjDvLaEG4WyWzYMwvaTx7LbI0UDCyOl+NMEELhTV3mh4sQtq1T6ZwGGQt8ZtDK8U
         s35tyx6kQtAlpyUtILVSJNwn7L1LtQI1WNtIjdRsstNhG0Q4ySWXHEusNWwNto+wxPWt
         clHg==
X-Forwarded-Encrypted: i=1; AKwUvBwRvv8z76f81ER8FXqloP/S1OtWrfR/bNtQhNOtaoulkKkBeG32doeGRvOog/WkPy6PFP6ZYbdtMcjPshoa3RQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lVJTcpLCsEx6gFbCISn/qiBY1esvPaU8iPGxka3UdRODBhCE2u
	gLxZoYcXT8lLGQ0x2kYEn26Ku2bei5Et15qwXfTwVM+T41knB5yyn0rm
X-Gm-Gg: AYBFou2WsEY3sqS+laUz0BbEA/LmTR4W8Wdw1mkrDO+rGqArlHH4TwWeRBpPTUARTFN
	eRz9p4gSQ8xOyx6wOgsSVVqDZIXzgfVv9lpc9rKphW+PZBBvGOt/VXGXc0GbHgq5bIt3NIJ3Rfd
	sfgQ07vj81jaSLo7VHMJDT3NCfvOMQ/dVtu17CPtk0pTrnSjCOCPT0rHh1B+1bEzkVIrXM//Vof
	RFJHDGJueTupnmJZMBnZ/xUJq0Uqnng9bLURZAfOmH0wktxAF0MkP7DDkw/rE0kO7q0tIPcJ8V7
	uPkXtuum83YMPBuPT/La0uNL+MoodmCaE/4DRqoXU3R6a9Ec0V5q46hET5Fyokq3hL5O06YRWQ2
	5y2x2uE5KPZboVLD/yTRLj5j3OQcjnOdJf+tGTQkDBjiJVNIoCt3pKB0uCK59i0NGctmJpn1WMs
	6/vSQTHQCFksextWeuVqd2c6v0OaDzs9HhQ1BwuotqcUhSTMh10LZzbq2QZDZmB9m/axZ5mT+6X
	XBd
X-Received: by 2002:a05:701b:2514:b0:14a:5284:1bf5 with SMTP id a92af1059eb24-162043c7da1mr7015027c88.13.1791468186684;
        Thu, 08 Oct 2026 07:03:06 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1616aa55195sm15973494c88.19.2026.10.08.07.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:03:06 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 08 Oct 2026 22:02:49 +0800
Subject: [PATCH bpf-next 1/2] selftests/bpf: Unmount the bpffs that
 cgroup_hierarchical_stats mounted
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-selftests-bpf-cgroup-stats-bpffs-v1-1-76b9a6d1be34@gmail.com>
References: <20261008-selftests-bpf-cgroup-stats-bpffs-v1-0-76b9a6d1be34@gmail.com>
In-Reply-To: <20261008-selftests-bpf-cgroup-stats-bpffs-v1-0-76b9a6d1be34@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Yosry Ahmed <yosry@kernel.org>, Hao Luo <haoluo@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

setup_bpffs() mounts a bpffs on /sys/fs/bpf and records in mounted_bpffs
whether it did, so that cleanup_bpffs() unmounts only a bpffs that the
test mounted itself.

cleanup_bpffs() checks the flag the other way around. As mounting on
/sys/fs/bpf succeeds even when a bpffs is already there, the test never
unmounts the bpffs it mounted, and every run leaves another one stacked
on /sys/fs/bpf.

Unmount the bpffs only when setup_bpffs() mounted it.

Fixes: 88886309d2e8 ("selftests/bpf: add a selftest for cgroup hierarchical stats collection")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c b/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
index 3bd27d2ea668c..a93b16ed629e9 100644
--- a/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
+++ b/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
@@ -110,7 +110,7 @@ static void cleanup_bpffs(void)
 	ASSERT_OK(rmdir(BPFFS_ATTACH_COUNTERS), "rmdir "BPFFS_ATTACH_COUNTERS);
 
 	/* Unmount bpffs, if it wasn't already mounted when we started */
-	if (mounted_bpffs)
+	if (!mounted_bpffs)
 		return;
 
 	ASSERT_OK(umount(BPFFS_ROOT), "unmount bpffs");

-- 
2.43.0

