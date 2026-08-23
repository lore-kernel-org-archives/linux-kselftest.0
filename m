Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EB6242D7B
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 14:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787494662; cv=none; b=RjcV4rMT/S9b83RvUlhDm6uxg3BOlU0HzeZSa27KKCpt5zz7MEeFYzpr5to/w/YmOI3BTtqyRz2G1lFFhY+GAXCZBQLABTCw4YQyMOJ3u4eCUG5oHVnhrzrCjt2dL2jEoeCinu3PtzbBCM35Lz+jPWyp9dXooeOvTKDzX/CrNGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787494662; c=relaxed/simple;
	bh=Vg7chm6Z3ZZ80kKMcLsPZtpP1r31vdvD6SHVm4f5dT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOdTsmeflUQrGPzB3Th0QhjhS2x4HxyvMSaghLPOxaDw/aZ5AxYX0ew9/MhUnviigNYcQbO3peGjGwNZioKt9FxGtGydS/S0d3iObu6Bc4G1eP4Ff0bSMFBxVp8MFuUpjMgOYAtjz9Cqxg1vEH6veK8gVFePg44+py0EdKf0H2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2ccc2e84048so9727345ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 07:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787494660; x=1788099460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iW9TZy5t7X8VGYLC2u3VxtI7rFgsxhmuA9rnPKoznsM=;
        b=REM8J6cum7AfCBa2fIiaeB+a67KsKo0LArLT/tO0FKR+MXGR+GI6j1tmJ9pCuqxNfb
         rL6SQU5orAUs+9KQbVe031TZaTK1haci8YzaCLEqFm1vgPe98OtUQ5fSzzemqOZ5TXzf
         9dBD4ldqx8Q55CwsXSysNKSfkAeONpTheFwXxml05mxm9G1gXfwEbGeLaFn0r7sgC5EO
         Fz1c+i1rqhdjDQh7mRb/4FwtopkV1ZqhtVPRGfw5MG2JXAMELRd/kgnZtapUL8aTsORE
         xgdQPly+VatL1J9YEfBboPaCcRlESn6LhgAA+/dxrWc5grP2vyMOVeNP4SuV3atWCYna
         20sQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBIVgTqEt0nj9EVY99KWanb8lcrpRsNWnfgRD0wY6Rx4+CRpRx5lFHEd4ucOvuYUeHJ3Dh9i0KaJZI9kpSWfw=@vger.kernel.org
X-Gm-Message-State: AFuF++npYy1qPhiCoCN1UWtedAnIQYVwGzTm3U63PQWP8+CNJHHI1NUN
	TS/VYuQj56E3M3OQ9GadX7rk8KqrQ2lyuZ/h8RhQ7LmGzC2dl+tk+KZe
X-Gm-Gg: AR+sD106dlWbWN8Mdz2bp7eNfcxAlSMV2yDc3pi4E6SMlVx4D1rQ9dpWwYaP+3Bz1Hn
	FJh+uanoaC8d7egMTd6Udd8noQskqWpOqP9+ArNxMYDYHkiA7x6oMP7ilrsYEZdsRSGhcyD6prY
	YGciFPZg/YcMR/SDGq6CL7qbWAOE8zrpZiYaWdZfRPz8gRMsqzPUCC4Z+0+X5WH1yIUpA9ruitK
	IWN7oxBOem+I3lHXnLgi8xQbkbnLBcqT377bkSkSWSWchqY5Er5PVt3sSp3ANhfTsVCXSRtgZXq
	XsqFEjAOmZJoKpL5uZjfcEGcFdbPJvONHtz7OY9niLWOnFbVWDcYaSCcWSiXHxRJNJ3ljb6Qzki
	uudaxAFyk978iiz4ioRCZAcBv8eRuWs3bHHs6Jju8jgDxyHLacZOeFS5kvNQ94tL1ZNCnS5JzNC
	EQhhB6Vw2nvYzs4KShBuQ5r5fPLNy0ZwqOVnCXHJQy0WtA0u0VoZ2LmNP0FAkNp1oAgzKkZ3wux
	NrbgsMvnT8U8mtzfQ==
X-Received: by 2002:a17:902:fc43:b0:2d5:2f49:b3f4 with SMTP id d9443c01a7336-2d64ad9562dmr313282145ad.2.1787494659721;
        Sun, 23 Aug 2026 07:17:39 -0700 (PDT)
Received: from localhost.localdomain ([180.153.160.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676791d44sm9944575ad.24.2026.08.23.07.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 07:17:39 -0700 (PDT)
From: Jianlin Shi <shijianlin11@foxmail.com>
To: bpf@vger.kernel.org,
	memxor@gmail.com
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@kernel.org,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@chromium.org,
	sdf@falco.dk,
	haoluo@google.com,
	jolsa@kernel.org,
	emil@tsalapatis.com,
	pulehui@huawei.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v4 0/5] bpf: fix stream capacity, read, and oversize handling
Date: Sun, 23 Aug 2026 22:17:23 +0800
Message-ID: <cover.1787492521.git.shijianlin11@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_E69EAE29327E25B3548A9AF3F4FA289A6806@qq.com>
References: <tencent_E69EAE29327E25B3548A9AF3F4FA289A6806@qq.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v3 addressed Kartikeya's review on v2 and the related Sashiko findings.
v4 fixes the stream_oversize selftest to verify capacity rollback on the
same BPF program stream, since streams live on prog->aux and are not
shared across programs.

Tested locally:
  stream_oversize and stream_partial_read (equivalent to
  ./test_progs -t stream_oversize,stream_partial_read).

Changelog:
v3 -> v4:
  - In stream_oversize, perform the oversized bpf_stream_printk() and a
    subsequent successful "foo" push in the same program; read that
    program's stream in userspace instead of switching to stream_syscall.
  - Drop a redundant vscnprintf() comment in bpf_stream_stage_printk().

v2 -> v3:
  - Refactor bpf_stream_release_capacity() to take a length.
  - Fix staging-path capacity leak; use vscnprintf().
  - Return partial bpf_stream_read() progress on copy_to_user() fault.
  - Reject truncated bpf_stream_vprintk() output with -E2BIG.
  - Add selftests for oversize and straddling-buffer partial read.

v1 -> v2:
  - Retarget to bpf-next as suggested by Pu Lehui.

Links:
v3: https://lore.kernel.org/bpf/?q=%22PATCH+bpf-next+v3+0%2F5%22+fix+stream+capacity
v2: https://lore.kernel.org/bpf/tencent_C919BB32458A4DAD645A68F441345B971E05@qq.com/
v1: https://lore.kernel.org/bpf/tencent_E69EAE29327E25B3548A9AF3F4FA289A6806@qq.com/

Jianlin Shi (5):
  bpf: roll back stream capacity when allocation fails
  bpf: fix stream capacity leak in staging path
  bpf: return partial progress from bpf_stream_read on fault
  bpf: reject oversized bpf_stream_vprintk output with -E2BIG
  selftests/bpf: cover stream capacity and partial read edge cases

 kernel/bpf/stream.c                           | 53 +++++++++------
 .../testing/selftests/bpf/prog_tests/stream.c | 65 +++++++++++++++++++
 tools/testing/selftests/bpf/progs/stream.c    | 18 +++++
 3 files changed, 116 insertions(+), 20 deletions(-)

-- 
2.43.0

