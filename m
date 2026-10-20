Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507645;
	b=1y1YxVukgL6rtg0Jjq8mFoA2e+twjDsmk3GD8XL1fC/dIFz3fUbh2L4KcoaYBE8uACa+
	 c7J3T176dD18SxhERhTMzi97gPrbo94jbaXldRG2F2U33aMDRJ3AnE2ZFBdPe+JLbGpwa
	 eDDsUYAgZvp2D1Avgu2ESpnUU3q159JEH8cdOt5K+ofrIkp8LErONPHsvMwRhTD3JL+fa
	 Hf4uCCflbY3/ZPl7ohBWEEENa1AdGysS/e9vLVlNC/rsmnFPlHtVQOSaS+GGrkFB7fDjT
	 nIpXJ/GKNw2rgYIIriexWegnky/DrCYS5FdBOHXVegUa1iRGVGNE+eI5Ve9I4KqmqOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mML0rlUQf2leT75dFk0AVhURG3XCgO5T9MI2E8M1gKk=;
	b=iw+ppZ0Nj+ccXmN8Cb9VJVxnbgUHPNE4ATCN7t8T0nLJAQvm+CGpCs4so8NFAPsptP98
	 t0mMYpSZjSV5WRmWbcrdzwaxoM7vsfvFb2DB2BlZ6Cs9zxt2pjcEtrfqq28zv4WhC04Jy
	 P7DileQ2aSiYlv1leyr0PmeH35LfzBZ2sstITImMMc8Apt7n4wCKLuanVuJcFmfvVO364
	 TSNGsY+zPfBXt7WW+fFnQE8aF2llMfuSnFUuUkuKojddKItpflkEV0x86KRAp2ZMuJVAR
	 XHbMCdLw2JgA+W1mZhWoFStXrIB2hD0Ngll67Fk9QPFNKAUgWTMtrjxmkcyrwt/hXsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=JLw9Ve2n;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECFB606A319
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ECFB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=JLw9Ve2n
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so581846e0c.0
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792507643; x=1793112443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mML0rlUQf2leT75dFk0AVhURG3XCgO5T9MI2E8M1gKk=;
        b=JLw9Ve2nd6OfWvxG65xg2MVU2rKv5+TPevMJy+St78VqfCSDLsDR0ZMmXCWQVDCt4z
         4X7SuEfP/eOYVkT2WlQAxBn7oPePhKX4T4Oks4X8Z1/UH85qwYrZ49Ugt75mz4vW4vOE
         5tE6yz1zZ3zBF5vYB9SyHPBkoznuHLqbemggwt3qBV3q68pShx2LmlsWZwuHW0VPLgsx
         gw1NgI46R2kv9ofC96ehogelRjsrVn+88yfGOM+mdA6FNJxjmWMh9oLMCGnGhzOMCsP6
         wJZhwj2niZiv3FK2I8ns95OCdCQVSY7cqTpAfxb7TK9VooMPBhpQGef+/rWSDHY7f37c
         fDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507643; x=1793112443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mML0rlUQf2leT75dFk0AVhURG3XCgO5T9MI2E8M1gKk=;
        b=PlVBrK0Rm6ozmZgFYzuF0bV8JvYbYF/50rP7hWyupupEf5hc2VHKaJOJuNshaU/34q
         SUKDF+t4yI14O8NriWQ3ke/O3u5ZoeSZHgm56Hj07x2a/gVNEdA2kdOf+A8tz1kkxQp6
         6atrrhp74qcXO+oy/mzyDjemvT7vVYCipdFyZo5ly88BKR6wjGbeoLjxv7g6LOtlvtMw
         jRlzmViziIoxGycQ7pNTm5Vtz9xqdElVRahaDzGx+yEmfgtHXRK5Vtc3gnu8UhPT8vdd
         90oqgaYUtgSHvcxnUt6LeaAsiEe09qBwAa9fcjdStHkVbOdvwetyxXedY2AzZ3QW166z
         7lTw==
X-Gm-Message-State: AFq9FYLh8a3oPJvGhJYWrV0yNUCmWvh2epdod8i3v3/2pCJBmnA7jok2
	8Ko0PxKDmtI3ONowHQx6iWQwhgefhXy3Z2UcfemYOKatAP+CFpdTp1Vohnkzb0ITV970myqvK3r
	cjz/c
X-Gm-Gg: AYBFou1tHMR/Ksjm/5Q5EL/72M7bzGE8R6ANhyLObmkgMY7/ZOIkBhSjPf2eUaN4bO6
	N5PFPvVyxqsLIavNg78MfIDmwILyGWjjlLN/82ibn4wRw4c3UnXuOoeYTz1W/5aF5TkceRAuLHM
	ujwSFzuJYoMLSwNXZ7ZK+2zARuRs2yTUNvGqrS19xa6UIX+oWnURmQxuboKjxatNKYNTZpzm87E
	8w84ck+JvOOuSLKW23ZvCsnoFlrHWZQPV72aLYyxo+eDRxkwArhpajUK1sRA8Xd2DXivir2bw32
	tZ/INTnWwpZ85S3PfPDIHVAFqGtkCszZWe0uq3uTfV4S4mMU6Dqmv02mR2KdtJqm1svl5eYL3qD
	sug6JIsCCfnZr62HpG8sw49D9mi4f/cuqZGEfMPmv+6aBhP/bGHfjzj+WauWaYUb3SvpoTpTNdV
	d0Ux3q5hlNol3ZdNVNBXQ8+mAaZOltXSTguFtxM5ZX6fUNr0O3YHq9G/pb5cvC/8QXuIkWBhklL
	LVnR/i29FWPH9rshg5kY/3vVx280cAFFHEANGQbkjyaKWwuUSTwtEwkS4bz3HHCQxLNheQsKagO
	QRuvQ33ckWCY0KTfayCKccIa+QOjquhGpm4f3VcXmls9H9EP6mklqEL//j+pIShWOPAyHT7zW0V
	u
X-Received: by 2002:a05:6122:1790:b0:5e9:5e79:aa5 with SMTP id 71dfb90a1353d-5eadcb1713cmr603117e0c.7.1792507643385;
        Tue, 20 Oct 2026 07:47:23 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b536ccdsm12920421e0c.13.2026.10.20.07.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:47:20 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [PATCH v2 0/2] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
Date: Tue, 20 Oct 2026 10:47:02 -0400
Message-ID: <20261020144710.4154339-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, LUO sessions are frozen automatically only inside the
reboot(LINUX_REBOOT_CMD_KEXEC) path, where luo_session_serialize()
iterates through all outgoing sessions under global write locks and
freezes them serially during shutdown.

This series introduces the LIVEUPDATE_SESSION_FREEZE ioctl on session
file descriptors so userspace can freeze a session as soon as it is done
with it, rather than delaying until auto-freeze at kexec time. Because
luo_session_freeze() only acquires the per-session mutex, userspace can
also freeze multiple sessions concurrently in advance, reducing kexec
blackout time.

Once frozen, no further files can be preserved in the session and
subsequent freeze attempts return -EBUSY (or -EINVAL on incoming
sessions). During kexec, already-frozen sessions skip the late
auto-freeze step; if an early-frozen session is closed before kexec, its
files are rolled back via .unfreeze() before being unpreserved.

This series is based on liveupdate/next commit 27be83a12b24 ("Merge
branch 'lu-pci-preservation' into next").

Changelog:
v2:
- Rebased onto liveupdate/next (commit 27be83a12b24 ("Merge branch
  'lu-pci-preservation' into next")) and split out early session freeze
  into a standalone series (tmpfs preservation and its per-file user
  argument plumbing were spun out into a separate series).
- Patch 1:
  - Drop struct luo_file_set_ser * from luo_file_freeze() and
    luo_file_unfreeze(), and rename the session helpers to
    luo_session_serialize_one() / luo_session_unserialize_one() so all
    of struct luo_session_ser is populated and cleared in one place
    (Suggested by Pratyush Yadav).
  - Unfreeze the session's files if luo_ucmd_respond() fails in
    luo_session_freeze().
  - Update remaining reboot-only wording in luo_file.c kernel-doc
    comments.
- Patch 2:
  - Add checks verifying that non-zero reserved bits and freezing an
    incoming post-kexec session fail with -EINVAL.
Link: https://lore.kernel.org/all/20261015093816.2438942-1-pasha.tatashin@soleen.com/ # v1

Pasha Tatashin (2):
  liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl to freeze sessions
    early
  selftests: liveupdate: Add tests for LIVEUPDATE_SESSION_FREEZE

 include/linux/liveupdate.h                    |  3 +-
 include/uapi/linux/liveupdate.h               | 25 ++++++
 kernel/liveupdate/luo_file.c                  | 73 ++++++++---------
 kernel/liveupdate/luo_internal.h              |  9 +-
 kernel/liveupdate/luo_session.c               | 82 +++++++++++++++----
 mm/memfd_luo.c                                |  5 +-
 .../liveupdate/lib/include/libliveupdate.h    |  1 +
 .../selftests/liveupdate/lib/lu_utils.c       | 10 +++
 .../testing/selftests/liveupdate/liveupdate.c | 49 +++++++++++
 .../selftests/liveupdate/luo_kexec_simple.c   |  8 ++
 10 files changed, 202 insertions(+), 63 deletions(-)


base-commit: 27be83a12b246b6b3783e7d3ac5c378ff7520f25
-- 
2.56.0.212.g129ede20d9-goog

