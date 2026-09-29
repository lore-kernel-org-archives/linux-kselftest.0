Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443ED4F6468
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 23:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790724850; cv=none; b=Am1qIHZk8HwU4dxhtCC7P6tb1kFw4wQj5za0PtOkHKRUrpGkDnDwaLZWvyism7tQQySQHZqJzXz0DXWAv0ajLdihenKrQJTgR3Mph8REiR+fXSm2QlAqITX6EA8mpxyUeeYhIhGOCaCz/Sau/UshqdTkMxTDy5cMagb+iGI/Pok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790724850; c=relaxed/simple;
	bh=g2ww5Lqb0Gb1kN7QhMJgAUu5t3a+4EhytDztTbBIkcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFq3kfBNqnwi5qIldX3cSP1sj8gmP1Yh9q9LmabeczSnRXbipedMz6zgYvslacwXnr3kzhwk3iU3B2oIVKrR5UJVFzuAMhRy5LwVAopEYm0vmcZOBCzQFZ8IDlEGaoHWW4qOCkpgnoqNHd9Z0TG9Cxv8E4b6G+f9ZgvGIa5GZTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIAps85P; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIAps85P"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc7c6cc3513so294938a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 16:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790724848; x=1791329648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cafH7Zvbqt9FpZhYTPG4v0LA/vMmRbIjvfxM/sznOEo=;
        b=LIAps85PJbXqMVynQ7G3yj8cmeBT8nouQP9659f8Uj3wKkNT54Z49UfyHNMdv8UxL5
         xHueqladid4/dg8HO5Ku8dSA53TVdYyhTXxtd6jDXYFu+JNDh4hfZ99yiq4nLivek6T4
         6vzM3OVp4Q24yIgLXaqMNdnNb8ZbJx8imi/8nu30J4pQdc4kISXCX+WoTPjy4luey3RW
         OoPwbxq32o849SD1CBICXPU4jxc/SyJSNCPopG86P1VW++1/tLYYzFeaKVhEzVLAbjOI
         M9uuguhgF62NyMis0ZUX+smKHSJtVdubt7TvOBFx03Akr/Z0S8X3vC1VRLeR43aFyFLO
         XGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790724848; x=1791329648;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cafH7Zvbqt9FpZhYTPG4v0LA/vMmRbIjvfxM/sznOEo=;
        b=k5wz0KHsSvWBJ3/BDLJ7jefD+YCiuC+EQP7cehbrnFHozDBT13Hvdg/INjPXICECXP
         eCVSSvQVkSzVsNXgcR+1RSLBd3o2B0FqDKJHEdtYQP7OoFH8bt/Vpesqo/3hzF58ywKE
         UjcnVVSAnvSRKGnAADB5P7iBaYx78p99Mxot+w+WTZBtHrlGuYroKouuYXW3wuIBesDh
         fAnQBR38F9vQEs0IO4bzdHrcVF7Ha1CxanMOpTr+S4aPRRv4++VuwKj/OUqsZoCcd4z+
         VpM4GoIma6xrzVd5c5qkFZimsZu/i4VxPBeNXfuzl9hVn/4GImgr5xp/VLaINWxyiMDf
         XL2g==
X-Forwarded-Encrypted: i=1; AKwUvBx8IRxtlnBRwidNVDdAavLFMrm07CwlXeZfTDTI0cRYg03mM1/mQ2LxR4SRbIz8UmvDVkOwmsamwFFWR9jSRJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++lmeEui/71DhP/gfXyp3vwsxL0JWSBHLPIkqG2HSWyp7/kPHTZ3
	Ivq0csTEuW4sKeJSOhXkiuvHE+iFPfmh1u/Yf20FpuRvbeSbwYn+Nvyd
X-Gm-Gg: AYBFou1eZg0dEOiEe2fHI1pYOvkGvah7Twe/z0vk6hqS3U4iEfQ0NrRdjGDZdM7hSl1
	Ucs2HFJHUrvUEmwkYYDnFv2Q+Z3UdwklEorhPM3xY8gC8GdPDAyACb2vb7xjuWcrJe1kYUyPDTg
	XzkkgkUWSJWwleEI9p7g3wxJGLTgXPdYzoJgtnXrQ5X9mjD59FMIrZ9RS3BQDpZanKgrJ72pNtF
	KBCMKUpQjelxKrPJnhzJA/i3YSYqsU1HsjHsFAKUeVFtKHJC0LKoFO5DziNUNBzlYe01a9+GauE
	P1efgBojYbs2vuwfZ2KO33RN7uXigTXRXOXjwaQmzUw3aETTkCh9eyXQwlW3P8SVtz8cFxE7G6A
	5GZfNoycQm0qYQQ1JhBRZ9WxEfUUApQgniDYxY8BPh8RoYxEQ/ccL4W5Z5BZYydB1J3XLmKsxZg
	nLTI8ybwcjJ7dkdbIpw0CYjBdy/IOIFFGFXYi5qvq5mCA3aMENsL79ixW5cNEKMLSD
X-Received: by 2002:a05:6a00:1302:b0:880:78ca:8408 with SMTP id d2e1a72fcca58-886c18bf7fcmr577525b3a.7.1790724848564;
        Tue, 29 Sep 2026 16:34:08 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4e::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8868cbca29fsm519003b3a.47.2026.09.29.16.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 16:34:08 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:32:58 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, jv@jvosburgh.net, 
	hawk@kernel.org, sdf@fomichev.me, emil@etsalapatis.com, liuhangbin@gmail.com, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, willemdebruijn.kernel@gmail.com, 
	aleksander.lobakin@intel.com
Subject: Re: [PATCH net-next 4/5] selftests/bpf: check XDP attach on a nested
 bond slave
Message-ID: <arxKpT2j8-26H7-X@devvm7509.cco0.facebook.com>
References: <20260928223648.2739371-1-kuba@kernel.org>
 <20260928223648.2739371-5-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928223648.2739371-5-kuba@kernel.org>

On 09/28, Jakub Kicinski wrote:
> test_xdp_bonding_attach() already covers a flat bond both ways round:
> the master is refused while a slave has a program, and a slave is
> refused while the master has one. The nested test only ever checked
> that attaching to the outermost master succeeds.
> 
> That left the more interesting half of the nesting untested. Only the
> direct upper is consulted when deciding whether a device is already
> running XDP, so with bond -> bond_nest1 -> bond_nest2 the check on
> bond_nest2 looks at bond_nest1, and it only sees a program there if
> bond_nest1 recorded the one it was handed. Before the preceding fix it
> did not, and a second program could be attached to bond_nest2 while the
> outer bond's program was already running on it.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
