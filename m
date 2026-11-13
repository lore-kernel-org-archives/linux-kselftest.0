Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564363;
	b=c7ooTTYiUtciwlfuk8CZJ6A+Ayh9CBpCVn39DeH6LXBr8d4zdlTkurKYjv9m5T4l0mw1
	 6il3rmjcqaG6blWLblAe0POeNjwOYlJ8g3PS6mu4NbU2GBNhrd3+n0gnZwqywGMmUTK6/
	 49VBlEWp/9Mq5CiNbK/5FmEi9G90otbdrcynav/8X0sLW6F6hSTGmrWGhPIwdEqkfrcy9
	 EP+srQJu+h5Wd/TCw+xed1kWoD0y8xN3oI8KnnEevod1yKw3T6+L5Rk/DAb73KPoV3KCw
	 ifR1DIFUjaYjb379Brjj8F0P6WFehQqiyutvx+A8J8aRlKwFgh9cBg3C9KfkHmZTAYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=TjkCmA8zoLhZK8u7U4HhR7QcElVzore/o+jClE5BdRs=;
	b=GM3U9jVl/XHNIzREMZgvh8hc3Jr/63Q+Hbbfoawx12M+T38Z9I/LTnfsIuFcAsz4f2TD
	 KuWWokzALoxPtZEaDBgZo2hkLKF/h3yHUH+2kZ0T6WnbaYQ5TumglDYOyYbc7Sx0iujxs
	 c7H5Q/sp/rozZDrfS1Q/LnT6dyVqjnZb+Vu6c1civnav/AcGwNnhq04GxIh3+IGvjWdqo
	 tyTui3yute6Qc6hPFJCTeLzb6VQR4yiT40GLP0C/KloSYMVJvI3upcxO7j+XGmvkoYWox
	 xshaBepNElzUaBU3dkq5rY5Ui7N9fSaBZ5MfU9HUUknaYbo2NMsVxB+NPinA886UxZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cjEYfKb2;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD10606B10E
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 10:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD10606B10E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cjEYfKb2
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50a4a2132cso51084966b.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 02:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564361; x=1795169161; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TjkCmA8zoLhZK8u7U4HhR7QcElVzore/o+jClE5BdRs=;
        b=cjEYfKb2ti/xguKoQF5XePY0eNOezud7K33Duf47S0g3JkHBuObkd06WZKSsE2j4TE
         DEwnxkXlTao4933EWT51qAqcKFQZzBDYUWq7IdS+RrJUrXD2u7QTXDm9Wr29l+nlsY2h
         ba2aoEFnt/fnBZ4TqG8AlHBTx7MlaAOM8MSBIpLqFecTqJgM42mukp171NeFhmx0Zx4N
         EfXY8c4e2NVT5eQpV/Fv1f87MHIzBgzN889RZpIYFKMs83t0n9Q8bpafRw7OfeQ9pMp+
         KOGhNvmnj7I3xZktgYLxquasfZAW0tMnNpo/9hpnK424qA58Vs+J+ftPxNsRzOLYAEav
         G1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564361; x=1795169161;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TjkCmA8zoLhZK8u7U4HhR7QcElVzore/o+jClE5BdRs=;
        b=NZBzDOCstTRkrox/a5MBDR4wSNMBBGhcZ56co6/rO0N292MZUtf8ukKepcJ5H4gMCz
         Y0toVf38lNfIGzIA5kPINReIjDU39ycqDasuYsj7RPj3jqQOGpzXGLNETXu2n6dJINWS
         dm5bMBXO+Sa+fXduKvMgR2NDlBZ3B7CMzAxqj1RaeZ01/EQ5DSszRPV0ja9PXajSEHLj
         aujC5uU3h/e9zkv3p1blg0iQsMbB/JAEx3WypLGTw4KeR1rBmguWlJKZW4Twoy9SoSbk
         PQZSgjjCCYZLgj5TUy/MJg4y+s+nJeqaBPxX7zsRimoF0m0CR/GgBVypxJ1KzZm2XB+w
         z0Tw==
X-Forwarded-Encrypted: i=1; AL+hErEinkrkDJlj6Ckhosw7wwBpFloR0Vm7VoCA5qZyU/4DFwVcTiFFtF5THw5SZTZjTN1wtxek6kgv6GCBjuLzwcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jwjPL7RgGA3Di+QCfi8ej1eMMx5sD2oP4SxW/MG+q5d2meAQ8
	7MPCEzYhwuT3UWWVV4PEj0KZDer7/nIE+4OcQo0PwYEnnrJ0InpIVq8WQagPemEwVIyi
X-Gm-Gg: AYBFou1OOyMF0eZsvBVSYKbbh9zqrvzsn2+h8XDIH010YTIOcgil5ua24sWV4bhgKUt
	5+120+lj3qD4LRjyD1fixHgSZvWDzlilHlkKX4rZHv0UHXSx1BqWmld0bU3QPBuCkkAlBZjmSjm
	VLXxF1yf5dncV0mQYKqU3HK3kafJB1grKlzLoLgcNUOQAk4biJigsgAOYeO7yCUao+9cCFWIZf/
	Z6OxNc5u1KgPLEBmfvchTECJK8umKsN7fgxBB/lMk0zGXxWT5s+HMl7LAX7C1S7+l6+oqxxXGQH
	NqF7NplOOmz/W7NU/GVUF4VaHd2bOYe7p73LDWQg9TFMuPI+fCVYCRbwjUiAxrpI1Qhay3dwK6v
	/Z0RnfkkNL2Cx4ZbfGJfYO5LUkmQpOD6uBHDPtH3/VJCrgzfF5VLM1xf3/unr8+dPRx5PRyuQZA
	Pd4fTOErMEgFgmaJ/CDzHuyp9mc4v+c4CRCrxVR2kxb4i/EJOqcpSZH1grm+sP0eY7KcreTnbCZ
	Ps+TDIn8VdaV1oyRPFgAWt1RWJwkJrZG0gKWxmqS6iX0ItBRODOrqoWyHgFxtg449K0pqzkV3Pu
	VIqA/WHNT7uMEg4pwHTpmu2amsYeFCuPObKVvGk205P68ReMTudjJ+7uFj2AUFA=
X-Received: by 2002:a17:906:ef07:b0:c4d:5820:325a with SMTP id a640c23a62f3a-c50963dc627mr169588066b.39.1794564361325;
        Fri, 13 Nov 2026 02:06:01 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm73693366b.78.2026.11.13.02.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:06:01 -0800 (PST)
Message-ID: <e8b71a2778d7d7797d433e7bac1a37ee64aaa30c.camel@amutable.com>
Subject: Re: [PATCH RFC 15/41] tracefs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:05:59 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-15-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-15-4c998976c6c7@kernel.org>
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
> Initialize tracefs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. tracefs never holds executables or
> device nodes.
>=20
> SB_I_NOEXEC also refuses PROT_EXEC mappings. The only tracefs files
> that can be mapped are the ring buffers and __rb_map_vma() refuses
> VM_EXEC already.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/tracefs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
> index 5020365ca704..e04febd868eb 100644
> --- a/fs/tracefs/inode.c
> +++ b/fs/tracefs/inode.c
> @@ -12,6 +12,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/kobject.h>
> =C2=A0#include <linux/namei.h>
> @@ -510,6 +511,7 @@ static int tracefs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	fsi->mode =3D TRACEFS_DEFAULT_MODE;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D fsi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &tracefs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
