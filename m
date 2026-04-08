Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11323612ED
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 06:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775629286; cv=none; b=EXnn1xgZKxFcncW4FdM9+IsJLIAKozo9HDKjjpqbtnmqNaNvIL6FonUxRCL1P3mQnDekGfeBIrTYLXr+yIkurhSIuOie8BMyni6JozPTJM0aJcD8kRo1h7oj/5yunQUtqwtI8/fR8OrBzxGRXs1QESIWOThQlVSk3rRF3fwYp2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775629286; c=relaxed/simple;
	bh=9czHdn3cQRCCZK2hq958VEPz7CMCsBt5sPas2u6WsZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PIK+XAMok1yAWueyoL52w0PEp4pgSpXR6EdEpLvVAGOb68WGez15ZLxEpHtG+9aKF3IvE8r2deukvvZpJNiXPezQ4nc3uUC/7yQRMLaZ2P6juJV8hPQkImYGzTDI/sKVI4V59C3ev2nU1Sqj0uAjaybcIR4fIazbdV1iEZEeIPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sy8LVyf6; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sy8LVyf6"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-82cdb4ab547so2880826b3a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 23:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775629284; x=1776234084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XKKwPmDWX8cwG6H9VyOfMY/VvlpvKjpyHcnABmaPaUg=;
        b=Sy8LVyf68rTTaXkYxtx22RYvgHmV71g/Hff1znCb8qNzb6VsTMWdZRH/LREsqV3CWD
         tAQnG+P7vORe0PNrfn2whfphwgNRQkRAA0ayTGzWfjxn3oEPco7a3ToN8iTJL1rAYwu8
         ROTdWDInIlpib2wvtiaOLCB+OeJZxPZzpTjRU0TN3msmhiU4vkZkFW57qLqZQvaoZb48
         nVeqnp1p4IUpzNOqzuqDdM6AzIy6m2zXHmrdKxUPCvisJ9J45pDib25IsCFA+bbE9lMR
         i+vivPv+7nQFeadJxl+1V33i6RK1++j3QfVijMlCS6TobZpPZV/dorXynS3VCbWD7lnT
         mzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775629284; x=1776234084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKKwPmDWX8cwG6H9VyOfMY/VvlpvKjpyHcnABmaPaUg=;
        b=QrVSllGW4nun/XDkG7Ai5keqRqO0KwerUvKKWGFUmjT6W5DPvK+60vXj/qXrA6Xa0W
         SszIsVtI/WPIVVicwO47n334Uhzbgm7lX9Q1yWSx0//NVRC0DyGGDG0XufAmYu7NRayI
         hbt8U74mSb+7VywIOpw88RyCJef7mcc2BlWbMeyjRZmkapi8kBiuZj6OZ4mXBI8XBfGF
         uihLVZWyRijxf7aF4RMbSkXQZTwnGhoSBN90zyWZ9CxPow2KQbozRes4DiHhMDbo72gu
         USvDQqY01ZPEGaVD8saLmOCAn7cCEDxgvGMAUzPd9cg2FMydu6YoF0HaSE1XGN1oBwwk
         ZWZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXS4vcMeUKH2SfceFg+U1yBCSTfQqA4x3EgEaBPhLjk8/IfXpoBc7wiEjAMRneyPqGhvJJC+LgWaurW1vApmg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Ok2KOFWE/MTETYu9uv/m+oj1B0aCrB/vAOyeLJN7FOeIEP5x
	WzuldDbkpuNBDgGUDV3MLNsoYT0TH7FICBs2VlIZFuxVZ9+bz4A2hitz
X-Gm-Gg: AeBDietfnDosJEFnhW0mUdwMJIztNjLCjK7Hf5Xn+T7utd9WCVmGgbMgkXEdHGmP7o2
	qs00piBo+4FIrMjjKF835059c4dBEgIO8IzKeMQ9u1GURs9N4nCeG0oDEec3TQXa6avYe6sRKFk
	dMbldBooHKo0Jrw4BkHNlSeVKsO7oh2W+yXZz+ZN2+LofEkZlYmfAtW/jVI4TY9zlb9fg1rsgV4
	ZcZd1BbkbkKcFXGeO0BmNIzXYDc930zilWxtRclWNgdRoIY2ER5np1VjGG3T73j+3GhdUtAUZH8
	0MTKc8aqWgWZwVVul0iwFFq5LWT1awjrrApIL70h94bG2T2rEAmsOT46GowtA9WMVJpLCCFizxy
	VMQUIWmmFWNHfgJc604WseZ5PhPy0lFBefU2nJrgY87ZNhKPXhsdOi6BLt8RcX1/cJUz/Opa8gH
	1dFfvLyHd7kyvWmijveB5ZbzOi/7ai7tk=
X-Received: by 2002:a05:6a00:450b:b0:823:786:1990 with SMTP id d2e1a72fcca58-82d0daa2136mr18833372b3a.21.1775629284173;
        Tue, 07 Apr 2026 23:21:24 -0700 (PDT)
Received: from 7940hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b60199sm17827638b3a.25.2026.04.07.23.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 23:21:23 -0700 (PDT)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org
Cc: daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	shuah@kernel.org,
	emil@etsalapatis.com,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v2 0/3] bpf: add the missing fsession
Date: Wed,  8 Apr 2026 14:21:06 +0800
Message-ID: <20260408062109.386083-1-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing fsession attach type to the BPF docs, verifier log and
bpftool.

Changes since v1:
- add a missing FSESSION in bpf_check_attach_target() in the 1st patch

Menglong Dong (3):
  bpf: add missing fsession to the verifier log
  docs/bpf: add missing fsession attach type to docs
  bpftool: add missing fsession to the usage and docs of bpftool

 Documentation/bpf/drgn.rst                          |  4 ++--
 Documentation/bpf/libbpf/program_types.rst          |  4 ++++
 kernel/bpf/verifier.c                               | 10 +++++-----
 tools/bpf/bpftool/Documentation/bpftool-prog.rst    |  2 +-
 tools/bpf/bpftool/bash-completion/bpftool           |  2 +-
 tools/bpf/bpftool/prog.c                            |  2 +-
 tools/testing/selftests/bpf/prog_tests/exceptions.c |  8 ++++----
 tools/testing/selftests/bpf/verifier/sleepable.c    |  2 +-
 8 files changed, 19 insertions(+), 15 deletions(-)

-- 
2.53.0

