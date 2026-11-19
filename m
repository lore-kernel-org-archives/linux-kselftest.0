Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046522;
	b=QyuAQ2d4sWJyXDJC81Kq497QXXMZrPISmJ249Xld6tUfG4JmM6K3y/AAGAou14tR9oPs
	 1kdfNaURH+aJfBVn+vo0FZeCiyUBhZ8B+NlsJgk5LC7hKH5i1OGo1jy0xRUsgxwZlSSEs
	 MlGotrJkr9NkDwCkFduZ//sDoOzFsV3l2fc39FE7cI+2r56ABQrBsmkkmopId04T96nxs
	 XgCCWMtBhl5mE0t8hppRW2zoXZWz1QO6u+4X8RttHDgI5HK/qskn+uRhLbk9hyMW5Zs+C
	 t4pjDnr/9ig4yjQ1Vdt6mKJKi2fvUaUhAYHkPHlB4NfC357d6udMsyvwREVCOTtwR4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ZMcRdE0DWUvfvjny+MgYRY4V5/4F1cz7ADr3t9/9/Oc=;
	b=W7OTubzeLd1n/ZqwMqUiL0PwXtQTCdTP/nVyDrS1aNdDPen2yDXOsAxmPQ47xYOLx13S
	 HgQsG1Ba23sEkZ7bDAi2njKaehe+9lWDhhexpmcwNDNLgLjGaFbMn45YENfjMYjIv4MCb
	 wqoXDHzGRi+mDG9zMgUjQ8bxhyWBq7vRuTv8D2Z5JGXT+T4TkMvLh02T/4EC1KjQDBi5S
	 TV6IZ0xAzXs6asevATh47Be+EuiN7QpY0ueI6ZDNnV3mLtc6ps6V2esINTtcxyywTr4KR
	 4nVP9RC55TN9BFWiCtLWkiozgx/tyBBt+8CJrLSyWjEQV3+fy1RyBN9a3R8+Qs7pLIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VnL5J7E3;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8B460A2604
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 00:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8B460A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VnL5J7E3
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cc89e86e4dso1754482b6e.2
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 16:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795046521; x=1795651321; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZMcRdE0DWUvfvjny+MgYRY4V5/4F1cz7ADr3t9/9/Oc=;
        b=VnL5J7E37p9U9QygnOqjiKkyG+IY3TThsqkVfJlyVBCOMMRYdCX9nngEyVIwDOGF7X
         hazEduQrQFeNkJqU9unCkvw+x3fHhHYS4qS4Tx7pcJOAni4UNVEeb5zXzA5kb+1GdKo6
         s2jCXYoJGQtw2NLJOgCXsyWEZ6KRPamW5NM72W0mj3R3+rtSy6RI2FYFh1MOLngm2YPg
         8JfpqdzaeCtylXIPwfcr5MA1ku91WqlM9gtdXXpc9vH3g0bJCawkk06w/Mmr5JDM/ItS
         ycu/1sbs7nrnAwUySq1i6TnI+v+Od0HJmmz9zTTNg43BT7y6DZYNEthgvkX6GkwURFXo
         Tnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046521; x=1795651321;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMcRdE0DWUvfvjny+MgYRY4V5/4F1cz7ADr3t9/9/Oc=;
        b=0/7CjHVYoKmL3M3EhgBUulNHQyM6IUOgna4oktha1KiRECQfD3GPiTmABkoPGP43eA
         lWKuOD4Xu9hyDhnoaScjKt7+MVEJbE4OLOzy9y6IWJU9PllOXZZVwQcvseBIuKpjeBuS
         DDiR+OONz497/k87NtkHiDPER+zhJNxKquXlBvhUZrj8SYsfiIEpl5WEH8TyX4Qk355+
         dgEY5NCZJjsulUxcfa2grCvH4W67cGwddEbxGDvu9MGrAwC8PKQVKW850R+gXFLMLJMv
         ZT14qei1sSH15Dsxs3hy0Chgrk/LBOxhFOg2rYoH/I1HCkRv3LUauV4NebMvGvev20/t
         ROOw==
X-Forwarded-Encrypted: i=1; AL+hErF0iaPzQrAB1rWuMIah2g6eprUeaJYX2chmkdUOCGWtbQ5Z4KhcKSz7pSxRY+tuZfqwwQptjF57LZJMCMj7Jc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1b7jQEAOgH6Y1Q+zV9D4mGDSSzJh9fspBlQRn9QLpvRbSjW5H
	XFi2W9GsOPW+TpxWCUD5snWdpoodhGf+u/EUWGKqXht28x2jeictEbTsolkVf5KhpL2P4S42pj+
	BTHTUQc2bI2PEpQ==
X-Received: from iohd25-n2.prod.google.com ([2002:a05:6602:86d9:20b0:9e2:221a:fd83])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3a19:b0:567:c773:39ab with SMTP id 5614622812f47-57742d30c1fmr4647260b6e.39.1795046520570;
 Wed, 18 Nov 2026 16:02:00 -0800 (PST)
Date: Thu, 19 Nov 2026 00:01:46 +0000
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
Message-ID: <20261119000151.442543-5-dmatlack@google.com>
Subject: [PATCH v2 4/8] vfio: selftests: Skip vfio_pci_sriov_uapi_test if
 SR-IOV can't be enabled
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Cc: Abhishek Sahu <abhsahu@nvidia.com>, Alex Williamson <alex@shazbot.org>, 
	David Matlack <dmatlack@google.com>, Raghavendra Rao Ananta <rananta@google.com>, Shuah Khan <shuah@kernel.org>, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Skip vfio_pci_sriov_uapi_test if writing to the PF's sriov_numvfs file
fails with -ENOENT, which means SR-IOV cannot be configured on the PF.

vfio-pci returns -ENOENT unless its enable_sriov module parameter is
set, which it is not by default, so the test currently fails during
setup instead of skipping.

Fixes: a6e4e726600d ("vfio: selftests: Add tests to validate SR-IOV UAPI")
Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c b/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
index f3a018b8699d..f27418fa5960 100644
--- a/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
+++ b/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
@@ -210,6 +210,7 @@ static void vf_setup(void)
 {
 	char *vf_driver;
 	int nr_vfs;
+	int ret;
 
 	nr_vfs = sysfs_sriov_totalvfs_get(pf_bdf);
 	if (nr_vfs <= 0)
@@ -220,7 +221,12 @@ static void vf_setup(void)
 		ksft_exit_skip("SR-IOV already configured for the PF: %s\n", pf_bdf);
 
 	/* Create only one VF for testing */
-	sysfs_sriov_numvfs_set(pf_bdf, 1);
+	ret = __sysfs_sriov_numvfs_set(pf_bdf, 1);
+	if (ret == -ENOENT)
+		ksft_exit_skip("Cannot enable SR-IOV on %s (vfio-pci requires enable_sriov=1)\n",
+			       pf_bdf);
+
+	VFIO_ASSERT_EQ(ret, 0);
 
 	/*
 	 * Setup an exit handler to destroy the VF in case of failures
-- 
2.56.1.708.g77570a6a1d-goog

