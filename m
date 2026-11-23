Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457622;
	b=1sLg7N0WS2v027k6EbMTm4kYmQIEaQa/MGcAJr/SVfDj05XWBzJiaP+7tz6GX7fabj2+
	 CZnwgEHwRZrLGdBa0JmMjvdMulaa0chi1f145U8m18VMiCo3pD2GuGHlRyb0iZ9zy+nB7
	 fgN7evf1IXhwGewJ7IiOP94oZGhLOLuhcx0L7I7SQ3HAqkem4SITLPg8x/zeIu0Gtl7LO
	 CNWcpoapeW6tGZ0HwghA0eDTBh/ZfTmIHynVH5mBFGB9urVPi1tOtpIiHb5MzEP3gpl2m
	 zWNs3zGisQcH+vmFxCsJ/NnYyFq8TVWCeMbLI37bhgXZWdfrLxe386lK6UF3B8qHqdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=JF9DK5BWLD1MHzXf1P6k3Cfpg7JcJUIjQB9CILaEZzU=;
	b=Yr027wPcYmq0iMuY/aLiJ0xHGrNwpuYtr871gRuwc3wLYAJMA9opqhjUg7MprhCtAkwy
	 zxZhkOjg6mCD1HRPr2//gT8l10P7NR1jGQvvxJWgmqbDBdSZ+hOXeOZbE+vJ+FGkR3uL2
	 uGsr7NwJhZIFFQga/ZlY7MeKhisu3OfqVyuCjD0BX+9oLkcT4HZSrNtqTPsMbJO12rTmW
	 rJsvbflfYF4kj4O1LmPk4p9UX3KXtP52RRpVghOpoZ0S/mHTL2+f34X6uEjwfsSfeVOz6
	 L5Xu10GJop9j2EaVC/VM2gKUA91qXiflftLK81Pw3WnnqNkCoqyBm2dLkWYw0UzDu+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="LQWETw6/";
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A895606A31E
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 18:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A895606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LQWETw6/
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b6b22be970so1364686b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 10:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795457621; x=1796062421; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JF9DK5BWLD1MHzXf1P6k3Cfpg7JcJUIjQB9CILaEZzU=;
        b=LQWETw6/ke0AGLdFlDY+tyTnXcM9ROpZvf/O9lyXAKa6wTIzmashTimz/E8kj1KApA
         wb4OsxJEdFKQdpnrylbAc42fPkjMV9KF6K5tcEN6czX3uToTayip/oLkXxIG44Oewo2j
         MnnCSjRgOJKruiyA99C3EbhjfljR7wIStjR/a84mepa1x1FVSs1JtWc0fFVh63kUIson
         HJov0EerlPzZQ4dQgXomLFGaaoxSNLWEYtE5swf8nnXCl6H6b0kleCeF4Zv70ND1cx5a
         IX5N0gwKAPBH3iEnAfOKtpavO5WHYBp1Hokm1R1yD5Y8sY5kTe7kVg+IWh4KLrEAjnli
         PRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457621; x=1796062421;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JF9DK5BWLD1MHzXf1P6k3Cfpg7JcJUIjQB9CILaEZzU=;
        b=dxnMGTt+PtCItk3Z5sRPi82N9mOMZ4gaOnElGOxocmLL0IIJ2G1Tr1rCSBO3C0yJ+l
         vSZ/RV4BybGEUbdgN031Z2xC7ApkZFEqA6/K+1cLJjsNmAwr26X8aMkun8CUnjnEsYoq
         0sStXjJ4uYSVh8ydgExS+HdHTDHYM3rJTYfq1C56i56MNbmBFxY5c5LLLjccORZ2zQwB
         P9mwzBxE/ybWjH6C1/huFLfDWjQcusG9dR5945tuBD+qE9ynL2Z7NHsp31oUCNKnf3CM
         reQLkBK2u65YmDI+8iIMlh/bL8K2mRCU7nLDxlJ1eZGuQoBVzLos6DUMY8B2qITXChrb
         oR/g==
X-Forwarded-Encrypted: i=1; AL+hErFC5hmpjafOIPmpYm0rSUWdJm56yKqb9grZZ17X3jWz9DtU26iYoXu01W0psfB0UiGmVLm0yPU/6GkohuQpi5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/IHBxFcTwcj22L2Lomvw9Y/eiTAEuCeURFYuHPVyGjQoOpxXg
	s0MnBLeiPnriIcjPnQYgUYC7GKof/V4kLQQNY+Ku65mulBRoPlvA7nwauVVCp2CFow==
X-Gm-Gg: AZFdTZdKRgWXcNUHq2dhKL1anDVH4Y4fRH0IOIf5bvihKCM7S2VxfYr2Q0Wj80Tj6sL
	rGeWjMhr1qmWDOJ6jWbX+aBs9yvPOrj80/okrmWHcP4+SO+53K09XsOd40LPkFWZ2z6Kizrf49B
	fFJn8k1WQGrhl6hvxr+LRzhngTuxUFwAYxxJUzJ4eldn94KfmnL76Yr++gCl9ks9hnZNu5bDbuP
	Bcmcl6+T+wwG0BJDbDuN0AQcVwxEUXsyUhj95VDQfnp/dWTocoCKSVjjuBErd7gpkOM7HPdsnA9
	oUyNoHiNhqaH0UcXhXLSpOvEXpjEvZDESfwsKD5YKN7BcIA6iOM7nVGCJWM9CEgS84wRrrUwDRZ
	EMZhY5c6oJW/luSWVQyPhF5IcaqGzXi1Ljn3F5lqzofNtFUw3qmZay8j00sM9mU1Yl4NNgwriIi
	rEY1GkRGKelVea3PxnYotkikfxRCkeJeWpLpEEH+TyFVuSrn7a8hU90MNkDWfjNK0Dpw2DUAC6p
	4L5PWgEg4w9QB/g54CHtWXmcGYevOSyAhAhkdwvgKU4ohf7YVa/FxYnrxzul8953+A/oFoaObxD
	0LpLtXJ0LbE3eHzqMWNg1sHLMiaiv0Ub2w/7eWynyMQcKO/QiH9HByC34y4Dua3p
X-Received: by 2002:a05:6a00:9084:b0:89e:9c7e:fd56 with SMTP id d2e1a72fcca58-8c87c768251mr11001006b3a.33.1795457620349;
        Mon, 23 Nov 2026 10:13:40 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c263sm5956386b3a.11.2026.11.23.10.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:13:38 -0800 (PST)
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
Date: Mon, 23 Nov 2026 10:13:37 -0800
Message-Id: <DN2SLUVNO0L5.3NUHFPC0J7QTG@google.com>
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
Subject: Re: [PATCH v4 07/19] liveupdate: Add helpers to track the files
 that LUO manages
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261111002358.1842967-1-dmatlack@google.com>
 <20261111002358.1842967-8-dmatlack@google.com>
 <2vxzbj7j3ga2.fsf@kernel.org>
In-Reply-To: <2vxzbj7j3ga2.fsf@kernel.org>

On Fri Nov 20, 2026 at 3:15 AM PST, Pratyush Yadav wrote:
> On Wed, Nov 11 2026, David Matlack wrote:
>> @@ -788,8 +797,7 @@ int luo_file_finish(struct luo_file_set *file_set)
>>  		luo_file_finish_one(file_set, luo_file);
>> =20
>>  		if (luo_file->file) {
>> -			xa_erase(&luo_preserved_files,
>> -				 luo_get_id(luo_file->fh, luo_file->file));
>> +			luo_untrack_file(luo_file->fh, luo_file->file);
>
> This looks dangerous.
>
> Since the previous patch set luo_file->file when xa_insert() failed,
> this will trigger in a failed retrieve. Except, the file was never
> tracked to begin with.
>
> While I don't see anything that actually breaks because of this today,
> I think it is a bug in the making.
>
> I think the below is a bit better. Although this change probably makes
> more sense in the previous patch, since that introduced the problem.
> This patch should just replace the xa_erase() with luo_untrack_file().
>
> 	if (luo_file->file)
> 		fput(luo_file->file);
>
> 	if (luo_file->retrieve_status > 0)
> 		luo_untrack_file(luo_file->fh, luo_file->file);

Good catch, I'll fix this in the previous patch in v5.

(But luo_untrack_file() needs to be called before fput() in case the
latter drops the last reference.)

So:

	if (luo_file->retrieve_status > 0)
		luo_untrack_file(luo_file->fh, luo_file->file);

	if (luo_file->file)
		fput(luo_file->file);
