Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573510;
	b=1VZAcO5X4hxBmM+Jm7g+b1FYc3FLLYSJx6MPH4enU1BN7AYW6aBG8guunM1wdXFwjeVt
	 0TVNGKHxj421Jl/KPwZAfxXNWXbxthmBjLPgmVskWpyNNkEszWabYKrd8k6DVUhW0ORtM
	 NaQh90AhHIoXJuXOcF12QxYLutRLgqR53IJCVYvT2ziRhk/x4OOTbaAM0VnaCUus8RgKh
	 GFKDSrDbc+3URzEyXc8hBtu2k6ibpUA5atgo4NM1+/e8DOl7NT7+/7wx0fn5TuyRVXK+f
	 nyLnCdauP4/mosuk71dG25aH7yK/j0hpxybAt/W6uBs7CCyFEFh/1i0560c/VjD+wCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=Ny+1veWg8VD0eIDxFJ1X48Kguf5Oe9PbJZTpbcgMiOk=;
	b=wVhyzQ+CQhnEMh2voDZlqE/2oPDbYH2tt0f2DdI2kd7/Uv+7ev+F4VdBSz8Q+m7ofg+t
	 A1TR6pPw72Np2F7p0n6xIkoyCuc4O9R6iyYwnHlXqku5jf2lK9xg6xWEcr5hONbH3lDjC
	 nCSupAyQMLR30CB5ZudrWZ9p+UumUpNCY36AuM70HL1YFPCFqZOGF2T2QPcxO5ujXdAZN
	 GrPMdXV5EoNZl0/vLTz+LyFPP8KSphCy/ozEWkFBbNjn4lcc/XVe86yD1A0I1bBiDDrWX
	 k0JEjbO9SyNQuYjFdl6YqGTsaf/zMOYFDHgee/SujazqPPbaRWDfYlCOnf99lux7LxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Bz2+TnPI;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78B9606A335
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 12:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D78B9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Bz2+TnPI
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so9108295e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 04:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794573508; x=1795178308; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ny+1veWg8VD0eIDxFJ1X48Kguf5Oe9PbJZTpbcgMiOk=;
        b=Bz2+TnPIApHKvsf08kyiSuJZ5AWViHONwTwuNXVAuo2u8JGXjKnEoxSd3hG/r/h3b1
         tdsUEBtaZSOWfU3+mD3LjyqvBKt9Vc6RBsvkZZTD05u5eCDGhnWto1Wbu/C0r64DVVdd
         h2TGnt6meedDH7Iwjf2Hw2JxWOY8jwAvEAcAC10FURsf5jjp4p/KJzFYjzuPwuYFNKea
         Iij0h8HoPs5opXKf2XwMBJpd5hsYSV0+BHP/DvKdCCgwNFtbeIFAwqDf2ag0NBOCbqs2
         OXWiZmXbdGCixyOlqQBMgrkFkrhg1VmbSdmvvBdeQ4Vz+QMvhYl+k9AO6FJ5UW1pg6b2
         DVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794573508; x=1795178308;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ny+1veWg8VD0eIDxFJ1X48Kguf5Oe9PbJZTpbcgMiOk=;
        b=Il/Z+DoDGmB+oVq2CG91ZKGt2dvV1iSaYinwlQsOqC4bCqaE5SQCYW30V2yyUXRudF
         sOzQn+MdIlHF3JemSc6BLFP70xmdUcNNo3orYXqTsr3ejr4ea7g+5oSgqpt8F4b9ALRG
         mpHiG3UqrGv0wOo0laZ2TBCn7xSsTlkq5ZB3+vAh3NC/1Pv0t24e8xohzM0bA0bgVVBK
         1l2eUSB9md94TnnfBYkBHAr4NAKG6WvTptTLpdrW6BSrCuz4OjYzqJSKmzW+eXvxHtkz
         q1S+BWX9aIufQe5yLUE8HY19DdOVY+E8VJvVcOhQC9Y2UCAuH6Y1bg8aCTqMtG6TK78d
         xHPQ==
X-Forwarded-Encrypted: i=1; AL+hErFvRZ20mt9/PXug5s4VzBC2kuDGp8N7W6EzY9Ai55iRvSv8LaaJBq5Fz/vWajRj+noSAYVfu72u+Be/OXfXITI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8x5JZes8nZE7RYNsnZpLxj/I79RMWknXz2pdFUpa+4ebTffLeY
	PZ8whshRhAOzD76rGdmVZ8JMcLHnRrGvfexEX6idt1YxyBKMXu8srbtpvpKslUswbiGK
X-Gm-Gg: AYBFou01FMTa4GgSRwxUTkZ8L4soKhQN8/a+H9S9e/SgC4RcgF0cCnTomxqvs0jlqy3
	IPvQkNmHC/+UuSiRSTpMySLsV0MoWttqcv8DLYvPxjGWw+SYyF+p47sC5AMrzw4fhwh8DWtlnfT
	FyPs5htnkjbLrw8rQVVfsMNQHnlNmkjA4NThN8s+fnKLcYhocQo00OJXkd6kpKnPcmSaNO+/Jkg
	5136hoOrOD1CjcbvaDKQZJafL4Nv/crHflUXd+nSvMzWBwSK5ZRIksU1hN85j+qZc1Zl1RoADWT
	3YMqour8VL9r68BrZVqeZ09lW76DE9WZJZRr1MrsCxEtkJZclsN5kx6kpaqCFWxHqT7gW5nVAF9
	jD+nNqXdgF+qYKm1EmNWRnPa83eNhYusE284R2c95Rks9S85U+YvIUnmDPdwwrfaTUTkeMsENFO
	hjEc6YpDUAf6Yza5RoNo4pT136UGTxSQbznmDcR27bmQSnQTln/DFCiexXHFRzqxnmVPAbKX/LB
	uQKYsOJB4neuBBFjmkQJD3aru6yWMgjnqndr9IhX57PW+VJJpRxZUEbCbVXhlK+VS4bwyY7MJta
	tcN6tBNWuu6Jo03WjuMjOPopxzzv5pRMlZ3/0SzB5ZIrbeTUCFMpEReceH8mV3M=
X-Received: by 2002:a05:600c:a596:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4bb55a86fb2mr24790785e9.11.1794573508217;
        Fri, 13 Nov 2026 04:38:28 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm48348475e9.2.2026.11.13.04.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:38:27 -0800 (PST)
Message-ID: <28a33fa649dcaae2eadcc934ec49fa591ec1c283.camel@amutable.com>
Subject: Re: [PATCH RFC 20/41] apparmor: use fc_init_pseudo() for apparmorfs
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
Date: Fri, 13 Nov 2026 13:38:25 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-20-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-20-4c998976c6c7@kernel.org>
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
> Initialize apparmorfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. apparmorfs never holds executables
> or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0security/apparmor/apparmorfs.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/security/apparmor/apparmorfs.c
> b/security/apparmor/apparmorfs.c
> index a99366467217..351ea3a7120e 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -21,6 +21,7 @@
> =C2=A0#include <linux/rcupdate.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/poll.h>
> =C2=A0#include <linux/zstd.h>
> =C2=A0#include <linux/string.h>
> @@ -263,6 +264,7 @@ static const struct fs_context_operations
> apparmorfs_context_ops =3D {
> =C2=A0
> =C2=A0static int apparmorfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &apparmorfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
