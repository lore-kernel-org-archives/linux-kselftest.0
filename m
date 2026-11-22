Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361199;
	b=bqyqrc2fHA0UJNJOn/Dko5ELiALB4Jgh//6exIIiGMciwAMwFdzxqPRm6yHmv4EZoc4E
	 V1JcWfvrTLuztO6FT/UxmmIuCFg42u3W8ZdNb7MYuaSZhXdJSXksO/xry+FFkMBgGnUBm
	 NFA29NTGrVMQkCLl1o4GPkBC5EzjpepuTznLRZcj9W/sFyO7Q2wpSYGPMz87pGz+UWiYm
	 GKEIscWWyNxPEvo9Jw+6KN62qGXWYrjfEPWhcVhxcB15T/ep0R+mi3MbsjpqvGFwYlO7a
	 cjGuSZGPal8PptgT5e8hp3yj/4O1IA2tVdoy7DuHdzUDvwLc34/xphPrJKHx/wTOEIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361199;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=AhNJa4RluqAwM/OuiFX7GgLlrJSQIox3sRpeUWbwb7Q=;
	b=bS+UGC5qhlMmJsUyHp2XglkWEH61NWgkvhNZ1H22Nj+DjA4MiOANWSkvw8YiAA+U76bq
	 KQ1mNOPaO+uF+hz+eOkQdOHLGWUHg7qhQKfesTiV3obCDYcmPsGL5uns30YGRr0lHoIKw
	 rRz3RnOAl1E7K5f9s6DHpqjCpSI1RRS30j5poHGd+oqjY0pO3Kl1NJewLIaYkG+ZN7AAP
	 r3YKubUvSbQCVrJdR4koq4qg8QB5n0J1ZeI5oVEMuJYaQQGWuaHRJyhIp/cozqtaz045W
	 hR1B7hovVqmYczM0fSTZ2wDrRUhvxa7Jtgie5h+R4rdqqsn/Pw3j2ch+sOQvMVj9g0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=HUA6GlXR;
	arc=none smtp.remote-ip=109.224.244.16
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67F5606A32A;
	Sun, 22 Nov 2026 15:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B67F5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=HUA6GlXR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795361194; x=1795620394;
	bh=AhNJa4RluqAwM/OuiFX7GgLlrJSQIox3sRpeUWbwb7Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HUA6GlXRu5tMQtRaVX0K9UKfjEUUaRH+RTbz7+VS7EG7vnkAys0yc0HswAVXMH4J9
	 0tPcv87ToNoigThTVa0PdSPAdB0v4ASZqSPzMfq64KBzywiu3sGMKaxHZRNHyJOBbR
	 SuL32uW/vxT8Mq3LbMQEJ2wSjWL00QOkyEh2K99D3/Q7aeVMFC9RvNQMncqA9I63kH
	 RZbrKV/iNRi4KQzGrdiOaPhtlMqgsLDVF7G8JmsIuFBkZgMMjN+Uz68QhSo2yDInFa
	 gV70DoVFJs8799OfyhwgRXq0x1lcdFM0rAm8iFjwOWd1yjugWO8GuOzFQVeZSrQ7Xy
	 4tGWmBBItq1bQ==
Date: Sun, 22 Nov 2026 15:26:28 +0000
To: Miklos Szeredi <miklos@szeredi.hu>
From: Yun Wang <7z0423arsenova@proton.me>
Cc: Bernd Schubert <bernd@bsbernd.com>, Joanne Koong <joannelkoong@gmail.com>, Shuah Khan <shuah@kernel.org>, fuse-devel@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] fuse: don't wait for a sync-init mount in non-blocking reads
Message-ID: <20261122152514.467423-3-7z0423arsenova@proton.me>
In-Reply-To: <20261122152514.467423-1-7z0423arsenova@proton.me>
References: <20261122152514.467423-1-7z0423arsenova@proton.me>
Feedback-ID: 227066774:user:proton
X-Pm-Message-ID: cf13ff2cbfec08cf1850c81af825a8fef619ae86
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
fuse_get_dev() waits until the mount has installed the channel when
FUSE_DEV_IOC_SYNC_INIT was used on the device.  fuse_dev_read() and
fuse_dev_splice_read() call it before fuse_dev_do_read() looks at
O_NONBLOCK, so read(2) or splice(2) on an O_NONBLOCK sync-init device
that is not mounted yet sleeps until the mount or a signal, instead of
returning -EAGAIN.  Commit 9f6f44aa5a58 ("fuse: don't block in
fuse_get_dev() for non-sync_init case") fixed the same hang for
devices without sync init, which LTP's read_all hit with O_NONBLOCK
reads of /dev/fuse.

Rename fuse_get_dev() to _fuse_get_dev() and add
fuse_get_dev_nowait(), which returns -EAGAIN instead of waiting for
the mount.  The new fuse_get_dev() uses the latter for O_NONBLOCK
files and is called from fuse_dev_read() and fuse_dev_splice_read().
The other callers still wait whether or not the file is O_NONBLOCK
and call _fuse_get_dev(); fuse_uring_cmd() and ->poll are fixed in
the next patches.

A non-blocking read before the mount now gets -EAGAIN, the same as
after the mount while no request is queued.  Blocking reads still wait
for the mount.

Fixes: dfb84c330794 ("fuse: allow synchronous FUSE_INIT")
Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
Signed-off-by: Yun Wang <arsenova@a7snv.com>
---
 fs/fuse/dev.c        | 10 +++++-----
 fs/fuse/dev_uring.c  |  2 +-
 fs/fuse/fuse_dev_i.h | 30 ++++++++++++++++++++++++++++--
 3 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 2f6991d0e959..7cb93885cd0a 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1687,7 +1687,7 @@ static int fuse_dev_open(struct inode *inode, struct =
file *file)
 =09return 0;
 }
=20
-struct fuse_dev *fuse_get_dev(struct file *file)
+struct fuse_dev *_fuse_get_dev(struct file *file)
 {
 =09struct fuse_dev *fud =3D fuse_file_to_fud(file);
 =09int err;
@@ -2106,7 +2106,7 @@ static __poll_t fuse_dev_poll(struct file *file, poll=
_table *wait)
 {
 =09__poll_t mask =3D EPOLLOUT | EPOLLWRNORM;
 =09struct fuse_iqueue *fiq;
-=09struct fuse_dev *fud =3D fuse_get_dev(file);
+=09struct fuse_dev *fud =3D _fuse_get_dev(file);
=20
 =09if (IS_ERR(fud))
 =09=09return EPOLLERR;
@@ -2293,7 +2293,7 @@ static int fuse_dev_fasync(int fd, struct file *file,=
 int on)
 =09=09if (!fud)
 =09=09=09return 0;
 =09} else {
-=09=09fud =3D fuse_get_dev(file);
+=09=09fud =3D _fuse_get_dev(file);
 =09=09if (IS_ERR(fud))
 =09=09=09return PTR_ERR(fud);
 =09}
@@ -2322,7 +2322,7 @@ static long fuse_dev_ioctl_clone(struct file *file, _=
_u32 __user *argp)
 =09if (fd_file(f)->f_op !=3D file->f_op)
 =09=09return -EINVAL;
=20
-=09fud =3D fuse_get_dev(fd_file(f));
+=09fud =3D _fuse_get_dev(fd_file(f));
 =09if (IS_ERR(fud))
 =09=09return PTR_ERR(fud);
=20
@@ -2339,7 +2339,7 @@ static long fuse_dev_ioctl_clone(struct file *file, _=
_u32 __user *argp)
=20
 static struct fuse_conn *fuse_get_conn_for_passthrough(struct file *file)
 {
-=09struct fuse_dev *fud =3D fuse_get_dev(file);
+=09struct fuse_dev *fud =3D _fuse_get_dev(file);
=20
 =09if (IS_ERR(fud))
 =09=09return ERR_CAST(fud);
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 460776cd69cd..92240ab76e45 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -1664,7 +1664,7 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned=
 int issue_flags)
 =09if (!(issue_flags & IO_URING_F_SQE128))
 =09=09return -EINVAL;
=20
-=09fud =3D fuse_get_dev(cmd->file);
+=09fud =3D _fuse_get_dev(cmd->file);
 =09if (IS_ERR(fud)) {
 =09=09pr_info_ratelimited("No fuse device found\n");
 =09=09return PTR_ERR(fud);
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 4b412a76225f..808152b75792 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -367,9 +367,35 @@ static inline struct fuse_dev *__fuse_get_dev(struct f=
ile *file)
 =09return fud;
 }
=20
-void fuse_iqueue_init(struct fuse_iqueue *fiq, const struct fuse_iqueue_op=
s *ops, void *priv);
+/* Get the device, waiting for the mount of a sync-init device */
+struct fuse_dev *_fuse_get_dev(struct file *file);
+
+/*
+ * Like _fuse_get_dev(), but don't wait for the mount of a sync-init devic=
e:
+ * return -EAGAIN instead.
+ */
+static inline struct fuse_dev *fuse_get_dev_nowait(struct file *file)
+{
+=09struct fuse_dev *fud =3D fuse_file_to_fud(file);
+
+=09if (unlikely(!fuse_dev_chan_get(fud)))
+=09=09return ERR_PTR(fud->sync_init ? -EAGAIN : -EPERM);
+
+=09return fud;
+}
+
+/*
+ * For read(2) and splice(2): an O_NONBLOCK device doesn't wait for the
+ * mount of a sync-init device.
+ */
+static inline struct fuse_dev *fuse_get_dev(struct file *file)
+{
+=09if (file->f_flags & O_NONBLOCK)
+=09=09return fuse_get_dev_nowait(file);
+=09return _fuse_get_dev(file);
+}
=20
-struct fuse_dev *fuse_get_dev(struct file *file);
+void fuse_iqueue_init(struct fuse_iqueue *fiq, const struct fuse_iqueue_op=
s *ops, void *priv);
=20
 unsigned int fuse_req_hash(u64 unique);
 struct fuse_req *fuse_request_find(struct fuse_pqueue *fpq, u64 unique);
--=20
2.56.1


