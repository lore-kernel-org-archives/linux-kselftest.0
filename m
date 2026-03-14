Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FBC37CD51
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773500149; cv=pass; b=ltr8OTAD4RrIG5ccGJHtlLlIkc9TFcuUMp3BRxivQ/zbCH8RsbkKfYrGtbaImE59YZHbor70cRauLDgEi5eQGkeBFE6LinVXw5JHwPQjxOsALiZwG/SSK6MXHzQr7eU+ImBkmFwRpMfMJRMVKUNKwTKIrjUM69GvtJ9sFsy3aVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773500149; c=relaxed/simple;
	bh=Ca5kh9peUXUreTgn89AvAH7iYz5iRwVMohpHmv4hihs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PA3ZSvHW89s5Z2qN2DEw7Z2YiQMF3ED85P2aHyWY2sKGbLsvPz8uU3ouLmqdXo7r1rh/g35A3XfPH8v6hnutX8A7ol5YhalWfoqZLhhHWZEmW8npBvwog9OTlgz1fKde24YLt91tbBdNo/Q8ew1V11Uck4itILENNaFgxRU1So0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UnmwtPSu; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UnmwtPSu"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-509006c070eso27689591cf.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 07:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773500147; cv=none;
        d=google.com; s=arc-20240605;
        b=UrWSKbJPkaq8aqqNw68ALK3lxIMdSQXc0Pm9Xyrtt0e3TrxmQoHK9gbcaEWu7NCUAQ
         LF5YQptx4uIQTLpjmUzxEsnR/EjCLG87YWqtKgtVj1ceyx/hbnxVag7e9u3yoWXVz62V
         qZKiMzA0oswv5tInRF30+I/MKhg/jl/OG+YJ3gB0drFNYDyHOvLL/fOrssHnduT7vD71
         /8foUthBqgH+I3+lz4yDNy4NOel7OAojfIlGUOjqe98X/W9QVXipqY++2mO7JBceElEa
         5VbeXNrdx+u1/fSGIRq7WYepsKxl+xhhgxN4OlM3t205sHI6tq3VmfeUcqltuBu9w00v
         VpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ca5kh9peUXUreTgn89AvAH7iYz5iRwVMohpHmv4hihs=;
        fh=1JRF7MSBDLblX7fl7ZAX10M4h+z3TSds0BecXyWL8BA=;
        b=RcyxoQc9F5gX3qjwkGW+VQdv7NGpUhMyRqjXfB7sZ4BbRgCZ5XHxvNdnWrZrxtvPfX
         aYPprHZKxJb1WvPGrarGqA+qV2tpE6eYTsm7Y48ialWZQJRfvGuxXl9rUoJW/jfC0D3X
         up2zOeSuurCIMUi2RUkLV7eW71AOy/zJ2hz4k3I3K/LofJqGUMBKZ5T/q+pJ9STleEnk
         kA9rKPLGcEtNvUsmhltutcm2HRgignWvxHndrKhnLtsIBi+TD9Lf3e5eo+ujKAxAY+/Q
         Cc3SHzlD1vEPKpBzJ0w9ZGuCSpAbyKqYmonemYTljeFNlMm9iaR2fv5aoKnq8cq4SVqu
         6dNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773500147; x=1774104947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ca5kh9peUXUreTgn89AvAH7iYz5iRwVMohpHmv4hihs=;
        b=UnmwtPSu8PBpZh9YRmoIKlUGcKidY0LqgrE1SlTuyFCpJmnr1NYCLtl7DzKlcxOjyt
         Km6T2SpRmeCE5VrdTT0K2FWGGJlaDcc2swRMYGnEKyhROPEkrTytz2XAHTnWcRF0/PoH
         u8OsYisk3eNuUEu51gAL64e0uI7blKn38SWI+blhqjs1zj7X8NEJhpZcfRahEmEBf/Yq
         0d1Li4EO88auLuF6ik9WLpFe+lO/HFCG26a6Y7Tx426tiY3mHHF0gXqiqqRKcLTw8gXj
         18tVdqpNNonqZFYp1GqwYlfv+CDHYfyekSrD1QZxZgqQ7OED8mKmnua7k9v+qNtja7yP
         BSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773500147; x=1774104947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ca5kh9peUXUreTgn89AvAH7iYz5iRwVMohpHmv4hihs=;
        b=YoAtiPfaGOuexbNl65pTuTDjmG4Y8qrXIEcXAwUxFOi9brpunc7DBWH+KnCYMOBwfj
         n8SRFC2wWP+M7D103oB0hCw9K6ZF0iqciwM0xmZEwxfaSKfBaMywUQQp7z4imASMfJm9
         E5JQ9Rhb9GUsEnlj06Vpc3kY7OtHfyHCcnSTDn0RV/bLiOcYn2VqaQLW7yyGF5PMKrk4
         lajSzEpqygEcADwOgaZ+Kk4J1pW9Wh9nH7LYUH9O5ZIJj8yT3SWRZYjvZ67j2rZYBtlf
         zYcOl1pRGUa9SQwCuuXV34gNE47ODmTOSgl+jf1TgyIFYMUyr1zhwX3p4142QAbxy6Gv
         71hA==
X-Forwarded-Encrypted: i=1; AJvYcCUq6jeJieyvYl30KmJGo7RvO6d/wIsFcpsHsC+Ey5VaNXn8SlQunW3IEEiEVJoizx61fThnlX11Ap9uUFH8vIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWflicA26NJkNB8YX9prXH9Wyxg2P8a2RgGbdJ5d2Dw5zRIPyP
	1m8xIUJojXjVJQq8XGeYk3QVM8xEkdvVMk+RiW7RS8NoKclJtib9OVRagLx2l6OP1x9mEXdc31U
	Dg7HAoYSUmiC/M2bNBEfZg7DdXafU2dMzDsVTwPlA
X-Gm-Gg: ATEYQzxjQT6U2W6ERB2RBAxYdLcoIIxY4EQqdvPYTqm4Q7wGu6YefIN48daEsG73A2b
	DdQguAWJua/RhV9FJ+aYygd7Pj/5wcAomWU0QReRfpt6m9WoqrE5Ow3Wp1J3LgOKSjyiFBJ6bue
	rOkk4ge5YnMWvh95xmiamfbF6YeXh9xJsbCiz3aCwEIu34NuBRx1wNZ81dpX/IC+anIUtvqaGjB
	31mg57Q8dbUioIEnlofGWypVoQ7cy6Qi9XSENi8gsHs1XS95NbIHgeJzy2FNLcesv2KtwhmebTU
	kqNWxD8=
X-Received: by 2002:ac8:7c4d:0:b0:509:1009:e7a6 with SMTP id
 d75a77b69052e-50957de8d93mr94929211cf.43.1773500147029; Sat, 14 Mar 2026
 07:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com>
 <20260309-tcp_rfc7323_retract_wnd_rfc-v3-6-4c7f96b1ec69@gmail.com>
 <CANn89i+PypF1cK4mnp8L_eCG_z+3Aj6uxJoohm_=DwGfR1=4FA@mail.gmail.com>
 <abCkmiCSPkmxzECa@gandalf.schnuecks.de> <CANn89iKYxs644ardFFSKo8d0EXL_2A5eUQjWZ3yp9-Q4tVLKzQ@mail.gmail.com>
In-Reply-To: <CANn89iKYxs644ardFFSKo8d0EXL_2A5eUQjWZ3yp9-Q4tVLKzQ@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sat, 14 Mar 2026 15:55:35 +0100
X-Gm-Features: AaiRm50YYJlq5QX8gZcwi86mWXpn3wuRkajMKwpZDqBSmkf1bay96mdoaMNxTlo
Message-ID: <CANn89i+sEmZxcYDXHE=jtjNxoitGE-z4qkcS_eWSbiWHyNTs2w@mail.gmail.com>
Subject: Re: [PATCH net-next v3 6/6] selftests/net: packetdrill: add tcp_rcv_neg_window.pkt
To: Simon Baatz <gmbnomis@gmail.com>
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, 
	Jon Maloy <jmaloy@redhat.com>, Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com, 
	Shuah Khan <shuah@kernel.org>, Stefano Brivio <sbrivio@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 4:58=E2=80=AFAM Eric Dumazet <edumazet@google.com> =
wrote:
>

>
> Then add my
> Reviewed-by: Eric Dumazet <edumazet@google.com>

BTW, this can be done in a followup.

Jakub/Paolo feel free to apply v3 series if this is still possible.

Thanks !
