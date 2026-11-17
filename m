Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931550;
	b=LjQvTvL9Z3sNLYGHm53mwISOffNbmptPxXHMxmVww3Rp2/kHa1fdwFwB3V7WMs7vC8yt
	 wfrAr8YMI2SsimUl5rUP16cGU/trxd/P24siEuSQNzVveaEyM/BiWFoiSaNokoYqx9DCb
	 sTJkLqX77tIb0BX+ByTGHAsj0G+YE0+JjFywBBdOpOQsVnpnFqYjnsbongmh8y5q2zhsH
	 qpXq5cmiBTcEqY9Hv4MqAAiHSF8nRt45rv3IEyZ3NJm81+0uIeIMWFos7V6JhOLL0w7sz
	 6jFIitTNq2kY60y73FKrLT9JGvTuTKkHQkoSYkMHDHYzPahDGD+BJqqbFoxbq81A8ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=IG2RtveLbr6LLHiOkKFy7cZt2dAAYGYqRZMKbSVVxF4=;
	b=zTFSFqZNfNlAl1zIjLeT2iOjfrEzA1Zp91rdsD8Suwp459Qy+2aRoPaxzzCd/npOgG36
	 wc0M23J5fkQyWMZNoULWZuNyPV6loLSW+HEei8OpHcTybtzdzBJV8Kjmp9/UFFk2+RucP
	 pxVGh/5xXutaxMEhVfHz6viLfd3aiQ/C/jOdPpWBe7QxlOCvfZDGt+6qaHDxZXXtw3Ezb
	 4ZG0WpNuaEwOhEAPvCtp7/V0vOPHMSPKqJu+uTOc2L38dXkcgqtKFLZep2e87iD6Mpary
	 vMXZGvLPVdm85okOaCBN4P3vDNC9xbOIujJ7auf30r/Qp2edBz4vTuJTLcg54o4mFRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=YKKSBogf;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042B9606A338
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 16:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 042B9606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=YKKSBogf
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cc013095d4so1521798137.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 08:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794931549; x=1795536349; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IG2RtveLbr6LLHiOkKFy7cZt2dAAYGYqRZMKbSVVxF4=;
        b=YKKSBogfpsOaEw7hrTWHZ+eSaB0FBHjKyn8IasdKAsTgDWDfjvGtFh+QKyhd9eN7ub
         exPwrhrKuT6LjORsHH82lqZ4CZUeXZGvFIOfzRvZV6IZds4/kHD8fD5yxbUvk4ljrWdp
         7O+qlXhxQpfXDWZycwzanxMqdFm1ezkM6IVwJaDDSCbJntYJJ2XJPh8xO3hLu8l8Lu9s
         XyWR6w1ij7RjVsBIdgza6nQt2FoeSRf00BMtZOyQ20SJIq9uF8PJQELrUmTxhi8t0l3h
         LoE9nmNF4DPCG4+DhyWlB0ipvZso6GLnNXIbrSBJxkfgvKtQNK0qkKKdAv1bwXUNmcMU
         jDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794931549; x=1795536349;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IG2RtveLbr6LLHiOkKFy7cZt2dAAYGYqRZMKbSVVxF4=;
        b=pesSbm5iSWWYX+kfeY8VYYgZYqM60OWpboh9MHf1fLbmb/gcAkllWiwH3u9h96Hlqz
         Coh3NyZdZlz7FSOndC0iWY9he1ARvh5vcFmlyXjNqtvct7PWEsQgQIzy+AKfvLG+KWKQ
         Z9+5xqKiZUj6FUuBG7QNjlIOBkHpPyi3A3a6+vsMIhFP/S8Nk33i0fXRR/D4G6hNnGA+
         7uGXxXOWZ1FI7CPdG4sgB3f+cPibg0lvV2ViKEZvM9o400IRb/VinQK5fEJAs6duPApD
         X81mdECFRWxyIvCZG1RTPqDaQhvlINwjp2qaFTZoV66ZqFpHw8o+y2JhjSgf6l87oX7i
         BthQ==
X-Forwarded-Encrypted: i=1; AL+hErFHTQBw3COfVxgv0hPsO+kTsVyYXrnnK9afMwxvcdRG68c0/p4JyRZRfHCNbFjRQ5GWHN7ncXZ8A00wVsI/z2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z//4ziborlY9HEPBT9qV7+3t0ut2rv6Z2kcxfQRFp/3UK5vawwN
	o5pkw7zwlA409f5pXy5d87td9RtGM2iXE8SiTpV5aPuSPrXQVUVF2JdfMwxU/bjMUUg=
X-Gm-Gg: AYBFou2S+AWn5o9Bc5/9jz7NYgaAy44J9NrA0lHp1vyvUQbOub30nYAvMjXLlxtiiEx
	7Yjp817z4AlTL+pA3n4pOFXVhBJGR4gV5931Zt5YRxTV145dZbNLszy+5LMXnDfaMwiag0AzAER
	bZHd29yOKO/XFh3TMhWt1m7rOZt+Hg4wiyaepMDLCWocpJ4v05XKg3gpLvOSrZQtxuDwBe/iByJ
	Ozu3DQ4i//oLReqDq79xoCvihmP1L6MzcYrXT5e0e0UaLHX+PfQxb81SP1x7q24bw+T41IeRYmH
	5Wjuj6sg7DKGl+RtTf+lMfjzkEbuI3l8x809F6Ijk31NazhDAiXbhlLZ67VIqMNajYhloWorUoD
	TQBgMMnEH0Zl2ByB5VI8Y4HIhnKWeTtCf3Fd8EMDsfadc4FVQ73nLWsgNce1hAKtYF3igWGgzRn
	03DVYlZ3vGNvGN8i3lRqX86+23KI1ZefeLXWpgp/ubcB2nYjiOruMXqagzOPNZf5rPuR4bv9bbe
	Stb4y8ZdWk58lFZzoUH8vnRTrjBx82YJE6WnMIvXxT+yVuZsMHt+auEwznvbrn/9i8tiuKCinlw
	+zED6BAT0hPFNkSleuuDofG1yKbl6J0rE2ovdjPSEymUpEHscrxXhKL+p3jafdAFZvTLah6XtPp
	kywjMfyyneRgU/BMZapYGOhGpo3DISVo=
X-Received: by 2002:a05:6102:4457:b0:7c1:8aa5:36d6 with SMTP id ada2fe7eead31-7d64d6d4a85mr3228252137.11.1794931548510;
        Tue, 17 Nov 2026 08:05:48 -0800 (PST)
Received: from localhost (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69e023608sm2832234137.7.2026.11.17.08.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:05:47 -0800 (PST)
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
Date: Tue, 17 Nov 2026 11:05:46 -0500
Message-Id: <DMXM4P4NQ6DH.15QJ2AU95YJRT@soleen.com>
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Pratyush Yadav" <pratyush@kernel.org>
Cc: "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Alexander Graf" <graf@amazon.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Tarun Sahu" <tarunsahu@google.com>, "David Matlack" <dmatlack@google.com>,
 "Samiullah Khawaja" <skhawaja@google.com>, <kexec@lists.infradead.org>,
 <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [RFC PATCH 0/5] KHO map
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261116134013.1636689-1-pratyush@kernel.org>
 <179486913878.127049.11178890384802388709.b4-review@b4>
 <2vxzwlqbfxtf.fsf@kernel.org> <2vxzpkw3fp2y.fsf@kernel.org>
In-Reply-To: <2vxzpkw3fp2y.fsf@kernel.org>

On Tue Nov 17, 2026 at 10:35 AM EST, Pratyush Yadav wrote:
> On Tue, Nov 17 2026, Pratyush Yadav wrote:
>
>> On Mon, Nov 16 2026, Pasha Tatashin wrote:
> [...]
>>> Instead of caller-chosen depth, the tree should grow (and shrink?)
>>> dynamically bottom-up based on the widest key.
>>>
>>> Plus, with bit 0 tagging leaf values, 2M entries can be stored directly=
=20
>>> at L1 and 1G at L2 (on 4K pages). Even for huge memfds, the pgoff space=
=20
>>> is much smaller than 64 bits, so in practice the tree stays tiny in=20
>>> depth.
>>
>> I think it is a good idea to allow dynamic depth in the ABI, but I am
>> not sure if we should deal with the automatic resizing just yet. How
>> about we start with making callers specify the depth (max index/pgoff)
>> up-front for now? The ABI stays the same, so we can add support for
>> dynamic resizing later if needed.
>>
>> The reason for this is to keep things simpler to begin with. That said,
>> I don't have a _strong_ opinion about this, so if you insist, I can add
>> dynamic resizing from the get go.
>
> I take this back. I went and looked at how xarray does it, and it is
> pretty elegant. I thought some sort of rebalancing would be needed, but
> all that is needed is to add a level above the root tree, and demote it
> to a subtree. Similarly, for pruning, the subtree at index 0 can be
> promoted if all other slots of the root are free.
>
> So I'll add dynamic sizing and reparenting logic in v2.

I agree; let's implement this properly from the start. Growing from the=20
bottom up is the right approach. I am not sure whether support for=20
shrinking is needed, so that can be added later.

--=20
Pasha

