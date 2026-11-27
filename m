Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804610;
	b=CBfguc86ALeZT9K0TJcNHeFlBO1jCg8a8K2SpTmnY54MITSGPqXn7BAIJ6RnJg+2X8mr
	 KG1jHemfeLLHuRoCwKHYg0F5u1iUosxZIijqLNfOndIlzCvM+AUPvEjJJhAK6sHuq7VqA
	 705PtGU+jOvc8xCpXKsi9hrX2nzj0aJZ3avzprGvyJIidoJD/uTCDBQutBp7UJjvMa534
	 ge21nOgiiJUxQaiIlIZ3W8728cmy8mhC/WCu7H8sJZHqhuOlDqKaiVh+GEpyO7r9vsFUt
	 PeJO5RD9LX4CCaslfGMrsfprqqCp3NqqmKqunfnasCglpaPvL54WdI2xBSo7L+Adz+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+9Dw/wen6g6fWY32jCYKXg0uC2F+6Oaru/Dn4CTkyZM=;
	b=bRtpJ35mEFxM1l2060wj9ZuPh2xyUscCL+344hQCPv5VQf6y8IH0WAarXy1+xjI5NnPt
	 22gQ7m74620AwXsZmiscFgqK4SHBPhkHvB5O5lp+f4i/OJcx5vgWQPsZ2F1EtWyCKfFhm
	 F1DavRd+88qmWNpv+w3DtITVGn/QraVZKAobrZoeli0PpA5I/2zULL8EFayDFl6itPl5S
	 56sqJIMR3EI7V7x+90fgKL/tId1viu8byDXzQzUqBefvTVbSHKrAanojaaY8mEV+8Y3ZO
	 VzPpEKQIOLqq/ytWBJnXwAvKdYBNXrdPKCG2dnuEKTe9FxHCAGgKL4/yCYMQmAvJJ5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FQqDBy6J;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DE7606A32D
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 18:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73DE7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FQqDBy6J
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-9210f2622ccso89541156d6.3
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 10:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795804609; x=1796409409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+9Dw/wen6g6fWY32jCYKXg0uC2F+6Oaru/Dn4CTkyZM=;
        b=FQqDBy6Js8XrvXmyD8SL/u+yExsfiOIjX+3Qv8PFjqWbEOS/J/sDfstl24lcNicd6M
         PkL4KLFLOjm+xuNYdQwqUcHAIrXcJ//DNqWVnzEugXxJV52uk6eRNVvaVxXJbY5Bl7ou
         7rubMrQs8EdQfsO5xRzjEsGHJQpkeR1g0nRGIcWUrMhQ+w2TgK1gza7wJaMgYVAeHUVG
         ges3+956+qMurZGsh19qeYrM1aQmOnZrNaBhNPYHVU0VuU1IhVr1vVlTiL1tqNFxWPhg
         YdOIvlBcF3YHxrQhupM7z96IFAXcMGRFNkKk+1lOeoAkMMQd+mWGr1YNQMt75thCP0QE
         XNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804609; x=1796409409;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9Dw/wen6g6fWY32jCYKXg0uC2F+6Oaru/Dn4CTkyZM=;
        b=uRXOSPeETts9N0BkIOx0iFVZ/Y98KbskRLw9o+RhmGeiIimN3sa3Fwl6lBPU+AfhyE
         7qGiYjJG6CL5gF181/e01Ckr5tc3ukutA8EhO8Aa8T31hMjXzDf686k22b5JUkILOoYh
         1vWbxeS5oUq3FajFI9Hr0klBOpEbAUKEdKQY9Q9vztrqQSVRvh63kbtAVX6/x29L5Kjz
         wgcVjznV44LbXoZ4OGOIywYfcxRTen9pOvohYjrAXJFvpmYsOYXiEvOHBDdBjkHA+o7P
         wMkUIKBswVXOujcrox3MNR/fWDvDmNog+Y03NRhOAdOsnrPJrGzcCBNXivav7OXne/2k
         BqDw==
X-Forwarded-Encrypted: i=1; AL+hErELTQQZPPpdx399lNQevAWUEm8n8Yyzj7ZkECmGmaukTeAB2FtYDfvCWK0EzdVCS/JcFBSAjM6EFsrgzgUk5oI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rWnPzYrISrWj/DX1scJjXgH8R7FmhDodxNsVWU3hQkIxH3UOw
	D0mxOJAX5W/6xGvpuO/sLGqmF1eOyCKZDvi3L+LODW+aYA/sZKv8Av7yvZVopgAiBQY=
X-Gm-Gg: AZFdTZda3xnV85ZtpB7KpUjpJqaUnaTDZZX4UQoU02tMHwDALl61W3f2qjRb05Y9W2T
	Z4q/D3zibWUZv0I/i9zG9Ho63uVSGgiZDXPMKAL+UsKclS0zcHOKGSnUllgLsj48arF9HsJOqBl
	rKSi3oEpl5+uS6aa8KS2Fcp0o8RXhq0fDZca9yZ8RQw/Pyj144Rj446d+aeFsiLt7ilgSbdVVsl
	fD9mfn8nkzqGCGn0VfQfoY8xMrvL7Q2vcWePjx1NWSIGecETySHSfvnqDf4pqBauhvZD1cZjNBn
	Na1RoBFR0RZh1AGej/IKSpSq2yLg4jW+CHcVX1FOimEjoQ+QftU2tbtUMzXJQhRGdYic9AtG2UN
	AVInpxaXVRlx6ra5STQCIT4h/fRZcXLdC4y+QuL7B9ZlQx3SA3GwmSgXycZEuyWxbMCmoR4/hT9
	BUWiePG+eRZkAdmAgRi3Zu3ZonMbhRCTq9Ob7/cQsZ6wRJ6i1VLSKT+xiqCQjCd+kmi/QOiqBG9
	YcoISOO869tMO8ZqbyCZ5yU/KCPc0JWMMWKQFxchpC5ogw2hoBO8Zc2vtGBCahJACPa+q2Ui8WX
	NYAmnag=
X-Received: by 2002:a05:6214:4686:b0:921:1ac1:34e2 with SMTP id 6a1803df08f44-921653a9042mr254285806d6.24.1795804609400;
        Fri, 27 Nov 2026 10:36:49 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b253csm225559716d6.15.2026.11.27.10.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:36:48 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xX0oS-00000007aS6-1aU4;
	Fri, 27 Nov 2026 14:36:48 -0400
Date: Fri, 27 Nov 2026 14:36:48 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Pawel Chmielewski <pawel.chmielewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC v3 7/8] attestation: providers: introduce CCA Guest
 attestation provider
Message-ID: <20261127183648.GW246011@ziepe.ca>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-7-df3230afce8f@arm.com>
 <20261127170722.GT246011@ziepe.ca>
 <awnLgFZIhRZENiE4@e129823.arm.com>
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
In-Reply-To: <awnLgFZIhRZENiE4@e129823.arm.com>

On Fri, Nov 27, 2026 at 06:27:12PM +0000, Yeoreum Yun wrote:
> [...]
> > 
> > > +static enum hash_algo cca_guest_attestation_algorithms[] = {
> > > +	HASH_ALGO_SHA512,
> > > +};
> > 
> > static const
> 
> No. it's a scaling issue since the attestion algorithms could be not
> only SHA512 but also SHA256 and SHA384....

Then don't init it here and do it entirely when you query the RSI to
learn the right value

Jason
