Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0893229B18
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 00:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786149459; cv=pass; b=Mgv2dsYygCbax53zBhKz6ZFUC5Lkjzl+HRJY3ZDJyvH6xLuuwqerBKyp+EkBKB6fr7ZqY6G+hvLiuqC5ueUw6JK7jrNVkFw0Of1Gt9H79fKVDQZrn3l+VYLWz2SS3NBIified5BIbjYF4sispGGQDh+QSo6wieSgtTMQqhixvL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786149459; c=relaxed/simple;
	bh=CGuDQ16nfUgnqxp6o6p8whu+K77+5qFgpiP88IDltZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aq0Ao8B9j+AtRLqAbO06YPHYFer5t+t6e6fpezhDdSXX7rXZUkmfW2AZ8TMwlt2EjLhxL5TcfAXU4ntk4LPiHBLRMDg0+EnKfQ7mcbEIICqRSWNau0Bv8Ca1XAK7ok/i6LnpYVre1FrhrthY18o/9UDYbmFk9drrEI6JZY81g7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6o5uqIQ; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6o5uqIQ"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b2a4359d16so66778e87.3
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 17:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786149456; cv=none;
        d=google.com; s=arc-20260327;
        b=Sf9pD8iLmrgm3n2EEuP8/WJGjIbJaxVslqb5K4XAlt1y3XsmkDp1v8+eSTy8XXNeg0
         LAwWETqYKj9N+qOymwksphbRzBhzXkOnYxaHRwC5j4WQIYQ5ItYQz8xj1IK4VY6QnGHS
         2prxgd+dG4bSsWJDf9ZP009wTD5Qh4GCDtDxhXnbn7P65AXSGzSbkN1p8fpOqxqLeJHW
         vcmMy3nETjyHUV4wnVtGqnTdrQt+gUY8vkAkvINjYcQ5o94Zr68renm1ryj3sgL/jBbH
         UKMBQGZ0EBQ4O05RK28xh7OFfbfHHT0uOXQj6lU/Gpm6GhGZrfqoNzuQRy3kwLgrIGlq
         madw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CGuDQ16nfUgnqxp6o6p8whu+K77+5qFgpiP88IDltZY=;
        fh=wIGda9ULaZoCRtpnvcItNqUTDoM2VCtB4Qi2cxlRiOY=;
        b=GoXN+XXKrPNq6Qnpx5+VMPh30i7hKGlP4h3dNNNXe+tDl4X5FT7yampownjTw68Vet
         /mder0/n7NNVnwWxcJhxxebU6lFa5PBmh6Y0Y3eYff4GfhuQbUafbNkY5b/lOY65la9s
         bp7DAWHZ28K2DzV9YpQmCrWi9/eUyTpmU3m4tSpX89JfIrroMUi5CRNF9JMNF2oOk9pa
         ZafM8/XChPOysLS65oDbw0xzJnDEW2mtbRw8xUl37kuV2KzxT5epp5VSDg5GhNOxDEUj
         HdPRS1kSRyjBdPi+fFlaD+eAc/6Y8wck39UXu+D2i72HfBplnhQGoJ2gZVns08hJ2zZU
         9vsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786149456; x=1786754256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CGuDQ16nfUgnqxp6o6p8whu+K77+5qFgpiP88IDltZY=;
        b=k6o5uqIQ83QQKJJpcQMXDE8n67hBbvLdwsjn7RoI44/61bDP1ehxTxsgsM28EO+KxU
         sC8RNsSMdMwfxM82QAYjK5H4nNg07fJIC8K/dmoXpTsGCS8w6sNrD5UbBKCkIaLhlo5A
         nYJGu3+7viopCP+GFTE0DN9fTeMFHGLI35NrCHXpzyMknzM3s8X2XpfG3BmzcrPZWHGt
         JbJimuz1T9KZoWjlrRrpjxW+Mrq9ekdfmuIxCp/lEcaVni3/9BW2UiReGRppp2KSOiGA
         0dqE01FUrlZ14+uvxDMiCZJ740Azbt93EyODZGJDsvj4Ng0juKLXC6s2tM7lGGXGlPBi
         EvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786149456; x=1786754256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CGuDQ16nfUgnqxp6o6p8whu+K77+5qFgpiP88IDltZY=;
        b=jvc8D2eOfq/aBEcsRwYQJwpwYE1+wLT7gy3nsUqtaSZ040r+NSFYTz4ytmnxw4BVrQ
         d+mA7gweDwO5xIMzquLK2oJiXD49uaOXSE+zhWcXU67UQlORCrjjfCw+r7knr1USi8fF
         wvstZAvPoJk+05LHkxoJQZvG1PTuXzOubOsKI9m4kg3BXv20KUtphfUQUbW+PXiUxQRz
         bWjgEAPZA7soXEEKMqB3MMyGyzIjBLQ29WBAPTRd037Sr7H4k1RVvhGqitv/h5sYYx+/
         5PaqeOU06n8vz3kTfW7xDiSRC5QEqHcJ4QPltCLtfBWhWiiCCMwYK6BdCg+3qba0Cz6V
         fg9w==
X-Forwarded-Encrypted: i=1; AHgh+RrnVDol4oAdRMTrQGuLxEXo3w2zdwXYXa4Ncbc1ldYDTW/CysBj/hwsr7KqwYwev0zsmgreRaPKlhNKOomzYRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Othm+xYqDPv2xUfygTNeoEuqVrin7ABRU4KrW34qaIROkQ7A
	men0sOM3m0KHUp9d6RezvUG9uXKHYiOmClQiLltPEuAy15II5ujQkYJRaVWd8T8VEgLrS3rGFqh
	I/b4MZkKqcX5qjAF2RYZ5CwmSwd4xNp8=
X-Gm-Gg: AR+sD11pqzJuziHCu26eFblSXJDrIWjzxPsLTRqhgLyHusTu3VyhQuFHPsItJacKmGR
	Qsc45u7PtcP9DDC9K402gzFrO2oF7UDOy1pnDyPJuml8DgbA83EfKAbe/zYCZ0cmidI8w+MIcQM
	hlmuk5wJ+dmGiXzFegoZho4jBJf+bb++ke+HllIyl5FIx9ryvBjHCHkrXGQbuA2DNVSrDNdXkUQ
	s2H10CZnYI9u8BhyIo4hDElyA3wNSQJ8Ec4iUzTFGjNI8LPoAtqRFRQcVUQpq5Evq2061LMHUW/
	Uow2vePUL7zEah7ZM9OqchHW2PDuxQpSK6GwC9ePE880yDLhQgFouutScYOwTNLVnLkmYyss5nD
	Gj0/J3+udgWp7mepS0SgJDP6fUdTV8MdQ4Q==
X-Received: by 2002:ac2:4901:0:b0:5ae:be69:49f7 with SMTP id
 2adb3069b0e04-5b2f4c92660mr2879963e87.23.1786149455584; Fri, 07 Aug 2026
 17:37:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804014714.4362-1-sigefriedhyy@gmail.com> <20260804014714.4362-2-sigefriedhyy@gmail.com>
 <20260807162154.GB2186508@shredder>
In-Reply-To: <20260807162154.GB2186508@shredder>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 8 Aug 2026 09:37:23 +0900
X-Gm-Features: AUfX_mzrMnAMjlRW4rdKMx1SejzLIoQ02rv_v6mycJ6dnSZWRpOLrZP6x_qM4Xc
Message-ID: <CA+7S2vJ7DSnU2xH6dXUj1+-db_JFJF8kdvb0g2UttFgO5HintQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 01/10] ipv6: add ip6_del_rt_reason()
To: Ido Schimmel <idosch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Chris J Arges <carges@cloudflare.com>, Daniel Zahka <daniel.zahka@gmail.com>, 
	David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>, 
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Gal Pressman <gal@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Nimrod Oren <noren@nvidia.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 1:22=E2=80=AFAM Ido Schimmel <idosch@nvidia.com> wro=
te:

> Since the function is only invoked by IPv6 code there is no reason to
> put it inside the guard and it would also suppress the comment from
> Sashiko. You can place it near ip6_ins_rt().

> Please add a note that this attribute is rejected by the kernel in
> requests, like you did in patch #9.
>

Will fix them in patchset v6.
