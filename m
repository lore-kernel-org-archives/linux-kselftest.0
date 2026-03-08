Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F68175A5
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Mar 2026 09:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772960791; cv=none; b=os6d8kTdl9Shqsefdr+QcMR2If2XnCTWkjcB0hBT0TjWtATVxYUTdma/4+G9FTEBjmQCZM/scRdDJPO9s6ZhteHQ2PFvshioCC4jGip96FoVVyraL17yYqVfmeLTA2A78Y2toQ6QCzU/2E8ri/K5mNZyOyothJP6ZsxPuoTGQgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772960791; c=relaxed/simple;
	bh=JsNAl8WVMEKBfTmc/KX3qTDxx0gkZOBj8lf5LAO8h2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DP4lDOYRoqm1wPjA2r7AeICo/USBPic+K8Q1dMC93ANAmB2NKaRnYn77Ksh91Y2WcGKr6PBKMp6mHTxyqZIQSlKu2CEEgEQeUlEtECrqenP/nwWlc/uW2jWO7DjaC9aYwwyuxjJ3v9RAxHKrCC2dI5YQi7EEsuUjBWTnucueVB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmqveW1x; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmqveW1x"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ae3a2f6007so58061425ad.2
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Mar 2026 01:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772960789; x=1773565589; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hs7hPfZchDfkvHX8fv1Yt61YddgThCI8nWKUUUU6CWs=;
        b=ZmqveW1xXcjOo2KkZbsVja+2A6XPbCQfz1Jz+DOYLNErzyx1ttQVxRtgdC44Yz0ywT
         aPV1+5XT15SFq1p8xQpazfWZ6G6lAyYHdl49XLHQfekokrvXmRzQZs7QJRZiqTc6TXrN
         6F+NhP5/XJvAm43r4DtKgLJKrIQdkaDHEc0mPQ93XMqXBGNkrMNC03IkDPFVluUDzPIL
         lifoPYgQF0DAkq8ODr4Q13bFNDy7hqV6C+6nHPKosvU/qdl65NRyKCvFGegmFPj4X0Z4
         PcWX6bZZTrKmuD1mfDC/fE8q4fgVx7WnJWC20/onBBY7Jum9WR40qcRhlxE0TW3b4QiY
         iPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772960789; x=1773565589;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hs7hPfZchDfkvHX8fv1Yt61YddgThCI8nWKUUUU6CWs=;
        b=Ql0rSBu4Ko3p7j/pyRwcf7q3sLjv8YHG9OttQ60hiNqI5yT6k3GWv+kJH1Pu7ortwQ
         pY2oafxaAm3+L/8d9b83ohC2k7bwwBxYCcfER4Ycf1XrYIAq/Md00KeinBzafgEUd+8Z
         mlHWPmCHE/CSKrG3GCke5tNBK74iTnup8UKrQN2Cv4buZP/lezJ6XCYMjCN6+NKH2XMm
         uDCjHYvQZXwb52PhPvYZhuVg0+z7uvxDlp4WARJpNzhMuWadYLqQ+gsFdU7xdcBaoVkp
         iSFJJIS95rpBfRA3RvR0NbCqKGUOYCzT9++ALkMkFWFZy1kTia8As/xSeqrd45ZT7FaW
         2cpA==
X-Gm-Message-State: AOJu0YxNgHz9J7NyolH0yN19PhZq2HLRwbd2ddlLqmYvFJenWizdc9yO
	IwNkMJuGj6v9e5+i1WIn9+NqTwln4UQB7VCXswEBCw3nqvs32praCrZL
X-Gm-Gg: ATEYQzwDbN3WRWejsFdbpLpiCbundKnfAKxHyNhR9I5inomnZ8/D4nc/0dA/KONKCt9
	iYZowx0tQn0n8rZoE0Lroyqh1g/jCnSFkicX8wBWr1qlzJ/oe1NPk3zzdBnKatQ02B42A8ze23x
	0ylxtA8LaEYmeKBB+htV3rbcu1OvYu42mJ/IVXMmPu7v9fnf6VTqSYO4kwbdHyscONvecUD73eS
	6mN47frVgQCbD6d678fSm6bxQPnRRncibzsFvyqvnVOAlthjJWgDm/oCRf2rMMszNos/L3n1JyK
	jR3NFjkfF+8lguMqm77H2DiQJAdK5TMZ7dhDY/VMWC7/4miPb7ZIA8sZuvUoeoZ6PHlhFoaaVu9
	ZkfGFeOahFCs4XWiSQHYh9p7ic/rzr6xeBGRMaUdDBGdEyEMdlcRuju7HpuBVhSfGR3esuFKffb
	tn9snKeVxkHg3kUzDDXHIP62a1QgETHWWDf26XPBpn0Q==
X-Received: by 2002:a17:903:11c4:b0:2ae:47f9:de12 with SMTP id d9443c01a7336-2ae8251b8famr80857345ad.46.1772960789007;
        Sun, 08 Mar 2026 01:06:29 -0800 (PST)
Received: from [172.16.80.107] ([210.228.119.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f74e7bsm73369025ad.46.2026.03.08.01.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 01:06:28 -0800 (PST)
From: Ryota Sakamoto <sakamo.ryota@gmail.com>
Date: Sun, 08 Mar 2026 18:06:20 +0900
Subject: [PATCH] kunit: Add documentation of --list_suites
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-kunit-list_suites-doc-v1-1-4ccd7641a484@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNT3ezSvMwS3ZzM4pL44tLMktRi3ZT8ZN1kg6Q08yQjEwujFAsloN6
 CotS0zAqwudGxtbUAS3IAQ2cAAAA=
X-Change-ID: 20260305-kunit-list_suites-doc-c0bf7b2482d8
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Gow <david@davidgow.net>, 
 Ryota Sakamoto <sakamo.ryota@gmail.com>
X-Mailer: b4 0.14.2

Commit 60f3ada4174f ("kunit: Add --list_suites to show suites") introduced
the --list_suites option to kunit.py, but the update to the corresponding
run_wrapper documentation was omitted.

Add the missing description for --list_suites to keep the documentation in
sync with the tool's supported arguments.

Fixes: 60f3ada4174f ("kunit: Add --list_suites to show suites")
Signed-off-by: Ryota Sakamoto <sakamo.ryota@gmail.com>
---
 Documentation/dev-tools/kunit/run_wrapper.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index 3c0b585dcfffbd3929d0eef1ab9376fa4f380872..770bb09a475ae799d9247d4c5558fc3306b9cd64 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -336,6 +336,8 @@ command line arguments:
 - ``--list_tests_attr``: If set, lists all tests that will be run and all of their
   attributes.
 
+- ``--list_suites``: If set, lists all suites that will be run.
+
 Command-line completion
 ==============================
 

---
base-commit: fa2c3ed5f079d41db0433a8dc829b9f6fb408aaf
change-id: 20260305-kunit-list_suites-doc-c0bf7b2482d8

Best regards,
-- 
Ryota Sakamoto <sakamo.ryota@gmail.com>

