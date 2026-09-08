Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575E25908D8
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 22:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908164; cv=none; b=TcgIguy9iRUpuvC1SWmgXU58v5vPhMzgtm2bwCKeZuOOjzW7RUyJ1llYGSjQGNJXcVK0le332Y95t3z2w0QeBe4Fg9r6lXanMJYQCiKimhLvdvEJBUoDbQ6L6mt8n7wnafZmiEtDZtyqsFZ2RQpIruw/kxp9xSoFwO+SN4fG5bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908164; c=relaxed/simple;
	bh=vsBDx43bAIddb0gfmnVkap80n2BUxIXNwZDCRSqU0zw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=YH3vt01mapU8vgnhvQ3ygAWubcmC7i5Rl5KuF3q/k9zvYpUY7yw+ol0O4ZBL+CUnOJUECYRc5wBpAuMMLzXeSVpXijjk2xHgSqy8Lx8CxjTMItYZoaK8gZCIjfhVmXP34cIwhgJhq7i1fmtfvgvornlYbAWK0Yq9qerA1EYZZOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDkpzYc0; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDkpzYc0"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51bfe810293so48609261cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 15:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788908158; x=1789512958; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UviIj0mAB9dLNORxdxu0OPN9iCyl2WihzfLAQT9a7wo=;
        b=KDkpzYc041R3h2s9AQirb4FzpjNMighuF0ou8aSbF8I/hNXwQIAgtLhBVKp2sYroi3
         K1TkN/11tFF2AvRK2eUW1aMvg5WexzneuKA0nFiapCYUlmBI0K3+ujdNaEW1sOcBjYsz
         bynNrPIL0fTItC9kSQMh+ba1fkvTtK6N+BxsW3qvZycNRX6qTyHQ2poOVgTNigda7SJe
         5MNP3YzXfvFkpOli8typDkTpvjRb4nB+vTp7RTNFtsIeazDxGEDqCxke/tP2AKKguwWJ
         mmE3KKSMg/IlWfaYOrYi3bDu2Qbk+oEy4uogEqvUgKJpfXRbJng+G24hhX1nKdgdu2ph
         ySrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908158; x=1789512958;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UviIj0mAB9dLNORxdxu0OPN9iCyl2WihzfLAQT9a7wo=;
        b=qmqnWi2JZcPaScbvq2YlBn38vG8YTxhoJB7Norsi9OW4QuB/UDy5A+kNLWfAm1z23p
         8xuFSZ+WjMrm2FlVdtr4kDlSBb98SVIO7uNSWEBiRvSH1F+5BrFMyarUIrTWs1BGj/H1
         G57uEyZF5lo9SncLrUvKjiZ7myANUEzdjwlNmdbzMd04h+Br/47RhgV7mxoMr6uqzv4F
         akDzErHPzperASb2zURrZTBiQC2mYNUar3Vz8Q3OjjNy+MQ8aDIGO3rfvyY1moV9F8y9
         daU9J0K5xPDBZ9soLj+nA54WGXwWdAor32jb6W4mYNnVZK7qgehc6wyrUTZIYLxlgWIa
         7LgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMKvq9o1gViZzUj6sYzJbleS9fHd6BfkT/tHfbQYlYpseiuX5St92nJ2rEH1UEVNACz/1PW7a+eXO1ok4SAb8=@vger.kernel.org
X-Gm-Message-State: AFuF++ky+BeIgLR72scisZKzXkgbGoQ8lK8qvoFeoPRkflaj74ynL5p7
	7lVrTlCnZS+XmDya3NDUNbf95QtNwFqIL23CbImiYJNEBrQpMupbGkk/
X-Gm-Gg: AYBFou2STiB2EEM/5hIWchZfUasoMN/BhkGKLEmtO5+ggrAqfZZ6OJHHSaMBsTf9K+C
	1Iq8u1yAaVmubf1z8aO28kKpn5LxtDtTcFJa/ZRIpNP3td2km8EHLweItrGnoC1zVyghNZzseaH
	ZEK2jlGg4e4gLOrm0j8S0WWCArAr9DohilFpvo3BGSYsayPaEZGBNc2unAYi0sfR/B0vqx2YRmP
	bGCBRB/GUBG4glOwk/z606sNTfWGve5OtcJi5omRGzVxa8FFonJ2V7E9wEpV3EKhHNL5j9idtc1
	RkdLLzgy3IXznDYPveEZg6ZRl5IIrBJFsmntjl8wgtcE796qojf2lIIUGiELmdoIq25bXF++EmU
	IY4If997lA2zXNthfQYmjDXUTS2oeVRjCHaTkzYp5bqRY+8aGTv7WiOe2hBfDhEGlJaR9RXjhuH
	X2eUUay81HOQXjePM3HOftA4EOjiNuCj4ZdVBQ3ySVJ/zlIn+QNw/ymLHHvCuXwa21bQ==
X-Received: by 2002:a05:622a:551b:b0:530:5418:92be with SMTP id d75a77b69052e-53054989290mr42134121cf.28.1788908158185;
        Tue, 08 Sep 2026 15:55:58 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106ba5b95dsm7172286d6.21.2026.09.08.15.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 15:55:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 18:55:56 -0400
Message-Id: <DLAB0LQ7WDE9.1IUD2U6BQCRKS@gmail.com>
Subject: Re: [PATCH net-next V4 13/14] selftests: net: gro: Add PSP
 encapsulation and encryption
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Tariq Toukan" <tariqt@nvidia.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 <netdev@vger.kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sabrina
 Dubroca" <sd@queasysnail.net>
Cc: "Bobby Eshleman" <bobbyeshleman@meta.com>, "Boris Pismenny"
 <borisp@nvidia.com>, "Carolina Jubran" <cjubran@nvidia.com>, "Cosmin Ratiu"
 <cratiu@nvidia.com>, "Daniel Zahka" <daniel.zahka@gmail.com>, "Doruk Tan
 Ozturk" <doruk@0sec.ai>, "Dragos Tatulea" <dtatulea@nvidia.com>, "Gal
 Pressman" <gal@nvidia.com>, "Jianbo Liu" <jianbol@nvidia.com>, "Kees Cook"
 <kees@kernel.org>, "Leon Romanovsky" <leon@kernel.org>, "open list"
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, "Mark Bloch" <mbloch@nvidia.com>, "Petr
 Machata" <petrm@nvidia.com>, "Raed Salem" <raeds@nvidia.com>, "Rahul
 Rameshbabu" <rrameshbabu@nvidia.com>, "Saeed Mahameed" <saeedm@nvidia.com>,
 "Shuah Khan" <shuah@kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Simon Horman" <horms@kernel.org>, "Willem de Bruijn" <willemb@google.com>,
 "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260908065244.3799142-1-tariqt@nvidia.com>
 <20260908065244.3799142-14-tariqt@nvidia.com>
In-Reply-To: <20260908065244.3799142-14-tariqt@nvidia.com>

On Tue Sep 8, 2026 at 2:52 AM EDT, Tariq Toukan wrote:
> From: Cosmin Ratiu <cratiu@nvidia.com>
>
> Add a PSP mode which wraps every transmitted frame in PSP transport
> mode and encrypts them in SW with the help of OpenSSL.
> The receiving NIC decrypts and decapsulates, so the frames seen on the
> receiver on its AF_PACKET socket are identical to the non-PSP ones and
> every geometry assertion in this file applies unchanged.
>
> Sender packet construction is unchanged, PSP uses a different buffer to
> avoid double encryption.
>
> A few PSP-only cases are added: psp_spi_diff, psp_ver_diff, psp_mixed,
> to cover coalescing scenarios which only exist for PSP.
>
> OpenSSL is optional and scoped to this binary: gro is deployed by
> several suites, so a missing libcrypto costs only the PSP mode.
>
> Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
> ---
...
> +/* PSP transport mode encapsulation, as built by the sender:
> + *
> + *	[eth][IP][UDP dport=3D1000][PSP hdr][encrypted L4][ICV]
> + *
> + * Can't use the kernel-only include/net/psp/types.h header, so copy the
> + * encoding here.
> + */
> +struct psphdr {
> +	uint8_t		nexthdr;
> +	uint8_t		hdrlen;
> +	uint8_t		crypt_offset;
> +	uint8_t		verfl;
> +	uint32_t	spi;		/* big endian */
> +	uint64_t	iv;		/* big endian */
> +} __packed;

My llm is complaining that it thinks __packed is not defined for
userspace code and being used as the name of an object being declared,
instead of an attribute. Otherwise:

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
