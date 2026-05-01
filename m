Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008C33E2769
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 16:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777652900; cv=none; b=g4feClQiDT4g9lI92R/It087x8nCKw5zJdvPmQWMjSuHfSYG7MBRViUoEhGftbrw72ild/CGXPCOaKAMbEHiZTuc/GEkOe7YzBhidB+3fI0c8+Zsrz5TYt17fR6LKwuNS6jZnk5fpQNVUtwtb6iLf+gbhrcs/ts8FUTzTFM/amA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777652900; c=relaxed/simple;
	bh=bCRKbF7xQHc64osfO4JM1wubcsdfQjudflP5eRVlikk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iXAdYn536ZMXjXM5j2E34ujeUZDbDkjgD9odkhXamlHZHjU3G/nF+l1AF3biAJnzppjULA3YuEZmGwOu4+hgNHNNcSm3Qv6nTE69UxyL78lzywIV+y3ZmClRpTp2kTFwEk6hlwF1TLt6aoGXrIZEleG1WvTXqALtivER24EHVa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rz0ezoVg; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rz0ezoVg"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-35f9ab079bdso1531786a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 09:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777652886; x=1778257686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GT/RM0CFG1D1q5BzoHJa9xAcl2JxNOjlfH6pR++zzyo=;
        b=rz0ezoVg1gctHGJMbSFT9u2pVGPbjoAh/0FzIlxIU9xqS5vECemEsaKZgwPYCHB5lz
         m6tdZzVyow1XQC/vHIp/SXPtLWsb2cy2hxRYPYKCr0fZQL5cyJWSX+vFi0vxUVZrMjRD
         TKkE/qsl7EPP6e78xMmVa5PV+bMWAm/j2T+g2+CzGrCFMuDq+AQMEBAsQ5RY4VsR5nKX
         b/iWYbf8xq7UQdRxK/eFT/mj3JYo0X80ip7x6Pe7CNmPAdc/w9/osDrBQIvQeqSICyY+
         e0ePMAlO5ZgqAQYW56JlO5Qiass8yTMTnJNSM4yebAiyOiCAGQYVtd5NxTahzQASltwL
         SNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777652886; x=1778257686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT/RM0CFG1D1q5BzoHJa9xAcl2JxNOjlfH6pR++zzyo=;
        b=gUjORh5J/RjTQwqIC6fVZOcJ2E+0oogelT65qTgAHXTUuMJMpTjhIXc46d9UcA9Xc8
         WzukEm07Aidt5FExspAKpMB7h7eVsSAlLc6k5EMhwbmsQhBZi9Wj2lPUbmrfmFNxM6Sp
         YUQfkzDIzKwdJ/7AP7UQzR4ULjPtDSJAzs8bE9qtuiR9trFArNy5/AIteIgsFoU/k8M6
         iGi5fe4L5ya3nySy77fzXCs7pcui0S3XEwrd1XTgmolt0Xy5bWB8MP24k3Z128AyasvN
         WuVpaxI1C0QRea53W3EoaCT0Jym14mK2CxRPaTr4F3nr7uJzlvAccrjJbru3g8gXd1jc
         Mnxw==
X-Forwarded-Encrypted: i=1; AFNElJ9fCPeonKPEGbwHflhqDNR6ne/FB7VZh2iXDcfc9NS0sAHAACu8XEd1Qdhma8dD9v2bMY03qsr52o17NW6LPQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGILv8Q9vWiSlEeLd1I9DU5XJ++FuuSJ1ghUaUklZIAIc/Qtf+
	tSvjhlCCsNdHfa4fs/o8YTWl0+TX9XwJIkKn4pumwD0gxX5Dq5G62J8=
X-Gm-Gg: AeBDieu95fOTbxmIcoHMp/LEsYT7KJhO+ZRmsS4uEl15EwM9hyhMTZUDjBpcYjSD31H
	xQt4nxSut6bg8qP6cGG7xsYN7tj5TIAM8sbciFt6kidea+kPzf9qaBaOOIG0cGkzOTFUwFCO/sn
	z98ifwIR0+LVvPG2LTna6wz+yTGxhpo54SYtqE4vRnKma5l+mHHM12Ckg78sErx7jmEWYrDOX6K
	2EEou1ZZlk65aWA5z8Zdp5YlJCiPvlTELCYbayiG2VvRFcrntNIkmKAvPSJpkRjE42pIKNZ4Opm
	8D2VIoE06n0aCrAmsYO05vP9J17LOuFT/fpHrFcXnrcPGyPUNAq7LPLQSXWwxDZVlhd8buO3j4B
	TfHqZ1I0hVZkP2h8e+yK2KW4OOmZuMdjwvdQ9wM9RFCC4P9n+Knh/voneIU3/jNm4ZubqMI0tHO
	RuQPoau4tzD9eFfc8kjD6S/rJaxA/C+DmnYz77+JUf3jlhRERHgXQf
X-Received: by 2002:a17:90b:5830:b0:35f:be11:b3e0 with SMTP id 98e67ed59e1d1-364c2f20cd7mr9386102a91.2.1777652886086;
        Fri, 01 May 2026 09:28:06 -0700 (PDT)
Received: from localhost.localdomain ([59.16.109.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bdf54203sm6186720a91.7.2026.05.01.09.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 09:28:05 -0700 (PDT)
From: Jinseok Kim <always.starving0@gmail.com>
To: brendan.higgins@linux.dev,
	david@davidgow.net
Cc: raemoar63@gmail.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] kunit: Fix spelling mistakes in comments and messages
Date: Sat,  2 May 2026 01:27:37 +0900
Message-ID: <20260501162739.3861-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two spelling mistakes in kunit tooling:
  Bascially -> Basically
  higer     -> higher

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 tools/testing/kunit/kunit_kernel.py | 2 +-
 tools/testing/kunit/kunit_parser.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index 2869fcb19..58557c47d 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -218,7 +218,7 @@ def _get_qemu_ops(config_path: str,
 	# exists (I learned this through experimentation and could not find it
 	# anywhere in the Python documentation).
 	#
-	# Bascially, we completely ignore the actual file location of the config
+	# Basically, we completely ignore the actual file location of the config
 	# we are loading and just tell Python that the module lives in the
 	# QEMU_CONFIGS_DIR for import purposes regardless of where it actually
 	# exists as a file.
diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/kunit_parser.py
index 1c61a0ed7..0e1d2f498 100644
--- a/tools/testing/kunit/kunit_parser.py
+++ b/tools/testing/kunit/kunit_parser.py
@@ -268,7 +268,7 @@ def check_version(version_num: int, accepted_versions: List[int],
 	if version_num < min(accepted_versions):
 		test.add_error(printer, f'{version_type} version lower than expected!')
 	elif version_num > max(accepted_versions):
-		test.add_error(printer, f'{version_type} version higer than expected!')
+		test.add_error(printer, f'{version_type} version higher than expected!')

 def parse_ktap_header(lines: LineStream, test: Test, printer: Printer) -> bool:
 	"""
--
2.43.0
