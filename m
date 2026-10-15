Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D87509EEF
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 09:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057109; cv=none; b=tXHlZ1/Ds5KXStCpb7ua7xxhsY9c2J8c93JIlwf0FaRwbxm9omHU3UWb8zW+HcqDQx0orCPdp9YsZ9wrgzHuTW5Wq1pMN094rlKZWerfle2psKEcBtZZxtVGoHKnl3RKlqvQtjvVQi5+daQK8APO7nxCrbCi0Lt3TC4w57hZux4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057109; c=relaxed/simple;
	bh=sWSPW8nBddALIktdmp+/CpSRJcRujMEXgaUcp6vLBzE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=FCGFh453BKMpzYd29R7FJPIxQ1JyeILR1pn1IKneKtwA+5W2/E2tBncr1lmcLjXAH+KhWu3glkgNBG1aXHk5RzaPcz1Z1TDBB4OGhY4SgTWzwUFp+y0bj+7alT3Ug4F525oK35lZTFeWxSjVaFTnoODrIUOS0UKkMUSrAwdehaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=UOku9ACD; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="UOku9ACD"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9906034086cso539921241.1
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 02:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792057103; x=1792661903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0shlhRLFxXQ3R4nNuzOyegjpP8vI4RmInyPqxYDwsw8=;
        b=UOku9ACD4a0w+XPN0rROUMBsDgQHl0CRYvatyUhyEEnhqUzPv8yMB42AK20XnMnEQM
         msrFEpBhAptKmffT4MqAFNPLDdDioaMvvJWY+FeVB5Lq8O2eqO6T/TJbCQwYXfTpVjHm
         EMVqYo28Nxh+V8GSy9mKLUr/X12NVPFuWvlTxAa7gE7aisM0rhgPC3zNWrD+YAin42JE
         8wmUBzrawNwWA+CKqBjp3ultetrjL4FajYaMAffW/jcnyraJfoHRKkbmPujYlCFRjrnZ
         Vw0DEnmrgcSjdrHhEAEGtp2C8+V+aNY+CKGAvx04lBPS3oONlPCaq8mxB9luR/LV6fj9
         J3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057103; x=1792661903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0shlhRLFxXQ3R4nNuzOyegjpP8vI4RmInyPqxYDwsw8=;
        b=IheP8gMaZ9BQxsJfBR04mpwXAb4g8AKM8EBqTFk//ZKHmX5BtHiK+/Vs0j3OuRqFuN
         dUoPawqd/evb5JI5KO43B48nFwkotYzuy9gz6WRV36rOO4MSklMghu4jW9Z1mKvqEgWG
         Yb8eMm/YReg2yrGFPdCaMJeK9uP12wJ5Yrzj3okmn8j1h/ZQtqngz3GPAMKT15enkTAg
         loU3tPUsJq+B112BgVs01hYoLYFfar4S+NjYYpMnehanxbIgyrV87kq3/tG+ikzfDl9u
         M5KZ9e5I2RID5wqKDy7VjrepvFaecTXRpjbLY3ifjdYHo2WabllCI9mp/LZ9eZcqr9SX
         gpjg==
X-Gm-Message-State: AFq9FYKZ5+IAlP9lLiM8u3dDH1BVezqd0hQGF4sC4WBHehmCTKY5E57K
	pYpeVIzFDixdM3Yv/9v7oP/7wkiUr29CPxm5k5PqxlHFMnyAIbIaDq39QiEU31ZQiRR+g3LwLGC
	wI8ER
X-Gm-Gg: AYBFou181DdYpYyDKRTSePS1BBHyPhLYnN6Ug/m/1qCsysugn9UERD3qdrqa3E9HpYw
	VMcvqBSrweqmnnDMf7F329wxq++xYEnxxISnCR0sjXOGBLFiMRhaJNiHI6zyT0rk6oLgKKeB80w
	FjEtC18WjKCLX+nQFNJYkIU3pfHbtkke/V1RrH2KdDYBdmTqihd94SVvog+qbxE0ZgcFXkSSLkw
	JGrrbZl+vfIe4H7bKMam/jnDLEFZDUPfJiffC5abP6m58bIUkQUJNnqYuwcjqlaYCDUS2HB7O/k
	oqteQc6dSC+RJlvUmAcvfM2CYixMgeyj8UWAJNwVtZaOGxCrX3sj6X7wzJSp9DxnbQKPaJXkT/i
	V24KLEJtn0ClBcrN//UhdGRVrwU3NZVKLhPErIwxxxGOQ9IwWqtxSUArgUgANFc/SYw6eFVvTJy
	/EspYlhROzt5VCokGwI0ftAY0WUNmcf+5W1Pt6UKVag1gJCKvDMo1Q7eLhlW6Psk+zHvgKuQ6dI
	UBTl4ruQeXI3pMtP4if0eN5jXPwgySrbtRcbDg1oFjW7hdAAlUyq+HMBqG0ZaD7LPnDX9vLDEld
	vv5LM11e+Jba2BbmCog=
X-Received: by 2002:a05:6102:14aa:b0:7bb:81de:ebaf with SMTP id ada2fe7eead31-7cb372b60a2mr4935421137.15.1792057103138;
        Thu, 15 Oct 2026 02:38:23 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003d37009sm12275672241.2.2026.10.15.02.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:38:21 -0700 (PDT)
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
Subject: [PATCH v1 0/7] liveupdate: tmpfs preservation and early freeze
Date: Thu, 15 Oct 2026 05:38:09 -0400
Message-ID: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series allows preserving files in tmpfs via LUO to survive across a
live update, and allows userspace to decide when to freeze a session
instead of delaying until auto-freeze at kexec time. Once userspace is
done with a session, it can freeze the session immediately (and across
multiple sessions in parallel), reducing blackout time by not postponing
this operation to kexec shutdown where all sessions are frozen serially:

1. Early session freeze (LIVEUPDATE_SESSION_FREEZE):
   Currently, LUO sessions are frozen automatically only inside the
   reboot(LINUX_REBOOT_CMD_KEXEC) path, where luo_session_serialize()
   iterates through all outgoing sessions under global write locks and
   freezes them serially during shutdown.

   Add the LIVEUPDATE_SESSION_FREEZE ioctl on session file descriptors so
   userspace can freeze a session as soon as it is done with it (and freeze
   multiple sessions concurrently, since luo_session_freeze() only acquires
   the per-session mutex). During kexec, already-frozen sessions skip the
   late auto-freeze step; if an early-frozen session is closed before
   kexec, its files are rolled back via .unfreeze() before being
   unpreserved.

2. Per-file user argument on preserve and retrieve:
   File handlers may need handler-specific context when preserving or
   retrieving a file descriptor without introducing custom session ioctls
   for each file type. Whether the argument is required, optional, or
   unused depends on the file handler.

   Extend struct liveupdate_session_preserve_fd and
   struct liveupdate_session_retrieve_fd with a 64-bit 'arg' field pointing
   to a handler-defined argument structure that begins with a 32-bit 'size'
   field. Because IOCTL_OP validates a minimum struct size up to 'token',
   existing userspace callers passing the 16-byte structure remain
   backward-compatible and have 'arg' zero-filled by
   copy_struct_from_user().

   Add parg and rarg (struct liveupdate_arg_spec) to
   struct liveupdate_file_ops, initialized via LIVEUPDATE_ARG(_struct,
   _min_last), which records the full struct size and minimum required
   size while enforcing at compile time that the argument structure begins
   with a 32-bit 'size' field. Core LUO validates the minimum size and
   copies non-zero user arguments via copy_struct_from_user() up to the
   handler's expected size (or rejects them with -EOPNOTSUPP when the
   handler does not accept an argument) and passes the kernel copy to
   .preserve() and .retrieve() in struct liveupdate_file_op_args. Also
   allow .retrieve() callbacks to mark early argument/target validation
   failures as retryable so userspace can retry
   LIVEUPDATE_SESSION_RETRIEVE_FD without losing preserved KHO state.

3. Tmpfs file preservation and retrieval:
   Using the file handler retrieve argument, extend mm/memfd_luo to allow
   preserving generic shmem-backed tmpfs files (not just unlinked memfd
   pseudofiles), recording MEMFD_LUO_FLAG_TMPFS in
   struct memfd_luo_ser.flags so that preserved tmpfs files must be
   retrieved as tmpfs files and preserved memfd files must be retrieved as
   memfd files. Introduce struct liveupdate_memfd_retrieve_arg so
   userspace can pass a writable, empty, linked tmpfs file descriptor via
   the retrieve argument and have the kernel populate its address space
   with the preserved folios.

David Matlack (2):
  mm/memfd_luo: Support tmpfs preservation and retrieval
  selftests: liveupdate: Add test coverage for tmpfs preservation and
    retrieval

Pasha Tatashin (5):
  liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl to freeze sessions
    early
  selftests: liveupdate: Add tests for LIVEUPDATE_SESSION_FREEZE
  liveupdate: Pass user argument to file preserve and retrieve
  selftests: liveupdate: Add tests for preserve and retrieve user
    argument
  liveupdate: Allow file handlers to mark retrieve failures as retryable

 include/linux/kho/abi/memfd.h                 |  13 +-
 include/linux/liveupdate.h                    |  74 ++++++++-
 include/uapi/linux/liveupdate.h               |  59 ++++++-
 kernel/liveupdate/luo_file.c                  | 152 ++++++++++++++----
 kernel/liveupdate/luo_internal.h              |   8 +-
 kernel/liveupdate/luo_session.c               |  58 ++++++-
 mm/memfd_luo.c                                | 144 +++++++++++++----
 .../liveupdate/lib/include/libliveupdate.h    |   6 +
 .../selftests/liveupdate/lib/lu_utils.c       |  71 +++++++-
 .../testing/selftests/liveupdate/liveupdate.c |  84 ++++++++++
 .../selftests/liveupdate/luo_kexec_simple.c   |   5 +
 .../selftests/liveupdate/luo_multi_session.c  | 110 +++++++++++--
 12 files changed, 695 insertions(+), 89 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.56.0.385.gd3acb90ef8-goog

