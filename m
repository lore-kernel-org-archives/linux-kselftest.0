Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520382;
	b=GOysOEbYGzHODTUexza2hTgIk1uIaO5hcKNIcSDkhZXwIXxfUKAxdPi/hvqU9gAiUFvH
	 c19qguuN+2Ba5hjpuDQ1ANjBI+U0nvAihMJaN652RYjhyCk49DwFs1nR9cUr+tMJV9vbc
	 QkdNWHUsN2XeYh388fprOeAF+V6TRyTlyaVUQ56vm0QQesKsBoRSjYgWszFkjuId/a8o0
	 ViYl4NSBjR5UTsh/hCnygG8Flu2RtNycitAKE/3cLM1ca1XnxObL4e+d6XhCSQGlSkuPm
	 nvb6mxK+QjRiqDzwHuDbh3QsHG8F1wjj/l1uUgSSrbmZFT/iKdJKW/ICwLcdXNIEwHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=aAgJAbuVXKrl/2XmWKq188uudjDScblSy5jf6BBIQNg=;
	b=hJwyJEh9OJSgsqDBS2+iQxo4k2RXHDCvAnyuC4od9p4rFjl3Dhq6AWNC1l40ukCRch64
	 HagGwx1MTonCzuPxHFRGBe1W9ye3Fa6wDez6Fu7DdSqVliknnlhcq8gtmztQc3lfeeQah
	 vosPHq/iE27WortlgoXECRk3nZubw8/80WHUVQ7WqkfFfXAFl9nNYI9HQc2FwQxB3xt9K
	 DgkvKAiRk8nxtug9giT3yIzh3gOzQ8MKkx0P37vGkPVdavZnCY6uNJCZ8IsS+9TXwQyum
	 7ZcnfS30Y5TrsgQ7SLnNPQ8Sl4hpJAQGURix+3mMCqZm0tckRNWQ9m+NHKeEcpUJg0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a4pGtYWO;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A6760A4AEC
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 18:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07A6760A4AEC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a4pGtYWO
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535a54bed9so4863219eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 11:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520381; x=1793125181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAgJAbuVXKrl/2XmWKq188uudjDScblSy5jf6BBIQNg=;
        b=a4pGtYWOiSmenFvGPTru8CpQa+m8KAH+2lyBCyqv5yv8RqYnOHAsCyZaam/NdjnJBm
         2+rS+PxUutw9UJuupoj+jGcnIa9rsRJln3p4NK658UDA45OgB8Z0T9PMNI3UMXaKp1mE
         h/kovDHAWJRmhN2AYgonjcYXJpxUr4HFCFqsvlqBZ0krR9Z/TLNgBK8erPC3zEJrmJqi
         jh65CBrnS5rmrIR13i6zFjLEyUrN7pX+TpVWcziKlbdQ12yXKQH3fpHnqS64QgzkGyAl
         TJXNTWWtHFTZgM75Mngz+43InF3KfziANoONzhlOhCkhXvjR4j6qN+py+xuooiTXGY64
         3dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520381; x=1793125181;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAgJAbuVXKrl/2XmWKq188uudjDScblSy5jf6BBIQNg=;
        b=r/EjDTa5uECw3bzHGSAf/pFVFY8jVDAst9HVRM2C+IkS4UzgpVzZKZatBgVp01IwAB
         y+HHr8noFn9rzPJESrOAu70vYCHkH4uy7hP6e4zRQqlFsq8UTaUJlP2zqz2ALfr7Kmdl
         plXemQ7F789YE5hVg7xvedpxQ+CpGNDfXDIMBta0kwk57VNBBVI1mwst+k+qtkmZQ+gI
         RP8QNN4kdcSdHy3StNI6xCYhP87EukE+2hi4cRN1X/9PShsZ77UkP+xQtkiHICKJ1mqu
         HpwcLoB7bGO6sA9RZHwyrwJ8nLygp/Tde5Fa+xJVY4FsUBruSkT9prXRDJiULl90tjIr
         e6EQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQUqq+uNryM43X8JqalrErI8GK41F/4Q4+p+9w9rgMGkg+Upw95K9P+hfLhfZiJEJGZd3NfwdDthSRMAZmqAc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1/TzjyWMVfpaXX4Pn3lOFn2ACiQ5bvxgRkSI5GhMaMkBt7TFo
	bvR0oZopI+cTM9COucJE0aNk/HilIxp6kTbmGG9+0RFp4K2tyix/vO9t
X-Gm-Gg: AYBFou1Xr5/WePg2VKOSfYBdot530eNMciPXq95AnjNCDlcYbK+iSMJMAEQYXoIMR+j
	ZCEyqi/rGeCHwi6cUpYP95HD0v6j9ggReO0pz+IuaH8lof2/6iPpUgZeev/mtvnr5IFisSnoh03
	sZuaaVi8JC3XPt3yiHHQoGnJVdT/opQQrdRqsYDpyAbcMcH+Xbr/JGDJrNaEPGp+Ye2ddaa3VvQ
	PkeHLL5kIZGH546iUjurDfQVA32PeSGEgCa0/tCcfPZvGbj+VKvoIaRPYlVrHtXDk63X02NAstL
	XJIuCABcWojWtJRf2VbMG29ItvMguRvVqPlB7QTtdTDrXyo1aahhNSVXD74/OIiRkuGfPu25+Sn
	kQ01AugRr3bxJDj1lj/pfFDDs47OENb5+lSnvdWLc7JmcihzN6WJdyQfvR8QARIeuud9O0tYQgg
	C9nLyaJXFhL6W8I65uSdsnnNO6/dRqL8zd6GRciXQdMNqyQ3QlMZPoYzZhC0SjL7ZU
X-Received: by 2002:a05:693c:8399:10b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-3674a40738emr116407eec.5.1792520380928;
        Tue, 20 Oct 2026 11:19:40 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm523728eec.2.2026.10.20.11.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:19:40 -0700 (PDT)
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
Subject: [PATCH v2 0/4] arm64, riscv: release shadow stacks on failed fork
Date: Tue, 20 Oct 2026 15:19:29 -0300
Message-ID: <cover.1792519121.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792179433.git.ivanrwcm25@gmail.com>
References: <cover.1792179433.git.ivanrwcm25@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is not a port of the x86 TLS fix. That leak was inside
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

Do not add cleanup for a copy_thread() allocation error:
copy_process() skips exit_thread() when copy_thread() fails. arm64
clears inherited allocation tracking before attempting the
allocation; on riscv a failed allocation can still leave the
inherited parent base in place. Tasks created through the args->fn
path do not allocate a user shadow stack in copy_thread(); with
CLONE_VM a later failed copy_process() still shares the caller's
mm, so that path clears inherited tracking before return.

x86 does not need the same args->fn clear: copy_thread() runs
shstk_alloc_thread_stack() before both the PF_KTHREAD and later
args->fn return paths, so CLONE_VM replaces the inherited tracking
first.

The selftests assume /proc is mounted. They use kselftest.h / KTAP.
Feature and clone3 availability skips run before ksft_set_plan().
The plan is three tests: a valid clone3 writes a pidfd, sixteen
bad-pidfd clones return -EFAULT, and the shadow-stack VMA count is
unchanged.

Based on commit f47d223627f8 ("Merge tag 'vfs-7.4-rc1.sync_close' of
git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs").

arm64: QEMU 11.1.2 -machine virt -cpu max, CONFIG_ARM64_GCS, one
vCPU. Unpatched VMA count 1->17. Patched 1->1, 3/3 KTAP pass.

riscv: QEMU 11.1.2 -machine virt
-cpu rv64,zimop=on,zcmop=on,zicfiss=on, CONFIG_RISCV_USER_CFI, one
vCPU. Unpatched VMA count 1->17. Patched 1->1, 3/3 KTAP pass.

Changes since v1:
- arm64: introduce gcs_reset_thread() (empty stub without
  CONFIG_ARM64_GCS). Document why x86 does not need the same
  args->fn clear. Comment the property of the args->fn path, not
  only kernel_thread().
- riscv: same args->fn wording; clarify that normal exit reaches
  shstk_release() through deactivate_mm() while failed-fork did not.
- selftests: rewrite on kselftest.h / KTAP. Drop open-coded
  [OK]/[FAIL], exclusive-end VMA matching, ss_kb, depth(16), and
  parent GCSPR/SSP ping checks. Count only VmFlags lines with " ss".
  Skip before ksft_set_plan(). Factor my_syscall2 into gcs-util.h.

Assisted-by: LLM

Iván Ezequiel Rodriguez (4):
  arm64/gcs: release GCS on failed fork
  riscv/shstk: release shadow stack on failed fork
  selftests/arm64: GCS must not leak on a failed clone3
  selftests/riscv: shadow stack must not leak on a failed clone3

 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/gcs.h                  |   8 +
 arch/arm64/kernel/process.c                   |  19 ++
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/kernel/process.c                   |  20 ++
 tools/testing/selftests/arm64/gcs/Makefile    |   3 +-
 .../selftests/arm64/gcs/gcs-clone-pidfd.c     | 168 +++++++++++++++++
 .../testing/selftests/arm64/gcs/gcs-locking.c |  20 --
 tools/testing/selftests/arm64/gcs/gcs-util.h  |  24 +++
 tools/testing/selftests/arm64/gcs/libc-gcs.c  |  20 --
 tools/testing/selftests/riscv/cfi/Makefile    |   5 +-
 .../selftests/riscv/cfi/shstk-clone-pidfd.c   | 173 ++++++++++++++++++
 12 files changed, 420 insertions(+), 42 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c
 create mode 100644 tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c


base-commit: f47d223627f80cb7a1eb14c585fe6cb35de5e984
-- 
2.43.0
