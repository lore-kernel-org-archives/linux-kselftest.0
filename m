Received: from mail-108-mta98.mxroute.com (mail-108-mta98.mxroute.com [136.175.108.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFC827AC45
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 18:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042947; cv=none; b=I84CM5Go8pme7tTombNEk6VJlT5MX9/hHe/c07WtnyYbNE2rCtAdyvJFyoD/+3Mw0gJceOegOaJZsU/9PZ3HSUfc8EeRZySaT/RmPvFm94gHjggt8ITqm9X1hV/mp0NS+73ya3yMV3ZHC9mW55X5JGUL1LYwq3BbIf0JoEOdNLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042947; c=relaxed/simple;
	bh=E1qoYbPY72VOUaTyTqVWAo8+7+DUyh5NunycRNJfIkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=egi51JeJ+UKsTmbpGndAMfXBl3wvnoK1xRlQxzZER5CqbSnNYHF8tqvIExcIZA3J03fpjbDddtGJ+QpetiQjfyWzw2nuBg8GxNXCdg3r80Kt2RxWg0fxrGz6HV+T/UQFvgX4rcDvW+PX7MkwhTmANVGcUfyG9MziM53YMZQv3so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=fail (0-bit key) header.d=wii.dev header.i=@wii.dev header.b=vEp+adzh reason="key not found in DNS"; arc=none smtp.client-ip=136.175.108.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=wii.dev header.i=@wii.dev header.b="vEp+adzh"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta98.mxroute.com (ZoneMTA) with ESMTPSA id 19e373447c300067f7.00d
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 17 May 2026 18:30:33 +0000
X-Zone-Loop: 241ff7b398d301c78cbd37b707cf55b62c0abef10215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:
	From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=I75nMnOKLfoCIjMajkiutcvVaxfCi+4EYVBxTIKxUoo=; b=v
	Ep+adzhE4mTTZeGPDgXfgZ2rO5oWCoThjJrku8VQ3b+drcXVWjjUY4Dp+Yb0YJR+hefHp80aEFLGY
	ktt360b/Iroajj8HOnhtgb4aKIwcc0W6p1/JhXEcoFC0ZbUYTpMMhKBQvhGI7559ynVHdBynwJ10H
	5gWMdVjWik68ryckByhZaM16/JyfV7F2iGTqqdi6w+WX9YXkpOFqXox2Qs1x+HtT+gylLYU/4lBri
	hSOaDw7pQnXWxJO9dTQZNc5sD7TkIIrzNkQPI+6spjmKFjG1Kt8qHqOtwgd39q3BH9zyhkRWSg+kO
	ciynJEwJGEFqZl+VAWJItU9IsUPATKEpQ==;
From: Richard Patel <ripatel@wii.dev>
To: x86@kernel.org
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] Usermode Indirect Branch Tracking
Date: Sun, 17 May 2026 13:30:17 -0500
Message-ID: <20260517183024.16292-1-ripatel@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: ripatel@wii.dev

I was quite surprised that the Linux kernel still does not allow
userspace to enable x86 IBT (indirect jmp/call integrity).

Compilers and linkers have been emitting 'endbr64' IBT markers and ELF
support notes for a while now.

The hard work was done years ago by Intel:
https://lore.kernel.org/all/20210830182221.3535-1-yu-cheng.yu@intel.com/

In summary, usermode IBT requires 3 things:
1. Set the CET_ENDBR_EN bit in MSR_IA32_U_CET for each IBT-enabled thread
   (PATCH 2,5)
2. Back up the WAIT_FOR_ENDBR bit across signal handling (PATCH 3,4)
3. Provide a way for usermode to enable it (PATCH 5)

This builds on top of Yu Cheng's work, with some adaptations:
- FRED support
- Implemented the existing prctl(PR_CFI_*) API
- Removed ELF parsing (can be added later)

Unresolved questions:
- Is there a cleaner way to do the WAIT_FOR_ENDBR XSAVE fallback?
- What to do about 'notrack jmp *rax'?
  I leave CET_NO_TRACK_EN enabled, which weakens IBT, by enabling a jump
  prefix that skips the ENDBR check. GCC emits it for jump tables
  (-mcet-switch). We could introduce a PR_CFI_IBT_STRICT bit.
- There's some obvious overlap with arch_prctl(ARCH_SHSTK_*).
  Happy to use that API instead.

Richard Patel (7):
  x86: add userspace IBT config option
  x86: shstk: don't clobber IBT bits in U_CET MSR
  x86: signal handler support for IBT
  x86: ban 32-bit sigreturn when user IBT enabled
  x86: expose user IBT via PR_CFI_BRANCH_LANDING_PADS
  x86/entry/vdso: build with IBT support
  selftests/x86: test usermode IBT

 arch/x86/Kconfig                            |  17 ++
 arch/x86/entry/vdso/common/Makefile.include |   3 +-
 arch/x86/include/asm/cpufeatures.h          |   1 +
 arch/x86/include/asm/ibt.h                  |  16 ++
 arch/x86/include/asm/processor.h            |   5 +
 arch/x86/include/uapi/asm/ucontext.h        |   5 +
 arch/x86/kernel/Makefile                    |   1 +
 arch/x86/kernel/cet.c                       |   3 +-
 arch/x86/kernel/cpu/common.c                |  14 +-
 arch/x86/kernel/ibt.c                       | 175 ++++++++++++++++++++
 arch/x86/kernel/process_64.c                |   2 +
 arch/x86/kernel/shstk.c                     |  12 +-
 arch/x86/kernel/signal_32.c                 |   5 +
 arch/x86/kernel/signal_64.c                 |   6 +
 tools/arch/x86/include/asm/cpufeatures.h    |   1 +
 tools/testing/selftests/x86/Makefile        |   5 +-
 tools/testing/selftests/x86/user_ibt.c      | 157 ++++++++++++++++++
 17 files changed, 420 insertions(+), 8 deletions(-)
 create mode 100644 arch/x86/kernel/ibt.c
 create mode 100644 tools/testing/selftests/x86/user_ibt.c

--
2.47.3

