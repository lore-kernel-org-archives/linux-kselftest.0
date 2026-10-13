Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586C23B993B;
	Tue, 13 Oct 2026 09:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882519; cv=none; b=ATRqAEixxuvnSnuZ2MbQz8ct08gbiFoqjcBb+nCdMZ2R+MKVu32AIlupUP4Gryj7TyYcU+q+QRykaWw3nxSE95SaVDdumpCkuMZFUGWHkStivAqPUxK5+dzV0gf1Kbvc3nOB+bAev4fU+STEzSFKhy9BNnAgIldNUtTUVYgsTq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882519; c=relaxed/simple;
	bh=c8LHoVNnfucmkWOKyOpuQfcGSwC4zJohxeELy7pWMdM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=efBlecExMKMiQQSyj7imqSrmOWRgZWaRnbQ0zB74T3vP/eFRaBmr9ItswEGccbdQbDhb0RiixYTyvCYVnfm1r0ma+vD83gmIZTlhbQw6vdBKe5Hj2WJ/7IbrKtYsrOqjMJlw/DOVK8hISuU6ZOF/edLABKKYLTVmCMRASR17PWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aS6rWv4i; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aS6rWv4i"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D623169C;
	Tue, 13 Oct 2026 02:08:34 -0700 (PDT)
Received: from e127648.cambridge.arm.com (e127648.arm.com [10.0.128.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1764C3F7B4;
	Tue, 13 Oct 2026 02:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791882517; bh=c8LHoVNnfucmkWOKyOpuQfcGSwC4zJohxeELy7pWMdM=;
	h=From:To:Cc:Subject:Date:From;
	b=aS6rWv4i6VgBHNbVrmONQMIG4c/f89D0fm0fTRn5AYgKH67SDGdCXxO0mkpKgzZfs
	 DCmYZNbbw+y/DFVGDvKpt2d4u0uHJb9lPRXQGPd/lFU9A1v0NcmO+WXUPRiydAIhh+
	 8tdJYoZGuvX2imVi4Qbrb3K4dR8uY7vTwdl14pfQ=
From: Christian Loehle <christian.loehle@arm.com>
To: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Cc: Christian Loehle <christian.loehle@arm.com>,
	Rama Krishna Katta <ramakrishna.katta@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Gregory Price <gourry@gourry.net>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH RESEND 0/3] selftests: Skip SUD tests when unsupported
Date: Tue, 13 Oct 2026 10:08:18 +0100
Message-Id: <cover.1791881928.git.christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Shuah,
the series is a resend which has picked up all the relevant tags
and is ready to apply!
--

Syscall User Dispatch (SUD) is unavailable on architectures without
generic syscall entry. Such architectures return -EINVAL for otherwise
valid SUD prctl and ptrace requests, which the SUD selftests currently
report as failures.

Probe SUD with a valid disabled configuration and skip the affected tests
when that probe returns EINVAL. Unexpected errors remain failures, and the
existing coverage is unchanged on kernels that support SUD.

Original posting:
https://lore.kernel.org/lkml/cover.1786965107.git.christian.loehle@arm.com/

Christian Loehle (3):
  selftests/ptrace: Skip get_set_sud if SUD is unsupported
  selftests/syscall_user_dispatch: Skip tests if SUD is unsupported
  selftests/syscall_user_dispatch: Skip benchmark if SUD is unsupported

 tools/testing/selftests/ptrace/get_set_sud.c  |  8 +++++
 .../syscall_user_dispatch/sud_benchmark.c     |  9 +++++
 .../syscall_user_dispatch/sud_test.c          | 36 +++++++++++++++++++
 3 files changed, 53 insertions(+)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.34.1

