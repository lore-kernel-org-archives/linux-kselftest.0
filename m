Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017256;
	b=Fg9AfDCjQ9yfzHmvkSbzvmbh0RwzDa2ia/3vw06bVS7Q1AyELPzt3nNuRyWouVAdoL9k
	 iG4+BpbQD03ytaMwCcVFgY0Ow5WjLH1GpoV5wUsByURccV19U4wW/SXdP0IuemMkPaSoM
	 2+kddXmzlyf4G0zzE6V5asT7qDo41NnmFbyZ81TX+IaaUkE8GN2u/ZFiDqDL5HrhELscQ
	 0f1FGSIXnpYb5oeHK/l62AeAxpe19MNrlh0OKhKtsX9H2a6mdNZ6Hk5g20q0f2xPgeriS
	 DkPHQmiKMLk7VFVosPo1cW9sR3Llo1Fcs+MnaWPDRoamroyEcY4iN33pRYm+yjrp8zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uXAs2PZ59auU0l17XbEdgEnM2qhJhw52BVoeNXNAnlg=;
	b=HHpbbZNpiAXhSaer4a4LjwRMC28cJYWVxawuNN55qpgK1/xwSe01ciLOBQmwyp1Gttt+
	 prteVoMCkLcoYG4TkqQ18/pkurRoOFlv0acVbSWQbnPqNg7MiQ1PqbtxDwtEYcwVcvIZ/
	 oKgvVS52A2S1w43FnIJKepJY3SRMXa0aZeP8wS93Ft7am0PpYiBe5Pdl0NU5Ki+BuyPoC
	 5fqj1nDBCwAuCjjdYoIjkXYUPPevSI5KZIdycq4THNRdlRJj3k1NRjkNEpm3aVErCwIja
	 yiY/fImPUQTsNvpeWFHaaiDbJDP0MbRWABKwa85BVU0aIj90+YcO3spCP9SKX+rgBTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hI74JhRc;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B74606A32D
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 02:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14B74606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hI74JhRc
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36f936424f2so522964eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 18:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017254; x=1794622054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uXAs2PZ59auU0l17XbEdgEnM2qhJhw52BVoeNXNAnlg=;
        b=hI74JhRc+ABeO4innCbd2/hKTAiebOQOin2Ez2KNKhPdZau1OzVsRRAgtseleZMrXn
         uL/5ddFLJ7aJ6jPw54WWnXHNI74Ke3L5BoR98U9XWu7CVCiXyWyJ5cVKGcKqWGC353ek
         kO1kJWzHeLQjJzUOY4zQ0PmQe6iNQBvENYmsU2lEG2X+FAf10mhQ7k29DkIt5uu7o0L1
         /SAtErRezrrwUA1t1P4Dj51YTuwNs2CWY4CW2Wxyp03H2vz4IcsJZaHikRQFiOYaGn3x
         1T5pawToanmyl53/fh0H/MHDXAAKff9GTHvZD1YEFz8aIIbYTxQ/vhHkpeqcA1fdO3aB
         37IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017254; x=1794622054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXAs2PZ59auU0l17XbEdgEnM2qhJhw52BVoeNXNAnlg=;
        b=rMC9DwY9zILCr1VNIvpxYiccp0vEg0qMF6//7ffK4LqkolAgobuvPTWDC4hOBrwOZu
         RveLTAQpbj7euX53qwECTNVHDszAqS+pr//Blsw2spzHSJML6uIlAmyrI1yTvcNJibnU
         S95e3UGsQosiHcmrrtphYV2mr5LGqglenbyc515aLpBVVUJTPolMy3JG5aQ0e/yYClM8
         GLRwr3rKxfLwNEO931d5q+Qqdk1HEEz8sVk6oc785vFo8bunEltb3JOFWi3LUfG6GIKw
         8xjFK2z1g5HyChMU21sjZ3dT2wWVmaulWcwX5J05oExkzfXcefBuNfYiJ/jSYPsPzueu
         lofQ==
X-Forwarded-Encrypted: i=1; AKwUvByOW7rRsS4ol+ArZJPitrWjPwUJMbOx1QDRck5nh8MadxAMtwDgQPVF0xL9LRYzRLXa4YlHrl4dyJzMqNfaohE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LnaqmFMykzlMmJz6ffkgCIsIebOHGo+cDOYOikh2sSXyb21oy
	fMb4KhPvPnbO+yjLGM6pFN/IVp+eS4fuS8BIXhlVgGOFz0OjfzK8uf9y
X-Gm-Gg: AYBFou1FK2Y2hebkPJn9hTXAqxMfwo8+ZTnEPOx9fSoswnXumT4NH7tgOBBkQWI1RSP
	pJy60jmHh83vXqRCuUA7qzklhEw30RuCOtHNMPjzNo+K9X0EGlB5hu09rLIktN2IedOLjODwZFF
	8Hc4dkgVWDqVbWUMoEQ427uvFc+CzN3JxrdcyuahDtzZV+PH8MdYrpXCaaRREIPz+bh2M08MmiI
	6cBB52Px24M5pxHQSyXTRSIe47PrW5w/vF7wYvxK+brNYYqpQxwjK6gTl8eOp3svbtyGtAt5yp/
	ruaSXrn3X0DX9nyBgSqdrKuPW592vHSL4FXiZVxvWGZsT8MTYqgwWdPyeP1+1Zms87dNnJ53gPa
	8RNHmzDxU+Xc3L53os7mBkNsuBiI1fW3NPEgBmOTHpJMftLUbcrJlTFWELCVakU1xluF2anRsxj
	k9p+V8GSBYKWTN/P6vN2B1XSeMZSSOQaK4kwO5L0psF9jS1GSByvCEicEQtvWcQUEy3pFuhev4M
	DaEjGLr9vtZgDLa5QfwyedK7Q6vUpBXytOXA5FWZ8jCuBZCwPT5ABnOJMmB95G2c9gYosNTRhDH
	05PlUXF5fAtiJ4LCvw1d0hihf8e++n7twb4geHyETRygOLa03WqkdH6rauUgjao1cdPLkRy21P4
	2Vhprn8l+H/3915m3sjAwK9lTTrhm67lLW9YGqg==
X-Received: by 2002:a05:701b:2506:b0:1a7:d426:6dd2 with SMTP id a92af1059eb24-1b25d322b55mr4739572c88.26.1794017253925;
        Fri, 06 Nov 2026 18:07:33 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e485ce2sm9338497c88.7.2026.11.06.18.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:07:33 -0800 (PST)
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
Subject: [PATCH bpf-next v4 0/3] Normalize enum values in libbpf and bpftool
Date: Sat,  7 Nov 2026 02:07:22 +0000
Message-ID: <20261107020725.36675-1-dennylin0707@gmail.com>
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

Changes in v4:
- Return __u64 from btf_enum_value(), as requested by Andrii.
- Rely on kflag for name matching; remove legacy comparisons and
  bpftool's cached match and priority logic, as requested by Andrii.
- Remove the legacy and ambiguous narrow-alias test cases. Keep signed
  controls, unsigned names, numeric output and width-boundary coverage.
- Add an open-only skeleton test for the map_extra parser.
- Drop four libbpf numeric-fallback cases that do not exercise this change.
- Rebase onto bpf-next commit 3e1821848412.

Tested on arm64 (Linux 6.12.68, GCC 13.3, Clang 18.1). libbpf and
bpftool build with -Werror. Without patches 1 and 2, 9 of the 18 new
subtests in btf_dump, bpftool_map_dump and map_extra fail. With the
series, all 18 pass; the 23 existing subtests pass in both cases.

v3: https://lore.kernel.org/bpf/20261101103221.51534-1-dennylin0707@gmail.com/

Thanks,
Hungyu

Hungyu Lin (3):
  libbpf: Normalize enum values according to signedness
  bpftool: Preserve unsigned enum values in data dumps
  selftests/bpf: Cover enum signedness in data dumps and map fields

 tools/bpf/bpftool/btf_dumper.c                |  23 ++-
 tools/lib/bpf/btf.h                           |   6 +
 tools/lib/bpf/btf_dump.c                      |   2 +-
 tools/lib/bpf/libbpf.c                        |   2 +-
 .../bpf/prog_tests/bpftool_map_dump.c         | 162 ++++++++++++++++++
 .../selftests/bpf/prog_tests/btf_dump.c       |  77 +++++++++
 .../selftests/bpf/prog_tests/map_extra.c      |  19 ++
 .../selftests/bpf/progs/test_map_extra.c      |  12 ++
 8 files changed, 293 insertions(+), 10 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/map_extra.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_map_extra.c


base-commit: 3e18218484126afb9da722080659c038cb2256ab
-- 
2.43.0

