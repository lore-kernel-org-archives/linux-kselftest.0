Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794698411;
	b=Zx49vvXuJfQJEp7+pZzm6HCHQRY6A3ngPIx6MXjbUI4Fonrzulv9QDuD0lX/k1yqopeU
	 5KGb6WWohUk7HLC9LHG5TH1bQFw2+jtbcduIM8AKSEFaz8Trl3FhTd7CIPI6LEeWdmk0S
	 RLy+vP7lW+k7cPDgOhtJe5AMotcKmyddUylplg6Y7b/fyfaChV8SAlxTDVMjLbHlhN2vU
	 THBjbk689I49KssTxAUBGFS8mxhXbtJo3E3tGIgqL7YD6+BpwD0GgpasMzkzewB6yVupv
	 CeSNCCuklBVZJM/tMHPwgAA4zqlIJDGoggP5CqsyM5m++JSLF4zaJmffCrH4ktElGdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794698411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
	b=JU3ne6lem6fUVH7lF8IcGK6SvJ4a6evsiP7N8F1xVQGaXtPBZ7bOv/dy8J89nMdbT31z
	 r5lhjT0pMrpJ2L4ZK2UtePXD1kSKf1KdIxRXTHs8lYNT1bxdqwaMMmIGBCyPQXhMEwSLi
	 66Y65cvyaCNmBqYybtYhn5wfTP23IyEMMGPnVbJP4JJ8wSY997jt8xm4kI6l5eZxNy6/3
	 xg8L4JCxYV6mBnq6zYL5ReaADnJMK0GJlX6kXX8Xa+OjXqQyTAxj4D8G0w9Pe1nO0mrEb
	 sleIJgHNFcowuFN46QwhK+t1Yi7g/ep6Cc+8SSXr7ZAu9r0h4jUNVz3peNttrQWgnNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZ4A5V+6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7815606A331
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 23:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7815606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZ4A5V+6
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b70192ebceso4502088a12.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 15:20:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794698409; cv=none;
        d=google.com; s=arc-20260327;
        b=VT4fHtH4VH9LcM3lp0NV7VERMd9VNq+n3IrCLVDD6Uq1HGsQ3AxtUuU9UP5hk83Xme
         An7AvBZ6PL5DZD6ZTPr50S6F33WBT61FmjRw2OAocZTK6PfU0aA6uTA8R5k0SJ4E251e
         NwIbCIKA6SdTi6v6yAtyInYxSaUYR3UrZ0MehJBVVLE6H/4VbtGMsGYhkaZEKaeOSNjo
         DiYwKeBWoW+RCcTsSvZLcs0M0SaDDilDvz/yt57wZjc4U0drjzjKARYzjT5EIaNUFzqU
         g8QM18FJISzYtXjOvwf/Kux3M/mlqHAP8gH/HyClXtnodCp0VgkLZzNVy5K7fUwa1lO4
         TpaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        fh=mSgYNKGeYUgXB4HLJ7yndzU1Iu9BrPtCcfqKw2KXFek=;
        b=PhTP/BvT6dC6t4KSiwWDqkTnpTcQ/SJyEqtjZkOXMjG1/nt/ejDH3lcKv4XOsyOG+S
         SvewB0Wp69L202sDfV1Lu9eHneJqTcbKf7uPZtuZX3CwxdwBeoK85Q+ZLC2z/ey75q+j
         wyKvQiAGEWeiiipWIPAatTPZ8yWkYsbSyTJvMoVZR3NWBSqgnBv5ZOPYTXVBF1MScBsy
         a3RrcGDEQtLrwmWHl8M6Xoq4vvsqC1svtG73veLS9+ipX7f53vY2eIP+yeGzLDK36Scl
         YQO7vmEAmckBItG/g18gWwXY6hokVXBd+mHC6CsOhrLgPyMCm5tDTIw9L6nAgpdCTz6C
         d5Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794698409; x=1795303209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        b=bZ4A5V+6Vs4HKIPLNbCXlaoHg6GUiZAgPE1CoHup/u8F9XnmCFMSb6naMqQFAl++mw
         +LZR0jt78s/FhrwMU+95xN0Ho10rZ/g9p6M/dfGpr9SfvlaOXM2WfiTCtO0CejnyefhK
         5gg17lDjyCI6S+pTTK/DIWzHtcTY1JHkLI4t/I/Teu6/Lgz9A0oKfkx231Ay53Fdu4Kp
         zCo0ecwmPzO3ZOIddRCFMjOjLH94BU3oXsC8cOhJgJSeLFwZkZlFyxo1cq6JVw7hHb6A
         21NW8PziNlBat7d4DfM9UgO0YIScpglsDnmQoGQNIOQhlOx3hw76q6t8+8jTPfBn24eS
         FVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794698409; x=1795303209;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        b=FD4WCdsF3ohX4fzsPMD1QzLtbnsS9RnCUK8WdPMKyyHq3kLUuIg4/0OXDL5K4FZEUr
         P225NHqndl/Rormj/naOD4HJMq5as0SvV7l0Y2cNWCqNpQt6QI7pPUeGZFbPxvtZEuQk
         Ha+tle3hKdQne9tE0hsF9HL6fmbjqYW4AoS8EfyFxQtlZk5uV0U/PJ9/u+MwwAHoyBg3
         Oax7tTrfniTxcZ8sA/ZUmAtg9ROC6Ohm99SZNmyHCaTU+H2Rkb++v1VsQ5bQLC4RijKI
         mp8SYKEPk5q12prguERQ4bheq5yJ14SeoSqoo7vKyn0o+i22Dw+bCweonYAMn+5hLdET
         CXBg==
X-Forwarded-Encrypted: i=1; AL+hErEYEpxsA6mXNGbNR81HbGTPrPBSSax4XwngUa8sXRa5DY6MDe4NX/5L1lRilDsE93xTyg/qJSm31wB0tTAfVPs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yv5kHqcPgz2kRffxrs6seGjZyMywoorBZUylmWelEM/67w5g4
	0BPxXz0u59GixRUuGlpYj2mIr/i6QGiWcKXUhV0HoOuaCZiWvbPmMYL7QYmcjAM90gm0XUWyNjk
	VDnZJFA5S5F2Deoe7AIfgRxm/gQljcd8=
X-Gm-Gg: AYBFou1JSggdIaHk9H5pEmxF+iSWbz7tJZ23OzD3c56yfQEl1UOA4fL0hqph2VoV8JK
	k8JQBKlLpZ5pCvklw73viAJUo+efKpQsl1OrbmnA+a3KyXpw5PbgWCMkHWKf1JK4zPs/Mkf5+nG
	ImFDwwCt1KMtoAEL6erlrA4JQRPvcOiwr4ydTvbhuDb0lLpplJfjeNdBHdcfem2kCKt5aKjF/15
	UfJlFL2te1dO+TbUyG5Yrx1H4omSOd75nczZu4aI5Vstx5hesCb76Fsr3VXlR376w+3ahYHmf69
	bPQAt+udgYWXbJvWdV+S8vqQKBYM5diMNf5+oKwTNYlGCxXTMels43VOukOnia/+Ic98k48s/cC
	vx+wj1QjS0wYOQmKUukabJIccjftxbV5+0Dbwpfr3pEpd56OmThOap2egw9HVXTjpBimV8w==
X-Received: by 2002:a05:6402:e10:b0:6b7:f00e:5e56 with SMTP id
 4fb4d7f45d1cf-6b7f00e5f37mr1542816a12.1.1794698409123; Sat, 14 Nov 2026
 15:20:09 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
 <20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org> <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
In-Reply-To: <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 15 Nov 2026 00:19:57 +0100
X-Gm-Features: AclHuK_YVxhIpv6JLzeNAX5mX5IHGfu05WS6uQ-TCKewxE3JKeci2PyA-UDMCbo
Message-ID: <CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo91QjJHH9T_Yw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 33/42] fs: add file_check_backing()
To: Chris Down <chris@chrisdown.name>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 9:06=E2=80=AFPM Chris Down <chris@chrisdown.name> w=
rote:
>
> Hi Christian,
>
> Christian Brauner writes:
> >+      /* Look through stacking filesystems at the inode with the data. =
*/
> >+      if (d_real_inode(file->f_path.dentry)->i_sb->s_iflags & SB_I_PSEU=
DO)
> >+              return -EINVAL;
>
> This looks good in general, but what the bots said about O_PATH files
> here is real. With FMODE_PATH this is reached for a file that was never
> opened, so on overlayfs nothing has been through ovl_open() to look up
> the lowerdata of a metacopy file yet. ovl_d_real() then does the lookup
> itself, and when that fails it hits the WARN(1) at its end and returns
> the overlayfs dentry, so the check passes as well.
>
> Only fuse passes FMODE_PATH, so it takes CAP_SYS_ADMIN to get there, but
> it's easy to trigger with that. From a quick test with a metacopy file
> whose redirect into a data-only layer points at nothing, registering an
> O_PATH fd of it with FUSE_DEV_IOC_BACKING_OPEN gives
>
>      ovl_d_real(/f, 0): real dentry not found
>      WARNING: fs/overlayfs/super.c:79 at ovl_d_real+0xc9/0x210
>      [...]
>       file_check_backing+0x308/0x5e0
>       fuse_backing_new+0x219/0x4a0
>       fuse_backing_open+0xe8/0x390
>       fuse_dev_ioctl+0x53a/0x7d0
>
> and the ioctl still succeeds. A normal open of that file fails with
> ENOENT, so nothing could have used it as a backing file anyway, but with
> panic_on_warn this is now a panic.
>
> Maybe ovl_d_real() should just stop warning when the lookup fails, now
> that it has a caller that isn't trace_uprobe?

Yeh I guess that this needs to be a Fixes for lazy data lookup.

The correct fix would be to teach all the callers to deal with an error.

> The check would still pass
> for an O_PATH file whose lowerdata couldn't be looked up at that point,
> though.

One observation relevant to this patch set is that a datadir layer has no
business being a pseudo fs and that can and should be blocked explicitly
at overlayfs mount time.

The other observation is that fuse_passthrough_open() should probably
check the backing_file that was opened for io in addition to checking
in fuse_backing_open(), which could have different FMODE and specifically
could be FMODE_PATH.

Thanks,
Amir.
