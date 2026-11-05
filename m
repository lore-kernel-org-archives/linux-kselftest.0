Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872872;
	b=1UlXhVH1eXiMvus76c4fknxeY/W3N73FduckiA2WQ2UUTf9GbUuNQ7iQ0Tfk8eRyrl7S
	 7Uy9xlNpv+BTNMEjdxVtwYDPAXjXced7Pz0jZR1kKYSjurNXEYHy0mPghvgecL2MwJZ3/
	 oBojBrdxMeT2plywACbN4xKcowr4Eu/am6lzBz9Ppc7HZFbH0UvifYHHXnifO8LvG08jh
	 IlP5w+wVwXp5DGzTZq+mrP2vjIKPDlL4ovC/r5s9HngI9gBe9UxWGUphHnhd30Pn9K2k1
	 mrJjlz8dp2w69HKtDhG/Nu/0dIEKUb9WrDiZcWgg/+Uzc52AOG2xEzKi6MkZpfNOCjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872872;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
	b=Jx9jSCIc481IY0H34mpAfRAVLc05DUnDCEp8x4P1ZPKyFPHVbFTIUw93MjPslSPfJ4o8
	 CJpTymfPTYno8nd3kA3AJaxSSNp/ZsYStJQlERbK2c2vCoIY9Z2+/jY+1GUP6WzCuQmDf
	 R2VvIYOtCqMhzIfyVNsoMGV+u9p8vn0SdNb35lDBbbYye39k54JM4sQjwuiw6F0Uh7hDA
	 pGJWivfL7xgqegkz7yDTutLg8Z8i5+qovMCFgeUSEy2NZDFVvsx/XCAbkESS0Y0e2Bqxt
	 vIM5eL6SmionB4t0SGqLPHBs7b3o734c+R9+6hBhNrH8IhVMqItEIz4VxzOLws6c2/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D38606A31B
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 10:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37D38606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53c4b82919fso21114921cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 02:01:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872871; x=1794477671;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
        b=eGmMbGPB91ya4C721toveDyhaRb0kB5AHjueaLFE1hiEJMSmvfJlRE/9ZAMpJtrFvM
         /8QMCQzddKSJNPvhRVGVsgPJhU2jqVIUHx91eU1x8KpKXGUza9eqZ14MWBSinZXzCphp
         a5HxqY1khsn+/3VEjIROvsRMY6o+W3r3f09YiPcob2OW/MfuXr0TtuQ0GxWvk46JwHFu
         Rn9prHmCOJmNlGDKIXJRaBHnIJKgmOkIiuMvFE/U+ncIynpPKYEQSRpm+KxcLquWvJPs
         g/P2OhMo6SlwFbSq1m4X6cl7w8hln6P3zQ/uLQMCGOHTL1SB+bnfhGT/PMVCdTAoNuap
         zVPg==
X-Forwarded-Encrypted: i=1; AKwUvBzofRsInA/8FryX80l5pBJ7Py8na1Q2ayn6i0A24WGkwsWoV+gNcPaXH8LrmLr6GStN1PSMIWf03D9c2ptncxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aL079owUc/S4GNwL8fD2/duNNpALz/QYwRVIBcEfqY/4qreKg
	BjUFvfkSW5r+nlZ6lLT4GHUEkLT7Nqw7wSU4rr5KicxnO3ZSSPGbouYAM4TXaz5vlRA=
X-Gm-Gg: AYBFou1Rxps4RQ54OKOKq3LGKn4hUk4L1e+HS/aLUIz4pTKL2cncH5wFO+UZ95jFsuU
	uVFePJpkZSDfgoiJLOuWu8D17GM25BiQaal7VOpmf/fJxXlUD64pKH8KwNNOltWW8xN4SR2Sl94
	JVSi9w5Bq8Nx2t+5uBQ3hXu6Igfvo9iPkVk2Pp/JVmjityznmlmrvtoDqphvctOYDTRkE4uELzD
	Ytxd8Ed8kAIHSH8Zw9t9g+91OpeJxTCVzmx9gB+SFE1hy0lqwoeAO6AEuzxcrlsTlmLsw3shzf9
	lQrFBZpL3lVYyNpvTwrMS9GYyMQYBymL7V4SMSIzS/yRPL4f6C0h+/e2g8B7d/1bUratPonQ0my
	VG69G+1bQWlHWEbSbkepBrWJHPClEd5jMUiJuzur7z0RoIeF+N7PW8KYaXxj0YesgK22reTYGM7
	lxnsqTHL/akA7E2XlGsp9tR0PzOI06H8KcRUbALt7A+HgPWmd7WkZCGqCbqh+T7XNQSReZ6Tdcq
	8iIYv5d2ipTQ/IPRBjRbAi1OT2wj5rqU06+TyU+zLfYWUapcLAvWu9qyAYomtqjUcYSDumw5Szk
	iGCX0rXsFKfKnKWWyplAqCVdwOlIIcVRxE9H7lJe/88udg246+2VWgFeaqRAmFNzlA==
X-Received: by 2002:a05:622a:514b:b0:536:6ef3:105 with SMTP id d75a77b69052e-542b639cb56mr293067171cf.21.1793872871032;
        Thu, 05 Nov 2026 02:01:11 -0800 (PST)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10a6ca24sm48655761cf.14.2026.11.05.02.01.10
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:01:10 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91c1f548f87so26529126d6.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 02:01:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByHiCGacgapwVGRyNUYUhfGcTILl1cxConPSfvOniv5syR0j0Va768s6hv45Chsqi8dh0v+JCCElK3DxDwML1g=@vger.kernel.org
X-Received: by 2002:a05:6102:6449:b0:7cb:bc5e:7dad with SMTP id
 ada2fe7eead31-7d072baa450mr7614890137.10.1793872492413; Thu, 05 Nov 2026
 01:54:52 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-arch-v2-0-2aeb952c9597@kernel.org> <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
In-Reply-To: <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:54:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
X-Gm-Features: AclHuK_RsrcE7hVRjmpZezBV5tMd490Mza2XAQiqUTgUNqAiHAzRP5z7NIbtMh8
Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 04/23] m68k/bootinfo: let procfs copy out reads
 of /proc/bootinfo
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
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

On Wed, 4 Nov 2026 at 20:36, Christian Brauner <brauner@kernel.org> wrote:
> Implement ->proc_read_buf() so procfs copies what is read to userspace
> after it unpinned the entry.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
