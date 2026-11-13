Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564378;
	b=o29hkonJwdGRCyp2diP9p2bFNUzqq2l+cb8uNd1pVpOdQB/Xb64KFZuz0pPsAy+b1p4S
	 xGVD/Ij38MBhU7nj6p+XjU1jHGkcgVyiTvK8N0Tqlji2gIZPWor2VsHREGgbMppunPqqY
	 CooaTXR6vJJuhbhFBiqaoWW0tX08ciQhFDYWNTlD3fQJjdt0r+EOZjl3KEPqVB0rmIw9I
	 xEwW509iJWLpfMXsYmJbbLu/qDWOCM5n0rtYZJoW1WMXunldzyptkf6I5pB2KJalhWPfa
	 Ncb2VFJ8UupjjW89q2jCSRCoF+9P/xXKtTAKgM5OlVW5qcsVHWeApbKwcjBMLF/tAJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=oBVCWZMOabVq55k67Q8GIm9NBAOJHOxllLRlvncSbis=;
	b=xmf/WUjjohNCci3MIkO6jmAK/OW5S4X1vYIUaB/r0xyDO+J7dgdGHvssiQtRCUGThGNg
	 JNX+vX5IDGOCyIxh4szGDzsKyVmqCSSXQyeMpC2XNBJ4b6Y8CJIFa82TB50nxkUyKrxU2
	 UFvPT9nlzMorEZG4/W8n6VZQWAymhaOY5qLJI6kdfORVcOHfNhcFwv0W4IaJTltcZGBjF
	 S+QEXmtewE8DFM8fqqhWNzZweMTpehPBY54aNm6YXEaeMFljGb+bBYlalvdUJw26SND4W
	 929s1gl/D/LtkCq9aR5E0Op6DSFK4cFo4lt9IfHQVlwbg69XrT0fGho38ndZI+YiU6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WDdVkHgl;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1249606A886
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 10:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1249606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WDdVkHgl
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so1596908a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 02:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564376; x=1795169176; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oBVCWZMOabVq55k67Q8GIm9NBAOJHOxllLRlvncSbis=;
        b=WDdVkHgloKbBDmiudlEZ3ZWe+zg0BVZ0Jxwgdy+X6nc8ZJ9FIVi7F/SYJVqBRxNf3G
         3Gnq29xgDZdSKYiYaDVmU8W0xCuGm4Eu82rb/A8U6D5iLEOgHTmlDog4vSfdCU82B9rm
         qMGycG7Kl4j8h61zt+kqUkohzwqy0DPARMdjq2hKw51hdb6jylA1cwqwSD8nreSBsEB9
         DkDXk5ueYK99P4pH+jY8EwMoZnNW6BehoecLG+1JSq6wWJXsZMYgAdKGybKKFJkxuO0p
         O8Ri4u2My3QdIqEe8fwKAquZP0382+IuLTCd4KpBNa7znuGAHwPb5rxafjOggGTtG7Td
         r9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564376; x=1795169176;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBVCWZMOabVq55k67Q8GIm9NBAOJHOxllLRlvncSbis=;
        b=ORsztpxMGF/is717I55cTglRDH+bQdYuhOOk9S6fd3rYxG3dLZRuUf3S5WDIuabv9m
         58O/YUHz2K5dyC4DXnvCzxs/FKKoLOFXDKSjkqJjBMVyOUCtzmWm7CdV/Bfp7/1KliC7
         gqcHDkS9rtuDTOrrD2XG/aG+9iWyPpHu+sgBQIjsiXX8mZEg1UD67WVJNLZM7QwygG4s
         NTygssKbbcGTvdx2o2d+cDVBkVAARTebxwN1MOhLnsG2nKwMnUStBPimkyBv8NdnX+Au
         ov29hAX/u90cziZ05o94Ld/gPLrHqfo5OMZu5/U7lbf3bs59CNG3dJDYN7GfA8ysaRvH
         AKdQ==
X-Forwarded-Encrypted: i=1; AL+hErEnyxOJt/rM4P1B3gooy3na1MtSVGxDeq7He6k2dttG9ZAlA8QlNuJKYYcPCKV1IqhfekgjTDcC7VXQWHWUUAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bYV3YFrcNhMLSYz/iTOfKM0aKM7yarVwKCXzJEjF5XLYz7IYp
	9e9H9ge69Pl74B7FVR3OABEEfVtmU1iTrH8y6azDJlZWEOZkUk4dE1Ej390k8uuS75UJ
X-Gm-Gg: AYBFou2U8Wt5ap0xyYk2SxX4ecd7KmOjnu6rAhxEnNyLpU6sD8bfOV2sJX9YuLF3Trg
	9sNkO26ZGQhjXdgRA9TvxHVxpLmuw5fO4lyHeNhuq5uVW3itydnwaoaplYRUxS2ty05XBSZ0Roj
	Kvfw7XHRUyJCeQMBIpkDUexjrYru4ABISNcq6vQzDa0AaWv22WU8+HTUUI5Hc+k3VXPZ5dRr49y
	ojJOKnkQ2has4Ans32JRxk9Vgvic+/qRNSKnn9GJ5fQD2Ozgsu17WPvgf3BAuKQJrbbIV834uB1
	u4BwclqC4HbQINWSPITpVdcl5s4j28V7Z/maL3P0CiRkQ+9I9VGxtuuZ95K+6v5WIXcCZOPQsJ4
	SHpCkEs3awVU/hjXnsk/MZlEHU5jY/Tzu49z1xyVWS4KfJVbQOJjOzUEyFWu270HKOXfGe29Lkh
	tDGlScGx4M7KwlIvAu0vRgnDHnKw3sxtNangWUX+vVW+5fVUJAHW2QdQujvaPIm+mSVThkuDR6j
	iMvpVRRA7W1/c/w8EJHnp21JTPY72EyHn6Bww0znVqpxjF2fkPQm/2A2GYo9AqdiEoRk+uYfgt4
	GBuD/cKEPkFu3CecXIRHifN4XBwceTrc92oxpEIOiz4f8bDm0aPEVIn4hqUho1M=
X-Received: by 2002:a05:6402:280d:b0:6b6:4dcd:967e with SMTP id 4fb4d7f45d1cf-6b7c0bbc394mr1685420a12.20.1794564376161;
        Fri, 13 Nov 2026 02:06:16 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b1b5asm706711a12.4.2026.11.13.02.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:06:15 -0800 (PST)
Message-ID: <4dfa19dd41ec1a202182284d9617926a259288a7.camel@amutable.com>
Subject: Re: [PATCH RFC 16/41] configfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:06:14 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-16-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-16-4c998976c6c7@kernel.org>
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

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize configfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. configfs never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/configfs/mount.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/configfs/mount.c b/fs/configfs/mount.c
> index d8cac1cbf3bd..60ba24e7ae2b 100644
> --- a/fs/configfs/mount.c
> +++ b/fs/configfs/mount.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/slab.h>
> @@ -106,6 +107,7 @@ static const struct fs_context_operations
> configfs_context_ops =3D {
> =C2=A0
> =C2=A0static int configfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &configfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
