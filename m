Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686759;
	b=jfw7oym7hlsIo9q33zYt43iQYKDo0ldgyOtMaxIQSanxqS33pJfidRLGlR+fAbVPlp2a
	 9FWl85e9gQjjov43Fa7gHCvTnxtFwkZz9tiL6DUD7Kq12zxCGtgGRvTF/3zVGtNxVZ108
	 1E0dHPmS0H44E97HiW1UtuDRCmCJqHi0h7mL0+ZPA7ywAKRRjggqo29o6c/WDtobqkAMK
	 uLo0ZycTgLUJlWNxazosacxePgQtIsm7WDgQJMJCSbufN0T+yQLV/CpiLMYmTruHNktl+
	 ao5l2XvfEFX+Ry32/7R3AR57yn6xwsIpACFzlMfX8vsLyA8jQW7VZtXwGRWQfnhCpsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
	b=E+WG25Gbc6EIxrHR+QaPXhw27MAlQAD1AuUETO3W+SztW5AY5/bQd7yXOgJ4IwtTcd6F
	 JES8VmL/rQkrOPmrfWVhwKJ0WAGr+C9yKH6j2IRPmMqoVErWaxIzUe6KMFxIrJM7v/uoy
	 W9U1PRdAz+V62u15VL+ccHGMlAlFk82R4nlo8NmnYvPIR7SilN+LaF74J6u+Fo+MNdnJQ
	 cHedAzxSPuIeu3bV9cq9sIDaJQ7wo++wILW8TPSZ9CigeD+/ugB9PJRm6xSawmCMR4cIS
	 aHQJFVyy4jrEZ6AgOMp6Rvi7axN3zYxCz4so+cqVWuOd9rjLo1MX6oHggKq9KTAhijQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=t4xxtvlP;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C188606A8BA
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 20:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C188606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=t4xxtvlP
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so814321a12.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 12:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686758; x=1795291558; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
        b=t4xxtvlP4RAICjpBIWPIkESb6EJJVOcRd9+LEytv251d1ZQsfD2pYblwETMOf/zroc
         BDzAo5elUgpAiRA0oYEfExHYSjjGywxztBxThvGs665InMbo4S8LytfXKr2B4Cw2IX6x
         hCl30XcWjOl3zGKKK0Vny1KN9lt2zjyLiPz3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686758; x=1795291558;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
        b=IWHMMgyrsfxUpEjPaDijh3BP7HDWMKtEDgGZFt0sktQod1iXHzfSWAgUkKoWcrCUZQ
         0ihDIe2J5qcjMZMli1S624wLGgoCrFwjT6Pj2aF+4iem8Xwdhjh59STrLI9p/o7EU93Q
         cSdHPmLzVyKyqi7V7uDCCEnp2u5iv9mEnc8h2gh7/FE2EDu2KiCEtYndsOmQzDw1IqfK
         xSeAqhK6JvKJevUgeUObq9vBZcZk5qEz2Vlg6NTckvbPIPi6lUjQuqX1oYacqXjmCjzy
         sU6jhiF6lzXmxuIt6OU+kus/HPN98Evr+Ei1HAsSiGJRxIeHXUOtVR9bMIg1m2U4/lFJ
         mGdQ==
X-Forwarded-Encrypted: i=1; AL+hErGclST6jzaP7gtetutrt9DYStdRWbekQFQ/RACHQdkHMkI/XpsSqTaDVzeYTMRG93wBT2UWHxx8E0o5PCNndIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OYAAAjx9emjYwcQF6Mkxd8oEHPZZoAMaFiReye4H5dEo0/yWM
	nZrbMu3LQaFk6LL8GsJGFJf0wAZsVmU1Az+lHupSpQkhU7MeK1wT+b81vfHs126+W3k=
X-Gm-Gg: AYBFou3p4xJmpCxRfsN3733bJCwET56fyLziBA562Ykmpe/zlwt2+1DWm443exRHKhD
	CxrFNRyhvoavGzjEhLDIdds3mfr++2K/5Bn1PTRZ3AS0kqVQovCMied68x8gfQ3lrNQ1Ez+f/FQ
	BkBSuGEp00amdrq05rXoe+nhrNy9EYfB2cB4tXNacSZMxiQwCgBVw4Tirgb5GyBcbngI/ja2mBo
	hL6rbyAy+CxBFcI4a4lQ41TWmU6/VqFPEVW6YJshvrZ1mR1TsXhcr/cmTBCGOuiTyKmPi9p6315
	4sWZG+1QQYKRrYsOazA0SjcJ/+4Xo3VUlHRe9fBMzic9nA+AACTgmJtQHPUTQEDyQEKDXx2l8G7
	UiHhidKBQE5cekmEsqmtkeYzciGbVt48T7GBqyrciphy3qK5WZ/7n+zxs8DvDR1WlNZB6/dDY5L
	aBK3IeqhWIHus1i3xP088mYOlrJ+2+yGf7kgT+wnKZvBQUlrnTb0w53R2/dXRQV0YVahESh0Yc2
	fOZe94xDe/42Y2hl7p+1jYUfcc1UkWOnbKLT/4pPQabTEQc3EuBv4+t2kGNpjYv0jaxswzCh/pw
	LkKCCWoJDl/iUTJRTDL9IIY1GmSqIQ/SxRMssIl/+ZFwSUVV1eXy76GH20tJXVX9kdoonDUo8K1
	OYk+QrWg+BhXCc4Sbq8WIetscZlqidCHb0Hb9Ih+pOtU2sOTOiBLM0JD6kTPJCKxMK+bIq0xGJD
	BrXKWTR4NHel88xx+exLyCluQ9iuLhfl59Elay2UMPsRgxVm9xdxM0UgYn
X-Received: by 2002:a17:90b:3b8a:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b1b0b5f2c1mr6192503a91.52.1794686758572;
        Sat, 14 Nov 2026 12:05:58 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b266d873sm4654869a91.1.2026.11.14.12.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:05:57 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:55 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	Alexander Mikhalitsyn <alex@amutable.com>
Subject: Re: [PATCH RFC v2 17/42] securityfs: use fc_init_pseudo()
In-Reply-To: <20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
	<20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114120555.cbfaf8ab8a92fb25@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Christian Brauner writes:
>AppArmor puts a .null device node into securityfs but only ever opens
>it via dentry_open() which doesn't care about SB_I_NODEV.

Not a big deal, but userspace can see that node too, as
/sys/kernel/security/apparmor/.null. Opening it by path works in current
kernels and fails with EACCES after this patch. Now, I don't know of
anything that does that, but selinuxfs gets SB_I_NODEV cleared again in
the next patch for the same kind of node, so I think we should do the
same thing here. If not, it would be good to have a line in the
changelog saying that opening it by path is meant to stop working.

Once that's fixed, please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>
