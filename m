Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457114;
	b=oylL9R/0zX4/+B96+6OvWfsbinbUjo2oRJimly9x+Dxa8DPzpK6G4Jn3eNz5VWFVDaWu
	 I46ZhNtnwdF/MpA4/BMXt2Kjph7NOBJwWEdeR72OCyEXtu9/YtJZ4AXlXKMNZ2Z9WskWo
	 gjsDIFGRNAkeMF9nTMdepIHxnlSXn6n+g4+8d4jfL20mAISgb1FzeSM+EckKKpth0zFPb
	 2+OUijkLxTbXgC4cmCk1fNbAt9huW8K+IjZWJeKVQK6AxKbuoKsHygIrcEWvG1U7gOq4n
	 ldJqY1kFQZpIsGW1BTIlFZhY9kbCb/IXRHF/01Hr0rJ+B3QBNc8w7Q8vBDwVrOxrRaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=Jw8SilefRf5vO5k7eeVpHgnCi78conTEfmhaXVb/RAo=;
	b=Had5VJhObmM4klXQAxJYvt6Qw00iEdG0CsbqwFcO/SfiPHqYg4IhVkvkW7HLi0owwITm
	 bg+rKntI/NPEFDD09ys74tFclLZ61oS7/LwJo1Vpe0UK5HSk6cAlbDfaaVUM/9Ua7eCpC
	 kLRe2CUUf4bG3qiLazPeA5OyRwr7S2ACPhgEMzlXZq4lPebZkyMOq2P8JZMeXc6yI9MZn
	 GEVxrs0ysLGAfSXZlHLRC2xL7BM40VfBOzbXVNz0dnnpsnobxkK+NBLUed/hPTrWTiQKB
	 fnL+MigzH4DegRw1UWbVcwLmSuDqqksxLskHFQB0HIVQLMvgMCoMdB+qVfLL0ve3RFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hpz7Nbsq;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D448606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 18:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D448606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hpz7Nbsq
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1705355a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 10:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795457113; x=1796061913; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jw8SilefRf5vO5k7eeVpHgnCi78conTEfmhaXVb/RAo=;
        b=Hpz7NbsqTvn0QO5IqNcw2feT0b821er6TLvP0tMHcFy2s2RO6h4B7KLuBx9vHKKEMt
         XPi6d6slnuO8vHJclR0sIh0igUwY7Pdl9ZfFMeRGeZ+SvSE+1WBVrZ400kCw5Z+IxexD
         ijdL8ud41qDsI9X0qsGhnz6Qm9/0rexBUBtv+7iJcGW9UzZtPZCGmIjXKz2prQYhk6XR
         QZYEi8i3PriRVOjedHIZ1YmV6WPywJAE3bZm+QBa2Wc/KgmPHGNDGB7JyWU0inbohZ+m
         BUfKSka2ZXco7wmR+wHT+2mVB6yowLRmwFmM9Jb/9bI4Fh/IeRxophzoWqOqwKaJLb1h
         U0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457113; x=1796061913;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jw8SilefRf5vO5k7eeVpHgnCi78conTEfmhaXVb/RAo=;
        b=y8cA1iyB/m6pUj66/bD0176XZtqczajjQ/lTJHfsshK1pr81dQwsU/XwF3EQGSboEs
         M/d61ZGTwjRz/eh2uTz2UECqoTUKg5n4S9ODMGlBQMt5rJn+7cjtf0z6gSxUNkgaXvbD
         xh+3kksOWEAyuecyoV3EVpKvom1fh/wzkTZ4bNFzhc9ZEq/VFlS+GSxTygvq1zX72fze
         3vsUrnhkRG/kkGlIOIRdqOIdME4Anl0eP6TElUim/GkuZVBp+ZhpgXVu4bEMZHFJFV9A
         EVsvlYksE73q6mIBiqZvcDlOEszAl4/bhv57DzL9MX93yviJdFEME2Hltr0lWSi/Doaz
         f6sw==
X-Forwarded-Encrypted: i=1; AL+hErG56mXO/nN5kEBrU0mAdLMECkSSQBkCOOTH1FL0GBq0XrJXD2rfxkBYa+UHz9hnlUMY6eFduT+iIfLI7eGyoTU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g3ghJC/PnN5Ok5rjU1j6uEGnBTld8w5oxbaX+MxRZpjnOD5zl
	cAKR4WsGDfiQMx+/icVFwmCtQQ5RjdTPbsp2U6o8rXSKxcJF0lvBoRy71vvWb8di+Q==
X-Gm-Gg: AZFdTZeK6XVIoHK9FjGPGtRogkl06GSc4xIglfnu1DrILuMcvlW8fRxbva8L7I4j4Wy
	iPtfcneBuA582AM4CYww1VJJQDFIdgas3pC18XLoqX10QPp0CdKK6zXecCIQUt+2oiGuMzpRnMG
	ehKgCQg0+GY18/DVjEpiWTpKrYQcBbDmeQm03iaPRCSxnRSjWcd6Alpap8YhPbvk5cpqhSKi2lV
	GSN6/8bxlHkcBxyEo/q3mSw0bjgRnDGJrpQOmAF6z4LX9OkYqk6U0Elwz9cFO2sg0ElSay72BEY
	mmK3TgCZ/GSP6k65n7Gf5magHFgq/ljbGN/8rLVNL6pmdUd3LA2ePn5T8RnrIGuvc3+Yo7w6Yjc
	on4eKMIXTeIZx6eA5rjX88yqMuUIMnItHV6+oHA5AsftyhQeXpGWHQc6ZlzT5ikvlCXF6x4oQqY
	8CcVxBlSjt5eotrruZUxfMWqoWg3pfIBtd3ZltGyu/NcVFCRmreARe+hLLaFHSHyBvrorQ8rSht
	5//f8eqvitxygKVUc3/fYO6dTwWKDLsne1j02gi34JXQSqDHsGfvhnmia5RZ3ET6sOW+V8NH2Mp
	wS8NsmAOBUDWbaKosMWFiPSlnYqTXQRXGSgT08SoK8W+bQyzeDisPPYu1ufErmV4
X-Received: by 2002:a17:90b:1d4d:b0:3b4:ca86:8bc4 with SMTP id 98e67ed59e1d1-3b4ca868c1emr225054a91.46.1795457112373;
        Mon, 23 Nov 2026 10:05:12 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm18802720a91.8.2026.11.23.10.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:05:11 -0800 (PST)
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
Date: Mon, 23 Nov 2026 10:05:11 -0800
Message-Id: <DN2SFE0VTWYZ.30XIXLSZ0OQAQ@google.com>
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "Christian Brauner"
 <brauner@kernel.org>
Cc: "David Matlack" <dmatlack@google.com>, <kexec@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-mm@kvack.org>, "Alexander Graf"
 <graf@amazon.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Baolin
 Wang" <baolin.wang@linux.alibaba.com>, "David Hildenbrand"
 <david@kernel.org>, "Hugh Dickins" <hughd@google.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Michal Hocko" <mhocko@suse.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Samiullah Khawaja" <skhawaja@google.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Vlastimil Babka" <vbabka@kernel.org>
Subject: Re: [PATCH v4 08/19] liveupdate: Let file handlers retrieve into an
 existing file
X-Mailer: aerc 0.21.0
References: <20261111002358.1842967-1-dmatlack@google.com>
 <20261111002358.1842967-9-dmatlack@google.com>
 <20261120-gedulden-rausgeflogen-spruch-cea76174d5e2@brauner>
 <2vxz7bi73fby.fsf@kernel.org>
In-Reply-To: <2vxz7bi73fby.fsf@kernel.org>

On Fri Nov 20, 2026 at 3:36 AM PST, Pratyush Yadav wrote:
> On Fri, Nov 20 2026, Christian Brauner wrote:
>
>> One thing: Please just install a new fd like for every other retrieve.
>> I think it's pretty meaningless to return the fd number the userspace
>> just passed to the ioctl.
>>
>> The fd number is also not useful as it's not tied to anything. The shmem
>> handler looks the fd up once and LUO keeps a reference to the struct
>> file:
>>
>> 	CLASS(fd, target)(arg->fd);
>> 	[...]
>> 	args->file =3D get_file(file);
>> 	args->fd =3D arg->fd;
>>
>> Which means, another thread can close() that fd or dup2() something else
>> over it before the ioctl returns and the fd you hand back refers to a
>> different file fucking over the caller (shared fdtable etc pp).
>>
>> That also gets rid of @fd in struct liveupdate_file_op_args and the
>> special case in luo_session_retrieve_fd(). And a retrieve into an
>> existing file then behaves exactly like retrieving the token again.
>
> I suggested this approach because I found it odd to return a FD that
> userspace already asked us to retrieve into. Any sane userspace would
> just end up closing one of the two. I didn't think of this race though.
> I reckon we could return -1 in the FD that LUO returns, and let
> userspace use the FD it already has to work around this. If userspace
> wants to close the FD in the meantime, that's their problem. They don't
> get the file they asked for.
>
> While I like this more, it's not a super strong preference. So if you
> still insist on having a new FD, that's fine too I suppose.

Thanks both. I'll go back to installing a new fd in v5, like for any
other retrieve.
