Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82F4448B9D;
	Fri,  4 Sep 2026 10:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518339; cv=none; b=sMRQFQz6wPPbcV8Uj4oSgh4/K/k/sc6M1Np+PSHxP4Z7sx+qjgaIqT6ehnbIW4bMHL6VCE3jqN1znHkkYZmaXIfzAEMblhfOqV2AiC2koEK9ri8y+ycDnR5ln18l5g6hHSsPUc02wUVivJlpIQ7dxLVnIC8ERR8NGLzB5PdZO44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518339; c=relaxed/simple;
	bh=t0m3+kAGmMdyDkpHZxlG2nzl8IMF1Jb+uL4FbDElYNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gvtANF8Uadg/wGET1Gal53htBjjCAg71oiciqMBdpBKxTqJnRzdpE1/UrQyAfyGStKa7pilUq5wXzrfKPl/q4l8P/ZT+ZnWfhsCFJ3AWRTL8TcUr/01q+S/Rg/ifbgJYnNSdpJ+lXm5DY0ZZBmvVJzRxrUeq89R7VOrfUBNMrYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ryMFtoB7; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ryMFtoB7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=TBmqkxo2MVZ29S7IY33a8c1vA+RJ2PWqW/3fxZldUeo=; b=
	ryMFtoB7m/94Fcfbg0uvczpQy4gOfoBLJ9aZukSduNgFvM5Tsg4lU9AWf/zV861FUbQcQw6NO+CZ6
	CVLHzJzDCbqcfJJQASPhbRyDnzD+QShfzafE7fiPU5+2W7FYg3Vcv8lWntVnnx4Rv+bZnZufQFCeL
	KxTEo9q666IiWWSX7bwxnSs6J/X5ODrELIz1qmevLfZQ1hnxp40Q4LrJIynu614PeSsVcq8KnGwgZ
	mlU7BbrxmHwBCGJ0WwG2MgLrisPJPur0BsTZd45xkttmgzs6pWK6qzVRyI3/DaYXvLT6PDS2lVr3k
	Lz934cOjYXETZ0tNN606Tae8f8atWghLAA==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x2RJk-00Eq0i-CS; Fri, 04 Sep 2026 12:38:44 +0200
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
Subject: [RFC PATCH v3 0/8] fuse: caches documentation and testing
Date: Fri,  4 Sep 2026 11:39:12 +0100
Message-ID: <20260904103920.4471-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi.

Here's v3 of this patchset.  It mostly tries to fix all the problems with v2
(i.e. it does not add any new tests or documents any other cache type).

I tried to address all comments from Amir, and also from sashiko[1].  (Some
of sashiko comments for the tests were incorrect, probably due to it being
trained with old versions of libfuse...?)

Hopefully, the text now contains less mistakes and is more readable.

[1] https://sashiko.dev/#/patchset/20260817141156.6079-1-luis%40igalia.com

Luis Henriques (8):
  Documentation: fuse: add document on caches being used by FUSE
  selftests/fuse: convert fusectl test to fuse3
  selftests/fuse: check that fusectlfs is mounted
  selftests/fuse: factor-out test fixture setup/teardown
  selftests/fuse: use dynamically allocated memory to store ACLs
  selftests/fuse: add some extra ACL caching tests
  selftests/fuse: add fuse symlink caching test
  selftests/fuse: add fuse readdir caching test

 .../filesystems/fuse/fuse-caches.rst          | 158 ++++++++++
 .../selftests/filesystems/fuse/.gitignore     |   3 +
 .../selftests/filesystems/fuse/Makefile       |  28 +-
 .../filesystems/fuse/fuse_acl_cache_test.c    | 271 +++++++++++++----
 .../selftests/filesystems/fuse/fuse_common.c  |  60 ++++
 .../selftests/filesystems/fuse/fuse_common.h  |  25 ++
 .../selftests/filesystems/fuse/fuse_mnt.c     |  17 +-
 .../fuse/fuse_readdir_cache_test.c            | 274 ++++++++++++++++++
 .../fuse/fuse_symlink_cache_test.c            | 167 +++++++++++
 .../selftests/filesystems/fuse/fusectl_test.c |   9 +-
 10 files changed, 934 insertions(+), 78 deletions(-)
 create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_common.c
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_common.h
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c

