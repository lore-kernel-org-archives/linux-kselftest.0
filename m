Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835358;
	b=poXmaq7bZP2I9ZzpwQltLCn546FWoO21PBzM6JN1acRjv1HaDf0Gf3SqQ8p9MHF4l2o3
	 AXzgvvDtP33Fs7j5LA7yJuaEFdBgdDEcboU7rkH4kiUoko85TYpmmbKX56QDQHJXJw51O
	 TaKDNXXSDFhq76EvAT3aphSTMWqiiupMynSNvse27tJ666mXtVn9hhwQggc86xYmFgLQJ
	 f5ugEYOLWzoB1p7bHfwxmqEL8RHUa/G1EQeyGi1ESnFu8tjfZICPSKoVV91TOz9M9MtOg
	 sPrp+YB8ncq+RBd4vG7Qt8GVUXBJmxO53pyAO6Kpd0zsTkIaCv46qDrfruPDZ5hFtxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
	b=STodJALKycc9knIDdSak7EB+RDNZmUfMqH2wkWJQlXrHPa79/u7hZI698WFN+FCGI519
	 dQJ0I/IxMh/GwW8O2bJdGlDtWJHqcOvlahgDJfiYKlY3ppVj/oduXPtVdWJDR+ulcKnLl
	 BXzChCyMuKJp0p4kV+JAtgm/46WI9DbsZ2TXy6R7XPDtuMrSMiHnbHAez0r0pY4gmQxe0
	 enk+rbPizubX1yK0S/zhVKaABX7KkDUD2lRNOraTjWl482p0tGtDPocrC5PBUu7qR6zmU
	 9cUgQuuFrgoRMbCVYOupQM2dpjfSqwLU5VNS8eCUsKOY5LVnBAkggs5CAil/g4YgOkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJMJgTdc;
	arc=none smtp.remote-ip=74.125.230.193
Received: from mail-qk2-f1.google.com (mail-qk2-f1.google.com [74.125.230.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8471E606A32C
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 23:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8471E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJMJgTdc
Received: by mail-qk2-f1.google.com with SMTP id d75a77b69052e-5332a0f6dbbso8351631cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 15:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793835356; x=1794440156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
        b=SJMJgTdcGBlQsf4zsbrbO1j5AkB7ELH4/WVaj4Sdyja5e8Qsu41MqKvyxQgJjRsmvv
         WB2WEmuLJYf6rFz6iWK8B8a0Qq8ltXqfC3dLLnzSb/Vr1kzCqcVcDQZ3cIfBHOZ+5v5F
         BLE6BusncD13AnA+suHKkbOfoVPCAwy7EG8dZrxWIbo07psQ3pnSg+ksINDz1A9UUWrH
         6Dd8sem9Gf8LjO7S5z/9LOgyh3nnxfHBf53t/4egxxRnpdKvyogEIV7ou2TArLsJ0HCF
         m+eLHxQj4QlJJHgWrpJlhhc2fC9xqCmbyf3EoxeRtwyCaKY2DnrxE2PcuGUmjyMKs6Rf
         jPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835356; x=1794440156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
        b=aVs7a62S0uoqp7L8gjvVU8q/gc4vD23gxB5MY/ZBMRN8ZsTHycFyUtHHj3g19QQiHc
         kYlGNR85a7GCiIFVwWOsNTgYCWy+PXPH3eF1HyPwqGLg+y85wxMqLGm5tV6z8aHnbJXY
         AZSzlYfNSb9af6VhjP9dxhA39p/ItpJVDJBN+c055gquDlcSrswzEo/z+FSV2+sXunhF
         O/isRGqB3Uei8tWoum8nojvfxkuB5Lbl8oh2omyvUby4ZLYoVZKecK2pzinjUBdWu9kU
         +fk4G8ciIUToye50DMRUbTOBLK6suydbfNoN4zCESw4M+u79qJRIxj3F5NOoa0zSAcGB
         DbRQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8CPezTMGH2uYmkKZ/Xq/FZVD2ADl8ZFlSx0ZjJ97VLkPnpQa60NnkRe3cHsxHqt0SXUlVfnKbo8pfHD12wN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qzH0AybjX/jDjGu5sH7CGX7/VJWXv932lAqruwUFyviixbHLC
	H1zuIi5OGmDFjDtCBlq3TNWueXIW4xgBa6X8WHHn6dZR1Pd6FeE8wjP9
X-Gm-Gg: AYBFou31Pp0NQqlNwXK0Ha0hnXKuiM+Dl0LBXzkMjD5b0EabGCMq7+NV13MU4frMPb2
	rRHmjRhQV1LoNW22IBjqdrHYOdmkRE2czRxNg9eRUivtY3eQWSWWgEIGnMv40gIcYgTUw5J6kYu
	hqaq9Jl2ZlusYv0wgCPtNqIIzEw3yqPG0Tz1vaZbZBkOeg9KrSioihMj5D2z89yGDwAwRGmiCso
	fyHysCYWGKuIOjCqzui6KIxtERermLlDIICwrYDP1+EfBbhIB/3A0Sfl1x+gv/LPu/jVENO5ujl
	1VfYPvilOR+mv5xngLB9CioY8KvXieffR+LkTny/+fzZYVCP35WkBBg0XqvP3205lyRAMEGYs4n
	jDR4JO0GYjAVoiUybXoYQM2G5jrO/bXg4nd3+2GXxGqz9DiJ0jfXB3oLV2JN7q/H6MKlmOIqHvz
	gplcphvTkuTve4ciPlaFtwbtvln+QaTwcUo1NPyh85kPUtCNlz/GK/1EZo7BmG3btMUs/zSSkBF
	nu0XhgbQJEeWguv2bgWsiqu/zGeA3gYT0+UFRDjCumBdHOOceruGFV8Ys5V1UhwohtDWLtso5Sl
	DUVFYUdTsz48rJelMtyRmv78eAZqr8vLhA==
X-Received: by 2002:a05:622a:1aa9:b0:536:766f:271d with SMTP id d75a77b69052e-542b781f632mr306774901cf.51.1793835356393;
        Wed, 04 Nov 2026 15:35:56 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10a63462sm36858141cf.15.2026.11.04.15.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:35:56 -0800 (PST)
Message-ID: <2a1728c5-2856-41bb-9ffd-c80df4ffda6e@gmail.com>
Date: Wed, 4 Nov 2026 18:35:54 -0500
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
Subject: Re: [PATCH net-next v5 5/6] tls: send a KeyUpdate at the record limit
 and on request
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
 <20261103-keyupdate-rfc-v5-5-de1ab90a88d5@gmail.com>
 <sashiko-outbox-198141@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <sashiko-outbox-198141@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/26 16:43, sashiko-bot@kernel.org wrote:
 > > +   ret = tls_encrypt_async_wait(ctx);
 > > +   if (!ret)
 > > +           ret = tls_keyupdate_rekey(sk, 1);
 >
 > [Severity: Medium]
 > As reported by Sashiko on v4 [1], can tls_tx_key_update() ignore fatal
 > transmission errors and rotate the TX key anyway when 
tls_tx_records() fails
 > with -EPIPE or -ECONNRESET?

Yes, but this is not specific to KeyUpdate. After shutdown(SHUT_WR),
send() on a kTLS socket with no KeyUpdate also returns the full
length. I tested this with TLS 1.3 AES-GCM. As I read the code, the
KeyUpdate record then stays queued and TCP does not send it, so the
peer never sees a record with the next key.

This corrects my note in the v2 changes, "The next call reports the
error". In the same test, the next send() also returned success.

 > [Severity: High]
 > As reported by Sashiko on v4 [2], how is the KeyUpdate state in struct
 > tls_context synchronized when sk_stream_wait_memory() drops lock_sock(sk)
 > during a send or TLS_TX_KEY_UPDATE?

No change, for the reasons in the v4 changes. I checked these points
by reading the code.

Points 1 and 2 need a TLS_TX or TLS_RX setsockopt() during a blocked
sendmsg(), which is an application error.

Point 3: tx_key_update_reply stays set after the update_requested
KeyUpdate, so the reply still goes out before the next Application
Data record.

Point 4: a record that was already being written can go out before
the reply. RFC 9846 section 4.7.3 allows this for records in flight.

Martin
