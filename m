Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646001;
	b=qRDDTnDltyibEhPy/XWUiyKnMvhXWWt/6G5imxybyMtdUsRmsPJXkHFIb6r4IDKDRnYq
	 yfgjH/2CAb1bvXvc2Nu3t1SYEOPq2Jib9dQWa1iNu64xaPDDnTPxyPQBikZ7lknqA8rz6
	 lfIkXun/1rLQ+38rxijWSrkeT0v6lDN+XmzPl0BGM/qEyY3BbSLIdCYX2zKXkBsFk5bvc
	 btz5+8gFF6PlyYXAgNpvVBYT7z1pTAeoqMO4vCOsVD7RadzJ2qvYnT3h1W/enaMYvYLDo
	 rDGum1IHfCiqLIyJtuGzjJZuO0l0K7/ZQvgGZ70AVv0IDdWD3OORh3oeZB9PMUCLK6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bfaMKXrWeYRP7WEXgxdER3J69Id6ZxO0KCbiyzPfHr4=;
	b=prJcErL2cQR+evgTsjWQsqUvGaW1Yvdl7fTh1R39nFzc0KuqF2GUhybmCBSIhzwQOEyd
	 d96O5u5y0TmKA9S/xc8L9kJY47frkRiCc4qwGvqr+XjbzTnIzhdeU/F+tc7RpEKP9oGDf
	 tyR8fHlF71muhvNUOrDmXFsrrbMlURGkeuJPtu7hEe42OLETfXhWameYOkCPz8eY6+Lcu
	 WJJAd4ZSZ6rtFNboS5hSlH48IYZ3jhTncZLu/gl0rt6RVFxSvLh9n0nVYk0zzBxdNSDsg
	 8UjbIJPsbw4RLn3Tgwqk+talhPzN5GJxE9IqZNSDC9hTLG8FSpN5/Jmi/cuD++iNDNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gazn9V0g;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1543606A326
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 19:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1543606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gazn9V0g
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9eb579c0eso17688415ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 11:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793646000; x=1794250800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfaMKXrWeYRP7WEXgxdER3J69Id6ZxO0KCbiyzPfHr4=;
        b=gazn9V0gavccqS31GwskuSH5hBz4+XcaBgNZ45uO6x9kza4ppiYg472YGcD+WxWSSj
         3VjLmXFgZAtUpzMDPmc2/XyxFAiBRQzvXqAuh5n6kS4P8z+Bhzqh9y8JVNA2SN7hPXON
         /zom/oK+IZKgNe7Sks59Ax3L3nFiw5J9y/NOttcSbLEmM6a8PMmzt0Ohs6Z5h8ak0GsB
         gsEqLx1+F0h3bJ/MSUD3fWcXtGM9oD5k88y2qmvLT4dhh0jLMJEjj8LuRwn+FIXX8cEH
         Gl/X+XH6C6CyA3qRfATC2Y855g4/amVu8Nsq5116PMpH8ECys/lQmD8a00XVSgO1JMJ1
         gkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646000; x=1794250800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfaMKXrWeYRP7WEXgxdER3J69Id6ZxO0KCbiyzPfHr4=;
        b=A6loc4qdWVR+Scd6WCmSCj5OZW+aLKqWmT92JPDgdTbNubLLgIaAPiYmznah6nfuHb
         Ek+RgQOguyLvmzZ07rH1/6B0Rijawl498/zIHP/wSkHn7qEpa+OmNEfKisJPf1gZ/a48
         n/YGQ6tKn12BknGz9T80F4ROrCk7jWpsYtmBv/Q+UYAB4/FQ6WHgzhgVaED/PBs+xtJ3
         am4oZcl0B2dGCEO/cD57hD1BbAtafeFY9eS3edukRWTUFsXF4BaegVhWUbWjAuxxGu6+
         eQXlpv0geCtdUfBMvNP9DVozpTw9SxrIMM47GAFkLJsqacYb1guVr++blMdKL9s/zB2R
         XA7A==
X-Forwarded-Encrypted: i=1; AKwUvByGCVyeX5HqzwuSVb4FKjWtqpiJopV27DmqQuNWtdrENAhM5U0ceH7tylgwM5VL7hUlQS+rWzhoEhboglHW2U0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zpnQ9ekzCPirvXoBtBv0rEaL33NFO5UDyowF93e5FKHcn3LVi
	K+AeeyFc1LM9Kzf58yGBfcKWq88/H8RAEmxcCDTbrJGQHB0pdTKFdk9Pqv8R2k3fSw==
X-Gm-Gg: AYBFou00cylmvwW5sZn1XnMNGDfZybXaYPgLI2fGZcTP9WIDhQhxuBmHqlgNggZUsdM
	izfP0HC14kp0WkncgPb/v3prtKPO1CiYLXhpiN//mrtSvrE42oriMm90mKOC9Rv2Fl87J8MJbu0
	04w6MtxGmeOKOiXRHNxrSBBWuURvRH1aJd6wOMmaXjXnZQRCbsmgOtcdsdIBOq0SeBObIIPRxNN
	9z9k9Ki9GPuSMovH0JZtESVIL0cfc3YVNfdFlMYMpXYBczVqUdkG+V+4F7VGKiUnepGkhPKvJyZ
	if/rKkvQfmuD/CHT58xeUVglhLtEabVVn+cVbXoqxKwsC15WBu63A0HVi6Qngr+wHFcve8hxp2L
	3XAurwH1XdSGvbTR8+BtvDBzmrwJpQDNE4llbyaJkhOzi2o3THiSRVW15uiqAoAPe25/k4ryL0v
	9BZ0fttLm/gWcPWDFTPGIqAzFJnX48HQaAxWP9i3v3ySxLoOjY1ffjwqLJdRJXSDmJWcfkwfCHJ
	xRIiHmTjY9nqwciHAQ2p11chvxAD9F7oYeVolnsekvG8erKEWk0qzpZd4kw/VR0vVqpH3gAx8l/
	daiHxwq8pwFz/ppDJL2NaKNAIu0rhquiQmURUVoe7JzSlSuElP4k7AvbXIAx2tlh
X-Received: by 2002:a17:902:d60e:b0:2dd:ad73:c98b with SMTP id d9443c01a7336-2eb3644fa20mr96025995ad.35.1793645999714;
        Mon, 02 Nov 2026 10:59:59 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm32087165ad.73.2026.11.02.10.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:59:58 -0800 (PST)
Date: Mon, 2 Nov 2026 18:59:55 +0000
From: David Matlack <dmatlack@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Alex Williamson <alex@shazbot.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH 3/3] KVM: selftests: Use VFIO selftests library to pick
 IOMMU mode in IRQ test
Message-ID: <aujdq2fsyt_xRGGV@google.com>
References: <20261029221710.1871112-1-dmatlack@google.com>
 <20261029221710.1871112-4-dmatlack@google.com>
 <auinpIEk6FdGwDS8@google.com>
 <auit0kVkAaWcNUvk@google.com>
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
In-Reply-To: <auit0kVkAaWcNUvk@google.com>

On 2026-11-02 07:35 AM, Sean Christopherson wrote:
> On Mon, Nov 02, 2026, Sean Christopherson wrote:
> > On Thu, Oct 29, 2026, David Matlack wrote:
> > >  static void help(const char *name)
> > >  {
> > >  	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type] [-v nr_vcpus] [-x]\n", name);
> > > @@ -266,8 +250,7 @@ int main(int argc, char **argv)
> > >  	}
> > >  
> > >  	if (device_bdf) {
> > > -		if (!iommu_type)
> > > -			iommu_type = probe_iommu_type();
> > > +		TEST_REQUIRE(iommu_mode_is_available(iommu_type));
> > 
> > This is very unhelpful when neither IOMMUFD nor VFIO is available, especially
> > why the user doesn't explicitly provide the desired mode:
> > 
> >   # ./irq_test -d 0000:6f:01.0 -i 10000
> >   Random seed: 0x79d386bd
> >   1..0 # SKIP - Requirement not met: iommu_mode_is_available(iommu_type)

Agreed, that is not very helpful. I've added a
iommu_mode_unavailable_msg() helper to libvfio, which returns the reason
a given mode (or any mode, if NULL) is not available. So irq_test would
have:

    __TEST_REQUIRE(iommu_mode_is_available(iommu_type), "%s",
               iommu_mode_unavailable_msg(iommu_type));

which gives:

  # ./irq_test -d 0000:01:00.0 -t iommufd
  1..0 # SKIP - IOMMU mode 'iommufd' is not available
  # ./irq_test -d 0000:01:00.0
  1..0 # SKIP - No IOMMU mode is available. Is VFIO (or IOMMUFD) loaded and enabled?

> Side topic, it would be nice if iommu_mode_lookup() printed out the known modes
> when this is hit:
> 
> 	VFIO_FAIL("Unrecognized IOMMU mode: %s\n", iommu_mode);

Will do in v2. And I will also use the same helper to print out the list
of known modes in irq_test -h.
