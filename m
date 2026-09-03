Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAA333AD8C;
	Thu,  3 Sep 2026 07:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421107; cv=none; b=kWUwhJo7jlFbRNu/0VukS1niTjDx9SXVUF5qJrIxwyM42pRMAGDQhw1RxSicjV5rqF7hULdJd/ag/bKB6LHCWIA8obKFNytQiKzrdaOVA/SntLd/01ynVIkZaQ84+nrtUSYcWSlcTHHmdb5brEq7ZNaICh5l3IXXyGEtKlSxg8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421107; c=relaxed/simple;
	bh=Z1m8YlWqbN772ba8GsyS01fNbHHwITa1zD0swwlZtTc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dmrour7powvqaVuiRVBjTybnBZuIM+0TI1LNGWdbXAYaDVUf6bZbLpnD4wLrfQIaEj5BTqS+VAuzzt/H00BI3JXeV9rT4+XZ2WvyYfXBQ7GjZ5Xo2E9SNZ9dFVMo4XHd1oJ0cwDDhsa2c+pjWVKww1YmZaIxCUcEUfhGeimG5vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fiQCk18O; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GnBGHLHC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fiQCk18O";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GnBGHLHC"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P72WK2dflpRUDrQ2I5ggLeZ9cbv2ljHeu+k9A1omFm4=;
	b=fiQCk18OlJXgE3uCfKLzKTIOfjKxnZ6QMePaFwyXYkhHPMZyh7nBAVJqyL60lFAXXnS04/
	sZ7uL145FgHNpGodPskOUEof5mvDuV6oBOzDlLgwe+w2bd8rKJcP5OAsl9Ac4QdDOpuuFh
	eaP3zlP/Y3GmVlx5MpDNQWmtkIVF17xZeylGG4YcesB9IcKb7A7PKOgFZ6ORsOiLJtBjy5
	cNhpGObsk69gYVxOrgLhFMj3SnTpPCM5Z2tU/i2mn3IorpIvUHPuTdWJ1QhD6faAkWoRpu
	0Z5YlX0uO0dT4Bj6npvHJ8HSnrrRTmcz6mb7yGgR8cPARfPps7bcGmaV21myBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P72WK2dflpRUDrQ2I5ggLeZ9cbv2ljHeu+k9A1omFm4=;
	b=GnBGHLHCFVSVHNgLuXVhqU3vgazMTxtWSHXH45Wv0EaekAslNCMxjQsHQLCGAMBLPspu7y
	TmEgRD2pt9jr+DCw==
Subject: [PATCH v2 0/8] selftests: vDSO: Stop using libc types for vDSO
 calls
Date: Thu, 03 Sep 2026 09:38:12 +0200
Message-Id: <20260903-vdso-test-types-v2-0-1eec04eb3658@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNywrCMBBFf6XM2kgmpS9X/od0YdOpHZBEMjG0l
 P67seDK5Tlwz91AKDAJXIoNAiUW9i6DORVg57t7kOIxMxhtKkTUKo3iVSSJKq4vElW3lrRt0Ax
 NB3n1CjTxchRvfeaZJfqwHgcJv/bXwr9WQqWVLocSp7a1ddVdn+zeMXjHy3kk6Pd9/wCpuBlTs
 gAAAA==
X-Change-ID: 20251110-vdso-test-types-68ce0c712b79
To: Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421097; l=2089;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Z1m8YlWqbN772ba8GsyS01fNbHHwITa1zD0swwlZtTc=;
 b=XbizUGGgXkcA2XZCL/GS35erBVEDJzRydfElaua6KWf+JaRTbiCovjAogzvggk0LI4lcF/pZ9
 FbLYFCjYg5HC7tPh/t/rUKcmz16gXJMHJwKAChWZ9EV4eiVd+nq3WYJ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Currently the vDSO selftests use the time-related types from libc.
This works on glibc by chance today but will break with other libc
implementations or on distributions which switch to 64-bit times
everywhere.

The kernel's UAPI headers provide the proper types to use with the vDSO
(and raw syscalls) but are not necessarily compatible with libc types.
Introduce a new header which makes the UAPI headers compatible with the
libc.

Also contains some related cleanups.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Rebase on v7.13-rc1.
- Use __kernel_old_time_t in vdso_time_t.
- Add vdso_syscalls.h.
- Add a test for the time() function.
- Use __NR_* over SYS_* syscall constants.
- Drop already applied patches.
- Link to v1: https://lore.kernel.org/r/20251111-vdso-test-types-v1-0-03b31f88c659@linutronix.de

---
Thomas Weißschuh (8):
      selftests: vDSO: Introduce vdso_types.h
      selftests: vDSO: Introduce vdso_syscalls.h
      selftests: vDSO: vdso_test_abi: Use types from vdso_types.h
      selftests: vDSO: vdso_test_abi: Use system call wrappers from vdso_syscalls.h
      selftests: vDSO: vdso_test_gettimeofday: Use types from vdso_types.h
      selftests: vDSO: vdso_test_correctness: Make ts_leq() and tv_leq() more generic
      selftests: vDSO: vdso_test_correctness: Use types from vdso_types.h
      selftests: vDSO: vdso_test_correctness: Use system call wrappers from vdso_syscalls.h

 tools/testing/selftests/vDSO/vdso_syscalls.h       |  92 +++++++++++++++
 tools/testing/selftests/vDSO/vdso_test_abi.c       |  40 +++----
 .../testing/selftests/vDSO/vdso_test_correctness.c | 126 +++++++--------------
 .../selftests/vDSO/vdso_test_gettimeofday.c        |   7 +-
 tools/testing/selftests/vDSO/vdso_types.h          |  75 ++++++++++++
 5 files changed, 225 insertions(+), 115 deletions(-)
---
base-commit: 058d40ae995fbcdd8342ef875c4e94df6b93a8b4
change-id: 20251110-vdso-test-types-68ce0c712b79

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

