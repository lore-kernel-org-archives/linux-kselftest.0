Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904032;
	b=1BFSxcl0Bdot0fLl4lgP7UoiqR5PeFJp3Z/cxYz88p6jlGQAJal8QywY/yWNUa6R7niF
	 P1l5tr+KfvAFk7RUe1um46SuXwWfp7ipdbMvP5dLxHuLw9elkZ0xvTD5G6ozaaVYugBXi
	 5fyTSVRwQo8FQcI1FreCuEXMXihLpcABAIopw4VU/2cO12MHZK8LyU+ug7cjZLt4v9hxb
	 FlC45p9VznBbbLFE6LWuPDLt0D3ueUTgqlHWLQBKgv5IKiK2PaXrE/9ZlmVykdzyagNZY
	 h2Oy9hNGYpvFfDoA2W2C1DCW9ICLTHyLH2faFSNgtFXp071lauteFgZF6kkaMtfGmFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=o7Ds5Sp5DChQJ6GHa3pEkVZuOErJkij7LbLCUPT9+Pc=;
	b=AD/tXrHuba3C/JCILHtVK9YvFxrDITVkkHEjbGn7wbHC/BxnwxJypVCdyxHfDviCTu2V
	 O6HStjFs1U/GwE82yMXTXvALbLncLyDfzKDOeNqbLUVgO/nDjAt+XJ0VqoyCzqfAyTwz/
	 D+s2PLrQ+3J+ZPQ8CBarEVuwgGUYdEcNvXKwDmVA84S9pFrjGV2ROL+8hYBpzWRmzSF46
	 XvWxVouFvRhtQPdI4EdH8R7301nhbAulkZfBcESLNK+sezL9DGL9NpK2ewOOlDt+vq1jn
	 FOxxMqptM9j4gq2VWhpd0Ijwq8LN8Ea/8DXOgzDmuCdUDAd/ZAP4oqXtjAD7a0xBoKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m3Y+iV2p;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A3B606A339
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 08:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12A3B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m3Y+iV2p
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a210470b49so35729655e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 00:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904030; x=1795508830; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o7Ds5Sp5DChQJ6GHa3pEkVZuOErJkij7LbLCUPT9+Pc=;
        b=m3Y+iV2pelmutPYORVxza4CHQMpjq7iS5lmecWgDjvax6Coso4uWa+KMaCm+CB3bWY
         yM9xDjlaUDqClL2wfFs+3EgMKFX4Q8fuLgup7VSVEO3iDYFOyh4nyeN0Shri07+KD82b
         UFGbuWvBELdRnXkiKa1GIWjPRb4Wz8WRQUErt4eMboeCaxWHABbQwTZk6BuPw2NopAXW
         5935wwOL0Ggt8LD7VeJmtmL6iC6DgtiD4S4DRbEtkaj1swNFS1XEbe90cWaNyokAE8Lz
         Ulc1c4G0eNVUIpLzTdbViN3HgCOMoyHpu6hnCIZ+utcpbQY02w1kBKtCyN8iaUfGq6tI
         6sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904030; x=1795508830;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7Ds5Sp5DChQJ6GHa3pEkVZuOErJkij7LbLCUPT9+Pc=;
        b=lHh7aqRVeD7k2qoOFyMo+YDsMBgnJMhOEu3/GaF0LUxfjCfN4mCUS5sS3naPBz7gGH
         r2KwJwXmNX2Ix+kI9EZ6bnJKneGIUyoNanqRBFHyuRmYh05yn1jAYH6+Z22/3F2Wsi9J
         zDPV6RmeA5gEMCm+iWkgwjJ18CN/S4f1OFOATRp2rUUSMim5upTzajzE9XwM9w1m4n6V
         KLtAMRytnkgNeugCUNmgi+9mhnvcb0LxXcPLNiD64MaeY6EsRSe3fTjDpXKZAaALRgc+
         is+9JcRx/j2DSPf/NyIEs4PKPhPPesc840+Y2yd9IFDLvpWU3+zPwBbpwBaNS8h5aJXS
         dT3Q==
X-Forwarded-Encrypted: i=1; AL+hErGzeyoCgBEFrQcjgWBXGWwXo3gJNnIb72BCeBrPNjgsYL7cRz4Tcp3WN1KhOwN/GcYlB2gb+fIOLcuoCxSKHh4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AxXPqZEPlYFPDHQJIxSgfafz6n0B4wpUh4U1lf+aS359V2ogm
	u6caX+zGElKBtiVbKSJP4DfAMkAqwRCpbSbWmZOYSk4mk9djQpCQIQfg8PTrr+3FJMxb
X-Gm-Gg: AYBFou1z0l7DGrUKqTLbu0Z6+OBZ5kVN6UOM8P2KBfi6wSbcgFb3bvmUTl7cKhVVhn0
	K5pxe17slgVTuVwfKRySJUrQRsyHFAJbbPEjCLVHg+oJpe/rKB4mXsJcsGfb5lZtsQ+ZCglcs5j
	rlO5hh1w4ZGjyq/beSaoYQp+rI8IwQ0GvheQ7iZpQ2nvVZBqG/UX8w/McH4ukClQ4RL0v9s/zXY
	QSWlBTe9lkSbeG7K9GEJPNPTgDlr2x/noDk2se8p2geB4yTEkI8RfBHpGVlRSv+ml/D1qdpa2KH
	D357VPIWIV4/NbIe0aHelQXWYhq06EnG4zh1xYu7muPW0GR/8EhoyOE2rczRS3t+cpZJIY1Ioz9
	bAOh43Lwm0Q1KTH8ijcwWXJJc4jCOFbufA3J0j9CEQFNe9YV+JZ+ipwXW2KB70Ak6p3mYcUsJ4f
	SezFDBlJ1huoDUiOsg2860y5amqBZhxqgST/GMyENs+rDIyajL3Yye3ePaE3dj24rnhzpcV0lxB
	uKB/sMxMBCzIGFSG0hCUywxkGZrZVNqVw09FjvSpzW7/IIjMpNzTIgDch/lS4alDbqN9JPW5bCp
	OWMGeGLAfIbb9wxoQEbUrl4TF0xBlbApi2LhHVNPrEZbhOBYKzYkels/ek9IUt+nxBk5bx6TPgO
	t8avwvcZwHb5uL9E467+FafmB0N3f8QrLIE34SJDBVv2Zl67saCmMo11L
X-Received: by 2002:a05:600c:3494:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb6c71c232mr134135095e9.6.1794904030378;
        Tue, 17 Nov 2026 00:27:10 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7838c912sm45730155e9.4.2026.11.17.00.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:27:10 -0800 (PST)
Message-ID: <0ec7b8c90cc456b24e5b19c1db673d497ae43735.camel@amutable.com>
Subject: Re: [PATCH RFC v3 12/44] rust_binderfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:27:08 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
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

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> Initialize binderfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC
> by hand. This adds SB_I_PSEUDO. binderfs_fill_super() keeps clearing
> SB_I_NODEV for the binder device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/android/binder/rust_binderfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/android/binder/rust_binderfs.c
> b/drivers/android/binder/rust_binderfs.c
> index 5f020226720db..04468c5b5c116 100644
> --- a/drivers/android/binder/rust_binderfs.c
> +++ b/drivers/android/binder/rust_binderfs.c
> @@ -3,6 +3,7 @@
> =C2=A0#include <linux/compiler_types.h>
> =C2=A0#include <linux/errno.h>
> =C2=A0#include <linux/fs.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fsnotify.h>
> =C2=A0#include <linux/gfp.h>
> =C2=A0#include <linux/idr.h>
> @@ -667,7 +668,6 @@ static int binderfs_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0	 * necessary and safe.
> =C2=A0	 */
> =C2=A0	sb->s_iflags &=3D ~SB_I_NODEV;
> -	sb->s_iflags |=3D SB_I_NOEXEC;
> =C2=A0	sb->s_magic =3D RUST_BINDERFS_SUPER_MAGIC;
> =C2=A0	sb->s_op =3D &binderfs_super_ops;
> =C2=A0	sb->s_time_gran =3D 1;
> @@ -759,6 +759,7 @@ static int binderfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	ctx->stats_mode =3D binderfs_stats_mode_unset;
> =C2=A0
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &binderfs_fs_context_ops;
> =C2=A0
> =C2=A0	return 0;
