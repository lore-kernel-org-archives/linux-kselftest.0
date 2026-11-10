Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336991;
	b=QfhFhV2XCVrRIeX5MnYO1dVe3axyH9uYGNqUwQxOx9CwciIafV/GOKlvlF9k5Bx8PsWG
	 riNgvLjRV6sRfu0gAir2N7e3Y+u2c5mQ8rX7VGd5PqQCE6g8ZR/yKWytMcqFbIf3Zf72U
	 3ha9UfagY8VT/SFhxdlD01G78hHfhW0pDL6Y/5ve2l1VZn2SkglECUqNrYoZ0H1KMKcb5
	 ggVUjSOkU2Mxowhc2hIoJtNzeAcGbF7SUHvUfuYbsrpBEMdgNtmIpMfiFEkeiPiwf+I2Z
	 80ttNa+c4HpR1II520Cnzq9m4QenLESn/RtAkhxKfdPTqo1AS1MNnvruXFOXxO/c03Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=g8kKfDytD/v7OOrYEkkTE88iqH3WPJ5eP+WcohkLFA8=;
	b=4jFPyFp26H1Sqywi/6bHuVPEAEtQjNEfnWSohFW0/o++FshMOPsaZ4wmG6hbuqwDLwyo
	 EAvp8d24Vf95m0dkYBhhsjHy0c/8y0cqUEdM+SqDVgig+8zYMnWR7cBETzFPmd7hyI3JG
	 63+bkuYuRoaTXxePc4wpz2zptzkDc8ofwNdl7GoXOW5qbfZKJPWnWTYtfMjhJnqR2LSuO
	 u0JT3lRGTRZc2lnhWTlNznWrveFdPUnhfLmpgzSbVLP9YSCz6xsvb2MwTE7DeSyivQN8Z
	 7ysHYJyfC4h06FFVIigmHVCBh0A3RFRtbIJ4F7DIuCHDtZHaCscX5+XFu9bDo5kYGKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EQjWlEJU;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94EC606A331
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 18:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A94EC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EQjWlEJU
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a07078200fso1030023b3a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 10:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794336990; x=1794941790; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g8kKfDytD/v7OOrYEkkTE88iqH3WPJ5eP+WcohkLFA8=;
        b=EQjWlEJUTqlvye1bZ+asbnnQFPH4ejxzuEM2f296OL9owhnNQy78horLu34TH42Na8
         zbbjjim2s9YDMKlvERFXkEOfsjOBG4QU8ZC/vwzGPh5W199pxwr4yjhI+MnJg4pn5jkK
         PbzehPQM4G3nMyOxJVf2i2wBP71w5DFcV23m4791KCLy5Td9v9zfgcLll/QOBChumv0P
         XUZ2Gx1RuRQBIARaj0hh93NS2X1sppCBXz0tBj5SeGTIAS+TBqHIg0zt7Y9OyADXgniN
         5RtULOmYcIIXYBOm7cOJFX88LvezrB+xjLoa6OYo+Nz60GmKrvi3Qa6bQagNkCnnYCim
         NcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336990; x=1794941790;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8kKfDytD/v7OOrYEkkTE88iqH3WPJ5eP+WcohkLFA8=;
        b=0Q7JX1zpWy/TBvLO9pzbAcN0YabzmBzZA63CZMvNKG8ipnMJYMOoFf+D0TQ3EFzDq4
         kQjidzAVOgiBqB3tfZrwOVXAt5sY60WTxqfkwEKaVGuzmv4FNI51+j2EGOldZiXJ1U34
         vd6VOZ9lEbE9neE9ObEpG6k+U1ZbTAXeRkUDV7ppYsemBhtxZw9zNgmMEnTNEkmLimSN
         BX/72zhQlH7Wk7nezaa9ydU8IruZ+brtFDXe3aQ+5anTM2qZEbwdSyYLy3NIXFQj/qS3
         vekI8Hat4OW+Yy862TwrEFr5NUwW+AJXMmE1UdttnOdLM/Qs+JRlNapBBxDx5NrM6nPc
         DRtA==
X-Forwarded-Encrypted: i=1; AL+hErEMBjwBpH38gDsoiT4vQQo0Q/BPEmndslVP49THeouqwmTELX+zNyTW3C73yBe2SW2hFqTbIVXxCT8O2ATjVI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jAdbNF+Awev8Er48zBknOlBIlFYTDQI1mmunCT3DkYal9VRfi
	w1bU39QlOyOhdiMs28OZf5BObxcQjinn7kTAybX66K8HMLEF+MUL16mYmlA6wIj7oA==
X-Gm-Gg: AYBFou0AqNHPtsuim75aPsDi550aCeOkYU/i7IYrEhdLTbpakWBbRu76fMCHnQvOTXP
	jC0r023wCxFHRzOB7zeUEaRUAERfKWHHj9J1/JrcUOPvijqBQaMdRusmd3RJFO+yfpUwNvk6pmI
	Xsy6GDQP5G0BjDxuVbbZoQhpUqNAngyiJr58/3S6I/6z8BEHyxPzhFRyLMnT+fNFC86LzkyyraF
	9nt7MmEO5jGFcaRgMtyf9hcgz612Hd/hn0qnMONhISJsVIHNwwJOTsUnGPs3KeyDkvt55nL6KPa
	bADuTVCGxuTax3gMXMXzPdltDlRzYuovLujiHMT1lLbpf5XWbJAly7yzYJpaxBs9/fa5ddzim2v
	hOFkb3XimvkPIocRDKMBXBL+r53kuFogK7676R8TnQNWZRirHb/SkQXK4LuyUt4m95pJ6jWFKGC
	xgsIV6jp/60ns4bALaluPmYLO7nEkvjI7i+y5piA+S7LSzarhEIUz9ER6kd6bLmYW9QRzYz2y5G
	0Ftvef2ycc1MiiAe47NG5RVKQ8/6kR9Cbw2+zRoph6fnyvPjZIyxxECxN91zYz3pAh4cEUyr+vQ
	KjtAlUjDFFz1EMNjr0iqWol1vb4mD++l4jB15Uu2aK+oUbIwP7O+3/CncR2jF44/
X-Received: by 2002:a05:6a00:2349:b0:89f:7a1b:2bf4 with SMTP id d2e1a72fcca58-8bc1b6feb8bmr5444b3a.16.1794336989281;
        Tue, 10 Nov 2026 10:56:29 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab21835fsm1302972b3a.42.2026.11.10.10.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 10:56:27 -0800 (PST)
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
Date: Tue, 10 Nov 2026 10:56:26 -0800
Message-Id: <DMRRDJZ8UQ2D.30SLE82GDTH48@google.com>
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "David Matlack"
 <dmatlack@google.com>
Cc: "Christian Brauner" <brauner@kernel.org>, <kexec@lists.infradead.org>,
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
Subject: Re: [PATCH v3 00/10] liveupdate: Preserve tmpfs files across Live
 Update
X-Mailer: aerc 0.21.0
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261105-sitzordnung-nahkampf-ausbleiben-6db911d0333e@brauner>
 <auy0ThryqW5nVx20@google.com> <2vxzbj7witb7.fsf@kernel.org>
In-Reply-To: <2vxzbj7witb7.fsf@kernel.org>

On Tue Nov 10, 2026 at 7:45 AM PST, Pratyush Yadav wrote:
> On Thu, Nov 05 2026, David Matlack wrote:
>> On 2026-11-05 04:42 PM, Christian Brauner wrote:
>>> The checks on the target are trivial: a writable fd to an empty shmem
>>> file with the inode lock held while you fill it. A tmpfs file can't be
>>> sealed, it only ever has F_SEAL_SEAL, so there's nothing to restore but
>>> contents and size anyway.
>>
>> Sounds good. The one other check I plan to add is rejecting a target
>> that LUO is already managing, e.g. a file that is preserved in an
>> outgoing session and whose size is frozen.
>
> I have been playing with this idea too, and I also stumbled onto this
> problem.
>
> You also need to make sure a preserve doesn't race with a retrieve.
> Since userspace has access to the file, it can do both at the same time.
> I think LUO should expose a "register file" function that registers the
> file in luo_preserved_files. This should be the very first thing
> retrieve does.

Agreed, that's what I have queued up for v4, which I'm hoping to send by
tomorrow.

LUO gets two new functions for .retrieve() callbacks:

 - liveupdate_claim_file() inserts the target into luo_preserved_files,
   and fails with -EBUSY if it's already there, e.g. because it's
   preserved in an outgoing session or was retrieved before.

 - liveupdate_unclaim_file() undoes it. If .retrieve() claimed the file
   it returns, LUO doesn't insert it again after the callback, and a
   callback that fails after claiming must unclaim.

On the preserve side, LUO inserts the file into luo_preserved_files
before calling the file handler .preserve(), so whichever of the two
inserts first wins and the other fails with -EBUSY.

> Also, today LUO core expects a fresh file from file handlers, so it
> always installs a FD to that file in the task. When doing the "retrieve
> into FD" thing, that will result in two FDs to the same file. While it
> isn't a strict problem, it seems kinda ugly from a uAPI prespective.
>
> Perhaps we should let retrieve signal to LUO core that "I already
> installed the file", or a "I have no file to install", or something
> similar?

Makes sense, I'll do that in v4. The file handler will tell LUO that it
restored into an existing fd, and LIVEUPDATE_SESSION_RETRIEVE_FD will
return that fd instead of installing a new one. Retrieving the token
again later still returns a new fd for the same file, like it does today
for any file that was already retrieved.
