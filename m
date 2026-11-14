Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686757;
	b=4aB0wrr1i5iVWaLdCG/+IzLXEtzdQozCrB8Cex1esI/P1eKnvnDGl+aevtNfgjuqCTch
	 SWzYkmDil3lH1wbbDWbkI0dJNF53KCLHemhr/EGb6ID9PRs8wOnkz+F049xdYgTunNeEy
	 +yFpWf7hr97M77OKGNBo+G14HS9fK0TNiRcv08J6S9E8GgJSyCHGGfhQ7LTa+3vS1+QOI
	 Vb0ZnnTKn3bL2TVlYsu98Y8J0d2MNJpN1wWfqclGFVnHTfUJ8rulxymCo2dlXRvqOsrzs
	 cdvWwcp9qzqH57OS0C/WOW4B8ryNLy3Vq2qDrTOiPs7IHK8zvx+rx5sorZBnZNVnaFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
	b=RDEr/YaAAER/B9VihNYz7AxZtf7qyqgboznHOdD2DHn7pSSEH4KqzP7PQQJGhpQLj9Cp
	 6FmW0Hz4YrNUEvnnFoU8yhgmfurPL+PTKDdRmbyw0CMYhJnArRm7NV7U6mrTJNtarUI7x
	 6OuPvtDtAe/2QoYArcHWUPpxZloctfErrueUgzH6Rod4tot7Yeu6RymjElNw/JDcXTtKu
	 UVZwNQi+HfFufczP4bHozgsYhyW22xw7Vlfd93dfZCbzjcZK04Vgr5q1Q46WIIzxczB2u
	 DTdCHJCUsWcbr+etpdtqSZmMhMLu3yprIODapJHOniBcJnpP6nBpiUEHy1qIZnMHcKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ZNpsvJMi;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7EA606A32D
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 20:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C7EA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ZNpsvJMi
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b271e573adso1161064b3a.2
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 12:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686756; x=1795291556; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
        b=ZNpsvJMizOoFFuviUq3R3I7xBszXKHR6f+dU2Lhp8+AdJOsuucW/Jpjz4DKxOc01P8
         7Bf2gXYBYorSyL2ypHSps7l13uEx7uOW/BQ3oCjgyM7fn4nszFId/ZhifmOhhkUhMak/
         Krv6vg2ZKrT882kZ97nfZeCj+rR5WiJ1p/wW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686756; x=1795291556;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
        b=QsxeLyuz+gFZKvTSD5yOEKop6NB7SEnL40jmQFA18sjKPamtzKp8gLVpu0/f3E5Q/O
         T+jtLeXCBXX5L4TmicUb/SbGz01juDGsUhvSE9woEc+ugiYF0J+bNa7910d1FWt838iK
         rRCiYcx77mM4pJD1U28UTERdYZR3DnRD4Q2VoXFF6ggSk6miUyOSaK6j9URaSLzeV1rw
         uV3PBFV5yzUFrnciYvo8OryrwoUtLl/47sragBHPezE8jzdW5yIwFaJLNZJjBalR8pG0
         l23FPJGA7nqUDQjzeEnhn9Q70/ZaDX2TSP+Ky4OikSI9XeAniD2FnqoDZs8RcWWIzFsh
         SYCw==
X-Forwarded-Encrypted: i=1; AL+hErEeqJJp40Ayc0y8Go8oEwFuQ1Dl8GscsWCUyg2Yk3r3GQ49R0fDJua8lGnxSw5byuAYvH52s4eGj0BjJOvV1nk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WaW5cSBLDDFYI3fIDiK62E8MZvxs9LfmseDiWP+o9A1pFA3IB
	VUgCLXQsaCHhHCm9kaVapCdYZU5Rt8Z8TJI7ijJwzjGH0ps2dLRGzZiwvCEZKYSd7J4=
X-Gm-Gg: AYBFou3uSixruJUtUiEHPBUzh98gTriiUVwKZkQeJwGWzrtKGzi0yjRSByqcyIgLEsy
	nzTyy+NLyLBIV4xr/WlJA7z3aoqvFL2q9n3q4PjGn4M9ZFk+yaTSWLKM1tMkKnjRo0E/OWVZZyO
	7buiGl/RA9EqzkO5TNPUoOJJTJ2WBYHH79HyQCv3y+kA87YudfkqqCGUFXaxN1sYhexoaI01E2K
	JKNUPy/+PRuP4D+4fa6vci7IE8RYGjSCoVXLcNhoFghXH+Gsb/AKe9pwqx8a2dQPD+fcqx9HaKg
	vc2RxKABLWRZM+1qgZZQaT3Kmh64nDQAa/6ncMTro8Uaim2WZ2++q0ykeVS9heJagC6Z7YatczO
	Z3I1uNFFsDXsZ97tlcZsrW1QY3C7exieDhUzXkDn7oi7JqMviL1aR5EGcPq83aW6GVnKWkk1w0D
	xS/5art9r3gQytNgn42uwE+PN9YGgjd6SCw4DQfwOZ3d1jf1sYyoRR9RTtvmywPd7ZgSIz7HeEO
	cRNEzoJ2BgwlWlsN2yI+hgDcdbad11d2KVOuk2AiJaKzwZ8dhFyPPqMpvutKQUEo56Twh0mZFEu
	C6Y2NFY8zJ3Kjcd+x7J6IL2Mqy6y9I6Q1Fck92pwHwsUJsxrr7MmLmQMpqSV19uPKD6kKOuhlAT
	wGiO1wzk26H/wJxjsUQbtINZV7rg5+LyYxazcwt7xKPFgZ6mDK7AbnQ0A6//gq+mi7NIwro6zfH
	tK0hhbxBl6Henacagi5tpYPJIiPc7d+8Iae6xg3b1NynWLfeu/t68UPjhh
X-Received: by 2002:a05:6a21:748b:b0:3e3:37ff:3795 with SMTP id adf61e73a8af0-3f7a4dbfbbfmr5517650637.7.1794686756009;
        Sat, 14 Nov 2026 12:05:56 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm2271197b3a.13.2026.11.14.12.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:05:54 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:50 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org, Alexander Mikhalitsyn <alex@amutable.com>,
	Breno Leitao <leitao@debian.org>, Casey Schaufler <casey@schaufler-ca.com>,
	Chuck Lever <cel@kernel.org>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH RFC v2 00/42] fs: don't use pseudo filesystem files as
	storage
In-Reply-To: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114120550.0c9e73aa12a3072c@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Patches 1-11, 13-16, 18-26, 28, 31, 32, 34-37 and 39-42 look good to me,
so for those please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>

I've also tested 5, 6, 34-37, 41 and 42. The selftests all pass with the
series applied, and a uid 0 without capabilities can no longer change
/sys/kernel/reboot/mode through a loop device. So for those, please also
feel free to add:

Tested-by: Chris Down <chris@chrisdown.name>

I've replied separately to 17 and 33.

Thanks!

Chris
