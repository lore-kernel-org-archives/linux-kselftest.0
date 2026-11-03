Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667745;
	b=uTIKFssUg84oYsN/8iy+NIa5XyCoJRdBW5wf5xBJllCSXZJ9JE35hhVXOaNwWCBuCRm7
	 h3amxm7NSCnt4yVsXsA+Z5rdzo1iuqWYUqcYzXIYSTAQN6QGxXTZDjQh9UpCi7Dek8GHV
	 OWNcZagtaWssvU2xANXQ/OlowgnqEi7sL4Q8tpZcjAHLX1B6mxHA62Bv8MzsX9Z98Xu0p
	 DjjknQXmUo90relW18jGihQ+8vLnbBUlG3rOtLN3Rpu8Rvb+6WRBZ+SKi9A0MUywuij9a
	 5mZenPAv/RtVVkJcKg/inwO6S+o2hzP27YaXgPkkBQT+nvT5rl0Q8noNzzy2LWEa6Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6yjgp9P+tr1bzQJ5Up7RsRaaww+TiEVtVQnPOHgsXSk=;
	b=IUMirMRyFG0M3U5zdu7hzbOb+QL8zfs/OX5sV2Cr93UNw4tEdDbsI+m1AFbo/FeJ5u9i
	 l/Og+FkTyoigilQyeLzaeY89QzGcYe1WESlG9PMczCLhjvKmZt7dy+j4QTy2hFxPRcoBy
	 ZZXtJgq5mcpEHjExxcUrTvaAebUi0M9JZlNgfBWaAQnE/J1zHOOpQioWlVv8THHtxOpFn
	 saKYAwtSBIrwNQ4bfcYFXaXmtSH1eqAAjl8nwPzoi2JqExPPBMco3Bgq7w9GfCb1LExQN
	 iuLOXrlVX5DRv+h3jf47gajfMmna2MKW/5LCSAwNhP3TSMaC8fyyZlmaEVzJoIqAzGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wsq0hGC2;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E1D606A326
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 01:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39E1D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wsq0hGC2
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so7379598a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 17:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793667744; x=1794272544; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6yjgp9P+tr1bzQJ5Up7RsRaaww+TiEVtVQnPOHgsXSk=;
        b=Wsq0hGC2kjoHHv4qN4zJVQILMAnJippPvjgXqk0v+lQ+z3ekqJ9JutvAzMffZJCoxh
         /h0Bx6vglV1No7MFNj9t8BO6WRqOjNSc1BBKeMR7F1472uO8Emcq82wr6uSkoBlalALo
         y7rVFDKnGizE+46+cUzdOJt7bG0bSH0aARKDwIUx97BRCl3C75QIQg6EzgLNIgR0EHMY
         HnEGzsqR/xGUzy9CBO8NS176Yg1T0ng8wNXd4XM4oDQs6RmRzg+nSncutLCOzQ17BnJo
         1ASA/XAYCYUC3TG9Ixcv36aTO73gVKiensJjEj+ewDWeZybRSIrBqUAm3Fy/14L9G9VE
         xgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667744; x=1794272544;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6yjgp9P+tr1bzQJ5Up7RsRaaww+TiEVtVQnPOHgsXSk=;
        b=gXcgWZAYZxRqSZy++YeQRvhIlF7fxX8m8Cgm1bRhPGoou3XXSwA7RdGciEOJ2qk2Yr
         cjaPeiMEDg50GU8Pa8vvAcu3FlfCEFj9h7Z8j9rpckFCpLVa7r29sFTeccmYUGZVgSxa
         Sl9XcJiHk5ylHJKHGIexup55MnNKlJ3P5MxyGshMfyRFHzDy/6Dfwu8j1RKWbgRjhAV4
         pD19eWws/Sk4peqoFQDbKvS5b5brozQ8jvr2+ABTLYdrWvnZ19+/OJN4gg2MXtO2cFzD
         Xkl4TJzDJQ+ewqQbImchqJ+HGdUuKLdA7MUK2UadgO39dRvLFYAH57TkdlAUz3V1xMiI
         Gjdw==
X-Forwarded-Encrypted: i=1; AKwUvBy0cS5SqONsOriN5ymPfB2JylQVuqYnFZKyAJVAa0IXzkdr41Detyl5+/8AGRmKrj1C8ZZ4jC7LjsmAfHm7tyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xj4M2nVe/JINrH2l0YLjckKME7/3qsTD7unPT0roHj0ox/Xtx
	NEbqKNaWnOIkIFj8ojy9oepUGhtZYLVmO3T7RyacVFVeOZZcZoRSbpO8q/eHXUDgaWUsKZFYf66
	kmeUZPTDYCTcMPw==
X-Received: from pjbfh3.prod.google.com ([2002:a17:90b:343:b0:3ac:7545:d82e])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b90:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3ae8984b662mr9765034a91.58.1793667744325;
 Mon, 02 Nov 2026 17:02:24 -0800 (PST)
Date: Tue,  3 Nov 2026 01:02:06 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103010216.3447716-1-dmatlack@google.com>
Subject: [PATCH v3 00/10] liveupdate: Preserve tmpfs files across Live Update
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

  https://github.com/dmatlack/linux/tree/liveupdate/tmpfs/v3

This series allows userspace to preserve files on tmpfs mounts across a
Live Update, in addition to memfds. Today the memfd file handler only
accepts unlinked shmem files, and LIVEUPDATE_SESSION_RETRIEVE_FD always
restores them as anonymous memfds. Userspace therefore has to put every
in-memory file it wants to preserve in a memfd, which works for VM guest
memory but not for other files that live on tmpfs mounts, such as
in-memory logs, binaries, and configuration files.

The kernel preserves the contents, size, file position and seals of each
file. After the Live Update, userspace retrieves each file onto a tmpfs
mount of its choice and links it at the path of its choice, so userspace
decides the directory structure, names, owners and permissions of the
restored files.

This series builds on the per-file-handler argument for
LIVEUPDATE_SESSION_PRESERVE_FD and LIVEUPDATE_SESSION_RETRIEVE_FD from
Pasha's v1 [1], following Pratyush's suggestion on the RFC [2], and on
the design discussion on Pasha's v1 [3].

[1] https://lore.kernel.org/kexec/20261015093816.2438942-1-pasha.tatashin@soleen.com/
[2] https://lore.kernel.org/kexec/2vxz7bjmkjeu.fsf@kernel.org/
[3] https://lore.kernel.org/kexec/atE53vmlDeA4cWD2@google.com/

Series Overview
---------------

This series implements the following:

  1. Let userspace pass a file-handler-specific argument to
     LIVEUPDATE_SESSION_PRESERVE_FD and LIVEUPDATE_SESSION_RETRIEVE_FD,
     and let file handlers mark retrieve failures as retryable, so that
     userspace can fix a bad argument and try again without losing the
     preserved file (patches 1-3).

  2. Rename the memfd file handler (memfd_luo) to shmem_luo, since it
     preserves shmem files, which will include files on tmpfs mounts.
     Preserving memfds created with MFD_HUGETLB will need a separate
     handler, so naming the handler after the filesystem avoids another
     rename later. The compatible string stays "memfd-v2" (patch 4).

  3. Fix two existing problems in the retrieve path: a WARN_ON() that
     userspace can trigger when tracking a retrieved file fails, and a
     leak of the preserved folios when a retrieve fails before it
     restores them (patches 5-6).

  4. Retrieve files that were preserved from a tmpfs mount onto a tmpfs
     mount chosen by userspace, via the new struct
     liveupdate_shmem_retrieve_arg. The kernel creates the file as if by
     openat(dirfd, ".", O_TMPFILE | flags, mode), so the file gets the
     same flags, owner, permission checks and security labels as any
     other new file in that directory, and is charged to that mount.
     The kernel fills the file before returning it, so nothing else can
     access the file before it is complete, and userspace links it at
     the path it wants with linkat() (patch 7).

  5. Allow preserving tmpfs files that are still linked, and require
     permission to change the size of a file to preserve it, since
     preserving a file freezes its size for all users of the file
     (patch 8).

  6. Allow retrieving tmpfs files with O_RDONLY so that restored
     binaries can be executed before the session is finished (patch 9).

  7. Add a kexec selftest for preserving and retrieving tmpfs files
     (patch 10).

uAPI Changes
------------

  - struct liveupdate_session_preserve_fd and struct
    liveupdate_session_retrieve_fd gain a 64-bit @arg field, a pointer
    to a handler-specific argument that starts with a 32-bit size
    field. Callers that pass the old struct size are not affected.

  - Passing a non-zero @arg when retrieving a token that was already
    retrieved fails with -EBUSY instead of silently ignoring @arg.

  - New struct liveupdate_shmem_retrieve_arg, with @dirfd, @flags and
    @mode, for retrieving tmpfs files. Files that were preserved from a
    tmpfs mount can only be retrieved with it, and memfds can only be
    retrieved without it. Unlinked tmpfs files (e.g. created with
    O_TMPFILE) were retrieved as memfds before this series, and now
    require the argument too.

  - Preserving a file now requires permission to change its size (see
    Open Questions).

ABI Changes
-----------

  - struct shmem_luo_ser (formerly struct memfd_luo_ser) gains a
    SHMEM_LUO_FLAG_TMPFS flag in its existing @flags field, which
    records that a file was on a tmpfs mount rather than the internal
    shmem mount that memfds use.

Open Questions
--------------

  - Preserving a file freezes its size until it is unpreserved: For all
    users of the file, truncating it, fallocate() and writes past its
    end fail with -EPERM, and the owner of the file can't undo that.
    Linked files can be reached by anyone who can read them, so without
    a permission check, anyone with a session fd could preserve e.g. a
    world-readable file in /dev/shm through a read-only fd and break its
    owner. Patch 8 therefore requires permission to write to the file
    (inode_permission(MAY_WRITE), but neither a file opened for writing
    nor a writable mount), or ownership if the file is immutable or on a
    read-only superblock, since its size can't change anyway. Like
    FS_IOC_ENABLE_VERITY, it also requires the file to be opened for
    reading and rejects append-only files. The checks apply to all
    files, including memfds, where they pass in practice since memfds
    are created with mode 0777 (or 0666). Is this the right permission
    model for preserving files? Should this apply all files or just
    shmem files?

  - Is patch 9 (retrieving tmpfs files with O_RDONLY) worth merging?
    Without it, userspace can only retrieve files O_RDWR or O_WRONLY
    which then LUO keeps open until the session is finished, so
    executing a restored binary fails with -ETXTBSY until then.
    Supporting O_RDONLY retrieve is fairly simple so I think it is worth
    supporting.

Merge Plan
----------

This series applies on top of the next branch of liveupdate.git
(commit 27be83a12b24 ("Merge branch 'lu-pci-preservation' into
next")) and is targeting Linux 7.5.

The series will be merged through liveupdate.git.

This series conflicts with Pratyush's "mm: allow freezing mappings"
series [4], which also changes mm/memfd_luo.c and replaces
shmem_freeze() with mapping_set_frozen(). Whichever series lands second
will need to be rebased. Pasha suggested keeping retrieved files frozen
until the session is finished [5]. That builds on AS_FROZEN, so I think
it fits better in Pratyush's series.

[4] https://lore.kernel.org/kexec/20261027173031.763213-1-pratyush@kernel.org/
[5] https://lore.kernel.org/kexec/179322496574.1894369.544573858973645958.b4-review@b4/

Testing
-------

All patches were build-tested individually. The series was tested on
x86_64 and arm64 in QEMU using the Live Update selftests:

  - luo_tmpfs (new): 33 test cases covering the contents, size,
    position, seals and holes of restored files; creating the file like
    open(O_TMPFILE), with the requested flags and mode, the caller as
    owner, and O_EXCL; executing restored binaries before and after the
    session is finished; preserving files through read-only fds, on
    read-only mounts and superblocks, and immutable files; rejecting
    files that the caller can't write to, write-only fds and append-only
    files; block accounting on the target mount, including large folios
    that extend past the end of the file; mount and memcg limits;
    memfds; invalid arguments; retrieving a token twice; and that no
    kernel warnings are triggered.

    The main downside of this new test is that it is large (2k lines).
    It was trivial to generate with AI, but can understand if it is too
    large to review. I can look for ways to simplify it.

  - luo_kexec_simple, luo_multi_session, luo_stress_files and
    luo_stress_sessions.

  - liveupdate (including the new preserve_memfd_with_arg test).

The selftests were run with vmtest.sh:

  $ tools/testing/selftests/liveupdate/vmtest.sh -T luo_tmpfs

luo_tmpfs was also run on bare-metal x86_64.

Changelog
---------

v3:
 - Rebase onto liveupdate/next.
 - Collect Acked-by tags from Pasha on patches 4-6.
 - Drop the Assisted-by tags (Pasha).
 - Explain in patch 6 why it has no Fixes tag (Pasha).
 - Define shmem_inode_on_internal_mount() under CONFIG_SHMEM, like the
   other shmem helpers declared in mm/internal.h, to fix a
   -Wmissing-prototypes warning with CONFIG_SHMEM=n (kernel test robot).
 - Require a file to be opened for reading to preserve it, and reject
   append-only files (Sashiko).
 - Reopen files retrieved with O_RDONLY with the flags of the writable
   file, which file_open_root() normalized, e.g. by dropping O_CLOEXEC
   (Sashiko).

v2: https://lore.kernel.org/kexec/20261022225035.377445-1-dmatlack@google.com/
v1: https://lore.kernel.org/kexec/20261015093816.2438942-1-pasha.tatashin@soleen.com/
rfc: https://lore.kernel.org/kexec/20260901180713.4185641-1-dmatlack@google.com/


David Matlack (7):
  mm: Rename memfd_luo to shmem_luo
  liveupdate: Don't WARN if tracking a retrieved file fails
  mm/shmem_luo: Don't make early retrieve failures permanent
  mm/shmem_luo: Retrieve tmpfs files onto a tmpfs mount chosen by
    userspace
  mm/shmem_luo: Allow preserving tmpfs files that are still linked
  mm/shmem_luo: Allow retrieving tmpfs files with O_RDONLY
  selftests/liveupdate: Add a test for preserving tmpfs files

Pasha Tatashin (3):
  liveupdate: Pass user argument to file preserve and retrieve
  selftests: liveupdate: Add tests for preserve and retrieve user
    argument
  liveupdate: Allow file handlers to mark retrieve failures as retryable

 Documentation/core-api/liveupdate.rst         |    2 +-
 Documentation/mm/index.rst                    |    2 +-
 Documentation/mm/memfd_preservation.rst       |   23 -
 Documentation/mm/shmem_preservation.rst       |   23 +
 MAINTAINERS                                   |    4 +-
 include/linux/kho/abi/{memfd.h => shmem.h}    |   56 +-
 include/linux/liveupdate.h                    |   55 +-
 include/uapi/linux/liveupdate.h               |   52 +-
 kernel/liveupdate/Kconfig                     |    8 +-
 kernel/liveupdate/luo_file.c                  |  110 +-
 kernel/liveupdate/luo_internal.h              |    5 +-
 kernel/liveupdate/luo_session.c               |    6 +-
 mm/Makefile                                   |    2 +-
 mm/internal.h                                 |    1 +
 mm/memfd_luo.c                                |  621 -----
 mm/shmem.c                                    |    9 +
 mm/shmem_luo.c                                |  834 +++++++
 tools/testing/selftests/liveupdate/Makefile   |    1 +
 tools/testing/selftests/liveupdate/config     |    4 +
 .../liveupdate/lib/include/libliveupdate.h    |    3 +
 .../selftests/liveupdate/lib/lu_utils.c       |   17 +-
 .../testing/selftests/liveupdate/liveupdate.c |   44 +
 .../testing/selftests/liveupdate/luo_tmpfs.c  | 2055 +++++++++++++++++
 .../selftests/liveupdate/run-vmtests.sh       |    1 +
 24 files changed, 3237 insertions(+), 701 deletions(-)
 delete mode 100644 Documentation/mm/memfd_preservation.rst
 create mode 100644 Documentation/mm/shmem_preservation.rst
 rename include/linux/kho/abi/{memfd.h => shmem.h} (54%)
 delete mode 100644 mm/memfd_luo.c
 create mode 100644 mm/shmem_luo.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_tmpfs.c


base-commit: 27be83a12b246b6b3783e7d3ac5c378ff7520f25
-- 
2.56.0.385.gac671c819a-goog

