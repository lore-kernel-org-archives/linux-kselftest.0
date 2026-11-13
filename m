Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573425;
	b=o9WXMU0u864VL9CE0h9zus8jLTdch9b5nXQXWOEdOLfJVyJNnh06f9WCDlKOWUSoGS4s
	 OEfp+X/g5DFUtF2gMNtDD8RfD/VJnw8+pIKKZaKD73GHsq7uXGUF1AvyqH2FtjEea+4wq
	 pPX1xG/PbS9gwamAWRQii8m/n1nrU6Jl+vSZSkH6q5pbXB1ny52RvSulf+WIwEtaDLi0H
	 6ZrIo0Rm5MT2509ZDxcWcuGJLxwi7iAPhjg0KodkR0SPzNKhOo7HzmVmVBYQGR/9L6C4Q
	 xL7am80QxqTE6oNPU2JlE9oQI5p9v7UiwO5qZrlS5aDqxd+Zs/XX0cfYmqF+1XSZBqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=87/Ge5NhXdmtGpcXCLUvnqWpWEAxiW5M6eWOW+m4zUs=;
	b=LarFRdrxOPWzHf1/LqIkzMw2Ebec3FUJcalDB4H58EWeqNgATGlQg0HUfUxb+swrZHKc
	 a8BckklYu1AOu3VgHusca6iWmnemqGaRFWdTxqTugJQnzUsz7rUpjnKWhy7hN50FIpU8k
	 csiSQN42UYBTcdXtcGTOF6OBOHqI/W0RLFpQsAh2ujdn8vTYSQySqEuuXi8edU0anpH+0
	 pdW6rkmBL6ftN7UiAHYogGhKbfaz6w1QH4zBKCMaO4XGToibdnlabGyW0S0U6oTjI3J6D
	 uYekUqt3oJ7WhyKRBWQ4CGX8Z1lH2QsHhfXVZ3qL0VWwF3EEyVAbiEKRc4m310wmR+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n2XPHptJ;
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90B3606A333
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 12:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D90B3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n2XPHptJ
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4a5f76661b5so3542045e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 04:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794573423; x=1795178223; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=87/Ge5NhXdmtGpcXCLUvnqWpWEAxiW5M6eWOW+m4zUs=;
        b=n2XPHptJWAiGnWBjuWK6g5NkFljgiKFcabC8Vn0J/U7Rs5oCxIs8ae//bm8icbKFtW
         GhaGag1Xoi7ZyXwdHESo4gzqQGVIFHJ4SWyDVffZrMrzihrR6J8Y41NroO1pUm4S3UEM
         GevRMV87lpSFNCzDE68IInZGbL5X+gYDk7IApotAPKeUo9xOfBbHGBSC5mcggp0KJBcK
         Nc+e1mR1SmgmgC0Frha4Bk72pKDTzd14yUseYASwtvG8qZfbG+gNn4GmoQhA8ODET64L
         X6SskqZIriPJvj35d5mhI8G8hobVKdLKjnxeG6bMHAYcCPTjUD9dRkaaJK3nWVTXV/IA
         bDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794573423; x=1795178223;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87/Ge5NhXdmtGpcXCLUvnqWpWEAxiW5M6eWOW+m4zUs=;
        b=egj+NFwnWZhcRILznAqk80Ld7EJGAqOT2XUl3Gr8ZJGEoB2uR9D2dh6t9q6GO1fa5a
         Fa2nIdwjSH2/PclGxn8VvPSK6quuxk9ft+EuKB5rOw5dyXsJtCHbvTCLAzRCUQU1T2wd
         Lfyfp0cOZ5oyVGOxBrlCkiy4alRpc2x+I2FJP56EsisNSWrVSxyXLTD98vuXXppXCsho
         zR5twT0LZZuMWoPuEJf+aA8yDlN5xiAoEqXIJXJLMeAytrGV/M4lvbbmbQ+Mv5zZ4SGV
         qftTVx9jeTGKpqcWlXzrAfpdGX9OsTyp66Fkdm8REVBWu/Bo4JY+nQvLG9lf5RAKM8PY
         Q5Pg==
X-Forwarded-Encrypted: i=1; AL+hErEIt9J+5rbNxKfTI/LykLN5JqJqoMaxBUsBE21hN8pTRxEQ7PNeic6Vz2MDM7UXJ+4m35+m9Bia0LWnVmZrH10=@vger.kernel.org
X-Gm-Message-State: APuU4Z9skGh7Jju5GJdZugRcRXDWuIHowCW9dLHKep85AO94HOc2XDRr
	hB1npHlfeI7apz4ikrO0G25VnBYRs1kfSka8iH+c402tYU2l2UxB9CK8fDes52b0dyL2
X-Gm-Gg: AYBFou2CoD/yGlJDwwdfKevZq0S7vbANN/B3onIWcKbt5M2Pj2kI5BOwnLmJh54C7LT
	6RpAiq8BN74i1gDp2Q7gi4GOlLtPoLpKSOPyF6d8r/tUvFAco81tKyNDszB73BcDr/fKDa4yKDO
	R0qDHkI4IHxF+SEY7AhoVmqvLzh2OuGknHOWfsBd4HPd+UL9cdHAbzl6Vn9au1B0hlH9ahxB3xA
	ldVx0nfcjUJMYsPOZBUyN8XHBg4vBypmRED4+pLCk07ge2e83vd54eNURRczTnw+168OcUXLLoF
	wdrCLGMtLnz+XVSbhxyGNPyDIM2GVFYEc7HKoOJdOhwVwoiEbnAlMCAKvLaDJ3FlOYS/4VaK2iR
	nTHwF113I5OLrNT6KinsAQSQT1kANwzfXwwrDIWKtq2vrlB+qxSbLiUc7GZ/grQn5QCxodb5alm
	ky+OhIuovTP/RhkPVAKsaqjVmDtjrCN2iEakydRsaJBUcBbqRg9+uYdmA6NDsg4J5iBPU5LabdJ
	RS/32XRAgHIiivXmuEBzpLp46Ec8MXvocsof7huYVKp+Jp9m1b5D+1OJEuKBWEu2/iDbjrxdw4+
	1bOYSUvaCQQVgpBVezRhcuKaBWAiNvtd1vIdpfzk6ajcUkBOmzZTDi+S/u6+r7l2thYqUofgxGa
	R/Cx031TQ
X-Received: by 2002:a05:600c:b86:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb55ac4030mr49782945e9.34.1794573423157;
        Fri, 13 Nov 2026 04:37:03 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2901sm57437255e9.13.2026.11.13.04.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:37:02 -0800 (PST)
Message-ID: <f12140be54ffc4d1e8e4026f80c41c75cf5727e0.camel@amutable.com>
Subject: Re: [PATCH RFC 39/41] usb: gadget: f_mass_storage: refuse files on
 pseudo filesystems
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
Date: Fri, 13 Nov 2026 13:36:59 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-39-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-39-4c998976c6c7@kernel.org>
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
> fsg_lun_open() takes any regular file as the backing file of a LUN.
> The
> file-storage kthread then reads and writes it with kernel_read() and
> kernel_write() on behalf of the USB host. With a procfs or sysfs file
> behind a LUN the host gets to read and write kernel interfaces with
> kernel credentials. Refuse files on pseudo filesystems just like loop
> does.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/usb/gadget/function/storage_common.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/usb/gadget/function/storage_common.c
> b/drivers/usb/gadget/function/storage_common.c
> index 75831f2c7abe..83683ade20c2 100644
> --- a/drivers/usb/gadget/function/storage_common.c
> +++ b/drivers/usb/gadget/function/storage_common.c
> @@ -211,6 +211,11 @@ int fsg_lun_open(struct fsg_lun *curlun, const
> char *filename)
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> +	if (file_is_pseudo(filp)) {
> +		LINFO(curlun, "file on a pseudo filesystem: %s\n",
> filename);
> +		goto out;
> +	}
> +
> =C2=A0	/*
> =C2=A0	 * If we can't read the file, it's no good.
> =C2=A0	 * If we can't write the file, use it read-only.
