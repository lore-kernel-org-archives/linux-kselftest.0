Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564223;
	b=vsz+LHvqqjKmVYpye1o9v42cUh6G5AEzPYKIL7mTBC9DaDa+xkNNfw+v7a65yv6GhIjU
	 unRKN95yt/CGVPUSgxg1kIXjkWKjouJoCumYg/y18OSFcqCvEECnZtvLsDLNa3Id82rYK
	 6KOAIw5JFZdjdPWQB2Xjd1h1dgcDCZpW0Tl9Go0MJhaNFWuYGUGkwihLk9DLd8TP4lVmP
	 4vjmJ9l83Q6Q81aJesCnPa8gdZYPMkJm/66nt/k5ZbptZshi6vcLX/iGHbFYENFPNSlZ3
	 lFgOOjW/I1fUH+g8o0ehQovzPjqTUceGYAAy2GPUZYQOibUN71iHs3YTtLY6QBDOL4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=6cN8hpP/bnwcYzPsZf0cUkd2pk5Vve+UdRh8Jmnig90=;
	b=Rajz8SYSbkgEA89gFN6/64PPEu6PQudwUeYeumBeIy2jVce2UcyZXT/KRjLrWwDRNW8k
	 2NL4KlBMSmNkwNCT/yomkwLrdg066P7+hjLcwSh1xrc6OpLqNFga6pz48NbwJhaGmDExG
	 cCzoBLTQHqisE3zVFuI1tQzl0UQo/7DNNGgaP9ODNFUOs7ckLVatcFGbXJyOyzr76g2DC
	 5GddLnco16EvYR8wvftkHbD3SC1FC09SjzVMwCylBAguMvy9vQD+01gYI7iO+gxJbY2Db
	 t5ysVOK34BDmvRsbzvSc/WX3DvNL9EbnNITIqcZfuaVYuYiWEkjYnNgJ10uV4J7+J/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="YppAuU/f";
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8FF606A8B6
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 10:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC8FF606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YppAuU/f
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c169ae1cb26so172962766b.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 02:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564221; x=1795169021; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6cN8hpP/bnwcYzPsZf0cUkd2pk5Vve+UdRh8Jmnig90=;
        b=YppAuU/f77eWMTZ8F/Y/RTjltBDd6igz4EttMolmckndL9mvAt3euwqVCnUFPcnj1L
         wpVFClVgg0YlcE6bTABHQT1NnQyujG09t70SZ+IGoHQq0qQgGGwB+4JQikI2kaQwvi8W
         H3KupRONVF9kXu90kRN/xwbfNoANJajav9pnhnb3IMIJ4A6DWEq+8017kOKRrUT+YN/m
         jRUDmGHXRq1c+43Y1O2K5XEGEQl+nQ8YkAZ+/5vrEItOhIamTuHGEOkZUAeGsE8baOwB
         Dj4haSBpRwT/bMXANPqkevI0ogqYaGkZDRE/CPrkXlmZ9T16K5sayD5Snik8DtXgYcT5
         haBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564221; x=1795169021;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cN8hpP/bnwcYzPsZf0cUkd2pk5Vve+UdRh8Jmnig90=;
        b=AWbvOGXexA/w5CYbqf6z5bZhkv2qGxI+Z8kSVT6+N4buMPYKEYSFBSmcvWsLLunKfr
         N/0ptI2nJWRp7kme1EAaiy7Klh6geRL7NuX6c6cYNky/GbGlAjhQEdfLSSOQZFsuQXNl
         eYONRJpqQIQl3f3SWH/F0vvyGK3XkNiM6tdxDi3Aq823/JNY2+kzfKZd3J+2QYPIg8uu
         iAyUABekIqfj9l0ghQVSZ9UbqEgqegaJsZMdmZIu9OrS9LMja/n1mobOOTy/3WNhlZDC
         og2uU/FZ3Bh2GZanBJ70rznUXJ/KQMOlrJQsLQ5eEfI6weObuAtTjrR0bLoTycjQyXKF
         6Jsw==
X-Forwarded-Encrypted: i=1; AL+hErEyW39nilXYggXWics3E/uAdCJofYWO4DzmlQwQb+/+ipdEYDgsrvlrhRM1yMF0tc9vJhlJLkxR1ifshvYSdCU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kROOmdjCrrme8I1KYqjboGIZZIvgiGr3EYJgzEkpnZKct7fBs
	ghjd5nrMRrHCHTQ86P3H3I1ys/7m3Fvww1qpokvYMfu3Xy3Ugpm0wOdZdmJovB8bd3M1
X-Gm-Gg: AYBFou0klTdViQjXZmAYST9UkslITV5Yh2iu0AYQRdO5YpSomuqsxeVRwQtqKwpqfrs
	W8AagCy6AmqDyB5PnM9bIR8nc2HuWKymIuodU9KhiRQwWnR+wH8hCJJhFYPDcGBsce33mY1+77D
	/L1tkZF0a8nDUkjsOfr2EgVzNZ3QVhxHaOlGDy7dFlgl0aY8ahJOQbXPCfG0RoQqKdKJbdJbnLl
	rTWSrSbtUluf4PxrDaUTUFCOjqckuZw7kMhpJkGC6WunaM+zLFPDUAkrFRKM5RE7KN66e0pDHx0
	WnhEEkF0x300+rfzgaNHFnY8SFrRPkMGng1CNmtO6iqpvebUmp0rL84t3kAjV5DUN+yZBN8JsSr
	SlvNZrM/HX4DbFOt9zKtC8snRlvv5EA1IucohHTL1fjbESm9Qb72ruUgrKFwtXyOahGqt8+lGtw
	G7gkN0oThBM9xFKxfPy6TEyc5IVrhfwSdEG/UKS/j2AWMZRZ6tdxwh7MqubZi0y09yiMk0yH4u/
	MA0KK2qXTu/5oEBpBCbzCDVZ0gm0IGjbNO61IargYEO8fBy92Hr+1AW9QOKL5w7ZFASiE5+vvCL
	WNf1z/mgxlIpPETfP5LbQSPXzuuWBDS4mbByhmOXYYJ8tRT9FK4cHjOsO2sBHfk=
X-Received: by 2002:a17:907:7b8c:b0:c42:bc58:f21 with SMTP id a640c23a62f3a-c50963856f2mr175546966b.15.1794564221164;
        Fri, 13 Nov 2026 02:03:41 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b3asm74752966b.27.2026.11.13.02.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:03:40 -0800 (PST)
Message-ID: <cfcbef5caf7651b63774549fa1999d34981c78a4.camel@amutable.com>
Subject: Re: [PATCH RFC 09/41] bpf: use fc_init_pseudo() for bpffs
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
Date: Fri, 13 Nov 2026 11:03:39 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-9-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-9-4c998976c6c7@kernel.org>
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
> Initialize bpffs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0kernel/bpf/inode.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
> index c6f328e4752e..57cf3775c076 100644
> --- a/kernel/bpf/inode.c
> +++ b/kernel/bpf/inode.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/kdev_t.h>
> =C2=A0#include <linux/filter.h>
> @@ -1197,8 +1198,6 @@ static int bpf_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0	sb->s_magic =3D BPF_FS_MAGIC;
> =C2=A0	sb->s_op =3D &bpf_super_ops;
> =C2=A0	sb->s_xattr =3D bpf_fs_xattr_handlers;
> -	sb->s_iflags |=3D SB_I_NOEXEC;
> -	sb->s_iflags |=3D SB_I_NODEV;
> =C2=A0	sb->s_time_gran =3D 1;
> =C2=A0
> =C2=A0	inode =3D bpf_get_inode(sb, NULL, S_IFDIR | 0777);
> @@ -1261,6 +1260,7 @@ static int bpf_init_fs_context(struct
> fs_context *fc)
> =C2=A0	opts->delegate_attachs =3D 0;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D opts;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &bpf_context_ops;
> =C2=A0	return 0;
> =C2=A0}
