Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721CE3DDDCA
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 08:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005178; cv=none; b=I/QbrGyIDGWrZKmkwlRIrPHhtw9kptCWxJCsnF0SywFInz5rS8+hzK003V0QXKlTBHCnIOgY1aksklsp2qAARA597rawh22w1MjjjMqARlaVom/9xZKaw5hRyT0KWUK97SIF6ReRtD/BA2m1nDwAv0u3ykPpf9Kx8VbLPAw4fKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005178; c=relaxed/simple;
	bh=a8S7/JFgNnijj79KFMHsJp0QhSQmc5cbmCjp8MdJIz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+JRZc6C0XbZ6JRLHfHnpmtXgY/Dxxqaw8kk1ArRfuMAo/z/jBIdXsPYs+7mC8i0NqS8YyVS3hrcM5HR/iK3HkiEidWTR1/9h9XjeXrvkOui4O7pUIbMADM5MQUENmxn/MjDFZZQy36V+sDBt2oueBsMj8AL8mgYbTxO9ryK8KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TsTigD0/; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TsTigD0/"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47fde295992so554822f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 01:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786005172; x=1786609972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a8S7/JFgNnijj79KFMHsJp0QhSQmc5cbmCjp8MdJIz4=;
        b=TsTigD0/XPbfkWE22/1rFlVGn1dDgZHbprne7m2tTdo0sXWTL8TMNZVUJQuzpIXmyH
         OpKgEP083D7pWnDzI4B3B0ZZ2LCoB1UrZtuEOfOSZjgDJotb2z/R9qpzOuDRm5NDOzXh
         fiQ3KhNiIi/OXrpNDINseyrWh7OuiLnkLf9SfOOWe0Xd2O4WP1oPJA+ha7ySHBoo1JQX
         szvAKJYqDZBcwvKcCR39cxWSL8/Siv1qCV5MmyoW/6dZKDN1J5oOo0GM8PhLFdMMkgR6
         tVj+kzY8SzUKZp7J0oFC4CXh5SRcrtqz1ghGV86XCMwSeK8UPKzYn3JhB4uan2pGPRdy
         4AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786005172; x=1786609972;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8S7/JFgNnijj79KFMHsJp0QhSQmc5cbmCjp8MdJIz4=;
        b=FjFHrthVCyszKL3T6ZSRT/YpRkUnr37K+VmI1ygkMijCDb2NtA6OXh/73t9mw1+mid
         BlbCSvfCr6MGj0u//W3guMQe7V0tDB+RaWRdVNSWx6qJ0qR7FT4dKUDRBBE1iuTGiMpv
         LShNiku3UueEKAxZKIE3kmDCtKGRExHcU1m/KxAI7S6qS+XkfTyD0BXbjwB1+vESuMWQ
         t/EhhK8eJm64cEuELVuSkzcqdeiuoR6zLwmVyT0IQ5K9G8llsv6/dJho3FCB7tAWNDa8
         T90Z8iCg6XNvJ8mEvb5x8dwpnKpCfDDV/GY4oQxqJ8Dl7pZsLR7okz3lXZ/8Dm7Gl1NN
         7Ezg==
X-Forwarded-Encrypted: i=1; AHgh+RpXisDv19f+dDhy5zdz/ls+0yKixR00aYblxPYH71GkwnxzRbkHlepfPnnm3tQE5U3ygYFUhXzB2tqem5XocR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwowXzWsg+aWxbLZ+R3BotsmE2eiDqN12Mhj0yvIfhY9/mt+O3W
	nF3kr5vyZ28qdl5/TW0Qy5T107TLs63NsSRgF3FIrXdArBISRKrTUk24dLuiB/tKWtihQ4I2lXb
	L5VusK6ZRSg==
X-Gm-Gg: AR+sD13vSkdkla37sS9jrzL00CLPWzliGxlfuGnGXa26X4bnO0o+CPyN3a2YxB5F3JN
	7m2lMVWVF6ZFyMk6jQi+xJyDgJjt7sQTkElAHAmZo+sgcSLL3LrdNhQOJWStBBaTFh3h/DmNvF5
	qrJD9Qz7dNnYFG71qtEXYYimcIXxzaXNMdxWgyYu3YcP+nY0k98BOaiUQtUykvinLiganTK9vN1
	XH8oi1mAbANnaBHiWK+yC21fgjoAXxUbKTf7q/ISlgcggJ5um/1VFkPAsGausdTthzoDv3eYa3/
	2oktyvBxyoHVSWTz/qIz8AoFskCx7l4xgTx5SR8OeAsmnpN+y72M4ex8yH32b7RabZ57Kc9EMrn
	HQimObEfTfj6cOPbXt3zrAxlCdunAa8DAO6fooA51jjwAX0hmYVT3syTkHs5DZ2cp+Zt/wI3sUo
	kffWA87HgyBrb8a+2wRU/bl8VwIDefdlT8Y+yyvsrXOAKIFRUyQLhk+II+c1souQCO
X-Received: by 2002:a05:6000:2893:b0:47f:8abb:1fd2 with SMTP id ffacd0b85a97d-47ff4ba8c30mr7832158f8f.3.1786005171925;
        Thu, 06 Aug 2026 01:32:51 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff79a7258sm4332220f8f.3.2026.08.06.01.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:32:51 -0700 (PDT)
Date: Thu, 6 Aug 2026 10:32:49 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Wilson Felipe Pereira <wfelipe@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests/cgroup: test_zswap: fix implicit unsigned
 promotion bug in test_no_kmem_bypass
Message-ID: <anRFukpcm9Pb97AQ@localhost.localdomain>
References: <20260804042053.56940-1-wfelipe@google.com>
 <20260804042053.56940-3-wfelipe@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lcbrsqi5muuudvb7"
Content-Disposition: inline
In-Reply-To: <20260804042053.56940-3-wfelipe@google.com>


--lcbrsqi5muuudvb7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] selftests/cgroup: test_zswap: fix implicit unsigned
 promotion bug in test_no_kmem_bypass
MIME-Version: 1.0

On Tue, Aug 04, 2026 at 04:20:45AM +0000, Wilson Felipe Pereira <wfelipe@go=
ogle.com> wrote:
> In test_no_kmem_bypass(), delta (stored_pages * page_size - zswapped) is
> checked against stored_pages * page_size / 4 to verify that the pages
> pushed to zswap belong to the test memory cgroup.
>=20
> Due to slight stat update timing differences, delta can evaluate to a sma=
ll
> negative number (e.g. -5MB out of 1GB). Because delta is declared as a
> signed int and stored_pages is an unsigned size_t, C's usual arithmetic
> conversions implicitly promote a negative delta to a large unsigned 64-bit
> integer, causing `delta < stored_pages * page_size / 4` to falsely evalua=
te
> to 0 and fail the test.

Thanks for the breakdown.

> Fix this by checking abs(delta), ensuring the test correctly compares the
> absolute difference between system zswap and cgroup zswapped bytes.

I still think the delta quantity has some meaning here and taking the
abs() changes the semantics of the checked inequality.

What about making both zswapped and delta `long`s? (Under similar
reasoning, there's already a possible loss after squashing
cg_read_key_long() result into the `int`.)

In any way, also
Fixes: a549f9f31561a ("selftests: cgroup: add test_zswap with no kmem bypas=
s test")

Thanks,
Michal

--lcbrsqi5muuudvb7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCanRGrBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjG7wEAubwExH9IrXsRlyXqhce7
oitcuCe9bJ98x6HC+nOhwGYBAP1BPxXMx8oSYQJbEG2gUmqt3VXQUyW00jKZMzWe
GagA
=B29m
-----END PGP SIGNATURE-----

--lcbrsqi5muuudvb7--
