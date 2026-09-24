Received: from sonic.asd.mail.yahoo.com (sonic-asso1-0020.asd.mail.yahoo.com [34.2.90.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA70340D59C
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 06:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.90.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232001; cv=none; b=UjqdjQ0izEc5T2MzG4QFjc0ODVH/0p46LRKGNQTUKJNV3H55HYzXmTl6m2YWuNvJWJYTM07jz+KQ4jjc3adhbl31bne3OWTQvLVFfB9mkmVNePPO7E47OV5RStCQnHeJuQ9d4WRmm5ndeF5a1RM6FsgzQFT4D19GuOQRloO/I8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232001; c=relaxed/simple;
	bh=BV6ntKCgPEDBPJWg1l2Tb/q3x1uXnDF8L6mG6UGGif4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GWPqZFpHAaifOSUBbqwuL+iBBYQ7nBEwXVwJNEiB274ZaG/1W23bxsZ+FTzPmst5YwokK2Aqyq7FRbCo8PcNK6HAX9BS8THyE1qqwYuCSlqPEwO8KXPjX2qoX6TNElTnsk3rtWhsiNXwZ+CbFEwAV7IjhmZhOFubiygTJ/iyP6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=naedlbaf; arc=none smtp.client-ip=34.2.90.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="naedlbaf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1790231994; bh=e0mGbRF2a4OYxhtFZvdN8u65U1BtK0P4d4zAse+pdDg=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=naedlbafP/uFgpaYPUXdV41/UllNRGYDUVwrXkR7fUeJcCoTh2zg0lsxuljgEEeICD4/xkMVSl7nB/OtS230b0H08yumjTTkeqVWsq6j/9wUgZBaqH96EPWVsh4YF5yWOpdXWakvH/FyLdXzXfqEkbt18X6tdWrdKMCAmSTMWshbAUoSPcCeWmYWEoR+kqXA4+NrQMyzIdg/NXpsvcQUA61UJ+Mj0ItgtAGJwCZKjjSOYvSPcpVIBfX1Q86wLYMDjEJEmaWLI/3JHb+ki1qW7HNlRL9MySM/wWVLZ08cwgaKQR47/bbu6uGkO8OEaTatJwX0IbHo+p1imwIWv3dgag==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1790231994; bh=dkUWKong0L1us7CIHl67+nbOpb3eT5R5Q0NjOpUK0KQ=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=f3hRKGovASsti0eSqHcX5TFaT2DRKUMEsevZZDyHc5/CcIM+QeIjQFLQRhXgsP/eEkATnEzWSs23G6AOtCeTnu156jyAQPUoziy2J7uWyXkbgedYk4bwQDpiJGp1XIDYtQJWwoVeXbI2r4UgJ+8htHxGktxHw1zjoVE3P1dyWEg9uasLE4HReGBgSN1lz1bY5xj6LWSgo4554HtST3E57APtbTxSZd+nlpf0LAZh1TZlAuDZRd4i1R3iEJJGqjS4g4fLkIze682qt3TPfS4xdzgXDlGapLrKlXp0I3MpSKC8sq0bQOAmM2QoVvXTfcN6Yqxf1JqWByQs8vf9S+Ob0w==
X-YMail-OSG: TPVN8SkVM1m.5fLdmQrRMnTvbQVtigcssV_l2og0sOF8HEaMRLT0clDSX7SxQ49
 BdNDzJi6ib28BL_ewPZoOs9SjbrrK.5KyPnPL5_sORIX_i_u9zq3xsSDmz7qTguOCr0aaWdxIyEH
 GtjDyPmgaekWgPODDNzjmR8pB56ZkfEBJjGnj9d4BYgtUl0LSr0TUN9D7hn9lNh_XnzP8.EVmLRn
 OlEGAYB1LX6mbSsmPROF0JQmkICWc3EZsnlHiFcsODxE0mn8MH2IZlDNGCu2oPiWDU.VWNpl5CtA
 .etl5Of_Z5u1H2ca66xdhBvIcl3Fod3ukI6gaWLak9673Da0I1ekA.P6hDvOV5_e3wvE8u7aNsB_
 9BLMGkaoptuS74Ird0nvTzZa08CwRk6BRgDO0AmwSXxLgg5_gjspYRzBB.juU1LM4GX7hcpVXcTj
 tzp4yepsVUl4lY2nmcucqzhtyTGGEcHkd.byWOf_0qOjKUAl54Z5T5kAKEWbhrPCEj1JcJ2..3_t
 Qg8wAuLwgNyS3t4Q_QLv5OPI729KDm.jsuUyqci2OZQssQC719plevUk7pfTEJuGu3N2w4nWzauF
 ZleBav7VATXkfwd7G7KlckLd8xwFvDMqTjRxvL2jV8V8y0WoGrOgQRa3PfhixGy9tUyOZQOjbC2V
 3hnXkcMhE2dKZdVz4_X9MrrTAK7Gn9YVlubQrAsRddjpi_1E3t3TdSurLqhb53NovLsU1SqEYaer
 mC6I02MwkG8OP.rullJDmlfQf68nijoo4QJhtsBHEBrDL_oIK2bOIm1sPdkvlZczYNKHpohN6fkK
 k2H4Tv9zof2YcXEkSqt70o059tWl5JWTaIXriPThJ55gBl1_gjN3jI.b75n5M_qgRu9B6Pi_yp5k
 r0MFp32467WKQ571NKYqXXLCL7gFDS2gKBJVDVR_t6HztF7Hs0xsiuDUty8RP9kuoJqBCK_NBjLx
 j_Vu..02vzFcmpSpX_Uwr4NwKBjaw4gGxeuB7PxMYf0IqJ64mJ95ly9o.NrV.vnHa1KZJIr9H3_I
 UwLBRK_y0XapkeihSC0GlNXQACsi3nMeWsLXeAePaxEKt63QqXBRXM5mB7cpbrLcFGRXn4zZtNds
 6J7u1zp8wdK512hxqVRV6f5XylvncrZjMeCjScRAZTodb1Wwu8uitJsRzhTCEoli21jcyRUNPYAU
 kyyvof2VTrdOPGo_AsjUBwz8hFejw30qGgFUE2XOqeNgkdrnNNC71eGThJEz1rz5MPz4CFMsO4Qd
 k4wq5jAhD0.vpX3rFLq82XNmWql1.1GnlIF9Kdr8fvZyZnD5_AB2bhqJV8FPa5H10Xe.A_pVq4pf
 3nhPOevj8AOjJlhCQ.76CQ8ZQuO0kk6.o3GVxoBFEG1rwR_Uf5zjOAeAJSdIBk1C.8glu0UVL15L
 J_wFSlJW7TEo8_UZkM2cwXNznS9vQGmD2FbQymrTsjnv8M8x_2sUx635HfuF9EzAGr88.5ZtR2.h
 XD1aj8cHZC993Io4FbHoBgOHZdpOJyI9EpVqTK2HFDPMik9ppUdPUbwzX7MJ7CIrlcHRT1O5uRAh
 QIL6KykJtQ2OcCEvNxhOVxfAoVmybMpnXOBNjZxhprwzCsiF0ca9tcbxZqYvsDZlup4tValZwbXJ
 UAP43lkz3a0DeYu8kTjkwbRgOfrn_hp1ZQ.Le.ltVDymera7CNR_O9DHkq2kcg4ULHIJeGmduKsE
 RpuHGwXJyGl4_kQlE9PzuYmhxrO4eXbe5MzzKJyoF6FBR5LlS8TM62CzJvGxfV36NHTFNBJuDHgR
 _EI7DC_VVKy3TMO8_2NrZ6GzCrs00Q9uegBdoNBYCUntnJ4L9pIENxTXt3ESG1AgfYtLL.NUHXIa
 jWDWxfHqTNqXx7_DyOxktR7CCLEcvPu7Uq7jPS3.ZzGiR6JNBVltLozn49Ko.0OUoKTFX_z7.wbc
 2PL.gDzT_zL0AeymAmvsjWUFEi.U_Ovfv8kuGp59v7_ccksve1O.izmsCNjwrKeWYcSMbD6O7gJB
 L7QiVwArn3qobusuy6QUYIZCNNGspZufJAT4.evX_PytO
X-Sonic-MF: <andy23320@yahoo.com>
X-Sonic-ID: db650393-b393-4403-a041-ff8c443d0cd4
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-asso1-prod-sonicconsumer-svc-102 with HTTP; Thu, 24 Sep 2026 06:39:54 +0000
Received: from dip105.lsn.sg3.yahoo.com ([106.10.223.114])
          by hello (SMTP) with SMTP ID 9dc1b3461f3798c11a284725ca94ffa4;
          Thu, 24 Sep 2026 06:39:52 +0000 (UTC)
From: andy_gao <andy23320@yahoo.com>
To: Disha Goel <disgoel@linux.ibm.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Aleksa Sarai <aleksa@amutable.com>,
	Christian Brauner <brauner@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests/filesystems/openat2: make /tmp a mountpoint inside private namespace
Date: Thu, 24 Sep 2026 14:39:47 +0800
Message-Id: <20260924063947.1824408-1-andy23320@yahoo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917095707.16986-2-disgoel@linux.ibm.com>
References: <20260917095707.16986-2-disgoel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Disha,

Tested patch 2/2 on 22 September 2026 on x86_64 with Linux 7.3-rc4,
using base commit
93f51579e7df248780214094418f205253383cc5.

Environment:
- QEMU 6.2.0 with TCG, 2 vCPUs and 2 GiB RAM, via virtme-ng 1.41.
- Guest kernel: 7.3.0-rc4-virtme; Ubuntu 22.04 userspace.
- GCC 11.4.0; resolve_test built with the upstream Makefile, retaining
  -fsanitize=address -fsanitize=undefined and -static-libasan.

I ran the unmodified and patched resolve_test on the same guest kernel.
A temporary tmpfs-backed chroot in a private mount namespace provided
two /tmp layouts: an ordinary writable directory and a separate tmpfs
mount. /proc was mounted in the chroot and /dev/null was available.

Results for all five resolve_test harness tests:

  /tmp layout            Unmodified          Patch 2/2 applied
  ordinary directory     0 pass, 5 fail       5 pass, 0 fail
  separate tmpfs mount   5 pass, 0 fail       5 pass, 0 fail

There were no skipped tests in any run. With an ordinary /tmp directory,
all five unmodified tests failed at the fixture setup assertion for
mount("", "/tmp", "", MS_PRIVATE, ""). With the patch, all five passed,
including resolve_no_xdev. The existing mountpoint layout also continued
to pass.

Only patch 2/2 was tested; this does not cover the architecture-specific
O_LARGEFILE changes in patch 1/2.

Tested-by: andy_gao <andy23320@yahoo.com>

Thanks,
andy_gao
