Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A8939E190;
	Tue,  1 Sep 2026 17:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282579; cv=none; b=Z4kCf1FqHjPn1lIHBUSPrQfSq0yDdx6l8MaA1hrjNdMFSSFSrvudo8UyAZBytE5nloOdIO4IOWODB3E2h+Gh69K5avwf1VzGdpOe055qGCrKE08LItCKQVE8nz0hj/Owhxygx5l4Vzdlq9WKRIb+OjbEQuXXI3915M3hduEp4VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282579; c=relaxed/simple;
	bh=Xwp7BqTlFHU2+h5taJ1TupOHnudFKIttcSXgXudkONI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GugUDCDCyXim0WfV+CdNyMZLovnWM2NNKD+cZMGlpsxl/jK+guHWtNAKnjFLDQVo4EaypQtYK1bSm1Qwyl3I/+pv2UeqQRHsR98i7f6IYWyoZDyM1FdBy/3IqDua135mHR0FxAv39vdlN7ESwiM8Z1egIq3o3RI85nCK3motSEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUnq8FAf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUnq8FAf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B761F000E9;
	Tue,  1 Sep 2026 17:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282578;
	bh=niQ7ArXK839IrmojSZdpTuRGN/mclemr53y3+MdghMA=;
	h=From:Subject:Date:To:Cc;
	b=VUnq8FAfj663ahc0ckI3nHR/e3ZugmGsBJBVeF8BERfYywi18Zyyf6hPek2lOfHDf
	 Y0zh/8p0sOqOIIq3Ef6N56fpZzyFjBHvGkg4/PZeAVIGRMxKvUumx296G8NOrdAeRE
	 +HeZi3L4wL8oc3eHaTSvzXKTgg5g6mUMtl6+0tFkNlQehXDGzl8Kf95yJia4SHMHc1
	 1Ryz73ZjxA+X1CpbjGH2ortW/nDstEV6ooH6INrEzLKl+XoEYG8PYd8jVhjQ4bP52W
	 fpiDj1ECFQVC5id/WbPYGgaPNKI1T5d5oq0U0s6uKFy3GdHQjQ+PhIjUPBaGTAlwd+
	 gWF/OoiQvWs/g==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/11] kselftest/arm64: Add coverage of interactions with
 KVM to fp-stress
Date: Tue, 01 Sep 2026 18:06:40 +0100
Message-Id: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACAGl2oC/x3MSwqAMAwA0atI1gZirQpeRVwUjRrED4kUQby7x
 eVbzDxgrMIGbfaAchSTY08o8gyGJewzo4zJ4MhV5KnAoFvtcTrRLmUzXOOGvnE0hJKaMXhI5ak
 8yf1fu/59P3OD6NRlAAAA
X-Change-ID: 20250401-arm64-fp-stress-kvm-4720ca307da4
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3591; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Xwp7BqTlFHU2+h5taJ1TupOHnudFKIttcSXgXudkONI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlwbEW4G5k3XTrcrrjnQ6VikYu0epZZdzpf7Zu
 3yuXohU1AKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcGxAAKCRAk1otyXVSH
 0HH2CACB9AgM+/rmCZPaNYdhQ4qDTGFaMf9BHn3DSRV5N9+nfKcaYAQXsPmZnB6zeeu0IMhrZpN
 yOVcRQPc6GJhWAFSJ/Xtly+LRL0xEQky2SKMWYnSAH8n4ZQZYjWsn07lY6Gu9+WYXGE5PDqNoQG
 HStVPlP9qftJhgwbzyw7KGaKyRx86bTIJkpOz/vlrIvJ1QNgK1R6dZSVQGkSfB9+JbUYhoJsxHJ
 IIidx2fBJtc88fwIS+xsDDk/oMyN5CCf4t7sXbbTkkGbNGC0G4OxjAtuAE6D9F9CorKMnXxmN/V
 9QzgVYo+1drFqVwlliTfiQ5sV9USnimUgNdhM/aTq8+7NSsN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Presently we don't have any automatic stress testing for the handling of
floating point save and restore with KVM, nor it's interaction with the
host's management of the floating point registers.  The majority of the
focused stress testing has been done by running the existing fp-stress
selftest on the host, starting a guest and then running fp-stress in
there too but this has been a manual process rather than something done
as a matter of routine by CI.

Plug this gap by reworking the test loads so that they can be run as KVM
guests, using a simple VMM that provides the interface that fp-stress
expects from it's test loads.  We run the FPSIMD and SVE tests in KVM
guests for half the CPUs, if EL2 is available then half the KVM tests
will use it.  The tests run in a minimal environment with the VMM and
test binaries tightly coupled to each other.

There's more coverage could be added, but this is an improvement over
the current situation and can be built on in future.  Off the top of my
head:

 - We only test nested guests running at EL2 with E2H set.
 - We only run the guests at the highest VL they support.
 - Enabling the MMU would avoid surprises due to the performance
   differences.
 - We do not run any protected guests (this currently taints the kernel
   so should wait until the pKVM support is less experimental).
 - It might be useful to have the VMM signal handler save and restore
   the guest register state to exercise that path.
 - Possibly it would be useful to disable irrelevant features so less
   time is spent context switching non-FP state?

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (11):
      kselftest/arm64: Factor Linux syscalls out of asm-utils.S
      kselftest/arm64: Factor shared signal handlers out of fp-stress loads
      kselftest/arm64: Move exit calls out of fp-stress loads
      kselftest/arm64: Use exit_error() rather than SIGABRT in fp-stress
      kselftest/arm64: Exit with an error code on data mismatches in fp-stress
      kselftest/arm64: Factor startup code out of fp-stress load programs
      kselftest/arm64: Remove the sched_yield()s from the fp-stress loads
      kselftest/arm64: Add a very simple VMM for use in fp-stress
      kselftest/arm64: Build KVM guest versions of the fp-stress loads
      kselftest/arm64: Use execv() to start fp-stress test loads
      kselftest/arm64: Run KVM guests from fp-stress

 tools/testing/selftests/arm64/fp/.gitignore        |   4 +
 tools/testing/selftests/arm64/fp/Makefile          |  64 ++-
 tools/testing/selftests/arm64/fp/asm-utils-kvm.S   |  86 +++
 tools/testing/selftests/arm64/fp/asm-utils-linux.S | 181 +++++++
 tools/testing/selftests/arm64/fp/asm-utils.S       |  36 --
 tools/testing/selftests/arm64/fp/fp-pidbench.S     |   6 +-
 .../testing/selftests/arm64/fp/fp-stress-kvm.lds.S |  58 ++
 tools/testing/selftests/arm64/fp/fp-stress-vmm.c   | 596 +++++++++++++++++++++
 tools/testing/selftests/arm64/fp/fp-stress-vmm.h   |  17 +
 tools/testing/selftests/arm64/fp/fp-stress.c       | 230 +++++++-
 tools/testing/selftests/arm64/fp/fpsimd-test.S     | 121 +----
 tools/testing/selftests/arm64/fp/sve-test.S        | 139 +----
 tools/testing/selftests/arm64/fp/za-test.S         | 138 +----
 tools/testing/selftests/arm64/fp/zt-test.S         | 131 +----
 14 files changed, 1244 insertions(+), 563 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20250401-arm64-fp-stress-kvm-4720ca307da4

Best regards,
--  
Mark Brown <broonie@kernel.org>

