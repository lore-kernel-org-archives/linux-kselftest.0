Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825A2405C2E
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 12:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699196; cv=none; b=OeDo3EJeuSQ/Bx9fMwRmlTmuUn316juaMKj6xIL+VQ/nEcywwasSuGf3Dly3mMK9RvuSKD6xbFu3R2juVFBP5yd2ZB5r4ygNQ5WXXYH2qVvuFNSqqaXpntHjBbhazEyeKGR6CUoYQtus36m8qonzzVXQsJ9/XE/Em4ek0tuwknU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699196; c=relaxed/simple;
	bh=kK1vbYx6jnfGfT+EdfnTvxaElwnej3ZgdqtKk3tUgWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VyKnrOCwuyUo3Pe6iozflEYVNMqkJnWVCQFZXq48mIdG74Rf0FjHDDHD7SZSE/9Z3onperuo0ZzZMVBjQ1TYmql/We+st/QMhw2ByULQgKa9TwCo2oxDqSiz4MqN3+u8Vqm4fI/CsDvocRcjnsOu+7YmMlU5rBnG4F2CV5MG6dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q7LZUnOp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q7LZUnOp"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so37079355e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 05:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781699191; x=1782303991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KplI5DIltMOxeWE/hVG9qMzqxTkTYf7x6780RRs6dfI=;
        b=Q7LZUnOpUxI0uy4HL0ufX0xIrqXluqgYAfwmt7o/sejz3tHPZy4hCrIs90QSngtmEQ
         XKJBW91Q+LKkT5IrFRYN+Vie3oC1RiUYw9No9umzYApXjxMHzU9msY/k2RC8cBZ0ARal
         Hl34xgkWT+1BdnbgVq35PsTAQs3bKp9GUJi1p43L2ivoC2E9sTsA1rV08eOaNWOzYaaM
         6v6nELaqO/mYuXMEZmLmIWqEPOxa4XwKKLvbWAlDL6GjYHRxVdqZm1EBAokSIdoWzNPz
         tmKuZY667xo+Ue5+NJjN7L3mvEyuWQeXC35/S+OAvwVcnfeCXFOTdZXloM552/yvKHCs
         Prog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781699191; x=1782303991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KplI5DIltMOxeWE/hVG9qMzqxTkTYf7x6780RRs6dfI=;
        b=Bu1i5YW72IRp4kVhEAJSI20kZivf2N+sqOLDrmSWct3fHfFxPTiCxszKHFKvo+tf/N
         fGIXEQCkvpT8i0rpvLASbLoftZIXACTSWctNr5xhqYaqToh9ApNw3+tqoDUVoywxX+Qk
         mYAZdRdqM5A2WKGYo4vJVkPNihz/95XBT6HwtIFE1kHmqLk0Tsd8kl1x78nabdmICTQn
         cqVu8qqiouuAA/UBbof+l9cxOi5hoyv3pOSsQhaJO9Shyas1IJ99CmKaQ1vgZwti2dzQ
         e0F+DP4Rbs6hdFKg8IWL3tojpEun/aahb9gzefSIc6oS9AMOfqke4oE3CF6/TtJs0lX/
         qAig==
X-Forwarded-Encrypted: i=1; AFNElJ+JVz95SOhCuxzGj7vQObrl+47MC9GZ0gMpmdXzrhxA4fBTK0J9yr228Y6MgbEu6UEPSO0QxNO/Jk/WBbj+xV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZoMMHiSuw49Dm4szJZY8oZhCQocgvAl3vR9C4FI52/f34Owba
	t+mFnujfS+ExIRRXQoY/Lk9JUssabO5jCS73CDa/917+O7a+YcQL7dSlEtuMffvMgIE=
X-Gm-Gg: Acq92OGT48TywpKb08squ08d3g0zUWeL8cEkwoVCjyK2ou62FiTKut9zu6feWUW4Uyg
	MiGGwSsKcwUXueR2KjCs2WqZDd5DjNza3S+Kndx1dp2eofRXjvV4n2TJDGCXD7KbZOl1zpBhln6
	048yUH3Kfwn2Atzd3GcDT4HwUV/89gzCq5FZS4KG1XO51H1Zbwa9QQAImcvKAy9ijbrbQ1oc+gD
	Bwl5tNf7/SJ+WsWJWe1OvEnPqAiTlN5NDMN3JUNp9ust22mRvU6TgGcBVglLh+DxH4WUbuholNZ
	xsgRmCsTyhVWE/5HtVMkmhH7NQIhn5z1Kz7wP0rba7/T8FxQF5V0Zl5ZAWbgX9VSbzpMkr/Ig3v
	g9ktbUilCw+yr6xPVFUTIFQ7fVBIg7dnRJP4unebzb6CHOl6UHsxJQhZo2vNf8670xTNeox+LPf
	2nBgp8hAIZfTbId+ss6w==
X-Received: by 2002:a05:600c:a148:b0:490:44eb:c1ec with SMTP id 5b1f17b1804b1-492333dafe8mr43904695e9.27.1781699190703;
        Wed, 17 Jun 2026 05:26:30 -0700 (PDT)
Received: from localhost.localdomain ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm150801395e9.3.2026.06.17.05.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:26:30 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:26:28 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Li Wang <li.wang@linux.dev>
Cc: akpm@linux-foundation.org, tj@kernel.org, longman@redhat.com, 
	roman.gushchin@linux.dev, hannes@cmpxchg.org, yosry@kernel.org, jiayuan.chen@linux.dev, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, shuah@kernel.org, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Hocko <mhocko@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v7 5/8] selftests/cgroup: replace hardcoded page size
 values in test_zswap
Message-ID: <ajKEZn0KP3KmyQd2@localhost.localdomain>
References: <20260424040059.12940-1-li.wang@linux.dev>
 <20260424040059.12940-6-li.wang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yjb7q5g62opqahpv"
Content-Disposition: inline
In-Reply-To: <20260424040059.12940-6-li.wang@linux.dev>


--yjb7q5g62opqahpv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 5/8] selftests/cgroup: replace hardcoded page size
 values in test_zswap
MIME-Version: 1.0

On Fri, Apr 24, 2026 at 12:00:56PM +0800, Li Wang <li.wang@linux.dev> wrote:
> @@ -752,6 +753,10 @@ int main(int argc, char **argv)
>  	char root[PATH_MAX];
>  	int i;
> =20
> +	page_size =3D sysconf(_SC_PAGE_SIZE);
> +	if (page_size <=3D 0)
> +		page_size =3D BUF_SIZE;
> +

I'd just fail the whole test if this fails. To have page_size always
represent what it says. (When can this fail anyway? Maybe nommu archs?)

(Rest looks good.)

--yjb7q5g62opqahpv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCajKSbxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AiB9QD+JZid1KLNr2xP2rppXnyG
ZyqJwgVUMqNZfB9Kc0L877YBAP851mEpZbHlmbTPoKRdoUXS0YKDMn1wPVRc2WSE
rWEA
=qqEb
-----END PGP SIGNATURE-----

--yjb7q5g62opqahpv--
