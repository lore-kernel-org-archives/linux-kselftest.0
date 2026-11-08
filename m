Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794168330;
	b=kh9DT+Pj1HI4if5u79x2qUTcX+zpM0TZ/Grx0xcATVCuYAyVHVDGnqRMnITYa71O7CVk
	 rn9cJcKbVWyvfzDz4JHER0HlZul0A7IntzbSt8iaf9pp/NVscCBPE68+gPRFM5jAu86VB
	 b1h3Vr03a65n/neXbT1wu+X1Has+nRHFcCaXiD1lx0B3N9honuA2Ypl3oyAz3f1U8cHox
	 hVgqEnJcGLpsn9h0nEEuRyScyzKYNqYD+tjo2zgQjjXpkOlFXR+c+GNyB5dFAGVNPAk9y
	 RKs1deYsqoBOkael2LWz+F1r6wfvnOzgP7Th9Y+k2VRAV2i8nzh6h+7aw35aGD+bRIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794168330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NsI7ZZLkYjCZutUVEg7TJNtNpCk2xGDMbVs7o+8cm3Y=;
	b=W0B3IzCnnwNWjRpYalr6SUp0IsBNgTEoerOVOY6vjsiYQ3tIAtEUMYxxy5j70XNMMnWT
	 xe8j5VK6fBcTXABKcG9Y8Y4bDJPu/21Gqu+GHAam+XBWILM7N8vpKic3orKKkqwgUqj/6
	 BIqDQ4WNzRrWE5pBAwOL8/imSUZGXmR4Oc6Z/TW9nRALOzNRyGiZRIWvc+24CZKc9hCHZ
	 UTwEveNWlV35E3h2nfjNWka4aNES/+S7ZornibEY4mSDKz+By3JYogtBiYwo0Q5Re6h7Z
	 V7NEsn5ZhKnufx27zIkPO6XZdn9Qf9wouH9lFF6N+rtd2XhIQXD1BpHQTjpRY/AVhKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ib7c6P66;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D30606A32A
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 20:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54D30606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ib7c6P66
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso1318895e9.2
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 12:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794168329; x=1794773129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NsI7ZZLkYjCZutUVEg7TJNtNpCk2xGDMbVs7o+8cm3Y=;
        b=ib7c6P66JcABRQVIYvbAfEuMzOdspSzPtZfn7p5hZaB2Rr9aWYVjAA8lHghOcTHkfP
         W1IBKWn61CtXgoJPbCEozcqCpgRPGxULcN94D7ITtmHErVGmr3isoGCQ02nfNqhbH+4n
         lUM22s4MKp/l6fyffg7/TutUQVALjesHSFnC4w+1WVPSvW0J5rknAYGDJAl4xvCRXDT5
         fBdxAtmJXU6SiF6lguNdvRiiwtq6Km8nyFGsRU6Tq+7fwVjsnnI/ZpxcJdUfsPAfNVOr
         BXFpKVyK/3a7Qj/Qjq4EwXbAdcjWWztzIsYea9a0P/MiY6n2EtEGPByGhhhA0f0X0qYJ
         P5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794168329; x=1794773129;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsI7ZZLkYjCZutUVEg7TJNtNpCk2xGDMbVs7o+8cm3Y=;
        b=gJ/O/RxbeS6O92S48tn6mCft+LHFCi2fmyM9F1Hzteg5ZXh8ibc+mAPtiWv54OgJGV
         drf3ytl+UWUx/y/OAIUdW0Sri4QIXOhhaHtNYjpqQGkJHpnNe8Gn4kjSL+Ir6D0dCVDJ
         ki1X9YY2takg+fvdla9G4nfY5tSr0wYjGFe+c0dNl/TEa+YNBU03kkU4B/ifmx+Z4Fe2
         MAFDxdNarLj6mZ6vJDiMOlv4Tf1uDKnuElZyItrdE61JWAbaVmqkeBoiH6y2L5X+TR+t
         drsPdcIMtSpqHj0OnrfUEFDdCYbNVqLPVZwIFBOeS1f3OE4iR2vJrIGAJN/4LgBOY4dI
         B58w==
X-Forwarded-Encrypted: i=1; AL+hErGnnzu7Qvq/UScRO5Yzv6lzgQAU8Uj567/YI5cye4G9eor9ElQPbGmReRoscl4JxV4+NdSGVlg+Uinqy5P6kpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j6ke99oFFUM8Q8qfa9GTuFRwd1ATtdlM/VzGXymGq7mlYkwoB
	atuGcehJ3tQVbMAzpAA+2iCts+f7SlWFafGhsmLE3WKGv330QWHfLYNR
X-Gm-Gg: AYBFou2tbPT+wFMWzMbI/YqYmuJKEqmLXJiVYhqtMoK9qlagZNeLS5bDRWKXE+swYWl
	EIjFa1qQF/aWFkqcRSUBrrjIAvQCAnh94TPBL8ILQd1nfrBJP4YY03onNpqKX8omkXSc4qKgTPW
	AmK7TlB+D+yosyQSSuRb+ZE2n+07wuIIuPwjQTs97fBX+/9qWh9U3JpTgiwHXy2xUsrp/9OmnQs
	E5nmyr26hfm5VK07Nq9DZRjWo/LJ5V9bAjQqt91qCJb2bUPCLFuAgNESvsjGCqZj0rLKZOcFhvg
	j+R+0Rc1e2w3Wt+UaR/N7gAhUTSyhBN8AaE6cfdhpHM8rV5cwq5PlqCCI+WDjil8jj0BgrF1LYz
	/pKyC5bdEOtJb5T747d2lI4VlAhi7QQDFQoyoSgaDtQrvlFmE9tR8y5alkuFkh4W+hqMyCxJPd3
	DibwRIor85i/vFNzfwLkFmG+JIb67AAWRbdnzQWzjZl8/qbCYE7+7Ej3wOUGnJyCsF3NVUtKDge
	mT/UYxfYehmU4xATwS9a0+KtmBB7EUWv00ck1nG6BwFDj5U6600Ifx0KIuplYFCV0obq4Xu98tE
	acbAT7+yCuLmqPhHLpzjSszV9pl9jARg0WjStgK99SvsIWst7MkNLljlx2r5200yG4sHf+/J891
	FAANhNdl1Qg==
X-Received: by 2002:a05:600c:1c0c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4b963c69d23mr43591205e9.19.1794168328561;
        Sun, 08 Nov 2026 12:05:28 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597186ec5sm5768522f8f.33.2026.11.08.12.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:05:28 -0800 (PST)
Date: Sun, 8 Nov 2026 20:05:26 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Hannes Reinecke <hare@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 David Howells <dhowells@redhat.com>, bpf@vger.kernel.org,
 dm-devel@lists.linux.dev, fsverity@lists.linux.dev,
 keyrings@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-security-module@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
 Alexei Starovoitov <ast@kernel.org>, Alex Shi <alexs@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Andrii Nakryiko <andrii@kernel.org>,
 Benjamin Marzinski <bmarzins@redhat.com>, Daniel Borkmann
 <daniel@iogearbox.net>, Dongliang Mu <dzm91@hust.edu.cn>, Eduard Zingerman
 <eddyz87@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, James Morris <jmorris@namei.org>, Jiri Olsa
 <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Mike
 Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, Paul
 Moore <paul@paul-moore.com>, Randy Dunlap <rdunlap@infradead.org>, "Serge
 E. Hallyn" <serge@hallyn.com>, Shuah Khan <skhan@linuxfoundation.org>, Song
 Liu <song@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Yanteng Si
 <si.yanteng@linux.dev>, Yonghong Song <yonghong.song@linux.dev>, Linus
 Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v5 2/3] KEYS: Replace assoc_array with rhashtable
Message-ID: <20261108200526.43579e2a@pumpkin>
In-Reply-To: <20261106090516.GA1973@sol>
References: <20261105031401.956609-1-jarkko@kernel.org>
	<20261105031401.956609-3-jarkko@kernel.org>
	<27015846-0161-4700-b810-4643e1f7b63a@suse.de>
	<20261106090516.GA1973@sol>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 6 Nov 2026 01:05:16 -0800
Eric Biggers <ebiggers@kernel.org> wrote:

> Side note: fips=1 actually has little do with security, and in some
> cases it actually decreases security.  See for example
> https://lore.kernel.org/linux-crypto/20261026183332.11402-1-ebiggers@kernel.org/
> where I'm fixing a vulnerability caused by fips=1.

Then there is the 'fips compliant' server we used for routing 911 calls between
TDM and VoIP.
Any kind of PCIe error gets routed out the the motherboard management module
which then proceeds to inform the kernel with an NMI.
At which point Linux crashes.
The NMI is too late to stop the kernel having to handle the ~0 from a read.
And even happens when there is no driver using that device.

David
