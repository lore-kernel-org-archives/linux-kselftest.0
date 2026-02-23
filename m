Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912DD2C1585
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 01:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771810609; cv=pass; b=DbgIm6dOfLYmLBypyXxUluIiqEOQ8s2mMXEmN0BKW7fLinXaANOr4i8Lym938W2+PN0zCszRw7dBeTmh+eAeWiDKOCaXg4ebrrn01HGL8yFgCQPwdtnnigrReR27py1gC4Ea/LJwQZCVGtVFYsd9sI9N4NxypUR6Pvsth7PBBwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771810609; c=relaxed/simple;
	bh=56807nNBqcnG8caOg4si5mazv6USZKC5wC1JXqZVBco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PmPv2IMIyuPHB3pF3Od4wMHy6MAgEvTy7jFPCn1j76ptMPFK35Yt7gjwGG2OqjiRVrLhNC6OyjJil66M91s3euemavdEqSsoC/HvMCQX30UGso15TAbNTV8w8TjR8CqHWM+lu/EgfkdW7Y9gsxJdkLvA1edua2/i20+tEXaTuK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nxklwCU8; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nxklwCU8"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1275910b930so2775439c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 17:36:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771810606; cv=none;
        d=google.com; s=arc-20240605;
        b=f5CZAHTkt0pANhPlSVf5Ek2a/cWC5sbSBNUGYa18yXUcs1izNpkIvbMo013kpcg6Pd
         RKF/s9yzwuXSa52B+ByoEJWd8WiEOJ1a80JJEnua2pTdzRPETqPulufdAPIflrBYZxib
         fB8Lg9Q6Af27OAJ9B+ONgHBmzWRv1KsSEYKp2CYEQ7IiyI9aAIo+zLvDnnHHEcSTHnBo
         dRYQ7sGVPRY0O1KTCKWdcM6Tk/8+iCKteUK3nzQaEjSg2pGs5iQF1+HHpFaJKqKzhvEB
         YOE0UZsl+AvMELscgh7ovjzaRIc+qXaPwXcFWsAOp1Rtc6/vMm9yXQxOZmFwZydIj4VN
         2LSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=56807nNBqcnG8caOg4si5mazv6USZKC5wC1JXqZVBco=;
        fh=Rx0Cbivo6A0bIOGdSTbmNC0/LNEJR0buuVHLqqDoPTQ=;
        b=fVWkiZ5JXJLZUVwpBP0i+DCdwjl5U6IkXuY9V0yJL3OUa+etDYNPhsYjF6nHKhjOp/
         Sx9aynA94pv8q9bMF2BjVxj0F6fzJr1+1+bbp4AZQE3n1/jAvpfEemctzT02DlQBK7tP
         wrPpHp0JB9AuR/V3rPW6oYmBzzgEzfy4O9NIGNZJSFCIMMbMc+y8JybQPe2tPW9tJrRm
         mOkBhlhDxcJzfHAYDP/74jIvOTyh2dx+gkYbfa9PAr0R/okXllRD9ZLR1f7G9dTRwCat
         iDRQlp210gxxXEvkgMMHl1uQotZrWKUDTHPS2lEmfWLA5PDtrK58YOquhyS8xdl3c6Mi
         y8NA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771810606; x=1772415406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56807nNBqcnG8caOg4si5mazv6USZKC5wC1JXqZVBco=;
        b=nxklwCU8WWTX0irmi3u3rlDJwnd7JYICpzATq1P8BArHzHVWQjXb7FiyJqrLQqRlwM
         0CKefBEDTVL2UwuNPBIP7WZGuxUsrRZyz164Vsqja6irqO1elginN0s38TrF074Ao7KD
         DrXujcES8cq+At1Ers+Dxu7n4RLKcU4YnQOr0IsFcvOEpG2EKuqTUsuIR/qtx3nV0xDI
         tzFytFeh5KX9G/GcxsYTic8r3R6vrr/uW+pHkU8rOGOZiFW3lmO8pBiKUiZrry4i09ga
         SQuo92B2tCKhgJpvRDyC8vsnwSkruVa8hFgxrOwIN/NoqvG+lKqVuriCcC7sosDQBlk+
         EJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771810606; x=1772415406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=56807nNBqcnG8caOg4si5mazv6USZKC5wC1JXqZVBco=;
        b=EVvHW4s0xbXOAeq0UPfZIooSgm21ibvLuIlaammae9dwQy6cltl1cECXkLv6B/aBHn
         r8ah1I0g6eO5i/YnSG6TLrvoG/wbKcRFYkd6YPI+qXMSp84SjMjRQd3wMVV0zpTUFx9P
         NgW30Qfc50OEAVfPfNfjPfaiSIRxdN4YYM4C4kXBPH+d80ejMmCOf7u0g5qS2bDc8Nft
         QjyhXs2lkDHzlo/kCvZgSQTClI34PEn7LwfiNZgQQ46VAyuWin/c0Mov/YN8IxjEMIE0
         89sKfCAVlWhKe9T+t+kXroPP6mrTekGa6LERD5WEKo+q8beOubxE69qgXct30DA8andx
         nS9g==
X-Forwarded-Encrypted: i=1; AJvYcCWIHPD7VNbzt0LgsKNRKoCHzM1+2CDLGiiEfq7PkFbhqIBcYb2i7QhuYeLGtTg2zrlKhdtQoywJ/ekd0Dr3rQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YywKnupERAHzLgcbDXrAQRe/Iahg2AW1jrI+Ky33W5mEkcJv1qH
	0SCp1U01hTRQlpE4cpkjjkjIlWaujC8zHfURs1Nt5ZZ78z0Lc8Mtr8xQSHKEilUA+vGpr/4nrXA
	xOkYHbAA+2Yj+0uUHRsAoWPor4uviAIIoRT3qS9ot
X-Gm-Gg: AZuq6aLp/4s8zSqw5saZnItH7JbbgDTZNTvzEx7Pbvwh660iVqean43i1WharyVPCzB
	hneDr7DXm8fiDlXOknbwmF3yDzqeh5a78a7s9BIfukvJgdxJ2N3rOlqU2Lp9tSOBTtmfz/CSjsB
	Jo0gXQR3sUQ3IQk8wlSOI1E7NrHt3yLb9dzT31P4vEQDCjK7wVW/uivvtJvr/Dyina8AnZdfIuC
	MYbcnLKHzH+0/PM2VwVafQ+JZ17FDhAnMC6NZe/NqZ3sg0Za4pZUL9u/LEd2UQu3RrKkRBH1Mmj
	v7k2IhPlKOLWeLedmaNkaHJnrlM+XD3XHvlRdMBcr6HjfzfhqqCj+OWR6BDsnB9czrtMBhnW
X-Received: by 2002:a05:7022:210:b0:11e:3e9:3e92 with SMTP id
 a92af1059eb24-1275fab7499mr4383996c88.23.1771810605061; Sun, 22 Feb 2026
 17:36:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260222-fix_zero_wnd_fin-v1-0-5f4034952f3c@gmail.com> <20260222-fix_zero_wnd_fin-v1-1-5f4034952f3c@gmail.com>
In-Reply-To: <20260222-fix_zero_wnd_fin-v1-1-5f4034952f3c@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sun, 22 Feb 2026 17:36:33 -0800
X-Gm-Features: AaiRm50qMcdmSp1awvPNwQmaqwcUe7gupisvQyzMI5Tf_UWIEyQFIUbhjca6eWM
Message-ID: <CAAVpQUCYk+eNb2oFVEzob9bh8Th39wqdxD5b-L7AzO9cueCOxg@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: re-enable acceptance of FIN packets when
 RWIN is 0
To: gmbnomis@gmail.com
Cc: Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 22, 2026 at 4:35=E2=80=AFAM Simon Baatz via B4 Relay
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

Good catch, thanks !

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
