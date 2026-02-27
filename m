Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1CA346AEF
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 16:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210449; cv=none; b=u3q3FecilOSwJ861tlDs75Uss/lB2cKC1J8wwW9LhPw2N5LwhDeo8zvSOanfw5jEzxN1yGmrJgk/NG5CT3bQljCsUq/s6ohrH7YdDflCP4xVAqG17CBKcZQn4KXobSr0bx7mysaoVGaWiWfAmtQd79FmJTVSWgJa0Lim078PdGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210449; c=relaxed/simple;
	bh=4Mty48+/NMm2pM1VrZeYRZPJ4CzqBPTwcCf92RhsF/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AHoE5J/qCYBLTJkiio+lvm+r9Y2bRJrRcLn9wP4ZiPWREjRkuDmYj89UV0mGld03F5l3ml/nMm1+1defqtIR8lkuV1FeWrai1Wy6XBIv9cv1t+5sl0T3X8zMl0uHSEeVk5rQV7xpvHkeVg2dS+ylLZmcKU1RR150pbO3ttjA/WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8N4LdfE; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8N4LdfE"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bdcada445fso1336663eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 08:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772210447; x=1772815247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zOxw5RpgBFDN5Zq6jjIzB5x8gvJLjX55MjawpG9JNE8=;
        b=Y8N4LdfExCXopfzSa3LihtwCuxv6N585sQkD2oYLryOJTz+Lncw7Ot4eJdbzfmew+I
         SlX7VP+6B7V0jJfrRNdE+UOrsB4stsUytdI9PaDb/Z/MeqtlKgdcjkgDLa7glyH5s+/5
         JgYVBslKzTehJ3OAr4Dkvw8UJb9pKXmZmRdgcs7fK5veWRJhzK+A/pGLyPLswh9DzEWK
         Q1L+yMdSDj1yvSqnAexHgEdjxnPLZwMs6XZ2wL2gUo2vfXd5zuxItr+KFvraoqZbgaGq
         p1h+QYnoJeH15q/br1IiRKaIQ2s0SvMksbBG2pg0HTck13qa969vIwlFZpH0m2PYtFHS
         RuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210447; x=1772815247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOxw5RpgBFDN5Zq6jjIzB5x8gvJLjX55MjawpG9JNE8=;
        b=gUnzWnSySePjm3343y5NqbucQYvVXIfzKGycX1e4VVg9RPpJRNPL+55enDsRqPOKR6
         iSb33AxTK+BAbrkmp2hSIKRIjjaN2xowejBAl2qiHmFzpr7W4jgUW/wK9rfcCZh0yhMn
         kzR7LuJ7fQHmBf5SigxH/sbwfKJJgxP3nwXICao63BsIprTtTbGn4an7nrod60fI/t27
         R0gIWacmi4ZO3qyEsIK5lyQoOMnw9TMoFO6DW8eX87EBEppuvEW+rzR32+jTMEwflWfq
         8Zxpz6qXHHXr0opFyCFsPr+6euHVHN+5vItGkKJDkTLVVkbazThDmQnjfnddeV8ClmPi
         JT+A==
X-Forwarded-Encrypted: i=1; AJvYcCUmWMxzHO7EsLtwOlbHmEtLo9kh9r+g1qGRu1+jymsahJAEMlPXyZB0w+DfP8iGZxNQiR5O6kn3dzLsYqs7+K8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaJuUEhvYFsK3LOJ32G2oeZiiVLHh82lhS+vM2i73pxhbVxMce
	EbVmmWAbRNDXoMHt0SZRK5gYZfJHbUJEPwwxYACPSXZvt475feKdaza6
X-Gm-Gg: ATEYQzwwtEs3g4j5RsQeMG4DW12lKHtPMvtWPcHxSB/2kGGmYTAMVNcaA0RgJUH4JDf
	JvECEthWRGkriILBwkDNXh827ANA0249sgokIFbeQU5pR4tP2KYd7tsiElrV/VxovHosw/HgUhX
	AZYXXxlhV65RXUOgjfM/IlfPbMBGU005xx9WEdi6ZADsYG8PDmC1aT7qalOhMMzLYI+SOjhowhj
	iV7JRckNCXtQ0WYklBH1p6EnyV1ZhjcMQAzd6lRWSL5/GnwbDlNiwuqY3zlPlA0eopn+Gsv82Sm
	+SLFng4FZs974FvWjUZwoA0VsnxtNB5pz1y7S3Y2Q7wDvxJaE7AXn8fw0mbL0z17dPLCgx2qA8F
	WyLhz41vaZ5AxUe9TB/SYjXf5XVmI+R75uapIuGTFl/xiFYm8YBSe4fY6OsDJkxARWXV7JYgGk+
	M7uPB4wmYVK9I2aHJ6SBwsy12WJaby0aFj0UA6Nhd/umk48IGt9y7sTNESHG5g9pwXla50HYLPB
	pKAJ5B481QX2Gd4lHEBC8vsD/g=
X-Received: by 2002:a05:7300:a284:b0:2ba:a387:92f6 with SMTP id 5a478bee46e88-2bdd0fc8189mr2558964eec.13.1772210446551;
        Fri, 27 Feb 2026 08:40:46 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdef9700ffsm220707eec.28.2026.02.27.08.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 08:40:46 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH 0/2] selftests/bpf: fix bpf_cookie failures
Date: Sat, 28 Feb 2026 00:40:35 +0800
Message-ID: <20260227164037.84110-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1/2 skips kprobe_multi subtests when bpf_testmod isn't available.
Patch 2 makes perf_event triggering reliable on slower systems.

Tested:
  ./test_progs -t bpf_cookie/perf_event -vv (30 runs): 0 failures

Sun Jian (2):
  selftests/bpf: bpf_cookie: skip kprobe_multi tests without bpf_testmod
  selftests/bpf: bpf_cookie: make perf_event subtest trigger reliably

 .../selftests/bpf/prog_tests/bpf_cookie.c     | 29 ++++++++++++++-----
 1 file changed, 21 insertions(+), 8 deletions(-)


base-commit: f4d0ec0aa20d49f09dc01d82894ce80d72de0560
-- 
2.43.0

