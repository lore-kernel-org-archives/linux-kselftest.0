Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872533;
	b=knJKibWgUlc/nhi0k9p0ewttVjh9Pb8xa6Gxflnzk/Kxh4R+P3i7HbgUZAblAUcP8e0Z
	 7QM8llYtWP0/P3CNdPlEGWvybDappo177AIDb76cIRl4domjHUYYx9KT2lZUxkB6E67i+
	 05EVQ0ap4ySp20tfJjDuFvSN+2Jf/9tO7uVkMKFT+TppOznzZQmvaH5eUMhj6qUFURyq7
	 6XPyZYpFTJGtcbe4RspCEYRRX0JIRiekH1DdEN0Nm++jJtaPWxja1x3FVqzcIdtr6Hdmm
	 zu3ZITh2SQ/X9MWaC8aWJvlRtZM34m4BhePqw3Ocv2veIercXTODDOMd7QUSvVuUITw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872533;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LrgDMUrSYXpYgkAhfsYKg0ebb/uLgOfOMhqzX4yL0j4=;
	b=xieoFQamxecSMff7wGyuaIKRa6ujtRNTThmA0KLOi5T7GGnc6Skw+jrfd4qiS/PTF0mn
	 VQ1BfxH4KSZ1NW/CpE33U8xMnOK9H8RQ0s2Xi+4WprVg8CPz3SZdZFI+jejtlqeKKSzCM
	 tJIyZXOIvv8avYcx3JI5rae6M6qXuM8vTDb+7DOTgaimSJNV2+NhUZyEl6yfC2ureuaWm
	 HEpYNOOiTKSM8Lb68t5hWxHjtrM0vt3Np1NN8nSupJtDj6174Hw1OAQx65Iy6YtVkrYuw
	 GGqseeigYjZ2OAG2vgaunx+3Yz56o2nBLozi8VS3DNgl0Gs4pBdwwKjjoZzuH6PDKBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904C9606A339
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 09:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 904C9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-980c4258105so913278241.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 01:55:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872532; x=1794477332;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LrgDMUrSYXpYgkAhfsYKg0ebb/uLgOfOMhqzX4yL0j4=;
        b=W7JFbO+nvc4qzrlg40+jQYogeMYSf7RpwV+r5u56F77Z/obJOwl34CumdAPn//W7Pr
         zA0cDCRJRIXpzJJk37K52JWszohPQYIGiO6ovjmRb7OoH1gPZPBQZ3n40ctk8dsccF72
         6YNGfbBjI+1NCJ7y1i81rB7txfWY90acaeInV5M355SBFhm7gbXZZOAoly4eeD95cJiF
         FbBGuuKyVqj114oRCatYZ4lwuyp1aJA0dLt+pwFrzU8dkiXprimdllZWi5NfrSauPHl4
         rvWfWhbTJPPL7HEIQ598eyjUEnSXELf24fR0vESKKKbSx51u6CtxmmZ5YSuPDNcNizK9
         qTiA==
X-Forwarded-Encrypted: i=1; AKwUvByNq4Zs02plxSQRW9elJhaPyiN4DOIYG5zX3116nGd/nbR9UPQ9Y14fTWJzr+CTJEq72BXhBJPW0ga2C/gFHaM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Etf1X5KUrdd9U1XbZHg2EBtzm++V8/a/20bArUXd54Wzq3iiv
	aAF3sTh8tas6XGkDTRzK6ySXmwaRAYz4Ca9opNCvc5oo78Vzn1sxB1yymSdzsLyHZ5E=
X-Gm-Gg: AYBFou1nWTHgxeh7TruHQB/fOXgASYKC+t8sDCr84YbA9N2N/tWIMMBf06pokGrK6rU
	EByhiFROkmQijilOzPua7z6jOZ4lO0p7Zf6j69bj8n9+hIiySDIrjhU6L6b3dF1K1KDACe3Cqwk
	1c1uTOR/gdVDL37NDsZA3MnRzc9odd83t1ZIOrCql2LTAs4ntIY/wAmVXbW2hVKq5zKzFpFVZhq
	qCOcuxHWAB3OUneNoZSM59U6GwOLziZJs6Oc84KDhdvrYic1+m/zyzR7IWDgoWYAF/YVFiD6PJ8
	WXqmIg5VCqRD1dVcnSYUvvBpXzV89At3/7CjnND/v1XbDTshmQtzDFcB447BKjFTPBXcyUsNGx4
	dengV9k5U4+96sI2c1TEiGg8cqEPC4WWwgQbZICf6u9ZN+ocJC/GYC7MYSZlhsZrysT4uJwkCm7
	qpA2zUldhsXhxg1JfXah7TMMhqANyNKMPDvuNAJMibabkky29T7uunI4It+Hke4RbVfJKuqY+eZ
	lROUaPJNk387gGDHk5v7cJnuPKfv6f5CS8w0x2cz52kuq4pch/2G/TFWI9Roowywh79ze4EQ18d
	NkZbFc8EOvy9LDVkzSP3sBdSnhgqQbEwtK/zpmcnalCHvoZr/M/ksaX+fKZ3N+A2hEdd0MoF3bM
	zpGMwXvrAsf0=
X-Received: by 2002:a05:6102:1623:b0:7a7:b6a:b022 with SMTP id ada2fe7eead31-7d072ca6f38mr8919597137.22.1793872532523;
        Thu, 05 Nov 2026 01:55:32 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8dc1e75sm3840704e0c.14.2026.11.05.01.55.26
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:55:29 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99071945aa7so874583241.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 01:55:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzfYQaeDn1yJUvlIFrzvb1z+k94P/RBM0cOrztSjc7NpHw8J7U8yOvCipvWZMtkqPOT2wt5OMVTgX6ZXDLM8Ck=@vger.kernel.org
X-Received: by 2002:a05:6102:5108:b0:7cc:56a:58e5 with SMTP id
 ada2fe7eead31-7d072d84a58mr8269567137.37.1793872526219; Thu, 05 Nov 2026
 01:55:26 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org> <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
In-Reply-To: <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:55:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHxQvKnJyKHrOZhaOg9Rn2hMeRU1JnMFFEEi31FPZaGg@mail.gmail.com>
X-Gm-Features: AclHuK_UsJ1nGicdWEWcMLQAICTi1A7pGF3yhNkxXkXRPqohle17eXAHHNBsR6k
Message-ID: <CAMuHMdVHxQvKnJyKHrOZhaOg9Rn2hMeRU1JnMFFEEi31FPZaGg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 02/26] zorro: let procfs copy out reads
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

On Wed, 4 Nov 2026 at 20:43, Christian Brauner <brauner@kernel.org> wrote:
> Implement ->proc_read_buf() so procfs copies what is read from
> /proc/bus/zorro/<slot> to userspace after it unpinned the entry.
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
