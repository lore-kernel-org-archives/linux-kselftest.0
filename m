Received: from mta0.migadu.com (out-96.mta0.migadu.com [91.218.175.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59554B1D18
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 23:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686597; cv=none; b=H7JoH/x+2SisaqSAyVkHdc+61J9WJcuDGcM5RB0pPH5ZCCEws4kFcXtDX8L0jdRcf9BJMbaPgsr/wIKoR59HJzYgJ8MSSi50VrZViPsClHETo8I0EJnRTQREM1gXhudaasqNJRtMMsRa5i/vJo1l4gFrw1xD2cHK01iEOBf47oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686597; c=relaxed/simple;
	bh=TOPFcJ3OLue1my6k+tvm/vFT1inUKfq8HLNlryKVd5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E1IWniWPftiHnFt15wT8Z+0eaeCRnOHkeq5cElRP6kEZ8PF7rNd+JOGqpKNTPYG58SfMneA7XxPp45kPYK7WU7KNCes8aw6YkVJxKpSwQAOzrmpLV7arcsy7x+RaFLjnaoXOaiHf+zYi5y+Hn805STPDcMwX4c9l9bH4MZyEW20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CWGjYgyU; arc=none smtp.client-ip=91.218.175.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CWGjYgyU"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TOPFcJ3OLue1my6k+tvm/vFT1inUKfq8HLNlryKVd5Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789686586; v=1; x=1790291386;
 b=CWGjYgyUnY45aMkpuQsqVBdBDQT6QylACUHDGwM49fjQCIXriDSQ+BrIa1IFonDBRL0vnIaW
 FHlYgJa+hQpDfI/km6RsYm2p99KH6YTYcrPnjbi3IErZY0Nny+17BZtckXzHmFJZIb58XR1EuiJ
 xQ2FyK9k6zjRutt8yY/wUgUo=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dec671d6b00be4b4;
	Thu, 17 Sep 2026 23:09:36 +0000
X-Mizu-Trace-ID: dec671d6b00be4b4
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: Xin Li <xin@zytor.com>,
	hpa@zytor.com
Cc: Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Paul Gofman <pgofman@codeweavers.com>,
	Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH 0/2] x86/fred: Reconstruct fault state for rejected INT instructions
Date: Thu, 17 Sep 2026 16:09:05 -0700
Message-ID: <20260917230907.2080792-1-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series reconstructs the #GP signal context for rejected INT
instructions with FRED enabled. The incorrect error code and saved IP
break Wine's handling of INT 0x2d, causing Elden Ring to fail with a
spurious access violation on Panther Lake.

The software event flag handling follows the same reasoning as the
existing sigreturn fix in prevent_single_step_upon_eretu(). The second
patch adds 32-bit and 64-bit signal-context and ptrace resume coverage.

Both selftest variants pass all 29 checks on patched FRED-enabled
Panther Lake and on a non-FRED AMD host. With the same binaries on
unpatched Panther Lake, 16 signal-context checks and the first ptrace IP
check fail. The two dependent ptrace resume checks are not reached.

Separate continuation testing with the fix matched an IDT baseline on
another system in both bitnesses: unchanged IP retries the INT whether
RF is set or clear, and advancing IP resumes at the next instruction.

One observed ptrace divergence remains separate: after rewriting IP at
the stop from raise(SIGSTOP), PTRACE_SINGLESTEP traps before the target
instruction on FRED, whereas IDT executes it. The selftest starts from
an INT3 stop to isolate rejected-INT behavior. The syscall-stop case is
a follow-up investigation outside this series.

Matthew Schwartz (2):
  x86/fred: Reconstruct the #GP context for rejected INT instructions
  selftests/x86: Check signal state for rejected software interrupts

 arch/x86/entry/entry_fred.c              |  11 +-
 tools/testing/selftests/x86/Makefile     |   2 +-
 tools/testing/selftests/x86/int_signal.c | 311 +++++++++++++++++++++++
 3 files changed, 322 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/x86/int_signal.c


base-commit: b5a051f6b840d48f159166ef073d3021989bfb50
-- 
2.55.0

