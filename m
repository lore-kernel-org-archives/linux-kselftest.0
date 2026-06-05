Received: from mail-108-mta165.mxroute.com (mail-108-mta165.mxroute.com [136.175.108.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09A03EE1FA
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 18:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780685615; cv=none; b=rm2L+OrJnPDBQTkBHyTCIPq0LG5r8t9DCIIrzhZVtUk/VUuWmjrUebM3k2DnCCz6Oe+BQWPwitA7IgVkPL76QjDIyeTQr8/kReIUI+gpowppVo43+1F78oXlUyingp1w87Cwd2Z8kxGiEPPAeMox+44Ez5MN4S5KzWcmE0eH1Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780685615; c=relaxed/simple;
	bh=xDZYPUEvJtvF2g6rvBagwNtcg2951Bd7HeckMQY7nb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EnesDG7lBtnCmwF7FxFwDZMHP1/L1RVOKTF2JoZNTYUFhrIiy8/CatZ1hs2k+h9ipdne+Ygt8Oldh/9EYxs/dSAAY8aw8KQ3tFp3dnRSrqtmQDuenX3GLgbrG6PfYjx1L037KetACyhjlCdsNt5LfhzcRWXlSWbRIdfoj933mc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=SCrtj17i; arc=none smtp.client-ip=136.175.108.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="SCrtj17i"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta165.mxroute.com (ZoneMTA) with ESMTPSA id 19e991d5f4300067f7.00f
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Jun 2026 18:48:19 +0000
X-Zone-Loop: cc83942d69299d10129251a54557538d1a01c587469d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:
	From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=tkW0+TrK6GB0qXg9yfN0G2cZbNbzRldZbtR9viXCy98=; b=S
	Crtj17ieZCJRoKE0EMRj+RGosK40bemIaFSd/U3a2qp7L2AueDWJiIjhdyI2LAgEaCiXrjIXRDSBG
	KAIrSmYo3bOuKzm4vXns2n+HJ+JIkWtemH6SdcZc1Vszgid2AWYhthI3ApXqC9yqncfQhZj2DG+kK
	k6cze2bqhpWeMHre/NFpo6ZPoeju4mK5jp9ugDwW3c3BgQHv6OSd6fRVvW3KZcKHWGY3KrIEJCYVm
	6TLjpTP8cUXwwJmVqWRWwnHNw6ffU83c299mlJYJnYLo0OLTlhT3b5dvbOLYPkTN7oYQUeq24PxhY
	kTtOqr6at835Ju/BXgLsIya493WauEnsw==;
From: Richard Patel <ripatel@wii.dev>
To: x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	David Laight <david.laight.linux@gmail.com>,
	Andy Lutomirski <luto@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Weimer <fweimer@redhat.com>,
	Richard Patel <ripatel@wii.dev>
Subject: [PATCH v2 0/5] Usermode Indirect Branch Tracking
Date: Fri,  5 Jun 2026 18:47:11 +0000
Message-ID: <20260605184715.3383415-2-ripatel@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: ripatel@wii.dev

Adds basic support for x86 userspace IBT.

IBT is part of Intel CET. It requires indirect call and jump targets
to start with an endbr{32,64} instruction, otherwise throwing #CP.

In summary, this patch does 3 things:
- Config wiring ensuring supervisor XSAVE contains IBT state
- Allow userspace to enable IBT via prctl(PR_CFI_*) for an entire thread
- Enable IBT support (ENDBR instructions) in VDSO

Unlike the arm64 BTI API:
- does not support mixed usermode (all or nothing)
- does not touch page table code
- not enabled automatically (no ELF GNU note parsing)
- temporarily disables IBT enforcement when handling signals
These can all be cleanly added later.

The main question is whether glibc is happy with this prctl syscall API.

Changes from v1:
- Removed all signal handler changes
- Removed all uapi changes
  (v1 saved state via a redundant uc_flags bit, which was a complete
  mess, and not compatible with sigframe_ia32)
- Don't allow unknown PR_CFI_* syscall flags
  see RISC-V patch: https://lore.kernel.org/lkml/20260518183918.322545-1-ripatel@wii.dev/
- Added 32-bit support

The original usermode IBT patches were written by Yu Cheng years ago,
but are quite different (no syscall API to enable IBT, no FRED support)
https://lore.kernel.org/all/20210830182221.3535-1-yu-cheng.yu@intel.com/

There is one notable gap in this patch series, to do with signals:

  000a: mov rax, 0x100a
  000f: jmp rax
  *** signal occurs ***
  *** signal handler runs, does sigreturn ***
  100a: nop

The above sequence does not crash.

With IBT, it should crash at the nop (because an endr64 is expected there).
The IBT state (WAIT_FOR_ENDBR in IA32_U_CET MSR) is not backed up to the
signal frame though.  So, when userland does a sigreturn, the CPU has
forgotten that it was doing an indirect branch before the signal.
(This specifically only occurs with signal handlers that sigreturn.)

This is because IA32_U_CET is part of XSAVE 'supervisor' state, so
regular XSAVE/XRSTOR can't access it.  Doing a manual backup is tricky.

A related problem is that the signal handler routine is not checked for
endbr preamble.

Basic IBT is better than no IBT, though.

Richard Patel (5):
  x86: add userspace IBT config option
  x86: shstk: don't clobber IBT bits in U_CET MSR
  x86: expose user IBT via PR_CFI_BRANCH_LANDING_PADS
  x86/entry/vdso: build with IBT support
  selftests/x86: test usermode IBT

 arch/x86/Kconfig                            |  18 ++
 arch/x86/entry/vdso/common/Makefile.include |   3 +-
 arch/x86/include/asm/cpufeatures.h          |   1 +
 arch/x86/include/asm/ibt.h                  |  14 ++
 arch/x86/include/asm/processor.h            |   5 +
 arch/x86/kernel/Makefile                    |   1 +
 arch/x86/kernel/cet.c                       |   3 +-
 arch/x86/kernel/cpu/common.c                |  14 +-
 arch/x86/kernel/ibt.c                       |  98 ++++++++
 arch/x86/kernel/process_64.c                |   2 +
 arch/x86/kernel/shstk.c                     |  12 +-
 tools/arch/x86/include/asm/cpufeatures.h    |   1 +
 tools/testing/selftests/x86/Makefile        |   5 +-
 tools/testing/selftests/x86/user_ibt.c      | 247 ++++++++++++++++++++
 14 files changed, 416 insertions(+), 8 deletions(-)
 create mode 100644 arch/x86/kernel/ibt.c
 create mode 100644 tools/testing/selftests/x86/user_ibt.c

--
2.47.3

