Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795226820;
	b=xQ7zs+1CalxDuuoXCwFyL2vF9lNqYz7HGjH88L87+RPCeFhjNBR9uXEQfNDVhlN+UHtb
	 16blc92iJMp/v45Ah+AtXEyPXfJV6Gp3P3rp/X9GHZ9mUTN/G0MHeMK0EPRL7FSZu0ZCm
	 MJcRFIHiq3xMAaGLs6r+CtvXiVJ1R2kot/aqzDh1PlGoavkQJFpG6itx6TkW/aD3eJSlG
	 FZDzaQsoiZj1wuCsrwH2rtw7me/KRkQbsnDU4DwHS2jluMLAi2MQRk5T2sosfJv7vheKt
	 YgbXK9lgwrPWL2digwNhFTmAS0t9yF1FSjBtt+XhcpjHpi9hl1a0ueq54XrGAcpcSiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795226820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=vVLuUuI6K1ifz1GqKSYzHprCpYxeZl0+IrxVN2vu0Ng=;
	b=FJ2x/tnF7N6aBcMU0QZhjXWeaA+yporrnIeoYMqUBdZs0CnZoA+gwZqZg/C6A93gdQ4l
	 spyUBcjqOvvHHeDGvc8AJRPIE0gju3pY2dWEVNssNp9SMF9auUGNx/Z2TaXZD5gG4jLCV
	 vdsfn/TEJQJLRHPrvgIC9ryW1VLHUcP9Uyd2giCVywpHP/2rBllEO5HMkeXsFQD1TeA3R
	 3Y4MYb15YUK8FeaXGJfj06uguRpJsIyqo9DileLldUNfpvjwzOvtq1YdwixGyYt515ARU
	 xC5Vf/Hq7W1h0J3EQk1VXm2UsaA8DNHdpPbxgRnJy70StGTMT7hSqDqi+qxIq1Qhd0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IdnzAlce;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701F1606A6A9
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 02:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 701F1606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IdnzAlce
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2efddf749e5so11929345ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 18:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795226815; x=1795831615; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vVLuUuI6K1ifz1GqKSYzHprCpYxeZl0+IrxVN2vu0Ng=;
        b=IdnzAlcejCgRfV1yTDlJ7JIXQKOF3i9fDJ+P+8gEkJZsOhEe4ALRElG8HRM6exjIny
         NopIK4jtjjEpBRi6NrLDXdlevi9shStO7+tGo8DRFcSB5vv1jJJkA5cquC0yRkXk2cQ4
         wJxXCGenDy89ljTPiX9F/HOX/pim1azvz5SwQ+TrLiNTS1MZlvqrtV+jk8rwb92LoklP
         f7Eq7UBwWYIPUezJ8AO9gyKpqjBLajm6oyv/pZVxcE6uSMpPrR4e0WIybPl/MQWhJ/kt
         O8xL4r5EHL0acB/ce4nPFbfXE7FBybhS0/4jnshnXsMcOimlXzKPzCvpXNp8VLXNQQDg
         8VUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795226815; x=1795831615;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVLuUuI6K1ifz1GqKSYzHprCpYxeZl0+IrxVN2vu0Ng=;
        b=IudHdoAC5vyHer/wz8pbqKBLKVBzOAFOIs1yDue1oQo861nm0QcYE19GB+CHYQgsCz
         BRJlYqsVYczgi6eL6LKwNJ1S4jFpKYMg4BP9gVpuXDGS0PUTs6byhnE+Q+V9wtSIYi7D
         EcaSv10Vvbvjdnl7Jxjq0SG09IIqfJgQY6VBkYXg0VxDftZb5e8QSUJd9k6WqVlxEorh
         SbhWlRjyBsGp1vvchsmjqZDp31wy9aGDznu2huaONG5DZGS7gKSVBw+AOx2A5sVw0A1z
         yc4SMaNSorRH/RfcAIJ8/KChDkqmEqgfIHGef7DKvt07dmIG6xiP27Fhf+4fjpgW0Tbu
         79fw==
X-Forwarded-Encrypted: i=1; AL+hErFOjBS5QoPcTqCiPgaHGTrW41rX4z+bQQLOaovPN3zKlKWTmMb7bmwvZXbh3o47n1WJcjA7ydk1mzbgufwKtD0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/m0WIqe60/ntvoxFBTRKhZdcEjiBQZVOpTTE3Dp+ODN3dNiQI
	lLgcPgYFgz3uPux3fcIxxu82DvvgotUDwzEvE57SB9g+HZf39NQKPI5LzYXXbw==
X-Gm-Gg: AZFdTZfJ/GTWmTqVqPQhvRxfaGSVH1eF0Zr/RZnEITpCYL3Fp9GCF1KGO+e/7cLLXLM
	e0txvZl1lNueVxW0s+B7kYYfgtOj11OVcthElr5LszwKpMUhYeGwTDaFzKAFN5lApRzeg4GwcFj
	UsUYEgvbilyHKs4PsNapnR8ChdmkxHqr9EwYyU1VIyt9Euk1nvkxybIvpgpMLkWIjCsg5ikwOsC
	yo5p+ZX8WXU77rV8HcMy6E2EyquV+R/dSOenqlE9uedLo2jaZHfQ9f2TnyEpQbhaie4DMlsPqTM
	Swkqhsh/LD4j3dB94qccfxMfipeqSSZbsre5/97sLCod07JNqiprlfo1X23/hQ7rKPgmw24UGQB
	V4wZnEPLQFIqCOe8Nj8rMcWsAxAj5QZOCrOTstoddJGvD92/t+5vJisXeMj1b86LHZhA9e2MQJ+
	3AwQOKUfJ+XCMiNdc9XLiMH+K1R38zdzzZuJYyKrZoO5YSfH8FdC3tjrrrX+BhYOj0rJQc0DSop
	bh3huZeRCBi46+Od6gBtqtJJKdCp2abwO/Z5njEGNEx/PCHaeI076bCeGHMDTSml1wuf+LsCRr7
	eX+F6h1hokkgMdltkB2/AMxCuJPoOFwao7babiO+eqijQCHzfGWx9krmma+zf+gli+bHm9DULfe
	6Z3O2M+TDw3GLWeH45rcwIOClGB3ujIQOKioy7UrhqMpZtqe/GYk51gmi
X-Received: by 2002:a17:903:1c9:b0:2e2:d3ef:125 with SMTP id d9443c01a7336-2f03efa3ce4mr35706575ad.5.1795226814533;
        Fri, 20 Nov 2026 18:06:54 -0800 (PST)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dcbe3sm20984035ad.28.2026.11.20.18.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 18:06:54 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Nov 2026 02:06:53 +0000
Message-Id: <DN0ISKVFQRMA.2NQOCMINC8LDX@gmail.com>
Cc: "Maciej Fijalkowski" <maciej.fijalkowski@intel.com>,
 <netdev@vger.kernel.org>, <bpf@vger.kernel.org>, <daniel@iogearbox.net>,
 <pabeni@redhat.com>, <edumazet@kernel.org>, <horms@kernel.org>,
 <davem@davemloft.net>, <shuah@kernel.org>, <hawk@kernel.org>,
 <john.fastabend@gmail.com>, <sdf@fomichev.me>, <willemb@google.com>,
 <petrm@nvidia.com>, <bjorn@kernel.org>, <magnus.karlsson@intel.com>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next] selftests: net: don't warn when bpftool is
 missing
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jakub Kicinski" <kuba@kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261118165338.1064930-1-maciej.fijalkowski@intel.com>
 <DMYSCT1OYI5F.2HSYP9MZ2BRJU@gmail.com> <20261120180307.363312fd@kernel.org>
In-Reply-To: <20261120180307.363312fd@kernel.org>

On Sat Nov 21, 2026 at 2:03 AM UTC, Jakub Kicinski wrote:
> On Thu, 19 Nov 2026 01:11:08 +0000 Alexei Starovoitov wrote:
>> On Wed, Nov 18, 2026 at 08:53 AM Maciej Fijalkowski <maciej.fijalkowski@=
intel.com> wrote:
>> > Based on the bpf-net-xsk-move tag so it can go to net-next and bpf-nex=
t
>> > through another shared branch, as Alexei asked: =20
>>=20
>> Acked-by: Alexei Starovoitov <ast@kernel.org>
>>=20
>> Thanks for the quick fix.
>>=20
>> Jakub,
>> could you make another stable branch to pull?
>
> Are you sure we need to fix this? Do we care about the bot?
> We have a similar warning for having latest version of liburing
> in drivers/net. I think it's useful to let the user know that
> they are not building all the tests.

the bot seems to yell every other day 'regression' in capital letters.
I suspect people will notice sooner or later.
If you think it's ok to just ignore it, then let's do that for now.

