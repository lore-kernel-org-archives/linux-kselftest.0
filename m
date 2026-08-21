Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0DD47ECF6
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 13:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787318836; cv=none; b=p8UCm40oxr12KBYDVz4OZ4Fv3gZmf1SLBxXvj/W42e118hvTljmtLazsTXVwnGogvVnFUnOz8o+ApYfIKH+jwVP9SEfl5NYsbVHN1bcfuMNcb/6HRrTGHKsIhpyQ56BEyr6TQKZvy1VwifpAWn3nU4WU/WVzAnlUt6aj+VVNX08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787318836; c=relaxed/simple;
	bh=5klepE7p4Hg1qEAbCF6RZZu8Pu13Alz4PVZPELP3bS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XUXFFrL3+AAFNxKTrRIEcar9dJZRWRH3abevSZB+aofDuT6+N5P/9TrgVjXQb5GmpL3A/zR2XsCi86fDamMFd83qeMc1ktkL/WaPNXtole1VIAk6fUbn6RtNjLOWhHJVX4VyGh9YbhXagAPq+N3HpR8PXISD/fqR4Dh7Km65q+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uuvg/Hmf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uuvg/Hmf"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so681723f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 06:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787318830; x=1787923630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93TKIYVELb3f7XMDYi0bAF+lcotYrliPfpYhNsdjWuM=;
        b=Uuvg/HmfdhudG2I4OkIcuqi0ihof2HdqZeKDbGqe4K7rtcg/jZuIV+5wtYUtm0VrSH
         Few3nfouzm529EJIoWKAZkfHTZqnlZMbKqV/0+rsqABiJzOoVNqBeLXHgmY86Hint+xo
         aRcqJVH2GGtDgvuKIo0xtdXWOM6rA6CBJ+JSOPugVTPwXrXN8CwNstu7nCpwr/O83XcM
         XMdTD5c4+ruoXBOHgQeS+DZ14vYPUBia9mBAlPrrdJjoWtkbbeuwnU+GbMFukPsoOE/h
         WElOgELVgPVCokpRqEMCO7y9F1QUYCx8hHaSyNvmDeu7WNquADXA3oF0H9canxnKrYeT
         QDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787318830; x=1787923630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93TKIYVELb3f7XMDYi0bAF+lcotYrliPfpYhNsdjWuM=;
        b=dGhkcppMTfE5KeXmdCRG9yh7K7MouF191/q2fRezNOc+E9O+lt7wZGJoyTXhyw77u4
         wJeRmpJkqrJhpKdjYUrvIrvdV2AbpC6tO0Ec3uGfDBJZri5pKpTDxlJJ7DVp5y287JIU
         RQYGsih1WoOhkLfGjffI1Hsy5KZ288EzFr+l4uuoB4CtO195BXcnd97td3kzncGlEF+W
         lUFqk3B4f6vVhve0T6gfjt4gRi/NfrzczKGacTex5XSOFsWf780x+M2Ih3l63SWEyyHa
         J86WigGyda7HF5DpiEGdhaM1skAruz9V75KHRCANeHGhSwRvy3ZBrC9I4wLGRlNpX0f/
         rmhg==
X-Forwarded-Encrypted: i=1; AHgh+Rp89T189daX4Fi+uySmrU+zIGUhPM9+tsKfrJvaFuzwoHA9AlbRz5gs0QSTaU5hJEjHju5fQek1E9G4N6QzHH4=@vger.kernel.org
X-Gm-Message-State: AFuF++lZAtbKu3VIA6p4pSpvGKZblbvq/ExZeYg5/e66YT9YyD6S5UIT
	ADSsiM0RM2ZMOAqq7D5E/rGfCi2+RGbiOzzz733i0TiwrStwIMUjhN3l
X-Gm-Gg: AR+sD11Qmq8Atc4U1/LQO9BxG6T0Wanfh5teFO6lv5TObqLcytVvUY97LdnkTtoGzqz
	NQEc+JJX088JRQlZuQ6YFAS+KCtHoYPruT56xpzRU4mHJScV6OQrWQ0ECOdGlbuvfXUJbFuOwXp
	v57mqm180duaXUM3g+9jgc0QDxvejCrxEwg9ZQoPRzk5Mue1iwIO2dfeb7plfmGkBzKZ7qTfzI1
	hcOxUUZ+nV3I5jJrW/ytoXrS0KKdeKfLtzV2LpDc49oCdlRJCNxrJMJevghubX7aTixEYj92xJM
	qJUh92vG5UccBX+288E92/qBumsInJr3oBww+JSQ+SL9cQQ80kft89R0gVbXAnO1KnLuUiHC0wp
	8naDMFUPWhwvzeA48cKI+Z7gpaEnhwNRoN4ArdY3TuiB1QOD/9s5eMsZRP3AA9Ry9T6lWPq/gmY
	nC9CzFcHAEwiMGkIN3K/80K2OjeSYEk1EASa8LGqsFYmNMzV01UMzqLRHddjVGa3XSVTDwBzMHV
	1ycbA==
X-Received: by 2002:a05:6000:41dc:b0:482:aa2a:52f6 with SMTP id ffacd0b85a97d-482c0b41f95mr10002245f8f.1.1787318830006;
        Fri, 21 Aug 2026 06:27:10 -0700 (PDT)
Received: from [10.45.28.226] ([15.248.2.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482bf82594esm3408856f8f.29.2026.08.21.06.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 06:27:09 -0700 (PDT)
Message-ID: <12442106-e756-4902-b9fd-c760da04f849@gmail.com>
Date: Fri, 21 Aug 2026 14:27:08 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] KVM: arm64: Add pre_fault_memory implementation
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com,
 joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 shuah@kernel.org, corbet@lwn.net, vladimir.murzin@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 isaku.yamahata@intel.com, Jack Thomson <jackabt@amazon.com>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com>
 <20260612162354.73378-3-jackabt.amazon@gmail.com> <ak5sAxb3G6hhFmBF@raptor>
 <alEXGmKiXgWPPdhF@raptor>
Content-Language: en-US
From: "Thomson, Jack" <jackabt.amazon@gmail.com>
In-Reply-To: <alEXGmKiXgWPPdhF@raptor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Alex,

On 10/07/2026 5:00 pm, Alexandru Elisei wrote:
>> Does it guarantee that, after it completes and returns to userspace, the
>> address range [gpa, gpa + size] is mapped in the VM's stage 2 tables? Or
>> does it guarantee that the address range was mapped at stage 2 at some
>> point during the ioctl's execution, but parts, or all of it, might not be
>> mapped after the ioctl completes and returns to userspace?
> 
> Nevermind, spend some time thinking about it and it turns out it's
> impossible for KVM to guarantee that the memory is still mapped after the
> ioctls returns.  So I answered my own question, thanks.
> 
> Alex
> 

Yeah it's best effort, as if a vCPU had faulted the range itself. This
could be undone by an invalidation or memslot update. The value is in
the common cast (for us, post-copy migration) the guest doesn't pay the
stage-2 fault fault cost at run time.

I think it would be worth me adding a sentence to the documentation
noting there is no persistance guarentee.

-- 
Thanks,
Jack
