Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564237;
	b=4GVP6cAm7LOSaLPoTpej7aKThd/A4FXcYNLnJ609MD20Vof6o0QLxwSEZp3bjj2px08f
	 1LqTAlqfauRMcAMr2gU/FT0ts5Tq+h30/rH6TXney6U3WW2nKoq0POyYuV7JnAVOPhPCH
	 7uqBP15GNPod3g+bUPJe5xCjXQF8HLWAsyeAiKNIEaZsT14SBtdyUE4atO1yPIq3eQ1xU
	 Os5HnOlldaEd2fC+yg6q9lcKZlXFrhhN3DTzxlza8e6vLEfOiAZnr4MWbjNVK0gP2d19n
	 FtJAxmJO4yWsy8RekEEOXOumUCWGjzzui0HPGxLmN8/4VOrAx07j0YGgRe2GLH+WNSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=isfwHOSFEU1THdAtyjNR/BymwB+TGu4CpGjFt5oul8o=;
	b=mlwwXHNr9YLk8alk0/nNXEFdBF0QJMRBsYps3bGJGEVRNy/7ewW3mYxBGC2wqTjrh/2n
	 X18BIETiV4PMV5Rw5OR2mU568jscCOgIh74bdOYVKy2Hf9gaIkbDj3N+I8v7ShO+0ggHu
	 eJUVhSGBnKBsuOJldD3ktnzYcGb1GJeN5Rk2/XLbJDZcRU80YzFIbl9G8PwHiKyE2PnjI
	 U0AZBa0BsHYPCzqmu19NmHv1EeVEcrjItZWql8vKQXGEqt0nZN6rH3zZDUjuUeTTN6Eu2
	 DYqlqQrwywX/bLgdyPkg7ExIxxZeZWZEVPz5LfYrBO/lNsey70JeXyajqsLaxeXO7Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HmOhZp1a;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82FF606A332
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 10:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B82FF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HmOhZp1a
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so1145033a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 02:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564235; x=1795169035; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=isfwHOSFEU1THdAtyjNR/BymwB+TGu4CpGjFt5oul8o=;
        b=HmOhZp1aysVRSGcApaAZDLI81xyeSldeu7ePLUPKkH54FsFfnK+QDVFY4+VQQZDD5I
         H2HloBZm5LZmO+0yz1W9rfEhaL+YICMUwpLNmuFaGXNfAv5LYB2fsAN36refSeHGX9fO
         cryYVQ+kM2KCw8u+OcP3112ltvgpCHGvfl9d9GfdLtqmNcwNDmKz3KTPAT46qO03zj8M
         uuWZNkUaGTWe7Ooua9eiEAKQiiHx3qf0rn/l3lNWMOa2sfege5hzg+R5XNTSj8AN0bpY
         dCBAZCrR4vjcQdomnF2hzC3FA98LaruL1WYTiCQ1DC9kzlEXZqoLyeQdM7U6VrMRD1VV
         Lr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564235; x=1795169035;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isfwHOSFEU1THdAtyjNR/BymwB+TGu4CpGjFt5oul8o=;
        b=ovsuu+fJePa4cclaasxKu7cEqqBWSv27E7cfywvlwEzBAuJqSiF+JpKWQoVyW09mYT
         /Budw8x/np7P4SINadO6g7YyINOLAJDjyLJlywuf+Y1iLaiDr7H+q6z2C27OHFsWm2m7
         wLoPSUDrpUn7H5XSBoEme4VetCiG2E5IkwPb1cF98J1pOMhs8sySJqtBqcIAE6/Cloe0
         fTYQfMQEPpisffSoeeAvqK9k2iiNv5MPH6rI3o0JonVZjsACLB7q9bSdpHHFazDNc2gN
         2sqBonX2YjrjohPFVB0LHxTTm0/uBd4HzZZBPcA428687GABjU4F2KHsnmp+hn9U9kUc
         sZPA==
X-Forwarded-Encrypted: i=1; AL+hErGtsSNqgruWEt3ZeXP9qxBEGOhrQP1Y7k73pkq74T/vrKPJQjQiyRoC5Vkp9HjW3TRtjzuh8+NzGvtrmYWdj5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tWzL9etBEk2fO2mBrDTtBGU6zcKpBGOcJEZaI6uHOk5YDqxlb
	mhyWKQg6N/yVlYS0uXkM6dZG0lPrrd0+smCC8mFB0X3+vWskA7rGmKmrhF6uIIu2nzyV
X-Gm-Gg: AYBFou0v3HizRQqd1g+8sgm9m5kukrBqyU4OeJKcmLCLJjDyyKGhZB5NJQt1ro+P/mR
	WK+ZMTzbuWV0zjNR+Iz3oS0loLHsir0i6fNo1x6b5ZX55+/O1LHETYYBp0cyTrKzzw/WVBvtqHD
	XIxfpfcg+quYzvd/VBTqYT0ia/iAGJmew5juHQMphabIW+l/lAL6sxIOW4X4yhA6hVfnzzhZA0i
	QJEoGhXJZUxFg4YaK2btaH38xGByrxShe1HoacQlkGXLZ4dNwFKjtQt4XZSLWdO3ELLv5q6Ibct
	y7ft45W/S5+wRacxpoIGm+j+/E0Psqtx+ab4YpzbfvtiveiFV1nQdoaVnb7pxo53TARNK+bMyfw
	2eCftC1osHnhsTyNyPbudApXmuyoOFTEvNiER0+urIbKNNdVRgptLTOlBk4xchzCzJ0rDAFM8S7
	VxWEz8Yr/hbdSfMHSKkGjOjcdjMMOj/GgbyyZSeAaDGrO3bHkCycggv2nEjEOpMuwa3XziMPNrR
	nWnGqcWLTy/veaA27ZtVKK5owMDSM31p5TBuxqErzq020tncCdscnFGOrqphOvcfE1jdvtJzZoh
	m0ZqlTb35YUhstTaX3pyUewmuy7uqDZRlKT2EKO1togn47zGAe8qiXjjawEf994=
X-Received: by 2002:aa7:d556:0:b0:6b5:96e9:ae97 with SMTP id 4fb4d7f45d1cf-6b7c0ccaafdmr1234919a12.34.1794564235160;
        Fri, 13 Nov 2026 02:03:55 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm766458a12.9.2026.11.13.02.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:03:54 -0800 (PST)
Message-ID: <16dbddeb5cbb9613dc806b43fc681eb26aa3b0dd.camel@amutable.com>
Subject: Re: [PATCH RFC 10/41] nullfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:03:52 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-10-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-10-4c998976c6c7@kernel.org>
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
> Initialize nullfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/nullfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/nullfs.c b/fs/nullfs.c
> index 319c2f5c5a67..2fe24cb97160 100644
> --- a/fs/nullfs.c
> +++ b/fs/nullfs.c
> @@ -2,6 +2,7 @@
> =C2=A0/* Copyright (c) 2026 Christian Brauner <brauner@kernel.org> */
> =C2=A0#include <linux/fs/super_types.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/splice.h>
> =C2=A0#include <linux/uio.h>
> @@ -174,7 +175,7 @@ static int nullfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	fc->ops		=3D &nullfs_fs_context_ops;
> =C2=A0	fc->sb_flags	|=3D SB_NOUSER;
> -	fc->s_iflags	|=3D SB_I_NOEXEC | SB_I_NODEV;
> +	fc_init_pseudo(fc);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
