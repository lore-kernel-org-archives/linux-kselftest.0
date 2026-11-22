Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361163;
	b=qYSQcOtu+OJiM8e2Zu107k6NS6WXa4Yz2WkIn9fIRavD9FQPTN8nQxqCG1FvugAb640H
	 KDJVOVW7+2/V/RUxxhjOSfoaZgOioEnQAxk3LJskYbUcClnKcsquCSEeHNCTM06S+yGng
	 cl+8CoBE0dR3z1G6FeZiM1J6czyUWlFNbbbHt8z23kSf4KhVCNlgzmE7HYUUSYnf6hEE5
	 SH9lbDMY+6WrNh90dI1MqYCRY07LTm+4+96qiIOwtXK+3wWG2P2VlsIcfW+I4Y/+FHJ7n
	 cyMpefKHaOguB+zDV/vQjIaatZfv7+D/9HSWb056J8NPcms9O7vp3FT3JLcOjD02APQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361163;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gMQttSAKRMtW0cW3S3mXFuyL3kR87s+2b//SCKbommw=;
	b=z41eOQmggv6qLzG9A8M39oMwAUI7dOHi5FiSFslHy+ESNXgXPjPJVT3X2U/8Kn//2jeA
	 UfhfWEYRI6iBLqEPpN1I7jRh+4K0M/AEuSVl+21sQDLFYXKajqD7YuCyk93tE3zWLXWGH
	 /Vwgf4RFRJAMucbRI/8GjjJ7YUMYC30AiocpHlD+T7qw+2xjM4TmHCXRTBg8KWxxVlMqn
	 fDu1+mz84h4J+5ccTOC3cS7Up3CAwuQs6/nrnynEmrfNeoivIlO9buVz/lcco5feVuayr
	 fKU0WvzER2YnJNflDktmA07VdNeO8P+LLlKYa3RvnRLKMIzj7d5/6XWLrcm4ybnmYdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=LLMpfnGw;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E667606A320
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 15:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E667606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=LLMpfnGw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795361159; x=1795620359;
	bh=gMQttSAKRMtW0cW3S3mXFuyL3kR87s+2b//SCKbommw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LLMpfnGw4CysvgJE/5RHm1CKJiC9K+HGx2O1l2d9P94YxsT0L23aFOP3cBYo2Zzaa
	 O0c3Rp5WIEaBQHyg8wEuI3EG1+Dj9H1syVwy1swS+1SwOhOn0l/oShhln2fdyhRGAJ
	 tXYVuAsBW55C602/p1cMMPEu/V5buySsL5GdweqAT/Iol2vzvhMa9WaLDDkMonNrcC
	 WbxLYoXMrFXctYukFgmCBgKybBBfZMicXhh4av0Tl3B2ta14XV3ZqkfNpwgRTpbygR
	 QXfSaCS6P1lnQkT4VKxxqb/oz0W5QURmU+VLWCMPhvrh6HfLgpVli4D0ThTZvcIfUR
	 9WVYkddr0dkgQ==
Date: Sun, 22 Nov 2026 15:25:56 +0000
To: Miklos Szeredi <miklos@szeredi.hu>
From: Yun Wang <7z0423arsenova@proton.me>
Cc: Bernd Schubert <bernd@bsbernd.com>, Joanne Koong <joannelkoong@gmail.com>, Shuah Khan <shuah@kernel.org>, fuse-devel@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] fuse: don't wait for a sync-init mount where nothing should wait
Message-ID: <20261122152514.467423-1-7z0423arsenova@proton.me>
Feedback-ID: 227066774:user:proton
X-Pm-Message-ID: bf74e8fcf5c6afe03560bb8645e9b95de873142a
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

Since commit dfb84c330794 ("fuse: allow synchronous FUSE_INIT"), a
/dev/fuse fd with FUSE_DEV_IOC_SYNC_INIT waits in fuse_get_dev() until
the mount installs the channel.  That suits a blocking read, but other
callers of fuse_get_dev() must not wait, and before the mount they
sleep until the mount or a signal:

 - The last fput of an fd that was opened with O_ASYNC, which turns
   fasync off through ->fasync.  In a kworker, which no signal wakes,
   it never returns, and every later delayed fput waits behind it.
   /dev/fuse is 0666, so any user can do this.  (patch 1)
 - read(2) and splice(2) with O_NONBLOCK.  (patch 2)
 - IORING_OP_URING_CMD, with the ring's uring_lock held, so any other
   thread that submits to the ring waits in D state.  (patch 3)
 - ->poll: poll(2) even with a zero timeout and with an eventfd in the
   set, epoll_ctl(2) with ep->mtx held, and io_uring reads and polls
   with uring_lock held.  libfuse's sync-init worker ran into this [1].
   (patch 4)

Patch 5 adds a selftest for all of them.

v1 [2] had patches 2 and 3, and announced the ->poll fix.  Patch 1 is
new.  I put it first because it is the one that matters most for
stable, and because it applies on its own: the same change, with
fud->fc instead of fud->chan, also fits v6.18 to v7.1.  The others only
apply from v7.2 on; older trees would need their own version.

Patch 1: the wait goes back to dfb84c330794 and needs
FUSE_DEV_IOC_SYNC_INIT, except in v7.1: from a8dd5f1b73bc ("fuse:
create fuse_dev on /dev/fuse open instead of mount") until
9f6f44aa5a58 ("fuse: don't block in fuse_get_dev() for non-sync_init
case"), which came to 7.1.y in 7.1.4, any fd that wasn't mounted yet
waited.  As an unprivileged user, with the last fput coming from the
unix socket garbage collector, I got the stuck kworker on 6.18.64 and
7.4-rc2 with sync init, and on 7.1.3 also without; 6.18.64 without
sync init doesn't wait:

  kworker/3:1+events  state S
  fuse_get_dev <- fuse_dev_fasync <- __fput <- delayed_fput <-
  process_one_work <- worker_thread <- kthread

Nothing then drains the global delayed_fput work: an unrelated tmpfs
umount(2) fails with EBUSY, and succeeds again with the series.

Patches 2 and 3: as Bernd pointed out on v1, patch 3 means a server
that sends REGISTER before the mount has to retry it, and -EAGAIN
doesn't say when.  Before the patch such a REGISTER sometimes went
through after the mount woke it up, but only by timing (12 of 20 runs
here); and a REGISTER sent before FUSE_INIT has been answered on an
async-init connection already gets -EAGAIN today.  libfuse sends
REGISTER only once the connection is initialized, with sync and async
init, so it isn't affected.  Waiting for FUSE_INIT in io-wq instead
would hold a bounded io-wq worker per early REGISTER, which can starve
the task's other punted work.  The details are in the v1 discussion
[3].

Patch 4: ->poll can't just stop sleeping, since a poller that registers
before the mount has no fiq->waitq to wait on, and poll(2), epoll and
io_uring don't register again later.  It gives struct fuse_dev a wait
queue for that window and passes the wakeups of fiq->waitq on to it
once the device is installed; the changelog explains why pollers that
race with the mount don't miss a wakeup.  The other way I can see is to
give a sync-init fd its channel when FUSE_DEV_IOC_SYNC_INIT is called,
so that it polls the same wait queue before and after the mount.  That
avoids the forwarding, but the channel belongs to the connection that
fuse_get_tree() creates and a failed mount frees, so I kept the change
local for a fix.  If you'd rather go that way, I can try it.

Tested in QEMU (virtme-ng, 4 vCPUs) on 7.4-rc2 (067c5c24cef2), with
the selftest from patch 5 (24 tests):

  without the series        11 of 24 pass
  with patches 2 and 3      15 of 24: fasync_close, poll,
                            poll_eventfd, epoll, ring_lock_poll and
                            the four mount tests still fail
  with patches 1 to 4       24 of 24, also with KASAN, lockdep and
                            DEBUG_ATOMIC_SLEEP, and nothing in dmesg

With the forwarding taken out of patch 4, or done only once, the four
mount tests fail.  With the series, the kworker from patch 1 no longer
gets stuck, SIGIO for requests after the mount still works, my other
/dev/fuse tests give the same results as before, with and without
KASAN, and a test that arms pollers while the mount installs the
device passed 200 runs, and 100 more with KASAN.

The patches are against 7.4-rc2 (067c5c24cef2) and also apply to
fuse.git for-next (7f7b822d09c5).

Changes since v1:
 - new patch 1, fasync.
 - patch 2 (v1 1/2): renamed as Bernd suggested: the O_NONBLOCK-aware
   lookup is now fuse_get_dev(), the waiting one _fuse_get_dev(), and
   the callers that still wait call _fuse_get_dev(), so only read and
   splice change behaviour.  _fuse_get_dev() sits next to
   __fuse_get_dev(), which doesn't wait and returns NULL; if that is
   too easy to confuse, I can use fuse_get_dev_wait() instead.  I kept
   the rename in the fix rather than a separate patch, so that a stable
   backport needs only the one patch.  Added Bernd's Reviewed-by.
   Rebased onto the new patch 1, which renames the lookup in fasync too,
   and one sentence of the changelog now says that ->poll and
   fuse_uring_cmd() are fixed in the next patches.
 - patch 3 (v1 2/2): the changelog said the command "returns -EAGAIN
   anyway" until FUSE_INIT has completed, which suggested the wait
   gained nothing; it now says that a REGISTER sent before the mount
   could still go through after the mount woke it up, by timing, and
   that the sleep holds the ring's uring_lock.  No code change.
 - new patches 4, ->poll, and 5, the selftest.

[1] https://github.com/libfuse/libfuse/pull/1633
[2] https://lore.kernel.org/r/20261117075632.59959.p12-0-arsenova@a7snv.com
[3] https://lore.kernel.org/r/7bb720d9-30ef-4d3f-8ab8-81c5fe2e0fe1@bsbernd.=
com

Yun Wang (5):
  fuse: don't wait for a sync-init mount when turning off fasync
  fuse: don't wait for a sync-init mount in non-blocking reads
  fuse: don't wait for a sync-init mount in fuse_uring_cmd()
  fuse: don't sleep in ->poll before a sync-init mount
  selftests/fuse: test a sync-init device before the mount

 fs/fuse/dev.c                                 |  95 +++-
 fs/fuse/dev_uring.c                           |  10 +-
 fs/fuse/fuse_dev_i.h                          |  39 +-
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   2 +
 .../filesystems/fuse/fuse_sync_init_test.c    | 532 ++++++++++++++++++
 6 files changed, 665 insertions(+), 14 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_sync_init=
_test.c


base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
--=20
2.56.1


