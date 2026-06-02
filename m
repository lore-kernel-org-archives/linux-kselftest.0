Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858AE382394
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 20:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433951; cv=none; b=XVdHAnsXte4E++UrrtRN4v/hZ6aW+muZCX2+ehamfkSfRyI6fdMpzYQTf3XJ4OLGMOS0wlLULbi7MIjOd6Vaanp/ePnZpuYMWW+vPJ9R53v6+7dcjx5nhE8IL6Imktgvwjj7OEBNnzyPxKkoGPv2bhnSyZsEqJeOqleGpKX2Exg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433951; c=relaxed/simple;
	bh=+jtKDsdspxU/PcXSW3DyLJRlMvpgXNbAEVECdmHVt7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IxmzbYOWDkX5Q4/KqsfUTZSkP0qs01LDqy+HquyyugqMexpFzP3zId5wdqlBuBBISn7uvP+WGT+eba7hGScaCVRDroy1vJ6Q90OpKqEMzdJBLO1Lv+vN+RRefRJ5qu00FokHi8CP21Qm25ckE2O5OvqL6VeaOpp/boveDrEASIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAmhpdOU; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAmhpdOU"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so1136281a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 13:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780433950; x=1781038750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0LsFwosRJQ7xuFenuTgaUzNnNnhs7WZU/8+qcwovvf0=;
        b=iAmhpdOUQ9B+bw7TIWvxoIFWpdvLvoW6kDNUKy+l8fysF0F6tler+7ubzKMnscHCe5
         t61U8m2+6D8AjzMMkd2mHTynBJ5DA574tRJ87wLNo7pYHICUkYABAeIjPJlteMMkouF/
         JrqR5LKZ3wlHxnT7ifaNO9Er6aJdxCS/BbjpSRDD6hHsBltUSsrur3wnrb/sJRHN4cT5
         d2dHe/OHRDyGsdAPX2cdlXyzSj0+p4biHx87Npg9QfnCp9JmyjuQnuj2RgvHTbEGsVBj
         aB5cgLr9+FAbPZno1jJF1PNLWLQlJ5h3Uh7QBKqoMR9Ou3I9PEF2hGHLKf7FWeWaIefj
         49iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780433950; x=1781038750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LsFwosRJQ7xuFenuTgaUzNnNnhs7WZU/8+qcwovvf0=;
        b=DLCc+3v6HmdCRm4X5iCTpzpYcla7MxSjWXHbErczFdk8LzDK+UqfHxByR93U6INkgV
         m15yrQHvazQnrtggjV1i8lFLInZKFPUuwpgzR1eqylRP3imdCS4B3wZNPZdUJtbvaMf8
         91rlUBhQAGo0I//auA3qQMMYl+NgFQ3s32aGDPgpFeu/J6iO/b5EF39OMPRkWdFUbori
         H0r8Mp56XYOdAAJ3CmgWbcG1z99kV5dCFgN84NSQwghjQOF3cMKqz2TXIa5LoQYXmYQC
         F5mn9K1nVmA/Iuz8/Mkd3JzbRE/H3SfBOKlSRKVUffdHnv9o5qddP6T7uKygBBRlvTZK
         MqNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+htIe8MB8+EE+dJBnmrKLGiqJEdpScj1PTK0E9jA22v/cAxhSzgHz2QNyasW+DQkbMuc7rl+3YFSB/p5+KpW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZY4pIreajZX2Qc2rcgLCEDZDCTwER7LscCWaoCfscjHbCaPJC
	w89WKtv693CN7muhJgKmwIy55qRbEE9zjAJKHo5FKq2qoeT3OLaq9NBC
X-Gm-Gg: Acq92OFDMbsKFShLb8lMbiq4DM8MASuvd94+tOZ38Al8BDSWHY23dNp+AbeKNqmY7Qf
	B9pm0E02tSFeNk1MHduFXb2EmzxvdJlJ30QoCUaSNYBeJOb7JavTFcv64m6WSPcvrnAMCWXDlG/
	xXG9frNycKmpJr/H3A2+y/ZnWT3O3Pz774rXSVwD4427TMtHo5Cl81jUKjAS6OsTDt8s2cXYBnn
	6Nsyrm/TUzdx0ingGS9lnK2SWtgovAI1i3zxO8ynwJb9euNTGI0kJFegTkVcSoTH9QtY/6Ap0yQ
	syjZ0UrFsUpeJuJUyTwmW/Vvi2MqX8muRqQ/oqcUb3QnEeIQkWWOZWOkcV+TpuxNUlPsfh8VMYV
	3MHwhLJOZiOkW/d5FHe4wneQBm5NnGoUbNUcvDI8BCmUG50Me7gOKetPmC5HJfzFACvoowLOazV
	+KIbiSVSiiqqFfHJY6p9ehDm4ucokvKFowkZiS6+oZXYZZ0i78hxKYVbO49PsDPlp95s52q8Fuj
	EC/8A==
X-Received: by 2002:a05:6a21:6c11:b0:3b0:7771:ca57 with SMTP id adf61e73a8af0-3b497669eacmr475117637.38.1780433949708;
        Tue, 02 Jun 2026 13:59:09 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:3b4a:11cd::1c6:2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df043223sm157354a12.8.2026.06.02.13.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:59:09 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	puranjay@kernel.org,
	menglong8.dong@gmail.com
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	pulehui@huawei.com,
	alex@ghiti.fr,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next 0/2] RISC-V JIT support for bpf_get_current_task/_btf
Date: Wed,  3 Jun 2026 02:28:45 +0530
Message-ID: <20260602205847.102825-1-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two patches add support for the bpf_get_current_task and
bpf_get_current_task_btf kfuncs in RISC-V JIT and add a selftest.

The first patch adds support for cpu and feature detection on
the JIT disassembly helper function as RISC-V JITed code was not
being disassembled using `LLVMCreateDisasm` as it was missing the
"+c" CPU feature and JITed code contained RISC-V Compressed (C)
Extension. This patch generalizes that to detect CPU features and
enables testing on more RISC-V JIT work ahead.

The second patch, which actually adds this support has been benchmarked
on QEMU RISC-V and shows significant improvements.
It was benchmarked using a simple loop inside a bpf program that ran
bpf_get_current_task() and execution time was measured. It used
bpf_prog_test_run_opts() to repeatedly trigger the BPF program. The loop
ran in 1 second intervals and it kept firing bpf_prog_test_run_opts() as
fast as possible until a second had elapsed and then reported statistics.

Varun R Mallya (2):
  selftests/bpf: use host CPU features in JIT disassembler
  bpf, riscv: inline bpf_get_current_task() and
    bpf_get_current_task_btf()

 arch/riscv/net/bpf_jit_comp64.c                     |  9 +++++++++
 tools/testing/selftests/bpf/jit_disasm_helpers.c    | 13 +++++++++++--
 .../selftests/bpf/progs/verifier_jit_inline.c       |  2 ++
 3 files changed, 22 insertions(+), 2 deletions(-)

-- 
2.54.0

