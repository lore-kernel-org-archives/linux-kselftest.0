Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905083;
	b=zvqz1i7vYeNDRsr+1ts5Yo5O25ix9ffTLQinP+F/WtpoQv+DMH/myiw13fm7f+R1DAYb
	 WFrH0jr8z7ch3ZVwNeq2g/+KSTVBrtsAYff1K/EcRV6ZrzllqTxMkhXGe1dfm1EmIJrat
	 oLmkLZ4ib1DqwmgfpZ5oqtVd/MOCVTNFzOZ5elmdsCVR5/iDtHc0MydwY7jwAQVaDJ/Lm
	 IJbmWoLfHaGL+pCN/hvNIBFBjjxzileWqjfx+YCYOseJGGxE6pDWtlpy8jCEDcPePA/LY
	 cvktagjGPRN7DEQtDUc6qVPDowmvGxYYr1viLfaP7BIHn/yUlalep9eaV+bs1tIp+iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=YtgOPMlBsDbDRTTami0iaeC2PfdAlPMUJ3BhZBWqnDY=;
	b=kRGlLdjiIWZUs5Jtq5Wwk+nmy8yPp6PTvsj3ocPxJVZDmrZuCEzTljuCDhHTJen0SoC7
	 haDKsK1OJ7s6NTq7F3DPJ29+SM/6vn68zRrOsddR2GlbI7Zvbw4AcZL7Jg/6CNKAnRB7u
	 QuvQBP6ypNbKzJLk0FcxH2yPykZgDSuW+1SYjyrVT/YQPDkYsitET4n7svHCErtSdEXpR
	 BaHeiLS3yGVdTnBHdKvU9/VGgjVEWvJxECzWiv68194CGn0Kx6Bie8WGn9MzuH9dA1nQQ
	 sqojypEj+sj6HC27ILgsgC096KYQcaeydW1/P6Zw6B2TT5SGdD1xk7O5Z0pAIMc5mkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qPWJSshs;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C61606A88C
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 08:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6C61606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qPWJSshs
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4618887f8f.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 00:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794905081; x=1795509881; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YtgOPMlBsDbDRTTami0iaeC2PfdAlPMUJ3BhZBWqnDY=;
        b=qPWJSshsn8vVlxONBkwnt0Rrdn9d5F3Qc4ul63isG/q9SzfN/YeX6Opt0gSo3Jew6G
         TPoHc3exB3o1TVJHb31ucJURrMLm+X5ZLvKQdkLiUwsGhwj3/4jXaF9QxR3XbUAvZwOE
         a/cd4y1UcgXoBr9kVgdvuhJuBveUAauSYuunqpBOO8ny5BuS4lSdHT4xtCJFDNjS8url
         r/ZKVJBRzaToW1BBIq0cKvkP0/i/p+OipahpXpiSl0PGBR9WYmSpn39e8LKnYXYjrWjD
         bzQp5gYJPTRPzgdIgnmtc42HrrCv5BgaqLA/tsUHs3tWdIoSQrhFLq1gvYrghbRPmmpF
         EcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905081; x=1795509881;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtgOPMlBsDbDRTTami0iaeC2PfdAlPMUJ3BhZBWqnDY=;
        b=TNoC30ituO0QkdEkQk9XtboyAEsyn0VFurU0/qb62mBuRjyNyixv2FBXKBcXrtczEx
         b+e3EqskAeBSBbpkwg5wewHANk4Kwzyn2KVV13UdH9y3k4AvUdB/81KnB/C/Wt6IaB15
         +5ZY3KE8Qn1bYaqeZrMzd+BSJGuBLho62T1BwdUGvdZ2qfJ3BnYCAbNLLb8wDoFdTm74
         OSXzAUDEnTOiE2kdSzY5LFxsJvJM6kVcY7wN/SrDtrKU3zfoxUv6ZGJESCU1i/SwppoG
         G3l13WqOvlXooaWweF+DzRJnhxN1sfzNLDekUaxVuTM+alX7wN2wtgPj/jhzR3k9Usn0
         gQmQ==
X-Forwarded-Encrypted: i=1; AL+hErG8Cm5JzeZWfIdk5NARGCDp2x9D0bUpzIvwrlGGvjzLY5rxoHq/8j46vPbS4aDdMva32hpXWT3LKza7/imFu3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W+yqOjfdgdLX+FtwqBwjvjnTWnuV44atWJTCm+/OcjY/EQBnF
	uggf3fn0QPNtht+VPErraO4ZaJGLvK5UNuoxA6oaQlffPMKvYm8Jhy7xx1R2uyEV+96U
X-Gm-Gg: AZFdTZfXOiU4Z/SmUknN52e/GSYow0EWSYXYLj3vqvBC5mKmHwOZ/VMKdK9jpMDBe0G
	XS4gfpSzaivrL/QfShXTQ7sN24agUTww7qwW2a7pNaj14n7FuhtCfVvEMrTZ1lONuK4mcVmXkKq
	1tqoi+1ViwTth215WcBpdb0An6FqFZjRbU99gPVl2CEgNUi30O9FprOrxhgrDMq6fdBNs3X+4Ty
	lx37Z4B8a4rPbXnphfs6cRWgTiKWbSYQOHgzbxr/49ylWY01cZGaHUnO70hpVncmNIIV8QYwzFV
	Ms9vgNS23Dmgwxph7NwbmLUC+CzlIWsHOeRYstqQRgDPnXZ+vFZFo7tYJvvIGqtGmxA0flv4vUD
	Rzw6ul37AaP5xuN3/7NY32iW+PWRgaVYjz4N7lbewr+pvapSHccwFHtMzjfxFdgaBkSBXCRf2il
	6i8ljYoMeViv/CUKfk/YJeqp1aBYQzEZouWg7Lrm+MoF3LdJHgfwUjvbxxUVueO26qQOH7tsP1I
	B/Aq+ZWfflwhDRAaO7LHGiA/BFYZU5gqJIb9d9oDbsdy5fHYtMzSwCCB9pT4RusOqCJMRSuGfu0
	VSMYHXz+YkkDGnSff7y2Wnygj4oT57UP3+ZMkMYBo9HJHv1rCml+lMljesw+B+d0ontLk9dNGSM
	UCDm+y9VizlsVphsJ+qLa9x/1+eK39/HQdPEgMPW9JET2rs5tlr/AYbK76PBoBk8A9l9I3qK88G
	5sWw==
X-Received: by 2002:a05:6000:2411:b0:48f:f26d:c5c with SMTP id ffacd0b85a97d-49c70b051d1mr27471178f8f.9.1794905081269;
        Tue, 17 Nov 2026 00:44:41 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d673ce75fsm19982260f8f.55.2026.11.17.00.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:44:40 -0800 (PST)
Message-ID: <d18a972cfc6a7d6da39ab9674903d7ae6e4c1826.camel@amutable.com>
Subject: Re: [PATCH RFC v3 35/44] fs: add file_check_backing()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
Date: Tue, 17 Nov 2026 09:44:39 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-35-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-35-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-16 at 12:05 +0100, Christian Brauner wrote:
> Loop, zloop, the nvme target, the scsi target, fuse passthrough, the
> usb
> mass storage gadget, erofs and acct all take a file from userspace
> and
> use it as storage. Currently, each of them has its own idea of what
> to
> check before using a file like that:
>=20
> - loop and the gadget check for a regular file or a block device, the
> =C2=A0 nvme target, the scsi target and zloop take any file type
> - loop checks the open mode, the gadget checks FMODE_CAN_READ, the
> nvme
> =C2=A0 target, the scsi target and zloop only check for ->read_iter() and
> =C2=A0 ->write_iter()
> - apart from acct which refuses procfs and sysfs files none of them
> =C2=A0 cares whether the file is a kernel interface
>=20
> Add a helper that does all of it in one place. It only accepts
> regular
> files and, if the caller passes S_IFBLK, block devices. It refuses
> files
> on pseudo filesystems. And it checks that the file is open for what
> the
> caller is going to do with it and implements ->read_iter() for
> reading
> and ->write_iter() for writing.
>=20
> O_PATH files are refused unless the caller passes FMODE_PATH. That is
> for callers that only need the path of the file. fuse passthrough is
> one of them and has accepted O_PATH file descriptors since commit
> efad7153bf93 ("fuse: allow O_PATH fd for FUSE_DEV_IOC_BACKING_OPEN").
>=20
> Block devices are fine even though bdevfs is a pseudo filesystem. A
> block device that userspace hands in is a device node on devtmpfs or
> some other filesystem. Files on bdevfs only come from
> bdev_file_open_by_*() and never end up here.
>=20
> The pseudo filesystem check looks at the inode that actually provides
> the data via d_real_data_inode(). overlayfs accepts sysfs, cgroup2,
> debugfs, tracefs, configfs and securityfs as lower layers and reads
> of
> such an overlayfs file are served by the file on the pseudo
> filesystem.
> Checking the overlayfs inode would miss that.
>=20
> For an O_PATH file nothing might have looked up the data yet.
> overlayfs
> only looks up the data of a metacopy file in a data-only layer when
> the
> file is opened. d_real_data_inode() does the lookup then and if that
> fails we return the error.
>=20
> Note that the file type is taken from the inode of the file and not
> from
> the host of ->f_mapping like loop and the gadget do it. A driver can
> point ->f_mapping somewhere else in ->open(). It makes no difference
> for
> block devices as both inodes are block devices.
>=20
> No functional changes. Nothing calls the helper yet.
>=20

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/read_write.c=C2=A0=C2=A0=C2=A0 | 53
> +++++++++++++++++++++++++++++++++++++++++++++++++++++
> =C2=A0include/linux/fs.h |=C2=A0 2 ++
> =C2=A02 files changed, 55 insertions(+)
>=20
> diff --git a/fs/read_write.c b/fs/read_write.c
> index 6767283108991..9f1e7bfcbd4f1 100644
> --- a/fs/read_write.c
> +++ b/fs/read_write.c
> @@ -866,6 +866,59 @@ static ssize_t do_loop_readv_writev(struct file
> *filp, struct iov_iter *iter,
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +/**
> + * file_check_backing - check that the kernel can use a file as
> storage
> + * @file: file that userspace handed in
> + * @mode: FMODE_READ and/or FMODE_WRITE the kernel will do I/O with,
> or
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FMODE_PATH if only the path=
 of @file is used
> + * @type: S_IFBLK if a block device is fine as well, 0 otherwise
> + *
> + * Call this where a file from userspace is taken as a backing file.
> Only
> + * regular files and, if @type is S_IFBLK, block devices are
> storage. Files
> + * on pseudo filesystems are kernel interfaces and are refused. The
> file
> + * must be open for @mode and implement ->read_iter() for reading
> and
> + * ->write_iter() for writing. O_PATH files are only fine with
> FMODE_PATH.
> + *
> + * Return: 0 on success, -EBADF if @file isn't open for @mode, -
> EINVAL if it
> + * can't be used as storage, or the error from looking up the data
> of @file
> + * on a stacking filesystem.
> + */
> +int file_check_backing(const struct file *file, fmode_t mode,
> umode_t type)
> +{
> +	fmode_t io =3D mode & (FMODE_READ | FMODE_WRITE);
> +	/* Drivers may point ->f_mapping at something else. */
> +	umode_t fmt =3D file_inode(file)->i_mode & S_IFMT;
> +	struct inode *real_inode;
> +
> +	/* O_PATH files are only fine for callers that just use the
> path. */
> +	if ((file->f_mode & FMODE_PATH) && !(mode & FMODE_PATH))
> +		return -EBADF;
> +
> +	if ((file->f_mode & io) !=3D io)
> +		return -EBADF;
> +
> +	if (fmt !=3D S_IFREG && !(type =3D=3D S_IFBLK && fmt =3D=3D S_IFBLK))
> +		return -EINVAL;
> +
> +	/* Look through stacking filesystems at the inode with the
> data. */
> +	real_inode =3D d_real_data_inode(file->f_path.dentry);
> +	if (IS_ERR(real_inode))
> +		return PTR_ERR(real_inode);
> +	if (real_inode->i_sb->s_iflags & SB_I_PSEUDO)
> +		return -EINVAL;
> +
> +	if ((mode & FMODE_READ) &&
> +	=C2=A0=C2=A0=C2=A0 (!(file->f_mode & FMODE_CAN_READ) || !file->f_op-
> >read_iter))
> +		return -EINVAL;
> +
> +	if ((mode & FMODE_WRITE) &&
> +	=C2=A0=C2=A0=C2=A0 (!(file->f_mode & FMODE_CAN_WRITE) || !file->f_op-
> >write_iter))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(file_check_backing);
> +
> =C2=A0ssize_t vfs_iocb_iter_read(struct file *file, struct kiocb *iocb,
> =C2=A0			=C2=A0=C2=A0 struct iov_iter *iter)
> =C2=A0{
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 99caef43ff3c4..b1c7ebafbadbe 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2553,6 +2553,8 @@ static inline const struct inode
> *file_user_inode(const struct file *f)
> =C2=A0	return file_inode(f);
> =C2=A0}
> =C2=A0
> +int file_check_backing(const struct file *file, fmode_t mode,
> umode_t type);
> +
> =C2=A0static inline struct file *file_clone_open(struct file *file)
> =C2=A0{
> =C2=A0	return dentry_open(&file->f_path, file->f_flags, file-
> >f_cred);
