Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904110;
	b=gHlECTNuLw1M4pa5GrSIW54TVgviTxBeQU1BNeWXmAiey0dio3dCmYNAxdfKZ6zVGGOR
	 Ns36BhpGxxFN8RiUtjyQ3fSoR4aGtw4ILYFgFuDkIEo8Yy48nIwvL41ALlEdyJuw7psXf
	 JCVzEp3ayup+kZ63/ajR11gnUxCVJPi4YdqouwtSWw6u1MdhUBl5GUiN3CLRUJL2PpuKb
	 6+Fl055bQGYnrUNqhDaTOfDV2VNk7+TI+x6lAZtmBhL3L6sVBiyTEKgcgoGes4U7sFfqy
	 DIrFPbdjEp7SCi43wu54f/XgRyCMvuqekcS6PypzL/AiyT8k0V2Dq4O40eMPWoVokeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=80nJ9mfJsz3UGKSZAnLQ0A7kD85nyx4H/r5vYSV/3QM=;
	b=TKK12LoZrFF6FP1yGzMTUibLR0ZdzTleRY1nHhjQAJpOBULw+f/UlgYW6ChL7y00xBIj
	 OREPRgi7XuxOAYNPdI+fznA8ZFegUGQS75Lr9DWdNuF5feZf9MBsnz2I06vqzt/w3i6jW
	 QK705GinotqXRze2pqsyX2/k+NjewQps/5RG+HjP8+wZSScfeMh4+CeyaD1qDfybn1XBm
	 9Lez6mUxrI8T4oBYqDF7wRvao2dW/dBJbY2oN2dqcE/slI6tZph0JRTxRNn7urVqjnf6M
	 FUJ7FGnCCeigweS4+RgN3PJe9UbRszlIxZp5v5IdoiMWFIHE3e9mLzExYp0h9F7cTjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="lDHE/E60";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9F960A2603
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 08:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA9F960A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lDHE/E60
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso28247905e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 00:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904108; x=1795508908; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=80nJ9mfJsz3UGKSZAnLQ0A7kD85nyx4H/r5vYSV/3QM=;
        b=lDHE/E60fAF7y/GcfWe7zssqpibfABjaDWc4DbPAbANFwY7mipSCQzk/tGna/Yk9Yp
         5M31Ja6Q4S90Eg4jWdoE2GH6TurYV9Y9Yxd6SoBGFySZlSGgcD3Nf8Ac20Morq/IEeLi
         HZNDCkpilOoqmPVEk/N5paMQG+RjNO9OhPzIDtVn6k+5pNMY8rSlnV+zGCrptyxwBw8i
         uHdMwH/Pby0zhrQLCKl2b6izfUmExSZrUoQCnWP4NFP78u9vhGGyVwUcvE3no1VAV9ln
         DDlxdlg3j7mlBLcF1wQFzdXfstbmRKgVspXMjOajtHMeg5NsSNAba7k+RMZ1HFntU+s+
         8A0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904108; x=1795508908;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80nJ9mfJsz3UGKSZAnLQ0A7kD85nyx4H/r5vYSV/3QM=;
        b=ZSl7UMq26+QZb9sZUDz0NIzfMGmngSqtMXBDEwN8KvbtydUcg/yHSPMSENNnjse238
         c6JGwjIfUnAp/j8cGn4l7/xh1S43WXkWSTYUPqwpdeFSLdBIdGPOulO11LOZbF4Ra+Gr
         UpRdFzMEUWfZTF0s1K5TinwW0nuDVixo3SCAVT88L5OQcHKGU2q0q/q+68fK47tyfcDO
         lbj7u/Mp9YOb9Ul11nhbn2J6lWvtlYpPZbjGEJb23lNrg1Mcj3rW5AQHPKx9A8qzcqYD
         BeweNRAPvBoR/gaNT+Zs4fJKDp5HGqlXfMvEmeDCPtOvyo8DO5nU6rznN42nUUgg1Df5
         Pz1Q==
X-Forwarded-Encrypted: i=1; AL+hErE0Dj3EACoY8KF1klSUHwvaIN/rMMxU92UX/W/ad4+FzczM7C5R6lIJz7splXKZMObP8Mzvi20YQsmC8WUSwoI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7ridrOPl0xkbD+2ilh1Q8LB/xUqoy9ysPsbAYK6x115g1HkbS
	N0BMvgZp5VpDXUOfErKSuAqcTLaHhYgu9f2mjpE5I6WpEj2LJ82QyfTeK2P9q2HCzz+Q
X-Gm-Gg: AYBFou0AhhKBb/zdCw9A5KpAAjw8L1Cwo/5RV5U1+neANUoNY/Mxexpni57uAtl6gdI
	cm/WRWaZQuK/Hczzt9B/KQtI1pzf/vZplx51IP8KuHRWCiuiYMNhCwW6ISPOLIfGQdSSXZ4Bs9b
	F6Jz+nY6KhsOXyxWEPwFL6oc86oWld6+aEWzWa2/r6cVvwCxxQoB/AaBS4OLdIbNBBmJhKmFANh
	kt+TY2LcdzhoDOK5rW1lfkZZ7w8DuNYXlVdh1W2I2hflUZWkyGHv4FJJmRMQo61bjga0czCzZKt
	8bsxEGkmvlBBy5FjCvA6ZWAnYmNF0jTN8qa0wCoMYxXtZ8SHgoqzCzeR5WczrTQ5cv9lZUNqpWt
	ixuBFviCIO7tlOADcoWMm2Bkxgcj+kvPR/vVIPzKYBHcAzPybjkosxAlEdF7DJ0uSw+hiKqPjmy
	ejiW5VqfrADnHdNnWU1O3TUewEA0YamL1nRAjiUIKPBxJ6RuNioNHJ/Y8echrIjBCtPOUH6ixXP
	4PhA3jVB9HefROD2ITkzZMay9Qixf8Nb3q6MfBnBfKZEyosL5RFOh1hneVhGiIuW2uRbEd4BzQu
	8ZsFNDBxiTCF7PL34Zrs0fzMIvp3tjVfa8cVL4pViYv/yTLJ2Zq3/rGuGKNEzTkjcRXb+6B4yiv
	Gzx0DbtNDyLB6yxMoFf+x8pmqVE5kditSHc67AfmPb4iSWOJtRSmom/5H
X-Received: by 2002:a05:600c:6286:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4bb55a5d634mr255399085e9.5.1794904108278;
        Tue, 17 Nov 2026 00:28:28 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm75197335e9.10.2026.11.17.00.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:28:27 -0800 (PST)
Message-ID: <afc070a816e3ae5eb3c9e2d62d4f25c59ee61df2.camel@amutable.com>
Subject: Re: [PATCH RFC v3 26/44] xenfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:28:26 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-26-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-26-8cbbea1cf34f@kernel.org>
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
> Initialize xenfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. xenfs never holds executables or
> device nodes.
>=20
> SB_I_NOEXEC also refuses PROT_EXEC mappings. xenfs maps the xenstore
> page and guest memory through privcmd, both data.
>=20
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0drivers/xen/xenfs/super.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/xen/xenfs/super.c b/drivers/xen/xenfs/super.c
> index 37ea7c5c03469..aba7d038ed735 100644
> --- a/drivers/xen/xenfs/super.c
> +++ b/drivers/xen/xenfs/super.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0
> =C2=A0#include <xen/xen.h>
> @@ -80,6 +81,7 @@ static const struct fs_context_operations
> xenfs_context_ops =3D {
> =C2=A0
> =C2=A0static int xenfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &xenfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
