Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361227;
	b=xoGfHQoSc5zXN+as0TIO0V6XebJEnyARMDOZcGPBmKeUKsW2eojSYCIyUVXMWgfjXMPX
	 WUhUXarb76r4XLWC6BWQ5eZ59DjY19JtnGsS0Ghbb66AcF5qGTYhjOIbSVAPOK+dRoR2v
	 ebxn3o6G0d9PjBE30RXqCIh9ZI0mfBZGC3wiFFPxkCSkUeItk++FwuktbENzfiyYnsink
	 JwE4ENTu21lqtIXnXA1SVdYJp8m6uGEVBKjKtPh7g3u+Q9d8gLuPoP2Gcj5DRwzR/ws6/
	 8Z9MiLfQQLrPVVz7xJ4loTW3dprRGW+5krfqD4EJ+ThMzLPEyrXNTN9pmhRLQ9q1Y4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361227;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=GvGsD0red2CdKw9UkrmRFfAWiCbnnyXIqmSsv7DDcpU=;
	b=OxETRywWVLofOsbW9FCa69Y/OiozeKVGU2ngGD9Yj8dMpxn7YkT0fva2ft74t7O0/UTh
	 JxZbt1gZX1dmspJNT4KtMvJteOcRHZCrdcbxES5mq+4vOtWPRVi5HiXrIkwEOHro1q3/3
	 /0/dDwRmbITgoRvnQ/8xTrMYuLV5eAUezGFShs9mQCrAB3M4k69BUHgKIgF1SjFRuJ0X+
	 AioziUiiLaSOCJYu0zrzZsC8UPqndzxl00qk4DGRQ4R1FCEujF6CMT7INu4DbiJaWF7vq
	 IIbCLh6iJmJMIG7DRrvuwJn3pe6Jx3DqXSg35V7zNDDxNkG1qdmmBbLJvcxJZiS/c9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Z8HUp7qg;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B4D606A320
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 15:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05B4D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Z8HUp7qg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795361224; x=1795620424;
	bh=GvGsD0red2CdKw9UkrmRFfAWiCbnnyXIqmSsv7DDcpU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Z8HUp7qgMzJ2h9PYwaCGcaQ+5a8tdpRDmkomDyearmV+hxEYIj8gfxN/4ClDBOsvu
	 mkrwzFbiDIvIjyAkHJ4hvNf8IzRTx6edqLOlqoofwnJ8r8RW8Z1KsVKqTx5gae3cNU
	 Sa1faTJ/YkRqDdNUsTqKMF6QDDiiqmZYqwrph5fFec3ekR4uRR573MmdfRybMDtaEk
	 2IkLcZ/PXkIhRoXXpPw/8LygJOavvf2C/LUr7V/vkmtIc+AYSLsEXrkK0t+ZI4gPvY
	 KG/RJpd5iUojyBr3M4u02zS6kRWEkSI57+xsg0sQXC+CowSJ0LNYt8/Mm2nY2XNxAM
	 dnUXZrN7enmlQ==
Date: Sun, 22 Nov 2026 15:26:58 +0000
To: Miklos Szeredi <miklos@szeredi.hu>
From: Yun Wang <7z0423arsenova@proton.me>
Cc: Bernd Schubert <bernd@bsbernd.com>, Joanne Koong <joannelkoong@gmail.com>, Shuah Khan <shuah@kernel.org>, fuse-devel@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] fuse: don't sleep in ->poll before a sync-init mount
Message-ID: <20261122152514.467423-5-7z0423arsenova@proton.me>
In-Reply-To: <20261122152514.467423-1-7z0423arsenova@proton.me>
References: <20261122152514.467423-1-7z0423arsenova@proton.me>
Feedback-ID: 227066774:user:proton
X-Pm-Message-ID: 4fa0da788131fab095a1cf655217660b1313cf65
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

fuse_dev_poll() gets the device with _fuse_get_dev(), which waits for
the mount of a device in sync-init mode.  So before the mount, ->poll
sleeps until the mount or a signal, and so do its callers:

 - poll(2), even with a zero timeout.  An eventfd in the same poll set
   can't end the wait, and after a signal poll(2) reports POLLERR.
   libfuse's sync-init worker polls the device together with an
   eventfd that is meant to stop it, and libfuse had to work around
   mounts that hung there, see the Link.
 - epoll_ctl(EPOLL_CTL_ADD), while holding ep->mtx, so other
   epoll_ctl() calls and an epoll_wait(2) with events to report on the
   same epoll instance wait too.
 - io_uring_enter(2) for a read or a poll, since io_uring polls the
   device before it tries the read or when it arms a poll for it.
   That happens with the ring's uring_lock held, so any other thread
   that submits to the same ring waits for it in D state meanwhile.

The sleep can't simply be dropped.  Before the mount there is no
fiq->waitq to wait on, and poll(2), epoll and io_uring register their
wait queue entries only once, so a poller that registered somewhere
else before the mount would miss the requests that come after it.

Give struct fuse_dev a wait queue for that window.  Before the mount,
->poll waits on fud->mount_waitq and reports no events.  When a
sync-init device is installed, add an entry to fiq->waitq that passes
every wakeup on to fud->mount_waitq, and wake fud->mount_waitq once,
since the device is writable now.  ->poll checks for the channel again
after queueing itself, and the channel is set before that wakeup, so a
poller racing with the mount either gets woken or sees the channel and
then waits on fiq->waitq as well.  fuse_dev_release() removes the entry
before it drops the connection reference.  Pollers that come after the
mount wait on fiq->waitq as before.

This adds 64 bytes to struct fuse_dev on x86-64 without lock
debugging.  The wake_up_sync() of a synchronous request is passed on as
it is.  Any other wakeup may come from wake_up_all(), so it wakes every
waiter on fud->mount_waitq, EPOLLEXCLUSIVE ones too; that only affects
pollers that came before the mount.

The entry stays on fiq->waitq while the device is open, so every
wakeup of fiq->waitq calls it.  If nobody waits on fud->mount_waitq,
it returns without taking that lock, and a request costs one more
indirect call.  That is the case once the pollers from before the
mount are gone, such as libfuse's worker once its poll(2) returns.
The check needs no barrier: every waker of fiq->waitq holds fiq->lock,
and the pollers woken by the mount look at the queue under fiq->lock
again, see the comment in fuse_dev_mount_wake().

Fixes: dfb84c330794 ("fuse: allow synchronous FUSE_INIT")
Link: https://github.com/libfuse/libfuse/pull/1633
Signed-off-by: Yun Wang <arsenova@a7snv.com>
---
 fs/fuse/dev.c        | 70 +++++++++++++++++++++++++++++++++++++++++---
 fs/fuse/fuse_dev_i.h |  9 ++++++
 2 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 7cb93885cd0a..187fd13fefe0 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -439,6 +439,7 @@ static struct fuse_dev *fuse_dev_alloc_no_pq(void)
=20
 =09refcount_set(&fud->ref, 1);
 =09fuse_pqueue_init(&fud->pq);
+=09init_waitqueue_head(&fud->mount_waitq);
=20
 =09return fud;
 }
@@ -457,6 +458,35 @@ struct fuse_dev *fuse_dev_alloc(void)
 }
 EXPORT_SYMBOL_GPL(fuse_dev_alloc);
=20
+/*
+ * Pollers of a sync-init device that came before the mount are queued on
+ * fud->mount_waitq, and poll(2), epoll and io_uring don't register again
+ * later. Pass every wakeup of fiq->waitq on to them: a sync one as it is,
+ * any other to all of them, since it may come from wake_up_all().
+ */
+static int fuse_dev_mount_wake(struct wait_queue_entry *wait, unsigned int=
 mode,
+=09=09=09       int wake_flags, void *key)
+{
+=09struct fuse_dev *fud =3D container_of(wait, struct fuse_dev, mount_fwd)=
;
+
+=09/*
+=09 * Nobody to pass the wakeup on to.  Every waker of fiq->waitq holds
+=09 * fiq->lock, and the pollers on mount_waitq were woken by the mount
+=09 * and look at the queue under fiq->lock again.  If that look came
+=09 * first, this waker sees them here; if it came later, it sees the
+=09 * new request.
+=09 */
+=09if (!waitqueue_active(&fud->mount_waitq))
+=09=09return 0;
+
+=09/* fiq->waitq is woken only by wake_up{,_all,_sync}(): 0 or WF_SYNC */
+=09if (wake_flags)
+=09=09__wake_up_sync_key(&fud->mount_waitq, mode, key);
+=09else
+=09=09__wake_up(&fud->mount_waitq, mode, 0, key);
+=09return 0;
+}
+
 /*
  * Installs @fch into @fud, return true on success.  "Consumes" @pq in eit=
her case.
  */
@@ -490,6 +520,19 @@ static bool fuse_dev_install_with_pq(struct fuse_dev *=
fud, struct fuse_chan *fch
 =09}
 =09list_add_tail(&fud->entry, &fch->devices);
 =09fuse_conn_get(fch->conn);
+
+=09if (fud->sync_init) {
+=09=09/* Removed in fuse_dev_release(), before the conn ref is put */
+=09=09init_waitqueue_func_entry(&fud->mount_fwd, fuse_dev_mount_wake);
+=09=09add_wait_queue(&fch->iq.waitq, &fud->mount_fwd);
+=09=09fud->mount_fwd_queued =3D true;
+=09=09/*
+=09=09 * The device is writable now.  Wake without a key: a poller
+=09=09 * that waits only for EPOLLIN has to look again as well, see
+=09=09 * fuse_dev_mount_wake().
+=09=09 */
+=09=09wake_up_all(&fud->mount_waitq);
+=09}
 =09wake_up_all(&fuse_dev_waitq);
 =09return true;
 }
@@ -2102,16 +2145,33 @@ static ssize_t fuse_dev_splice_write(struct pipe_in=
ode_info *pipe,
 =09return ret;
 }
=20
+/*
+ * Before the mount, a sync-init device has no fiq->waitq to wait on. Its
+ * pollers wait on fud->mount_waitq instead, and the mount passes the
+ * wakeups of fiq->waitq on to it, see fuse_dev_mount_wake().
+ */
 static __poll_t fuse_dev_poll(struct file *file, poll_table *wait)
 {
 =09__poll_t mask =3D EPOLLOUT | EPOLLWRNORM;
 =09struct fuse_iqueue *fiq;
-=09struct fuse_dev *fud =3D _fuse_get_dev(file);
+=09struct fuse_dev *fud =3D fuse_file_to_fud(file);
+=09struct fuse_chan *fch =3D fuse_dev_chan_get(fud);
=20
-=09if (IS_ERR(fud))
-=09=09return EPOLLERR;
+=09if (unlikely(!fch)) {
+=09=09if (!fud->sync_init)
+=09=09=09return EPOLLERR;
+
+=09=09poll_wait(file, &fud->mount_waitq, wait);
+=09=09/*
+=09=09 * Check again after queueing: fuse_dev_install_with_pq() sets
+=09=09 * the channel before it wakes fud->mount_waitq.
+=09=09 */
+=09=09fch =3D fuse_dev_chan_get(fud);
+=09=09if (!fch)
+=09=09=09return 0;
+=09}
=20
-=09fiq =3D &fud->chan->iq;
+=09fiq =3D &fch->iq;
 =09poll_wait(file, &fiq->waitq, wait);
=20
 =09spin_lock(&fiq->lock);
@@ -2264,6 +2324,8 @@ int fuse_dev_release(struct inode *inode, struct file=
 *file)
 =09=09/* Are we the last open device? */
 =09=09last =3D list_empty(&fch->devices);
 =09=09spin_unlock(&fch->lock);
+=09=09if (fud->mount_fwd_queued)
+=09=09=09remove_wait_queue(&fch->iq.waitq, &fud->mount_fwd);
=20
 =09=09fuse_dev_end_requests(&to_end);
=20
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 808152b75792..40caa4d820a1 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -305,6 +305,9 @@ struct fuse_dev {
 =09/** @sync_init: Issue FUSE_INIT synchronously */
 =09bool sync_init;
=20
+=09/** @mount_fwd_queued: @mount_fwd is on chan->iq.waitq */
+=09bool mount_fwd_queued;
+
 =09/** @chan: Fuse channel for this device */
 =09struct fuse_chan *chan;
=20
@@ -313,6 +316,12 @@ struct fuse_dev {
=20
 =09/** @entry: list entry on fch->devices */
 =09struct list_head entry;
+
+=09/** @mount_waitq: pollers that came before the mount wait here */
+=09wait_queue_head_t mount_waitq;
+
+=09/** @mount_fwd: passes wakeups of chan->iq.waitq on to @mount_waitq */
+=09wait_queue_entry_t mount_fwd;
 };
=20
 struct fuse_copy_state {
--=20
2.56.1


