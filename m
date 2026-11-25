Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600296;
	b=3n1cz2nb+3ajWexk/LGslXd/wGiw0S1KKAsJ94WiJktd7GHd4qd9TgH7qmo0o0OkOpQo
	 AXcbrW1r8RWzIjTMXGu+7KQP2SxAUia3cn8pq8Auzxhlc1aRk5D1qCCHqoUUHHIUPOVp/
	 WO/zy2C/gd0JG4NCMjlNAAUTFkkt8DF/GTlyXZ3sknQD1OSVDh31jWLkvew/+uLosykMC
	 0TsijPCRw1rOSnzCobiX2I2F6m4V9AdMp9cVSFUdKBU361+RupLQaPmZA/CHkUMsA+R1i
	 2Bp1Y2etsoopGP3LRDf2+TJfjuJ/6ToZsB/DqRQwmaPZPvvtpnkUL33UNWs9mt6l9mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ExEdfB9WwLHoUe7nHSiClkfqem+8Ndsrh2CmQFmZ+3c=;
	b=bcL0tJex05zSai8MuvwbnaeVjcHdfqPdhzSqWndFO+F7MlzymDidBwmdyQSPat40jpZv
	 QLYQoy920wcKIUoyfHZYCGXX36oe2IQLEI2Ux1LXQOG9igq0wvH584wf0WWhmvfmXUEe5
	 xRf+JsaT/clUQ7wx7+Um4jLXLN6uAaL01gsmZqI+Wc8YmkpL5laIPSecB6oaxzf3uH0qx
	 L82f2pisNg3CfLqV/HcgzZsQk0t/Rj5aUb7Pl8PxxfR2eriQMK3Fq9bsQgHqAZztfWMZV
	 GWQzfa92OKpaA6sxEcprduRpbMojw3fIGbGXKysBKPZCiubwzkzp23FsYAk+j7mcgcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=ZOTq6OpF;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CE4606A326
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 09:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54CE4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=ZOTq6OpF
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so4256556f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 01:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795600295; x=1796205095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ExEdfB9WwLHoUe7nHSiClkfqem+8Ndsrh2CmQFmZ+3c=;
        b=ZOTq6OpFmLPEfwnp9q8dUA0AGMbQltxU+d0PUMHlX0ejPnYg8xRfbNG+MkMuq8ouPF
         5RwWDOgzMMtcvTSE1C/hLlzuPiUQZYX3PnnJM9OCcyC4YCghxnmn2ED1I7REeawXpTCc
         MyodRJH3uu2ySM5gCJ/RnduJiUL0Nhy4hv+PIvQmV/D1LKJfK2K6YOZlhp9JNcVh5a2t
         LEDl9PGb5xEqTHmHMEv9sbGjoXm3iZeDTi5n+DkZ471czuXyZ1YJfsLVhMxtY1DpivDr
         iRWqJ0kdppUTHXR3FCsll2AVQl7nQYqA+aC7/G4RW9Ncsk96ZIwgi+Vay6i6h04XGVfy
         /Vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600295; x=1796205095;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExEdfB9WwLHoUe7nHSiClkfqem+8Ndsrh2CmQFmZ+3c=;
        b=LAt1zWZEyxYhP4wbF8ZY3R2MOvt+4GDqNAHFhcexGm99amk1aR9COAgp3YVfEsJx9K
         mbHpRvkOY1Q8jt6BZwgF54XW2YTWTYdyfN67EahsVcxDWpMuMthsSxO7wDdNc8FschjK
         rYx+DgoR/0/ddRXY61XFDSjZvd+e49ooqazEHR79kgGmLTcp5Zx5rgWmgcvkk7xWKRHL
         oJDl++V9GeqFCje0tV/RKt2Xmics+P8WK2DvXpbK1HaOmQN9qLFYngjC7nHSNeLvd/ti
         z6H5US+mpSxUOOlAaINtpAYLIPl4MLVwk9mszLKdT5L0JXtTu/tK1QDQfcvs7PYcmr5W
         CupQ==
X-Forwarded-Encrypted: i=1; AL+hErHqQwmYDJR9O44GulHNoFgJjaHhuSxxtZIW1wQv0f2B8FVypcnMvlE5aNWbk+hfceTAayFPt4ZV3UzmidKKNVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SnUjxu0nYDkAfXOWWKYCyd7qTtpzoib7Sx14y7WAENQXAY0fy
	GhhbFAF9tSLsaatYmcIOj47Yi6koJY7e5Wv7htRr3PmoWg0Q1fXqCtnTQi7LEJJHXFY=
X-Gm-Gg: AZFdTZd4EMW1hdnTxJsmkRI/pIpTrGTdAOrFL7u7TJw4XclxDCDR1+n0slxnr9mJC5B
	I5Ttn98/z4HZ1kcK7e5uLXDsKCUJS414r0n5qBpHzk5G3lBFVYfvNNQlh85k5kgkUpPpqjs21Js
	8BZL7RXPMgKD44+w/iIdAbnDhkSZ2BF58+ncMfuytKfI/Qe15sfYfecVsZME5k3Zxp6nnClDHxF
	/9klHu31eMEhGj/10lEIZeV09QUIJqAuCJzX5VvGIq2HbaFgUYQAzGZW8X+JUluKu2Si+NoZtNw
	YdoProi1hP07bkLT6jyKc1nTG+jpU+eA86PEDgRKDGFkJleRFApr04SHEGX0vUBUmEcdUzC4N3i
	jKuxr8t/Nu8PZN56K0iz9qhnFv40SABmsYR4oWkWxD5sAS8LcjZ/13s1fJjAI1BLiHu0C3nQrcw
	3iofeGF+eBd2M6bqo/JSz4FPI40KBpYQcKTSpAiSnAEDXata4cZMH+PXUCGtPuf7WexqfBVl/R+
	OWItORsnFlgoC+b1ulQm+t+0mLBi3lquiEC60ubvo75yV+Ira0ar9jqAtpZQiK+W3qhT2tSDbBr
	uxYak0cUPwhhtogzomA=
X-Received: by 2002:a05:6000:4617:b0:4a9:760f:1824 with SMTP id ffacd0b85a97d-4abb19c153bmr33040480f8f.21.1795600294485;
        Wed, 25 Nov 2026 01:51:34 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm32867213f8f.42.2026.11.25.01.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:51:34 -0800 (PST)
Date: Wed, 25 Nov 2026 12:51:30 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <c.dall@virtualopensystems.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Sebastian Ott <sebott@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	James Morse <james.morse@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 5/8] KVM: arm64: nv: Replace a pending SError when
 injecting a new one
Message-ID: <awavokPJT7G8J2fX@stanley.mountain>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
 <20261125-double_exception-v2-5-224689d8a764@pereq.eu>
 <awaVj0Aa6dMSksxX@kernel.org>
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
In-Reply-To: <awaVj0Aa6dMSksxX@kernel.org>

On Wed, Nov 25, 2026 at 12:00:15AM -0800, Oliver Upton wrote:
> Hi Dan,
> 
> On Wed, Nov 25, 2026 at 09:56:20AM +0300, Dan Carpenter wrote:
> > The kvm_inject_serror_esr() function injects SErrors as the name
> > implies.  The bug is that it doesn't handle already pending errors
> > correctly in nested virtualization.
> > 
> > In vanilla KVM the kvm_inject_serror_esr() function always sets
> > the SError to pending.  However with nested KVM, it might set it
> > to pending or it might deliver the SError directly.  We can only
> > have one pending error at a time.  Imagine we enter the function
> > with an SError pending already.  In the current code if we decide
> > to pend the new error that's fine, everything works.  However if
> > we decide to deliver it directly then the pend flags should be
> > cleared but they are not.  So we deliver the SError directly and
> > then the SError that was pending on the next exit or entry.
> 
> I could use a bit more color on how we got here. From what I can tell
> this state is only possible if userspace changed the routing / masking
> of the SError outside the context of a KVM_RUN. Otherwise, if the SError
> is deliverable on guest exit we perform the injection prior to exiting
> to userspace.
> 

Yes, but the main reason is that I'm changing the way
kvm_nested_sync_hwstate() works in patch 7.  Now every stored SError
stays in NESTED_SERROR_PENDING across handle_exit() so this situation
will become more common.

I will include that in the commit message when I resend.

regards,
dan carpenter

