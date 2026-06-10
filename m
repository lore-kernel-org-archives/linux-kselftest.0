Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBFB371D01
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 06:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072567; cv=none; b=WzdyaksIis/uDCIKeolVj7TbXj659JMKax6R+6n5llLNxUZ00gatNuHuH6bmwASrW0U3p+38PhlATcwj/CHdTM4oietUbRBuMFJQkfca1s6JLFeHx79HQmsOOTjtrsLRSHkIroEwTJaEe+uLR46zGLThU7+SlnpJYDw6bDsdLGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072567; c=relaxed/simple;
	bh=1G5Z/r/CLcO3rcLtiqRPDta/nElVm7Ks/bwx4ygMmMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jWTTIHiNtEi5uUDwvppX1tsTXAumJxnYD3h4fpeRcMgDqXj34tE7Iy/4eXr1joHgOgfMPC8Cwsez54iyYDVbXXWGLGCw10/pOk1k8HNxnxI0pfsYsrTd+rRGLDJbqrC2Qo/Uz5WftwvH/S1200dmwZDzmdoqB/WCfXo/2lOou7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=aMLT31pf; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="aMLT31pf"
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 74B623F4C7
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 06:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1781072560;
	bh=yyj6UxFFAHEJQaifJORx+nCQZ9WfyZvUY4fGAwLJA68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=aMLT31pfJHq3CdVo5DnVviIfI48bpuIt4dvwkuo1Yrv9cfXDybs549Ea7k6/jQ7ec
	 Q4np82o2q86zkc+TIHHRlqTPQ25XCpbU0RDfUWVnnJSxWK5WtoJN4sRVrc+FbUo21S
	 xNUsCwacMCE1yclbgE4SGmKsNOboqbF7De/EZo0cGfNSzdbPI8vYuNKLb1mhcQOOpi
	 pfSqJ9I1irmWBGtaObdxALZX0gxsiiBuG/zPAm/ZFONqjdoAc3K1MAqGoQqyjwlHY0
	 ySK/sxGO2p22pGgGpng9cRv3dLm4XAIHC7jR0ro5Y95rEyRsJA1dmcPi33JjekBEsA
	 U2OnZB1oI0ELrPfBSyZogzIMp6coYW+L61Y/DG0lvLpA5TPfqBvNsWHi5jx087TzRH
	 PHYw3QaSIN2lZNI6cSALB5BRNDYrYh8Z4T3BggVqGAO5+OqwXym6USooxkV/8FDOO/
	 83L5+mnKB64y6F2qmpY4jIg/vMDUEA+mKl6eijwaMqxZkGndTq8GJSaDHCvO4ORrC2
	 HZ+KhSfYnmRwq4hnZe+xnR6BPhlQriLjMmxy2vW1Y/JGFpby6I995n7YTC/XWKLC3b
	 EWTHkYIluO2hHvxk5X4by3CFJThmNy0PUrRFxqy/fKnpGSNAvcR3KVajWsOi+2uZ7o
	 YJ6cTtAdam78C3buxLWV2cuE=
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97955899so6087772a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 23:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781072559; x=1781677359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyj6UxFFAHEJQaifJORx+nCQZ9WfyZvUY4fGAwLJA68=;
        b=ZpWCxPs6EfA5pEMpVl2WVy7anF6pPj2CgnATWZj/WHGg4d/IbDvHCI7JGM7RhMig6j
         rl5/YsvDFcFxbrkJ/n1Fq5e+szz7cVz30hHlS0zQ7cTPHgXnv5LItEiaJrlcpE1/3jRN
         Auv4AB3Fr1Vq8ilFZ0cP39+2eyBkNy4zjvSNgY7frvwLoBOV71rt20W63/IfmVZG0un0
         G0T+tl7Erq3mVAQIHu7leJ+iCguFJN8WKlz5/ykbqX+YkEqTCTpKTuMYIBgB6AHy3t+e
         xSnOntGfNGtzkkSg4gZ42Fx3N4xMvwQ6kyM+k44IdBZQpIbzF/7V64F9QmvNwYh0tzHt
         +OMQ==
X-Gm-Message-State: AOJu0Yye5DvGiYbaiKvNGuJKNdQaX6Tm8cLSlEVKBfzH/oPRezY2M5h7
	nfJwh63Ev35It0Cly4C2v3X+z96FMYK8MaEuHF8OSitSyhOiiqDEPF5ciI5Q9blZ4R1IOt3wUjn
	j3QGQcPVFACkYN1NcZeWOxkmD2mTdzHfe+FEB25ZsD4KZi814dCQscy8M1eesJIRc8GM6M4iYlY
	5ZtEbQHqYzQ2vcXl1WGeRhRP0=
X-Gm-Gg: Acq92OGM7F0emxQ/WQUMu0sSB+HBIeYJca44eFZBETwRr2pCDwUS+8FAcOYvBtKzF4o
	hWqTZT2FtdzdIzLUNNkRT0a5DbmxUPNYqSy4WvZ5526wB6qaQm9PNVUslz116HfKpQC4AXBDulS
	YhVfov6h6DpT6AX4SA7DZ3gXL2KHTeMKrWbx+pKVkP91fNcqJ59SzHetUujANmY2Bn5Prr0Dspb
	kCfPKEpz35kbz9irMYNFsJGuX/ZUI75681ui6B9VOA0iq8WffrByIdTVWyBTR9sbEQ5O4HIgSyt
	7poQKsQL9ys9hMiqrEik5iFFE8KQgDcaeS8N414ScUE5onxQSQBeIiww5hkcNCcfBjB2KiqBJMk
	KrgVygsfJo1rjVQZ7sSj9qA/2Q3JLUIpZ1xC58L9YZv17joI=
X-Received: by 2002:a17:90b:5490:b0:36d:b12f:6143 with SMTP id 98e67ed59e1d1-3752177f893mr6537006a91.25.1781072559146;
        Tue, 09 Jun 2026 23:22:39 -0700 (PDT)
X-Received: by 2002:a17:90b:5490:b0:36d:b12f:6143 with SMTP id 98e67ed59e1d1-3752177f893mr6536975a91.25.1781072558830;
        Tue, 09 Jun 2026 23:22:38 -0700 (PDT)
Received: from ross-pc.local ([2407:7000:b06c:d300:82a9:bf58:ce21:a41d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37645c1aeb5sm946176a91.2.2026.06.09.23.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:22:38 -0700 (PDT)
From: Ross Porter <ross.porter@canonical.com>
To: linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Cc: ross.porter@canonical.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Brett A C Sheffield <bacs@librecast.net>,
	Oscar Maes <oscmaes92@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] selftests: net: fix file owner for broadcast_ether_dst test
Date: Wed, 10 Jun 2026 18:22:28 +1200
Message-ID: <20260610062230.71573-1-ross.porter@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The broadcast_ether_dst test can spuriously fail due to file
permissions, depending on which flags tcpdump is compiled with: If
tcpdump is compiled with the `--with-user` flag then tcpdump will
step down to the provided user after opening the device. In this
case the test fails due to permission issues, as the output file
is owned by a different user.
Debian ships tcpdump with this flag enabled, so this bug
appears as part of our kernel testing.

To fix this, we can ensure tcpdump remains as root (regardless of
whether it was compiled with `--with-user`) by passing the `-Z root`
argument when invoking it.

This is my first kernel contribution, so please let me know if I've 
missed anything.

Ross Porter (1):
  selftests: net: fix file owner for broadcast_ether_dst test

 tools/testing/selftests/net/broadcast_ether_dst.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.53.0

