Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B94D36F911;
	Tue, 28 Jul 2026 20:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785271036; cv=none; b=uQxV2ZTnatoYhED9SNtLl3dj+QmnBanXKbztUtBhcRPvLPHrrceKCtBBSe+Qx3Sni0wSHzHzrADWqE5LHVH9MrgazPf25/tfrL/yby7ycculLvLgqs7JewkzRM4cowlwoss0y0+tYhIrq+PHGCnvjcAhao1BLqxvlhI7n4AkdKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785271036; c=relaxed/simple;
	bh=flDw3mHXvbZFxRn/s1tL+2JqlMEaoy6483IzE15ZFis=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZVgY9Yg9nJ40gP7dQuSfknGSn/CRy+ZObaDdhNK5rTcWkPg5aTGicTFkshzpele3L1g6mBEaRKVzOmgxPY0O09ig9aeaN7CV3YIYR9a4+IIX2F7EBfckdpLaGR6p1qybtohShBrEAAmrxjlIcRJXU/6AGS2SRfCcBp7yCcSJgU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=iVz2FmM2; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="iVz2FmM2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=flDw3mHXvbZFxRn/s1tL+2JqlMEaoy6483IzE15ZFis=; b=iVz2FmM2MlDgOtcBCnBH0KIfPT
	InRjz/Yon/fuoNqBLblZolKdh61PNe9TBvncM1PqJVjSLgRfBI7x++++g51TYMPZh5C832nXdz2OM
	Kvsy28AZ3CAenbPyrGtHkIajZRHr7PKrCtVMV4iqlVVXX9JtK2y7qhzkqYD2NnUQDs6FBCBuMkYjk
	TFa0zHPbDY+X5vDusFqKvFlssAsSDlyRItQgLPoXmYCO+U41+qCvLBHl+xwuJvPH2qeXf1c+OYrZR
	EWA3aapl0jeE14MPu7fKXxjdNBOSoWaBbpjggijjvkDWLrsHW3NbviG8AnRxgat7HfgDF5LoP+X1O
	/qy8nm8A==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1wooSh-000000000Sj-1tU6;
	Tue, 28 Jul 2026 16:31:39 -0400
Message-ID: <b4c8c579aef9b2098fdcb0c1fbfdc103b563a5d0.camel@surriel.com>
Subject: Re: [PATCH RFC v4 12/12] selftests/mm: add a slow-GUP content and
 COW test for mTHP
From: Rik van Riel <riel@surriel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, Mike Rapoport
	 <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 	linux-mm@kvack.org, kernel-team@meta.com, Dave Hansen
 <dave.hansen@linux.intel.com>,  Peter Zijlstra <peterz@infradead.org>,
 Suren Baghdasaryan <surenb@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Michal Hocko <mhocko@suse.com>,  Jason Gunthorpe	
 <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu
 <peterx@redhat.com>,  Matthew Wilcox <willy@infradead.org>, Usama Arif
 <usamaarif642@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Date: Tue, 28 Jul 2026 16:31:39 -0400
In-Reply-To: <de6f893a-4369-4ec4-b47d-517ce0c29558@kernel.org>
References: <20260724222934.1463812-1-riel@surriel.com>
	 <20260724222934.1463812-13-riel@surriel.com> <amX19fK0YVIEonfI@kernel.org>
	 <de6f893a-4369-4ec4-b47d-517ce0c29558@kernel.org>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-07-27 at 16:05 +0200, David Hildenbrand (Arm) wrote:
> On 7/26/26 13:56, Mike Rapoport wrote:
> >=20
> > Please (instruct claude to) use ksft_* helpers for printing
> > messages and
> > tracking failed and passed tests.
>=20
> I'm afraid we won't have time to keep repeating the following:
>=20
> Documentation/process/coding-assistants.rst
>=20
> * Reviewing all AI-generated code
> [...]
> * Taking full responsibility for the contribution

I did review the code. I missed this one, largely
because I was focused more on the mm bits.

Not only will I clean it up, I will also make sure
that other people using the available Linux kernel
AI tooling will automatically avoid repeating this
mistake.

I submitted some self test checks to review-prompts:

https://github.com/masoncl/review-prompts/pull/89

And added some commits to kernel-style to create
clearer comments:

https://github.com/rikvanriel/kernel-style

I also tested the patch series against the updated
review-prompts and kernel-style guidelines, and
the issues that were pointed got caught with
the updated tooling.


With the gigablock patch series, I tried to edit
the default LLM output, and create something
vaguely decent. That was a lost cause, which I
do not plan to repeat.=C2=A0

It was an especially big waste of time with the=C2=A0
code that I was never planning to keep, but where=20
I had not thought of an alternative approach yet.

The current plan of attack is to add LLM rules
every time I get a comment on a patch series
that addresses something generalizable that
I missed.

That way anybody using those tools should have
those mistakes caught, and either raised or
fixed by tooling, before they even start
editing their code.

You don't want to review the same mistakes
over and over again, and I want to help
people avoid sending the same mistakes that
were previously made.

--=20
All Rights Reversed.
