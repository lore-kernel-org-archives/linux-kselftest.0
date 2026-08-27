Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9FD3932C3
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 23:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787873869; cv=none; b=ppspc4M5w/ZOHV97ZY4WEI7I3vVr+2LknsM56EL7AD1/eeLlBOWvnPgyVCFzK+lXdCFB3okN0hl+MLOUjURDg7tk0Tq9GFM3Mp1ocXiMzhLKUQaq01ZufSr9/6GQsASEMx0Qy863Iuvm76kDX7bsWmEuI2xioPRoKe4r9RCvP1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787873869; c=relaxed/simple;
	bh=lVioQ+2lnFeI8aV3vAxI2HD2Flp9WxEYrpxGWOPhUyA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uxxiN26jECJweg7Aldk+nJFjg0rP04nJJbSM5wcLD6tlLKlrtrEesW+wDsfKhncgQkOodHJ3HZXtAGwBiSgNoARfYICHEfLwORT3uqpcJLZ3bkO86AGFR+FeYCYVs+xUNVdZFeyl5VDOc0YeAD51ND3By260aVBvS29u0vI6MJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=V/HRzElS; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="V/HRzElS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1787873858; x=1788133058;
	bh=lVioQ+2lnFeI8aV3vAxI2HD2Flp9WxEYrpxGWOPhUyA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=V/HRzElSAm7yCy5cdGN4tJcQMeCjOSF9aJFu7l4uh6oSYbT+jIY2b6Df4Xv6lIytu
	 eUDTli1uFpjRYMKztVfWqRxCQHYqqt0ExXWltIrwy/pGvz2WIz+scd37929dSxUCYD
	 w0Kid8Npv1QLSNoNG6ocg8/CJHYRqjx1BVZeoKqAV7zJ22fPrUHQgTG4oxoHQB6E6o
	 jKNjbpmqJF6Lk2Q5oGMkcAwz6ZBZ1ij0tRGpwxQJLckbXJ51QNLItqUqL2TGYON23J
	 ymi23MJpIPgmik/tt0eYwPdB+0HOPafSh8Qwdw9JWg+b+q+/cBBd5AVhuEbLInoEOK
	 1yVnsSItw/ooA==
Date: Thu, 27 Aug 2026 23:37:34 +0000
To: Miklos Szeredi <miklos@szeredi.hu>, Stefan Hajnoczi <stefanha@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, German Maglione <gmaglione@redhat.com>, Shuah Khan <shuah@kernel.org>
From: Aaron Paterson <apaterson@pm.me>
Cc: =?utf-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, Aaron Paterson <apaterson@pm.me>
Subject: [PATCH 1/5] selftests/fuse: ignore the built acl cache test
Message-ID: <0c85f57ce65ab1f2f408a17010dd3fd8c7d6730e.1787873791.git.apaterson@pm.me>
In-Reply-To: <cover.1787873791.git.apaterson@pm.me>
References: <cover.1787873791.git.apaterson@pm.me>
Feedback-ID: 6356313:user:proton
X-Pm-Message-ID: 7bb71e1f1f8238f29ac79159edf6bf3d4f9cdb73
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Makefile builds fuse_acl_cache_test into the source directory when
libfuse3 is present, but the binary is not ignored, so a build leaves
the tree
dirty. The two other programs built here are already listed.

Signed-off-by: Aaron Paterson <apaterson@pm.me>
---
 tools/testing/selftests/filesystems/fuse/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/te=
sting/selftests/filesystems/fuse/.gitignore
index fb51603fe419..25c779065806 100644
--- a/tools/testing/selftests/filesystems/fuse/.gitignore
+++ b/tools/testing/selftests/filesystems/fuse/.gitignore
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+fuse_acl_cache_test
 fuse_mnt
 fusectl_test
 write_extend_eof_test
--=20
2.55.0.553.g4ad8c266be


