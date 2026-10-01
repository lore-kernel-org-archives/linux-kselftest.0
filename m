Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9397E485CEA;
	Thu,  1 Oct 2026 16:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873308; cv=none; b=eMEPMfZH4w8YsT/tZ17YmcCHawiYEEoKs3FIjcmPg6VLoySSogQBRpPupwvY3cfpWoVPZiG+E5ow5uf4+SY+0iA7XQwnySphlNq99opczkixwOL8r++hrKVK/WPsbQK9nrC7gxcFVv+iYo/Blx8eV2/QrA1jRvjcnpSYultE3wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873308; c=relaxed/simple;
	bh=TcgJ+sMH+KfbDsSag4S+D75/NlgyyGsofQicZ0WMIOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f8uUwjvjBpmcFHexBE8Zswmd3aabgvqC7VV61kIye8pepLdlnjEoXsY3egwbQV1geOFatzvfsGBVEY/j99htRZnVe9V+npBQE/pXR9/VPBAnacb65bGKVgmAjvkRhcuPs6Mbsg9973pYTnbQt8kvO7KCESCcKj3v7PlfpXhzOxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=piLIBUJ3; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="piLIBUJ3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=xiLOsznxwStAKdO6JUixosgESKBFj1ZWfbAZYJqzB6Y=; b=
	piLIBUJ3wqpfEKiq8ZTZ1fSfVbh9KYwgVP9Tt3kh8xGObJtQ7oxMk7y9KMsoxn/+JAUuTjCaFvy2a
	sHJ2tqgs24cXa6Qgo4UwN3ovk8glnWAy/2dJVpWs1rqgphQFKgVgflZn4s4vUuGIqLy9k/VZT7tDl
	i6ZHk3Mowj+A1IH9n5Zv27hjz5PRyO6nn2UqJu1HOKeZCa6EXFurDu+o90FQCy84TkdNg3/H6n1TW
	oQEMI9AjHtqldDCcwTja8rKtnGCIqkXHIu7xclHjcg2vbtcuHas2XHso9WZTbFuVy7GHnhsmoQP4P
	8uM/8X9txGdb0HeOiFezxQcrywCD9GDDwg==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xCJx9-00AD0c-BJ; Thu, 01 Oct 2026 18:48:15 +0200
From: Luis Henriques <luis@igalia.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Amir Goldstein <amir73il@gmail.com>,
	Chen Linxuan <me@black-desk.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matt Harvey <mharvey@jumptrading.com>,
	kernel-dev@igalia.com,
	Luis Henriques <luis@igalia.com>
Subject: [RFC PATCH v5 0/8] fuse: caches documentation and testing
Date: Thu,  1 Oct 2026 17:49:08 +0100
Message-ID: <20261001164916.15311-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi!

Following this email, I'm sending v5 of this patchset.  Here's what changed
since v4 (mostly from Amir's review):

- Included suggested changes to the document
- Moved back 'struct fuse_common_ctx' into tests FIXTURE
- Fixed a few typos in the tests comments
- Added missing SPDX-License-Identifier tag to fuse_common.h
- Added an initial stab on the dentries cache (hence not adding Amir's
  'Reviewed-by' tag in the first patch)

Luis Henriques (8):
  Documentation: fuse: add document on caches being used by FUSE
  selftests/fuse: convert fusectl test to fuse3
  selftests/fuse: check that fusectlfs is mounted
  selftests/fuse: factor-out test fixture setup/teardown
  selftests/fuse: use dynamically allocated memory to store ACLs
  selftests/fuse: add some extra ACL caching tests
  selftests/fuse: add fuse symlink caching test
  selftests/fuse: add fuse readdir caching test

 .../filesystems/fuse/fuse-caches.rst          | 198 ++++++++++++
 Documentation/filesystems/fuse/index.rst      |   1 +
 .../selftests/filesystems/fuse/.gitignore     |   3 +
 .../selftests/filesystems/fuse/Makefile       |  28 +-
 .../filesystems/fuse/fuse_acl_cache_test.c    | 299 ++++++++++++++----
 .../selftests/filesystems/fuse/fuse_common.c  |  58 ++++
 .../selftests/filesystems/fuse/fuse_common.h  |  33 ++
 .../selftests/filesystems/fuse/fuse_mnt.c     |  17 +-
 .../fuse/fuse_readdir_cache_test.c            | 273 ++++++++++++++++
 .../fuse/fuse_symlink_cache_test.c            | 162 ++++++++++
 .../selftests/filesystems/fuse/fusectl_test.c |   9 +-
 11 files changed, 998 insertions(+), 83 deletions(-)
 create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_common.c
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_common.h
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c

