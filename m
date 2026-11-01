Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793529156;
	b=3bcwzFe/bj3T28Vh/KMDQOCs1EoJh536x8w9ewn1xCW9h/Z8ESYFUS2z91fT9mQQD/IZ
	 VuQNN6vfH//r2Y4voO3uLHYzitXvrhAPwXRUhvOhwo4Xew2SXHWPRlf95Uk8UjwYuaoMp
	 hxCAOmJ6GsOS6Om3Xw78u7abU1V4/3A/25QW0eDotoxLLPwVbnIt1iBmklPK8vP9Wik+A
	 ham/J0O3t+vLy8d4zI0DcJvzgxksSlrVw6HoPYhTa8qPrt2ZHYh3gLvYjLOvK9ZhF4HB9
	 /5cmNgla0fZzqznRkc7LslWslsnHfIABo3YH8Fn87vKqZWH2/lwsnWyeD66On1zIuoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793529156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u/zxI4CzMoBvyHkNRptWT2GXXsMEz4m1n2MgjkQARrA=;
	b=AAr2qgFFJyReFibGTKOPBvA7z7oBD4ip7cfckxjTANtZoCtDZe4peFm9AiAMUGB/T5j9
	 w38BXrwBz4+9H5gBZWD/b8AjluzCKz9WaoUVvgLhmnkMfqSIahJZanRCc5hUhmiC8ONHu
	 eXSmYQGtpZYUNzj3mgcHDdthNGNOu5dTt5LHyKDzI/EzxpsmPVbPOpzVINW5k/r7F8WqB
	 hL6kfqZrx7RFg4qkhDmraReomy1crPUPpw+goP/pRk63lFt419PL61OPpOZC7sk67+YZX
	 /9oZPUxL4w2nmd6KIdGYcK/cDk0orrFtRtD1S9kWdgrfYpZE9ImxYZg/rBle5xBEbTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=udrTcaAh;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866D9606A325
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 10:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 866D9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=udrTcaAh
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-33e48934fa8so737902eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 02:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793529155; x=1794133955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u/zxI4CzMoBvyHkNRptWT2GXXsMEz4m1n2MgjkQARrA=;
        b=udrTcaAhR6lTPvX6nytrMjhk3DuWqeWdJyxirvGnilvZJ6Po7seTbDjGHZSb+tTGV8
         lRA7hBsky7Yi4F8BdF8VSbpuo4XOFddA0ePcJc5p7crrbKkktIXPbo10Wbt5Qh8a1AOG
         IlvkjfxsaiwF7JjASnxoQhxDgLJkF1Mu8jiSrY8bz2wGuMkEyVSG/tIlfSl7ubyxpheI
         e91DXqljQQIbTTHvzuszzdztRClpLuqpZ7/vgZC/YsGXHjYZxQrt9cGJVASw8b3vFx7D
         XIEUDOi0sUhTkxObCds0b33AIPGsRsYCUM+NMPIs3GajcyhcnUMCsagg8FLLoJ3LkJjY
         rVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793529155; x=1794133955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u/zxI4CzMoBvyHkNRptWT2GXXsMEz4m1n2MgjkQARrA=;
        b=fiLazHr+VVlZ7hHHHEMzB0i6ANH+n2U8sMQizEV8cfjQb6RGncCW+349iRrlANl49m
         y4yG1+zDY8cKULQGs4wXMX81/38kMvDkRoKy3Gu8MuznHbYQcbu5yiG88sG4fghOlCvL
         yLruE+N6HLixAU/lu3/+OBZamMCbrtFLzxfBNKiv/UUEk40g6oWMOtckGnsPlDG5ED9Y
         HSm8nh7dzP6hM/ZEVrxx0DYWNVc726ITq+E1WN+XJsa3dBB9XuZfqs4aGT/MB+b9k3nx
         agX63SM4ssXlnoLcWs6gXfs0GGJ834Gn9lIzxqG4qulnpxK2HWTUVOG0ZMEkIPxrBsDK
         oIHQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+FOmcHNr/lQZFuV8bNkLbMDJ03940j75PNLzRk0YRItaPY6MMfp0s50V10RzzsKVduM57D3AwIZpzFbSgL1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S8UCiVuYpmrr8x7JKtOBIvm+LkR4mWoWrYPiRfgv6y4lZbZ4i
	mfz+YllXdJ6QjYk/CYCg9wO0iRtvEhbPEMeKSfOWCMu93aCqmvDnC2UU
X-Gm-Gg: AYBFou2ckBbz/wmloAluj2uzbFNE7t7BL4o9kg4Kwb+nD2spwA/HUVD8rY9v6e/zCyD
	kNJ7wEu0thGZqmDoDOuAo6jHFyv3P0i/NDV0VYU+YIm41iN/cKqFU8YE7salQ2qpLGSU7vlF7Kd
	BTZhZYydOkeOG7fGi2nNtXhOrTN8hT8bLl9YGmuf05Y5LUB/GngcfNSOEdl65EpdbHZPB131TV6
	R4Q3qDyeknnDm1td8c8BQDaGceeV21hVBh+7cH5dUzwl/2LYrWjr6MtXaWKINoLyLa4JReAV1uX
	9rz9eg+SAaV0Eabveo8wNC0BD8aK22Ly+o+mFD0cDuqghqzxIKXpVpADLHNNCCS8hQWX1KtmH5Y
	saR68fux5cxMILasKW3piB0er3dBRzP7T/8tAVfwaP5HObiOutUTgvZHxiC048cF5uC8KD+S844
	kNfPuIzOCIfa/uAgtw+Rw47wYBWHeHgWO9V3T0i6PpnJQaMW+m/ShijLPASFl1ISe86+Vl2YGAx
	fI71uJ0C43T8Jxih8/RCnN5oc4pyikREtFfVAIXKNewqk2m1ok2sDQEEn7sYih73gYdaMp+r8kV
	Z+86QjDenIXlljoxeWoYkbdJ4JI2WQGoT/jDdHk63A4RCUjmFQPlOaAs
X-Received: by 2002:a05:693c:2512:b0:369:fa7c:aee9 with SMTP id 5a478bee46e88-36a423f54a1mr10402589eec.19.1793529155071;
        Sun, 01 Nov 2026 02:32:35 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm25242506eec.6.2026.11.01.02.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:32:34 -0800 (PST)
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
Subject: [PATCH bpf-next v3 0/3] Normalize enum values in libbpf and bpftool
Date: Sun,  1 Nov 2026 10:32:18 +0000
Message-ID: <20261101103221.51534-1-dennylin0707@gmail.com>
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

This series fixes enum signedness problems in libbpf and bpftool data
dumps using the shared btf_enum_value() helper suggested by Alexei.
It also uses the helper when parsing enum-backed map fields, where sign
extension can change the requested map_extra value.

Keep existing enum name matches before considering normalized values.
This matters for eight-byte BTF_KIND_ENUM values in both dumpers and
narrow negative enums in bpftool. libbpf already zero-extends narrow
data without kflag; that behavior is unchanged. bpftool preserves the
original name's priority in one scan, even if another enumerator matches
the normalized value.

For an eight-byte ordinary enum with kflag clear, a stored negative
enumerator can match both its sign- and zero-extended values. This is
a compatibility choice: identical metadata can describe either a legacy
signed enum or an unsigned enum.

Unknown bpftool values follow kflag. With kflag clear, numeric output is
unsigned, including BTF sanitized by libbpf for kernels without enum64
support. This changes unknown negative values whose original signedness
is no longer recorded. libbpf's numeric fallback is unchanged.

CO-RE is left unchanged. Clang 14 and 18 emit a zero-extended immediate
for 0x80000000U, which the current sign-extended orig_val rejects. But
using the helper directly would reject negative enum immediates from
Clang 14 objects without kflag, and would zero-extend negative values
from target BTF without kflag. Those compatibility issues need a
separate change.

This supersedes the pending libbpf patch [1] and bpftool data-dump v2 [2],
as requested in [3]. The already applied bpftool type-JSON fix,
eaae576c34d7, is in the base and is not resubmitted.

Changes in v3:
- Combine libbpf, bpftool and regression tests into one series.
- Add btf_enum_value() and use it for enum-backed map fields and data
  name matching.
- Preserve existing legacy names, including eight-byte ordinary enums
  and ambiguous narrow names, addressing the review of bpftool v2.
- Add libbpf data-dump tests and kernel-backed bpftool map-dump tests.

Validation on ARM64, GCC 13.3.0, Clang 18.1.3, Linux 6.12.68:
- Complete libbpf and bpftool builds pass, including the libbpf ABI
  checks and bpftool built with -Werror.
- With the new tests on the baseline: 38 subtests pass, 8 fail.
- With the fixes: all 46 subtests pass, none fail or skip.
  These are the btf_dump and bpftool_map_dump test groups. The bpftool
  cases load BTF and maps into the kernel and check both CLI formats.
  Run these groups with ./test_progs -t btf_dump,bpftool_map_dump.
- map_extra parsing was checked with a separate local object-open
  harness; this series does not include a selftest for that path.
  Arena allocation and mmap were not tested.

[1] https://lore.kernel.org/bpf/20261031233219.9362-1-dennylin0707@gmail.com/
[2] https://lore.kernel.org/bpf/20261101001024.9994-1-dennylin0707@gmail.com/
[3] https://lore.kernel.org/bpf/DMJG1R2YIJRK.16CZLV9S5U7Z7@gmail.com/

Thanks,
Hungyu

Hungyu Lin (3):
  libbpf: Normalize enum values according to signedness
  bpftool: Preserve unsigned enum values in data dumps
  selftests/bpf: Cover enum signedness and legacy name matching

 tools/bpf/bpftool/btf_dumper.c                |  42 ++--
 tools/lib/bpf/btf.h                           |   6 +
 tools/lib/bpf/btf_dump.c                      |   3 +-
 tools/lib/bpf/libbpf.c                        |   2 +-
 .../bpf/prog_tests/bpftool_map_dump.c         | 180 ++++++++++++++++++
 .../selftests/bpf/prog_tests/btf_dump.c       |  84 ++++++++
 6 files changed, 302 insertions(+), 15 deletions(-)


base-commit: a30c772627b2ef4bc715332b1b04938a914556cd
-- 
2.43.0

