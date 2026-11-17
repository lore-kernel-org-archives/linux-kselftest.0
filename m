Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904512;
	b=Ns52L3q9JaigyRKViTbdaaaJw1XjlbNW2FxyVoLhYYHaO2oKcuXXnce7QOUmIuCNqKap
	 r/OqwQ95fYZ12wiL3qI1AaYrIE3Zxn/PZg79Jm7rv7PaTJeKZOMVHF5hOQJprtopAdpJc
	 Os9VWLNgMzO/kNExrGY2nKYVmmR327gqsbBF6e2iIL1vx+okGgl4F8xsUHGGaGBW2Bdta
	 SaJwZwvJeEJyauk0RvT9BCoOeZCK+xNFMVDzw6JkICvHpoCeSSGGQwIuJugZAYpeqLQbV
	 520Y+OLeYjxtpKfMiN5joig94AcxUNUUTvyr2O95OO2Qb3Y3RvxXJwCnqRk82nchk2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=+cVfVc99Mj9JzDjRqkRlx7bbwk4z1TaP6S9xba6j1G0=;
	b=QHznTyfxf+TXFb/tWz0JskHxPqAqXugfRSeqfES+C5EB2bdLHfWP2EeZwvS5ZhErTbFt
	 FUtQ9Rw8aYksUNhSkFC34Ml0flxmw5xNzJotgWPPsc9EFqkrH8LkmbolsBseS/iAGc2zZ
	 HXLVARVH4AXhFXK6GfJ025MnyTZ+SVJC2PIbHnSygJXSMDwncpdOblSoiEpiBBaVW8dDI
	 We9VhzWQNaCVlWNXRPazC5sX/GUnYisXufVpf3otZzmS9SUIy71O2S1gGFjMsfpq8ppMQ
	 fSxLwgFANuPiGw//GNiKD4K2E5fZ/m7Dn43rLHOyCzjez1+ogSAYIrpxBiJsE9IB8XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=asHWLUHh;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924C9606A8A1
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 08:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 924C9606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=asHWLUHh
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso581580f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 00:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904510; x=1795509310; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+cVfVc99Mj9JzDjRqkRlx7bbwk4z1TaP6S9xba6j1G0=;
        b=asHWLUHh9Osx9c7ISjHVvBK+jrwM+bEKiKQ5ZLUG8jHeL8cbDrdmay7aq+azwtlrvN
         q7YkHw224WJQO7TnM1AyMygFYXrlY29jKpq3C9XROr0oTqsA+UK4p+WS5GMy+xx9DTRb
         nuDA+OEO8+ykjkDq/RDjAwEfWgenycj+snq2KkG6mulygb6NKchr6plM71+t8W0/+aGL
         LigMC+giRqQ92TsunABClmE52NWQSdRqhQeez7lH76lemvGh63Ic8nud3Qte/9KpQmbQ
         YrdviXjfG5hlS64KIE7Iq0kMRVYmtZMNK2hkMRb6Cz1tihRk5N+J71aJKPK+K5E0SOED
         KbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904510; x=1795509310;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cVfVc99Mj9JzDjRqkRlx7bbwk4z1TaP6S9xba6j1G0=;
        b=CKV5kqCPRzq7CpQULXABejU4CQWCSYROnRlse0vDyoTnhKRtQSgStbmk5l/AGofC0Q
         9HHjvTVwiz4YookA1McSG9eWU0+pSf2UC3lqMKYvllUvbX843d1c1kEVdn3Don7h9rvG
         8pYAory3T8C64kJSwgGaTmj3BVuLZb2I/BdZiq91kkTeCwZbopzM2dhIUwjTBfzQ/LuC
         Yget3snMytiKfQhCZNMWYKvzbYzVd+LW5fawyzWfhSnBgZ8LXcMz3ksgz+RgBIInNmSd
         NUQMQWz5oA6tI66cdc/BgHr6qtZ1cn5sCFycc7bCjb3yUwMNOMzkGew2HzS6HcHE0WMA
         ukvw==
X-Forwarded-Encrypted: i=1; AL+hErEPAwamHg3QG1zhy751wZh9SnPKSkosDFGlUyq3vWKjK3ay7CPkcgiXKRooPUlgMCQJTSYFTtSrPbdmojO+QCU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AwTE/3xM2CfbslV3fa62fK2tUevHzw1rKvRzSEJvsI262hyRI
	tSrXOQPg6pDHR2Axd67VbCY9S07myFsW5TqdO07dBjp5fin7nYnDy0rW5tP4x/B96bo9
X-Gm-Gg: AZFdTZc1OmvQVd/zaPHxBC6lP7yZDLGN63Jaw4D4xs8Rosr+S1QTfr7U9iJ5mLugQlG
	ik6+F6vV6p6BrT2sdK37/ojo2mA/iVTprwLJ6Uq3ZPHb34ueS7y1b9xlBclk6/2b3GpjKSAIlhH
	alR0uwbWTsmnz2VFIvgU4h/phLATlKbvtOEr6+uAH7cFFvQMQlW+mODglRP5bzYGHNKslnIcusc
	7+1nRDReZOulbEkVKS9HvrjejBpHRsGboOOtY1Ssc1yzNLNwXe6t7t+dCFdKnW0kCtMQDxUWrtD
	bwLZEwuo9hZSJFGQ84cZXNjaU6sBFaa/ZuzVGPLayxbeBRzg0p/KRJBUlOcHuVBn2idxtrabHpG
	7qtJ1PmkqYuyU/1PSMnFp0sr1YvEVY35CtwCQ4ht+iowwxP4zmqtsBzJd77FWSynQsrneToK30U
	ZNHgt+rIsp227trZ9QhCZX+KUzcfwe2w2j/GnCxh6Mal3TBTwztLhr93k2uD3t0DV5xEJzKlElE
	YNVZVSWK+UGI9K6prYyLUfHieJkCqzGAoGR4venwx/djjA3RziHGXazjblUws7IBAQ4QefCdsNF
	5i8Etwkw/0mtLr1ZllZZJrv/QBpP4AUsHPhweiLcOxbwjI4E8FtQL6p5BOWuGyH5lVfvgOKBciV
	xDvZT1H4PvMwpH7tgMQ5PciCA/namXnbC903tNqVRhEBbe+ZQ0wMpY9F4
X-Received: by 2002:adf:e193:0:b0:48c:7306:18e9 with SMTP id ffacd0b85a97d-49c728c6e6amr26569239f8f.43.1794904509932;
        Tue, 17 Nov 2026 00:35:09 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4e2esm26338505f8f.36.2026.11.17.00.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:35:09 -0800 (PST)
Message-ID: <b0ec2cd8f9b7a6a2e4a54c6df2fa897bce068cbd.camel@amutable.com>
Subject: Re: [PATCH RFC v3 28/44] ocfs2: use fc_init_pseudo() for dlmfs
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
 linux-kselftest@vger.kernel.org, Chris Down	 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:35:07 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-28-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-28-8cbbea1cf34f@kernel.org>
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
> Initialize dlmfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. dlmfs never holds executables or
> device nodes.
>=20
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/ocfs2/dlmfs/dlmfs.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/ocfs2/dlmfs/dlmfs.c b/fs/ocfs2/dlmfs/dlmfs.c
> index d3bfcada3e3bf..1789ec96dc130 100644
> --- a/fs/ocfs2/dlmfs/dlmfs.c
> +++ b/fs/ocfs2/dlmfs/dlmfs.c
> @@ -21,6 +21,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/types.h>
> =C2=A0#include <linux/slab.h>
> @@ -563,6 +564,7 @@ static const struct fs_context_operations
> dlmfs_context_ops =3D {
> =C2=A0
> =C2=A0static int dlmfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &dlmfs_context_ops;
> =C2=A0
> =C2=A0	return 0;
