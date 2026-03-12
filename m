Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827001DFD8B
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 01:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773280154; cv=pass; b=tUH5DNRWiyRfrkwFf4Cs6J+fF41T7u2pL7zY3Kzd0SKx3bEH+/4+SZtfQonSAb4WKHMwA0FA74hLju6WW/Aue4M5crAjDEfQ98mjSxin2l3sS6XicjQQakwSZ/laQ1KtkAh3xDdiLW0sHyKQbGzSHebjRz2A91CAevxrWuG09q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773280154; c=relaxed/simple;
	bh=l0pdZ6aJXNzjnX3WguteAiYv+XlY3/vYQqBj1jhOzDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qR/rZtSIQscelnnm7ULh2B2gSvNohI1LCuWcV6Zu+Ws2pouhWYe3hdLw3heUydDxNrVecPWUttH6fAuRop1g0NoXGOjnnu/C264TdJUGA4FXvbvvW6K76xuiA1Ew6CB3wJyriaNogfkanTPq9w9bq/oFeMoaN58smTt4mTrWp3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g/T4HfxJ; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g/T4HfxJ"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-509101189edso4715271cf.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 18:49:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773280152; cv=none;
        d=google.com; s=arc-20240605;
        b=Jh/p6x6cLjQMl+sa8l6rElH3hRxTXHerKNlXdTwz6iAo6E1LC4bTlJc9SlXsPtbaaN
         +3PBS5T3/lq/xdmuuAOfyEoU1g49oJl1FqEa4tWGcCenbEYgJCHgk4ZhxHHKrGR0T4Id
         xLaT0Gc2IvSRRh8SQ/VBziI6OgYBls4hj5y1j5jXcMHF9IDN6oGh8OBGBSye+vlj/X2A
         pQfhYFtI/uBT7ehIl282Xr5tpHIaBqVBhmSVJyzsW++6FJoeuZ9081LYdclbxoQe3+V7
         66xs9gbZbZj2lvnN/W2qL9Ta5NeIvfMRmTCROu6HwGchqeZSfemk6BRmSk0s/8cNMfXt
         8A0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l0pdZ6aJXNzjnX3WguteAiYv+XlY3/vYQqBj1jhOzDg=;
        fh=LPcCFqG7pf1mPmCAzlC7HoID19PvfmoAT94ij7s5MYY=;
        b=SnNPcrX6zmElCiPcTIgm/nWgAJgLjbFZe7a4mKRnrCzY0bcaZQ9lL8Mr7GWC5IL72B
         nO4WsrLLo5iejYAX6YaenfP05Dz2zKCmpHztt16tC7ob2apcm9/2A55rcqpXt8kLqEhM
         GmsCEBNOwkFoklRfxdsvBnlRh/XGxHZa0GxUAcRnOZy0PQdT8L5rhZKlIFnXW0MUVH9j
         jBMx2EQ++y6ZG+RRht1ytZQMIHoSPzxFKXiV33iikDBBpBcz4uIaqXMML24YeY+EkFND
         XY3BNNdqvz3rOKm2/KIgqNf+7NtcH8FS3/LEVOMh50OPl00/DZ9zSOMmdm5+cB890I3T
         zJqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773280152; x=1773884952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0pdZ6aJXNzjnX3WguteAiYv+XlY3/vYQqBj1jhOzDg=;
        b=g/T4HfxJMQw5J3/IjSdky+zVHOmQsiCKoeovleUvx5h1ws9XT+AIGwoKgoBj+a42Oj
         CPNuouejDGtkNvppsigpAgK/YsDxUHQU9JHbs8bcXEf3feuFlxUkGTriWXeXuy1oJ1dV
         djrRDgmbUP79RQWKoIT+i3Pz2IpYxxM334cZBOzTaKiq4z9gdtmY/6se4G+bQcqkHyWd
         HmqRrq3yp5FK18ciETnIKTki+RA+gMRyWJteFhAUzW77kYRFMp9KkvDd9tsspUUm6wZL
         Zg0fvr9oOpuJcAblDYYO+GCiDiLkW2ZT1yiaBnsjGjl2nN6vsfxPU6Lc98Rx+EC3W8xL
         Ytxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773280152; x=1773884952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0pdZ6aJXNzjnX3WguteAiYv+XlY3/vYQqBj1jhOzDg=;
        b=CXtlWMY6IqIqMi8tNi5HFkvkd/kVYbzpMNkjbAHN1oMs9Tz/KtcvC0tW3QBYKsUxqc
         xd2dkHDkOvNKVYf8XwJo8MnWT2Nx581lvyJ4Q59BBIhmtyR+Q1OsLtvYF7Hz7huMwE1p
         4Ily830CO72r5QvD+CMHopPqv5HYtGdQJaTt3Xn7U6Nw8eu4fJAMt1pkmYd0U0DQRbcF
         6zf80euqVIOQDNJQwGT8CxObud029Ay24VIFRZpdZgPkfX+9KmoA1xx0koBQCaIvjUPQ
         Mx2US+2AYhuZ5XlYTEFNicuSyuSfg/XocgSvfAxqlxyldhpfX6xGmRzBdNFT7CuHhZu3
         t6mw==
X-Forwarded-Encrypted: i=1; AJvYcCWBKNnxvOVLbMT6ViD5nFETMm4/OQHVgkOSas2zBVAyUckHJ2OOCjYVDgo3Xxs87aEYuHyoZhXnQcPv7tBvERg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw11SSG97+XeZ6tP+YhDB/AlY2YSHDj1V9XLwtUjEPttU1dfP7h
	VMrXENuE8lxfjN+NHIiOdp7feiy33gnk2K2MCwL59lSnA/bzwhjAQ0DTyj+KUNzWryIQonueYLp
	hTZxHk8ELuYZnf+4YCnWIAfvjU59xHtVdo7eE85EH
X-Gm-Gg: ATEYQzxdo4y95cvshRC0Qe+6mP2VNGsxLFPFptYY1564L9KLVkqjVeG/7sTG8oeVA8U
	YkSj0Iub1EoJVe11FE0qjc2ORifcNqtwuMXIXgHmSqZxMzKx0zaQ26Hz9QGIf1iij/kl0l1ej6v
	Y+/jsqZ2kq2q5bi9DYE6njr/WMF+JR50t5dvVZvioVY+RkPziqqPd6+iJs0GfTwWY/nyTmmPaJx
	g6nXoqhbyz+0WYRMKwr/gM7QBPs0MlsxeRay/Km5EjXf7K9atz/ds6JsRH4yW00twtT+dyQWMXb
	+EnjoCY=
X-Received: by 2002:a05:622a:245:b0:509:16ba:d537 with SMTP id
 d75a77b69052e-50939fc6311mr62588591cf.19.1773280152190; Wed, 11 Mar 2026
 18:49:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311075600.948413-1-atwellwea@gmail.com> <CANn89i+dojcg=TDh6E1++g_TM7qdcpnyu47n2Q9DRW_w73TjzA@mail.gmail.com>
 <20260311174154.5fadb207@kernel.org>
In-Reply-To: <20260311174154.5fadb207@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 12 Mar 2026 02:49:01 +0100
X-Gm-Features: AaiRm52zaoXRZHJbWhVYmknx0ZhJd77Ysbeej4LqlWfvsr4aOTCUEXNpCukM3UU
Message-ID: <CANn89i+8LBnbwGE+4qfXv3uKrwLXog1hXqabSK57dCABJ6Nx0w@mail.gmail.com>
Subject: Re: [PATCH net 0/7] tcp: preserve advertised rwnd accounting across
 receive-memory decisions
To: Jakub Kicinski <kuba@kernel.org>
Cc: Wesley Atwell <atwellwea@gmail.com>, Simon Baatz <gmbnomis@gmail.com>, davem@davemloft.net, 
	pabeni@redhat.com, ncardwell@google.com, dsahern@kernel.org, 
	matttbe@kernel.org, martineau@kernel.org, netdev@vger.kernel.org, 
	mptcp@lists.linux.dev, kuniyu@google.com, horms@kernel.org, 
	geliang@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	0x7f454c46@gmail.com, linux-doc@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 1:41=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 11 Mar 2026 09:34:32 +0100 Eric Dumazet wrote:
> > Your series will heavily conflict with Simon's one
> >
> > https://patchwork.kernel.org/project/netdevbpf/list/?series=3D1063486&s=
tate=3D%2A&archive=3Dboth
> >
> > I suggest you rebase/retest/resend after we merge it.
>
> Would it make sense to extend netdevsim and packetdrill to be able to
> exercise scaling ratio a little more? Having it optionally clone the
> skb and truesize +=3D X would be trivial. IDK how many bugs this would
> let us catch tho :(

Yes, I think we mentioned this at some point.
packetdrill uses tun device.
Adding a TUN ioctl() to control how many additional bytes are added to
skb->truesize after tun allocates an skb is doable.
