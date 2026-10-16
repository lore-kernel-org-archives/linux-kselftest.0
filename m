Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6953F392C28
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 19:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179973; cv=none; b=gWnTsq3v+imPE5+Lzayj/Oa7wbgRR7Zy92FI22tDvWERAYWetBwEYk6uDa1TCh0TBM7EQ3HtdTZt+zx/SEFkrlbm4ybAh60C13jVHHcIVVIMYqeBOkeUz6P3lAzZmD5Jnh8q8GliLN0uC7tlFkH1+TEly54mBviuzy4ocv4QUTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179973; c=relaxed/simple;
	bh=F1t0m5DgOeAgAxU5bkLRv11qTkhIUHATOSrbfRofq6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rVbvwyni7uPS0wSP1OgrNxSJ9YxGR4zehzvYubuaoktmOWRoth4Su9UdA7NzXCl4pBfWfeik9lBMqnTr/6/07seWfGIk2GnmTxWy4IuXnMhlvgJ4eRSh9RMjxiKNJG9LP5Tvg1JQ4hYzBuxF+2wqKJ09n60Z/Bf2tbAqrQfl1Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdPn9Df/; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdPn9Df/"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso540311eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 12:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792179971; x=1792784771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrRLzPVLgizd6wdoUjViFGVj6Wd4K2T/hBmEhjqG+OU=;
        b=BdPn9Df/zqi3zBPbjJTb5LYEl4ktoDiGc9LDwVaGD0G85a8kLERUvJ34UFJe6+RpT4
         PwJi1F+xL0rW/1XeHvoOCSsvzyf43vqM5rpnpfLV9xjWGuSU4CFJzJYF6uwnHUhjPeuq
         LYtUEttLWSa8MVuMQvJW7vsXamnv30o6HC6SH5Kjc6z+eL05B+GZ9gQmyHAszmcpYL/s
         fvJatFLK1+hZaNGRFCTTlRRBrhJf3D2ZRXNoqNNH7zvRjdE6ucMloOP+7QDoiXIIgdqG
         lcYGHZqsVlMm0ZF8uoFguGNLQV6XXSVbf+FAFtLMr9ae8HNJsSiyDtdeOkEvqc6WJ2bJ
         A9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179972; x=1792784772;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FrRLzPVLgizd6wdoUjViFGVj6Wd4K2T/hBmEhjqG+OU=;
        b=2CnHVi/w3EinhZTcBV1Y/AOYo6VNBsD74zJC2CeCTvfpBjTPky5VYzffzc7RGmg3Vb
         6MJu7IVE14FhHJV8sdOjwkzSlMulz7N1m0x7btplBPlI0YY8zA+nvx9ZgzZkyuV33xB/
         GqfOGehKA/S4dikKOdYgtrfJzrj9CyFhqYVJ3YxdCz4QKn596Kwllwom+BkIRYQ4OKfz
         oJVZmhTTxm7uy70KR4qG++woBPMvqamGhA9C59FyggxafCR6AUWQZ3i1WWFCNKQKc3JH
         7sVxJxiQu6uo8yu9PpsTo4VPgNPwv+p5HqmJDsYCo5jjWQMCv9FqSdVPMZwLykgqUgKe
         uz3g==
X-Forwarded-Encrypted: i=1; AKwUvBzDkqkYTU4GGacQposcu48Kq51dI3UqfA4bMiMMeJxW89r5IiozxH2JSfSqAX5BXbia/9Q0EWjvArngob1Pqpo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrkC2rmdrZYbMQlRm2xJ2z3su2ndAiFLMnFYSySMb/S1UQJHbr
	82/7TnaUrsVOjxXH79UKfvsXUs5yxvs9y+ZtpIE+NcIcek+O8KykMran
X-Gm-Gg: AYBFou0Kvu3l/YhXrI2v5elAnMEOt3MshIfPO0MJQ2aAj/5dnRYy1HESDC8Pv2x3j1P
	5qb9Ttq3rfYbEDiEDGVlwP2Kv+8BoT0BrkEbfcTdcW1/Zv+gc2JZAQenDmHzgkX3dlDVd4NPj1n
	LM3NL00/YxCWtD2+Qr8DADirphjoC0Wlg/GM8mbi/FgYvbYCNUB2MHGQkt3ermw3pLyXXQfGJyq
	gjHxzw3euMmM51XL5KIfEih6eEf17QTlFT0n6yp0c5EKxazuKDMB36NffFv+5P+iYEbzdL/WyiZ
	UGH2zeSoyowyC8EfbxGPnjAAWWqH5flGRXmjX9eOoaxE63PUZReT41Bwlioa0TeS3BgjLgTInvU
	BNb0V+IJa0uOZYo6OXcZGdC3xwpcJMHTC1HVsywCbUtba5jNKtWLmXuNII7DhyKKn6eTIDGYrtj
	5VOn746swgi1lDGlJFUe7PDR7JgHmXK7mNjNDmpvWTtBLIp+wCr/VuJz75JQF72ZUx
X-Received: by 2002:a05:701b:4212:20b0:143:3c9f:10a6 with SMTP id a92af1059eb24-1850c40d561mr1220093c88.4.1792179971397;
        Fri, 16 Oct 2026 12:46:11 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm11008321c88.16.2026.10.16.12.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:46:10 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH 0/4] arm64, riscv: release shadow stacks on failed fork
Date: Fri, 16 Oct 2026 16:45:59 -0300
Message-ID: <cover.1792179433.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is not a port of the x86 TLS fix i sent yesterday. That leak was inside
copy_thread() when set_new_tls() failed, so copy_process() skipped
exit_thread(). Here copy_thread() returns 0 and a later
copy_process() step fails. The concrete hole is clone3() with
CLONE_VM|CLONE_PIDFD and an unwritable pidfd pointer: put_user()
returns -EFAULT after the architecture has mapped a shadow stack.
exit_thread() does run, but arm64 and riscv did not implement it, so
that mapping stays in the parent's mm.

Normal exit already frees via deactivate_mm(). The failed-fork path
never reaches that. The free helpers already refuse a foreign mm
and a cleared base, so wiring them to exit_thread() does not unmap
the parent on !CLONE_VM or double-free on a normal exit. A
successful clone3() child with the same flags exits through
deactivate_mm() and then exit_thread(); that is the usual teardown
order this series also enables.

riscv's shstk_release() comment already described this
exit_thread() call. The architecture never selected
HAVE_EXIT_THREAD, so the documented path was not connected.

Do not free on a copy_thread() allocation error: the child still
aliases the parent's base, and copy_process() skips exit_thread()
when copy_thread() fails. kernel_thread() uses CLONE_VM, so a
failed copy_process() still shares the caller's mm and the mm check
in the free helpers does not save us; the kthread path clears
inherited tracking for that reason.

The selftests assume /proc is mounted. A clone3() with a valid
pidfd must succeed and write a pidfd before the rejected calls
count. ENOSYS, EINVAL, and EPERM from that clone skip; any other
error fails the test.

Sixteen clone3() calls with CLONE_VM|CLONE_PIDFD and an unwritable
pidfd pointer leaked 16 shadow-stack VMAs without the fix. With it,
the count stayed unchanged and call/return on the parent still used
the original mapping.

Base: 2f2f7eeef8b0 ("Merge tag 'soc-fixes-7.3-3' of
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc").

arm64: QEMU 11.1.2 -machine virt -cpu max, CONFIG_ARM64_GCS, one
vCPU. Unpatched ss_vmas=1->17 (+512 kB). Patched ss_vmas=1->1.

riscv: QEMU 11.1.2 -machine virt
-cpu rv64,zimop=on,zcmop=on,zicfiss=on, CONFIG_RISCV_USER_CFI, one
vCPU. Unpatched ss_vmas=1->17 (+1024 kB). Patched ss_vmas=1->1.

Assisted-by: LLM

Iván Ezequiel Rodriguez (4):
  arm64/gcs: release GCS on failed fork
  riscv/shstk: release shadow stack on failed fork
  selftests/arm64: GCS must not leak on a failed clone3
  selftests/riscv: shadow stack must not leak on a failed clone3

 arch/arm64/Kconfig                            |   1 +
 arch/arm64/kernel/process.c                   |  21 ++
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/kernel/process.c                   |  18 +
 tools/testing/selftests/arm64/gcs/Makefile    |   3 +-
 .../selftests/arm64/gcs/gcs-clone-pidfd.c     | 355 ++++++++++++++++++
 tools/testing/selftests/riscv/cfi/Makefile    |   5 +-
 .../selftests/riscv/cfi/shstk-clone-pidfd.c   | 317 ++++++++++++++++
 8 files changed, 719 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c
 create mode 100644 tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c

-- 
2.43.0
