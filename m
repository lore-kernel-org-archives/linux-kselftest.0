Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22DD1C862D
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 00:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789346737; cv=none; b=hTVoVuAp9kNorISu1lQld/Qg5wUOYI6RObQbFdZPpmmg+zLxFBShguXhviurn4eaReBgZdONh6qQfOUawB0PSqF079p3AUsZyruXJFnzBxPanYVsvX9bIDo6DZhhov+LlQQe6ZFUdaGqKD+kzOTs+TNH1U8V2sWurfskEUDALlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789346737; c=relaxed/simple;
	bh=3vx2QJQpErdCZPn9W1iKN6aBTLz8fQDAQbthjqOGb6s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uNzbufipUz3BsTHD/Bdp07+8TMCimVNmINYr0EyLoGEKWgpOLOt9v/wp4S59LUwAijQAwxlBlVaEjSHW29JQcAEGfN54Z8xBsxEh1ZhU3HojKQOI0DEXIjSfDEx6ztDKV8oNC2fzIohaI9rqTHX2cbZjKCEyVkVDy85h6I/dxnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw; spf=pass smtp.mailfrom=gs.ncku.edu.tw; dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b=PTeC7Voy; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b="PTeC7Voy"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2dd6665a10fso3016025ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 13 Sep 2026 17:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gs-ncku-edu-tw.20251104.gappssmtp.com; s=20251104; t=1789346733; x=1789951533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7RGlnM7RppRSNr2XCcE2fndgqMIXT9hQ8em3W/TKFM=;
        b=PTeC7VoyRQIrWYZYDqoHJulVJ7fFlwSWdtSz/u/FH7uU/I4H5z5LWtgmcnQO57xKFV
         z+doOy/pPjJbfEMEfcrrc1YkNm+OtBOYJfCrp3L8o7gczqRUOj84im4+Q7+ZevDkI9Hd
         6p9TspWD/S1NSjDz5LlEhmiXQ6uWtg/8qhxR6pV7YKgoqIznOzg+JcyFm++ltMfwsbsD
         oCQtAft6I5ZIKnzjNjN6Bf5wCbVC2aB0wpdkKhmTBZigyWKu2nTjuXJTf2mxr94NIhez
         /i19NyyqyiCC+sbn3eY6PUPCIlrNPBK+jfYIJksHUQOQUGhPlfYjhw7tqaeiuipIN+ft
         byUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789346733; x=1789951533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7RGlnM7RppRSNr2XCcE2fndgqMIXT9hQ8em3W/TKFM=;
        b=GUvmiNzY7CHSd79uweAMXqMYBrAsKQCHcMv+QMHtPrY8jlO7zDz2UxaBdRIhb/w0Mz
         iDsLDIaLRJz/yMCEsBwBNmdkCMb1VkQxwu9aMvK9tjdeqirrMDN2L4XbFcyIE9nIrg3z
         HdwsoOpaJipXCxmbpVEP7EhYdHgDTBuKXP5RGYPdnq9mvVyULvfoNHmKrSNoy+J8G5q4
         aSFIhujFMU6TavbdKrg3dw9A26vhS4InKaCZDy9fne47l+5AW0nIS1Rla+Kq709tWws5
         XIadoohQ1Fyw59BNFVIZC+oxA1EchAWxCQSCfeTSaOpOGu9nlaF5pGDpVs/bGebiySBp
         PpRA==
X-Gm-Message-State: AFuF++l3M18PRZ3J6yeVcbZ63K70AAzgIn7chnF1FlvkokUAZ2vM3XCB
	LbMz9hmM22OJuc+wvyYoorUtsFXjWr2uVDxyuGX0RUcSUMij9+l2wFy4Ut+eleUd7NI=
X-Gm-Gg: AYBFou1VSwrTTitV65lBDvyvoIr0km/YqK9m1hPIva9vMgCumr8gZY/zXcosRZStOGX
	j7NSO1eruoSW7T3v8IoywNf8yRpsUa9eBvxmJqBXMHpb9ehIXqxP+1PKEgRWUmpSXU8K5IzHHRd
	QvbYE64IXLsD6t+CWEz5+kr0qIF7PLJrdNiO9XSugobU8y2wSnBmdSJJmDBbg5tbdHtV0ZPvmSX
	1ExEeK8T7wuB9nlGU7GSyO2a2aelhAXccFJA0X3xbth0UlsPCXS7jHayBhJeKXzkp0YBsWZ+2QN
	zH8yDYe1ijjkOma6OwqknDrIDVRFyviQucuA/2vHo5dQmDWt3ijTxo0z3L0icTOrZtWZx2syf3p
	xFfLffUlGgqf47XKezvgTPsDFrXTpo6CLMsv67lJmV+Bm4zanqDbwOVoT/KnvSHVet0ysSzVo2A
	QFoPfLRCpnVTep/hWW/gJyJQ4xRPi5K9YrYtdKRHj3Z50UdUXANRlIUqsxkdRxTYVvhFccWwS/k
	hKatGmWojDrJWDbNbdV4fJNyBsfgynZPJUSVj7tDAfSgoV6sni55Vvd1w==
X-Received: by 2002:a17:902:f644:b0:2d9:3636:d01a with SMTP id d9443c01a7336-2dd6c725048mr6751595ad.15.1789346733164;
        Sun, 13 Sep 2026 17:45:33 -0700 (PDT)
Received: from localhost.localdomain (111-240-141-218.dynamic-ip.hinet.net. [111.240.141.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd3f0faf19sm32604465ad.12.2026.09.13.17.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:45:32 -0700 (PDT)
From: shuo huang <f64116045@gs.ncku.edu.tw>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	jiayuan.chen@linux.dev,
	f64116045@gs.ncku.edu.tw
Subject: [PATCH net-next v3 0/2] selftests: net: Exercise TCP payload verification
Date: Mon, 14 Sep 2026 08:45:23 +0800
Message-Id: <20260914004525.46597-1-f64116045@gs.ncku.edu.tw>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds TCP payload verification to udpgso_bench_rx and
exercises it from udpgso_bench.sh for both IPv4 and IPv6. The test
checks the receiver's exit status so that verification errors are
reported as test failures.

Changes since v2:
- Wrap the receiver command in patch 2 to stay within 80 columns.

v2: https://lore.kernel.org/r/20260911160649.51863-1-f64116045@gs.ncku.edu.tw

Changes since v1:
- Add patch 2 to exercise the TCP verifier from udpgso_bench.sh,
  addressing Jakub's feedback.

v1: https://lore.kernel.org/r/20260906145643.219609-1-f64116045@gs.ncku.edu.tw

Testing (v2):
- udpgso_bench.sh: PASS=22 SKIP=0 FAIL=0.

No full kernel build or boot of a patched net-next kernel was performed.

shuo huang (2):
  selftests: net: Add TCP payload verification to udpgso_bench_rx
  selftests: net: Exercise TCP payload verification in udpgso_bench.sh

 tools/testing/selftests/net/udpgso_bench.sh   | 35 +++++++++++++
 tools/testing/selftests/net/udpgso_bench_rx.c | 51 +++++++++++++++----
 2 files changed, 77 insertions(+), 9 deletions(-)


base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.34.1
