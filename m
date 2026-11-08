Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794106620;
	b=5FIiqnhjNzZi8sWhMk56ULEP/O24ddK4ihe2bFI9QnpJUroYakx1+2qKeNTU0kzFsB3X
	 nwQwE0SuMbbG+NfkeMrz/V0Gc8kMPkug+QmJT6fUmmUsii5fzG+MoV3kiUPLT6h0OaqgV
	 eWBWnxiVhz0iwyPXerA2tfV0bpwIyPjOMWwYsIJs5EfmS3vBDyxMcqyCWm364dtXmuIoU
	 PWKMAbI0WbV3bQWpMt421yPh3oW2NNqDWZHuvymbXU7n+keTdKnEMV3LWbenj5r2OUsRb
	 6jNBNYCUP8h5s+jCLNkVFwWZe7hAFxgWSUYF7VQlmN2i9j9SYZIVnC/JL5yF4GXjQHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794106620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E04mLJ5cyGn2rFsBTUMJxpaTlzNgjDYYX4TRN56eccw=;
	b=pjd74AWHwadcuOaFlP40BzrF+UmzuM0zO+7cBSn1LWGmsp9eetzzCfZ0rZzpmqZP2Vha
	 q6R1ovOpF1D2a9W+crr5mYwSy9XGejn1qtDC/H0j6xmz/uOJ5mUoQ/ZxsfV2wXL93St+H
	 IwW+uOX5flp5fey1EeZ24DMUbxaTKaDZ4Pxcoy87jEdnmUxcx2cO9vPKHzddQ/DbviTET
	 2hlHnr3Fp8Yrxp8Ut+4aIDwjp5jp8u421Lvw+SONx/qh0090Mr+JeHeBSc2776kdRdgHf
	 SU5Fip0EjPgoGDlk56ZPGh9CmKTCT0QMwNIHptNEq7QXQSUpT93SjpOPCSSoWDkv+IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q8e7WddY;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CFB606A31A
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 02:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64CFB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q8e7WddY
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36c9b5c6faaso103640eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 18:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794106618; x=1794711418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E04mLJ5cyGn2rFsBTUMJxpaTlzNgjDYYX4TRN56eccw=;
        b=Q8e7WddYBnWleL3P47dR3Wp7PPUMMoIn1ju+iqiDFeTnRaX40Njq0tIFZtyVpGGg3Y
         TWs8vMZ1MrtKD+HkSkZM+WWm417y3jImr1XnZd/LxS9i6i1pyBydBLNYZUubGacSRTqI
         oJaA//jEzdTCGzPZRd0mcoQh7AMwaYpyVJ2hdNDvfanp5eAy3A8ObebMD9ELGSFnMYah
         QLjj7MxggM8zyQc+6HvxvlgsMif09/xkJ8lrp9LZfLmc1zd4F1IEyRe4CqZ0iCXpEE9k
         ezBmisvubRRtft+FiMHDQvLORK5f7AMqA4YXx5IC7EHU7B6TvmY6MdObhdyPDppAmeL4
         zx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794106618; x=1794711418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E04mLJ5cyGn2rFsBTUMJxpaTlzNgjDYYX4TRN56eccw=;
        b=V8pNrR4NrPdUAYpcriJ83IZFGQiWXtgxqP3sQs/rmwN4TkpNzVjqVf2hIDPGsQB+Bd
         i3fSPPp4z+qpCJN2hGL+xyFU9fEv1IjFR/waBY2PYRFTVh/GCStaYP1NruvGr9sj7sKB
         XtnCYnqTLSt4jqLRqfQrTRRHim68Q3vKrd7GuCT1/PNB/J9U1GRqHdCQ0rNvYC52hJ2W
         JnMf0b7e1tHLl5Je2u9DS8YYBpwqfYND6q+aKv9XHuo6ZgVeOg5fmSexai7kVGVLyZ4u
         WxwRgk/W89rPaacC1RObLLzQgWuvk6OWH5GGDeB5zsIIGtIrBiqWqkcixzFxcUFgWcXV
         Tn5g==
X-Forwarded-Encrypted: i=1; AKwUvByHm13RTSzZ74X6QvVKMZ6owyPReZwvNUD2zHL6aip3XopAELUVGoYc5D0MT8iv5fkoGq+MCQ9tSH/tah1W3tI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+H+xyfD9yWYd0sJKLxSe7y8P3wA8vVaLPT7QNtHzhFdwOjGnnC
	0WrPYX5ueqPfH0l/lxk64PXR7kBz0ISlq5hgW8+kmQ+D9M+DlXt7vg56
X-Gm-Gg: AYBFou0PuVhGftKMCvR6HUwadLU7Z3sYepJSeLqfjkLfUzcwR0L2VNizmaLg2IyT6FA
	9myjKRyGGZE9EaUOcj2UQpP8owgSIxgrJIkHKLGNFuvzpGekwIznVeYoS1+pPRc+1VAf3wvbCnQ
	tuIl+k7rUp0ONfiUn1zZcCALgTtl6cm4ziStXGkn4y6UNhrtUiWh7lajw6fvP+RLnKt+pD7VKdv
	mtz0QweieSCm/t+KC3IatYHfFl3FxMKEpKjm+nGL2ei6W91n/8MrH9wVHrLkvduVxrvMYW21RnS
	1m2nMM8CJIInfMdJsJEMsk6XKS9Mnj4ixMZzznZZ/uRHrJyowNmS5r/BPMpt0TYAv/f0o1pdENe
	K+g0Tvtlx12ivYDSvqBQCU8lwwVyJAD0vjrvalfMv0UNcA8qcRayRL/3CACBd2s1jWSZIIk4+xB
	nqNFmEpqAZ+q+bzYBa76YfNi5UmvdxKLEOfjKlbVBn6qDPvPlc4eMJTZ//8yNGmxkY/lCBmpLwr
	D893/F2S//p1CTWLqYndk9SXH4cad3jWQ+RPAk+gy1AQ0dE32RyPgAuL2BYZQhdkBf43ErfNUXU
	OSPjQiSohYI5+rIR9wEpNhHyFbfEqs2fQ4xBNamc/Hhwg7zg5S4SDhI5he/2W0roYFH1zkCin2v
	V5E8RBjjVKie3TpRPz+GYWefbov4+HFoI3I9prQ==
X-Received: by 2002:a05:701b:2812:b0:1a0:b8f5:872d with SMTP id a92af1059eb24-1b39fe2dd6cmr598906c88.4.1794106618351;
        Sat, 07 Nov 2026 18:56:58 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3773ea50asm2241202c88.23.2026.11.07.18.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:56:57 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: ast@kernel.org,
	bpf@vger.kernel.org
Cc: andrii@kernel.org,
	qmo@kernel.org,
	daniel@iogearbox.net,
	yonghong.song@linux.dev,
	eddyz87@gmail.com,
	ihor.solodrai@linux.dev,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH bpf-next v5 0/3] Normalize enum values in libbpf and bpftool
Date: Sun,  8 Nov 2026 02:56:29 +0000
Message-ID: <20261108025632.10799-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes enum signedness in libbpf and bpftool data dumps
using the shared btf_enum_value() helper suggested by Alexei. It also
uses the helper for enum-backed map fields, where sign extension can
change the requested map_extra value.

Ordinary enums are interpreted according to kflag. When kflag is
clear, values are treated as unsigned, including BTF from producers
that did not record signedness.

The helper returns __u64, consistent with btf_enum64_value(). bpftool
casts to __s64 at signed numeric output. CO-RE relocation handling is
left for a separate change.

Changes in v5:
- Keep patches 1 and 2 and the map_extra test unchanged.
- Adopt the bpftool and libbpf tests posted by Alexei in the v4 review.

Tested on arm64 (Linux 6.12.68, GCC 13.3, Clang 18.1). libbpf and
bpftool build with -Werror under both compilers. With patch 3 alone,
the new bpftool_map_dump/enum and map_extra/enum32_high subtests and
the expanded enum_data subtest in btf_dump fail. With the full series,
all 25 subtests pass. The 22 unchanged existing subtests pass in both
cases.

v4: https://lore.kernel.org/bpf/20261107020725.36675-1-dennylin0707@gmail.com/
v3: https://lore.kernel.org/bpf/20261101103221.51534-1-dennylin0707@gmail.com/

Thanks,
Hungyu

Hungyu Lin (3):
  libbpf: Normalize enum values according to signedness
  bpftool: Preserve unsigned enum values in data dumps
  selftests/bpf: Cover enum signedness in data dumps and map fields

 tools/bpf/bpftool/btf_dumper.c                | 23 ++++--
 tools/lib/bpf/btf.h                           |  6 ++
 tools/lib/bpf/btf_dump.c                      |  2 +-
 tools/lib/bpf/libbpf.c                        |  2 +-
 .../bpf/prog_tests/bpftool_map_dump.c         | 76 +++++++++++++++++++
 .../selftests/bpf/prog_tests/btf_dump.c       | 20 +++++
 .../selftests/bpf/prog_tests/map_extra.c      | 19 +++++
 .../selftests/bpf/progs/test_map_extra.c      | 12 +++
 8 files changed, 150 insertions(+), 10 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/map_extra.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_map_extra.c


base-commit: 3e18218484126afb9da722080659c038cb2256ab
-- 
2.43.0

