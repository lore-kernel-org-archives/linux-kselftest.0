Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2533DC857;
	Mon, 17 Aug 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975904; cv=none; b=Cra5ARafgFFeQvvfShe/jtNi5vWsdIgHtJARRmTiBpuRPfO1i5inO58QPTIV0Sw860rb+Agl13J0RLa0AsvyAw5hnetDNkHV8n92LA4m2pAfOTZ53u4zSp4is+19d29w9JZu+i8gRxOmOerBzpiDbMw+6sPR38DFiuaEcIzhmKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975904; c=relaxed/simple;
	bh=3fxEsR/zqnDJcGoCbiwg2gPFJ6bJ0RTboAIybNXNskg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=luwdz7S3Sg8eKCjZdTeKc3301IqbY+OwjLRZ0AMGgIu6q0g/u+JBOnumzPxKUcegpvdhAj6U6+oh3nez9Zroa79vEiGXUWRXNM3JYJhbvCHKEq5oMMtDm/28PrMuomJyuo/w/BsUV2vhCc3WYFiyWXWItMbcsXxeSrMXiwaAqT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=WId3pj88; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="WId3pj88"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=WjImBGsGaCwbGIW04zCytOxxScKvpCtvnKjDL3Q0pD4=; b=
	WId3pj88oOKELySmClv+XqcCP9jPsqlZq2CmGedk9yDJFfcPz/NuJ8k/v36I6ZGtzDg3DdUsYMh7+
	fAYhYocLRpeLaT7ziN9GBZGKZYzw5b0+fQ6JQMWGRuTi+SsvCKsjiKqn1E1LQ4jQsf0p8hlZ7Vxpj
	XVFMrWaf3oUwCcOc/Zkph1lsKRWDVpwBHV27Ty6/SjU9EL3TJ1R2d6SC1EeqlHlJnXTqcjjpXUpHq
	R0Q+2/xGNQMn+P7ysg3sknb2gxGS+crZZDPPa6P9Nvfz569MzBHPYfcYI3a0Z/u6UqcO590Xei3Br
	SYAR7oGqnZvVfc9bhlO084K+jukGHdpklA==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wvy3n-004Xxs-I2; Mon, 17 Aug 2026 16:11:31 +0200
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
Subject: [RFC PATCH v2 0/8] fuse: caches documentation and testing
Date: Mon, 17 Aug 2026 15:11:48 +0100
Message-ID: <20260817141156.6079-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi!

I'm (finally!) sending v2 of this patchset.  It tries to document (and add
a few kselftests) to the different types of caches that are currently in use
within FUSE.  As I mentioned in v1 the idea for documenting this came from
Miklos during this year's LSFMM, where he mentioned he would like to see
caches usage documented before he could merge an initial version of fusex.

This version documents symlinks, attributes, ACLs and readdir caches.  Still
missing: dentries and data caching.

I'm still sending it as an RFC as I'm still not sure if it fulfils Miklos'
initial goal.

As usual feedback is welcome, as I'll (slowly) continue looking into other
cache types.

Major changes since v1:
- Added more caches to the document
- Changed tests format to single self-contained binaries
- Since Amir added a new fuse3-based test, the conversion to fuse3 of the
  fusectl has minor changes to the Makefile
  - NOTE: I've kept Amir's Reviewed-by anyway (should I drop it?)
- Added the ACL test-cases to the new ACL test implemented by Amir
  - This required some re-work of the existing test (patches 5 & 6)
- Added more tests

Luis Henriques (8):
  Documentation: fuse: add document on caches being used by FUSE
  selftests/fuse: convert fusectl test to fuse3
  selftests/fuse: check that fusectlfs is mounted
  selftests/fuse: add fuse symlink caching test
  selftests/fuse: factor-out test fixture setup/teardown
  selftests/fuse: use dynamically allocated memory to store ACLs
  selftests/fuse: add some extra ACL caching tests
  selftests/fuse: add fuse readdir caching test

 .../filesystems/fuse/fuse-caches.rst          | 142 ++++++++
 .../selftests/filesystems/fuse/.gitignore     |   3 +
 .../selftests/filesystems/fuse/Makefile       |  28 +-
 .../filesystems/fuse/fuse_acl_cache_test.c    | 289 ++++++++++++++--
 .../selftests/filesystems/fuse/fuse_mnt.c     |  17 +-
 .../fuse/fuse_readdir_cache_test.c            | 314 ++++++++++++++++++
 .../fuse/fuse_symlink_cache_test.c            | 204 ++++++++++++
 .../selftests/filesystems/fuse/fusectl_test.c |   7 +
 8 files changed, 950 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c

