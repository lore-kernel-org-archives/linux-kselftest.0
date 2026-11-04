Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835298;
	b=glRdlQ7QRPorhD5QyCBMBHiNLtaGQlwv5xjIOantEK41XQuI4/Ll1fzszRV7lxBZquXF
	 VaQswooz9Ki/+d/7cHJvPQbO4g1afJ5pNBR1+Ostcawl6Pjo7uFcIhfo6eklkiDCaGVMT
	 0knL4Z3lUbc5TuMY9sFv/eSbm4mWS8dpeN9eKhuilCYykYsKW0Ijjc5wbtjFRLaE9aLFt
	 A/61SpgrFu5QwhQkM9na66ddDXPgLv4MYkLZnJmAePjsvh4vsOnLZb60qy6/L/RFS6GMk
	 jO0mcBH17f68mPnu5mD4279cu2mb7N2GmHsJDa9+pzaLujlx1F1jnf7ZR9J/i4RAbMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LfE6XYGuOtutQi6QIVbHin4gqCciGQW2WLAtGNmvG6Q=;
	b=OHcQR5I6c5veNgcIfk8cjFK1EsgfwoULAUVJ6OVhXzZsVno+QnxVjpXt66EWnQ/EKsPX
	 Bg3sMoPDZd1zRP3Lveb/E8taBxwTWoBszZCE35Sw1PwW6OlQvF5yMJAFKU3RZznxfIsIj
	 +aRJswLQDfDZDW7a6fz+Qji0zSOCRK1Me1oqvf+fpprtMAxQNKIcw38iHG5oY4s8GED8m
	 lqKtDQDEAyC4JTBuIHhHAQC9+RoUidG1KPXy+LHoW1e2jC4y6BiEPBxZ5Q6If9o65DUtw
	 iw31g+s0upzTC9f3YUqiS5OOhVnb1YKfOin3C3GpEKY32CoHk0JuL7FJ8AnFrRScpqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.230.200
Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6098E606A32C
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 23:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6098E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk2-f8.google.com with SMTP id af79cd13be357-9369a6afaf8so98008885a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 15:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793835291; x=1794440091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfE6XYGuOtutQi6QIVbHin4gqCciGQW2WLAtGNmvG6Q=;
        b=oS7uv8AV9GQs+J3J5ITcjDbJ45MfrP5WlJdXu9KisS72I4zpWoRJN5mJENlCQNWjx6
         w6K20K4KUKSGFDrMS302lTQndqWgqfIIfYI4hiFH/mHVzQym9VVyMDrRCBCOb51DMcFl
         ofIQOr/qNDRlwNFNSvNiGZJyTOhzeJbFV8bAw8e+jKUTpwf9QgJv2xX1b7IFT5/ZC33z
         NtdznjXTZpPlty80dmkYSVqvYGXC19ugvUN86LkSV4Ng/wYHohFRzaMwCARIKOv50mQ3
         4t5AO2K5tdru0p2GZBx61QhznZr06ky45CDetlhp6aKoK/W9dCwWbUxhQLSjm/9isl9p
         5p3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835291; x=1794440091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfE6XYGuOtutQi6QIVbHin4gqCciGQW2WLAtGNmvG6Q=;
        b=yRKDgdcRdPMozLoztOVi/lCPufuCc0NPrTQIG6N03kg/hw8TjtkgSmiopxAIO/RUMp
         7AQp6NyHbEqVgA/9ceFCmRE/AePKHVfMNFINb2QXCcMfEIyC6fHWYYFjBe/uXfGhxDzl
         M/quqNBmYYwO3J9MkVhIthvOHGdmvBjhva3A5+hL4gkCPG7woPlhGn/HCo0gEL74Ho2T
         hW2xGgo2+rvT3LeATRYts+vM3IqljelhBEDaj/cS+dvOGcdI8gRp0KZfoGnneHIfPNbT
         TCDoFTLLyO5ubCYPWdF8+i3+Z05UBC5m/IvR7ym4D7HGwRTnXRvPJ3VnAiX8SvcF1aSp
         k2/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMScNtxChyEcXNSb2gQvZZ5Cuw7vf8i7wPRHcOfWTr8pUW7rnTBCCRhYcP72aCZ8WlWmVTFBtvZec3IHAe9Zc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+czI/j2uNSxUGyol15TAnzY54pk9M//CXVBywynWZmBwlKO4aM
	r5mObW01fMsUCTpe2SnyfIqoWBvE/L5pcFKKxz8M0dXjN1OJEOxgX1Wu
X-Gm-Gg: AYBFou0XDNL1o7bh1leHoOmH2bMYLntlUXRgYsUyO9u3sjjOaxER67uPLEbLTexBkoY
	fV7y5QEpBAXaqQ3mtyqsgrewKoduK9MbEOCAVj6A/Zxw0cLiMZ6P8b3zolSR24vOH4vz4LFZ62Z
	PmVAb9bvl4FvGbRxaue3IeWfpdSGCOtHwWxW0IO99oaWNsj8Be77goNY2MKXRWSQgeqI8himz9j
	xUSdODG9dHu4Amx6gWamnt2h2EzOaCtGvma83IYSs50/ZdB+bVqqPtg6WJWE2H30JruVQqJja+E
	Eq4VgK9PCAzL3bVzpzAragMSLd0kcgnZ/unmmFWPWXqQMd9U4NPkjLuZwENl74FDEt1yctcHLtg
	RA1WQOcLOuu4nhECi52dCOoorxwMsBNtt0BoQ9MeD5UywfX+VdCEijFINUvdLpk9AOtAYq5Ycks
	mbGlIuxNUQlZ+k42XjZONtNvW/d7do6UIhL4187cbRZ5SFzTGQgr05jPrGrjFUddH5JqGONWEKe
	UIKWwqZL0YdqyRY/FiOs/Prf+cNLDYIWaBQ4+HcNzHpVnFELaO465yEUTQimBjKdMTcrJayU+6p
	IZGQBbUkOpkEBROILQkUOygWQzhZmuvwIWY=
X-Received: by 2002:a05:620a:2994:b0:939:4a44:5f99 with SMTP id af79cd13be357-9442156ab2fmr2992527785a.10.1793835291266;
        Wed, 04 Nov 2026 15:34:51 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm324141685a.39.2026.11.04.15.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:34:50 -0800 (PST)
Message-ID: <0f61c649-6e27-4f09-a69f-026f91d89848@gmail.com>
Date: Wed, 4 Nov 2026 18:34:48 -0500
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 4/6] tls: update the RX key when a KeyUpdate
 is received
To: sashiko-reviews@lists.linux.dev
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>,
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20261103-keyupdate-rfc-v5-0-de1ab90a88d5@gmail.com>
 <20261103-keyupdate-rfc-v5-4-de1ab90a88d5@gmail.com>
 <sashiko-outbox-198140@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <sashiko-outbox-198140@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/26 16:43, sashiko-bot@kernel.org wrote:
 > > +   memcpy(crypto_info_salt(info, cipher_desc), iv, cipher_desc->salt);
 > > +   memcpy(crypto_info_iv(info, cipher_desc), iv + cipher_desc->salt,
 > > +          cipher_desc->iv);
 >
 > [Severity: High]
 > Won't these memcpy() calls trigger a CONFIG_FORTIFY_SOURCE field-spanning
 > write warning when tls_check_pending_rekey() -> tls_keyupdate_rx() ->
 > tls_keyupdate_rekey() runs on a socket with a registered traffic secret?

I could not reproduce this. I built with CONFIG_FORTIFY_SOURCE=y and
GCC 15.2 and ran the keyupdate selftest with TLS 1.3 AES-GCM. There
was no warning. In this build, __member_size() and __struct_size() of
both destinations are unknown (-1), so the field check is not compiled
in.

The result depends on the compiler. A small user space copy of this
pattern gives a member size of 0 with GCC. In the next version I will
take the info pointer from the union itself, as c43c1c24f3cd does for
the same reason.

Martin
