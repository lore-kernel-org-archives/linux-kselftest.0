Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3237628488D
	for <linux-kselftest@vger.kernel.org>; Sat,  9 May 2026 01:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778291641; cv=pass; b=VOJ1daXdE3mh8Z+O8lZ/S+ZGIH1D/QracHHJjmcGu0sU3cWe5i1Wlq3Bos3bjd3iJVTGiKxrAgBHcDcgsk2qqVkZmMPQFFvkPILEdEIUepvRPBj1FEMM1pyEH+OGPHpzNXvK5REAqInCHklHj/k5TfHREjVIdPkl3wtGknRlPJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778291641; c=relaxed/simple;
	bh=1PWTKn7AYLgvu7KMlD/EOdk2ffKe20IVZ6QglBuuceg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gC2ce33G246zpYlWemTJfrQ+6YAe0fMqqCxJj9lbKYdXYmCzQ1bpI5qO+mzA/FJ+1KaPFuFfRbaAMt+l7N8xntp3frhTH1ewACIrSOAWUhF0xgpcuXsWtjs4l22wHDOpmnCIund0GdtF8ON249l4Eg6GNk0/YJdjgVfc1dKYIhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oBbxPHZA; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oBbxPHZA"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67bc6098640so4044990a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 18:53:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778291638; cv=none;
        d=google.com; s=arc-20240605;
        b=REF6plnwUI1BPTxu092nukoLmletMUDTDXuDlZxVy0EugU5Bmoja4U8QO8GebAbk5h
         KVgjZSWbJb/MKs7FBzeOl1oryzhI9j8mbUV8auf76fSNPHSfSOMvzzscuWeOyV8b6otd
         M7wNJ6Wbjw6YC2pi1HXXPFWBroZpucakyejgnlIq6MlbeWlM86OXrKnlqY4Ja0EOLpI0
         yIa4fUoMOW2OMX3SJk+OTIP5c/ZvUekhpuFwxczyPp2QmYi2EiIwVQ2kCldFyBGxZA/G
         x5cjLK7LPfwP+UMWSxw1stoxA3H4dKUngCOKsJO+xLnt9W8aJL/qHYIHltYiEtcftxhQ
         PbHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1PWTKn7AYLgvu7KMlD/EOdk2ffKe20IVZ6QglBuuceg=;
        fh=4slR//rT7mrlVwAJUshgIKE/2LsVEaOqrGSohGvspLo=;
        b=gb+B90xWJ5GIuagQOLnWtyPIUJG9phdw1UuVBA6pEZ2oYERpskWAPrmIqyvwxjht4X
         IaG6O9ZYhA+jb4eOVSxOTG2EWjB2/wUq6NH+IINyo0Lstxg53OH+KTSWAYV0qNu96IBQ
         aW1nGAnPmOresF4u8SqrJ1dalWix1nRHvacrRVlvWk4wGJpHeAD27N0ZztO7RLuDzun0
         YgkI2jtXLhhGDl1nSfVGGsu3LFlGYIK5+hwvtS1QWsBDBf7jEd2DRHW6pM0Ib9JJfgxg
         ZLCo+vhdSdaVj/s24oePmJ1J+kx2MhkfDX0UQT668RjdaJpZPA1es8VLFgGntvDER673
         8fNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778291638; x=1778896438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PWTKn7AYLgvu7KMlD/EOdk2ffKe20IVZ6QglBuuceg=;
        b=oBbxPHZAUv7GbHoC8LfNfUKARojEG0bdBoI649iItmGXXh9mmbkuAjhPqvKrk+A1Ca
         4ueD7tzkuspkQuiQNLxSUbaa5H0Uvk8lWtjImJ3wBUisqVmdzudlDqO8bXznX0OLKaKN
         x2s0QorCWYP8iy6DvLYbatHASFYBqgCbWk8Bu8ry28E6DrAPHYGjGwJJmSkKArFZNP7t
         zavF3jkqBvX5v1Fb/f02Z6Q4XwVmg6ku9+Y0XDuR8rbDfbweVeYG8cow3ZXlF8dfs+XB
         GsxU1w6Z7WtYmCnZG2yAK0Eumr+0hUCqVrBMO8a/oMzqqzMqVlIJ3UkpJWUwJfez9pqb
         I1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778291638; x=1778896438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1PWTKn7AYLgvu7KMlD/EOdk2ffKe20IVZ6QglBuuceg=;
        b=VT1XtugCkLdzXpujvgsNKuq611n2pB2FEl8/URWzJmBwZmGpV6K+fjVgOoTj6VaKkp
         jri62+uNwzkp232emnNMsgYD4V1bQJXs8bpPaW/bGygOGpesRSCa1yDxivImPesebokW
         6+zW8CRvN51Xz7IIvuFtqxyp1a1zIz+Qudc4g45M1Uk6F/wPCCSFzdC9yw2exmGwFCtN
         3++VZXT3pAlf3SaEOUxC5rVSStrEW9/w3FlamHdUB6XhJOfw2JNsfWIQa6PJ0yIeMEHK
         nsIwmE8Jxb8yUgThzR+gyk14Q3HM+I7SIIABAfOJTBQzbZk9TbCzYICEvzb69cG5O+Jq
         fBMA==
X-Forwarded-Encrypted: i=1; AFNElJ/f/zn4aQ/1Yhp8clCfDM0LGZ6vS+6Kf23OfDTf/DbA9C/e37PmhhAdkPX1d6zowf+PcaOI5amd+T3ra9ctbv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLjguCA9lqMzd4r+vx3xtXR3l+xz83hE5QmGxSWcZT8bQhdqNv
	aBOAORrkilR2B/wTXjzUFBAbAqDtyn2Vwl0Dkwoy5GdD84cs9etiu5Z3/a+3I+2bzcYKwKloZSJ
	+aOBNu/SqNozOHC1e5QZiME3yy0Q5Tqk=
X-Gm-Gg: Acq92OHqbSq5jD68FSzeOQrS9INn2gM+Zbb2b8bk7hAH9u0uM0uK9baMcotemJpEe1N
	ZyjtjREtQoHNY/b1iRR8+9XCU35qZcmPaSh0VhPbAyziiODvNWbnY5GqTwI6pXM5yWZz2xVCRmp
	pFltsQyDo/we/uKZwgZjIdmC2LtXM0c6BinbHpsvpDri+NhSuyOLbAJq3/C3M+XNBMRJUMN8Yng
	HWwEvqJoOUProOqkxuj8NEeLwK9nJmLruv1f0eK5hxsPTRYwiH6z5ZNjYmaE5J8ADy7OvaVUE4v
	GbU4AOTLl1fb8/OKD+ik4To3b7htiYPZ9Lpz1S+q/8/IQhmhhg0s
X-Received: by 2002:a05:6402:e88:b0:672:be92:e913 with SMTP id
 4fb4d7f45d1cf-67d645ba7ffmr7195826a12.17.1778291638384; Fri, 08 May 2026
 18:53:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com>
 <20260504163915.4a8b028e@kernel.org> <CAGCJULP83NnaX6HAqwb3umDXsxN8LH48_gPpJ_3gG8_xA96QNQ@mail.gmail.com>
 <20260504182833.344d7b33@kernel.org> <20260508033210.5149db4fc3977d33937e6942@uniroma2.it>
In-Reply-To: <20260508033210.5149db4fc3977d33937e6942@uniroma2.it>
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Sat, 9 May 2026 10:53:47 +0900
X-Gm-Features: AVHnY4K_nqWe5NsW0wxsdZ1F8p2ge0h6vNtdlnAMLhajGOPTKK7c810iiAxGn0w
Message-ID: <CAGCJULP_dTSjXQqyOYXckkmtd-HAPo4UT2V0WQofOZaJYLgENw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] seg6: add SRv6 Mobile User Plane (RFC 9433) behaviors
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Justin Iurman <justin.iurman@gmail.com>, 
	stefano.salsano@uniroma2.it
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 10:32=E2=80=AFAM Andrea Mayer <andrea.mayer@uniroma2=
.it> wrote:
> just a heads-up: I am going through the series (kernel and iproute2)
> and will send detailed comments within the next few days. It is a
> substantial addition so I want to take the time to review it properly.

Hi Andrea,

Thank you for the heads-up and for dedicating your time to review this
substantial series.
I will stand by for your detailed comments and prepare to address them.

Thanks,
Yuya
