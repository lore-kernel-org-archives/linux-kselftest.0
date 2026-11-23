Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457761;
	b=jME0xGNoXx7DN1ejIRwrafbwBFPfR0dvMjj0rHqXnlsWNiv51eBy+TKJDqqnKytp+PgD
	 CGvkiGSTHPWpOz0V9YaUYfu4V3kFCxqG46Y7rWEvGkEXcIfDzsEyKlJEr0sT2wsp2pPcM
	 lynZJZl1M1xWL0sW+HDDJxJD3ow+n0aOpapHMCljkh1R7akI1qOd0eeU/Kdq4sTDPhCrO
	 lOsFqV1UZw+nirRhYhoFYP1TmFPqhRRUOzNX/2A8a7OyakNHbn2x929uv3kOS+K510/tU
	 xCb5pMUrmOkDWRko6Gg35Clc88uqSmLX/pPBoMMCp8jAqTwrui4NhymaMWrJe4SHNLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=TFQZ5Vfgmmi8vCbKTEjvDQ3KYqVEpaJ0qjUpV/3d3M4=;
	b=ky3dOn43K+9rig1NNfkAwsk5jnkPzbWGqq3XlWTBnSIN9Ilhay9YW4uSQIXsuwM1r/O+
	 B03p0CjsTHD4BOEKKOkZu29U1vVjz50OGGtGfCssOEmpsLmOqpYKHieCnDDwyNdi7s6yn
	 fWu6IQCnZiN3lvn12xo63SsudEfrNyZRV18HZ/1jYOO7MOuDcc82riPqdd7SbQXwE41+B
	 mUgto9g6ZMeLBTS5ZzY3tuVqM9Qanpgvmj+/E51OwJUX9Rzwy2H4imzox+ZbZYmUbsbwT
	 t9ErfATTrd9eQq+A+r5biZppHRljOgpgHn3j7gRO7eIbJExaV/1Kb0q0BOU7nc65c7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SnwkbDEy;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF915606A335
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 18:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF915606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SnwkbDEy
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f06ff94acfso10979955ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 10:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795457760; x=1796062560; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TFQZ5Vfgmmi8vCbKTEjvDQ3KYqVEpaJ0qjUpV/3d3M4=;
        b=SnwkbDEy7R5RfHQQSfC2IHq5U5qRGFOPZ4+4QU1jhS/YzWsRlnPiO93us36lhFnc8u
         YNMjrxA7nuB4U6dKaj/v2yM647DDyn5+EKHe+cttoR4aotNCn73ospUsA4R+SShhg3c9
         qaNC/RohSxY8x+n3JgJLn+oZT1BG2OeLoZAZKjc0RhtfPNw/dBUYvibafyH67Wo+/2Z1
         GzZoB5xSDV8TLW+9QAYybiArBeGByysm5iR/ZbCPWwg2vz7nf92dBaHu6cxIaKQRNb9A
         k69ZOgu5aF6ijnNWZ7UMHNU8AFIqd3m09CkOgswuxwtxxsLKCLKWTfi7UG6lfHoLDAKd
         29ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457760; x=1796062560;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFQZ5Vfgmmi8vCbKTEjvDQ3KYqVEpaJ0qjUpV/3d3M4=;
        b=e8LlS7MyLEx+ZQ1Wnt9GVTCHJaAL2j2QCu28mkw1xTtakr0Iy9h+bo45ieYLcNcL41
         DQ9ridw7geQXEyiO0RR4E06U6IMH5ZJ96mp7dQICPtbeBsTU6cyWL3VQEiPo+p95LEEq
         iodXSKCr6Z0WhOWtg65ui0BfSz4FALDGEFL289KlhTNwDcTytYzmRCX/v3uVQcaQzOFd
         2fSMK3kLs0RrCiDRAywGm21YLDDmlT8/Q64mO1hta2VKE9V4MTwXl3PcvLYjNijJ3uyH
         Xs7OsRRVhWHYPKhGUMOl2bznp/Gy00FqFTzBalwdDeTKH5bZhoo0U7hyhf3/hMZw0hZ0
         z9nA==
X-Forwarded-Encrypted: i=1; AL+hErFD0YBUo3omKHM1SHQMdh8FSYYa1qivbJmAKoomgcdawZzMnDtBsXvij7Z5cYOccTsiup8f0eLyVGRatN6AKI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OONRJX5kqUc9LMqCRJFg0tvMxA8shXqZdd+avqxrmDsbfsfMN
	XbE9f/tq5A6en5s3iHlJGoQ2FL8q2047EMMtvo78nJ5VOtcCHMT5AS5jT2ZBCkEdnA==
X-Gm-Gg: AZFdTZc1TKoYlR0TLUb/tX4/s1NIQiiIk42XhMO/XVxigZOBKKXLMQat7Las9NI9fjk
	6AmlXBlhOCzlqLDnnehVoqeKNLkhcUmKis8sfTVuNiRalM1gURemCaF7hxa2GI/4o9UjBBIrvPv
	f9fUPsqKum9X/tQRweAgwWmyBIIFx0/R/R3sCFH6wwTmIQxHn3bhsm6cujgDINCWV5UEkYC2irR
	rWjj7xT61EzjPiKm4IMZIO5LUwJT7MosRSV+3G/fBbjTvuH2x/CjdeS5U2ixxT4JeZALirqfr/U
	cmdG3SE3Hdr1CR1PhYloArNDfGTOWItY2KduhL7YPOcxbqtWyVgao791JqEvKFPNmYY28P6/nkH
	TVNutZaxdeXXqmnviY8MrmvZSiJPaIdKli8UlA96faj5I0HSuAKy0scItDb06ZEyi8hpb8qGuBx
	SFIIGDMnfLLGNnW5aWPMHTZnlu+zxJ+FqE4MUExvlb/k3Dc5lOtNv1VVMotG6zM2V/EZuSos88W
	OK7zGnHAeFnVNRYShEoyQBRg3s6sC4F39P+EdTgtnY3fQOyKuZHXKMlkyxhjSQ/0nnAinsuJuOn
	jawH3Y7nmDz+STNHIOBfextoPpsHc5aivNXv6xB3duTr2RWGTeiwYXtbu2n4uGKE
X-Received: by 2002:a17:903:94b:b0:2f0:3618:f170 with SMTP id d9443c01a7336-2f03f1acb10mr114729435ad.66.1795457759518;
        Mon, 23 Nov 2026 10:15:59 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm57723715ad.58.2026.11.23.10.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:15:58 -0800 (PST)
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
Date: Mon, 23 Nov 2026 10:15:58 -0800
Message-Id: <DN2SNNBMY48X.2HS6KSB38QPK3@google.com>
Cc: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-mm@kvack.org>, "Alexander Graf" <graf@amazon.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Christian Brauner" <brauner@kernel.org>, "David Hildenbrand"
 <david@kernel.org>, "Hugh Dickins" <hughd@google.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Michal Hocko" <mhocko@suse.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Samiullah Khawaja" <skhawaja@google.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Vlastimil Babka" <vbabka@kernel.org>
Subject: Re: [PATCH v4 09/19] mm/shmem_luo: Leave freeing the preserved
 state to finish()
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261111002358.1842967-1-dmatlack@google.com>
 <20261111002358.1842967-10-dmatlack@google.com>
 <2vxz33sv3ef3.fsf@kernel.org>
In-Reply-To: <2vxz33sv3ef3.fsf@kernel.org>

On Fri Nov 20, 2026 at 3:55 AM PST, Pratyush Yadav wrote:
> On Wed, Nov 11 2026, David Matlack wrote:
[...]
> I think some of this is already fixed by [0]. It holds the folios until
> finish, but only in the success case. On failure to parse seals for
> example, it leaks them. Except, as Sashiko also points out, in
> memfd_luo_retrieve_folios() the folios are freed.
>
> I don't think this is strictly related to your series so can you please
> send something on top of [0] to fix these bugs, and perhaps drop this
> patch?
>
> [0] https://lore.kernel.org/kexec/20261110175855.2437084-3-pratyush@kerne=
l.org/

Sure, I'll drop this patch from v5 and send the fixes separately on top
of your series.
