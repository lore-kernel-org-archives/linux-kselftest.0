Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7BB37186F
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772626087; cv=pass; b=LlpDEb+0+sv6ylFdk5tlkPnpY/Ze6NNei6bHYcpyJrQY5P24E+bSsoLrpZw3ZnjZ8CbpfNuzuF0QH0v3X/Rd4lAai+hEcjkst0llWMIrPdBoDsUe+gch+IGgCSIakc+m3qk3veFwsUveHlgVao4B0gyXtgT/7/AQ47jLF7FRo7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772626087; c=relaxed/simple;
	bh=1ACMBpYZr1Ks6QsmvL+/OL5ndfIMEKJBZNSsy8bTZcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPhNFHu4iwLNcOhxsjmcIbFkQsT4Yy8grTUj4JH932beLwNYLtZG0JeECIlKxkeT3TC2qUHU3GC6dNQlYkVOTq+6cXiDLMDb7YVuJEbr5CMQZmmA1zjcHUogimyJKA/BG5koTClUNX26yY48qx/aytBB6gH7DxxFXgI7psNQxiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miB9U5oJ; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miB9U5oJ"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b8095668ebso385934eec.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 04:08:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772626084; cv=none;
        d=google.com; s=arc-20240605;
        b=eFQ8A1f1UNsBK2xJvosXC9OHaxvicAoGUYxKP+aOkYkCwmp00oH1rnAl5ljIqSYqVO
         bHdJ9caBtNb/d/v6omGePDhESE+4dmfH0AxbEgZ8sOl3r3DcWsThLN9G9bjjwD3hIkiX
         Ch/nAxHLidV/eoaaAZfiBYVlveqIyTH/RWtlmNtK+Pe/pVqd4HMumTe6ds2gEkL2vnC/
         d/3k3dpWf9oASANZBHjPWLrVT5vQIZtVVEI6mVe68BljMh//w49LBWnXjKwA/+UBOr2s
         /D8Q9KKgeQFWfuIaT7r3Y1EhVngqiJMQF2TDi+rINNGYNrDD61TDCz/KE92xQZj+lvBV
         f4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ACMBpYZr1Ks6QsmvL+/OL5ndfIMEKJBZNSsy8bTZcY=;
        fh=0DEYF7ZIcGz+3nItiZ5WTN+4GshgD6rU9atAdQimr8E=;
        b=Rqzg0aNlpzbde6iVw/n7bjEodMGe6o+jiJ4f9TNohbwr62ZJPrV0/HbMti6cVg35Ya
         1/FvK9f2agjgJpA8Te9/45gV1Y3cxnkFwt3E0xi+DBLiCjhO/qZgnDTdE5rDZRaZh/Cz
         neHgUfuNq5xrsOh7J+jwUTw43eFxvMg2zvlTVLBGnOWg3wWZQpLpQaByqFpR7vqcR8g4
         ocbwXB9IGeq1zuKEFyGjZAeRrlnAwhikqFE8+RiiWl98R4BRK0DKKPmeepyjzTLqbD8g
         RPCBs69EDhxKHrUOzafPmTb9NEcBRaDMCNQAKCwZUSHVFrCBHTgDkGEkOS8QMyk3yqt3
         DuFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772626084; x=1773230884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ACMBpYZr1Ks6QsmvL+/OL5ndfIMEKJBZNSsy8bTZcY=;
        b=miB9U5oJOXpo9M1x58aisA0VpdIuubvg+6D/8NMcy9q7uShv30ZijQcfOhFXksLISz
         aC27NvIfmLKaKNS/isHLzXq++K6MKq5k9WomeLWq9wS9u/AQMZRCJFJey7G8jT+akrcT
         Oofopi8G3COo1+NwTjiGDRmauSwaFkSv/AxNnrVrsZV05LNeV3lcKbPTuRGrMYdFflTZ
         oeXIE40wrnL7wxSqcN1mNewBf2CJx+EC89ZGMTgmBL4CZTu4Aqe6jh7YxKTy6crrj8++
         3B9+jTLHPv40UWYAvXNnaFSvZLecAC878EkNnQgC3vZyr8RFSBpepoH+2aE5RW0ahIij
         JvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772626084; x=1773230884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ACMBpYZr1Ks6QsmvL+/OL5ndfIMEKJBZNSsy8bTZcY=;
        b=CkZqVuBA59dqjCJaA1QFmXfns1F7ud8wfiQ4v82wd3K7YvqPTNQu+v3ZSZIIfnDjV8
         k8g7DNAQxRCQcUkDSST9lVAdudyIwPCE0LFfKPQHyrjlQVhQIRE5RTPUzug9V0En13av
         BC9IjwGDOElxj3C3VGXYsZjtdQWUaIiVNyYUQY7/T9sTXGqZ+4kMLtRGvGYfMx8fDjUb
         l/GaRD4sQRNzsLzq2A0wwBwjoyfQM0AhoBej79nxRJ0nno3hA2ih4/D2Jzqr+dhhbIoW
         GvtQZn5Jbi8EEZtGc/4jX4TaCnf1A9xQl2TiBMqwR2A7B1QmUQJY8JZFR1qHOVr/ytft
         0fcg==
X-Forwarded-Encrypted: i=1; AJvYcCUch4yRF4tqTb6aFL3VP5xMshffKEORMbiGdWqLjKxKW2P7jaWS3JlCCB6naEQklWAQpedVSJmQWSnDOPbaFBo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+c7wE/auiecVn2GbNnvkbmLsBvs9JAk9xPH9nUF/z31a1le2k
	/zyfdahm6VyOJCPlS7qoAn19L/M6xyAef3uqSpW8i/nKnBpUaVElj9HFQN+/1sRdKT2ImkeQ1pA
	JV9RGiNSJrXB6EUOcFcwQgeOsoQu3HwA=
X-Gm-Gg: ATEYQzxN89GX0r/rfvpJo7KtE7wN++zx86O0FsT8DXbrQFhqWQNQvObrldZIrkqE09x
	L8U+BAapukjj/syvh+O7JQEBIpRjuGEdd8pE0sz6AmCoxuEaraI7Um6OEwIIC4MF8KqnvqjE3b8
	lKo0iqDjsWs3ZNfNbkemo2cQd+I4/OBmhjb5gVge8n7501Xiu4lGtMPR2Jyf1rQSyduojnJ7GPi
	1b99l3e/YVzene5pn63wAlv4berGt4N5Iz5IsPdds1mHvfnI7qwtDgalyjQ0Eh+rstTzzbVt5Lq
	Y/i1XHoT1Q4ZVrXn9oELO/Tsv6emr4DbsZw1T2Wh9/7oxNSgShz+lOYu99Y5+h66qX2oI28k3QP
	Pp00ia+5WwaR50N4271Kkkf5E
X-Received: by 2002:a05:7300:6422:b0:2be:687:5dbc with SMTP id
 5a478bee46e88-2be311fb70fmr280215eec.6.1772626084203; Wed, 04 Mar 2026
 04:08:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
 <CANiq72kROq3B=EPfihKM=bvtyqYrbDV-mkFgROdPNjbC6zaBpQ@mail.gmail.com> <cccf55e9-e744-4581-9c14-ffa54bc90faf@davidgow.net>
In-Reply-To: <cccf55e9-e744-4581-9c14-ffa54bc90faf@davidgow.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Mar 2026 13:07:51 +0100
X-Gm-Features: AaiRm50r77un-a0OluWfu1L_cwMILKtsTRe6GRTs7N5PK9FbFtUQcU2gyqx2S2w
Message-ID: <CANiq72kXjytTqpYGbNqKKPBZoGFYHT-3JMb08we9kEOqiK4dmQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kunit: fix warning when !CONFIG_PRINTK
To: David Gow <david@davidgow.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 10:16=E2=80=AFAM David Gow <david@davidgow.net> wrot=
e:
>
> This is also sitting in kselftest/kunit-fixes:
> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git=
/commit/?h=3Dkunit-fixes&id=3D7dd34dfc8dfa92a7244242098110388367996ac3
>
> I don't particularly mind if you'd rather it go through the Rust tree,
> though. Let me know if you want this removed.

Ah, good, thanks!

I saw your Reviewed-by and no notification of being queued so I
thought you expected me to pick it up.

Happy to remove it, but it would be nice to get the Cc: stable@ there
to avoid having to send it later.

Cheers,
Miguel
