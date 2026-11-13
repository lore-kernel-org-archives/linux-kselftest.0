Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564161;
	b=u6HO7uK+hMkw27Xj+PXDNt2tzcNvH3SMfg8nvM3xNYDQehxOuGZPjdqumut+kxRGSMxz
	 H+Wwzjs7wvif7gOjvRIDjkmQUzfF5URfvWBFEMzN/cw8B5DItWXC+KgZZCdHluuVuyg0m
	 WjYaIOQ0xxF5APhzPK97nFil5dHZWRaAVa0AJQGMECR2nhrV1jKIN5bxy33GS+hrFHpxU
	 xZUbLvHU/14AI1LsK3vC0I/chr72I9ftvcIS9jyzPvcVYyOM1MdgmlGwvj4QPPPJQqYnh
	 OIz0hoMv9y8liESD7KmpmDR18sEW3+6/Ein0aPjaN8C0TUZGLkOPaMzp/BWmbAHTLGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=8oHy35ptJ0fLQb2YrI1vdssfNtJpVRQvJ6BVJKFTHRg=;
	b=ebKrFl/uhQc04qTCcTp7oYL9N8YPT6+/dyaVM7yTRqm1dAtKzyiQI+33KyW85USPYcTe
	 VztemDe/ITmcWM6HqvXLDhD0TZ5IiFQgc/wtZdMt3bNNlEXpmvpFBN7uUWZGtgT4FPcfz
	 KSDIKfKZjaPC1vl8g3/91sNzv74heP9Raevf7KoTDVZq8yRabg921QqFfw5h3Z07G3w+6
	 cqyVbKjGgJWNKaMixaNJ7/kiGklyfiujgDds9gvIRyQNBpxPKbF0kK4LIYHTZDcTvUIjH
	 J/87tu6Bu5hxnmgZYZDkKZnorBuoDJIYU1ag9JAbMdJ0xgr2anndDznsVNKqRqajnCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EgTTjz5w;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C004E606A32E
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 10:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C004E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EgTTjz5w
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d58c50743so126076666b.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 02:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564159; x=1795168959; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8oHy35ptJ0fLQb2YrI1vdssfNtJpVRQvJ6BVJKFTHRg=;
        b=EgTTjz5wCJxsGLytKYZU81rQbAzYRel258q4rVhi5vK2xrQmQDal1yzp7Dtf678if6
         JjRQl+ZMXR5MwM/OWFtCjapsFpKPIJy4k0q9tv42ACCpenoDrYRhgwteGx9fsXnPo36A
         CmpJgecE0sejy6MR6tgTdtDQCHZyCNaM/wReBJem7BxQRTbXuUIxXx4ekm3/N1csmjzv
         gCoizy5cyPI1qWsTUdiFYdDS/1za3AmjDubKBZhhOvaszW7al+E0zABuX1J+7mV9GIsQ
         KNDYaQIAk2oxmRBvszTyhTc1FmwCZoCx7jL+YHG3X20//Nw1xxSADrBopi8MjhF9SAS0
         utQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564159; x=1795168959;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oHy35ptJ0fLQb2YrI1vdssfNtJpVRQvJ6BVJKFTHRg=;
        b=bh1agXPzXAd9WsriLjyyc4wpZSJu70Gl/QugoFV6hKvDaaOTtZkYLou4FX8coCAtgQ
         8yuXKcg5sIuPEM2gAzUgdKoPfLNX5HE0rWj21UDUn5zYFyXX8Z2WQTFiruNek+8FiZ6l
         /LUgD++KuQMyxpGC7y5f95BWrXeKTCWO9DY+L3LZ4ehX2J7dev7iWIsNrzWP1egm4Opa
         pqfWGiTv6kEelV+Ghp1n1uu1Ctpm0KJsNemDUYcAA14fmyRv17SDzCUvVCpxfYSO2GlL
         qYteCuwqeJWWOHlCXdgiCBrAByMmS7K3bEq94Fx3XQ6hW9Dsx0mRfnB11UgYLIaSF4dE
         kqFg==
X-Forwarded-Encrypted: i=1; AL+hErGYKEbzINegr5Rao/aOqj09YNxHCXVxWuZ4clEc9ZTUdh9H7aWVuc+uuHb3Yjb1wCy6bBJvoTcV4LXA5no0R64=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rw6YwNiog7tp7bfxUGqInK+tg9wcg+5g5vhfgq6mUJSdO6tW3
	vpHTQC5futeX4HXwvAAXzP4XWBGr/HUZOfqa8mYymqYmu0Z0Lk3ud6J8FcHA9os5wR5Y
X-Gm-Gg: AYBFou3IZHZoUNglH/Yj3X1T4JZcCeD1/yz0suyZHhyzch18lvUKNKIGdazsLqFpkV/
	WMYnVvqXcp5PSlxwGIlegTAg0r0F+vuKZKVl/RS5CJdKz/5YL2mj/HG+xBtqW17v+CGbigHMAFf
	33OFQMXswuTSG6DdRzPWFmlH4dYhfRW/mvt7Q6x1yPeI+gzaTy5NICGqxAf5zwQy3PfD6ysEpn2
	JjyXCEXL9pn4qk779Da+Qt5txWqgwdP4IpTFS4LAeKosdh048LHcWsmHL94tLRvHXsDW3acQ6GW
	RO0ybVlYFpMMkR9z0ZXn0hjWhIx8nQ42ICRMr1qivd3tLNrnNo2mhdj9ByyTUeFV9Md+6hqF+AR
	eOxPRb9ouhG9vgfKcRbeDW2rsauov/Otx876gnkv487/+2SritHvdOUTFdzFNdbslkcNHkEfMPL
	S6heOoMExJLHUyB/4qurvQMgfFUpvq+CsZc/fNt93xR1ysCG6p7bB58ni7U+2spodigbwS9Yuap
	qa6CJM0HK9TpKdgZi+I5R9NnrkXAjUXY7kf1aR0/vzpLvntmYJLnNRck9lc/IIGX1CsdxZWkYLl
	GkhARoE7nK3icRlfDtqs+Gy/8NgBrhpyq0BPfaqceOtszK1b8nlQ31t56PQnYeA=
X-Received: by 2002:a17:907:7b93:b0:c29:f5d5:5a9c with SMTP id a640c23a62f3a-c509654de57mr163595166b.38.1794564159104;
        Fri, 13 Nov 2026 02:02:39 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23afdsm74417566b.13.2026.11.13.02.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:02:38 -0800 (PST)
Message-ID: <8c51aa1ad231dea30af06ecf761a971f5958d063.camel@amutable.com>
Subject: Re: [PATCH RFC 05/41] kernfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:02:36 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-5-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-5-4c998976c6c7@kernel.org>
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
> Initialize all kernfs based filesystems as pseudo filesystems in
> kernfs_get_tree() instead of raising SB_I_NOEXEC and SB_I_NODEV by
> hand
> in kernfs_fill_super(). This adds SB_I_PSEUDO for sysfs, cgroupfs and
> resctrl.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/kernfs/mount.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/kernfs/mount.c b/fs/kernfs/mount.c
> index a0be784bfb06..6b60d212b003 100644
> --- a/fs/kernfs/mount.c
> +++ b/fs/kernfs/mount.c
> @@ -8,6 +8,7 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/fs.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/magic.h>
> @@ -298,8 +299,6 @@ static int kernfs_fill_super(struct super_block
> *sb, struct kernfs_fs_context *k
> =C2=A0	struct dentry *root;
> =C2=A0
> =C2=A0	info->sb =3D sb;
> -	/* Userspace would break if executables or devices appear on
> sysfs */
> -	sb->s_iflags |=3D SB_I_NOEXEC | SB_I_NODEV;
> =C2=A0	sb->s_blocksize =3D PAGE_SIZE;
> =C2=A0	sb->s_blocksize_bits =3D PAGE_SHIFT;
> =C2=A0	sb->s_magic =3D kfc->magic;
> @@ -388,6 +387,7 @@ int kernfs_get_tree(struct fs_context *fc)
> =C2=A0	info->ns =3D kfc->ns_tag;
> =C2=A0	INIT_LIST_HEAD(&info->node);
> =C2=A0
> +	fc_init_pseudo(fc);
> =C2=A0	fc->s_fs_info =3D info;
> =C2=A0	sb =3D sget_fc(fc, kernfs_test_super, kernfs_set_super);
> =C2=A0	if (IS_ERR(sb))
