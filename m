Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904088;
	b=xqkbgd35M61Tocs/GTKAp/4KoS51JIk3MLwWo1LjXsBZBeHaGNEkTZlHLDEY5L5gVDL/
	 H+5wnE/bSKmzma0MfADCZnOWjb/VhRNsbb9I5/lokkAhEF+sYJSoXIlCfubtJcg3s7JMi
	 GGy+wVlb6AaZpojn3BdTwZsuPkGYrLDxTn4g9gXKCgTuI7nswF7uHmYgHNY/qj3WWLwcn
	 APkyzZ2gglx4Lsd3xCzH9hft1HjIJjvEH7vQY+ujTN2pn9KaUbhHDEnd1UTvgXvCAR5s+
	 ki96VzUBmARmZQQSDav6NU0oOBwFwGuM3xk5upn00+scyzr/oD70kcOprqrQ8gHXT+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
	b=L23L0ezI5C3iSHYpTHP79avA310SK0vj8ZSAlkLehOjoJJIkXCdIyDNY+xy/HYA1ZlcD
	 NxM92HdVn/A6Ag8nnqTpisyWkiO2e188HneMk5oPCjimJOCHXlE3RbeNI49+vs2RzxuBt
	 INhdudNR9fipH2AgZdw2Qz8wk3azlNZ2J5kpVD3VnTFtGBzKckHxStcFQjItqS2grR+hM
	 oLJbfPEvWRqfIeMFgdBVnUT3UUjY4GND7GldGn6fv67qQWGd6FBQK11vZ6p30YlEEQJJQ
	 Bqk1rbBgMsDJ0TmZ6r9DkXD2to0ZY5B7jwJKochm5+um11iXJZjmcLKBUDjvyu1of0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G5kPAzk6;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B62606A8A5
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 08:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22B62606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G5kPAzk6
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb61185057so19298055e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 00:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904086; x=1795508886; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
        b=G5kPAzk6YKyHaocuCdT5IFslrUJH5/ldhNVhV6xYWUthrOIppv7Y8kBtZdevqAkpzI
         BDRFsu2jrF+YCozPia7EV1j3KLeZC6Lnc8BgBdPYFaePytvbOESC0m4eRkryqhoEbPxE
         WM5n2Fa2IGRg+WkSIkgfyoTemIrDdEbfzZV+2Eacmamzzj+t+HuCPRqV+GPswkKxuMa/
         2fm9UdrHUV6v7jtlgmqycAcrxGUcSbURHcUFMMj9LS/XjgTFJtp8hDDDARovdS596Fjm
         xwkar34XXNuYsLWY+RNo1AZ45FE/L69efZRvwjPbSAF3CGRgr3AaMHZz6Kf/cz8pCVs/
         RhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904086; x=1795508886;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
        b=OIvBEmzVvZA13qvEngmLNLSzG9IV8rcTmNTQnB8q1EcmJAElh+NlEpAOrfvQCCAhwP
         38PXz+j2KsZ6E2VoFjiQsMolGHPCu5KFsFbzUg/6KCkyJTY2p3+WYx/0nirAjDhaRb7p
         f1iWFQDOBOUyXIecMZZDUshvIQ6c/v6xn8RVviTnhsT5LgR3CAuP00d+K6hZ6AwJ4axC
         tjdKbNS6tkUgrqFjacVbMCScx6fjhOcEoFZ73zlNuSQJ7EA0WnMc8fiq3f0Zo2sxkJYn
         YvNG+hB/FXI01DzE9tXMGydpyH8zIgKXqSplzhJeCPbvMW2QjHN61UBlCaw2BIVFJgWf
         sP4Q==
X-Forwarded-Encrypted: i=1; AL+hErEE7YTesAI5gibDEH+ip0QneZzOEwCvJ5qC+BYROTIyqyTWkq96bY6ts6hVHQ/GQD1eOIGYK1sBi7pvIb0IpRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RZscXEzE7NhV7ApiUESSXxFHMtgKQ0vhHGXZP82y8ofMvrcvr
	9p4lMWEvVr8u4uOtEJ9tB4DTdLCwVJa2INMEeJwZ491KFF5h9DKbRv4iz7Z81+ZTEcPS
X-Gm-Gg: AYBFou02KFG9p2iAF5yU0Vn+VR8BlcdKo5cQNyLHPy1eLESjudw4KM3Qn8NJV+nadBe
	CTv3++zlks4XXAAdwBOFhyVcRx5FWsfR9XMucrBc24OtnawIi8wzJkSzKCf6weeaWbEjeMwoU3e
	Ckox0oLuAcVp1cVXy7QduBHAposfHpGhN61lPqy9fttT1/d7PmfwQCzGAMKO7ELIM1zvOsoJfSa
	RUezzi2fJicZlL3XlQO/1BmSEDU2aKRdzMcefHI2mfWVCj9pM147nsoH/FE0C9OUa9K5JUcWWWT
	Au6ZRz8a8FCFWx2gN7yybk21PTX+5WRrSUt6ec6Asw8NkjgpU8LIXLyOcu8PNA1lHZJAN7F5ey4
	H5/gzqFDcetEUQQAVzITt85kU3awqt2KyjqkPMSMKP1TBXbnkXAeihpnjOYS7VcC6Ppj1wWRdvd
	9qu0BvIp/tOEygNJrMunj1U4IhJjnUsP6igtQ0Zvs4H/+VoBG8tsxI5ktFUMXGQAthIVHeZuG9q
	AB4DVWNZ5qMObJrgYwOdefRuLoz6QrS+sadZV/KjzL/VrqK9XqdWBk+yIZbVr544K4UufiawStK
	Td9O2pQrsbVnM7BcKfZDWo2GheqdQxZ6uAcgKF2wTLUwokKzZ5n5PlzKnLIy25UYVlnuN1w58/o
	ubULHykVwCw2V+xoKz8T8AFlFwrjdXnSYXYn/yEmf/xHydRBO2zYJcKUf
X-Received: by 2002:a05:600c:512:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4bb55a5aa47mr209766355e9.19.1794904086313;
        Tue, 17 Nov 2026 00:28:06 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm74782845e9.8.2026.11.17.00.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:28:05 -0800 (PST)
Message-ID: <fa0ce0f7ecdbe91cc6773bcbe86be137d2129944.camel@amutable.com>
Subject: Re: [PATCH RFC v3 21/44] nfsd: use fc_init_pseudo()
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
 linux-kselftest@vger.kernel.org, Chuck Lever	 <cel@kernel.org>, Chris Down
 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:28:04 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-21-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-21-8cbbea1cf34f@kernel.org>
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
> Initialize the nfsd filesystem as a pseudo filesystem. This raises
> SB_I_PSEUDO and also SB_I_NOEXEC and SB_I_NODEV. It never holds
> executables or device nodes.
>=20
> Acked-by: Chuck Lever <cel@kernel.org>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/nfsd/nfsctl.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
> index f32311f2d7cf9..ce2666deddbd9 100644
> --- a/fs/nfsd/nfsctl.c
> +++ b/fs/nfsd/nfsctl.c
> @@ -9,6 +9,7 @@
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/ctype.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0
> =C2=A0#include <linux/sunrpc/cache.h>
> =C2=A0#include <linux/sunrpc/svcsock.h>
> @@ -1375,6 +1376,7 @@ static int nfsd_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(fc->net_ns->user_ns);
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &nfsd_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
