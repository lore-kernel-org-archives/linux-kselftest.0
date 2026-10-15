Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D753BA24E
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 02:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031516; cv=none; b=kGE9NfYbODPDpslpIJ6UXODW1W11HVAZZi6a/8Oq3JcWS4CeTafF98Tp873J/XRZSk8fSv6G4iqy1I1vi8aV/G4tmafEwsGt7vrNEdV3U51xR/yjBobrpmMzp2MEs5TKwMe/pNAVd7o1rBbHCbNxucQ6RgDsoNRjH5cL2xTd6c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031516; c=relaxed/simple;
	bh=rpQAufVRDU6MkLBrXCIxX5m9qZNTZj45nwClT+ucio8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I+6Yj+iIkId/M+hjqxf+/ybs/nsN95YCkf4S0UmY6gEM7B3ITg+vEB3c+1r5DeBOFD4pmsW+GLBbU8O8jdmASTGG8AxKfkGAlyCUSUaw5VdMqzRfqBiBRc+/soU+tx6UKtKwO8l4uxT4OmcgyxdUi4C+waq0CikvxAuwu0x5FOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSUJn9Xs; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSUJn9Xs"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-17bc533fda3so1706632c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 19:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792031514; x=1792636314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BH572G2q1Sk0OkgexfWQgRJUTAupVoLau5MvgNWX++w=;
        b=iSUJn9XsNwBOs4eE8PNsyz6pXBQj9Wyzy3eKdw8m8y8l1oOjNukrhcLl0CN2mXRGSn
         eDlOV0xw71Gj6JaRxWbZhwRjnxa6SbEjDQbLrWEbK/2ixeB8F6aCAEYTZ9U0WjQtdMEP
         V5GP2po53NhyGDXvsNgglNYFnhl+xnoqyX7bo2fbG0LlO0IG7bvjgCiuOIuEDavAPs32
         NfMsdO0cmBc/clL+xCsRY6OeeElEFavGAOLo0hZxf3biQbT9eelKbUy1u3CkLqKdRjWn
         wSZ0nbl+LTt1uN8H9cYA7f61nN9UwLLUwRDO92oQbvMDT05cV370kxmMq1Dy79JBrzZK
         HWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031514; x=1792636314;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BH572G2q1Sk0OkgexfWQgRJUTAupVoLau5MvgNWX++w=;
        b=eoSo/00FMG8uywos1z9qx7e36D/Zh+fbHC/teW8JWRXlsFrsJOBzpiRN4YXH638kJT
         wURfFf5HJK4J/5KcFWuWCbqzs1mdXIuHKNO/yVZXKPSHBfuF3Zd7a6/mtqg4WfLeuYf2
         ILYOwuQ8XtZsw3Cw2R1xfj7299zStBtN+njYfngu/f/crmUJlD/fGC17GiF9/f+bpdTo
         0cqpNwGLHouh9qYXtpX2CtI5GFd2vZglxak+fKbnWcF2msPC/PXKdhDadBxPjweaCdyt
         YyHjQDV/a7w/HCu6AeXEdLwppAKItifQrrUZGU4Y3HEioBu2QEd4qEQWIKlHkEnHGoFF
         zu1g==
X-Forwarded-Encrypted: i=1; AKwUvBwZYLQSo/4mI2Xru1AjI2fkZWUzVqugXpdZN7wpksAwGtgsAV513gDnFcX1DT/Vlye0TKf9xXB2uJtrbdPWbK4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2b2JH5IjvyMI9ItpkgetlPeqZfYaPxkXH/HXrNIBTduyKa6kX
	zXJgiDL/m6ejCauzSWsIW27JfpQgg6day28CY4ohcym8W3/b5FtabX0K
X-Gm-Gg: AYBFou2bPCIjU4Dk6lrp11Z2mYyS3O9u4651EHEI2X1K3Fu6nYotuTyOnXfdxMsoPC8
	XdIGgX8ZaOqTlSalsPRZ5ruJ/uRqUYnyUyFcEHycR3u/I8sLSPuYIMuFavffWQD4o7nERTziYCh
	SIIUYNRKsMULUwBxm91FH52U/hC0q1HLknQtOljgZlbMcQLHJ3nVNPVXmpgUaJkw/jmebW8fSN4
	kugKiGLwWmXQ0uXi+d7I2rwdriRrZFUActuc5x43d9zYa9+8BIf5dniXAy9dqV5MHIoih7dg+9S
	nIoo9AoU9HR1z/CRG/m8dGohjQlKcWmvo8UyW3Ym91+TgekiTtXJP/L6rQZmgNZzNU1rETlk8Mq
	pKxOd32ITjXnIweQ1kypxGcBL9wLYZMPau59OkvgyqvKWlcTCN2byowEHbmJJ5qH8Vggs/HvPSh
	RIEcQ6cbRQxnzWcn4luQE8oKnS+QG31wi4Eryz2atppqjQSWodc17q/7M1nrRm0UtC
X-Received: by 2002:a05:701b:205b:20b0:141:5281:8a41 with SMTP id a92af1059eb24-16a5e49fdf9mr22315698c88.9.1792031513434;
        Wed, 14 Oct 2026 19:31:53 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567bd18sm49912225c88.21.2026.10.14.19.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:31:53 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Li RongQing <lirongqing@baidu.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	HyeongJun An <sammiee5311@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/2] x86/shstk: don't leak a shadow stack when clone TLS fails
Date: Wed, 14 Oct 2026 23:31:45 -0300
Message-ID: <20261015023147.519257-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

copy_thread() maps a shadow stack and set_new_tls() can still fail.
That error goes to bad_fork_cleanup_io and skips exit_thread().
bad_fork_cleanup_thread calls exit_thread() only after copy_thread()
has returned 0.

commit 748c90c69336 ("x86/shstk: Remove useless clone error handling")
removed the shstk_free() on the set_new_tls() failure. Restoring it
only there puts back the single free. The allocation-error return
still aliases the parent, and the exit_thread() path is left alone,
so the double unmap that commit avoided does not come back.

The selftest assumes /proc is mounted. A clone3() with a valid TLS
must succeed before EPERM counts as the TLS failure. No CPUID support,
no kernel support, or a locked feature skips the test. Any other
ARCH_SHSTK_ENABLE error fails it.

Sixteen clone3() calls with CLONE_VM|CLONE_SETTLS and an out-of-range
TLS leaked 16 shadow-stack VMAs without the fix. With it, the count
stayed unchanged and call/return on the parent still used the
original shadow stack. Tested with user shadow stack on the host and
in a one-vCPU KVM guest (-cpu host), same configuration with and
without the fix.

The diagnosis and the selftest were drafted with Grok 4.7.

Iván Ezequiel Rodriguez (2):
  x86/shstk: free shadow stack when copy_thread() fails
  selftests/x86: shadow stack must survive a bad TLS

 arch/x86/kernel/process.c                     |  12 +-
 tools/testing/selftests/x86/Makefile          |   3 +-
 tools/testing/selftests/x86/shstk_clone_tls.c | 364 ++++++++++++++++++
 3 files changed, 376 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/x86/shstk_clone_tls.c

-- 
2.43.0

