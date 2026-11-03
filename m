Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710188;
	b=OF9k8xnZF60Spg48nPD8jn6qEP31lyglyit/zkt2kk2uaBR2gH4t3plTlnocHbR1ou7B
	 2E6mAqrliQ+dpESHWpGYDe7EkYHEui+OgkhR9N6YXffeOthe0rded2Nrb7QuYdot3z8TV
	 lpkMSFyknQ/xLfgL0eE0XBn9Li+3hmWs5GmghqZ5z6XRrcaNmrMUagu24lg2UYw6GDS0T
	 aBSRIWOMdE+A/d9kw3Ul1FQKK02yFoO7Bi3S8VNL3Mr82hdrXt+cDPCWjpAIncsWQ0URq
	 hjDoDavCxC4sSxwnbIXRHoMjsSn118JoPgYVe8Xy1JDkHv3PJ0kw/wWz7l2WiuKtinw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710188;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=myuQnKOqiP9L07B+scEBOciTR/Sw8p8F06G+sEEbi1w=;
	b=tH9SY3jKMWxnIOIZeH4iZ/s3G0qOQPWh2dueFcoEtE9EnIkdaUjT3P8TY+2UHu0t0Ws1
	 sA3BqkgyZqX/QYz0QYgyar5wS5CYFix2qCcwqFKjbTS8iiC0HpqV0HIG1QaYq9Axa3TQz
	 sGP0ZumYpxZEYib8k5QDutiOPPKl2XZhRrllypeSobEVagcxpkgmSWR+R3T4wfn2rylnL
	 Bx/5gchzv9h1EEpoOwMjb4DGerRgvDu2cbPW8bH0rK/RGMg71lfqAAv4E2yDY0hnkmnbM
	 UAEg0fmBla9Z/6v+dTL3wk9CyaSDzprsjRNFudGrmQxq7k0GU71stDe+Yg/Dmy9pQbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FFqwHaIC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Xww7JLoQ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF217606D81F
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 12:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF217606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FFqwHaIC;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Xww7JLoQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793710186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=myuQnKOqiP9L07B+scEBOciTR/Sw8p8F06G+sEEbi1w=;
	b=FFqwHaICct7QSwW0MYlBXJYNLiSGf/Lkxoww3ILpHDpkKGKpDBSCblGXbBVA8Y+SEkiPrl
	kGRrGwZm4yuL5JGM3qNzIJnVEb+VI873zD5wh2aIv0X5Dxi6KTAwmB3Y+x/CeebebblUXE
	bUqSORcltwzLWtBAbjz7aG5VcVGMhzM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-h48p8gQbMzuhMfEbVBCDNA-1; Tue, 03 Nov 2026 07:49:45 -0500
X-MC-Unique: h48p8gQbMzuhMfEbVBCDNA-1
X-Mimecast-MFC-AGG-ID: h48p8gQbMzuhMfEbVBCDNA_1793710184
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a70b42bab0so8487645e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 04:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793710184; x=1794314984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=myuQnKOqiP9L07B+scEBOciTR/Sw8p8F06G+sEEbi1w=;
        b=Xww7JLoQMeMT0Huf7Hi/NXKYvB12byum4d8AkaunCDsvtr1fiQ6OU8UVKa4Weoujoe
         FVWcwa+A9Tjf4Ihz2OAgsjh0ML09t1+i4kArRCa2ToN2uggyc14m1PCQt889XeS+OmSd
         ylhDzvW+16k/Vq0RHhjZGT/YROWPzWlvBJZbihCllk9h/Nb3yhdAsMCPUeGWkwe3GL5T
         9T8TvmlavoTkgdQQNr3SWdszdiiKn/NgsiXiMVE99OuMETWEKVb7gBImpDeQcfSYbrMe
         PxBCukwxgkqG7fdGRY/ttjFpBOd/Oux5DnG9ehYzZWu4KSR4aQ0L6wwKGA9/sBGjXPV7
         2thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710184; x=1794314984;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=myuQnKOqiP9L07B+scEBOciTR/Sw8p8F06G+sEEbi1w=;
        b=X5iId6jm66aam+YwD1zCAiAZZdu4gCSD62ITk2lzf6SRPmZm34COSZIwyN3HbYl4kB
         TtpUlIpWhHjTnSZny9TatFI4kHTj2nt/F/qv3irlQm6CuNGUW/rrqnC9BmdtQWuR7VUH
         UgQaR5/tPlB228eSKU77WbWSimYA0uf7f5sQFP6YDSALt2kro7dTRVWRF0n1DM5441Lc
         DVJE1TK/nH/1GjEVcHsbsEfLnK1C9Q7/VDl1sjhFujWCk3iSqz0K6C3sVJjrVcN5Ah1m
         aKBjxa/3zhd8RlTyhXVbD/o8P6cSsqI1HN1UXqIEA4rsdoYncDqy3K0N2HKQLNk+624w
         xkug==
X-Forwarded-Encrypted: i=1; AKwUvBwDKmCuZ18PrI/BgOOgokjqokTIA+k547tgRxx6N/yIs4AltSi7zR61RLebu0DXdOgwdqL4R/6Tz2g1pT3TNgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tyfZEBRRfrbBiSj1woYIzoFlfipenD4E82c7gA+zATYHoWvxu
	lcxwFTbOSQjgu/rOki0Y3+CcvEnacBE2i78fiHYDRpOJUMwHbfERz0FT8u3pq8dMizzbnJOGm8h
	XVSoJIOQMBNDweQc74+vkfGFb1YVNaxeldfgUhc5hTrCioF9xFU3MOfbtrcxc57qNQ3xbENtEZX
	0U/u4o
X-Gm-Gg: AYBFou2ofWtI3ho9LsW+t5jBa0rCvM66kQD4ofyWjAACriCzbTaTjLzljWB9GfNK0xJ
	DReYBOOxpjom6ia8JyJT/abApSlH3WdWX/VSrxHn7Odhbkg4GJNgPbGOyMj1HgvaGeQY3LFBhSP
	w1KCbVfQqClUF00rJ71/Z3yTFXCvHMjlw16tW/cz+Rtq6WS6SevmtoQHYK97g1NCPlEBcMAkbqd
	FW/K69VTdOyiEtvP8wz3JC3Raj70aKa0jugpnDr51qZc1VzW8eIIJooOlZ1l2KZt4OB8vdpOVOK
	hed6stN6ANP/l5zbUw6PLd96p7iO2oOB1ZT3wwLXaUSC9nxiBVg0C6mib8D7ubPKBGtNAdRIiJU
	c51RdWkQNwEOGrauR1JJLXvoozWTwQdgQsaa0CsLwQJ6gKA==
X-Received: by 2002:a05:600c:848c:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4ac17a3628emr299087995e9.14.1793710183954;
        Tue, 03 Nov 2026 04:49:43 -0800 (PST)
X-Received: by 2002:a05:600c:848c:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4ac17a3628emr299087755e9.14.1793710183537;
        Tue, 03 Nov 2026 04:49:43 -0800 (PST)
Received: from [192.168.2.75] ([46.175.183.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm247611225e9.2.2026.11.03.04.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 04:49:41 -0800 (PST)
Message-ID: <cc1e3d99-a96f-4589-8541-5c8b9fb509b7@redhat.com>
Date: Tue, 3 Nov 2026 13:49:40 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 00/14] dpll: add a simulated DPLL device driver
Content-Language: en-US
To: Jiri Pirko <jiri@resnulli.us>
Cc: netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Ivan Vecera <ivecera@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261103093910.596225-1-poros@redhat.com>
 <aunT5wlkgVJ9xyTb@FV6GYCPJ69>
From: Petr Oros <poros@redhat.com>
In-Reply-To: <aunT5wlkgVJ9xyTb@FV6GYCPJ69>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/3/26 1:31 PM, Jiri Pirko wrote:
> Tue, Nov 03, 2026 at 10:38:56AM +0100, poros@redhat.com wrote:
>> The DPLL subsystem has no in-tree driver that can run without real
>> hardware, so core changes and userspace tooling are hard to exercise in
>> CI, and the pin-on-pin and reference sync paths see almost no coverage
>> outside the vendors' labs. This series adds dpllsim, a simulated DPLL
>> device driver, together with selftests that run against it.
>>
>> The driver is controlled through configfs, following gpio-sim. Writing a
> 
> Why not debugfs? Works good for netdevsim.
> 

I did consider debugfs, but it does not fit what the simulator
needs. The key difference is who creates the objects. In debugfs the
kernel builds the directory tree and userspace can only read and
write the files in it; there is no mkdir or rmdir. In configfs
userspace creates and removes the items itself, which is exactly
what dpllsim is about: you mkdir a device, mkdir its pins, set a few
attributes and flip it live. configfs also gives me
configfs_depend_item(), so a pin cannot be removed under a live
device. Doing the same over debugfs would mean inventing a little
command language in a couple of files and parsing it in the driver,
plus handling object lifetimes by hand.

netdevsim gets away with debugfs because it creates devices through
a sysfs bus file and debugfs only carries knobs on top of the object
model devlink already has. DPLL has no equivalent, there is no
netlink command to create a device. gpio-sim went through the same
decision and ended up on configfs as the replacement for the module
parameter and debugfs based gpio-mockup; usb gadget, pci-epf and the
target subsystem use it for the same purpose.

> [..]

