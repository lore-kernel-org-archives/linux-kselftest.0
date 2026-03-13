Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A798A3815D7
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 20:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773435523; cv=none; b=WMA6Rd336bp7ZydmUu08DqwrJF9GBm+/GS9ncentdDuq0tJtM53dqvwUQ1GHBfcWQyWIzZlKIs7aDU6lzRMPU2uRuy5AADW1KURA3fzDFsEnFiueZNPqR7S2zf7ebCoH4qMnkwPXmDFGgHLgH8axbd02/duDcUhS1hDFCtgt+9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773435523; c=relaxed/simple;
	bh=FY95oARvzfyJxaRn4kOC4ioFDdSacj4Az4fgX5W7CXc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FUyKvwEhCUwBx/Twz1lCNC24RtxmdNQN7nerlh5yh0EfYJaqFWjrPuW7VhqFVy93dYfNzKvIHKo+UTnJnNEXOeQJjAnWaKYmSrxt3N7mdGTuEKr7NbxfiwUk4rZtcXlpfjuoPh/FjWSbkPX+Zvteq1AEnH60hjh6PUPwwlHnFg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bKqKFNxn; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bKqKFNxn"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso30556685e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773435520; x=1774040320; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j20/i3IEudm38MpoK3zSbvN6PwVMHMxginn+SRTHYFc=;
        b=bKqKFNxn3dgprB8JIuW2avLy1NAtJ5KWo/96ofviSIFenjUQQqYHQYHDjJWi2isSbm
         vh9HrbWf4q0+11NUS4pSS+XCsaUmIfLP0HfQ2lG6emgJs8nchNOXncG0WEoubGlnXeRy
         ByD//1iPNCPhee5D40+aNkr6w4mPeUs0PiJRywJ8ljAFQcqS/DEeOltAH30jC8onS+sw
         XCm3y5zMBZ5X/YFaez85idSc08O4vE/FZI0RDr8vwBFci1fpypp5dFz4Qna7dFM4pN23
         UAUkRlIeshScXnjy/LYk+0NwKauRde/bkblsPDyURWaoF4vXzVKLwE8JH78AC8y18qXG
         b9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773435520; x=1774040320;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j20/i3IEudm38MpoK3zSbvN6PwVMHMxginn+SRTHYFc=;
        b=FFADLhMktUQkcnFCljJOgVZtqSBmW/+cdvNZX+BOpD9C2PR//+HwaWUJcyI5spmmWl
         tSCMAZ+6r2ovl44e4qMNyi7kG6Fv6jTkYG1GlFSt+9CbsLjs1v9ompfo0sTxkm+ym7sr
         Q8lqqrn9K2YJ9jVDl/idQZEO9erQHi9aA8/dQVkjJ+wTmEn1oL/jeDxc5h17/HQggs0E
         5JATRAPtFV9VPcr6qRWqQSxzcnjv1lFP6dfPVjZTVsJZtdFx75/XiiCIoz9i6RfuFYPv
         E89FkyfATlWkxkX8fT/0S3SdAr74KuO4yVR+BcRfyDDyzSVpVENWUQeJinJLXTJ/GRdT
         wckQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCsKCTOJos/kK1Mb9ZlhScvsrYZFC+V9iADry5cU4XH75qDwqa3AEhvPuAP2cSFXhG5ySj84jQjczJb291LCc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz204xKizGhXbPj3eXRSKm94MTnjpTQxuVfSEev1NIaeAhee0Ys
	vXUUvQrwdBuKayMDPxmmTZKdxULNaB2/Xr1hwQSWnoOr7LhOQOjS2k1FwIfMLc98JMhoC+JvVek
	wacvOUy0=
X-Gm-Gg: ATEYQzy2d1jZwzgqyhiN8UHKscZA2ky5mmsIiPVcjmTkDolgJjp7VL2y9TLUBeFv7gF
	1YC6AhofT1t0M6NfXSRQmSe/b7nxCtF0gUkzWcIjIwHYmbLwxqe0ew2ndqRlya+p8KvKi5PkRiy
	tkhB23V5KM9VXlSQJ0Ix8RAZ6jGknYG6ehJg2YCDXHquNOW4axfEaKQrq2do4CLfYRmtsams+jW
	451X4RaMh2P2AwHt3+isf0aIVFkJYWdTq7uDQ6H4o4h0CdOOL/w5IITXs+aL9x7A5dRSqEE+g3H
	efSX5PnzdBIuu/frk7LnYvLuDTlaHVPKlFth1417WPylq8o7sYUg1UDVm7r65iJEcm6kz+YIkzb
	qMF57Y6+T7OO/DKaPEVuviSJ1ylBOD87kDnqEzOWwFlWxDm221tEzYpkF+MOQANzqDulHr+WFDc
	SibLPk3sPwuhT0UvGbvm5Z
X-Received: by 2002:a05:600c:a09:b0:485:3f72:324d with SMTP id 5b1f17b1804b1-485566ddac0mr84382565e9.14.1773435519622;
        Fri, 13 Mar 2026 13:58:39 -0700 (PDT)
Received: from [127.0.0.1] ([2804:5078:834:1300:58f2:fc97:371f:3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526d3csm4042611eec.18.2026.03.13.13.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:58:38 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Subject: [PATCH 0/8] kselftests: livepatch: Adapt tests to be executed on
 4.12 kernels
Date: Fri, 13 Mar 2026 17:58:31 -0300
Message-Id: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHd6tGkC/yXMUQqDMBCE4avIPrsQI7bVq4gPGsd2RVSyUQTx7
 k3t48fwz0kKL1CqkpM8dlFZ5ogsTch92vkNlj6arLEPk5uSp5UDNCgvU8+DHFAeyqJoO/eCs0+
 K4epxD7Grm79160a48Hui6/oCapfNLHYAAAA=
X-Change-ID: 20260309-lp-tests-old-fixes-f955abc8ec27
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773435515; l=1911;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=FY95oARvzfyJxaRn4kOC4ioFDdSacj4Az4fgX5W7CXc=;
 b=7JNUC+UvPAPTZWkz1aYQjRun4meZ6eGgR6ZZ2b/ha/drVnC1Rpa6USkYCYDEHOe7dYMOnpc6K
 qy3l3kt0+P4AUAdgdm2XsRbOBclBkoQPPwsy1EQ2oQfO1IQoBthwj2z
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

These patches don't really change how the patches are run, just skip
some tests on kernels that don't support a feature (like kprobe and
livepatched living together) or when a livepatch sysfs attribute is
missing.

The last patch slightly adjusts check_result function to skip dmesg
messages on SLE kernels when a livepatch is removed.

These patches are based on printk/for-next branch.

Please review! Thanks!

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
Marcos Paulo de Souza (8):
      selftests: livepatch: test-syscall: Check for ARCH_HAS_SYSCALL_WRAPPER
      selftests: livepatch: test-kprobe: Replace true/false mod param by 1/0
      selftests: livepatch: test-kprobe: Check if kprobes can work with livepatches
      selftests: livepatch: functions: Introduce check_sysfs_exists
      selftests: livepatch: sysfs: Split tests of replace attribute
      selftests: livepatch: sysfs: Split tests of stack_order attribute
      selftests: livepatch: sysfs: Split tests of patched attribute
      selftests: livepatch: functions.sh: Extend check for taint flag kernel message

 tools/testing/selftests/livepatch/Makefile         |   3 +
 tools/testing/selftests/livepatch/functions.sh     |  16 +-
 tools/testing/selftests/livepatch/test-kprobe.sh   |  54 ++++---
 .../selftests/livepatch/test-sysfs-patched-attr.sh |  95 ++++++++++++
 .../selftests/livepatch/test-sysfs-replace-attr.sh |  75 ++++++++++
 .../selftests/livepatch/test-sysfs-stack-attr.sh   | 121 +++++++++++++++
 tools/testing/selftests/livepatch/test-sysfs.sh    | 164 ---------------------
 .../livepatch/test_modules/test_klp_syscall.c      |   7 +-
 8 files changed, 344 insertions(+), 191 deletions(-)
---
base-commit: 920e5001f4beb38685d5b8cac061cb1d2760eeab
change-id: 20260309-lp-tests-old-fixes-f955abc8ec27

Best regards,
--  
Marcos Paulo de Souza <mpdesouza@suse.com>

