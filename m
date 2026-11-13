Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564785;
	b=iHAt+PoJHmgeREd+/ZR6SHkil2sHcVkpAB0fpK/7q/D7Uiw46fwlyHD0VUDyI248738o
	 Y8uMVXjlCHeVBv0iYhTJF4/afynOoKj95ZsUlKGAbtQh/5QoH6bQ6Oy7IY8fXy+431o7u
	 WPOdbuJG3PggU4kjrlCU/7qFNa9uTZNHDSBp1A8YQWFWrX0zQMHkH4zlcAqnK+yf73sqv
	 yQ2oxkkZW3WBXsALmuTX6qs+oW0H8gH2f9RrH7LgESlPFa8lI9Oxakckjjx2j2fS5Dc7L
	 dfOeAwStIX2+zx4evRFTAyqeO01Z9QHTgTCg8tQspM3h348ken8nD+Rh5W04xykcLrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=PGZ86VpI4/X6bkLIqgY54HnsW6MSps296zHbeFwxlLU=;
	b=D35K074gmyaViegy56G/oH4kKnEGF4mFbOg3kCft+hEvC8iv2vCv9hZclMC0jSLmZbtn
	 Z7cfmBaLkFZsbMrak3mYKFDs1jsakAN6D6tjRWDdia761SZQVK8y6Rcsy+OJfn/IumfZt
	 QN86grbLGma1+V6ucq5/Aac8iVjNt9y/PaMebD3CYqdWJWrnGnbZNmOltTN7R16wmJu58
	 tgwdXaTDJtfAWPb2o+niI0UK+keDyfoeSE7PJIGL5sdYeUIZmj1LNn14f+sdW4bIhH760
	 Mk9nIrg/cLI4BG6p8BqYYE7NEq3Y33lbqX6hunwhkPUO9j55gtdmzAfANCWZ0tLv8lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qhgXZLcH;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A575606A33D
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 10:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A575606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qhgXZLcH
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so10467115e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 02:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564783; x=1795169583; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PGZ86VpI4/X6bkLIqgY54HnsW6MSps296zHbeFwxlLU=;
        b=qhgXZLcHEG/xp1ftPxi4Y+VtkR5xPsdZusiH6E7v1UVOpu+pQQwW0vkLZszWZiEzcA
         +BIaLUI7scE4yUL73wk7QDgrWayWPrLwdz+Upaai9wvZdfIC4mpAyM7/MboFd4cm+sgl
         6S6dsMSsgGsAMWrOW2SdAqPT3x/sY2fNDxpywpmU57N6cPKU4MQNdvXTLk3fPNzTNPjQ
         TN2vMd0rw8z+5ZJqFwtlFaNorLJKFpgZtePYZzAG9uux/UTV4iwPxrV7Aluh/WlU8Te+
         mKwCC2bzY5T7ZateqcC/h9wnCcfLq6dmSfmWCE2kpyRSPYXephvqiHzXHW2gW5l+Jqy/
         ZrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564783; x=1795169583;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGZ86VpI4/X6bkLIqgY54HnsW6MSps296zHbeFwxlLU=;
        b=BtpCoOXLMTHb4puiwg4sqcvROe6ZP9GNqqfiWXLm7PI8JoxST7gwidioMHg1NwHM+2
         hnnRg/NjqDS8jt3rVyMEzToqXMc5KTtrOwZbafxEnfJ7o5z/1CLqqOsTdjFTUcuwCWGY
         RMi9n5nK0ZNRG2ixCXfNlV4ygO5jsotpSBALhtHOfWCnaaX6uJbMB94FDuT49Cpx0X+P
         uBl7J4TF0XFf1JCsx7OmsftT31mYRluBRZhBLlL7Pm+fVq5M1b5XQYrqgg5jbWHvtCdS
         mWP5EugWJdTrczoUgYicD8GXJedqOVBtLqj2EWq8CNCuJKJ+8ud6PfdD+zIBOtinZuvu
         8vRA==
X-Forwarded-Encrypted: i=1; AL+hErGjZ0jG96X2wYkbtfoN4U0I8Kp8f0X8ioU6fWBe0xbXON5DFneCkRpRp0tttlE9eEWJxePY8WYqky3g8eb9GAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z92+eB7rMEv/Zs8PUY21u+AKRhbK4uabSjyeHlidN2TZDvoyy7i
	cjUMjCb1Vl5b9yv33hhokDGWlMbYHvysrkPRCuIcy9ppsNGDBRHdZtpGWgmV+oT/GrNw
X-Gm-Gg: AYBFou25VlXCN6+3xHNuZHkey754zfv7ca6peeFg09YrQzMRoEtdMZQgru1ufD7Lkbx
	QhRXV8TWjGhKvfwRakwq2HmiJMwK1nn99xs1CkX7XJVLtt5ztzNUGUehAF1ilRUQYbZiYuqm5d3
	XBIc+ByGNDlS35y8szWiVZ/btadIVFt5MDzm5BeyAVCkSxiHWf7jK0J+kysgkxhjlLDbBOsLYSQ
	fmtoKGR031y5iMcJddPWicrrgym5juwCuixePSOVCuhFC6McNH1Api+X+X+6RmoJp5UKBjj9loK
	LaOCSqS80rhJlWjR4Usj/Nlr8buGdFL24EfiooEgksP+NVe3SP6nFgYewLwAC6876SFBC/PRTpP
	EGMGTVNDBawjwxUafrLdgFE0bfqdrCMg/1C12VA791se/MCs6E7DlVcb6nmuaRIzb1LuTsooKBM
	d7gZwIfhys1GQiUify3JaNrWfTURhlYYVbGyA1ho9NCf7beAhhR6UvtVCHxAs82VXXYQgPzQbP4
	LlMulQS5L1o6Wzxk28JPZOn3WevRdH1O6dBwtae8bwl4wTJyjAJZuZleNqzXiCbZ7Jg1inaIRbg
	LAniquOdjWFKrIc3VqC5a08sVhWcXqyp33Zq7cVnbjaN0jn33TMTe2sa1+F0byCR
X-Received: by 2002:a05:600c:4f90:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb55a47602mr36814615e9.10.1794564782834;
        Fri, 13 Nov 2026 02:13:02 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5d2872edsm4056955e9.12.2026.11.13.02.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:13:02 -0800 (PST)
Message-ID: <94dfa5ec75f4479663dd79f3ce05c1dc6c080185.camel@amutable.com>
Subject: Re: [PATCH RFC 22/41] sunrpc: use fc_init_pseudo() for rpc_pipefs
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
Date: Fri, 13 Nov 2026 11:13:00 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-22-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-22-4c998976c6c7@kernel.org>
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
> Initialize rpc_pipefs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. rpc_pipefs never holds executables
> or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0net/sunrpc/rpc_pipe.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/net/sunrpc/rpc_pipe.c b/net/sunrpc/rpc_pipe.c
> index 9d349cfbc483..37277a6d2415 100644
> --- a/net/sunrpc/rpc_pipe.c
> +++ b/net/sunrpc/rpc_pipe.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/fsnotify.h>
> =C2=A0#include <linux/kernel.h>
> @@ -1181,6 +1182,7 @@ static int rpc_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(fc->net_ns->user_ns);
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &rpc_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
