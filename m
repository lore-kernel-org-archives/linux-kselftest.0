Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8562F8EAD
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 16:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783615680; cv=none; b=INFT5y0eoHrBPgBHynH7/+UojwUJQnaAAumJcz+V+qM6eNgcObfVFfOyEQFx0ICeyoeRJxCPS5O5amw+8Wd6r0aWRpMUX9MzlbJh7CU6dV5oYoPR6qXjgs0r+nPIoTmZJROOsWl+XMoHzmRHgOR+aS3lI8rsFy7j/0+LSdmayQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783615680; c=relaxed/simple;
	bh=l8azDO1V+A9zH7SZVFYyRnG3Q6u3OzWf/+Ivbv+sPKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fZjkrRaptES43AmB7RHBMHz/T7DbPTiiy0Vey82PdvEer9luB9Z0Zo+WvvS2qkN7cUsM9IAcTym0oyg4ZWwTgc1e7RlUzoKFMlbdvj7qDqXpvsTkl1gzpmz4+I76soyXBShfTJtRgGTqfMMJFdC8WDS/wHwXXUx35vY2UA0+P+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hkc4PfeD; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hkc4PfeD"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9d1fc053e0so34546a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 09:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783615679; x=1784220479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bugrw9ZAn9zVjHgJbS8tolPWSEIE1MhjgoMVhvy2STM=;
        b=Hkc4PfeD4Rw6Ahgud1zBQSFM5LzRawNvlv+JLDShmbc+gWBRjaUz+vIX7h+zWRqIns
         A1+nIFvAGbIIF5Hjpp+mwtmV01gzQPJ3DytJ/FM8vxsvxhwLijCRslH/3pQbD1bsi7lq
         q4rRnar8JHAD4XebwoYldv1+lfsKV3pfVnhYVbCfZf4lIvIltGY22vhBCBdnTfv5Wdk1
         qBS1bgSIJGiEDvwqDRIVszNQHP8PMZ/svpX9tNXhztQJ8946xP0WmhjkGlRnMkh/1tbl
         xkVH3kuu3tmsaqYPbTmZPGLsMDY+m3AvP0Q6AGBr8VwI2M8wN0p2rpL2Y+CfgI6jk9hx
         3hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783615679; x=1784220479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bugrw9ZAn9zVjHgJbS8tolPWSEIE1MhjgoMVhvy2STM=;
        b=Ivfvq/DDdZSQK/nJyNXyvSl7zWoAD8GS7rirSIZs3TTfo6nwQPyrzmeS47hk61emOW
         mG+05Rc2I6fCJ2URNyf04PTv6Xbg/ZVvXPS1lTgIchQUG1KZcE1ykWcIMaQaZEtC0IeC
         YU1jhNXEaC9awwLkyxLXUfFIo9COv+q7Qj6wOXqqNKIjgFTuC3uMW9XYpAAJSSy/UNgf
         XrEGdzKF7in9Q7LUHxscn3MvF87mufqF3rQWAKOxkXAYSAPsEu/LxlG/G8mnydVeuIiR
         rjKUMb3wAKz4LflA/BUvR1zuHa9JR/xHNbI5RTbcUboBymx3tEiLfONsauy8aodW01dV
         c/AA==
X-Forwarded-Encrypted: i=1; AHgh+Rq80jNvgtdym9H9nJPu68stYBECGSZ3g7/dofPFdP4/lYtVGNnnIyjcVDGCc/nH9GAtv80ShorjQ4E+3SxL+BA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq9mkbSpw0xUAnwPHHSypEg7Jasg8m74Xr2BCMTtkiAzwpQW7+
	G5ivYDnbMof+DhlsMy+pGn9Zz1eU3NA7ayLU6dDzVsHpY2ItRg8CNrty
X-Gm-Gg: AfdE7cmAj64WRb+wPgukGtYfu4byY9hPevV3tDC14W2+2aoom3a3dC9A0KLKMw95k56
	NlRALvqO5MtbdCCKCYjUNme7RNiiY+bzFd+aATM6D0XRr0wZtaBZH4osiPyngfbLwYlMAXGaWKa
	CGxzKOmdcUj3LrHlSPqmXUjtJAiHvYAf0RmaRYBqfQKWGvUom9kSyULvTHOqwdGfinJ2KUCdP8b
	sZ8SHHXGUwjAaGfHHK5SwgKPt652+ZanVXHLHphn3hKVCP8oXHFqSDJys3/tv9BNThUqlbTRnZs
	vwxb6ye4G8s4jlRPWMTy48SYfOBuZPawzfdy7aJQ8UprS5NrHnHtrN6XsZHaONRU/ZdEFgWgf1i
	01llMFDT2uz0S2dAlppEH4HcYHjouq3qp/ZSNfVFNPuH1TCssxjbTyXaWT59DKP/bMILUI2tWgJ
	ec9jc0NRmnzkmYkg54eI15IGpS1IHn6f3J+0E=
X-Received: by 2002:a05:6a20:3d0b:b0:3bf:6c08:2842 with SMTP id adf61e73a8af0-3c0bd1a82abmr10253601637.49.1783615678611;
        Thu, 09 Jul 2026 09:47:58 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c4ddsm35709287c88.1.2026.07.09.09.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:47:58 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hemanth Selam <hemanth.selam@gmail.com>
Subject: [PATCH v1 0/2] KVM: selftests: SEV: address two TODOs in the SEV tests
Date: Thu,  9 Jul 2026 22:17:49 +0530
Message-ID: <20260709164751.621326-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series fills in two pre-existing TODOs in the x86 SEV
selftests. Both are test-only changes; there is no functional change to
the kernel.

Patch 1 adds negative coverage to sev_init2_tests: when the platform
does not support a given SEV VM type (SEV-ES or SEV-SNP), it verifies
that KVM_CREATE_VM rejects that type with -EINVAL. Previously the test
only exercised the VM types that were supported, so a mismatch between
KVM_CAP_VM_TYPES and the actual KVM_CREATE_VM enforcement would have
gone unnoticed.

Patch 2 makes sev_smoke_test capture the launch measurement returned by
KVM_SEV_LAUNCH_MEASURE for SEV and SEV-ES guests and asserts that it is
not all zeros, instead of discarding it. A full attestation-style
validation is not possible from the selftest (userspace does not hold
the transport keys used to derive the measurement), but a non-zero
check catches a PSP/plumbing failure that silently leaves the buffer
untouched. SEV-SNP uses a different launch flow and is skipped.

Testing: built and run on an AMD EPYC 9755 (Turin) host running this
tree, across two boot configurations:
 - SEV + SEV-ES enabled, SEV-SNP disabled
 - SEV + SEV-SNP enabled (SEV-ES unusable)
Together these exercised both new rejection branches (SEV-ES and
SEV-SNP) and the launch-measurement check for SEV/SEV-ES, plus SEV-SNP
guest creation and launch. Both tests pass in every configuration, and
checkpatch is clean on both patches.

Hemanth Selam (2):
  KVM: selftests: SEV: Verify unsupported VM types are rejected at
    creation
  KVM: selftests: SEV: Sanity check the launch measurement

 .../selftests/kvm/x86/sev_init2_tests.c       | 23 +++++++++++++--
 .../selftests/kvm/x86/sev_smoke_test.c        | 29 +++++++++++++++++--
 2 files changed, 47 insertions(+), 5 deletions(-)

base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
-- 
2.43.7

