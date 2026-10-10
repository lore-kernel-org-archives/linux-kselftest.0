Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14F03C0A07
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639612; cv=pass; b=rUf6lzmm8+b/puxbJ4RYKyb2FxB4t2C/xJWKJ6DEnYYfKId5DnXr/q+d3ZML8rTEP8We/HAd9UCm8kOxwUuN62iiDVTPtlnN43oGMaOIFngS2n3mC5gsmMjqLRNri04vLc2NytADwr1W3ooML2zcsewKB/86lY/Ae93PdusLi8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639612; c=relaxed/simple;
	bh=iYqhoVZ+Jyml4P0MGYzZBl9up/LYhbapQ8gAv8jGngA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uv1Kqzxuoa4ZoQo5/PP9YzpmpQNFMTtzLOWFUUdeXn2/Vwvl/9N3V3oV5DtlVgJMDRtRVCpvII3T6Jk8032DvfQI4DDjlfS/YR9NMYkIxN/JYsG8ueecQXAib/jr8x0bt55XX7AhqQYKT6Xkdww0tfM8JwPLENBXK3I1NptUrz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXAZ9GWq; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXAZ9GWq"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso606617e87.0
        for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 06:40:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791639609; cv=none;
        d=google.com; s=arc-20260327;
        b=A37TnD0f69IGl4m0cvoLwxT+KjkG9tOSSUQ289MJ9jagVgD9IMwhOiIi/bwAHc7aMy
         kMJhpELBM2xYTvcYGcg6Ksv4gE7kdF0voJwsyp9UPTCTqRMgIPsywQQvZ0ukZ0RAXm4n
         AowygCQTDcQIMu2U98d3D3uyZRAamNpJV0nZisITxFEFHL5BB3R3Rwi00vRSOXnhmFeJ
         tiK4rz0Jl1lKHBT8XnTsDa9/eXns5MZQvPGc9v4LEZ4ranUP3YHq+NTEOmnMrEqWYvlj
         IcK9vevyp4NqH9Je/60nbSW13U7hc8VW+PijT23Jmux+IRJu7T6gTuuCfCzSrFn4Ieko
         vm9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1OMPvqt3i2+F+trWLfv914nMC+RGH+n0BOpujrLH77w=;
        fh=0q8rxknd51bQA4NjX4u69YVhQxyDioVYuHBcdDhs/QU=;
        b=BneeUFId2cX5/eCwqCPEN0QKLRL+71myB+MEKMFbI5haW0PyNmtIJGxFg/SzY4deLa
         A/pJJ+8sSMa7gLk99g/zaCFQ95pGEqUpJRY2pd7ESZxOwA8WbsDQYQBo43iAn+ae/Heb
         pRryQE7VemUNEN1PYKHeWgKORJC/eQntqtbLgAfsSLRe3W6JIqS0Sf5WPQfZmV9EiUAD
         LNXqr7VRXaL615PHWc3RFpMfxJi0ei68NjYhDLtLJylJ8ywWMxG38CDmuXUW08yD1StX
         2Pr2cIXn1JxmO7+m2MM9d7o1/4lxz85hOgd/3QWKmpJWnG7VIT8JRlmNYje2RhERMC31
         nKiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791639609; x=1792244409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1OMPvqt3i2+F+trWLfv914nMC+RGH+n0BOpujrLH77w=;
        b=ZXAZ9GWq2w2N/D2wWSTnlOkfEAe51ltRLDrYbuiULJDm7BKDbfNcqJWB0jDk7LsJjM
         zpSXQMq21iq+Uq4i8loxLMWjHSNKMJN5vv3+jzIc+STsBnF0cIELEho0GZTiYEOR4jsi
         3J9Rs9gsSPM63oCfE135zN/SgdVq9hbvy2yta4oTJ1JHo1HNhDajWflXmGiG8XLuDl69
         HGSLHWTR9gUOvDtkqc6O58y8bw44wmUW5ejuuNyf0AV4OrrVqWK48M92yJDeGDYzsTGe
         UECbrTh73toJRj+3j/J+SuN3rtW6enoSZ7iIctMYVc6JKYEbsu6meBwLNhxeWVVF97ec
         brkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791639609; x=1792244409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OMPvqt3i2+F+trWLfv914nMC+RGH+n0BOpujrLH77w=;
        b=gsMPqmQiM8MIo9feuMJwzhLpQ6fZXejml0dZEkrIzFmIaPi6GpWC4b4I9SHwpfDRKS
         I6jJXwHHoBww83A1IQmZpeCVYG4j8gtgxBCvw1cg6QK3Cf+uJpTDRFVfA/C/V+ZAKqXD
         uMDEaZ2a6zmZa1/0gUzsSlaToe0GvKHvgA5hsltLu5C8H9AF7VbbfSVne7UYWzXO05bj
         ugzlP31pJ1fJAx0ZiADQw3hSV356dUSx3Kj0KKoTPl2cOd+ch2WUNhrHyEw7lEEgISeK
         xufCN3f6J4okSp1cryBq7+tMtf/MCBwS1WOgBEqFMk1MBz8fqOoA+QiY6gJ5vSPHNxvm
         RsXw==
X-Forwarded-Encrypted: i=1; AKwUvBz4hGwNGtAMKCSznA9FHXEFJ4IZjvvdLBC1dLavxtIx1tvOj7ACO3GKeWGTd1SReDRhxozP4YxpngYPqZ2T7rQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5gNr2VaTWUjjVLnda0OiZNVXHVp0kU92xjYDJQ8+l/XkIc50A
	fJvwSL6O1/jVjvpg6LsxH1CEa+J3C2EM2NY0VrZg27jYF/KZ5dtCMkLLHe1mUWLPSpAblc6EiPp
	Qz7BjY7WVArbHpGjviOBJ4GV/hL9uJbg=
X-Gm-Gg: AYBFou28KIfzUrLBn3rszCunseMV0fWH97VTvLsy8iXUkb38kbAQmVLLga/y0/L1yKF
	amsbu6FHm+lkMZmlmC9ZEt7h1/1DyQvvXLooG5isvUPajANBM0Gw4bXe4TWYvoacmpU3urIwHr/
	NlWZu86z/oer0Rztzi6t78gONCISj2jE24i87eDNADoMggcUOgx/3y4gsEVakQiPwc3xon4P+ro
	lk07Bf1hSMfaHhmwmJZX+s5lUlDzwx/daAMZGI8yba6QZhh5U8pkXCWSMXOv42gVdnGqrk+Inf8
	hUXtjqVaor4TM6G8dj0qtd6npF/TfvrWNacLIlA5leTUUaowHZePaYw28ZCY+1wJJPN/eMNIJjQ
	xcSjS4sD7HCVfvWXXFU9zYWt2DlM5EXqohmXh/R4DCYWe
X-Received: by 2002:a05:651c:54d:b0:3a9:7f37:9bbc with SMTP id
 38308e7fff4ca-3a9c535761amr10525921fa.11.1791639608635; Sat, 10 Oct 2026
 06:40:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007115821.11332-5-sigefriedhyy@gmail.com> <179154713266.434549.3119718667275543634@kernel.org>
In-Reply-To: <179154713266.434549.3119718667275543634@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 10 Oct 2026 22:39:57 +0900
X-Gm-Features: AclHuK-8lTLLnkYqyGO4ub-KfSnA41bLKl_MgKWzh-nerGwP6xbhIB0UlOeiU2Q
Message-ID: <CA+7S2vJEYr7sbRqf=QdURN+gLp=5aaRGXG3iprA5Rz4-sEqj3w@mail.gmail.com>
Subject: Re: [PATCH net-next v10 4/6] net: add AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com, 
	andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net, 
	dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com, 
	idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, 
	johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com, 
	kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com, 
	pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, 
	sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - [Medium] dev_mc_dump() (net/core/dev_addr_lists.c) calls
>   nl_dump_check_consistent(cb, nlmsg_hdr(skb)) once at the end of every=
=E2=80=A6

> - [Medium] dev_mc_dump() reads the generation (cb->seq =3D
>   dev_mc_base_seq()) only after the walk, once dev_mc_dump_dev() has=E2=
=80=A6

Both are real and are the same problem as reported on patch 3, will fix in =
v11.

> - [Low] At this commit, Documentation/netlink/specs/rt-addr.yaml is not
>   updated for the new AF_PACKET RTM_GETMULTICAST dump.

This is done in the same patch series.
