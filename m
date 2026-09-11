Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3FC49BD68
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 16:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142822; cv=none; b=H8tdGf2dtfkqjlcaMDa9wMS9HXK5VFu8RfYuAh4vvooWzV1i7iilCToYNZ4OyqfYukAiEm5HpUMQO6cScFsteavMYQDh5hasms8RZuJ0JASZMB/Mxu6YfdGsf0ZPK/pzcS+530hXxi5Tpbk890O74sr5ouY0svu/AQLAQ9JeEPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142822; c=relaxed/simple;
	bh=gBbxLP629Gvcj9VfC9SPmRJKw+A05O9nG+Plld/3GVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FEu1XnJMpxVIu2zPPCy7yNsJ3qOuFUdlR/HMuisnojwyEdATAe0KEjD25MvJ6GA71zYt9FYNw55Johlc9/ulgLkYs+NUJlC+4QCfDUHi2w0gBLO2yia995UlS7ugLvQ0F9J66IQQmTJy60K4w2+ToPz3xxZf0FdYegn99N4CFgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw; spf=pass smtp.mailfrom=gs.ncku.edu.tw; dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b=E3xox+5G; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b="E3xox+5G"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d6efd73032so21747525ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gs-ncku-edu-tw.20251104.gappssmtp.com; s=20251104; t=1789142819; x=1789747619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w8yzgeJZFDZiVAiiCE2K00c+oQsu6HsCjjXTSMd7Ylo=;
        b=E3xox+5GxHD7PPT8mW29Y+cGlfWSedk5tBviSPr/iO7uH7QHD453nXkT5WiPF97RVZ
         ofKoLcqu0fFkqFMDd2pov8DPz5qmJyG45ENvjpsCTD4D3CpiYQUHZ2iAWRJASKkWBpu4
         wp1FoFbhgoZaqtTwHlcQgTh+0k9sMnZg6OKWLEPYLZTvMyNaAd2ZnXE8nbsRc8qxoQWz
         FgFxb24Rhl6V0BsaLHynhliIVEhQnFwFqeD4FKKpRFisdRrMtAjW1k7M8G2uMvsskCA1
         Fd7oXWQdXIVxC6cjukZKFDO5Mnq3w6EWJAnnwWu9uoyS1UI69Cj0tWdRMTYF6leyQDlT
         tOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789142819; x=1789747619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8yzgeJZFDZiVAiiCE2K00c+oQsu6HsCjjXTSMd7Ylo=;
        b=lNCSN2qVa9dc8C3jbjCzNqsckoc/Xpg6y4IWMPs8TEVqHpFxJtAUTktI+b7Sg6Pdr6
         N05r3qjD91zt6RlSv0bltxgRbsi/AqrDgz7xk1SFAY5iwA+m2QJzGxGzOtsaJkqUxbtB
         /nhuCF7rHZItIjxPXpuBtGkI1QMzg6csMaI++N9AGvu+LM33Flx8yoX/yE51bAoDwHba
         72rJ/3d4eYiKEvy5uQ7ymZ+dH5ZW8khECRMV5yJrBn8FT+AGtJTlrGRzNz1yGZUUWZbe
         iN6VXBy2RCU3HuH6Kxpid9x3kk/6ZM9sv4LuUDtSPGplmwT0lP+45RokuxWBxMTOXfE2
         I+ZQ==
X-Gm-Message-State: AFuF++nVP/vvc8Fuq5P0cCmE4r4itPGnhJXf2cnhnIlvZIWLRg+NTKF+
	yttg1KhEhnsMSsMiMgMl5CFysdlHLyYHy6+PEhZ1+X1m5Gd287gB7mswJS7m08/hZs8=
X-Gm-Gg: AYBFou3U4grZdOs5t2P5OU45NvpLcEQlR6zBWNnpMvOVkGCAXK07YpBWMFzlWnaOCLZ
	NnH2tmzpgArnaIabzlvE6GlSeSukcvHCryxiYnZN4ld/FU5AD9DFQCN8upewRV+wxyQw4OfEET+
	6jxh9C6MCBsnYN3cy/Fwy0eNzGnGCUQ780GeKiPqNhpx58ThF0cKdxDdP8G5af9LUhblWIx8nOx
	Q2annMPWY1hKwDL4UH/ncLZ93NaanO9mFpYq2fVjDdNRvg1/t4XbKMpqpaBGDPu2IFTPi8S2K/Y
	5VBPf+RUIb/8EjwXN5LSC9J4oBVngr8bT46dx2+SlaBltNmccZ2rQh2aavfSJGW8181k7vLdUH6
	t0Xi5bV7X/6AbzecFG/nLarJfKDcQVGv6ARM6Babd5WdaQRBYGEj+cGYJTnNl1WVNbfR0S04HPL
	qdv0H8ZOPySxsLMSyZTj3vgNeDIfFPB1HMmPFI9wWCvqaCGvr+lE9n51fQLfcPEUVky0e/GNucW
	1YqpsC4uGKrN4sAhxusxdd2AaUu+DfjlMSmrgsC2boFnodWc8cMyhJbbbhG+QSlBHrz
X-Received: by 2002:a17:903:1a88:b0:2d7:1858:1d96 with SMTP id d9443c01a7336-2dd0e9e565emr113903455ad.7.1789142817956;
        Fri, 11 Sep 2026 09:06:57 -0700 (PDT)
Received: from localhost.localdomain (111-240-145-155.dynamic-ip.hinet.net. [111.240.145.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfcefb6sm13883055ad.56.2026.09.11.09.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:06:57 -0700 (PDT)
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
Subject: [PATCH net-next v2 0/2] selftests: net: Exercise TCP payload verification
Date: Sat, 12 Sep 2026 00:06:47 +0800
Message-Id: <20260911160649.51863-1-f64116045@gs.ncku.edu.tw>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1 added TCP payload verification to udpgso_bench_rx, but did not
exercise it from an in-tree test.

v2 adds a test case to udpgso_bench.sh for both IPv4 and IPv6. The
test checks the receiver's exit status so that verification errors
are reported as test failures.

Changes since v1:
- Add patch 2 to exercise the TCP verifier from udpgso_bench.sh,
  addressing Jakub's feedback.

v1: https://lore.kernel.org/r/20260906145643.219609-1-f64116045@gs.ncku.edu.tw

Testing:
- udpgso_bench.sh: PASS=22 SKIP=0 FAIL=0.

No full kernel build or boot of a patched net-next kernel was performed.

shuo huang (2):
  selftests: net: Add TCP payload verification to udpgso_bench_rx
  selftests: net: Exercise TCP payload verification in udpgso_bench.sh

 tools/testing/selftests/net/udpgso_bench.sh   | 34 +++++++++++++
 tools/testing/selftests/net/udpgso_bench_rx.c | 51 +++++++++++++++----
 2 files changed, 76 insertions(+), 9 deletions(-)


base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.34.1
