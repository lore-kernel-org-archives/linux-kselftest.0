Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564189;
	b=mmq9ZlD6vaolqCSEJDNX6JrzTCy8snz0p9/B2Q8JPcN/N3RRdRGfrwzvdKg3PsCQngPE
	 AUM+BMs1sW66aHX75HFgFyEyWCHarOWcWpKnzOPB+Db5yj7EjTC8ZlbmU2Ju3/6IpTZr5
	 /0MyRvAk9ZB8oU20NHWLMKzhctHzmTe3/qJw7qyl7BHLBC6WnqStfb5dXRsx7EjFXYUz/
	 oWzjCfKf+pkmoeHLsMYIo9Ek91tnfqFG5vv66v8vmAHUNF6Bgc0RyHdunbhTRH9zUcOAG
	 lYm0dlYk186MtAORwleDlgNUTZFM+hATpckDrjCixqrG/Mt/Ezl2Mc7ySmvR/Ohcksw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=SoW/gPie2WRRtXdhiV6ow6HDYwH4jtR4w1oiMzBwW74=;
	b=4AfmcrsG+DPZfgA+tWPsmLO2IKcPTWmYFvcgM17IknZOioXZJza8mUtOcNeRYV+iMJdX
	 bX6jKSj+KrTFUcyhJQ+/M3NoyDMPhyRDKKNMo8TZpnO648YietqiDhoiR+3clamSlnujI
	 kk3rSG7YJpMzBMVQNpvBW2LZHefLmD6HdAnOPOyFxQOTdHu+sujmgR88RlsTAoz/go6tw
	 vcAAHRngjFiIO3E3bHXw6tnjPNSv45RFL3n50TWQtggZVCP60Kn4UwBqGjmkJegx3mWnH
	 V4aODbVAc3Z5KmLg1dtZ8MCXQz1ytCbbS+IBFnXolB0+trKcK3AqMQm7L803bAJvu/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PwLaWWEZ;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B458606A8A3
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 10:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B458606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PwLaWWEZ
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d473cfff6so128195666b.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 02:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564188; x=1795168988; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SoW/gPie2WRRtXdhiV6ow6HDYwH4jtR4w1oiMzBwW74=;
        b=PwLaWWEZlovk3BcnO0ZG64105bcHT1OuSddm6BbnvIqxbrPzt9auj7esmk6BNbh6fX
         VcVz0Fb5EO25ZFbwJkkdsGMVKdakOQPzqU2f6LPhtUiDBhEZmXH+cAuxyn5j0/PSwsaT
         RO2aU2TU8aCmd84MLoXz7vnHjZWZq5qT0/Sc6gtTAg3UhyfQddRWFsH5ep7YUVPW4oOS
         ZJYdPFjeA/srAxsT7bXr7CLtpXwYO3HrhRePJ9C+1IlKmxOGPfhyvFsMUb4DHUYdYyHA
         n68GAxpj0xAii+OfqqKyb+8UpP8WFZF+WeKZ9rpWrZ/4EfgHnKqz0J1mnDjnDglQmq1u
         ISGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564188; x=1795168988;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SoW/gPie2WRRtXdhiV6ow6HDYwH4jtR4w1oiMzBwW74=;
        b=pgnt3tBTvNWHs8oDG2cC0p1U0c3ayqDtHpzM5261tDYg83vV7uP4qc7BxzxTtZcleC
         NAfQaIduh5uy2XYU6QbF0SJs9dK8CLIB9oc0LyX4tcMEFr5CfFKeNAgs1xafqravldq9
         6FUfhNtTF0KYsX4COiRzfzl4S9/ivedYCl7bq0YJuASRY8PxahugK1lCseEU1/ecZM7M
         N66cPzGwTQQItW2unE6eBeeGUdef2Q5P1yeXSIk8j/djYGAqRZjlZtUlVFWwFLVMiXBl
         5fvzLweGsKfAt44MrA3tRUT9K3DKHDDPg5xpxsgGqVecWrZkmfsaTFpWHDD8NcmO9YUs
         Lc/A==
X-Forwarded-Encrypted: i=1; AL+hErER3AtIkNkwcIo9wG7Ms8dKxsfIsv5MtW14vfxwtNHgKwKizGjRHSVqvsZplA82jKiRG7vpM0EL+MW9AMTc6jw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NASOsOqKOJZPihGyPlpVU2JWFngWwH8Ml1MRa1Fk/p3UUeQJV
	crmlRhakC5YrP45I9/VITmQOwsfidu8hiagOdwp4/QNlCI5pqvhxqHwyCfO10vZ08YY8
X-Gm-Gg: AYBFou3UU0NWP/Vo6zInZthC4kEEmUnm4xRLFPOvSh0GQwx3V7MUoJBjCzD2pPzYypc
	PHPOLinFFxIBCab1ZezP0NbVfJ2R+XgNSPd0FtNvP/ij6iR++fvWGshmTqymr1me/DS+aK5Rrzb
	JJjvEiOB1HLwXMJ6hNuCimICzA+B6IIK2HA4aaIJn2c45eraNS8V2JF0qclSpJUDrgPNIsT58Q3
	ClPWxjiDczblZ1d9hFj6VqfIzPCLzMolg/mqbq3lzW0zgW03voszzshh/pj54Q8pm49tROOE3FK
	N79kpGXYd/vvRWKNauf4zc57qP+3z7KWKnqBX4XVgK5LNIZzUJ4Ddeo/MFYpiskiVceYGNF0nLa
	7apRCW/dAcxDVrr5eIBcOMi7BO5zEfigfSXOE9p4+zfNLhYlknrKYewvTpuUxHlHprFLH4q6uIp
	Ihhy74HtA+VGA3sd2zQ/Msq+krYkKqfScJWZWRf8cQe7m5FV/PLj3TYRRUYoWZX5fr53BEJtf3N
	vYZYXKnG2bWlD+l1Jl/DpzADf8zbK9/pBWSste6rVaK1yVZj3iCaubrJh1tcHWmEcNcYJWpYHfi
	6ASamaIALfAtPYMOaMI1H/zMjRJ/+mnBmXHYjtEIMAol9DJa
X-Received: by 2002:a17:907:d12:b0:c4c:b4fe:c9e8 with SMTP id a640c23a62f3a-c50963dbee5mr161853166b.38.1794564187801;
        Fri, 13 Nov 2026 02:03:07 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm74933966b.32.2026.11.13.02.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:03:07 -0800 (PST)
Message-ID: <fffc4f7f87fd5f03d1ef409df76f71ddad552213.camel@amutable.com>
Subject: Re: [PATCH RFC 07/41] binfmt_misc: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:03:05 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-7-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-7-4c998976c6c7@kernel.org>
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
> Initialize binfmt_misc as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/binfmt_misc.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
> index d945b4f6e158..7dc233becd98 100644
> --- a/fs/binfmt_misc.c
> +++ b/fs/binfmt_misc.c
> @@ -22,6 +22,7 @@
> =C2=A0#include <linux/file.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/kstrtox.h>
> =C2=A0#include <linux/limits.h>
> @@ -1575,8 +1576,7 @@ static int bm_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0	if (user_ns !=3D current_user_ns())
> =C2=A0		return -EINVAL;
> =C2=A0
> -	/* Never exec off this instance and never let anything stack
> on it. */
> -	sb->s_iflags |=3D SB_I_NOEXEC | SB_I_NODEV;
> +	/* Never let anything stack on this instance. */
> =C2=A0	sb->s_stack_depth =3D FILESYSTEM_MAX_STACK_DEPTH;
> =C2=A0
> =C2=A0	/*
> @@ -1660,6 +1660,7 @@ static void bm_kill_sb(struct super_block *sb)
> =C2=A0
> =C2=A0static int bm_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &bm_context_ops;
> =C2=A0	return 0;
> =C2=A0}
