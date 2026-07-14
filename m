Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09F5481657;
	Tue, 14 Jul 2026 15:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044098; cv=none; b=ojA4FPwDnL5RJ/zUJCVrjXqudCN1aj0uNzVtvbKnfH9vAf2Rh64ONY1YfSbQW9YVNY+F9jm7M7lm7qlANLCrSLUCIax1sWeTat1vlIWOTGblWy7msRy7Z4B7zr1dqOid6Sxfp9w0Cir3fxy/+f0+5jeKGheP6k6pGpotstshBQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044098; c=relaxed/simple;
	bh=9aXdBWEwsJumyCg9xLtSRXFaeIdV2MMmJsPDDfWFekQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W0wWcB63Rbv9oJ0dfARySwnsag/otk/3R9jjdz0vzADNauOXxd2j78Rl/tcHKxWBWuWngOoJFAERfP8l0mZer+Zz5T2RaMmjcq5f/TkAK4i90I5+a51OHJ8lEPE1inAASmUNQfQo1/A9r7v3tC20hSLbBBNW5PzX0kNGkpIsaWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UhCtz/qg; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UhCtz/qg"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14FD7339;
	Tue, 14 Jul 2026 08:48:08 -0700 (PDT)
Received: from fedora (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DA393F915;
	Tue, 14 Jul 2026 08:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784044092; bh=9aXdBWEwsJumyCg9xLtSRXFaeIdV2MMmJsPDDfWFekQ=;
	h=From:To:Cc:Subject:Date:From;
	b=UhCtz/qg/acRgMI7Pp6smqYU+PiwBete9G16MDCQ6cx7suMrutm1GT77hMTP6v7f0
	 auwz1TaacU4NdPpMHTvlTHaPEdSvful3nzSEibza4/cQmNx7ivjQNex0jmc5LHfLIW
	 B866ynTrO3WWgy9hz2n19hbHm8uH4Sc1Ts6rP/5M=
From: Bill Roberts <bill.roberts@arm.com>
To: "H. Peter Anvin" <hpa@zytor.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Bill Roberts <bill.roberts@arm.com>
Subject: [PATCH 0/2] x86: Support shstk via prctl
Date: Tue, 14 Jul 2026 10:47:38 -0500
Message-ID: <20260714154740.140431-1-bill.roberts@arm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The motivation for having a common interface between x86 and others is:
1. Common permission checking for an LSM (future patches)
2. Common userspace

This leaves the arch_prctl interface intact, so older userspaces will
continue to work. However, for item 1, when we introduce LSM hooks, they
will need to reside on both the prctl and arch_prctl interfaces but will
both call into the LSM with all of the same permission bits and checks.

The SE Linux patches will follow these, after I address any feedback on
these patches, since they can stand alone.

Bill Roberts (2):
  x86/shstk: support via prctl
  selftests/x86: add generic prctl shadow stack test

 arch/x86/kernel/shstk.c                       | 35 ++++++++++++
 tools/testing/selftests/x86/Makefile          |  3 +-
 .../testing/selftests/x86/test_shadow_stack.c | 55 +++++++++++++++----
 .../selftests/x86/test_shadow_stack_prctl.c   |  3 +
 4 files changed, 85 insertions(+), 11 deletions(-)
 create mode 100644 tools/testing/selftests/x86/test_shadow_stack_prctl.c

-- 
2.54.0

