Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9C02EAD15
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 01:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790643807; cv=none; b=n38dOsEkldMSouo+A7DQDjyh8MQNpZDOQc11SpcoJAq7zTxB5+S1LoYgnitPl42/znelqvJwoWFSfZWtKCTSJ5eJg2XJ9F2C83SVbc4Qh4rwh0pKTfNoR2aoqh3XKRAC65mOLjovOPXvF+WQNxZdnjM19d9vYWeHwMaAcEJLyzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790643807; c=relaxed/simple;
	bh=Cc73sYFLSIMttxwMcehpMruet7yFfO89T/HvvTOvmWc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O4GAz0ZFlLec10/oB97UwzXQgjrJ0RiMCkIhJm/fNB36gKkSkIjl+pwfWTexZaNPYrO3XOpV5RlWJQqS/pvll5n8k/zk8pEe9f7/p+O7TKQUMxhOmPqdl09UkEdRz/lw5lvqoQdlODD2ZsKUzQJtlfCnx7/2bGc9qjeJcMFVUBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1HrHuQq; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1HrHuQq"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so2441309a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 18:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790643805; x=1791248605; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tC2G8MEi+Qgc6YtX4GqkDnJqijVswtbQdET6mIsE3zQ=;
        b=Z1HrHuQqBOtIVGxBQea6SFhGNWbRnpfu/VzycW2tWnkfZ7KHfs2HuGJ+592YAXCmcc
         6UpaRywH/16sFyIr4RnDPsN861G8DOVxtCd3JfrKJB0nsTlJ3pEbfTN3W9a55pdmJG8Q
         jCfr0zpvPHmmBTNTiyVD5bBNFtkz93OqZz8SkQwJhDQrubNYmNcL8bAzW8CD2rZGpnFn
         atdyNeqN/NWMPeEOC8Ze4Ky8yGx1/Q/BDR+oDAzkzLClkJTTeyBw4gYetz898xCFLsM+
         E/oTNzsM4u0iihfWctxCYvyzQVQDudq200ZLEvaNSkKBrFG7jJ0NPD10cObg4z4LAkSO
         0qXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790643805; x=1791248605;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tC2G8MEi+Qgc6YtX4GqkDnJqijVswtbQdET6mIsE3zQ=;
        b=ZMwUqaa8LSDMa8bKS9ML0SB5irevC9MQp0wihCsSsHu2oBkFWCKwMMOVH2GUtOMjTj
         vsmOewzMlvNmxm2fOXCcaJIQt+9tSXfowxt9RPNU2Omg7zWRYsY05EZ8DLEJ/G79S2XC
         Lb81sfdeTzT/ttL0N2xfccwRf51fXfRGtaqtN1gv7UNsjeaae6jLcwgQIP/UBvenS4fp
         Yt7166meITHXqMnrm+dFSt3//msRTKg3v2P0BSQS/VZFMDo4E5t5M/c+G/T1eVh2RnUu
         8B7AEYUGKoA+8FTZrIx60BeenNyyuIW2Rv5mErrIleHcMoRsdb5Cs8ZyDDtHZrajWMrl
         zV1Q==
X-Forwarded-Encrypted: i=1; AKwUvBynnQrdekk4FS0c4VsNUeJQHNJ+2gW7rP3rfAEpilBN9dXcPu1rFQZSKsqOwsssnOimIz+SEmrF0d6k+s93y50=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5FcSUfEfUcgS8Ugoz0ddLDKh6skpQ6HCaJkBR9zXw/T8Yux/e
	oB+CcyFjqmGNwhvpukZDQBFd/Nai5Hhv70ZAFuEThqOL2VcjrdnuFZyW
X-Gm-Gg: AYBFou2vA5jw2YL8Sn39PExUQ1agBod5xJjN0sDqT/E30os1YBr4PKrMRerxZ5or7uN
	S6mrKU8LR9DhkfPLsi1V76qqQ+rzF0fuiQaMVKG/6n5UwdDUd/Pwe2qpdJJInuS5woW5Vrwxx2K
	PfNQgCxo4P3gcmQkjLA7CZTfDf+h6fH4h4jfgV91aqgSAJWqFEKM8Y0WVBeYMPdPEATYhYDT2r5
	p0z7FovvPcRBWRGH6dOSUjzVRDzp3GHx6PI8+ERpoeb1IdE6SkcZiTE91SZo7kXWOxe2XUT/l6C
	fu+tMwLpCyFA7ve0ue9If+gt8E3RcSEbc6GhY6acbSpf9tqno+tC25UNi669DnRSbZMboVlaMd9
	mSHkU8UMGx7FvE2Mt1qaZxt7VCu0XzeEl/nB/LlIzy9Q4twiMACnskrS+EYXeymY+r2GCFDGDxq
	qzil8/ISXYTnStv691xjXPJp7Kb61/9/6DDU6vWWMls4I/gPtSFPta2XB31lPmnr4Zlj/0A73tx
	cm9sMmZ0Fq0nOjc3mQToW+lsVqEMt1FfPZAH149GTJ68jzLb2N2d5TShN/Bt8qaFCDoJomBIoKf
	Vrsg45hG5AnHeYLHKnzTXsmPLdeWXK/ixsKGNA8GsxMEaNt9GewucEGLMlZ4Cbjg7jCDizFKxXM
	w
X-Received: by 2002:a17:90b:4acf:b0:3a0:f2c8:9ad6 with SMTP id 98e67ed59e1d1-3a0f2c89d98mr6052076a91.64.1790643805183;
        Mon, 28 Sep 2026 18:03:25 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985ff0f2sm2052278a91.8.2026.09.28.18.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 18:03:24 -0700 (PDT)
Date: Tue, 29 Sep 2026 10:03:18 +0900
Message-ID: <m2zex03m3t.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: johannes@sipsolutions.net
Cc: linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	david@kernel.org,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	ljs@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org,
	geert@linux-m68k.org,
	daniel@thingy.jp
Subject: Re: [PATCH v3 2/3] selftests: run tests on nommu architecture
In-Reply-To: <04259a99ed91f8a527b255951a6f626310728170.camel@sipsolutions.net>
References: <20260926010819.604346-1-thehajime@gmail.com>
	<20260926010819.604346-3-thehajime@gmail.com>
	<04259a99ed91f8a527b255951a6f626310728170.camel@sipsolutions.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


On Mon, 28 Sep 2026 16:44:49 +0900,
Johannes Berg wrote:
> 
> On Sat, 2026-09-26 at 10:08 +0900, Hajime Tazaki wrote:
> > Architectures lacks MMU doesn't support fork(2) syscall and only
> 
> nit: Architectures lacking MMU don't support the fork(2) syscall ...

ah, thanks.  will fix this line.

> Not sure where this should be merged? I guess selftests would make most
> sense, but you can't actually test it out before the UML nommu changes,
> so that doesn't work too well right now?

I think this can be used for other NOMMU architecture (riscv, arm,
m68k) if those are properly build so, it isn't intended for UML only
tests.


-- Hajime

