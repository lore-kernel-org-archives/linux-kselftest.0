Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795890473;
	b=wnyzFMurmMk9rroAkmD4RQKn1ZVX+TGit5m7vvMLzQ8iKnSSSQpCgk5JgpNDPAENoEPR
	 cIin5dYV0Sb4Twip0gWKnIihVVL8lirbzgbBubyd5Enj8HpiSB0y1oa5vAvIi/IMhwbi1
	 hPl3bwP8GRdCaujE0KwXymLVapRXxA2WRorHqouZtjSXl4RniPiMRZiN8uIjXFaaYQOLq
	 AZJBvEEpgs9lu4iayyAzElyhuul8sDccxrXofdvmUjVrKpJItBqJmd1YgzluitfsIir4T
	 vSUlehjJRAYApYCyjEKMZZ3J7dnMpMpRZv5oZDnac2V2gf4U8gYguRzWQhiVupNzpUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795890473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=pbqkVKTwkANdfpPS7SBzcnIpwG/tGr47yiVJ82mmtAc=;
	b=HoNSpPXTSHWBG8x+nIXSmsNY8FkbIZSgjyFK5tLpwKNJO84ZcwZnGdUuwONTciHR1/uF
	 ifyakG6P00ivpZv38dAjuX50DBme/znOmDZmNnNnua9IR0Lvhe2NEkJINrCD5oJCAeDRs
	 hoZlxb2uc8Jjb2ZdCVxo/3X13YaSpxyvUoDtmK9VoXA663cCFC1q1pWnsEiUOFuJMkvkc
	 9kGetM+/fw5MkuRmb0fCaSEFL7Nx886DEtJdoAZovb5tdhRrv/Hrcu0007LpaZtEpKcuC
	 sUlQG3aMwsVXWtR+i7vpEgv8efpzkEGU+T0eAkLdj9+EDhWk4oG4f7SvB/gwfeV3DcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=TeGaDgbI;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E675E606A339
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 18:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E675E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=TeGaDgbI
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67dae7d3f7dso10589720d50.2
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 10:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795890472; x=1796495272; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pbqkVKTwkANdfpPS7SBzcnIpwG/tGr47yiVJ82mmtAc=;
        b=TeGaDgbIl+eEro+LhxWC9OR8ut7KfVHjN5krM1mC3+fbw0dbR3K0tsJTR2m52FCL7i
         i9ORhp+4d1s5Mw0MBnfzQZFustPncbrhFM7kCWTR/xAxrNluYJpAfGyNyvNbd8FwaqkD
         qHzBJEKgWExHOd+whDXqg/uODblKsc3Z3c2Fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795890472; x=1796495272;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pbqkVKTwkANdfpPS7SBzcnIpwG/tGr47yiVJ82mmtAc=;
        b=WTY3Z2jcxC6SlJIZY6Jk2iBXRoUXMgctj0Nkhy7Qr8uqAijMK4iYWRlSYupHvnl3Sr
         4s84FohjCJ10TKZ+5qghuTaLipbW9c3l6tJE9TXHfwUIZ8riaFFuGyPgM820fGZePhEJ
         0HUyQJN4a6W02YHR1m+2lv7Q5SXy4Y5FfnXIKyNvKGt7LVbmsnLpvjmB3sHYQPPEVhb0
         rHT7IJNftaQEOkLWQc9+wtLUJfueQxEZ4HxmhSWzqrvoKWWZIb3G9SGdRRExbouCHgBz
         F3SfH+iWqnkIH0R7V3RbmsXQQX9MBlPWyQJ3ftTBJ712GsijQd360vqAg6DLGP2Oy96r
         iMmw==
X-Forwarded-Encrypted: i=1; AL+hErGNaVOXdvKPeoHpIA4+1K1joydxuS1Q3gcXDF96kX8QSseebjMALTIjI0RcsRBQmEQkRqPc4d+77QncH0DVksY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zqkg0jrgU8+sYUx0oG7UZmfQNc9IIJOOY/CNZyqXM+zhgD4Sz
	HOHF/Ts/tU072k8BeuQ2NSlFb/qg8kaMiaVeJGd+tZCGx1d3Vbvg0F+gbvto5BFasQQ=
X-Gm-Gg: AZFdTZd9nQnBu4e/hcWwddt4LTewycKiP2h9/ROoAYdUr68NEMdw8WdBT3g/+s4sIuz
	Cr3iT6nw6bzDQ2gmKZxX4zGdw3lo10ZOgHmtSebnSCFaBXBlX7xp7u4ulGNZl4SqdVFc/AT7/3x
	W5sMs7hgHS3zDa0aEbmHP0sxgU77F8xhotU0I6L8y52TdMPTPFpxHNhAHUrtT/pguJoLbo5W4lA
	aNExWJYiMisIE8xNZrPYZu/yVheMkRw0OCJzwX2Xkv0hdGLSKFIg+kshL81x8icjDB1u8cqVs0h
	iG8vv6uMZrLkkd3Gw3N3M9Rqs2h3sfIV6XsGceNhVNWxRb1W1PDcCjXN2jC62Eu5cJfyAc/wVrG
	GSBmp43+gqoJOX6FEzU5It65e9M7WP70AWs/wubEeJj5UplFtNqHx6PkiOXcLXZDRJlumrluy81
	VL1v9LH/a35NpKxIEpXJnpcOqW7yJS+HJsAUwboXr5OKkHdNrSLS2mF0h0jMQEk+5QgNguttbOy
	Ijjxxbc6ZxY/31wvi84d3e7YboUS9CBWC8TQ3EpUe/qDRir/V0SpQT7ps/elSqNyjWpEFlxBBx7
	8lENF3O9N0stP1nXkCOPQcx5eOkCqVE7euPJJ/qMa7QhP5cLvLk96qDaMxdGZb6SlGHUl2ykzFJ
	HBSAK4teKKEAGa8JiTLmBZ4WrRZZT7kb7cm2hg5k4cPkU4FRSISe40o33GOOEfVFwUygVhhPY1n
	rfbMIHQzN3GiWjUO0xnlrZXfESb2OW05t0XipaOdTQFTFQlZftE9T7A4ZYy6CfD4AXM7Aaw6qoo
	aV2uxXF0tRa5vXk2NUnRiU=
X-Received: by 2002:a05:690e:12c9:b0:67c:41a:bf5b with SMTP id 956f58d0204a3-67df42b592fmr12948184d50.9.1795890472059;
        Sat, 28 Nov 2026 10:27:52 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67e6aeb61d7sm2519613d50.3.2026.11.28.10.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 10:27:50 -0800 (PST)
Date: Sat, 28 Nov 2026 10:27:49 -0800
From: Chris Down <chris@chrisdown.name>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>,
	Baoquan He <baoquan.he@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/9] kho: Make bootmem reservations visible to fleet
	monitoring
In-Reply-To: <avoD9gIBLvMW4vPp@kernel.org>
References: <cover.1794383544.git.chris@chrisdown.name>
	<c41c639fc5f453d60a265ba42a233f2ea5b48319.1794383544.git.chris@chrisdown.name>
	<179443886218.2329176.10742245280418377061.b4-review@b4>
	<20261113003059.056dd036a6546756@chrisdown.name>
	<avoD9gIBLvMW4vPp@kernel.org>
Message-ID: <awsdJYYDgmMa0uH9@chrisdown.name>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Mike,

Mike Rapoport writes:
>> I can send patches for those separately if you agree that bootmem should be
>> counted in both.
>
>Yes, please :)

Will do.

>We'll need sysfs at some point to lift the requirement for debugfs mount.
>And I think it can live in /sys/kernel/kho and there we can have incoming
>and outgoing and the implementation can be in kernel/liveupdate/kho-sysfs.[ch]

That sounds good to me, and that way kexec_core.c doesn't need to know
about KHO's files at all. In v2 I'll move state, preserved_size and
restored_size from 6/9 and 7/9 to /sys/kernel/kho/incoming/.

Nothing in this series reports on the outgoing side, so I'll only add
incoming/ for now. The bootmem size stays out of sysfs, as Pasha asked.

>BTW, kexec_handover_debugfs.c was initially given the "full" name because
>it lived along kexec_* in kernel. These days I believe we can make it
>kho-debugfs.c

Pratyush's housekeeping series [1] renames it to kho_debugfs.c, so I'll
call the new file kho_sysfs.c to match.

>I promise to look at the rest of the series Really Soon :)

Thanks!

Chris

[1] https://lore.kernel.org/r/20261127122536.3708770-3-pratyush@kernel.org
