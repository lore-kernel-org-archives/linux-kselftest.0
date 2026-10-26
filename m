Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979392;
	b=ETIVMkrXlLVHi3aDKaCxRrVF4SUPDbnCiDTMwZzjw/jZXt3QC7bJVB/Ls4e2mvFawmZw
	 W/aAxRbwL9a4Ke+02TO4ZHhhnEHVrkU4+nBaxhla0UuWL7HPBbNa7dvPiieEqb7i03L3e
	 CUX/u0WzFm8km7DubN3wDnpIwnVPE+1OLLEwn9ydgI5kNyO6Sze0JkX4S00gMlGa9U3TR
	 9uuVfRDPQn0kxWNEWCp8tHDNsufIlRJlJCohUzO59Zo/U98bjMIsGhnYjsq/6yDuOp/Pj
	 L5WAgPj7wR9q0fMMnKnP/nptwEmgyE6f/la939cSTN5W3V8v4OzSlRL92V5tyROwXLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AN3Hjw/HZft2MXUgGNWgsqw3kkl3NUYJU0ViE8j1aeU=;
	b=czkV4MVe5yH5TOaSTNawCxYPk1V/W3PUwlHHSY42loI1EyPbAwRCrySzmymHDrFUbchz
	 HjcZxONABCNBItx0KKTuiZfKcIe66APThvE54LYEElfbhBB/T/px+cB7E5hMTkQuZy6F7
	 HMfDSHYMuQFqh9jL9Rjaa7cDWdEkuh3NIeHME7x9prHqv6dPpr+/OSZggLFVX9q/z9vv2
	 5r9D1ZEM2HaR3debeD3xcv43srleH5vmjnknGcCvLuWufFf7fzYQIy5SGL8sR9z1tzqW1
	 VPeLyUOnCPGmUNhVe/HpKVfqVhvzAaBgTCPREHqfOYQs5rvjc1b6f/Ie6hygI38zlOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=aOD24LJr;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC1F606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 01:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFC1F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=aOD24LJr
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7907f01e487so717835137.2
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 18:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792979391; x=1793584191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AN3Hjw/HZft2MXUgGNWgsqw3kkl3NUYJU0ViE8j1aeU=;
        b=aOD24LJrfDvg8u9uruLVXXfxTwTkeGpltStOTXyCoMQ4f/ufxIgEuHjZrUtuhh1uqW
         C9vOMjR1Ag0qZdLVBpZfZtHIUZEzOFE+cbscEh/RqLfrpEfAkkTQa0A8RG07kU+nX/PE
         HBOn9Gc3dNZPPW5ttkJERs9vNZpKtXPasD93QhAYS8mNlqy5RLfbQaIn+xfmT2HKEKFE
         R6+9F+aw/pLhLklHdkzO18ETKTbEiATuBPVNzZcFG+weSyjvEUwtglP4rFCLUV32zFtV
         Yo9GGD9fMYtcS0sWF7gSHAcF4F4cHUzbrwGCv3S4xrD5t6kXuLn1sMb+il0RPOAyclww
         aGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979391; x=1793584191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AN3Hjw/HZft2MXUgGNWgsqw3kkl3NUYJU0ViE8j1aeU=;
        b=vYgwr8rNdOF2j+VYV/Quqz4cy2GDf0lfXpasOaLNpPkPDQLFrLhlGT8BEW89nhSmag
         HPE8xN5gUv/26pj9Qkjf/oMpwang4tlTHkU24LAAvjypXPB3Fw45c3mN+dRt4PV5nU/B
         NMEHZftizjoCji7yww34E30pRJmkRZgHPwuU/cOX/tXYV6GlYIZwLmJiD9SSOxkItJ4u
         5JAtzK8gIuDm+ES4XqC3aVpt3y3gcUmDwW9dCsn/mcs1oj/He6zz0kQ/AlXX0ghozVi1
         qjfJIQ+sDbJPNls82phCuT0UimveQQbJC7eLUg6ZIQQPGmX2gpGRAoH/04zahrqhrPUz
         e2cw==
X-Gm-Message-State: AFq9FYLY/urfIp63oFA16F5jjWj1fkwvawiwhL4X32WH9M6LFY1fDTFy
	u5RDti1zu5Hq/I6N+Qq7s+MA60XOrz6iaBS8Y46hE5YnyNeqquBcFBMOv7pIdXjJy6z+Q8TZpVC
	rKqAT
X-Gm-Gg: AYBFou3zTWNZ+FXoZ/3QxG985NgGrWEFbvkHqcqkGjrEY5RKrDWGDk9m7JNSqc8trA5
	hp7cJL6lBtwBYcBM+KQczNzGAjHtW2BDzIaIT0wkhpow2OsoFROZ9yCDuIDEuek5DwhNAcc4Ony
	gZK5dSf50kyiSJzCdd448Lb16Z2sMfCXzO3VWghSf2dJNUUioMV0IIi5vPXkD5ebgz+HgOd3b0b
	gX25R1QCka3UVhMj8+/bopSFeK9MOwuEHBFBefToraZ0B4n13jXSe3KXv5DOSzvNihgy3E8TqUQ
	0esQ5EgTyFOy96MmrSxg6i1ZPHnf/1fPoptvVAck6BanpLFd5dHsHAs8vA0J6g2y/R5WAJx384M
	8B2MBu2InfZKMPI45cXviSA8PzRpfJmiCRk72QgpXYixrvHGnqJh2IHj5E4T0xGhxRNSitlOvXo
	M/izvR89AxSc6kGrRHroRhNcOkAca081NvFgLeWKcxDW5jSP5Ws6JO4w8Vgv0c4PsOf60Z4qP5G
	juEqoVV6sY3L3flZRMS3aDehIe6uD4k8kGxNlA8wRTVnV8F0vo9C7muGWXkPjyU4+ulBHqYts2y
	uPHgYFE5AMrnabgmsgJS9eUjNcaCwG+9PJXel2+xaGIWA/XFkA7blkY9ikk/ennz4oW909tryS8
	g
X-Received: by 2002:a05:6102:5ccc:b0:7cc:2a3c:9a33 with SMTP id ada2fe7eead31-7ce5ce4d7d4mr1365539137.34.1792979390767;
        Sun, 25 Oct 2026 18:49:50 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5df73970sm6099917137.1.2026.10.25.18.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:49:50 -0700 (PDT)
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
Subject: [PATCH v4 0/3] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
Date: Sun, 25 Oct 2026 21:49:43 -0400
Message-ID: <20261026014948.162559-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
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
v4:
- Split out a preparatory patch that drops struct luo_file_set_ser *
  from luo_file_freeze() / luo_file_unfreeze() and moves file_set_ser
  handling into luo_session_serialize_one() /
  luo_session_unserialize_one() (Suggested by Mike Rapoport).
- Few more nits from Mike.
v3:
- Renamed session->frozen to session->user_frozen, - Pratyush
- Added Reviewed-by's
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

Pasha Tatashin (3):
  liveupdate: Move file_set_ser handling to session serialization
    helpers
  liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl to freeze sessions
    early
  selftests: liveupdate: Add tests for LIVEUPDATE_SESSION_FREEZE

 include/linux/liveupdate.h                    |  3 +-
 include/uapi/linux/liveupdate.h               | 25 ++++++
 kernel/liveupdate/luo_file.c                  | 73 +++++++---------
 kernel/liveupdate/luo_internal.h              |  9 +-
 kernel/liveupdate/luo_session.c               | 87 +++++++++++++++----
 mm/memfd_luo.c                                |  5 +-
 .../liveupdate/lib/include/libliveupdate.h    |  1 +
 .../selftests/liveupdate/lib/lu_utils.c       | 10 +++
 .../testing/selftests/liveupdate/liveupdate.c | 45 ++++++++++
 .../selftests/liveupdate/luo_kexec_simple.c   |  8 ++
 10 files changed, 203 insertions(+), 63 deletions(-)

-- 
2.56.0.307.g5fe7bd680c-goog

