Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897118;
	b=GFj470v1TeOEYw5MXKy5q474syG4HIpxLw/P1tETqXCUYuXqTb9R/aB3gbXhThXQpzVE
	 V6j0zh84avsGdA7AYD3rfAhaEPg54jUPmG7A/n6hYj1hSfBnONEoEV9i7y0y6oKsBtR5l
	 M9BkdTPjWG0rKsV/u0ZS5l6dVORmtW79VyXbUYUpzshqT2kaqxQU56Gh2+rsD/cASXME2
	 ZdYnewUXBVVMsTYHIlTu0opP2arKCVcYOxw91CYHh5+sH4HOOBNph9kMChomRndkhQrUw
	 KrQmwZg0CIMpyAj9qKNMqqV69/nCUlf8arGRIJAdIrCBrSRNjadP4QkSjuFgBiAPwag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=2gJeu9lz3FypG3Skb0xDHUuQAQkZLfZt0HTmDptUfys=;
	b=H3TBNBLp1YtPATmpnQxKAHgmi3gtD6QoBq/nRLk2McfpOUHifX7jmR/CeRFiGyl0iwkL
	 NPZqjE691tKSoYyj2h11alBII2VmovZcAJNfZnW9PvDfY8Rx/WU4fDy7Dcqw/4kEZTuYs
	 j8cbagWsO1Oqmfc5XeuofgG8FQa3cJIgE7YZ/0xedzL5zlrmQGJGifmw+b54mXEK064wq
	 lM3hbXzsQFLNx3eIpDgIPWLVz8XE6yBbuqkCjfa0S1w7E2UaV1qutvAd5C/lCMJTBOg0O
	 LS1wP3Ari2Ox4/vX7VjAyNTCd0yubsT0S0EetA4LBxasT20czk/fWn6yaJJVu/fHAWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rflYPwwL;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE52606A323
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 06:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AE52606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rflYPwwL
Received: by mail-pj2-f6.google.com with SMTP id d9443c01a7336-2e987949882so29849725ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 22:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794897117; x=1795501917; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2gJeu9lz3FypG3Skb0xDHUuQAQkZLfZt0HTmDptUfys=;
        b=rflYPwwLg517ZWGxWOumRF3ees1MTXwr5b/HV2rmh6ebq0H4+l80WIY3gONZYdJQhp
         RGyl9gDurcGW8Oh6HFVjLvdnRfIzQ2IdFAAAR6H2/ftaNS+OTSDkP6jGDlNNXd6traH2
         7GaRDaOaDpZnAcTXhqfFeGuFuJRCRJTfORo2ny0CNZoQh1KSCAvwiDyJl7ZqNCMkPCp+
         m/4Cu+3r0Pv7yXt0DLd4owsvL2PvIySR3HS8flXNiVICYLJ0hLVE1Yt03jbNlNO8C7dG
         QvU2gey374WTI9bkp/mL9JGLLo7xj5ajwvuv8ze50Bp7ekmJW24Aht4FRWvuHZv0tvqq
         WcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897117; x=1795501917;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2gJeu9lz3FypG3Skb0xDHUuQAQkZLfZt0HTmDptUfys=;
        b=pRhYbaejP48b+AGUprp0x1d9Tg7dxke1y8jfCxAmN61HxkTDRvagTINNd+vWLNSvb8
         dFpJorCazviOzSdKMc6LVIGpMxalOsdaZg9mtH9ip1+w2sIu05H8bUc/dktz+hJGHwsl
         9X58N35GO9mdg7E7AjuyWXoZl7FczebAY24JPOBN7tRbHHbm/vqHrLdfJAxI0F27uzxS
         +uhGsl8YKm8o4xnATcM0F7qfnWg/XZROVA9rGJX5m69eDcEjHzoaYyyooCjCQhtCECvu
         G+eSTj+VC5gWlCATufzjXMsjuK2PhI68M9rZjIG0TDc2wj1vxBPGUODIIeaj+ihIit1Q
         rlLw==
X-Forwarded-Encrypted: i=1; AL+hErFOeurdfouqh+8iK7LJKiXs0SNMqcsuzLwS8ze1pcKY7J61gBekIA9n2hq0rywMxcGvcW6xB4Y/vPFIm6sPMx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+41iZsTIVmC8NTTh9chZ++A6Aa4MFobk9sC/J5ZS3vBwFpbhR3
	B9y6zOThgYcFuqfVYFxMdNFmssCV6YBbDoWNCiHpXQN900ysRxW37rsdmvWSYCzIwIWIV/8w
X-Gm-Gg: AYBFou251Hbh4OOAvCZRl+Q5/atIA1KygVaZH0J8JgSClV6/vwHFRFY3770tUDefLlR
	y3SJHeVz8wHbzFAT6+f3DcWeJo9TtpKjYsAVI/uqMR6qm3PgU82kCC2x+A0t7astgnTmZj4Jhhb
	iJIoNr11cmJNzWs4OiEXgLTs7dneBKCrAywUOZnUpx9VPJ0LgEcXRK/5sTTOBbSe5Wur4JgfDcT
	fhd0HazzYXaH82IGw255lYBuPWWQwejyXEXnzOsXWeumqcaqmYxgstOpeHqfdFhtR7qC6NA2RFQ
	+1YT2TGhxaEBtI0M7MEY1S9b4bcMVyRy0I8CAeDhhORE5+8+yROKugGVq1S98+YLU5ZxLJqikVx
	3ObsISGtB4DvsTjMmy9Lw/00NIDcpclZ6IWigwL8fZbWXyNZFta4CGTqwgFBCaeHMiLVYnyFq2H
	ERIqxk3wIL7a7+kJfrvX3u1Kphs/CHWW7CQ6YbrOWVu5WucwoM0/IHqHcBS2g0ogyFhy1d5+2z2
	hveFD7zesjZWB+H0eIb2wAqPZ6pdq+1JSIX5UvHJARcUeeNSdUOjYdofKMUo2SEdRuFtxSKw36Q
	HHKuFiPAKhwgIcz6us7bvLDDEF1MuKIcmm7MwcdqlV1ZxjssdrJw8ZNCC1JMbMKuxNFGxJuOyrQ
	xNuFIhmSpQpBUbetmzVtrqCT8yyQGFMF2xnSBAT52D0no1mDMAJMtbMI8m1esGWE=
X-Received: by 2002:a17:903:988:b0:2ed:3e3d:f0ea with SMTP id d9443c01a7336-2ee0dd2bb4emr122131505ad.20.1794897117285;
        Mon, 16 Nov 2026 22:31:57 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a364f6sm8477105ad.27.2026.11.16.22.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:31:56 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 17 Nov 2026 17:25:36 +1100
Subject: [PATCH] selftests/damon/damos_quota: skip the last sample when
 counting exceeds
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
Message-Id: <20261117-fix-damon-quota-selftest-20261117-v1-1-c65d687d3def@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2NwQ7CIBBEf6XZsxsLMSX6K8YD0MViLChLrUnTf
 xds0uObzLxZgCl5Yrg0CyT6ePYxFBCHBuygw53Q94VBtrITQih0/ou9HmPA9xSzRqany8QZ94a
 ynVCmPTl7llA8r0Rl9P+43jbmyTzI5iquDaOZ0CQd7FCjTZ/nuDuP44iBZljXH36dM/OxAAAA
X-Change-ID: 20261117-fix-damon-quota-selftest-20261117-7c617b04fc92
To: SJ Park <sj@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
 damon@lists.linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

damos_quota.py expects qt_exceeds to be increased for every sample whose
tried_bytes equals the quota.  The kernel increases it only when the next
quota window starts, so the last full window may still be pending when
the workload exits.  The test then fails with an expected count one
higher than the actual one, e.g., 15 < 16.

Do not count the last sample.  Also drop the sorting of the samples, so
that the last one is the latest.

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
Tested in x86-64 KVM guests.  damos_quota.py failed in every run before
this patch and passed in every run after it.
---
 tools/testing/selftests/damon/damos_quota.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/damon/damos_quota.py b/tools/testing/selftests/damon/damos_quota.py
index 879115a499bf..bdfd22f00079 100755
--- a/tools/testing/selftests/damon/damos_quota.py
+++ b/tools/testing/selftests/damon/damos_quota.py
@@ -53,15 +53,16 @@ def main():
         wss_collected.append(scheme.tried_bytes)
         nr_quota_exceeds = scheme.stats.qt_exceeds
 
-    wss_collected.sort()
     nr_expected_quota_exceeds = 0
-    for wss in wss_collected:
+    for idx, wss in enumerate(wss_collected):
         if wss > sz_quota:
             print('quota is not kept: %s > %s' % (wss, sz_quota))
             print('collected samples are as below')
             print('\n'.join(['%d' % wss for wss in wss_collected]))
             exit(1)
-        if wss == sz_quota:
+        # qt_exceeds is updated when the next quota window starts, so skip
+        # the last sample, whose window may still be pending.
+        if wss == sz_quota and idx < len(wss_collected) - 1:
             nr_expected_quota_exceeds += 1
 
     if nr_quota_exceeds < nr_expected_quota_exceeds:

---
base-commit: 67f3b04b277373438f17300e056306adbd9edf7b
change-id: 20261117-fix-damon-quota-selftest-20261117-7c617b04fc92

Best regards,
--  
Aveline Noir <jm5905938@gmail.com>

