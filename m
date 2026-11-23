Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477171;
	b=JmUddZ1N9XwiMNAUIQiJ0//8dkhIjyAJM9vKC1VDJKu9G5XP7PnNsw5q9J1O3rgI8Ezi
	 Sd+mhNA5+X3N3V6wWaIVcaWFwuU1lGS2s1eV6PQjtz7Q36Mk357MsfMOalp13YP0DcMv0
	 e2t9k+84teaXFj6wxQEeNNugB3nUrxUgs0dAm3uzChuD53TxxcTxBSIWj+czXX1Jox/MR
	 LRZRFozL6u/1JEmytAX/z/sgfMfG/dzpgeQZED34QgCGp0YOOjeFkFuV8+wELfImxZupH
	 q7pRBShHm34ywqvCqyFnK3TbpWDBv3WrMRP9Pl+4eDCNHZnu0+CGL//s1jv9KbJp91A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=M1DlTHNw5rbNjmyWDgD7Ukr9dsG77Kyw3Ulz2ICIXFc=;
	b=ZCNpMebqqyN6FQ+OCqp/lhNr/7SYfC+5+1+EXOkBm4UEh/XjEB7ceYT2Pc4j6S7CMVbz
	 i1gYKf2i6bnsV5L++Zk0O5A/3cqm0EXDc/9eEc6K7EtjO9UpyuBGzAkXV0jW0bmWpAW/t
	 Hzj9clb4n2h5cgQ5YoABnCKxbhjEiVbMMQN//rE0XQmL3j60iHPUCkhHiDHOh5MzxiaVx
	 PBeFLoB5THOgkDwWHuceEiPpaw6LtOe+1yNgEgR0l29Of+R9ssjeEyhAAD5K2C7VbJ7Di
	 TTJkfMgKgWUKm0yHrRSsgoUiaEbWy2iqVw1xQ0UUzmeaa9sHWvNvoxvM/Z/3HvVAJKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W9a8CmD2;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C7F606A31E
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 23:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C7F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W9a8CmD2
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-57e3f40cc16so620963b6e.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795477169; x=1796081969; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1DlTHNw5rbNjmyWDgD7Ukr9dsG77Kyw3Ulz2ICIXFc=;
        b=W9a8CmD2H+ZvIbXJP/dQPZq99kTY62jnf9dmGlAFQFrB4C7WbENtqsqEFPACF7xu7W
         wuCFcrytbdFI+5m1mA+7HoGPKKKDFnb/4z0x3AKYU+CsZH0tE++2a/I/J5vOdqP5cz4l
         8+EEM1RCiH5HCif8V8RvDNtvrCHN2BuoAzFSKfvrvaUCsZr/6a40ieeMk+q8fcu3jCk0
         VE+M1oWB05KGbU2bQOEiYFtUnyVkL4Tl2hO0zHr3Hd3wJqgZTgaRo/N0heQ/2na9eMKZ
         3hm+XSWzOnHKgXdWqIjy18B0oss5eYAbQ7EO1rTG9X0WtnLxGJY8DoQnlE64DNuCRBg/
         MESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477169; x=1796081969;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1DlTHNw5rbNjmyWDgD7Ukr9dsG77Kyw3Ulz2ICIXFc=;
        b=gwVgCkbfDCX0ggBmRq6e1V1iWu1aPHDwBJYw4z7E0N84Mm6eH8ukBeNhpRNXUZDy5q
         Nd+hS0vfGy4eoOsu0UTwJSxvsAg0tKGD2Q+mtOmqNnlVNtIMSy6voythEFiYP/0WQ1Qp
         FXpTvb/J9BYPixHbabuTpwDoxd7KzEMMD/adwnW9wVyqr/Y3BCTirr3+qdwtn3N95umT
         vsWbaRpE84oDdG7RnSTl2IXWxVt4dVbU4k7uJAqFnJpunLCqVhdS5Y21sk8yjZq1AWpS
         jqY2oh9jZJjotucn5TGp4+MtaNvg/Pf8iN6ElBixNmiKNn3Giq69Dh6FeNILgGNexJFn
         LpWQ==
X-Forwarded-Encrypted: i=1; AL+hErHs1tGZ+DG2BjFL93gCDUePBdIXXfIY1Z6hl4P0cuxp8zyeIYq+qnlBx+JR4KZGiApbgsdz0ZYjCpvOVFhQUAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9czA0VIUOJZa+8fKyTwnvEpdwe7mCfP+FislAzun49ID9VzDkC
	5z0V3HMOe54xsSNapYYo+WdubPAAox1THYNZ5ybkXlmnuDbMgHibxw8DqGwVKETcd1iAA/ad/6E
	3T216TGjoypvDIw==
X-Received: from ilb10-n1.prod.google.com ([2002:a05:6e02:530a:10b0:522:f1fe:e456])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3503:b0:4f5:eaac:5151 with SMTP id 5614622812f47-57a0b0414a8mr14759642b6e.39.1795477169164;
 Mon, 23 Nov 2026 15:39:29 -0800 (PST)
Date: Mon, 23 Nov 2026 23:39:05 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123233924.3970932-1-dmatlack@google.com>
Subject: [PATCH v5 00/18] liveupdate: Preserve tmpfs files across Live Update
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

This series can be found on GitHub:

  https://github.com/dmatlack/linux/tree/liveupdate/tmpfs/v5

This series allows userspace to preserve files on tmpfs mounts across a
Live Update, in addition to memfds. Today only memfds are supported, so
userspace has to put every in-memory file it wants to preserve in a
memfd, which works for VM guest memory but not for other files that live
on tmpfs mounts and need a path, owner and mode, such as in-memory logs,
binaries, and configuration files.

The kernel preserves the contents and size of each file, and the file
position and seals of memfds. After the Live Update, userspace creates
an empty file on a tmpfs mount of its choice, with the owner, mode and
other metadata it wants, e.g. with O_TMPFILE, and the kernel restores
the contents of a preserved tmpfs file into it. Userspace then links the
file at the path of its choice, so userspace decides the directory
structure, names, owners and permissions of the restored files.

Patches 2-4 come from v1 of this series [1], posted by Pasha. They add
a file-handler-specific argument to LIVEUPDATE_SESSION_PRESERVE_FD and
LIVEUPDATE_SESSION_RETRIEVE_FD, as suggested on the RFC [2]. The design
of retrieving tmpfs files was discussed on v1 [3] and on v3 [4].

[1] https://lore.kernel.org/kexec/20261015093816.2438942-1-pasha.tatashin@soleen.com/
[2] https://lore.kernel.org/kexec/2vxz7bjmkjeu.fsf@kernel.org/
[3] https://lore.kernel.org/kexec/atE53vmlDeA4cWD2@google.com/
[4] https://lore.kernel.org/kexec/20261105-sitzordnung-nahkampf-ausbleiben-6db911d0333e@brauner/

Series Overview
---------------

This series implements the following:

  1. Remove an outdated list of steps from the comment of
     luo_preserve_file() (patch 1).

  2. Let userspace pass a file-handler-specific argument to
     LIVEUPDATE_SESSION_PRESERVE_FD and LIVEUPDATE_SESSION_RETRIEVE_FD,
     and let file handlers mark retrieve failures as retryable, so that
     userspace can fix a bad argument and try again without losing the
     preserved file (patches 2-4).

  3. Rename memfd_luo to shmem_luo, since it will also handle tmpfs
     files (patch 5).

  4. Fix a WARN_ON() that userspace can trigger when tracking a
     retrieved file fails (patch 6).

  5. Let file handlers retrieve into an existing file: They claim the
     file before they restore the preserved state into it, so that LUO
     can reject a file that it already manages before the preserved
     state is consumed (patches 7-8).

  6. Make shmem_luo retrieves that fail before they restore the folios
     retryable (patch 9).

  7. Require permission to preserve a file, since preserving a file
     freezes its size for all of its users (patch 10).

  8. Retrieve files preserved from a tmpfs mount into an empty file that
     userspace created on a tmpfs mount, passed in the new struct
     liveupdate_shmem_retrieve_arg (patch 11).

  9. Allow preserving tmpfs files (patch 12).

  10. Add tests for which tmpfs files can be preserved to the liveupdate
      selftest, which doesn't need a kexec (patch 13), and add a kexec
      selftest for retrieving tmpfs files, split by feature into several
      patches (patches 14-18).

uAPI Changes
------------

  - struct liveupdate_session_preserve_fd and struct
    liveupdate_session_retrieve_fd gain a 64-bit @arg field, a pointer
    to a handler-specific argument that starts with a 32-bit size
    field. Callers that pass the old struct size are not affected.

  - Passing a non-zero @arg when retrieving a token that was already
    retrieved fails with -EBUSY.

  - A file handler can leave a token intact when a retrieve fails
    before it consumes the preserved state, e.g. because of an invalid
    @arg, so that the retrieve can be retried.

  - New struct liveupdate_shmem_retrieve_arg, with @fd, the file to
    restore a preserved tmpfs file into. It must be an empty regular
    file on a tmpfs mount, opened for writing.
    LIVEUPDATE_SESSION_RETRIEVE_FD returns a new file descriptor for the
    same open file, like for any other retrieve. Files that were
    preserved from a tmpfs mount can only be retrieved with it, and
    memfds can only be retrieved without it. Before this series, the
    memfd file handler accepted unlinked tmpfs files (e.g. created with
    O_TMPFILE) by mistake and retrieved them as memfds. That was a bug,
    and such files now require the argument like all other tmpfs files.

  - Preserving a file now requires the file to be opened for reading
    and the caller to have permission to write to it, and append-only
    files can't be preserved (see Permission Model).

ABI Changes
-----------

  - struct shmem_luo_ser (formerly struct memfd_luo_ser) gains a
    SHMEM_LUO_FLAG_TMPFS flag in its existing @flags field, which
    records that a file was on a tmpfs mount rather than the internal
    shmem mount that memfds use.

Permission Model
----------------

Preserving a file freezes its size until it is unpreserved: For all
users of the file, truncating it, fallocate() and writes past its end
fail with -EPERM, and the owner of the file can't undo that. Without a
permission check, anyone with a session fd could preserve e.g. a
world-readable file in /dev/shm through a read-only fd and break the
owner's use of the file.

Patch 10 therefore requires the file to be opened for reading, since the
retrieved file can be read, and the caller to have permission to write
to the file (inode_permission(MAY_WRITE)). It doesn't require a file
opened for writing or a writable mount. The owner may also preserve a
file that is immutable or on a read-only superblock, since its size
can't change anyway. Append-only files are rejected.

The checks apply to memfds too. They only reject memfds that are opened
write-only, that are append-only, or whose mode was changed to deny the
caller write permission, since memfds are created with mode 0777 (0666
with MFD_NOEXEC_SEAL).

Retrieving a tmpfs file needs no permission check beyond a file opened
for writing, since restoring the contents is a write to that file.

Merge Plan
----------

This series applies on top of the next branch of liveupdate.git
(commit 4209b08181c7 ("Merge branch 'lu-pci-preservation' into
next")) and is targeting Linux 7.5.

The series will be merged through liveupdate.git.

This series conflicts with the following series, which also change
mm/memfd_luo.c. Whichever lands second will need to be rebased.

  - Pratyush's "mm/memfd_luo: don't use memfd_pin_folios()" [5] and
    "memfd_luo: keep memfd frozen until finish" [6]. Keeping retrieved
    files frozen until the session is finished, as suggested in [7], is
    left for [6], which will then also apply to tmpfs files.

  - Tarun's "kho, liveupdate: Add feature header for fine-grained ABI
    compatibility" [8], which changes the memfd_luo ABI structs that
    patch 11 adds SHMEM_LUO_FLAG_TMPFS to.

[5] https://lore.kernel.org/kexec/20261123130115.4021199-1-pratyush@kernel.org/
[6] https://lore.kernel.org/kexec/20261123130509.4032642-1-pratyush@kernel.org/
[7] https://lore.kernel.org/kexec/179322496574.1894369.544573858973645958.b4-review@b4/
[8] https://lore.kernel.org/kexec/20261110050202.529473-1-tarunsahu@google.com/

Testing
-------

All patches were build-tested individually. The series was tested on
x86_64 in QEMU using the Live Update selftests:

  - luo_tmpfs (new): kexec test cases covering the contents, size and
    holes of restored files; that only the contents and size of the
    target change; which targets are accepted (open for writing, empty,
    regular, on a tmpfs mount, not immutable, not managed by LUO);
    executing restored binaries after the session is finished;
    retrieving files that were preserved through read-only fds, on
    read-only mounts and superblocks, and immutable files; block
    accounting on the target mount, including large folios that extend
    past the end of the file; mount and memcg limits; memfds; invalid
    arguments; retrieving a token twice; and that no kernel warnings are
    triggered.

  - liveupdate, including the new preserve_memfd_with_arg test and the
    new tests for which tmpfs files can be preserved (permissions,
    read-only and append-only files) and operations on preserved
    files.

  - luo_kexec_simple, luo_multi_session, luo_stress_files and
    luo_stress_sessions.

The selftests were run with vmtest.sh:

  $ tools/testing/selftests/liveupdate/vmtest.sh -T luo_tmpfs

luo_tmpfs was also run on bare-metal x86_64.

Changelog
---------

v5:
 - Rebase onto the latest liveupdate/next.
 - Collect Reviewed-by tags from Pratyush.
 - Patch 2: Pass NULL instead of 0 for the argument in
   liveupdate_get_file_incoming() (Pratyush). Initialize karg at its
   allocation, and pass the checked size to the handler instead of the
   one fetched again with the argument (Sashiko). Document the errors of
   copying the argument.
 - Patch 3: Set @arg in the old-struct-size test, to check that the
   kernel ignores it (Sashiko).
 - Patch 6: Only untrack files that were successfully retrieved when
   finishing the file set, and do it before fput(). This was in patch 7
   in v4 (Pratyush).
 - Patch 8: Go back to returning a new file descriptor from
   LIVEUPDATE_SESSION_RETRIEVE_FD when a file handler retrieves into an
   existing file, since another thread can close() the file descriptor
   that userspace passed in, or dup2() over it, before the ioctl returns
   (Christian).
 - Drop v4 patch 9, which left freeing the preserved state to finish()
   (Pratyush). The leak fixes will be sent on top of Pratyush's "keep
   memfd frozen until finish" series.
 - Patch 9: Keep freeing the preserved state on the permanent failures,
   now that v4 patch 9 is dropped.
 - Patch 11: Return a new file descriptor (see patch 8). Document that
   userspace must not use the target, e.g. map it, until the retrieve
   returns (Sashiko). Raise fallocend while adding the folios, so that
   splitting a large folio doesn't drop its pages past i_size (Sashiko).
   Rename shmem_inode_on_internal_mount() to shmem_inode_internal(), add
   a truncate label, and list the retrieve errors in the uAPI docs
   (Pratyush). Pratyush's Reviewed-by is not carried over because of
   these changes.
 - Patch 13: Rename the frozen_size test to preserved_ops, and only
   check the exact errno where it is documented (Pratyush). Remove the
   temporary directory if mounting tmpfs fails (Sashiko).
 - Patches 14-18: Update for the new file descriptor, and only check the
   exact errno where it is documented. Use fcntl() from libc unless
   built with nolibc, and fix an fd leak in start_exe() and a memcg
   leak in memcg_limit_verify() (Sashiko).

v4: https://lore.kernel.org/kexec/20261111002358.1842967-1-dmatlack@google.com/
v3: https://lore.kernel.org/kexec/20261103010216.3447716-1-dmatlack@google.com/
v2: https://lore.kernel.org/kexec/20261022225035.377445-1-dmatlack@google.com/
v1: https://lore.kernel.org/kexec/20261015093816.2438942-1-pasha.tatashin@soleen.com/
rfc: https://lore.kernel.org/kexec/20260901180713.4185641-1-dmatlack@google.com/


David Matlack (15):
  liveupdate: Remove the list of steps from luo_preserve_file()'s
    comment
  mm: Rename memfd_luo to shmem_luo
  liveupdate: Don't WARN if tracking a retrieved file fails
  liveupdate: Add helpers to track the files that LUO manages
  liveupdate: Let file handlers retrieve into an existing file
  mm/shmem_luo: Don't make early retrieve failures permanent
  mm/shmem_luo: Require permission to preserve a file
  mm/shmem_luo: Retrieve tmpfs files into a file created by userspace
  mm/shmem_luo: Allow preserving tmpfs files
  selftests/liveupdate: Test which tmpfs files can be preserved
  selftests/liveupdate: Add a test for retrieving tmpfs files
  selftests/liveupdate: Test memfds and LUO interactions in luo_tmpfs
  selftests/liveupdate: Test the targets of retrieved tmpfs files
  selftests/liveupdate: Test retrieving tmpfs files preserved read-only
  selftests/liveupdate: Test block accounting of retrieved tmpfs files

Pasha Tatashin (3):
  liveupdate: Pass user argument to file preserve and retrieve
  selftests/liveupdate: Add tests for preserve and retrieve user
    argument
  liveupdate: Allow file handlers to mark retrieve failures as retryable

 Documentation/core-api/liveupdate.rst         |    2 +-
 Documentation/mm/index.rst                    |    2 +-
 Documentation/mm/memfd_preservation.rst       |   23 -
 Documentation/mm/shmem_preservation.rst       |   23 +
 MAINTAINERS                                   |    4 +-
 include/linux/kho/abi/{memfd.h => shmem.h}    |   57 +-
 include/linux/liveupdate.h                    |   75 +-
 include/uapi/linux/liveupdate.h               |   70 +-
 kernel/liveupdate/Kconfig                     |    9 +-
 kernel/liveupdate/luo_file.c                  |  216 +-
 kernel/liveupdate/luo_internal.h              |    5 +-
 kernel/liveupdate/luo_session.c               |    6 +-
 mm/Makefile                                   |    2 +-
 mm/internal.h                                 |    1 +
 mm/shmem.c                                    |    9 +
 mm/{memfd_luo.c => shmem_luo.c}               |  345 ++-
 tools/testing/selftests/liveupdate/Makefile   |    1 +
 tools/testing/selftests/liveupdate/config     |    4 +
 .../liveupdate/lib/include/libliveupdate.h    |    3 +
 .../selftests/liveupdate/lib/lu_utils.c       |   17 +-
 .../testing/selftests/liveupdate/liveupdate.c |  364 +++
 .../testing/selftests/liveupdate/luo_tmpfs.c  | 2140 +++++++++++++++++
 .../selftests/liveupdate/run-vmtests.sh       |    1 +
 23 files changed, 3204 insertions(+), 175 deletions(-)
 delete mode 100644 Documentation/mm/memfd_preservation.rst
 create mode 100644 Documentation/mm/shmem_preservation.rst
 rename include/linux/kho/abi/{memfd.h => shmem.h} (53%)
 rename mm/{memfd_luo.c => shmem_luo.c} (55%)
 create mode 100644 tools/testing/selftests/liveupdate/luo_tmpfs.c


base-commit: 4209b08181c75ea02164832cd8f47526de28d40c
-- 
2.56.1.809.ga0b61035b5-goog

