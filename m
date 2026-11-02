Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642842;
	b=vk5HOCg1t87qkuUvx0R6laRysCP2nZeOqpM39w00JHcrOYD+LLu4UTEc9iLxKqYHOPy/
	 RZIWvdZMJdIjiOeggK5dTWqgWF2kJR1osbJgNfcSMWItVcu4zAHgJBGesypPrP6plijli
	 yL58T394DC9fL8XQi4h83Tnw8N6l1M83HSN5gMZzfCz1cx2tklrQoXkC4Rpmu0dPsvLtg
	 GFdUmAdPAMDVLSuPg2eojNQ1TmK+fiiLESPv6SElk/d4FXszf53dDF15Mb9rpJVUNxLHI
	 YtLW977OsOZpvEa9Refzb0h9k83n5sTG+szNj+GMFw+20lnkbatvHhnmxTEeqmu1jpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
	b=3Qh2qlgGCfnbEFd7A/1aNjdQa/ogf3K/FSfw1Ld/Esoa/cNaW+RptxuMFx9Cnv9NPxLl
	 pvJqf1qiIQMkRkLRGH5c5j8YA2D5Fu20ukhDQ9ZXDwFdP0T11IxqkrcdiIDluB0crdEfU
	 wO692eLStsKg+wCHwmZ+dvYDmg5E3eQtwbHc82k8TPgNtsuOmF5pxi5aDehOJJ2ajM8rt
	 utH8EjqAjGPtyneY3cGDK3XbdEZN3hJr+WpdcPBE4Whyug4zStAOaccMnlYbxERxlB6ZZ
	 bYWsB37Bo2IoECP41gDiar0hnstWoPTA0lGWPZ2guamf5hziFcHzH4mhgrNd6eBgFNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LDYBUokF;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1C4606A327
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 18:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB1C4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LDYBUokF
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be4fea434bso3803147e87.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 10:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793642840; x=1794247640; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=LDYBUokFBH18lz0UWRqILYRMY9l3Pk155MuQIGVagceH3xSPXLVFowyJwnmzjAFToO
         O3ZxKe1ywEeXQFHG7Ol4VzX0EthlI4AU8Fa+scXSZSAhv7Taa4P7aSrR2RirhrB+yTQU
         WMwhKBQsUMFns0JPGeGo9osQawT8z111jaohE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642840; x=1794247640;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=K41NgKO2Efuz02CBWy1I0C61lG8YpWmOjYeE9iSxKy7r9QBwi8A9aWxyuDZHct1hGJ
         HC8qmtJBL6is3lEzIMICxKhMZmJ8v5irB0f9j+c+JUT2X0mjv1vPGoBlP6cYEenbHEpt
         UZn34FvJDNB+Oyg7m/Q/OZ7Qt5U4WowLdTOivhJdvu52QZaehkk3KOUKeSiDPxJIgdza
         F6r0+YRgdmuk0Y+HA2oeDf0YvlWx/OaerHpZDuOle3bgdf8qxBXy3Fb9uFm1zaTGIhKL
         V5hX1fSBv6hq8+rNU+6gZpVGpsATEv3AawoEPmv+0k3bOGxKMwN2LVCa74xlxuUB1dm1
         +VIw==
X-Forwarded-Encrypted: i=1; AKwUvBzKg4wdogH+5399Rsp7Gz/q2JQqWW7eaR9wxaR69qRrP5FbvWNgKSO3ggGbMXjp4YPDEgyz0gYWUcXmQtlM6wg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9l7b2QADLUKpO5D+Md4iQMdAm3249lOKYhjRWgv3cVPA75EQOF
	GwpsG0mdib1HzQfqqmhZxo2a5qfUGXzjEmi8Ps5crSVP4QtEt1pTfMvygWbEHLTWpboliSWqOR/
	Akc/yG3Q1sg==
X-Gm-Gg: AYBFou3wnde6zEfDLtZZ5++SPLlOhMJ46WlffpiAwtND+5xWzJV4aYJuRWK5S4o1y3l
	wXTy24pzPyuyuZpDgpljYWwfwzPJJ+AvTJBqFMsIJpSWUdFbfiSuKi16u1/EYepDE0kgcoXXv7D
	Kfg676cUtRVBdNWQV051bNZ619PbxBPom1+UYGSEoGJzyXKjzisdAQ3mkzwm8vmH3J8PGm3XXMR
	7XedIqnW1hhX6W3HFUKJ+n5UCkekQFpaVDTSmYDf2xZQP8MIAUQlrhQ7XtxuhTfCU9k7iR376F+
	CZ93ahZ3VKh/crfb+8nK30J3r6giL0u7rhgMLtNe43ZC51hHITHdHGOJGc80Q+R66c1KiN7VF8c
	NnieTf1aSb4Pey3kVoRGSnkLMrVOGghK9gZFYY9saSudj6vuJTLBal0SzkP4oxHYij4pZqe352O
	5eFa/QJd8lLdqLmxKxe9+5RoIGAOcpA1lHskgZBaJp3o2tzKsUNXOxfsx/qmnizUmhr+oY78GXc
	rY2sgMtDqem8Im6dYz5mV1p51k+uSipdbnJJfhoUdLE8RxlHw6s4jStsfYLPpDHHR7ylt0TMklf
	zx75s/Ru4WQt3TQ1Il3wWBbynx4WN2Oc//yOB9LnFzQo1eE5bpxNUfUp1zI9RvpBtKkm+IcFbcS
	hIUE=
X-Received: by 2002:ac2:4c54:0:b0:5be:ab1f:f04d with SMTP id 2adb3069b0e04-5bfd11fc9b6mr4098957e87.23.1793642839882;
        Mon, 02 Nov 2026 10:07:19 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe07378d3sm1791905e87.45.2026.11.02.10.07.19
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 10:07:19 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be4fea434bso3803134e87.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 10:07:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwsk5bc89076d21e+QS4vZpZrYlRpjiCro5punFClfVEZkroRH6m7rstpJ/66lPigmkNeK/F8HsBCJXWsrxkQQ=@vger.kernel.org
X-Received: by 2002:a17:907:d94:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c4ca7426f6emr874452266b.0.1793642348398; Mon, 02 Nov 2026
 09:59:08 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org> <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
In-Reply-To: <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Nov 2026 09:58:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
X-Gm-Features: AclHuK_qZTBVsLQIdymgRHScSFenC6XsGggUDmcuOugjrSTbuVkeASUmC_hYPZo
Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
Subject: Re: [PATCH RFC 01/38] PCI/proc: don't truncate the position of config
 space accesses
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
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 06:22, Christian Brauner <brauner@kernel.org> wrote:
>
> proc_bus_pci_write() truncates the file position to an int. A pwrite()
> at an offset like 0xfffff000 turns it negative [..]

I think this would actually be better with rw_verify_area() just
checking a per-file maxbytes.

We already have that logic for lseek and friends - using that fairly
hacky combination of s_maxbytes and !unsigned_offsets().

We should combine s_maxbytes and unsigned_offsets() at file open time
into f_maxbytes and check that not just at lseek but in
rw_verify_area.

And then things like proc_bus_pci could set it's size limit in one single place.

Hmm?

                   Linus
