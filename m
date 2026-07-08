Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A1F282F20;
	Wed,  8 Jul 2026 13:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516270; cv=none; b=QvTeAexMTRxCZ4RcqliTH09upCn6DcjYA04Ljh63ZL/hiDlgPC71sNQ5S9h34XLm/Y+Tpp4pEgeJjoPO5lFTpFd6PfX9jsLPinhHN1IVHbWlFtr/ehiMdzA8g5A/zGi3iJLkgBcnrN8DcoDgu2lCEBtu/hluQtKpKcneU6RmRZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516270; c=relaxed/simple;
	bh=R6AJX8SPMBaN3yJdrmQmXQD1Rw9eZtD+2xhgTlzxifw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ctPewrJop+n+loDHuzk9mJia62Akd9vqIyfAyaB/hsQCsIR6btKsQOshEoDHq+KrGYOP+5++ZnSvzlZkVrALOW80ZY3pDnWtoQ5FqfB6w369XPipepfLKNn4pr3/RfmVUAsNy+qwAQ5iIsg1HgueUguh3j8eHA32hA/WZ053KaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=BMaZLdtc; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="BMaZLdtc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UvU3z3ipuYqqjr6ihAQkp3LvvCsIbrPYtcxN5vl3W3Q=; b=BMaZLdtcegHCA0dsR9JWESwF07
	HXwJtPI6ABEF+5uxFks5dQw6GzVxXeSxMa/oBYBUFuxIRRCQLsiPZA4K0UZP3pvzJUqoxmVoIZxPa
	e7cxBi3aYxFtnbM6PqWYy9Y4TQYhk+ea7cD0en6HdAKBpDXPXEMYphLACoK8b78Fe7EUVMFWtZdqv
	y6rNVtOJYgGHRgIj+qeyqQOYNYBLsrxdKnP4V907vw3jsl2ESLbiJh1eLn2xoO03AefFnaVSZvm2P
	9qU3VWnjf1mkyJdLpTIGTbkGQM9u1DOP0RsSPfIukq+mwPc1/KR3WtgbUPYtpfyHT68ztR02mt7ZO
	6S6UFXSw==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1whS3J-00BiU2-Cr; Wed, 08 Jul 2026 15:11:01 +0200
From: Luis Henriques <luis@igalia.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matt Harvey <mharvey@jumptrading.com>,
	kernel-dev@igalia.com,
	Luis Henriques <luis@igalia.com>
Subject: [RFC PATCH v1 0/5] fuse: caches documentation and testing
Date: Wed,  8 Jul 2026 14:11:17 +0100
Message-ID: <20260708131122.2917-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi!

FUSE uses several different types of caches: directory, symlink, attributes,
ACLs, etc.  This RFC includes an attempt at documenting the usage of these
caches, in particular the rules for inserting/removing/revalidating data
into them.  The idea for this document came from Miklos during this year's
LSFMM -- he would like to see caches usage documented before he could merge
an initial version of fusex.

This is an early version of this document, which includes only two caches:
symlinks and ACLs.  Further caches will follow, assuming the proposed format
is acceptable.

In the meantime, while (slowly) working on this document, it became clear
that another useful thing to have would be some test cases that could
validate it.  And which could also be used as regression tests, of course.
Thus I'm also adding 2 very basic kselftests for these caches.  For now they
only do the obvious validation for whether caching is working or not, but
they can be extended to further validate different behaviours.

Finally, since the only existing FUSE kselftest is still using fuse2, I'm
also proposing to modify it so that it uses fuse3 instead.  There's the risk
this may be breaking some existing QA, but maybe that's an acceptable risk
(after all, fuse3 has around for ~10 years now!).

Anyway, this is an RFC for all the above.  Any feedback is welcome, as I
start looking into other cache types.

Luis Henriques (5):
  Documentation: fuse: add document on caches being used by FUSE
  selftests/filesystems: convert fusectl test to fuse3
  selftests/filesystems: check that fusectlfs is mounted
  selftests/filesystems: add fuse symlink caching test
  selftests/filesystems: add fuse ACLs caching test

 .../filesystems/fuse/fuse-caches.rst          |  86 +++++++
 .../selftests/filesystems/fuse/.gitignore     |   3 +
 .../selftests/filesystems/fuse/Makefile       |  23 +-
 .../selftests/filesystems/fuse/acl_fs.c       | 216 ++++++++++++++++++
 .../selftests/filesystems/fuse/acl_test.sh    |  66 ++++++
 .../selftests/filesystems/fuse/fuse_mnt.c     |  17 +-
 .../selftests/filesystems/fuse/fusectl_test.c |   7 +
 .../selftests/filesystems/fuse/setgetacl.c    |  62 +++++
 .../selftests/filesystems/fuse/symlink_fs.c   | 115 ++++++++++
 .../filesystems/fuse/symlink_test.sh          |  52 +++++
 10 files changed, 635 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst
 create mode 100644 tools/testing/selftests/filesystems/fuse/acl_fs.c
 create mode 100755 tools/testing/selftests/filesystems/fuse/acl_test.sh
 create mode 100644 tools/testing/selftests/filesystems/fuse/setgetacl.c
 create mode 100644 tools/testing/selftests/filesystems/fuse/symlink_fs.c
 create mode 100755 tools/testing/selftests/filesystems/fuse/symlink_test.sh

