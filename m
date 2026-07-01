Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915B71A9F97
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 02:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782871697; cv=none; b=WtMhcDWpqYwFyhvqP5lOaQWcBbi/i1rrvazWgee97mgXh55smw7PzrVCWMojauvxCnQR0wuYfaPbVgyceSAnUSSFkf13EhkjJ3py+MdeUAr4hINJa8ClSbm+Z/Oknc+/AWzkA1hwHac1gkbfGFPMNDX5g1Z0kaCnkKl81zd5Ndc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782871697; c=relaxed/simple;
	bh=5rHrl1kOowa7xdLKGwrSvSuAnWQWJ8s5Fr9qgQ3Oyas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JYL2qGipmsQZlqKbCZZqVobVDc6RBDYseeZh5Ykpkpt8Ce1kqacHVXL3muM9l4NN6CkR1SvUj5Q0SJYR+yDwvi0ecG195KicwAqreJ+k6+aOPjUZIhRSv+B87Q/dtZvc80JFzHPtGM/TVChmOC3/BrSS0wORKvDf3LTYyCpgRS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhS69yD9; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhS69yD9"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84780c95e2eso96058b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 19:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782871695; x=1783476495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VYGKv1GijZbzS2DhKVzIdX99psuP24mkJom0bNyiTH8=;
        b=WhS69yD9uu7i1GXrVW2aijnfZfTFhLIxQ76x0VyzUoMc3yPHK+4xcdJDjOltKRfb8x
         VDJhIEPcWc9RMx6GtF+PbtmWhOUuR2u3ZAchf7QCHBwsHtL18noBcjdkJ9sV55IxqpGa
         hH6USRm0NtX23KnNtoa2Y9RxCiBGihKvSwr8NhU/IeUUZp0Wfq+5k9kBc8an5+7CKv+C
         oMLaWVVMZ5unR/bZe8viE5sGP6RhzAWSqcGup5/X9Zmr7zzrtGz0TOVVdIOBhyg4vMg2
         m59POYtZoTCqsQsrgEr+r79w5snLijCclPFTq8UgiALsCOO4rUuHnSMtPjnUPV5iVbLn
         6GsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782871695; x=1783476495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYGKv1GijZbzS2DhKVzIdX99psuP24mkJom0bNyiTH8=;
        b=aMnw15bc5tVSgeXF3zKgn2YpvjWfkwb9554R8NT3X0FQL6kJ4UZjEKECmaW28iXjPC
         oacATwDLWq4WL1mtC0SbcfnmD3TXYrTOehSxr8B4ee8FBxCQ3C4/ZLjWFvyAXsipRea0
         8eehzI8cbhIk5OXE6WVmH6B8ab8vyGV58HnqAlN/j2wcYYtpN6Vjq5avkXjGBmpJaWnP
         J+HwACMX+5lekH8ScEgFRSbI9tIRGnjSWd6Y3xAtRo6qVWTsNNUmfhShDW3kelPgQrXi
         Q+ue9VQ6pXeuvt3sY9JQezpdaayTLG0V2TsxmpZPvk6QXFXBi01h307bTFV2JxbHOJNw
         /WNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6jV0NX3+xEad2PNQLZG8tCBJKUxLnV6pb48u4TAyItaHihxXQDuxI1PkyWcsUg6/5kAZbfFvYV6UIS+jQotE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9fiPK+NHjy/lulY2LFGfttRF+toWfOGFJfQr1/OJlWlB7quaj
	Vk2jNfPWK6gz2OYK6676yYFlfgifsWlGe/FZIQE/v19VQmCCMIeKjBM3
X-Gm-Gg: AfdE7clEoIExKUqLmzbK/ZDYXchsf0mydjVDCZlJuuln8gIAYuy3bLm2yxCMr2TQ3VN
	ovWuf8pP31JgFkY+YuLpZf8/8fOuMKzgUSksqbvIK4g5mubmpMWZSt4gcrxLIOQv7gMbwKdGwAN
	CRQ8rZEiN+faiSQ/+4OGBwwQeWPMIQZkYpnb8GuP3uqNj5+/PMWUEvQcgghnoqubfIWh5+6cmhV
	cDu+a0DkAyedhM5O8Qz5v4dYQ6o270amMFiA4phQ2mWAb6Cn38ddlD5x2UNZJyjsksaRREm7Mta
	p3HTFldx+MGA66EW+s+zmwvFTjKaKhFg6jLtJcdcKKtXI7I492+Y+IBM3fnNBlAOOSYV6RIiiB9
	AK4eQi5s1x1uV7Wi2Ka69sNTIijXHjJgPxYGJ8I/sFp0EG7t/+EI6Zr08yRjzR1DVB7hyY10lwu
	R33xUeFSxSN/M=
X-Received: by 2002:a05:6a00:3d4e:b0:845:d285:3b6a with SMTP id d2e1a72fcca58-8479f29540cmr5346223b3a.54.1782871694775;
        Tue, 30 Jun 2026 19:08:14 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fff4c7csm3072923b3a.16.2026.06.30.19.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:08:14 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 0/8] RISC-V: KVM: Add Svadu/Zicfiss/Zicfilp FWFT support
Date: Wed,  1 Jul 2026 10:07:37 +0800
Message-ID: <20260701020746.170157-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset based on the patchset "RISC-V: KVM: Add Zicfiss/Zicfilp
support".

The patch includes all the function of original patchset from Quan:
adding the Svadu/Zicfiss/Zicfilp FWFT for the RISC-V KVM. And this
patchset already passes the KVM unit test.

Test with the patch applied
https://lore.kernel.org/all/20260618064406.14508-1-cuiyunhui@bytedance.com/

Changed from v3:
- https://lore.kernel.org/kvm/20260607081105.993908-1-inochiama@gmail.com/
1. rebase to the v7.2-rc1
2. Tested with the updated Svadu patch
3. Remove the dependency as it is already merged.

Changed from v2:
- https://lore.kernel.org/kvm/20260601084336.2601675-1-inochiama@gmail.com/
1. rebase with Yong-Xuan's patch set
2. Add SSP CSR context switch/set/get
3. Move the software-check exception set/unset into FWFT
4. Only delegate software-check exception when Zicfiss/Zicfilp is enabled.
5. Make KVM SBI_FWFT_PTE_AD_HW_UPDATING depends on both Svadu and Svade
   enabled.

Changed from Quan's v1:
- https://lore.kernel.org/kvm/cover.1764509485.git.zhouquan@iscas.ac.cn/
1. rebase to the latest master.
2. Split Svadu change as separate patch
3. Fix all build error from the original series
4. Remove the Svadu check in kvm_riscv_vcpu_config_ran_once() and in
   favor of the FWFT.
5. Remove the LPE/SSE setting bit in kvm_riscv_vcpu_config_ran_once()
   (kvm_riscv_vcpu_setup_config() in original patchset)

Inochi Amaoto (8):
  RISC-V: KVM: Add support for Svadu FWFT features
  KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
  RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
  RISC-V: KVM: Add ssp context save/restore
  RISC-V: KVM: Handle software-check exits for VCPU
  RISC-V: KVM: Delegate SPELP bit to VS/VU mode if landing pad is
    enabled.
  RISC-V: KVM: Add support for control-flow integrity FWFT features
  KVM: riscv: selftests: add Zicfiss/Zicfilp extension to get-reg-list
    test

 arch/riscv/include/asm/csr.h                  |   1 +
 arch/riscv/include/asm/kvm_host.h             |   7 +
 arch/riscv/include/uapi/asm/kvm.h             |  13 ++
 arch/riscv/kvm/isa.c                          |   2 +
 arch/riscv/kvm/vcpu.c                         |   6 +
 arch/riscv/kvm/vcpu_exit.c                    |  10 +
 arch/riscv/kvm/vcpu_onereg.c                  |  66 ++++++-
 arch/riscv/kvm/vcpu_sbi_fwft.c                | 182 ++++++++++++++++++
 .../selftests/kvm/riscv/get-reg-list.c        |  88 +++++++++
 9 files changed, 373 insertions(+), 2 deletions(-)

--
2.55.0

