Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AE535B645
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 02:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304493; cv=none; b=lSgy6oiQtEN/ph8t2eBHlRBW3reC/uegDoEJkg0UtO3f5S77pdgxaZfxH/QG1WRI5GniQx11nto2cE9iBFdyvdbX/rSMLQjMUCAOSGvOjRj1yZq59JK3zeB6+firPF6WREsbKwXDPfdRY665ofE5lU8IvKNK80Fbb2skRi4GfkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304493; c=relaxed/simple;
	bh=jdqrdxRgXPPiobqccePzQm12KSBszYg3zz082KpcP7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nEtiZNgePLVqH7nKePgAnmPlEENatsaPGY8oztAoVRr7kOwyg6N1VJuK+ixvPiI3dvVB6UgI9ggjMpRNMsGGXO19mVglYUmjFoCt93WNVV2ikFQUy5XnuhgsLlgLjLx9G6z/ejXHer4rbrxFvf7TxjxfsEM+nsRlvp1P+7DgH1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnMIZk5p; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnMIZk5p"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso1339575a12.0
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Jul 2026 19:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783304492; x=1783909292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=blzW8cj7qixZrZx8HMTc8WTCaoiy272JiHUFbPafbvA=;
        b=UnMIZk5pHHk9716V/7gR2QpKFjuSiKgWR3Fcs/gvOdnEvy1a03TG7c7jC+4HQ9WvJ0
         2iIFSMklHGqIiL565MYiUVRbV4Jadae4UNtTNYlZnXaqHwv6aCzvLeM2M5TBluazX4X5
         SMP5nHPZMhA2LryAma30P2C4AJhMKA+OqnDTqIY3nG/oPpoazjV/T2lcuAdqUG/5D5hl
         hUlGMB+Nnxdy3OjinRBlRPLqmKufePXswtPmfLW6V1oRZb1/yDEBSn07rTA4HFdOHdL3
         3+HfP3oK0RPyFOpzLpE3GfX68uYcWMRRVL6hoSC5LOnpjEhOsG9RUDPGl13Q9ueDc3ti
         lEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783304492; x=1783909292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blzW8cj7qixZrZx8HMTc8WTCaoiy272JiHUFbPafbvA=;
        b=qYRn04Z1AG1/SPmoKsymNmLSMR+fGDcx/19kPe72gXCOo+Ma5W1ewHjrwle84A9kQT
         ObwVuOZur61uQ/dyr7kePb+lDlpN4ZfDSpfXRR+PU4hL1+2vFxWES+iD3XZiPZB619a+
         3hKbeSwmWsZLSkc67+YyWfuLaZWWdzZUk31F8X3M48Zk9EG7Bju7YvHBURy0W57PaRGK
         /Fc+mFRmHrpqRGUanooCe9d7XOlohlb8UGHTVrmSrBDitoGDT13/a4KtHfu6/GLqDJfW
         oaAdu9YGMGI+7e+U2T4+O7TASFUgviRIp1ZfEOj/SzrH3LKmnFeg29zW7HGsdlth5Bze
         nKkg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9LjUiCLvd7pC/464mjyXsHW/TaxzrJ5dXK71subI7saYP+w1OW3nr6+fMO9IbtjMpXL0oKFOwCvkwx2GrP9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeOb31/eAiGHbPba3vwA1N4zp6fTEsKETRAebvauJSCrvBC4Zy
	j0YS4xg1EF0pIBCGI58aqnW0zWtZCNtjuE87nyCQ26BjuFU5SEVkMlEQ
X-Gm-Gg: AfdE7ckMbGEwKts38cqvrxxWofNscmkigu9VW/y8D6Y5Kxtm5gE2uPx5AvxPoThbxCf
	76aR8hMZyNR+SoAQW5xtT7AiqdooNezCUYtI/4uBk7I0kKcNb+67w2KuqQiDQ+NgKOHBpW2vZ/Y
	/Rj2VPQ2JGdl2iOYqdG/PojGiFXEzY1LwCq7mjKxCfy57ymqOm7NRsYIq6ZEQJO+JwqxKLZTwaD
	SQdTGGSpy8u8Eq0j2p2v1cqKLPyT5AG+NodJKivqfBjMsZXnCg3/QwoyZRkQtajQezYziK86E/Q
	MYMAV1aBD+lNz826ydX6etCetHD47F5OiJnbz9ArYpMaqJlUevikOupsR2n53/5FHA1x0vqj7lh
	Gm0O/od6NUzJfByg4LPwJHDVeMAlaSq89sUdzakaxdJ8ouw47KHccHTWHO0SjiR6H
X-Received: by 2002:a17:90a:d40c:b0:37f:f089:c81b with SMTP id 98e67ed59e1d1-383394cf557mr5675419a91.3.1783304492074;
        Sun, 05 Jul 2026 19:21:32 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38146b8d314sm3764140a91.15.2026.07.05.19.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:21:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 0/8] RISC-V: KVM: Add Svadu/Zicfiss/Zicfilp FWFT support
Date: Mon,  6 Jul 2026 10:20:36 +0800
Message-ID: <20260706022046.214956-1-inochiama@gmail.com>
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

Changed from v4:
patch 1:
1. Use NACL for csr update
2. Check ISA mapping before cleaning the ADUE bit
patch 4:
1. Clear the zicfiss csr during a VCPU reset
2. Add zicfiss csr to num_csr_regs()
patch 6:
1. Cleanup SPELP after redirecting the trap
patch 7:
1. Use interrupt bit instead of number for masking/unmasking
patch 8:
1. Add missing entry for the test
2. Fix the wrong comment.

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
 arch/riscv/kvm/vcpu.c                         |   7 +
 arch/riscv/kvm/vcpu_exit.c                    |  11 ++
 arch/riscv/kvm/vcpu_onereg.c                  |  68 ++++++-
 arch/riscv/kvm/vcpu_sbi_fwft.c                | 184 ++++++++++++++++++
 .../selftests/kvm/riscv/get-reg-list.c        |  90 +++++++++
 9 files changed, 381 insertions(+), 2 deletions(-)

--
2.55.0

