Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FFF3C0A10
	for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 22:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787006558; cv=none; b=LVJoTj6o7Ym6nqGr2g83lRi0KA38Rta3Y1MnMcG1rLtdUoEUgujHQ1Eb9UTEd7MzmzON2aCzDWzt16WsQ+Pvl5UgsojAhiE5YGM3x/OvIl8U99YdDok7u9Bg2bzZYtsTNe9KD960lVHOvm3+NafEi3BD4Sx25O+CDWj4+6/elUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787006558; c=relaxed/simple;
	bh=FuNV88XNhdg/KCJJbD5nToyPlj9YFC8j4Q/MsHmInqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z6kE3X38xIH610i4q4IFbuBtcQ8vY6XXKufoX1RABaruFLYGCZRAtPhn0xtwnAmVTFwGmQ7A5cMgbSYYPUpuCOGeB99/Lg1eqbIC0pIGg82WUwA4lTfy+yged9zlq5r+mOZfNOLTOR+/9/KwImnWJSKa7qjdL6L8WgnNeEnyenM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K235GxUR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K235GxUR"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso50530065e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 15:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787006555; x=1787611355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oAmbfwBAAjnfCUkjo5GeRKy1CTOwFpxCxG62IYGXyrg=;
        b=K235GxURVnm0J3cprUUUi+pRvkRP2RKd8OAmfYWViyOcEE/26gDXKscNOwCySZhaMW
         Vhhfvs/46tLXwo6zHnzVUPFyXDTJEY3+xyD3c1vORAhw70P7sCAaQT2a0Gb7rmejzG3h
         0MVYi3Qr+F2qmeqSQZBiEL8fB8gtaUzwhOkpZofwBmtGyH8nrf04m7qwVeLXuP/IKzKE
         Yyw4odOSHkp/9X2dm+qxhaDRiH374ZXsOkRZSw9pP6L1Ymk/ASwPDNa4FarLhS8A+000
         qyZdpyaITkjba6H5ETN4NYNVhRkuKWCxaNqqs9AJs0v2H20r+bDpKrKH2XsBKkgJu5mi
         xcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787006555; x=1787611355;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oAmbfwBAAjnfCUkjo5GeRKy1CTOwFpxCxG62IYGXyrg=;
        b=QdGg1ZM/B4fGBN5iJWFvAieLTRPI0j1qxdDiwM5d2/NH8MiUAZg5cNQybPBF60OVIC
         sVCUG43PWiQP9VroB7eK3EbpBsoy9F4xcNJsYPmGob//ZMqQX118nN+RIPAvRvRH9zBf
         FRQYtebDbqBM7HH8Mk3BLH03Q6aZ8bCcN+mFzwDqM+7CCGm8p6DusNiVhm+9FUy9ZIwU
         Zqan5LIIqnx6P0AHpAEsIy1MgZ6duPBr8Jjnu9BTlI+Ikj6Dmw4gbSiJ9aXAdUCCnuKp
         3e3t3gVNWHg3wEws9ePAGvRDHtkQjiayT9xXBSOKukvVji8L+y1LbO8hEGwH64V3d4kY
         vqQw==
X-Forwarded-Encrypted: i=1; AHgh+Ro4IL7k7eQW95tLFXTTsxhO6737ZDB0uGrQJKXlCzYQVBl64MF7K1W2/mGf0ERoGYLxCbdqM//Uml6IMyhy4pA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdjDYVWeEMPMzojEvEcnNEGq/RLUHUNpqo73noqBrZ5oQuyP94
	MGBHA3IdvNb4wmk63QLp4uv5GuN8mMb3cxhmWOobW6aQ2JJwQCXtFv5Z
X-Gm-Gg: AR+sD10Sfug8nglu4i8mZO5aJC2CAiAwBK+zhjZXFF/pIoREP9ha/9RjTF5TVbFGRkC
	x8gaA4YGuY1NAnMpM6IpYZJh+u0kjbK7+8tLp1/8MNC/N/QLy+q0KHcrn/8NvFJIBiI+6rOib3T
	5RxkBFmROgr8P9iiHbs1qqVE1txFKYNhp7/m+ilfVZX68SPO++mGY3HK5tad9DF9KugRE9OHJlH
	p9I2ChlDNNP1C4c3wS6rIXFoLejOJ1vw5aMaWdqnpgUmXXPamJm9vHtUmMqX7qdgNtM/elj4c+S
	LAspNMJLLM8tIHGV/yfldrjaqhMpML3Ae3MXgYqwWhNghe0iQiasxgDpdaOYzjuzeqT3wlRzS36
	+T1IrIfxqHSivxQaDxQLJYieXmMalOOM8jSsdmtePwldo6JM1i04p5G3Faae4Be/LG5YS8r5ZFB
	Dkjp/en3ZxQXAFOjI8EhKcU1P7j9odk7IxSqjtN7XtUYIZJPltS1rynTdbg/5wHjWUOcUh3knF3
	u8f7XLfQSMh0HFtqTj3ugQlDcaAJbur8gfrP7yt32/YqXC5lQL+bSilij+8puFnwe4=
X-Received: by 2002:a05:600c:871b:b0:499:8b00:5261 with SMTP id 5b1f17b1804b1-4998b0052cdmr426941915e9.8.1787006555013;
        Mon, 17 Aug 2026 15:42:35 -0700 (PDT)
Received: from ?IPV6:2407:d000:508:2027:2845:c930:d20a:3e10? ([2407:d000:508:2027:2845:c930:d20a:3e10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a315d3sm7356187f8f.6.2026.08.17.15.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 15:42:34 -0700 (PDT)
Message-ID: <8d069fe1-a5b6-4a86-9604-26aebe2dc243@gmail.com>
Date: Tue, 18 Aug 2026 03:42:31 +0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] KVM: selftests: Replace ulong with unsigned long
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260803170825.925561-4-hisamshar@gmail.com>
 <20260817220457.554823-3-hisamshar@gmail.com> <aoOKMeua-cNeTxXT@google.com>
Content-Language: en-US
From: Hisam Mehboob <hisamshar@gmail.com>
In-Reply-To: <aoOKMeua-cNeTxXT@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/18/26 03:24, Sean Christopherson wrote:
> On Tue, Aug 18, 2026, Hisam Mehboob wrote:
>> Gentle ping on this patch; it has been on the list since Aug 3 without
>> any comments.
> 
> Patience, please.  This is on my list of things to grab for 7.4.  You posted right
> at the end of a cycle, shortly before the merge window, and the code in question
> has existed for years, i.e. it didn't seem urgent enough to squeeze into 7.3.
> 
> If this is the very last thing needed to unblock musl builds of KVM selftests,
> than that changes things, but IIRC there are other "fix selftests builds with musl"
> patches floating around.

No, this isn't the last blocker. I verified with musl-gcc on x86_64:
with only this patch applied, the build still fails in steal_time.c on
pthread_attr_setaffinity_np() -- it also needs your task-pinning fix
("KVM: selftests: Use KVM's task pinning APIs in steal_time", which I
resent). With both applied, the musl build passes.

> 
>> The musl build failure it fixes is still present in current trees, and
>> the v1 feedback was addressed in this version. Could it be queued in
>> kvm-next?
>>
>> Thanks,
>> Hisam

