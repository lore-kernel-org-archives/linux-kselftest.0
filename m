Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273665;
	b=lqhQfLmwx1+nqdnMr4700pZVlx7jFdUgC5aRHLMRpytpDnByMvuftCuNkpDLKxdYNc48
	 /HQ7ZbCFoSNYjaOPnAFAVUM43AE2mi4H+74Rvu4G6/OoYBpv2SV7Zg4SK90JwKHoamrSB
	 hnOMd0wHtxfEP/3dkwwosmEL9jCi8R+4Up+Qz/1sKhYqVlkclMCM4b7b3tWcIQaRbe8+N
	 e28waNiZRytdriOY7kT7XmNULK3gGUeTuRyiq8UR6ZTRQm6BLD3VQoTwhbWVIJhmanGCt
	 HETkni/UhBHrlAq9zStjZ66DZCmfLcNnE4cTtAe3bS47NQ5VoBrPiqroIYXyDZ6EkHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
	b=WjyFkhLOO0CSTfJgdIo5bXHvdgvSwB+0lbImORPhMRK1XEetJt2bwbvCx2cxEFv2biXz
	 YRjw3FNEguS2xFz+htMyEf7r6yZ+ddtI2Ky2vnt3sCfBD93/o9HLYUljfr61JtoixvOgU
	 aAkRO53njOvgF3SbISlLO9f+sF5q2gYgHgVtQv6sYqPFzB15XOOxPHujnteW7wc8vSaEP
	 fRLtmHAQyMqNBnudoTkPVSsUJB5mHKnsVtHWrVOyNpMIPM1QeqzttxzQU5rGL3lQMuWwb
	 JY2XQnn6o9ZGvDEoCFouMUDqxRSb1j4skDj8WD0bbGRFQfGNU1Gl9C0nz5doLzunlcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LPURwVKY;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B247A60A2610
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 01:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B247A60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LPURwVKY
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so242344066b.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 17:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794273663; x=1794878463; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=LPURwVKYlLmpD0FLlAPJvwkmRrIqVFEKQc55jS/itR1VIkQI+TqyTslZpEyr46B+GO
         /slbAlyw7qv161pePMg/7aENoGrrMVV4vWq1E1dsX8n+Vy58blwEMmRYr1LnubvB0aJ8
         xSDsRQGyVWRzllCgi+XSB07PIQn26RjskaMpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273663; x=1794878463;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=cxSFpBl77VJTc+S0qOxshgpSrR70pKb1PkqUj3BH2Tsyin+MEGkwXsTP8PaTj0RwhB
         FJfJojni4u7NWFCXAJacpmeUixra7l35eOpUbEpy0MxQCqAVayp9962x0y8UOepifRaR
         QYO/w8TPL/lX2kJNoat0Uy7ukbIdxSdq28TEySjQGUmTKVdy0Bpudbq1M5Jxg/96ZjN2
         +eIG12O53YnHZeTZrOiwFnQCmJ51mJIVtxsh4nvJU1Y+lj5z0TA9MXKMj37FnxHcjD2d
         aaG6KMAnh6jNS69tjAr/bgpTdSpfeyenM2j1mtu3z+1pVskfC3fgRO6hP5HfgCFQpkqK
         emMQ==
X-Forwarded-Encrypted: i=1; AL+hErH6VAZBMtnucJUmsiF/HLPLMpc9Ki50Ehkt7v6SOo3xzOoZ3hcgzhAvRwpWxcBkvG2fNHH84tKR46UUEY+xtMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zzW6zdI1g6xjunvpw75d6xztrH1iqoN50J0DHesbfhaLggBNl
	MCAOOxURBXu9/8Co97ejYizjw4aXS9i4iqbAcrUPv4DCzi/5KR3MrVSWI636JTQpSR/boIb8HKr
	pBnzvEwaWhA==
X-Gm-Gg: AYBFou0dHxjXVawklTE0lkCtfLzsrcxrKANW7PP9i2PFdzWcT1Csk5/1B/hbHkhiGYV
	2DgkqAbpYeSgTMP8VY06SrMvuQobRXpXdALTvhK1SMC9j19EwNhZtzc0gfOs3p8b8P2gpDC6A1A
	bK/D51sibDAT0bMwwhtU46J1GmwOhlIB1HXGUaSS/dJnoCBp9MHRUqOMvK102ZNlklw1jmfjn5g
	XW9gCDssonLnX1u0F+r/MUt9jjqmSv4T0L8ETkp4wuw0UJOVfjpxtX9/5TL9ydkjZ/AK0nhqcgB
	kvecFdgoED4R63xSKAuJnp2ATuRHXxlIbzv3hpFyuPzyxVU9KJ5olCM6BPyrHy1D79r8w6krG6K
	WULojjTfCvPnKW56iHp1UxvFjYAsRcwfLiAmOOk3ZLpfuhysD4y2KC7S+3aZqXHbdhpAM8WU1Dw
	O3V47WJOWTUG1asF/vE2ysSp0m+sUeSbVu7xiR3HXkOnreD+EjoE+1EkYm+kFtqk6hssBDF3ZaY
	YI4BvlpdCCZsViZqlUgwbpgbX+6mcKDYjb7HNop/jp24bTwsuzctei1N3vBhqYvRt1283JJFw+U
	faGhPaRSQEFenZp/Pcv/4rTp78t3yFDqsjXDRxWEbf1dWKmGGHZQifF+8dKbbLGEC11HFWTU33k
	WbzXXHi0RfmAK3abeui7ic+rT
X-Received: by 2002:a17:907:8690:b0:c4d:31c5:cda with SMTP id a640c23a62f3a-c504963ee86mr78292366b.21.1794273663132;
        Mon, 09 Nov 2026 17:21:03 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a5704cfsm41442366b.15.2026.11.09.17.21.03
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:21:03 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4cdc606b47so217220766b.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 17:21:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGPCNt4eXQ0UWKdeM+NxTe4lpQFct0fXlznfsHL0UKuJsPBNs5qm58gt8TWOLrBSEseIachU1iEq6oCdEbNoSk=@vger.kernel.org
X-Received: by 2002:a17:907:9451:b0:c41:1750:59a2 with SMTP id
 a640c23a62f3a-c50495dfbd5mr87253466b.12.1794273275844; Mon, 09 Nov 2026
 17:14:35 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
 <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
 <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner> <20261108185953.28054fb3@pumpkin>
 <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk> <20261109214558.0d9d5228@pumpkin>
In-Reply-To: <20261109214558.0d9d5228@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 17:14:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
X-Gm-Features: AclHuK-x8jcOOQUqd2amGoGEAKER9jIFGaeL4LxxWAd0cGV7dz_RR64PtDogpPU
Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
To: David Laight <david.laight.linux@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Christian Brauner <brauner@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
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

On Mon, 9 Nov 2026 at 13:46, David Laight <david.laight.linux@gmail.com> wrote:
>
> Just that the cast would have to be:
>         u8 *foo = (u8 *)bar;
> where 'bar' is 'char *', and I don't think you need a cast there when
> char is unsigned.

.. and just to clarify: 'char' is always unsigned in the kernel on all
architectures since commit 3bc753c06dd0 ("kbuild: treat char as always
unsigned") back four years ago...

            Linus
