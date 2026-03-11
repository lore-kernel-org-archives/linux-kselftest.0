Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9217A3CEB8A
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 10:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773225114; cv=none; b=urcPScLNit8CJQIAA19NsaQQaGST9Z1gkm6H/eZIydxpS/mFg18t5P6HhzcJ1qu+hqsyw2J656Cm87fIXts2elq+duetId1wD7I/KmEicv82E6CM/piOJSPsJllnVl9mM1mmxKyreD7L2WvajbwPnr0jcd8zWp7gKYh93AqB89k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773225114; c=relaxed/simple;
	bh=ySocSFrHgMZCuNx6RNYRgifMhoOZAZxfxZHX3fAUf9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B1cmvm8ehYN68P2QugX9Vo2CWnTxmmA3WVAOUuNZCMHHKGkwnozrsLA+Nvu8jqXS7FEMOQU8KyazG6sa71kGQDfhsLL58P3ba2hvehZLlnKxRK/xvj55M9RX41Yq7iK0cyCBKa05N9ymPYAlmBen3uPmMrHn7txBNdVbygm2rvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R9pfRRDL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=I6ACSZYh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R9pfRRDL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="I6ACSZYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773225111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4k7qkLfO0zvJghANa0uRNiBLEsBgn/V1IaIH7gW/As4=;
	b=R9pfRRDL+GXuY/i0Aq2nj8TGw/v+ksWfGrfJLEnrhgFZ9nUd8Z1Du+0HCVODSn6oK3vY2E
	UxOFJZTu8E7VUN3Zq+BY9d7qWTCQdwonBGeJxXY6maB3UyNYeWBNSYMOw4YxYH8JW8X1Tn
	VhpCaqcVJOOacwbwodfp0cfdWQ4ewPE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-B-NP-4jsNfCMTaCmzJVKbg-1; Wed, 11 Mar 2026 06:31:50 -0400
X-MC-Unique: B-NP-4jsNfCMTaCmzJVKbg-1
X-Mimecast-MFC-AGG-ID: B-NP-4jsNfCMTaCmzJVKbg_1773225109
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-439b5511d5aso9179684f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 03:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773225109; x=1773829909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4k7qkLfO0zvJghANa0uRNiBLEsBgn/V1IaIH7gW/As4=;
        b=I6ACSZYhijlQt83rsY8WVilK2oi/j4Uv/J1pO8QF802O/K34XNFamo+HrCtjeNA6ml
         U05bXH9I/p31SK+bbqfE5zKy2JtHREVs9jGvrdzfX+SmGSdzE1lqwn+mP4JitEZq4EJH
         LGdbmQFSQSXQLypaTln5Fgm08GCnz0PndIusxU9FXNzQIW7U2xLfoOcZnVU+Wd74hTLC
         5ibFw14KuDy+V9UkYlVv9WN8Lj+UKnBJg7V44lvXZo8d5LO3vZJT6Ttv8XtOdJpzyK80
         odOIlJf8EcnH2I10X7i8gcYsq5EIp7v+JDbHkB3Cyq5JsvnR9nTCHA8mZOMtnUjPUgTs
         /xEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773225109; x=1773829909;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4k7qkLfO0zvJghANa0uRNiBLEsBgn/V1IaIH7gW/As4=;
        b=i+DMDqRW7O7hhsFnX/n+SagacSddcA/etm3RLreDRwNKgZGDYjuIu3iFbbq/IkHHKE
         IAtI804lByKepZJtYeexFDOPovx4gQFuzDBEQmeEXnUdZpF7q5kQPBHlrL9WA0PW2LMu
         k9FY3dBUsqsK0pMONhfEfZc+Lz21pm51z7IU5cVEDfVt1kM48PYWFe8RxeOqPaSE1HH4
         sw1NMuHW7l4BEjXOssmRUhv0ytQNCAhwnxiJYkjftB9X/Yc+b1Wz6jxMrrwNiC7RIG/Y
         tB3fqdI3MhdhBCEAkpdk3Hb96oI+yh9Fh+Qwcplb5zsd900qPJsApOpeIY16SmQrn8ci
         scFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDUx3FlU6OpQX/MZwOE1Pvjgly7I/oFocRYj10ejwHOu7ImyW8l095K8djPG7mwsli+7UCpH04TkCf68219EA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCJXoaaea09aANKcOAjh5LsKmTXE5CsurOBMypV0H9FlvyIR+N
	FkvvZUvXTm5wB/ardWvyuELYhPVnX1ZQOc4RpF10OzkxXReru/mGfMahBhI00FM3fuHGDGAruYF
	aD0uCz4iKsBaERWDswtflFjE/t/8HTZfdeJSgLOvo3119xIswq6+bbEyJ6ySS6G3K8Wi9
X-Gm-Gg: ATEYQzy/E1Ay1JL/+uZsh5F1hC5vgrzVEOdNLgqbSqUFy3dTXLozAI1Iusn7c1HweLo
	5zTADxYR+QoBSTHwBM94TSPxv1CDCCDedj4/lEQCdhAgflzMGXKHlVCP2Dcwu4aqqHa6+4KHONX
	WVod97swunlcmIUS/cAxKw8b75e2HcDye3aPCLNEpOf2Ltg0Qoec4BNE8PyrBEgjkNJRMlENx6j
	LADC/PijwFcIaDt3H4hT+wy7nzb9YgegEdfyhel885vWKI9l6AMXTN8oLlRbbWlnPlyulbW3ybT
	ZV4fdJGIObvLNyzPN3PBh35vgzkc6+neEzcbp+lD/SLnFLP8Gi07YzSuEjpOlzDMzaacipIMEBG
	q1z4UGKE54rhLGUrB/Q9JYIlmO0fnNIVc9vhRs1wP7bUt0rs7CoqssDO6
X-Received: by 2002:a5d:5d01:0:b0:439:b114:60c0 with SMTP id ffacd0b85a97d-439f8206d54mr4051669f8f.35.1773225109220;
        Wed, 11 Mar 2026 03:31:49 -0700 (PDT)
X-Received: by 2002:a5d:5d01:0:b0:439:b114:60c0 with SMTP id ffacd0b85a97d-439f8206d54mr4051611f8f.35.1773225108761;
        Wed, 11 Mar 2026 03:31:48 -0700 (PDT)
Received: from [192.168.0.135] (185-219-167-205-static.vivo.cz. [185.219.167.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d5eesm6695370f8f.1.2026.03.11.03.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 03:31:48 -0700 (PDT)
Message-ID: <25faef0f-7943-4c0b-97e4-4a3a45895e25@redhat.com>
Date: Wed, 11 Mar 2026 11:31:47 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] selftests/bpf: Skip bpffs debug iter checks when
 unavailable in test_bpffs
To: sun jian <sun.jian.kdev@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman
 <eddyz87@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
References: <20260310102145.857810-1-sun.jian.kdev@gmail.com>
 <20260310102145.857810-2-sun.jian.kdev@gmail.com>
 <f0d1eb34-2d6a-487a-b486-3dc64c25df6c@redhat.com>
 <CABFUUZFQfoVRJ6HJqadHhWNj4FVOk=snuSmuEepMD6jZfyrpJQ@mail.gmail.com>
From: Viktor Malik <vmalik@redhat.com>
Content-Language: en-US
In-Reply-To: <CABFUUZFQfoVRJ6HJqadHhWNj4FVOk=snuSmuEepMD6jZfyrpJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/11/26 08:55, sun jian wrote:
> On Tue, Mar 10, 2026 at 8:32 PM Viktor Malik <vmalik@redhat.com> wrote:
>>
>> I don't think this is a good approach as it will mask genuine bugs that
>> would cause the files to be missing/inaccessible with one of the above
>> error codes.
>>
> Hi Viktor，
> 
> I don't think this change masks bugs in a silent way. It prints an explicit
> INFO line when maps.debug/progs.debug are unavailable due to
> EPERM/EACCES/ENOENT, and it still fails on other errors or unexpected
> iterator output.

Yeah but automatic CI doesn't care about INFO lines. It cares about
pass/fail status and in this case, the test could falsely appear as
passing, even though there's a bug in bpffs code causing the files not
to exist or have wrong permissions.

>> If you really need to execute the rest of the test cases in the file,
>> how about you split the test into subtests and then just add the failing
>> subtest to your DENYLIST?
> 
> Proper subtests  would require reworking the current fork-based flow to
> report SKIP/FAIL to the harness, which would be a larger refactor than
> intended here.

I don't think it would be such a big refactoring. You can still use
fork(), you just need to have separate `run` functions for different
subtests. True, the init/teardown phase would be somewhat duplicated but
I wouldn't see that as a big issue (and you can still factor it out).

> My goal is to keep this as a minimal change while still achieving the main
> purpose of this test: exercising the core bpffs operations (pinning and
> renameat2 semantics), which are independent of the debug iterator files,
> and clearly reporting when the iterator checks couldn't be performed.

That's exactly what subtests are for, at least in my view. You want to
check independent operations, you create a separate subtest for each.
That way, you can filter out some subtests if they don't pass in your
environment.

