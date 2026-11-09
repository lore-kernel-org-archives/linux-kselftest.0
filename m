Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226444;
	b=MGa0PipRAB+zw/2EaftSLJRMkHmWWQGOLavSIGKlIsmmtqsCWpt3F2sCYDw99NzF4djC
	 Jxb7W4/nGpC4guCTShR87H1OeK4VOoAD9nj6d0Vl+FOLnhUSNbRWRhqIpf3pTiO+m96qH
	 R9QP9OwoLnuVO85DuytN44lVd68WH402OU7GUfeOVLvsDqlJelbzy0nbWcdFLBiyJ5Xj9
	 J9WO6bm9YxVASq1Kt5Gd4LqCADs6LPAxeQTHcxoMLSh3NY1+7eCV9+Vdk/VWyCn1+bjKu
	 bVDun4pwo2vmG38QxprnXIlNyZGn27upB/sjL58n7WLyLHNfRsVHmw+dkLYlekwWhUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=s/6rTMTiN3zjj45F6hON9XdsqIM41fhzAmDLM09T6Xo=;
	b=PIyK0bZkWbwrlaXiwYijA2kZYhXRJN7xqknYqoweaGKoZEilVa96hnnpbleh9fxOXOP6
	 z1yFnx8f4PtBj2nLznvwKgdxT1Yyz3zMpPrDfHvDRV8+kd67DyVZOMKetR0LtpfX58/MH
	 Mifd2xUi+Em6kZRjq0stdDxZBBNsLVpAehf0oZpXjtETq3Sc9syfiZS+DpO3aUoxKghvC
	 pNCJ7sPbqUopJwPNnR9S/5aSELR11R2+BWTjHbV/aCK/3zdCpFL1KwdMdjPDg/mRzseLY
	 GSckh3SLBS0l+Yffy0TcVfiW5iu/kcNVNB87JQlQG0B3WEgBaQJLOR+NE7JZDvud2aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="V/OYuonF";
	arc=none smtp.remote-ip=74.125.224.138
Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9143A606A338
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 12:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9143A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V/OYuonF
Received: by mail-yx2-f10.google.com with SMTP id 00721157ae682-8b2fa622fddso2811967b3.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 04:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794226443; x=1794831243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/6rTMTiN3zjj45F6hON9XdsqIM41fhzAmDLM09T6Xo=;
        b=V/OYuonF4VZxJX6ZKEKVsMryA7aLihm5GRqBtYap8ddfmlGYuFx9dR/yXNlA/8uprb
         SjloK+Yimo97YStkTi6dkfLaN6NZYTUoI2YaudEZE9jzyCZ52Kf+XlCQLz3i117Wc7I8
         DeZqBL/+zDQ1ouSQYREfnWR1DXKq4+EaiCBQ7eHTuf8JBrTbNCN/Qawv73iGSaOiGG9q
         0+q1QeUEFChLhmfQh4fynBRKJ+nUqynNGdqXbL+AwCHO2NtHYX3uVqtBGa/DgluT9zia
         m6TJAwKOuI0JbYYRjRpd1RUzoTDAdh5PAPhYRQxcyuzPyc02XvXHMQCxvnL300VrtpuW
         G41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794226443; x=1794831243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/6rTMTiN3zjj45F6hON9XdsqIM41fhzAmDLM09T6Xo=;
        b=Mryvb4opQho/l0AWnlBq7a0Tns7DKITcoDg50DYMIsuvyWrGIZLukcJksU8VXlDO7S
         LNzYTnfw8Z/98EIqwtgvyx1wuOBMW//SKNB08upmwjZKfljaBhAqkRbFC+o0cy4sYhcO
         X7fWge/4TCuuViv76zEGIEOH1UkGOheRLkcNabiLU5Xa965pwWsiESiWfUQQIyaYZ1RE
         ntqeG43xFfaE8S4WagnuM270QNshCKyl/VdbxdbO6eM1DLHQaJ6O812rJq7fwQEDTqfE
         XdlQ3MkurpcjjNsRV7AJ8DFAkF4NygSirN4/FeaB4z9GYk+6iBIjlg8udZao7WlenJfy
         1qZw==
X-Forwarded-Encrypted: i=1; AL+hErGNKRwbDzwOWPlj+i99WuxLmHXA6PWPbcezoDloQkYIJ0YQQwpzZIcPXRVi2SYPqf0/SMfpupq5HjS3NePCVlU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BxHNVVxI+jZjVM36kkw+OLh1pAaojVQyflEaeH7GqPd34hZMs
	A7lDF2GAxLn81wtWmPsbaGiZC5sNpEKLcbbgi7xdpp/yszVVChcE64o/
X-Gm-Gg: AYBFou3CpNnkLdU/5TrBA8vPHdk7uRNdgenvgl9MKJ7wVHQ4bbRwu7D5m6KhEk/g7KL
	zzxQwBF2Wlfsf4mKwcS903dcnWsNEdFjQNl/N4hE1uECC9MP1i8N/8EjPAPxhgG+RV3SXEGb8IT
	+69CcIkWrhTaSLoHHDBelLTD1C6/aJvqgWOQqnNWeP+jDuQQr1CfU8HGYYv+IuCbPnTGQvf9P46
	rEqAZ0eFbEoiY4y1Fl4qXDRHwDBxnPygm/kxf8nu23KmeIqf1WDlqUYJ4ikeNoXdOgCGQDTd6HP
	vaHpPE3D2RFUkLbM1DkaL577xcKF4NUo3pmqHahJP2XRuyBMuP6j2uNzEUjxHed3buLbIYwqXlB
	gOgnWNM6c/8yTQ3Pp9DqkYUlvtqfHZwCiQXhO1loOgy3dmj59Y3Ptud2DVJYogdfpeAIHNFeEki
	fBT76QZRDu559IKMT4e7e8AkrZ4nK3OJpVgDm38OWXAs2mIAEam7x5p+e+ypFqNjbtsGlxri5Pe
	1pI6hizMok9Kto8M3+cZK5fncl5jigz1rJSKESxagVINVb4S3bWjHr2hvxQQvkSZd129X640JlB
	xXVcseqYrTOQoDV7eL7O/vFWq+c6il9JP6Y=
X-Received: by 2002:a05:690c:e3ed:b0:8a0:76e8:c738 with SMTP id 00721157ae682-8b36c664b7dmr25866737b3.0.1794226443428;
        Mon, 09 Nov 2026 04:14:03 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c3b95cf4bsm3720905d50.16.2026.11.09.04.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 04:14:02 -0800 (PST)
Message-ID: <7f9b7ab9-9728-42be-a5c1-9e8e62c23ab9@gmail.com>
Date: Mon, 9 Nov 2026 07:14:01 -0500
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
Subject: Re: [PATCH net-next v6 0/6] tls: perform TLS 1.3 KeyUpdate in the
 kernel
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>,
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Martin Belanger <martin.belanger@dell.com>,
 Daniel Pereira <danielmaraboo@gmail.com>
References: <20261105-keyupdate-rfc-v6-0-99b695f9eb4f@gmail.com>
 <au5JP__7P_PzwDUe@krikkit>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <au5JP__7P_PzwDUe@krikkit>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sabrina,

On 11/6/26 16:40, Sabrina Dubroca wrote:
 > I'm on a medical break so I won't be able to give this a proper review
 > for another week or two, but since it keeps landing in my inbox, I
 > want to make a comment.
[...]
 > So this is kind of a "can we slow down until we agree that we
 > really want that?"

I am sorry to hear that. I hope you feel better soon. There is no
hurry. I will not send a new version before we agree on the
direction.

 >> kTLS does not currently handle TLS 1.3 KeyUpdate. It never sends a
 >> KeyUpdate.
 >
 > Because it isn't meant to handle any part of the handshake at all,
 > just the record layer.
[...]
 > So what you're proposing is a very fundamental change to how kTLS
 > works, I'm not convinced we want to go this way.

KeyUpdate is a handshake message, but it changes only record layer
state: the traffic key and the record sequence number. The new
secret is one HKDF-Expand-Label of the current one. Nothing else from
the handshake is needed.

 > If userspace libraries don't do the right thing, we can fix the
 > libraries.

I agree. The main users of this series are kernel consumers:
NVMe/TCP (host and target) and sunrpc (client and nfsd). They have
no user-space process above the socket. tlshd does the handshake,
hands the keys to the kernel and exits.

 > And that can't be handled with the existing handshake subsystem?

Not without new problems:

- A handshake daemon cannot write the KeyUpdate record to a kernel
   socket. It has no file descriptor for it.

- NVMe/TCP sets sk_set_memalloc() on its sockets so that it can
   write out pages under memory pressure. A daemon has no such
   guarantee. With root or swap on NVMe/TCP, the daemon can wait for
   a page-in from the queue that waits for the daemon. An upcall or a
   reconnect every few minutes makes this deadlock possible every few
   minutes.

- The traffic secrets must reach the kernel in any design. If each
   consumer does the KeyUpdate itself, NVMe/TCP, nvmet-tcp, sunrpc,
   nfsd and every future kTLS consumer need the same state machine.
   In kTLS it is one implementation, which user-space applications
   can use too.

 >> the 2^24 limit can be reached in less than 10 minutes in many cases.
 >
 > My math says that's 28k records/second, it's a lot.

Storage traffic is different from HTTPS. The NVMe/TCP host sends one
TLS record per command, and a 4 KiB read is a 72-byte record. The
record count follows I/O operations, not bytes. 28k operations per
second on one queue is normal for NVMe. I measured one queue reaching
2^24 records in about 80 seconds. Connections stay up as long as the
host does, so even at 1000 records per second the limit comes after
about 4.7 hours.

Without KeyUpdate, the consumer must reconnect at the limit. For
NVMe/TCP this tears down all queues of the controller, stops the I/O
in flight and repeats every handshake. NVMe/TCP is storage for
critical systems: databases for banking and stock trading, AI
training data, and systems that hold personal data. These systems
cannot reset their storage every few minutes.

 > I'm not yet convinced this is a strong enough argument to justify
 > changing the model under which ktls operates

RFC 9846 4.7.3: after a KeyUpdate with update_requested, the receiver
MUST send its own KeyUpdate "prior to sending its next Application
Data record". If a sendmsg() or sendfile() is in progress on another
thread, nothing above kTLS can stop it before its next record. kTLS
checks before each record.

 > Why does this need to be a socket option? It feels wrong to use a
 > socket option to trigger sending data, why not hook on sendmsg()?

I agree. I will remove TLS_TX_KEY_UPDATE.

Martin
