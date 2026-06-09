Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6021D40BCBB
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 12:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006595; cv=none; b=sU2BEC1C6+umJ/CFcwLn1dIsPdK++Sb/x9YSRHFhAauQ2tZiZoichdnz4oo+RDLx5UG6Hz3DuthCN53p2gExCRPjen7bIMcTQZ/Za+TLfoy2bJrT6oSrU5Ox9iSG3ZNaB9s1QYG4vuDmzKJJ6S6iWh7efpJKTvuBH1njImzsQ2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006595; c=relaxed/simple;
	bh=KYOKqzvxVdLkyqmcf60b2kuYcjBVPIadLaEpXbLdVdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMs7HAgXKCu5K4xBquM950CSMG5r6mdonpIdNS39xHYS3Kzov/MRkm3zUc2ExNIb9YSE9lBE8tyoXsTib1rfm1pThzAMVfBrB6ChnCQ0sCMPq0YUpHhbp0RO8Lc2REFm1wg18im0iwh1NHc6/CoQ05UIVmExtRYj0kHFas0A9Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KNF3HzKS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tlfhyqQW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KNF3HzKS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tlfhyqQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781006593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u6DWBXCgC9aNmxDed7yrblpTHxFgCcNoc2g5n3N4dOo=;
	b=KNF3HzKSuuSTnGKvN1G7Hc7OXy8VmINhOo2qlPjJPrP6O222wiOt1vCUfYxLP3zLYIDz5H
	e9nMGUqWdtiEa6ui54sDLI7X4Ayq0bonB7+1JV4BBKsundg57bsy1v28NFvBOnVkvv3f0n
	VAJoTqpQC/3WmMzFoLgX/DzCT0WIHcE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-plOmt2boNmSP2xA7TMNJ3w-1; Tue, 09 Jun 2026 08:03:12 -0400
X-MC-Unique: plOmt2boNmSP2xA7TMNJ3w-1
X-Mimecast-MFC-AGG-ID: plOmt2boNmSP2xA7TMNJ3w_1781006591
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490a060eb84so35724965e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 05:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781006591; x=1781611391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u6DWBXCgC9aNmxDed7yrblpTHxFgCcNoc2g5n3N4dOo=;
        b=tlfhyqQWgfBLsrnYXzEPzFm1+hWn6NRBk2wRtmGLmwrwHi2A5ud36FrGLjmdkmCc7t
         YLnMQtyKh1mSsZMuI1ENK6tf+itPvRW332Ln43HWTOvPntR2lsJLydAC0Od5kLsd02qs
         Caa1bm2oEF/w0JhvzxqTjblWktq1XktegFrGTeEzVYfp5pgHg6uY4OAVR4W+GadHpnUz
         laoVfV/XueNMKMbi4TEjKzW2XeCfbey55jil9RfHEzt1QREvb8EOLBLmYCW8v5s80BDc
         XRQg7qErpNAR67HvN36wMBMUFJgpfIWtLEBwuLCQj4WpWICBZ8MKdaNYOQHrKEvfFQgG
         EaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781006591; x=1781611391;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6DWBXCgC9aNmxDed7yrblpTHxFgCcNoc2g5n3N4dOo=;
        b=fFp2IjaD69exJkcTa3Ogvfkdw0Knk6NeDLHDmVgrCsAMVw5UHvWkw5ikz8AZOHYTiH
         4/O2P/86zDBOA9Q5yyoebsvDnGoUvrAklLEdlKf/M87HNGeNY6wGfo8xuu0m7nBqwUer
         iwkiBmqejbovNPcNrsuPUT2+E+CT1dP1BYXDWZjw+0YOZgSKJOf47PHwDskiBBiLVYjD
         9L+knyZ3E/3dNOn7rj+d/NA6bR4Ah89vRrEBA1vL47sYQiFmssyuhNzagQfZ38LLlUfC
         QXAo2+faUj8TcGwixgBFn/b93Bbts8H5AVbZKl2E2SHYoM4obhkQaZDN71EnoflOGhmc
         wNhA==
X-Forwarded-Encrypted: i=1; AFNElJ9NkuwJ8n+j0IjIBHp455g7dMsJQcgKwPrArWPe5pQEvqgrBX8yUfWOVCIeoKl9Dl0ek7wAJih/DY6WjSJhqZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuHxFVFKS8UeD42x5M85oqIkL45rWj7+xcMcb2ig9mlw5wCuLX
	NT1+erS+MiPGh3ZYo3ssck1FWv/XU4tGU4R6lq+1p/1Ake97MdoB+kMOxaENgpxBciNuOkEfIW9
	KaCl6A830X6hZpgvT6yaQPQc+npkbVfnm99VYBlxJMBXSSXAtUrabGoZLjLjTuUByeC/12A==
X-Gm-Gg: Acq92OGQtGd9eqaBGDTbGtRZKEeiBuWaoh0QhR/M7CQ1fR3dnSE4Pzp4NGbhgFCA9UP
	GWOe2TNwKvEDPgKSb/ADKgGDBAJIFbFep3qget3Vguuf2EcNptwhcQ3Oa0EMULO7YEojH9duuqe
	C7gq8Jg2oszrNfAHYrncTDzDJeMcYAxjHHJmP5agFlwMbuWDvflDaamJO6EDAiKRWT4B+pyJcVv
	4b56gwx6WMn7DzDxr435fMcst++a/oj5WeLs0J2w5vm9AKFanWYsUTVU0DeGYWjBooU7JJhjcz1
	xckxMZwndNJNIqp38z8RykGJYZ5Zq1w1LeqUnO7JPGcMMzdfZCRfgWUbP27Kh6QA3HjLbY+k3fO
	pLyDyy94YRmKJLqkM5NtbXGAISv7DQ1xgX7l7wFVclcj9nKLGRIaA6tCtBH/OP0FJPA==
X-Received: by 2002:a05:600c:45c6:b0:490:b9fe:e64d with SMTP id 5b1f17b1804b1-490c2612b7fmr333238065e9.23.1781006590823;
        Tue, 09 Jun 2026 05:03:10 -0700 (PDT)
X-Received: by 2002:a05:600c:45c6:b0:490:b9fe:e64d with SMTP id 5b1f17b1804b1-490c2612b7fmr333237345e9.23.1781006590316;
        Tue, 09 Jun 2026 05:03:10 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm314279195e9.2.2026.06.09.05.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:03:09 -0700 (PDT)
Message-ID: <c04cc47a-c27f-4267-97c7-fafb80639f5e@redhat.com>
Date: Tue, 9 Jun 2026 14:03:07 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 2/2] selftests: net: add local ECMP rehash
 test
To: Neil Spring <ntspring@meta.com>, netdev@vger.kernel.org
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, dsahern@kernel.org, horms@kernel.org,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 martin.lau@linux.dev, daniel@iogearbox.net
References: <20260604212246.265079-1-ntspring@meta.com>
 <20260604212246.265079-3-ntspring@meta.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260604212246.265079-3-ntspring@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/4/26 11:22 PM, Neil Spring wrote:
> +test_ecmp_midstream_rehash()
> +{
> +	RET=0
> +	local port=$((PORT + 1))
> +
> +	local fail_reason
> +	fail_reason=$(ecmp_midstream_rehash_attempt "$port")
Shellcheck complains for the above:

+	if [ $? -ne 0 ]; then
+             ^-- SC2181 (style): Check exit code directly with e.g. 'if
! mycmd;', not indirectly with $?.
+

Eiter disable the check or use:

	if fail_reason=$(ecmp_midstream_rehash_attempt "$port"); then

/P

