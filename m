Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792701359;
	b=df329Xil4ZJY47oItwdqOF9f2EEAruuo/+Df5kxkbblyQzZ16Sa4jqF8WgICN7ev9tif
	 AP9FfJom/dzHeF+OnZpvl6zhnVmr6mIjT8AAr+3+OObvgpuvLKZvwP7xqGnpio3tuj9g+
	 fL7MB1XMr9gX6MylWLMe3ZVW+iJEuEzj1NdXSwtmYeQdrysMVdIQOBIH/kvDcMmTpqF2V
	 AV+43VOyYaPcWxP2JxFth/NXjmO4qAREWaw1xcJe9ciyE10VXk+9213v/Do2NPuCc44Pd
	 +pTNYxEhq1tn0iuTO+ZVhFYABPRFJk/XNDly8WPtbMAhLuLweFnsBYpDUBD7wzwWwNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=O3SMo0NE3DLwpih2KEd64CxyKuLYy3YU4G3rWnR4pLE=;
	b=cXe/Gv3AS00U+I2FYfXbeDwmT4nHbVLKuy6fwq0vQbCHpPfN1ReSSp+1Rl6sXSqpKvkG
	 CEbtONlfJHPCreKxAd+k6S53w1N10htbcZZPxF1yYS4yQBatJf0cJ1kdWL3tj9n20OK5E
	 hmsoSkg8QPoCUHxeikQ6keA/dG+D+6Tm50KsIsW8SGF2oZfAqIaw9T+WYFsdoToeqvKEw
	 kLCz9TD/NrIZAEDGbZRF+NHy3V2a/nMxyA2mAPla/riZkHBVVz5VZE54aaqgRgwpaKMru
	 EcfFZ2fikT5slA2jFOdPjvwYtNC0C2cXdjKBTLjHG0nE19STEsKSjkkU4P0NevGeCsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="exiE/1Qo";
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646ED606A31B
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 20:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 646ED606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=exiE/1Qo
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eafb65e169so204790e0c.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 13:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792701358; x=1793306158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O3SMo0NE3DLwpih2KEd64CxyKuLYy3YU4G3rWnR4pLE=;
        b=exiE/1Qozj5ypis2bDJhhKzYBSjGcr534nMvbfngWGniIu/6R9Msw+nBY1APTgiVbP
         VaI4PxOMSijd2+vhySeJq3GEoZSarPiWPQGzEby5iuFK6MtKqanox11GJ+Jze/cfX62N
         +k+SpSqSOeiSoXrvGUvbSlwPb7CDXlWhgviiWi8Isv8yTipm1WAql3Lt6zZUaojCSjJJ
         AP6anqAQT5EW82wBMgUKG7q8rJehluPiL+rwJ5XvGd4pivv06qzSnSkZyQMuxKvL2M6x
         rQzdST0Jscgv0KlF7yfN93Thj0XqFo+VSBkvsV3pe6gq8fSLci+GwE74fPoZjvqn9nyi
         OzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792701358; x=1793306158;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3SMo0NE3DLwpih2KEd64CxyKuLYy3YU4G3rWnR4pLE=;
        b=r3bbrcIfAUmrQelU32ofkA4jJ7plUwb3Njq6LHrzif1fBb4E/jcjeRtMslpwUloXe+
         HcsveTo8x9Iu34TnszT9GGsx4fqpT5c0OID+JcfpXcqPbSK7SNDbrcsFdjwPHNhKvYUF
         2EjbuQDZIFw3cxIC7U2K34WpCTdrW7nH8Xi1TdL2ijjwOWzrJnABl/HI/VlixyS/Q5GC
         ahrJWDsohKgDYB2tJyVYgyW3sK4W26vuxTnpEL7MorUBw7eryX7R/Bs+JsfSf46mJI5z
         Dtb/MIP7AZnJeEjIz3y510ddQvfeK+oOupVezMNFkRoSdOQBnS1dytZgLYppWVC5Xu72
         Tb4A==
X-Forwarded-Encrypted: i=1; AKwUvBxEJYjChMSSlRz6ou49n+Xb2/6RzJA9o/Ua97TnijTzu9avBfprt76EcePkzPOlU8Ry37tsawQDDLizq4o3Hio=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/uAEdyRTwAv7M7zvQ9Th+WOATvQEC1S+wmQGvCvNzPJCfHDRc
	ZPg9plM8Vje1ct1aXBNdsrZZuO40FDKvpHNZpbpCLkKQtg5tztEDFmPE
X-Gm-Gg: AYBFou0uiqDbI2Pw5feWfL1lsG7kWdGpbuoYZf78eotQ24+nkj3ExLQTpG7wCGRZk6T
	cyiG8hKmAwtygEURwwNFfQKhDsyql6LX0/33Mac1zdkn7BdzUJ34APKYzfuEALO2F0L9Iow8I8y
	Sg4Y+pBaaxPp7BqbqIuhyBLm+Q3O4h4MrEM27yXw9dqup3HpeoFuqV7hbcNDR5upTA+9VE+mCK6
	PQwMktZO8sYlkowcBU53lnALZqM5f8K1J9wrj0d1Rdh7T/VqC/FMUJ16dmxsVlAYF09iSbGpARL
	mxSDUleOMH/2FIkTGXf0s3KqFoSXdWjB/W/CwbX+5KtIUJDkIn23LSic0S4IgUgeFhp+9iiNgq2
	zXFb3ONH+mbSsqg83wxGvs82eqtaV234vaiLcGCBjDLKdUbOL7x7saBSk3uemEZgOJ3Y46qJYi7
	6e2980utC2pFkynD0d4SKD2o4cHEK4fIVL8HI4BaKE6VWwAVpbws6gbYIoC9VQKyP4BuO1VFm7H
	qfLdeKEEl5MaQF7NwffbgXpgtE7PZkWyniDF9teaYbhXVRo1zjeZBY5cShuUd8TL3MSjWMen1Pu
	3CGmZ+den1ZNwdrXL4ogCx5jIjdppTqaQLPoXwIM+Cu/sb4aEDRMo7ZSSu7gl07EL54Ls/fffL6
	K1CbxfOKBn/p1rvspZv4=
X-Received: by 2002:a05:6102:5708:b0:7cc:2c52:47aa with SMTP id ada2fe7eead31-7ccc2c697d6mr355449137.0.1792701358326;
        Thu, 22 Oct 2026 13:35:58 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13f674c5sm218083e0c.16.2026.10.22.13.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:35:57 -0700 (PDT)
Date: Thu, 22 Oct 2026 16:35:57 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Todd Bert Freed <toddfreed@meta.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Shuah Khan <shuah@kernel.org>, 
 Rahul Rameshbabu <rrameshbabu@nvidia.com>, 
 Raed Salem <raeds@nvidia.com>, 
 Cosmin Ratiu <cratiu@nvidia.com>, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.fe159199a64e@gmail.com>
In-Reply-To: <CADh2yMydLVUozaXJR=uvkkw5AjnxYhFs7V4dUAkfBs66i8D4ZQ@mail.gmail.com>
References: <20261021210200.788191-1-toddfreed@meta.com>
 <willemdebruijn.kernel.31749cef483da@gmail.com>
 <CADh2yMydLVUozaXJR=uvkkw5AjnxYhFs7V4dUAkfBs66i8D4ZQ@mail.gmail.com>
Subject: Re: [PATCH net 0/2] psp: drop packets with extension headers in
 transport mode
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

Todd Bert Freed wrote:
> > Todd Freed wrote:
> > > While working on adding support for socket-less psp associations, I
> > > noticed that this case was not being handled correctly. It will be more
> > > relevant with that series, because it adds udp support, for which the
> > > psp nexthdr will be taken from the inner packet.
> >
> > Just curious: what is the plan for replay protection for UDP?
> >
> > As PSP depends on the inner L4 for replay protection today.
> >
> > FWIW agreed on the ext_hdr conclusion in this thread.
> 
> To clarify, socket-less psp associations will apply tunnel-mode psp encap.
> So it is in this sense that UDP will be supported (not e.g. adding support
> for udp sockets with transport mode psp encap).
>
> That being said, UDP which is PSP encrypted (transport or tunnel mode)
> would be susceptible to replay attacks, just like regular UDP. Except in
> the sense that after enough time has passed, the packet would not
> decrypt if received again (operator has rotated the keys, etc).
> 
> Not sure if you had some other kind of replay protection in mind.

Got it, thanks.

No. I'm just slightly concerned that casual users of such a feature
might assume that the security protocol handles replay protection.

