Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633748;
	b=xje5wvehQHja/L4DXxH7NaS/4ChebDzMF1kRVtsJ+Jw7x0KGFuPMA4+70vT9ZlRrNSnj
	 jNnO8/yRXhm2+HQJ46jEQjUNsTSM4AJ7QxCu2o9S/InqLtko3u4mIDuAQ45EJG/JYVSt2
	 IR4U/GfaxlWM4UZDjhYQKGKmTxZ9TFe7rDFTWqiIF2NMTZsHr7OJ4Gr3yvv7eWEZwtP1/
	 cubTievfjw9SwYvQ0kFKbt4wcORA+0vT69q7FSkoXltFEY8Klknm3fZS7euyKFfZstuAo
	 b1upyF/r2oaPfDatSEq9bHNC+7b8u6O6iWNR8XCh5u9/q6jltBtWAB7m3ACywPFZVwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=uTBY7+w3GJYj4zEYkLCYx6G9HqVrLIEyic17+kRkINY=;
	b=SrdQTGes+36hm/IldZAT24faiplOZC3NvesteapdLu4GFQd/9IAqWUMW8Xc5TjaLv+ge
	 sm+FKOXHOGXfC7HDuOtB8UXzWTLujxTZuQl40GtFxHQb+UTy3ulT1n/oqDH880ail5H1n
	 7g466Uj0NEzJ+T3dPpGLwTFDYZG6EHBOnjYRTczPZTQpZSa//2YmQ9+4bX77XtkX37AGp
	 Ampc0XWCbtx1T9kUXkUFPkRzepA79AXUakc9UqnmaunNmPPs1QaACIjt0FMa4Umqo+FLv
	 xzxurDs+5YEEtyK5YIlyijUqWfeCOLkeTg2eEF277N/kGdCrx9mlUEJvK28rXRCb/Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BlmVTSs6;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE3660A1890
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 15:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFE3660A1890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BlmVTSs6
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7e92f36f9so2368627a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 07:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633747; x=1794238547; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTBY7+w3GJYj4zEYkLCYx6G9HqVrLIEyic17+kRkINY=;
        b=BlmVTSs6+8o5sfMbktnXRJo79MWSCnhJCKAoKhAbRQ8bSIpJFiwulmzOLhAWahp646
         BsnUOI4d6ANJJUu+YsiQN3+st++LgVoVRAjB67Q2gUzV+X6JB1BzEuMmyChazFLbIJwm
         +1tXtAr5r3ZPNL/UA3s/L9d/8C/OCoBFw3B2S/Rx092lPvMJjvkrSCwoQHtYk3BaQy7r
         LvT4HBuvfbEJC8sDDzCbuieOV0pAJ5ck/XnXONH948n65c6oj70iWGTC19BI5BLf6RPL
         iFel2n5OR68U7V2FfaNuWr9KY4HZE2Ig3R7yKM8ckCNkvNZS2/4uPzjqLofCaZc6J2D6
         nJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633747; x=1794238547;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTBY7+w3GJYj4zEYkLCYx6G9HqVrLIEyic17+kRkINY=;
        b=2xw2kV2S56xeRcaO8q9ADCfSe2Ok9loxGW8suZcP4D96tsNAs/pWaFCPQZSvHzVqAu
         1cmX/UWp8ofu7EMFQUCPdjxVyC3XpPQVMkF/7YgMdCxL3L16m39YaQMsdefZq0BGQ2iA
         w7ZTGqzPD7g9IPfacBaKiUNUWO0gKmknVB3tRqHQvyxPnpraPiw8pcsC9eEwwJKWOcPz
         VfAvmWNE4evTvHJl+P8LsRprLjkR8c2oSXqVCHdmyqebqvvu+McyBmXAg9nevQUj1Pe0
         G/RG+liBaiCTk6eLVO1FLXO6VdlxKefggdkUBJSRDGoXvNtOwU3hKXiAzIVU/uweJOvb
         z2Lw==
X-Forwarded-Encrypted: i=1; AKwUvBygF0+fA6QhbUxz9ymyp7+mnhhsioq2PKzhAoE9m85/ltQ4Vg+9bdxmHVOmIL+jKBPR4riXaFKhB5syi0pn0nk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuRhpA8RsNcJD2oy4UUzsk8OrwatxdYWYMrJulUT2pCHu5AjXS
	uWD4m89IUUQMtaKgyKVHu3faaLOlIowRwvxPzBh6KQvFYONChCriqQsgEt8p/HhOUourx06Lyc8
	eTayAng==
X-Received: from pgdo12-n2.prod.google.com ([2002:a05:6a02:620c:20b0:cc7:e6a9:8fe1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9185:b0:3e2:6ee4:a751
 with SMTP id adf61e73a8af0-3e928a5a7e7mr9816324637.60.1793633746886; Mon, 02
 Nov 2026 07:35:46 -0800 (PST)
Date: Mon, 2 Nov 2026 07:35:46 -0800
In-Reply-To: <auinpIEk6FdGwDS8@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029221710.1871112-1-dmatlack@google.com> <20261029221710.1871112-4-dmatlack@google.com>
 <auinpIEk6FdGwDS8@google.com>
Message-ID: <auit0kVkAaWcNUvk@google.com>
Subject: Re: [PATCH 3/3] KVM: selftests: Use VFIO selftests library to pick
 IOMMU mode in IRQ test
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Alex Williamson <alex@shazbot.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Mon, Nov 02, 2026, Sean Christopherson wrote:
> On Thu, Oct 29, 2026, David Matlack wrote:
> >  static void help(const char *name)
> >  {
> >  	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type] [-v nr_vcpus] [-x]\n", name);
> > @@ -266,8 +250,7 @@ int main(int argc, char **argv)
> >  	}
> >  
> >  	if (device_bdf) {
> > -		if (!iommu_type)
> > -			iommu_type = probe_iommu_type();
> > +		TEST_REQUIRE(iommu_mode_is_available(iommu_type));
> 
> This is very unhelpful when neither IOMMUFD nor VFIO is available, especially
> why the user doesn't explicitly provide the desired mode:
> 
>   # ./irq_test -d 0000:6f:01.0 -i 10000
>   Random seed: 0x79d386bd
>   1..0 # SKIP - Requirement not met: iommu_mode_is_available(iommu_type)
> 
> I helped write the test and I had to go read the code to figure out what iommu_type
> would be, and then read the VFIO library to see how it reacted to a NULL pointer.
> 
> How about something like this as fixup:
> 
> diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
> index f9c11d80a306..63205afc04d1 100644
> --- a/tools/testing/selftests/kvm/irq_test.c
> +++ b/tools/testing/selftests/kvm/irq_test.c
> @@ -250,7 +250,9 @@ int main(int argc, char **argv)
>  	}
>  
>  	if (device_bdf) {
> -		TEST_REQUIRE(iommu_mode_is_available(iommu_type));
> +		__TEST_REQUIRE(iommu_mode_is_available(iommu_type),
> +			       "IOMMU mode(s) '%s' not available",
> +			       iommu_type ? iommu_type : "IOMMU and/or VFIO");
>  		iommu = iommu_init(iommu_type);
>  		device = vfio_pci_device_init(device_bdf, iommu);
>  		msix = vfio_setup_msi(device);
> 
> to yield:
> 
>   # ./irq_test -d 0000:6f:01.0 -i 10000 -t vfio_type1_iommu
>   Random seed: 0x14e21328
>   1..0 # SKIP - IOMMU mode(s) 'vfio_type1_iommu' not available
>   # ./irq_test -d 0000:6f:01.0 -i 10000
>   Random seed: 0x160225ae
>   1..0 # SKIP - IOMMU mode(s) 'IOMMU and/or VFIO' not available

Side topic, it would be nice if iommu_mode_lookup() printed out the known modes
when this is hit:

	VFIO_FAIL("Unrecognized IOMMU mode: %s\n", iommu_mode);
