Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793784073;
	b=ZAxxocD7jyhneztGRQ7/34csw5fzrfTMtp8EO/D55EFj3/iv2h1guDhNfZb5Zqa4oKIL
	 HAjtB3RQ8wOX8XdXCR42yfEkVwnyC43uBl2smZ76UzYKoUUXCrN1RtEs4y6EsCoo0IJSP
	 VXz84y4xVfoP4F9GUsiSL1FQ969ri28NTgCaVctNUSByIuKaxvFGkI8WCTzYhBA4IfoQk
	 QID57Bw5Y1ujQEcr4rkV3wXljGXVTIL3X4CnlME/yLNqK0uhVAcHdH26DQ6BwXa4/U0gM
	 7zzDQeJtHdmMhiZEyzjjxdE7YcuokLyOYTjoeFIEtSpWoukMSV5qStI7tdf4XHQ4P0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GY0htM7LLybH60Zvhq77Fsv6T50kPeUsLh+oGL9owIY=;
	b=R0BOUZxxe2bNr0C2BWd2QYc78FQLh/hULGqqbw9q6HphMXEVqi+WjDD5qWYlMwqE4Wi6
	 iVKs/TCTxiDNbwipvzlbUglV9LO0nEHM+YPjztYTRlXZEOgcEk4IQXO675mnBEKMExFk1
	 F95COuU+XeD/SUgEaZoIEDYePJFkg4/vO9N3UIvKRIsERu+PAZCd6lqmbJXQVHrBr1+//
	 ku+TP3mBUzjff7R81KKKtLE/BdmqFce61xMbpP/f9ehW6Ue3RqmSCdrAA5vK8hcN9uRfi
	 2Kj+sTB1TGY4viPyJMHSWne/gFUH3YUggjyYejBRV4ZbOXQcwIC57AkgTeGU4Ljee9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YRKpF+mo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C416606A326
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 09:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C416606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YRKpF+mo
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b12b1ee403so3055527b3.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 01:21:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793784072; cv=none;
        d=google.com; s=arc-20260327;
        b=prFn2BAPLYx/MR1OKKHn+5owS5S0TarvQoJZDZUm6HZedPZs31c0W+Ky4C8xao1iBM
         rLMmD5EQboZU57LfmJSroCaZVsJq+ePtlXm5ovkRmsLQS+N1LPn1zb6lHoYrj4oUzbLm
         cdStPHmuXR2wuPUb5DvhJenPsI4CUmBixcaCEtHz6NXlvyYb9+UsKLFuJ7LmphQpkAAh
         LtQv4qdtmf8dnMGA3xYAFM0byy03nx01L6IATjfJrN5f7hecXLLg/l3Y4k66ixW2IlHI
         8v8ntG/qf50kcCtyrErhuO/K/CWdu2up8IlP9BonpOJ2d4/5i08nHBzKs72+rJfRAptL
         eBdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GY0htM7LLybH60Zvhq77Fsv6T50kPeUsLh+oGL9owIY=;
        fh=96Oe3TcxSSbkdzJAA8EnkZUH/HRcaLEFAN5PzTRWAHY=;
        b=lcBoX45L1orPo35whF8fAXy3nRkCoxItOZCnnb3xyvZCynaeWkyrBqnpaay/o/DOSZ
         iOx7+mud/8FVL39srz90NQ9/GPv/I+5yGsmi/pgNy7H4dQ4Awd8fqPUbK03ooUexHD5I
         bT9cNe1XDqUIWOtquR+lFvW0DgFdZb1+AN/Kvm7z+oSd430mw5qMeNpS9w4vc52CU/aq
         lnCXYuVVRPp5XLS4aaGqwGQcXxOnH8NnR/2mCYlx76O5PijeWsI2uNbKImwCK/1ZudZz
         SLunVh+/vJI+B6sgmXa74q9SUYjBxqzUaAt68FcngEuUw+TMvlaWtCAYyeZrcdebuJEy
         CWoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793784072; x=1794388872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GY0htM7LLybH60Zvhq77Fsv6T50kPeUsLh+oGL9owIY=;
        b=YRKpF+mojX5gIcBXUamGdAWJ7kMFWIy8+YYu4+aKV+1U5/nhl4aJNR8LSWs+hpuo0o
         89kqSzZRDO19yN21vK5wpbjZO6YZBSvhs66ZT3ZvnPEAYuRQe9+8+RcbHh/R8MBJKxww
         urRzZIB3ibLIXsB8VuQz/Qm9jb/+ScusInci2MqTwUVr5IlwxC/z9czLoHOo/69W7WAx
         rbwZuzOypvXbe+qlEdCDF19Tg3AMNCAhjwZVZHSKz40mkkCB9JO9sRhHjWpmY8QEqJ9E
         af/y1ap1XjUOv4VvWbAx7RqYpSAYehvY0+ruPM0S24Kc8NUUlNQ0kqSW3ddIGbleSoYZ
         3Hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784072; x=1794388872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GY0htM7LLybH60Zvhq77Fsv6T50kPeUsLh+oGL9owIY=;
        b=gFrccAMyngSzR9KLBfnjS9674NlbD8WvJDzR/oMDpIPdx3mx34WHX9cpBIZ1Q5eusB
         n+DfCqxVonC+AbdS+8MkIiCeXcZSiPBDcmm/Mk/wRCCcxQ/6vymiWTYx1hwicZg2qtkm
         E5JF/nKW05TLUd80Ip0Rq1xu2VnSNoj9zpCw3n8sTfhVTAHH9EAgyLF8Qtxx5cX1z97h
         4qMQuplUKCJ0l4rHaUCVh8wL0kaMVV3W6myf40pd+e73Yk2VV0XFT00mb9bhCKTkJEHJ
         REKN0UcJFibGEp8H6xg4S/K+FA6mcIxUdGkLmXFZiGED5uruo6K0/2BLYYrR0lgHJThe
         VEGA==
X-Forwarded-Encrypted: i=1; AKwUvBwmzUZbTsTlwuJF8eKxoaY7phHOXAp0QKlqZ95USWJXKJEmhRWshC8lN6u+nBQm0jDAVN8AHtT2MzJMai96ESc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ovGf3Gk9esE+g486vQrLrMvfwilpgFcsRCsJrYpoFzo4MNh5e
	jhz5RoScuDN5w+XSfEWTxWp2b0WpFnA9Rm9EszbCnHzEHj8ODyucwQv9pL/4SyFL8576QLZyrG+
	v6ZdWtL4qgw7N9oj4XhzZpKqbfkVMxQ4=
X-Gm-Gg: AYBFou0k9NNqL0fpOmxS3/rdFeePRgcGRCBBezfWbNLquv7FqWCgIKhNRkRJTXLGela
	F1JQ42d2chAnmaKMzpESIH3N58ZV7x4sJ75IRagh4wNaSyt3b058w8UBxRkPHMlb4rW3YWsKS2E
	sbmgQLB7kYN0DNEbYUR3vn/8eDzCWKiTOFtWPb+bmN8pAcpYyClZaq7Aw0qvvNxpBLJihR95FqA
	GPbarWzB4vkaH62Dma+TP7zvLXGH7unA3xM47V2cAxf6tP4iikkNIwb64Q7xXWxZ6WuP/Lar/CO
	BITlBJgeuuAAr9iLXU62vXnnpyyDYZbL6Pid1Oulo3caQD77VUh1mzznj57hKLKuFz8tN+FrSRA
	G78BktALAIH8RJFSVQDpduiiHonosYK9OeMhbBWm1qZJc9jQMBLHzPpJDYzsUIVJ1Wfaxq6Hj
X-Received: by 2002:a05:690c:d83:b0:8b2:fde5:d95e with SMTP id
 00721157ae682-8b2fde5e72dmr27025397b3.63.1793784072404; Wed, 04 Nov 2026
 01:21:12 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102103621.156928-1-umangpokhriyall@gmail.com>
 <20261102103621.156928-2-umangpokhriyall@gmail.com> <auot2ZVM5YjyFlZZ@kernel.org>
In-Reply-To: <auot2ZVM5YjyFlZZ@kernel.org>
From: Umang Pokhriyal <umangpokhriyall@gmail.com>
Date: Wed, 4 Nov 2026 14:51:00 +0530
X-Gm-Features: AclHuK9dbghBwN40s0Kd9a8eejM4zi0u6MKlqoBKgZ5z64zrzbWRBqHetF1dhp0
Message-ID: <CAOdFi6fb=d8RDk3EJSfGHSCKtsVjf=dmG5o2fq0dPxQoyBohzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] userfaultfd: validate the whole range before changing
 write protection
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 12:24=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:

> If we a breaking on any error to out_unlock, why do we need err =3D 0 and
> this check?

We don't, thanks. v2 drops them and the -ENOENT inside the loop. I kept
the one before the loop, because for a range with no VMA both loops are
skipped, and without it the call would return the -EAGAIN left over from
the mmap_changing check instead of -ENOENT.

I'll also drop the selftest.
