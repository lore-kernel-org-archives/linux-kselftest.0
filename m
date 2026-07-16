Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835A941A566
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784200954; cv=pass; b=GJUiHOBd2WWt0jfze5cbTrCVM088xgjpuAj15sVjZdn2XyQRVRsn6qo2bU2BA8U2QQrThu7AqWd2R7m5EoJM8BI2acSed9Mc8zQEZK+5kE+xvoNoYnsQJyIBiCh1wWUPvwybocB9V2ihDiCK3/YO6qKxgRmPc4GCHpFYHQQKVFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784200954; c=relaxed/simple;
	bh=HPb5WPC4lCTgEt30xhiUbaSUaPQItUNr9aD0MaQHPaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OeoXulQa67uu844hnFKIBej0QddK+Zvm0pQAryyw96cOdTLuHHDh5Zp9wsISe3UID+zPgnY6r/nMQpf7CsLPY42dY9myWIRoeccO26Vy7TlxkNDVPd30JnKcDpEeMAtu4bsrRTpPqBqanIRQKUDmy3mQg0Qmra9tmTfNTyQbZZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MjmmhMya; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MjmmhMya"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so12158131a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 04:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784200951; cv=none;
        d=google.com; s=arc-20260327;
        b=HHuagfhuoUy3kUpeyRxuDU4/2mMZCvul1EaaWfFvAaKOFn+sOUrZ1UZDQsBACmNt36
         rmWt2lS23p/yw8v0ElgmxVqKgAaJ0T1MyAUBVSPtWa0xNR0eJFVxOVhzNkh0Jba1cWE8
         6RzA+XHirQ3+heeXpty4ytKNJ7ZPIE0KAqzZ6TP5Cmc7kNCT2OXo2s6Rk3fEHeZ0102e
         yQsFQvDqIZF30/BOJPZKJCu6Tw0efSCCklHBkUj0jhW0FlEZ7w+jHT8CoMeIe9ZByzx3
         f55GDMcW3u1vQ5XGRkbQroDDq30MaGpp5vziB0yL4UdNfuBDl0HzGo6wBB8QGMm4+qLV
         hReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F7PLUu8CkOddbo13f+x1689IvQHMTxkc+L3wTNv9ExY=;
        fh=RyFH4jdA7BxqM+WS7BcHt3OMJfx8a5hkuEXw2W45Ggw=;
        b=DqJEHUAu542ARd6Zs5IGq4k6znwsDim32boNx3ru+rF8Smqm1TPTy+jmbWPUNm6LQZ
         +va6GZj4PaYE+jSKhO4wKoLSNbCNkz0xchjeZlb7ycOnDNbFpQ/R94M/ML5K48vfolJZ
         NzH8vi0dDvdM71yIl6CQ7vU0HxAJGNzKaQfXrdimwLVk+FJRVjv3UTzNqT+aJV9dpCs6
         WEZiKISP1o7VgH8/8kIKtUX9s/5JRmwqIZ/ZAt8JMI93ZcJrp+e2CYYhZHesFnx/O3jJ
         eEgF8HSJZgvvZO14ZiWpFevfX4qjKpEOTFlUBGunDrwnnb8rxW9VKGvTPIREfTROHEzK
         NSGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784200951; x=1784805751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F7PLUu8CkOddbo13f+x1689IvQHMTxkc+L3wTNv9ExY=;
        b=MjmmhMyat1jPw6aJ3d5mo0wbQBGApIi1DF8dJVaPNPd8tkowHJbDuv+Vh7ImcT0Ufw
         idugEwKQKArZ9sbWaPT9/8gXNeEdVxRq6IGIOSP7JGkvVbERIGiqNFMc3raB4QVEKnkY
         OXbg05zSKOnnyrpRMFaqwuzs+mXkStQbgUf00K2I+0fEJHnLVNuCJz0EpJMr6AA1Tgk3
         1iGfh/g+5cCzYZPoaXTmQyBb4ag3KEDZ8SWDd07smSMs6eZP3rxgkh7AAvqid8Ezj6ar
         TeMtkav6EKW5xJgqcdO3V5cOjv8XBR2rZnrEBytiaSyGHE/f3r03ip571jhvUhFCSR+g
         ZYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784200951; x=1784805751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7PLUu8CkOddbo13f+x1689IvQHMTxkc+L3wTNv9ExY=;
        b=rhbESvliGb7pD6JQbs0UFUCXIw/MDdbnTl0hB+z3ctLANFPGBf6Axt2hE/RTn3Mw/r
         RYb0DXYP67ct9+C7faQsni13WO8tp3O8gD7Ix4DlLYeiG+eoNNvSvT1fGZOzIm20zdU4
         PKsETCkq0KVhrtIN9etsehcOx6/TGMMj4cf0UHBn83OYRz/0OYNteHwwEpwBMSdq1Q1Q
         UeuyP8NkcchN7EHGS/xVxQVGSpPc33k3DMOa8ilyIcmJLO4JTwERB6mwAh3Wc4+BwtWM
         no/67/OOkVxeYL1qPajc1SDwZXiCCqyGKZLMm8hDOdyHiz6vazB9T0mRW/h/th9QiY5S
         UIfw==
X-Forwarded-Encrypted: i=1; AHgh+RrrZtYhfEPWdHkoVw2tTq5IiOoFWMXXE0zVKrEYul3inGaCTne2C4SNcUpyH0bVtQluBcEeOgSX+O5TyFCucGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYm2VETYYpswwL/StRwNvIenHjv7moTbEQL+BjRIfMkvfp7di9
	dbK0Fxxh7W5DMvdLDF0O5McIBkiwaHoPdJUsZqZRPJkslhxbdDAPXR9DKnknCD3XaHxoE09Ur4k
	nKqEQefdYwpdTUnUtcj8Z+h2BpX8Vyx8=
X-Gm-Gg: AfdE7cmi9tfiKdcQ5Iz3IGXTGDt05LPJ3eUcv0i1p1iEXzQ4kLv8t1rluj7tTtpXC70
	EmaGV47qAlEyQofyUOZau5FiwkgHt57wcca3iiLBAzcb4aE8j+SdZi0hB8DXAQlKb+1FlbqbHIc
	65COOX9+ibU3UpOIkwaSjLLeeIhjiDDKYrdMXf7788xuL9jdE/mB7HT/3Bog8ErB1Gk24PpbtHT
	SVvctna+JcKbB1guyyLvcxGRCp+93FJ9qGyZeVjk91XYEa/y8+uro3m6MASOip2ywyaHwHjb6H7
	/w3zus6nY10mXZwbZMbz
X-Received: by 2002:a05:6402:42c9:b0:69a:6f1:d2e9 with SMTP id
 4fb4d7f45d1cf-69e199dfa7dmr3605844a12.30.1784200950281; Thu, 16 Jul 2026
 04:22:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714020340.25014-1-akiyano@amazon.com> <20260714020340.25014-2-akiyano@amazon.com>
In-Reply-To: <20260714020340.25014-2-akiyano@amazon.com>
From: saeed bishara <saeed.bishara.os@gmail.com>
Date: Thu, 16 Jul 2026 14:22:19 +0300
X-Gm-Features: AUfX_mwI45KknVT_65FZwLBjVHUIxU-71Sc82a4VjAhyLSVgrPTPeRc4elHkh1I
Message-ID: <CAHfVqdWBsBMqerM7mq3U0fMKhCSMUd3nbNFi1vgFehRivG5B0w@mail.gmail.com>
Subject: Re: [PATCH v4 net-next 1/7] ptp: Add ioctls for PHC timestamps with
 quality attributes
To: Arthur Kiyanovski <akiyano@amazon.com>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Miroslav Lichvar <mlichvar@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Wen Gu <guwen@linux.alibaba.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, David Woodhouse <dwmw@amazon.com>, 
	Yonatan Sarna <ysarna@amazon.com>, Zorik Machulsky <zorik@amazon.com>, 
	Alexander Matushevsky <matua@amazon.com>, Saeed Bshara <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>, 
	Anthony Liguori <aliguori@amazon.com>, Nafea Bshara <nafea@amazon.com>, 
	Evgeny Schmeilin <evgenys@amazon.com>, Netanel Belgazal <netanel@amazon.com>, Ali Saidi <alisaidi@amazon.com>, 
	Benjamin Herrenschmidt <benh@amazon.com>, Noam Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>, 
	Evgeny Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik <ofirt@amazon.com>, 
	Amit Bernstein <amitbern@amazon.com>, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, shuah@kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, vadim.fedorenko@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 5:06=E2=80=AFAM Arthur Kiyanovski <akiyano@amazon.c=
om> wrote:

> +       n_samples =3D data->request.num_samples;
> +       sts.clockid =3D data->request.clock_id;
> +       kfree(data);
> +       data =3D kzalloc(struct_size(data, timestamps, n_samples), GFP_KE=
RNEL);
> +       if (!data)
> +               return -ENOMEM;
any idea why you free then allocate back?

> --- a/include/linux/ptp_clock_kernel.h
> +++ b/include/linux/ptp_clock_kernel.h
> @@ -123,11 +123,34 @@ struct ptp_system_timestamp {
>   *               reading the lowest bits of the PHC timestamp and the se=
cond
>   *               reading immediately follows that.
>   *
> + * @gettimexattrs64:  Reads the current time from the hardware clock and
> + *                    optionally also the system clock with additional c=
lock
> + *                    attributes.
> + *                    parameter ts: Holds the PHC timestamp.
> + *                    parameter sts: If not NULL, it holds a pair of
> + *                    timestamps from the system clock. The first readin=
g is
> + *                    made right before reading the lowest bits of the P=
HC
> + *                    timestamp and the second reading immediately follo=
ws that.
The descriptions for ts and sts here are identical to gettimex64.
Instead of duplicating this text, could we just refer back to the
gettimex64 documentation?
