Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122804;
	b=b0mbv0hVZpvozpXOPeo8BGuvyKDtPB0OaxZ5IQdCxzKmhSoqtarszR4AHcZTMMxg+ole
	 KxLpnigVIH7pDGGPfKG1mOcPgA0xsxEtlACLUp8TXkuznfsUhSYEkXD7UX5N9FIPo26C3
	 ekUv7aapcnuLqBWmOZM49LSAs/KqkiTo7OQD5ctm6RX1gmW9sHXt8TBR8N9kkSqlZry6m
	 ZyZdvxNYZUVYu4PdusSfG6EF+fis3TtBrvP/n7EFvw7J8BijbQkUw7icbABwg3EvUEY88
	 8jbJDkBn1MDp+tftP3n0dnDcDSUcVsNEcoNCGgavpO4/eH+MJOlfd/1cvVINXA01o7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7uQtFNOdQLFaDhr2O+xKsh0q3GABDuv111m5QXQWzZQ=;
	b=bm75eMW0u+RfdLED038MdkyrFmIoiZa2Vo/gmOoP//OJLjBcnOo/T9pea2uhrbqVBryx
	 InhTUFslWYZFFE0Mz6IEtooejz2JDc2RfcxIS8AEQgVB+wOp0bqExJhEIdP1sqBrBzl+2
	 CiYHvNP/AwIukxQZ1iyl6OGSoKE/VayR67SWVYGIQ5qmeMkyd5Bz5ryq/Mwj2zqiaV1yR
	 /67p8/ylQrbWjCwpijpIJFIri85gOx2zTU3vLKPDHUD1HG+zE6gpaQaNfw9dqKpD82eGM
	 +ikwZdgkeqWSkgWpMWIbPK7qJAM5MeklDaTXPuwsA6XK7K2ROi5aNltjxi0Mrqcoo0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWExxlHe;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEC6606A33D
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 21:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAEC6606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWExxlHe
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9495e8ae239so27461085a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 13:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795122803; x=1795727603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7uQtFNOdQLFaDhr2O+xKsh0q3GABDuv111m5QXQWzZQ=;
        b=uWExxlHej4/g5IMBDYKhLOiKScIXVgK7/fzcH6uPm4B7PWN6GBFYe8hLUAyEn/NR/D
         yWcZtnkEjJ0B8q4SuHNDLDzaH58ZES6SCWCQz3EtIbIU57241Vop9zAETRC7e6LQ3ZuV
         GF+4KVNXMFPHAXcHx0kX8ysOznPl1EvWT9/s9gNB5ipWmFBgsNkdKIZnUP851RUyZCW4
         kIPK6Lzz1uETDrMf5HGJ3fBJpQ3RjWFS+k4qDmvFEItO41oRuGxzP8ToDnNKyGeaGyRL
         4HSoVGTPB0wHZ6o1DvkxzqkBZmEmmbYNTXgolxI6URnoVyGnEoZNDh+N9ssbSozCj5dm
         19Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122803; x=1795727603;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7uQtFNOdQLFaDhr2O+xKsh0q3GABDuv111m5QXQWzZQ=;
        b=G/bB06OWz0jZ1LcrM8WYqP7EHWzlQ4v7Mcp4rifK6aQ0yEUJPD73KqXlgDHKFEc7b8
         gcOymnU4P7zG6thVkPWc7o9rbTR25212ceNEv7wQ5N27Li9svJxsd6Lu9DUNwgCi4LOm
         3hKW4kJvCW4arRnn4fI/yGOt9gmH6fI04LAfsDPcHR7Un/JRkPvDTo01qcELlbJLu108
         iG9ObRrfip1VRqE3zflDsPAQ9upbJUNbFSlmqltYwFM+6abxXodrWWHQsNYQJo1z0TFh
         7PwDkg+4yKnLTcThY7lxYXTpyCMqaOhYmnYgqBlEsrsj0eJgisH96HTjxstToMbl6raE
         qplA==
X-Forwarded-Encrypted: i=1; AL+hErHQBBWkIonqdurjBQ0yWyiJvWtnh9x2D03BqVgIZGVtDp2tbNk7umlFsUNEin7TIe+TL9kudxYnfk26QCas/uQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WOuaHsokOMFmbS6VRHpB0TNMDp348KDjX8T/qqFJqxV5c9iHB
	/qIerifRdIoyYIqaKe/8as2s/VquH4eQ1AZkQIxZJMjObX7tx3W87qca
X-Gm-Gg: AYBFou0XGaFp1DWqOgG0KmBAfrDC/m7pq/xfGy09LjtohdzbzaACmIKcx4lJotUEmry
	S9MbGDf1uab8aK+0JaWwkYUW6udrb1zGKDNn3b1A6v84D9PiXXjFvQdNQYv9kCyl398KBQEfu0Z
	mYpC508uIe8vAoN0ZoXdOlnJsIAjjBmL4bFMbe0wEQCbor25q1016OOZUPPh8dJkXePZfFk/yE3
	O9Be9IJWE9YMfzTanmtim6eTjzYP+kN4im2pJpRNZkIyqFsRsELHR3HdApUeevqW7iykW3iuWaJ
	CVhzk1xFe5B2aEZbD+UGs/MXyX09oid133AH5MdVCiv4LILka/cbOA/mcHJKbw1W9JDNui0v+YB
	wayqOlPEDJvWny23NQ2pWKNqeaZpAam2/Z9sfp8PZak4pGOW0q+IlQk5AUOxoIvHBnosKiOVRSp
	nzQKaC2qUtFLwI8cHI1JSxVXsiR1UzH4e06iyDg18hHle6Cs4gLWAez7L5BF7lhe+BVnjgKNQ+j
	fPHoKIUm7iC/fhA+ZDRdA+Uj9q3evZ7i9Png4UBTN5tO9tWOSiEfI3nGZ72qK1xR3hGBVc5yoSD
	S0rljnjiobP/NRb+eufqyLZbJIaARNA0CSAXNNKxM9W7ahriE9N5/gB8cd1k9HYXAh5GdLf9YeL
	h/mpUqmCK99zw52jeFElJNo7sagDki1WlBBu913vdpYqe0PA/7D0NGlr/Uo7ILeU=
X-Received: by 2002:a05:620a:460b:b0:93e:fa30:f1da with SMTP id af79cd13be357-949ba9e95f8mr157198485a.45.1795122802898;
        Thu, 19 Nov 2026 13:13:22 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34a38bsm47654385a.13.2026.11.19.13.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:13:22 -0800 (PST)
Date: Thu, 19 Nov 2026 16:13:22 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Gwanhyun Lee <gwanhyunlee@gmail.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.10e4a96974af5@gmail.com>
In-Reply-To: <20261119144241.360238-4-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
 <20261119144241.360238-4-graypanda.inzag@gmail.com>
Subject: Re: [PATCH net v3 3/4] tun: clamp zero-copy copylen to remaining
 payload length
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Junyoung Jang wrote:
> tun_get_user() also derives copylen from hdr_len or GOODCOPY_LEN
> without bounding it to len after removing the virtio header. A
> padded header can make a short frame cross vhost-net's zero-copy
> threshold. tun_alloc_skb() then reserves more linear packet data than
> zerocopy_sg_from_iter() copies, and the uncopied tail can be delivered
> to the network stack.
> 
> Limit copylen to len before the NAPI fragments and skb allocation
> branches. The requested copy length then cannot exceed the supplied
> payload. The normal skb-building path is unchanged.
> 
> This matching tun issue was noted during review of the tap zero-copy
> fix. An AI coding assistant helped prepare the /dev/net/tun
> reproducer. In x86-64 QEMU/vhost-net, a 14-byte input produced a
> 128-byte frame with a nonzero uncopied tail. The patched kernel
> delivered 14 bytes, completed 300 repeated short sends, and still
> selected zero-copy for a later 400-byte frame.
> 
> Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> Fixes: 0690899b4d45 ("tun: experimental zero copy tx support")
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

Thanks for converting the original patch into this more complete
series.
