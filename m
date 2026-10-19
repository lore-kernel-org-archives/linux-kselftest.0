Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792426272;
	b=YO5q6NMwE22UsqChhO7II8BfHLxpz8TP+mmRNPYM13sdT88NPNavjRT1MjQQ/9e5nImG
	 IcLu1lCu9N+AU7RxnNx1fE+OfJHpXJaAPamhKksrMbGp081MFTqieJCQTj6oAleLou86u
	 YgxOXSyOjOa9ANUlucHAr0nPoUVEfikVvno9xipjYYthDlkM16dEVYWiLRYbiugUGXPwV
	 AgswFJX7pI7oJlXRFN7ti4raS5qG1X4VyuxFnEqiQhj5hqQn0N6DlOCLB+WS1mSanmLU4
	 kWV8nM7bd8CBVyfil7DndRtfkru1MlGV/aNW7wquEBctkzSYrXmVSmOZKu63sUbBTSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pr7BJMuifE78YwYx6pJZlEAPKb8dBOcE7CtzncpVA88=;
	b=dW2lS3XLn/dyboAt5RNUWlTNX159bv5POeFxPiM54hP2T/lF8/dIZIMQCWyOmq78zQDe
	 mZfQVgyZBlzPsR9DSvknR6p1dqk7wYGiGHLmJM1wJPLahw5l0x/l6Thw0GF53sHLE8Prh
	 JOn2WZPMtlXoAoguuOoQ4EL7p7bNTiyviwS8CmwaJS1AkRm21//6wEdEjejA5f/im9hIc
	 iPgy0v/P/DsFLU0PstEUa8ewC+TYDNoUYX0qTQFj1jP0NzRrehne6lL9sU8SaKFCOlcQx
	 uxMR+jioerzHzj9bQrtjc8z9QXyGP90ySXqcmqN89mJ6NSjnUe/gGZbr66dhNIRfRHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=tRx3K5jm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC34606DA7B
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 16:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAC34606DA7B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=tRx3K5jm
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso16988a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 09:11:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792426270; cv=none;
        d=google.com; s=arc-20260327;
        b=g/rewAAnICpzLgcMOfEPW5uVoZMVOTmp8tOqa89cKVUeYdFMZUSbnIiytYgY1f0hfa
         n7I02zOqLZFd9LuJ/DCEU2sDneGtwVS9ORrsZXAxsklDDDrOEehlL38wIZIkBVCRbKly
         NgqCTj6ZifTNJcrDiR/pDiyU07NhjoSf75DMaTbWRjswKGTs+kXdN+KMtoCqEkGJygit
         cWx3KkBX8YMvV/M6iyAo5xLjmr+vSa5M5apsEBqARoAni85XTEE5jpYdIFkbnEmEeBrb
         kpXqHfP3Gyjh6ZJAj4+ZL9C2bS96KwALqArYnnq6PR25XkEqcx/a4hmBm7HsiHvj6EBz
         Qmiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pr7BJMuifE78YwYx6pJZlEAPKb8dBOcE7CtzncpVA88=;
        fh=WEKRQNUqDn93W1sf17I6/4jhSC4PEglwnR9ZM6eS0d8=;
        b=JE3YTQ3n83Aj2BuxCOVOTA5hm0Rfysmhbhgla0t+MmnfTb1pfDJ9sJTgfrldypc1sU
         REp+6zLaKOCJ0qnOTULSWiRyzDmOJoWqOylpKp3PLKQcT6j4MOrACigQz7eI1cXgZGGK
         OY8q4UsIaS2fbwT2GIAlosVVsHcVz41ZpAu9UoLEo1uFV2HEE4rrhFvCCTyFzP5iQlaF
         Mde3l6jSt6a+nnBH6ZM3cX4Com8l7PtUncIIkXBfNOpibYRKzRlckc50RcCuBrUhPMQH
         Hk1qOCFOgIKJBy4S3H4706QD1XCV7DGVGcWgXLSKN+RcD75ZDK6/OwS9R+KbjxAdQjuQ
         dqQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792426270; x=1793031070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pr7BJMuifE78YwYx6pJZlEAPKb8dBOcE7CtzncpVA88=;
        b=tRx3K5jmcY33uFjjLhBl+j7aQChswPzQ8jc6vt21o8gL5HebhBkZhq0m4V5VQXj8Os
         Vxy55uyFlopl85UWtcuhSyXPeS8T5aUmHQFtnKEsZz7CPNXCpLO6jJgwUUnFOIl2yUFB
         91ziLFkt7j059F2wIJiIWCft3lgYJiZpl7D3tjbGSsU8jErVrD+G6+TLwtfY72Fl1BRp
         +udUczkN4A9EVjpSES388lV7wjosc45EmCjnJY0x3QPYLgzoDNHjM4jwwdIDS0kg07RL
         YnqkBmDIKaVV6xViHZm/RbvKeMlM1D1RnEkQXEC8kGdWmFWv98zxVzqcc+Q+Y0hzQQtm
         mbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426270; x=1793031070;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pr7BJMuifE78YwYx6pJZlEAPKb8dBOcE7CtzncpVA88=;
        b=M2s8yBNjNBJu7txHi81ol4XzJ51M52zeV+D/HiiRQ5/IfulQHFfHwEeIGk6TB8/4/g
         qM+9z7qSpQlodNH7Ch+2hcgOPbigrfxWg+queGNRH+1ETKmpFnLOInjHhwl8dNMIAAtC
         wFGZrDk300vfL8XXz5wjkx+MJ/L//GDlzw/sKij48lONeMmckTCnA47TVMcsRHYPoA1b
         0+oOFbN782AIo1aA6jTkEhHsDhlGEx/WOtC33cU7W817cTI2ysUXVxPjj82OUZ1tEJGp
         Twa9f5Y5qbsY4C0c+8N/J5ZlCg0/wsX4YLhZARWreAd+gw36hKEa2IurtaaPvxBMbCri
         AgOw==
X-Forwarded-Encrypted: i=1; AKwUvByA09uphN6THDJ7SlA6OASxoEJZKeA0qGx66H9nEbo0BKhs87EAVKwueXe1L4WYe/lnkc2aU+VTLl4tiy4j3lY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEO7Vg2cdLWI0OiXEZ4ud0y5Fu2KId6NFVmbjejEy9oJrvft/o
	c00bysabmUuC625DAWUwYTvaOSVCXvSONj/sI9AiJJXYtIANXi1ICScDgI52m/t0G/Dudw1633w
	qCRpzl6VsT4wcUsOc696alJxV0zBQeOKgtL/ySLr2
X-Gm-Gg: AYBFou2iUWGNCbbGl74/uedDe8grL/e8QufpME6cZbuIPjTdrv6EJuVLTFqnvf3zHdC
	AmMQbdTEfKVbrC9SSQUtq1Oww4S3k1FjAGegSh2dRF1CagXCB9lZyLLFjVKNNUgj4sU69LG5Qdq
	/UP9HdqqqDhPGNg1FRJLFE8+7rO+yn3zLmEgYyrffSQAvWl4B0ThhCN4wUUDtBpOuWjQA6wIWw1
	g/+hs5j3qCsw698OpmYZun3KYW3s7kZSZdz6dEtuu3w5k/EsMA3onV5SgwVEOEj55Y1fnvDrLah
	MELexH7bqu1827G7CCPlueFd9yg2k1rSF710A42KSz4uJKn+XtDIa/rzjIlXF8rBpbSXpasrqYc
	m7WOIfBGV6A==
X-Received: by 2002:aa7:d3c1:0:b0:6ae:188e:e119 with SMTP id
 4fb4d7f45d1cf-6b3ad90b655mr92225a12.9.1792426269498; Mon, 19 Oct 2026
 09:11:09 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015163915.1166043-4-almasrymina@google.com> <179233927086.3135.6123492094489915156@kernel.org>
In-Reply-To: <179233927086.3135.6123492094489915156@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 19 Oct 2026 09:10:57 -0700
X-Gm-Features: AclHuK8eiPagoVp9rRWfufPEyCEaXmjBdb7vS7t1VxUSJn80p85wHIDPJ3eEP2Y
Message-ID: <CAHS8izPobFzob0pF2cLqL+nqtJVL-TC50QuDHOem9_cwJoGSxA@mail.gmail.com>
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
To: netdev-bot+sashiko@kernel.org
Cc: kuba@kernel.org, asml.silence@gmail.com, dw@davidwei.uk, sdf@fomichev.me, 
	ap420073@gmail.com, pabeni@redhat.com, kaiyuanz@google.com, 
	bobbyeshleman@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, hawk@kernel.org, ilias.apalodimas@linaro.org, 
	horms@kernel.org, shuah@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, dtatulea@nvidia.com, razor@blackwall.org, 
	daniel@iogearbox.net, tariqt@nvidia.com, kaifengw@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 9:01=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 (1) =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] On builds where PP_DMA_INDEX_BITS is 0, this patch leads to a
>   use-after-free of the netdevsim bus device.
>

Bro this is a pre-existing issue I think. My local sashiko also caught
this but it has to do with us not doing a get_dev or something when
PP_DMA_INDEX_BITS is 0. That's a very rare condition and unrelated to
this patch series I think.

--=20
Thanks,
Mina
