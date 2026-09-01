Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCAE486B9A
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 18:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286047; cv=none; b=KnlnlkWlS+IeiXAvlc6/YB5wfYCse3Q0vdFGL7051ETT7m55uv7as0wSQsiCsbNwGRSRluqBAb6vWb8ARAwHXh1MyZfPkkm+r0ZNK8g6HONGbZXJFKyaORw34qPZS52hqxck5Chvk2AM8+Z9MPpjUtsiwRouoci2Wv2WQ2dmYhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286047; c=relaxed/simple;
	bh=oRMCmo2+oUH4Bu0S96AHaFeNGbJv/okR69JWUSTQ1Yc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QiA29g/5pZIanfR/eHvBaQxAmGv94DVWfNLxsr3Xews1cjcClhkE1HHhZzmJe1V3TvmrKQCpTHLOOCqJp+8rmyVpZT7U7nfIi5skf0/ONeDPqMvePIJhMpdcHQjg/jma3wThMivuVa2IGc36foLjt2+F0MTvjBqAAd/2kvktI8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XAAwA9i9; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XAAwA9i9"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so207690a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 11:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788286045; x=1788890845; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lAVN67JT5h8WIfFlQUOkXfv2BuxQF89IX1lkYdIpCWw=;
        b=XAAwA9i9YBMu2flzVkmnWhKGDxh/TFvWga+MQS0h7RguobtTJWqGQcfmzAfV9wxFHx
         4Y+JBnRqL3j5cmYpknkW1qHrxXyIhqTJldTwDCwYYJ9xyoaTZ99sg2fxEN8PiO2f7Wiu
         yMaoa4Kh5GH0p30Fj6aGRiCpF3YHezzJugkFk4a46HS8lBkkydijotJGqn4ZKndysHxo
         mQYKIj7i+7cmzr2UNvm0vLgF7rJis0wxNRLz/20HGnpOn+KdCqg0jnojd3EcxYJW3OLD
         OBGI9JA5pTSxB9+aGjnKvVUZfBGg1rmhs2qPTIsj/vRoMsWYk+22ehk1zjMu/BunL/CI
         iRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788286045; x=1788890845;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lAVN67JT5h8WIfFlQUOkXfv2BuxQF89IX1lkYdIpCWw=;
        b=QRZIe6QdeqimX9lFAEXJvM8GfwY9fvpyZK9Y8JXrmTqBiTEr4q/dWYuyTFVYVGr2so
         foFoEm11/l5jzAppi239kQln6gT2GMsBE75WnYbX5RyrgWbMtn6h+0BsZB5iqL4ew8pN
         V8BdVrxZU3z/npnsKYoYgdA0kx2pQCfE5WIEkuTHXSZ6WS+TUw+i+VLVvgrPoJozw+OF
         S51S2KTfEUWWNFxQqXVaNHfeFDNa2zSIw3M+df6NVvG6U5tP1L7Evy/zSutYCsmCLwQK
         52R/oi/L2AvRNZLGdsf3W7FvdAqKxh8aREd3A5tX7uGYeOp2k6sxnzMA3eAzfahX9OGu
         4Wlg==
X-Forwarded-Encrypted: i=1; AKwUvBylW+YGz+OLDmRBZpOZjRZ/4yzqkaKGZTpprFg2sM93wV6+Q+I3JVIk2hfYlWMsAYjfqwHX+8VQ4ZTfwz+Si88=@vger.kernel.org
X-Gm-Message-State: AFuF++kiH2UkT0ZtUXy4CpDeeck3voSIhZqWdIEtj7rwwpW/pMGak/a/
	Rgb4k/Wlzr+5E9gDC2u4X3Fx8cXsyobTDJbubUpSpjdwMcVKGSdzNNREQRst6HNx0Dof02HbYjB
	iYSTMXdZyn1HXog==
X-Received: from pjbnu6.prod.google.com ([2002:a17:90b:1b06:b0:396:61d1:58c7])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5544:b0:398:bd37:6a49 with SMTP id 98e67ed59e1d1-398bd376c65mr32646461a91.12.1788286043659;
 Tue, 01 Sep 2026 11:07:23 -0700 (PDT)
Date: Tue,  1 Sep 2026 18:07:08 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901180713.4185641-1-dmatlack@google.com>
Subject: [RFC PATCH 0/5] liveupdate: LIVEUPDATE_SESSION_RETRIEVE_INTO_FD
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

This series adds support for LIVEUPDATE_SESSION_RETRIEVE_INTO_FD, a new
UAPI to enable preserved files to be restored into a userspace-provided
file instead of a kernel-allocated file, and uses this to support
preserving tmpfs files in-place without any changes to the LUO ABI.

The Live Update Orchestrator (LUO) API currently explicitly returns a
new struct file for every preserved file during retrieve() (e.g. via
memfd_alloc_file()). This then forces userspace to use anonymous memfds
for all in-memory files it wants to preserve. This works reasonably well
for VM guest memory but does not work well for other types of files that
userspace may want to preserve (e.g. in-memory logs, binaries,
configuration files, etc.).

Preserving entire tmpfs mounts in-place would require a large amount of
kernel support and would effectively make tmpfs an ABI, which is a
non-starter (or so I hear). Instead, we can delegate the reconstruction
of the tmpfs mounts (directory structure, permissions, etc.) post-kexec
to userspace. The kernel just needs to preserve the contents of tmpfs
files and provide userspace a mechanism to restore those contents back
into a specific file on the filesystem after the kexec. Hence,
LIVEUPDATE_SESSION_RETRIEVE_INTO_FD.

An alternative approach to restoring data to a named file would be
supporting a zero-copy sendfile() that can be used to convert named
tmpfs files to/from memfds across the kexec. But this poses significant
challenges on the *preserve* side since the preserved file might still
be actively in use. The benefit of the retrieve-into approach introduced
in this series is that it does not require dealing with two different
files. There is only ever one file that owns the preserved memory.

By leaving file and metadata allocation purely in the purview of
userspace, programs can create the target files where they want, with
the names and security permissions they desire, before directing the
kernel to restore the preserved folios into them.

Currently, only tmpfs shmem files are allowed as valid target receptors.
Attempting to target populated files, or anything other than an empty
shmem file, will trigger -EINVAL. HugeTLBfs files could be supported in
the future.

The coding work for this series was done with assistance from Gemini. I
am not sure what is the latest recommendation is with respect to adding
Assisted-by tags, but I can add them when I send out the real patches if
this RFC looks acceptable.

David Matlack (5):
  liveupdate: Extract luo_file token lookup logic into helper function
  liveupdate: Introduce SESSION_RETRIEVE_INTO_FD API and core support
  mm/memfd_luo: Implement retrieve_into callback for shmem folios
  mm/memfd_luo: Expand support beyond memfd to all generic shmem inodes
  selftests: liveupdate: Add multi-session test coverage for
    session_retrieve_into

 include/linux/liveupdate.h                    |  1 +
 include/uapi/linux/liveupdate.h               | 21 ++++++
 kernel/liveupdate/luo_file.c                  | 66 ++++++++++++++----
 kernel/liveupdate/luo_internal.h              |  2 +
 kernel/liveupdate/luo_session.c               | 30 ++++++++
 mm/memfd_luo.c                                | 68 ++++++++++++++++---
 .../liveupdate/lib/include/libliveupdate.h    |  1 +
 .../selftests/liveupdate/lib/lu_utils.c       | 33 +++++++++
 .../selftests/liveupdate/luo_multi_session.c  | 56 +++++++++++++--
 9 files changed, 249 insertions(+), 29 deletions(-)


base-commit: 4e1b74c6004371b046338325011a47cd7ab9dcc1
-- 
2.55.0.966.g6673acef38-goog

