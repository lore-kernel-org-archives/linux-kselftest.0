Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361183;
	b=a9cOKHleM6WR3ZyeaFEWz03ceMig3UeF721i8H4t32dDrxyjaiWB4zsEHNBBjOvRZdLF
	 RqES04SWLLyiedohKyLpT0AftNo53Cr8ZM9kt81bVuaB5oB4P1Ysyjo/gOpxA3JiyxSNC
	 I3rYJuf/sT3Iv+ufPOZum4UmI+av8ttjxaE3QtlFmdnKcrOZw2ZwDDAcoVO9w4DC9doD2
	 yvfNze5URRTj/fJMFjrzC71umU6qXm/YFjvKNagmfN45DWERIn/PXlhq6zyE+L2Fm7Xsn
	 mgpj6tHaWIs96Oxv7fZJYnMj1RQqH9nDpeH+LeLiSpJp9iTxW1nrbD4I+1dh2xHIZ3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361183;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=8Sc/0QjrZjg1TPndTW2kHmTziSBLoi+G23tfiraHCRE=;
	b=RwaiXP6ld0sxsIYixBppnNFDmtTR/nHcv1z0nySZu/bdXOQDdm9FGIZo0UkBrAnbEJc2
	 /qPNwtUkIfbT9Y5mfDx2TWnhMKItmQ95GcLWYLR8gqZxLW81uJ3JjIstQJpBqzoxVNbgM
	 knq5TJklcDNqjb/Wj2qf+XILUBNk7VVWtI6kji13DK/6w4UKItUXYNMOo41W1UIZERezE
	 VI3bi6LzT0QWrdDQ9NW47PCILFMNRTU0RJ6YA0iSGadT0sX7Klk3ezFdJGyggipInQtDE
	 bsgnp0ZX+jMFRJBnTVc0uuvwgyuV+/iHuCUyd7YSd1JUqUn2O9OxnpmjBYmD3XffAkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=aUCYkEny;
	arc=none smtp.remote-ip=79.135.106.31
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AFB606A330;
	Sun, 22 Nov 2026 15:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5AFB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=aUCYkEny
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795361180; x=1795620380;
	bh=8Sc/0QjrZjg1TPndTW2kHmTziSBLoi+G23tfiraHCRE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aUCYkEnyuiU22Jh7bh//oeOtvhU35Hg3yAA/E1M3rsIe4niC7+BR9cf3Xyc514DdU
	 cAXCTcBuBqB7YzY6EChe/4KW16OGuO9XhCnUvNTCPxuVxhAeKQnXvkrAZ3W9i5dCVh
	 v0GWecsoJVLSM7ayBMDAeGmMazeIpi6OdKDvhOx61w2VRKXatkuv3Rp1PnGCRCHIC4
	 0GRS/EqhaeoDI/SQeYooP/jNp2jf7CrxSXQyot71yAD6221N5NW3dtAdHog+7VOiGM
	 9iDY+WHL7f4b9DFa4Wf6rZufsgSghq6HRg1mX97CNuX5QlOeYOMMHXVfmpmOwiB2Ny
	 g6dN2d31WWsCQ==
Date: Sun, 22 Nov 2026 15:26:14 +0000
To: Miklos Szeredi <miklos@szeredi.hu>
From: Yun Wang <7z0423arsenova@proton.me>
Cc: Bernd Schubert <bernd@bsbernd.com>, Joanne Koong <joannelkoong@gmail.com>, Shuah Khan <shuah@kernel.org>, fuse-devel@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] fuse: don't wait for a sync-init mount when turning off fasync
Message-ID: <20261122152514.467423-2-7z0423arsenova@proton.me>
In-Reply-To: <20261122152514.467423-1-7z0423arsenova@proton.me>
References: <20261122152514.467423-1-7z0423arsenova@proton.me>
Feedback-ID: 227066774:user:proton
X-Pm-Message-ID: 255a16f6281118b0e3e2bc920c60b135dae23307
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Yun Wang <arsenova@a7snv.com>

Since commit dfb84c330794 ("fuse: allow synchronous FUSE_INIT"),
fuse_dev_fasync() looks the device up with fuse_get_dev(), which waits
until the mount has installed the channel if FUSE_DEV_IOC_SYNC_INIT was
used.  open(2) keeps O_ASYNC in f_flags, and __fput() calls
->fasync(-1, file, 0) for every file with FASYNC set.  So the last
fput of a sync-init device that was opened with O_ASYNC and never
mounted waits for a mount that can no longer come: until a signal in a
task, and forever in a kworker, which no signal wakes.  The last fput
runs in a kworker for example when the unix socket garbage collector
frees a file that was in flight, and then the stuck delayed_fput work
also holds up every later delayed fput: an unrelated tmpfs umount(2)
then fails with EBUSY.  /dev/fuse is 0666, so any user can do this.

In v7.1, before commit 9f6f44aa5a58 ("fuse: don't block in
fuse_get_dev() for non-sync_init case"), fuse_get_dev() waited for any
device that wasn't mounted yet, so this didn't even need
FUSE_DEV_IOC_SYNC_INIT.

Only an installed device can be on fiq->fasync, so before the mount
there is nothing to remove.  Don't wait when fasync is turned off;
turning it on still waits for the mount as before.  Turning it off on a
device that isn't mounted now succeeds instead of failing with -EPERM.

Fixes: dfb84c330794 ("fuse: allow synchronous FUSE_INIT")
Cc: stable@vger.kernel.org
Signed-off-by: Yun Wang <arsenova@a7snv.com>
---
 fs/fuse/dev.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 3641abb90d6b..2f6991d0e959 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -2280,10 +2280,23 @@ EXPORT_SYMBOL_GPL(fuse_dev_release);
=20
 static int fuse_dev_fasync(int fd, struct file *file, int on)
 {
-=09struct fuse_dev *fud =3D fuse_get_dev(file);
+=09struct fuse_dev *fud;
=20
-=09if (IS_ERR(fud))
-=09=09return PTR_ERR(fud);
+=09/*
+=09 * Only an installed device can be on fiq->fasync, so there is nothing
+=09 * to remove before the mount.  Don't wait for it then: __fput() calls
+=09 * this for every O_ASYNC file, also one that is never mounted, and
+=09 * also from a kworker, which no signal ends the wait for.
+=09 */
+=09if (!on) {
+=09=09fud =3D __fuse_get_dev(file);
+=09=09if (!fud)
+=09=09=09return 0;
+=09} else {
+=09=09fud =3D fuse_get_dev(file);
+=09=09if (IS_ERR(fud))
+=09=09=09return PTR_ERR(fud);
+=09}
=20
 =09/* No locking - fasync_helper does its own locking */
 =09return fasync_helper(fd, file, on, &fud->chan->iq.fasync);
--=20
2.56.1


