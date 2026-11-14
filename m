Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657339;
	b=t4u3RuOi4YQxr+Xmt/ADF5ZkN9NQcNOA8Xbda85t62jJ8Rlemea2OSc2JnI8DvLDvryy
	 ZFBjJWUI06jVWsrOVsAQ3T2wIxh4Z9AwFOaE8arTmYr002aWPIy4or9lnZmEzskhGWgzX
	 FaxKuXDEbacqvS3Lh3l0/LqROJDyZgxrCs3VThUOhwG84LicCvsXFaXBX3x4XFF+CCUP2
	 CF4zRlmV6/JHiuV0+RrlNGb/fvQrmCvKfIl9nT84JZqekQmB8yQTKS3HHmBBAstpl7wEc
	 12558Uwz6xJo8ZZQ8/jVxl/S967QSJ0zwlJCXEzPXHqDXRXauUQBi6XGJdEHGQFmy1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
	b=RrM7BY6oNQSX1MU60poJC1aC2s136a+yEOduFMpe1/Zvk1eILzGqrRIwQkXkiZxbzUHd
	 nQAql9ANDcWg/qd0ox1+MK5VzxU55+luQnB202r127vomsdjoUEKyLIj9FIIJohEQZq+0
	 uZF/HO4q5wBt45rsRmeFP2muC0FyL/xTMEawBmBn7nm+hlspHXqtRmUHFcknFrdwcu6fF
	 ZsdETpgfmNlYZf1ZafjkUlcp4I5qSwZNRasdJLa0jWdUFGpJafC+H/mkToZelBFBmyyeB
	 Yzb9jP3eR+Gx00lXb8c7xA/2ChLn+bjdeD80fCr4wV48IUMd0bdFihPoF0CMF6W7lZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrTBjpIE;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E38606A33E
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 11:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E38606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrTBjpIE
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so3261699a12.3
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 03:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794657337; x=1795262137; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
        b=MrTBjpIEXzsSZaANjc7oExJhwGnF+j3pBQoJGLV3AozjECewWnT/dOn8PoCfUIeYGI
         mRgldWBhVoyoY4kjpOu/TkcCPMpetn8bMN74Irqnk0JnK5MAQS777TE3iVfENO0qNvUE
         8qb82pxhdLikkA/6tATGUpByZMee1vHTbdl6A6vtosorr3+hE9wD/mpuH76lS1WAZqyn
         nUdTyabyG8UAyWqGnpYJGfY62DgpvBldD5kNADP5MARyaYxmHHJYDsQkr6qVKrnaldzF
         KHIyaxdpU8Pcl80WjVwUUXXw+yU81KD0D8RdN7wE6Dhf//BzElFXAKq/AgQBu3vGzFII
         7JmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657337; x=1795262137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
        b=ZkPa2P/A0fgdRHaVqhRxpw98ICG1sda8uZqh1rkdrLMzAI2CFfQwLI3kRR0WgQSXD6
         k86vWsROkg8uFxNr5qNa/OjKJepVtX/ftrmxQEaQuZCKCwk/AbC2NaCuEsHTw/Vwtspl
         o5XSYXjtR/Ov+RA2VIbq5HglU6NaLMbGeOo8l+7mybQ65mL62KwdAZ4u3cGCm3ORHsJG
         dEg7RXLi/BOVfOMYi0Icbsu/3a2BtH8n3fM4UpoLacorNo2J5yADkTDPktpgMGjxK9Q5
         5hukWxgQNqjpumq3zPM3HfENhX483NdXSYeRDQlIi2pEyxg2vr0E5YCitZsV3F0LXA/z
         e22g==
X-Forwarded-Encrypted: i=1; AL+hErE0wt+wBYF6SjgUk6l3XWlsoQ4WAfHhu2P0GT5PlNmJzd+lDbamICjsOiN0e/rlf0KCN2BpqtT2k9X+p7DSSUM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pXGhGiHOaAOlC7c60uiziYd9GZNa8yg4YeQ27RNH9DWXqT8MP
	GM5h+tT8/XSGSi7I2HK1H26XZthPgqj9JuHwaN9M1TXghnHAvd3GF2Rg
X-Gm-Gg: AYBFou2TU12hCHBrdEyILWHB3bPJbutFYo3NbK1iwPqMY3oKC1LIi6N38XuuBrKW5LX
	FewVTLLuH74FC8nHKTT0zbYoA/BJg65rwwdKL5BVGxEi1GcQUCKGpje9zse9xwvwbE1zG5xhj8h
	A8+kt6rk5DyOsCaiVuOECr6I0Sxcip38yHMyzjFX+P2biT8smqDWTgFD+Jg1VPRb9wCnymD4YkU
	8OP1iS61zcXy0Qmi+LJTu7dJK4Bu50cx3rhHx70bkQQdZEQPnziM07vBfc8Y/1p7PLIsymsYZ5o
	pS+kTTpqptIq7k4qajFbGG+tFGyxbj8Mja464o6qjcv7bhS5AxGchpT3Xy7ze1XKH6JG8y0rsyH
	wFAY6CMjw0W/fdt16veO9NY5QKCIDiDHNPGnzHNVuDqPPPQ+LD4ShnN+0tvvLKAMR5MPILrt/IT
	vcYhyOIQaoxNhg/oeQp9EnrGHBp/jJl1hD9kuTwzeKtG29BlLN8x8409EgGJwrMHDgr+6JhneBX
	Ae8pfwwv2tCl5zVGiap+us7L2q5c3aeGmfTXUm6ZbBSMW1t/OS2bZz3rnAugRJrNw4vAyWIHn/k
	m+kmCcUK7SLARjzlMSgm7Yal530XTJ3q8COmhn8uNadjr1Lmt0bSuAoLObYDqb2FVVL0S56HOyp
	CyTbsqBhmE+Q=
X-Received: by 2002:a17:907:3e10:b0:c40:231:6eab with SMTP id a640c23a62f3a-c5096370c31mr441592966b.16.1794657336589;
        Sat, 14 Nov 2026 03:55:36 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b41f44sm206223866b.31.2026.11.14.03.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:55:36 -0800 (PST)
Date: Sat, 14 Nov 2026 12:55:35 +0100
From: Amir Goldstein <amir73il@gmail.com>
To: Alexander Mikhalitsyn <alex@amutable.com>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org,
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 38/41] fuse: refuse files on pseudo filesystems as
 passthrough backing files
Message-ID: <avhMN39TECaur0sS@amir-ThinkPad-T480>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
 <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
 <20261111151202.GA11391@lst.de>
 <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>

On Fri, Nov 13, 2026 at 11:25:57AM +0100, Alexander Mikhalitsyn wrote:
> Hi Christoph,
> 
> On Wed, 2026-11-11 at 16:12 +0100, Christoph Hellwig wrote:
> > I've seen setups where people use fuse to mediate access to sysfs
> > sysfs in odd ways.  No idea if that's still around, but if so, this
> > patch will break it.
> 
> 
> Oh, that's painful. Do they use backing files for that?
> It's a relatively new feature in FUSE...
> 

Very unlikely that they use FUSE passthrough and if they did
very unlikely that it would break their filesystem.

The API for fuse passthrough is that the server requests to setup a
backing file before open via ioctl and if ioctl fails (as this patch
does) then server falls back to non-passthrough open.

The ioctl can already fail for many reasons such as MAX_STACK_DEPTH on
procfs as the commit message says, so server needs to cope with the
fall back.

Thanks,
Amir.
