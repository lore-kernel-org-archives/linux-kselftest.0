Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F0C233924
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 04:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779251979; cv=pass; b=pYgXdbCw3KyQ5aJU6v93/Psbt2Tb+tem7TlI+/9ebRt0uZkRz3H025qT4+9zhQg8h+JFFm4cAQ1diEjRKBxDW+bZUtmb+6q4NOVHw+szpJjBuKu1TJC5vi91Mo2SqrFUXPCClEQdD2Vid9dbfUktuRedkLMWlFSgTFYnYrte3kQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779251979; c=relaxed/simple;
	bh=P14/4Bqu5uUuw06j+SRo4HPvnUgRVexcBhmq9ZxsP+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJBC39LbRKac9InfcBnGdTOkNrAq/UbQvFsx3YApCISX7fW//oazJgQHux/lP3dJ9eRC/0K3bUldmAgvxasYAh5tZMrZHI5A7K0Y6IHVUV3Xvd7LEQTJKXB93bsQ4XxjAATFD2CVR6csng/Acevp9G4xCmnWsa4cfIYY60wRlWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W+y/6/CT; arc=pass smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W+y/6/CT"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9106ea78cd8so721727985a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 21:39:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779251977; cv=none;
        d=google.com; s=arc-20240605;
        b=F+q3mNQaBOk4JdndvIFuBpKT2J/n+ersGcghbruQdfegNfvyjt6NBGLG6+OtUNjrpq
         meZMl+6H4cWhlsBYRhdsTajGbnj2u+0vRmgyvSwxmlz4BT6HrOAoP7HkYkdvB56acatd
         9t66F4+iXlk2F26fGqPo1Y/Nk3LMZRdgEcN7ra+cSfCFelQfq8R03nWr0vXV2tda7Aii
         EOU4jfeou9m56vyEGArqMmgrUJafAu3SJnjuTIRiFcE7bm3YGxgOt9qUJgxdgzDDjWLP
         zM0miYvb6KmQk9QT3L6JBD0lzmFwBH4xHPX4TRGo7jq2FzCNipc2xH2IQukCTLn9s7aq
         o+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YVPSHkBYcknNlvutxyF1vq8PwV3dsuW7+IYZ8sKOiMo=;
        fh=J40k41uDFwVXAerUCvwwzclwGac9SkYxxhT8Mif3WMU=;
        b=bvxKzO5s16qq52Gagk/JG3tCzNoaivxL64ZHytWYW+vmAVsOvAorb65KMb3CoYqZZh
         soM075egLhUS2j5CCD9qJxMCmaTLdB4z4u+O5Z7I5d/CZXCaPe64ljUpNVYnwZkcWXr9
         WoSwiPv0JhLAcYid/TdRqlmbjqxO+5VyQ90pWkMWZbIgHlvyj5nZzv+o726FLpky2/2C
         zYaihkfjP2LNTbOB7I17zq1UdWhaOhz8f9qCswIG/F2jcJEfE81d1xc6H4+JP00kD2W/
         iEoqRn+pnJGKLUiwdYEDG4NimoStR2oDaesuFYdby3PvJw5WG8xlqdxkoOfIIheX9BJZ
         7xSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779251977; x=1779856777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVPSHkBYcknNlvutxyF1vq8PwV3dsuW7+IYZ8sKOiMo=;
        b=W+y/6/CTKc0MAFltSXmlz02Gjjl8iXwTym2khhlJTAsSb5p3LA8MyRonu6k2Ko9MSl
         NTBHJFq+knMDlFQCPd6YT8duMhqbUJ6uDQtL5P3Yvh5/wh8vk0UxYZGpRsazPMAGHo5B
         sVCf55PI2bZ5DXzH6smua9S7d9THWXHrmp9rJYt/7aC9bS8uitI+bNMWrIL+PMIi1ptz
         m6ONrLaYBsadbPUpG38tgG4W7SqgGWy1cwLCdPLqRcNZgd5fwYrSeyZpeUrdZANFjbY3
         zGIAvpU5gIjZechlh02hy3n/f/l84BPt/aTwwhKep0HZgyrtOPe8rRjihBuSAJpGEKTH
         Tifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779251977; x=1779856777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YVPSHkBYcknNlvutxyF1vq8PwV3dsuW7+IYZ8sKOiMo=;
        b=R39xHMUAU7mvjlzBIPSiWm7Wb9NEeiKpXUKo0/cnCbxeErtMhls0jO62d1uogncKeU
         81I7QyUJhMgB6BOqeg1qsoUr6bo1rQwy59aCYxrKTgSvNJHUtpEIXwAmYsgOPHPv/GJl
         Aw9mLXFYDCczJOpey8uqxMJnABCGzv5OReROVpf17NYOMKwcvjHWpkHI+p6ntKaUp+9B
         9uDUP8vWlyPLBX35TZtHJs2X+ADM6ONX3nDkBezW6wzJGK3qFC5MNkukJ8jO+phqhXMp
         Revd67lM9atITHFS4RAnkHkjVcdqvyQPhlcUlerhmAZo1Kht/fKGo4fT48KfXF4oAw5y
         fY5g==
X-Forwarded-Encrypted: i=1; AFNElJ8i4nWo3HjCzwiPpidOXBTdw3btc7A7WWuCSIDTTAUfi/5ArSNQzLpKwQkRgQ/nvys2bbjSR8TUKKh/9G34tNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjuFbcrRFTyzJ1xDlTpdKL+ykjTE4AyxhZFyAfpygZqP/afxa7
	aZKj++kC12N5EQ+CzIfUDlwo8VQlTKODQyVdLgWuh/KAHic1kvEXaY5FgVipRdcjPL6LixwvBG8
	QJGrzFeWuReoRvuCGsQUG1pMHeD6KbpPWK0dGLjq3
X-Gm-Gg: Acq92OHYKweExtkO1Ru/iG2Y5MYDV9HMwr81C5R0oUZcyF5OHSqrkudNIDQoP8u/x6n
	Jk7m8+u744xoNjIRHjp103DKsjopXm/NvzLT8tw+9mLake+NBfldLD5k7I+V4823DS5KqoxV/hG
	ni2VkZ2npsGbtSKVaBEyR6rNduucCCSd04+Vgf2yq4PFx4vfDJssGGhPCaaAg1CqJhI3pc4J1LV
	mBVNUuhvhRzpC592Y3EVK3zcS8oAfbeeSwLRwfSbEhj6fj6uBh2rBNXiy9GvNdD1xO6iQvSuoeT
	FeOhGHk9KP6VyOWhSTChw9KBu9UaS3yVwXoCD9PfdKyEPI1K0urnfNCO0qMYxg3c1Yzts8yOSpX
	v16XTn5ZcaB11wRzFS309IdJrKTvWh7aOyBiGnuGZeFC5Dd21N3icvdn5VguSLnd9
X-Received: by 2002:ac8:7d94:0:b0:50e:5e8d:87d2 with SMTP id
 d75a77b69052e-51659fbe971mr323408931cf.1.1779251976863; Tue, 19 May 2026
 21:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518183424.3144867-1-sbrivio@redhat.com> <20260519190352.45c8478e@kernel.org>
In-Reply-To: <20260519190352.45c8478e@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 19 May 2026 21:39:25 -0700
X-Gm-Features: AVHnY4IDfMyDXWooEL9P52eF0h3DnkFqEfpX7HmWX44NJSeGokXsyph8DZz-2k0
Message-ID: <CANn89i+DknqarcKuZxku-XvoioqkXrd3sQd3PXW5fdFZBpPxjg@mail.gmail.com>
Subject: Re: [PATCH net v2 0/2] Fix race condition between TCP_REPAIR dump and
 data receive
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stefano Brivio <sbrivio@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Paolo Abeni <pabeni@redhat.com>, Pavel Emelyanov <xemul@scylladb.com>, 
	Laurent Vivier <lvivier@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, 
	Jon Maloy <jmaloy@redhat.com>, Dmitry Safonov <dima@arista.com>, Andrei Vagin <avagin@google.com>, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 7:03=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 18 May 2026 20:34:22 +0200 Stefano Brivio wrote:
> > Stefano Brivio (2):
> >   tcp: Don't accept data when socket is in repair mode
>
> Not sure Eric is on board with this patch in the first place.
> Sound like it's not the intended use case for REPAIR so IMO
> it's up to TCP maintainers whether we want to support this.
> And it's definitely not a Fix.

I am not on board. Only net-next material for sure.

While v2 is slightly better, we have the fundamental problem of adding
stuff to TCP receive path for features that almost nobody use.
(It took more than 13 years to finally complain about the race)

This consumes Gigawats of power on our planet (and tons of CO2), given
the trillions of packets processed every second.

Please at least add a static key as we did in:

commit 020e71a3cf7f50c0f2c54cf2444067b76fe6d785
Author: Eric Dumazet <edumazet@google.com>
Date:   Mon Oct 25 09:48:24 2021 -0700

    ipv4: guard IP_MINTTL with a static key

    RFC 5082 IP_MINTTL option is rarely used on hosts.


But in my original feedback I pointed that we TCP_REPAIR should
probably only insert a TCP socket into TPC established hash table
only when it is ready to process incoming packets.



>
> >   selftests: Add data path tests for TCP_REPAIR mode
>
> Please don't add a new target, fold it under net.
> Targets are a PITA to deal with in kselftests.
