Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF1E37755D
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771928541; cv=pass; b=O5tBcdS0oirefgHtoz4Y+zmLZQnIBS73VXpsM29X2/+lyljfy6xGp4hfy867bg11tgQKNnfCsOyJwptqRiML5L7sQEvhBLR2ApK54p7OJ3UJoBrSyfrqk8A1oIbkqwhJcUZuQd/tQVQQFBLhwXi3ImAbJQMujBFPu0QB2DjKrts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771928541; c=relaxed/simple;
	bh=LoA0gd3Q7D0WIQQHGz6q931aQElRYL18j9ESlnOGh2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bkppe0uxNtmSmB627vo09gC8Hc0IndKEm4Qg7CZkuhmWkwlch1lIidR56y8ZBnulXu0B4r2TMCpd2qoWjHfDvbMSQL0pVY4+iuPYrSEmSUAl7vS9boTJykXCGhpIqivIiWYe/Xkrq5HRzJvv96JdK+ajbi/IPlhE5z+eKmDtChI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Risea3hd; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Risea3hd"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-506e287dd53so43826551cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 02:22:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771928538; cv=none;
        d=google.com; s=arc-20240605;
        b=TzLgltEnB1L6LsbVRuSwNgh85+hiUKChmGQN0xh2/uNFXbI0Qd0XpuHSF4evb+mtqT
         HyA576sCiDTVFGGst5WrjGYpU/KQcXgB5iiEzhJOhNMrR++3rVR+0zP747Oze1CCtPg9
         jSKr6hoQ1udH9oFvTLXRBalbAykIfHBXCBoRoqPnbnWsdAA0hVF7TXjmmUTGLikjcqFW
         aKuDLeKl/PTZMotXqLtTCD0eaUYjVlHfvccotLwvpSBBAycXmCk65MindVwk54a8Se1D
         0lu6EtVMdd/+sLMBE9AE673F2TKgltwy8aLW0vBxydJ3YP2XQ0RHZ+XIXsIh938vTJc1
         TZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LoA0gd3Q7D0WIQQHGz6q931aQElRYL18j9ESlnOGh2I=;
        fh=9yK6W+gcsrB9Xkp9omEhSfJRrlL2MA4MhLZNjpn4y1c=;
        b=R2YiZ9VN8rbn3eC0iA16Mv/OyxBQMA/2KMvqIgcWJ9YqnPTxqPn9yh2hoAP1bnHnad
         DdFPzRkl68fbtTZaUXgvyqGlKJMcNiqgRID79OJxYUWaiW9jWb9AMnjM16Nl3lWqIshR
         OvFvMo23UEGdWy/xCe/q8C0nIFJZ+/Wb61dmyl5R6/1lifOyrehyUpsvdZc+ic1wEqX8
         ljNEyeh1viYm+Ec5dMxj3/qdK05Bc3o/NycEp3uKXTky9af/+1tHrwuemsbnEELhqnL1
         m0gmJ5NdFN41D1QjPRuSOhycCTiup48R8aGHkssJ8jgSN88Awwg0l/chOajHRFsiT2K/
         xemw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771928538; x=1772533338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoA0gd3Q7D0WIQQHGz6q931aQElRYL18j9ESlnOGh2I=;
        b=Risea3hdvRndcNXUmwoxm966SVXACAgPOQemk9FtkrPmc5FVfoORNDS30x5rB231nZ
         Zcx8rTDLAfvvOtqZh19qErQvtRnGAZCcoexgo9fcG2GNzjxGGplW0Eq/+0OjaU9M/Dxt
         8ErkvjkPwUSy8jq4ynAjEbqosHzc0I/WFSB8+ONll0pF7H6Y4wZyuCskTy3f/E612NYX
         mdYJv6zd4xienQXHqCQLOd84vZ9UABR4jlNvB0/K+ZWguZN/AnWoeoVNWL9SMxoNjiJZ
         +NyUygWS6DUe3CpuWskZ7qr92bV7j/IaPS11HKU/6naL0vMrbo4WRmOKV9NoWzkeHEdn
         O+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771928538; x=1772533338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LoA0gd3Q7D0WIQQHGz6q931aQElRYL18j9ESlnOGh2I=;
        b=fcdw+ngTeM/CFErvRY3VaS/uiHrP3Eb9Z/u9iuALk7oLroJuH331xZS1Q8y+DDMPRo
         uZ/sejam5l597n1g/dhSS+VjCQ8GwOLgF7WRkSWuuD/0RNw5sZYgf1bCBGWBdzUqO38B
         AtZDmAtV3d4v0ZXzzaPSrkozZpC5LfEr6erEf3ifQmM8lqRwkfyMlcWJfbuJ/jaivmQF
         MHdVid8PX/R+TlfbTcxwPn26ec6B3ImR/uAhd8aXjLuTIW0DORBv+Ir++QDGd+y/tcv2
         Et5eD+BIVqesU5HGjzPDojlfiJvH1RJf+xw3gIX7FXXO9okVbsz85eiLbHvMhSf2te/L
         QpEA==
X-Forwarded-Encrypted: i=1; AJvYcCVk/ubq5oEk7ODjdD2RMJ2VT6ie8cWvoW43TcmLxn66O3ev/V0ZhMAlioo9XJ3uEZNkwyEJVM1XkdGZ7RycRn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM0WBKPZZWqeOLgNUg35ybp3//FQFzCCI3bpTR7PuYJO+kDClm
	egSTZ+PoNgjPfzOHUu1i63hTydZMDA+F0ZMRdTJURmpZGJzn0+slEhXi7zOrrazmsU4jRSPIJIT
	n8NDID8wzdJHZ1xm0gswsDie/ot9yQvGPyu99Iwi6
X-Gm-Gg: AZuq6aLQMFp403wEvorXNp9VwcjPULSl7NthPvCbLJN8//vK5REQCKnUNc5Ahm9DArH
	Zt0KNFI0QQJmwjS7oF4YAEYmFdC5Bwn566kwcb5Gm4Fnd7J5G8UVRta/sAeZ4Z7dYUW7fxtnI3y
	PB1q4UB05zIg+NdWzm2rKetVX8vqgHJk+eqyE1I1jfZ6kyOZfU0EkD7v0JiFhhgIht5aygYwrdg
	FPET/M5IJjIi/EqGJUJsbc+RapePUsCSb/bK+08CA0deA+zn8va5EUGPGZrqe50+Xn4qex8Sjq1
	utV0O9FHNvOMBjA3osfqFMKC1qQtSai6Jo7bGBNApmMfUFHMOPsy
X-Received: by 2002:a05:622a:2d4:b0:506:b77e:5431 with SMTP id
 d75a77b69052e-5070bcb52c8mr160299231cf.55.1771928537721; Tue, 24 Feb 2026
 02:22:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-fix_zero_wnd_fin-v2-0-a16677ea7cea@gmail.com> <20260224-fix_zero_wnd_fin-v2-1-a16677ea7cea@gmail.com>
In-Reply-To: <20260224-fix_zero_wnd_fin-v2-1-a16677ea7cea@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 24 Feb 2026 11:22:06 +0100
X-Gm-Features: AaiRm51TafJQC2hYO4iQ2Oifkc5ftCbKvt2gFRRO9OSQG8DdaeCe6QkzNpscBHg
Message-ID: <CANn89i+iqQWy2QcKi_wFS2nRKcygwBUPWmSTtr2dp9Ey+jORHQ@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] tcp: re-enable acceptance of FIN packets when
 RWIN is 0
To: gmbnomis@gmail.com
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 9:20=E2=80=AFAM Simon Baatz via B4 Relay
<devnull+gmbnomis.gmail.com@kernel.org> wrote:
>
> From: Simon Baatz <gmbnomis@gmail.com>
>
> Commit 2bd99aef1b19 ("tcp: accept bare FIN packets under memory
> pressure") allowed accepting FIN packets in tcp_data_queue() even when
> the receive window was closed, to prevent ACK/FIN loops with broken
> clients.
>
> Such a FIN packet is in sequence, but because the FIN consumes a
> sequence number, it extends beyond the window. Before commit
> 9ca48d616ed7 ("tcp: do not accept packets beyond window"),
> tcp_sequence() only required the seq to be within the window. After
> that change, the entire packet (including the FIN) must fit within the
> window. As a result, such FIN packets are now dropped and the handling
> path is no longer reached.
>
> Be more lenient by not counting the sequence number consumed by the
> FIN when calling tcp_sequence(), restoring the previous behavior for
> cases where only the FIN extends beyond the window.
>
> Fixes: 9ca48d616ed7 ("tcp: do not accept packets beyond window")
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>
