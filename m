Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822729;
	b=ycgsqTIes9qf9ffpp5UyXKFQRG7t4YaVROpDphaLKcsHo8ALAtRxUUirIjMFQcSLE3+P
	 O6SxR3mW1Ndivl8wBOMYLauW9XewACckpNCL7I5HOinA9cvab5rWYFqj4708wWIoNOb7E
	 olBX/JVw+l2OJmYcknSbbgqOIXI/gToGtVK7CWH2RCbGiXwVPlx17sU04eBnVtbzsEsAY
	 S5z8qj7xtrjQJdeTp3mwe5JRZmsHDTUYSyPP37e35fBrmQJe082NZuEVrw9Yn9tynyYXq
	 THmmibw3WDOJQ4JqJl2D3KV+Q5Lq8eF3jyh/rMVljyH5XwwlWrEhgDqXsUTAYTcsxxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
	b=YKQCXjdjvMl5hIrWVtzwA+ZThnFUzRvg933kj6lTdJsFX+s3s9X0CL6hqoCqQ9w96E3S
	 wn7GtGkCq/+n0rbk5cRGg8t/p8WG8Bvt8K6n8xi/nlaz/AYoN4F+9KGFoEJwS3m2QpiV3
	 4QmWxHqpJTBbPWdZeeKI25HcRdhNMOr9AdcNB94r7FzFHFsd/PIovtgkV3O/tPi8njvtD
	 RzuzH5i6nuUB+c4inQ+JhwD27rQqtG/UCy9D2lWB9IW46m4qRD0zU3SVwkKunZvNgqMwH
	 mU1O8doK2wlTpeKtV0VQMQgWyUPhd/CuQF9pk0Mh093pkjhBupDmQrixQwbrOwR+Q6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fI2nmlcI;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC32F606FAC4
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 20:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC32F606FAC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fI2nmlcI
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c418e215671so166827166b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 12:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793822727; x=1794427527; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=fI2nmlcItpwZxqRsmDWssHJaMT2IN8dLg7E1xDQbx0Et/5dAwJ3lC+28bQvSn3TcBy
         jCCz6aP+hY985kmEWKQ8J3n3DZJgb7Mf7tqsXWxEtttRySDwTo9j3SEkofmGPUukuzUB
         aTxGLiQfrDGmJiexVo8c15QHheFgr9P51oFII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822727; x=1794427527;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=hEwxMfu0be5bPSUAhh68yyh8+m3ify1RISuDHCRJTGS/Gg5NqQ3ki3Zdfc5mt+a0Ij
         7kz/7ZKftvoNEbSWIVzypU0fMioplcLNXE5cSPGjQzDUmuahnBaKzOD4Y6dcrhfOodTS
         MlA1xyXF8zE+aHJfDkPkhqiJUWboFBqnVbeUFr8F10qkfpA9iUqZufFtA8zDgCZOV5Y/
         Nt1TIKGY+EJ9KFyBbbGMmr0KiBgmNT73INL5/Xp1pLWgQg8Q83vQLveUDS03P0Epr9C4
         gMG4hKqACqTp8jJe6fU2FRmktodpaAT8EsfC/IvOft6XtDSJElYQ1LJzz1ejNbpuLia7
         eMTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyTuqMTg9QGCCIsGcFyS9Go5fGEvoISP6IBBiWQP8gtH3YGkeWPsq0cx1c1edHaTayuvOvyMve9ReC4OdUmn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MzBl7plx0o+eoQ/hrla1ccj2D1EVnFrkvYhoxbILB/EmlKLA6
	wDBQLX7MB4EjHcxMPfcplbEbqHUJdgdNtbKK4eUo/hAkygiQRfiHykD5205V2cBhenFQgzvA1Kj
	lSLrl0B0saw==
X-Gm-Gg: AYBFou3F5lcFGLq3nzQuLwVoLP0CCjY+9+B7rC4lFuK35ONfK6Y8kaJ79DfvlPGsKOY
	lr9+BzUQJYavqRrW5TMgorUsWiRmLQ/Arb+x/7JtpGSCqBckc8RXUzIJB92EGt/rcu0YZF4dwLI
	DstXfShsqpPVn2K4GF7QxLQ/oDewtTFmjzEiKIc7XEG1wXMETiQ0bCtryw/RQgup10pyaWJJ3l1
	rvp92iaGRdalOvmnX4Yv8zuBDkqAOjWZEZDTYlLynWspZnJfngDut6dCjY7udAkJNcxfC0VGOKP
	LdKjiVaKW1guJU94BJg+YWCY1i1025u6tqJa2CcmWD87imuYo8f02YWIWmDvedPGssmGZYyv8U/
	oNGe4Q651dHkGb9IqW0Piv9X+Zw4344wgcK1pVJdhwyzuXa7oPUwpuQXzB39kiUvE2DlIC/btCn
	Jkduk06H1cjQy+GzD+8Qz3Wx/+YZFUcGo7pA9PEqOmB6921D8Bj+rOiaBDsl6BUvdrmtS5a3mL9
	s8DS6BBtsatNhMmvWxFVlDd/z7Qpx7TUutQPvhzQ9Z1EDMx6BGA7hnU3YQ7VtCLLl3D/bcU5fln
	EYWo7a2zq27pGt2aQGGTfawyUVlay28DYHEYvDEdD6DvBRH7nNQ7Ya9+Vb7Io6g5lyFQjvXZMFd
	YzA==
X-Received: by 2002:a17:906:f5a3:b0:c2e:7da8:f54f with SMTP id a640c23a62f3a-c4ca7ad1bc9mr1535367966b.38.1793822727270;
        Wed, 04 Nov 2026 12:05:27 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4a7797sm102894866b.87.2026.11.04.12.05.25
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:05:26 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c423b145922so162302466b.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 12:05:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxJt1ROGPkwGamad/GBRiFDTgpKP88Hk0cMMwcAYAGTVgZMly3xz5R9ZOCM+RWexO7TL278LHzwT9gfD823ljM=@vger.kernel.org
X-Received: by 2002:a17:907:60c8:b0:c49:a4b1:9cb1 with SMTP id
 a640c23a62f3a-c4ca795fa50mr1973235866b.3.1793822725121; Wed, 04 Nov 2026
 12:05:25 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-v2-0-b45cd5789ac5@brauner> <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
In-Reply-To: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 4 Nov 2026 12:05:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
X-Gm-Features: AclHuK9j_YIgrwhhpWOlnull6heAULBd4dgTqoOhUQQjFm_MgoIgrL1vgPfefvI
Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/30] proc: convert the fs, kernel and mm
 entries (Part 5/7)
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 11:49, Christian Brauner <brauner@kernel.org> wrote:
>
> Part 5/7 of "proc: move procfs to what kernfs does", on top of part 2

Christian - way too many patches, re-sent much too often, cc'd to way
too many people.

Nobody is going to read these repeated resends, and all you are doing
is clogging up peoples mailboxes.

             Linus
