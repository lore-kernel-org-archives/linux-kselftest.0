Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617C63C1D78
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 18:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792261518; cv=none; b=aRPjos1AoMV1EiON6UQcLpv88cvdO2m5xlXErkVaeNtrYcUXygsGV6HK6w/FmBeJ8xdrr9E8F68BcZkLlPVezHXaGzIiL92Dng5/1KA5Px6zNlkwi9LFNDXeKLqSvqcp9sbwEKb2xIxQUFXgd0c4uiDuCC9gE6d87+VC3F4rRsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792261518; c=relaxed/simple;
	bh=BRWVIj0+QDTuMYi7F6ltxI3tp8k6MD7qa2pkLuMBaWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aDkoe78AY7RElaiAc/9Bufm6j9deox0yIGkg0a6BZat5MhVoZuEntzlb2zh2C3UWHJrTQ4h4dwxLADddmJz9n8fKnT85tBrllKkkQ/Daef56K3oD1W5QOtL2Qi1Zv7S8EQDUpCku0+6KTBeLTle4YEQlVGnfLxBX1+sZt86u/Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILLOFWEa; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILLOFWEa"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so726214a91.2
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 11:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792261517; x=1792866317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=luYltKYLm6yYl2bIMxE28aT7V3Jm1uOyqRT/NXcaIW8=;
        b=ILLOFWEalzVrj8yA0Em/8NS4cW4lV/XJhCeGEuPLrdwS/gyy78RcUnnMztUvzgcmc7
         SC0PiSO0AeEt0Vub1isPfXOsdasudQWYFfD2ncJIM3VJSCZsvl81jfUEgX/sVx8x7TYA
         4QVyFK/QUSN+xjeQask7SNGC3iNlLpelcv7elehDLmZTzTZicIadVUzqmuo+z6OM1dea
         nOeSP4qtxNXXpIYaPeT8nzWS6BBcXTyNfNx55qDnqQc59UKiaZbK1DW4sGaXepbRmvSq
         k/ChkTDc2cHzDOY80A8lwDhoh+NxFPS7paSWIde5xzdPl68VZWi3MOFv12FfdSUAH3C5
         jsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792261517; x=1792866317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=luYltKYLm6yYl2bIMxE28aT7V3Jm1uOyqRT/NXcaIW8=;
        b=tya1tDhKeN4YAjKGoZQomNDrxQOHy1ULeFOw8Oc5ypP4/scWh5amle7fwK2EC6EdV3
         CCi5CXrwDp68eq1E6eJABiJMlthBAiwRuY/7efblC0wTO1n5Q8lDFSd/IlDU2rjK/EX3
         jmxeAvqj52eS8zlbp6Fo2wj2Ige2WB6Uc1TXSUlLMty5evmoIMS46qjUoQk+iz/OSH6v
         3izf77R5YY1ZDtz6tVANKqi4XRK0J+ZYfa0kr3fNgIuJJr9avjBWem9LQOD7iNRtXLGO
         GkZKdYqnDECNpVNv/M8ekSF19tUYxm1WsXzsexC2xKqahvLivv83tD7QlwNsJp1xE/Oi
         S5VA==
X-Forwarded-Encrypted: i=1; AKwUvBzIFfJ+v1dSkJ7Y3i62cS70RNAWwU52SqBaGvL4fgN4YVTJtTti+NmK8t7CdzaNizIaOD9w13YtPtn7YwAYnKE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1kf8uY5dvqvnaqag78v15P8uXoGih1nPeXlTgCQa7sUsocjua
	q0qkahatz6hCNrPOAceOihhqQf29d20j2A8NNH26Cn0BHbVaw4bfPECo
X-Gm-Gg: AYBFou2sriKid0GkeVCI/AdimMNK3gqxxun/8w7OQ787ZvNFH1IPrx+R5btuFjfRypQ
	U0J0K4bglBF9rdqe+It67+4AGuRsdZGTQUSg7Zv3JVuJvro9bIFMjLiUdru2+91DIUkp1kl+KMc
	0OOeoelmGcCweE9vrmXoAya1ZvZZV46h7O5yowyJrLPDY890KIqPN6DzCOLKvp224xWwfh0OGJN
	x+kX1Kow5nxB+m6bBlNy+r2BPI8QLH9haqdaF9Xip1CBRDNkjYZzTmR7ox1cs9/5zxAvgA8Tf8Q
	af90uNcw1tgrqdUK+dJKvEjj7NMQXM5RLycaM1iNmQqqnzDcU6WmfNkRrS2b2dxsRqjrzou1qDk
	nVxI5l6cYRNa7J48/ojfiPiLQiEcBxECfUveZkOlZs0xDff0CHVYBrRjGMdNtDCRnLpdUYUpvpz
	Pm283TMoLM5Cnd8/USyBivTpV5/2QYW2gXraLj56K3gtIFJ+KUhJJ9DxwYj6SzZ1cHHTLX6wM45
	mQmP9TBhkqs3N4qQEfQ897T8V3v/hQ0pdVlkKAp+/NZBlk6dSYWZR5TtgS8kx8GOCWnnPdLqcRQ
	bw==
X-Received: by 2002:a17:90b:3b91:b0:3ac:bfa7:b079 with SMTP id 98e67ed59e1d1-3acee97ab0amr2910170a91.7.1792261516634;
        Sat, 17 Oct 2026 11:25:16 -0700 (PDT)
Received: from localhost.localdomain ([2001:56a:78dc:9300:8846:761:63e4:6d67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ecd32sm9241586a91.3.2026.10.17.11.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:25:16 -0700 (PDT)
From: Abdalla Eldoumani <aamsdoumani@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
Subject: [PATCH 0/2] kselftest/arm64: vec-syscfg exit status and VL inheritance coverage
Date: Sat, 17 Oct 2026 12:24:52 -0600
Message-ID: <20261017182455.1884-1-aamsdoumani@gmail.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>

Two small changes to the vector length configuration test.

The first makes vec-syscfg report failures through its exit status. It
currently always exits 0, so a kernel that fails its checks still shows
as passing in the kselftest runner.

The second implements the "Test PR_SVE_VL_INHERIT after a double fork"
item from the fp TODO list by also checking the VL in a grandchild, two
fork() and exec() generations down.

Tested under QEMU (-cpu max, -cpu max,sme=off and -cpu cortex-a57) on
mainline (58161ead2, after v7.3-rc7). To check that the new test can
fail, it was also run on a kernel modified to clear the inherit flag on
exec(): the existing check passed, the new check failed for SVE and SME,
and vec-syscfg exited 1.

Assisted-by: LLM

Abdalla Eldoumani (2):
  kselftest/arm64: Report test failures in vec-syscfg's exit status
  kselftest/arm64: Check that PR_SVE_VL_INHERIT survives a second exec

 tools/testing/selftests/arm64/fp/TODO         |  1 -
 tools/testing/selftests/arm64/fp/vec-syscfg.c | 64 +++++++++++++++++--
 2 files changed, 60 insertions(+), 5 deletions(-)


base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.49.0.windows.1

