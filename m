Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776991;
	b=fY9zP65lmJ7XpBnOxpQhsnRa6grya1VcBluKhpK5RQcsi4wwsu4q1UbbrkGspL/iP80t
	 KEdiXqXxkrCjZAtqo2lv6eCH5sNk1d/Pryw2X8XvUmLa0Er/dtVsEWaZzn5kssJnDpFAI
	 iSj9vq/oigkCjypdDYZNsPWJuPDtsD3Urn1Fvb6PE8Bk04xs2XEV5rkPL6VmfYyawlKxY
	 4BkO97E13yHEx14JMdLIi0Nif5rEJC5nXJrbIdUVY9+HzIR4pPV4ZB/SKwbHdBoPBmhxx
	 Wkmd7NegY9bSIZivyc8wVw/hKtUGu/ulowQocZUCF9foXxkK1IxvIYYN+l0gKsvMjKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1P9jh/3dNVPHo3/JRb6QOjFyR52ByPWaY+Xbs/2Psnw=;
	b=ISHERAJOCurazy4304mTepvGUIRJnbDvyyVY4t2JqXHZXn1SVyX8zQnFA5H2igkWubl0
	 hQDSGLMxR8INmO53LWxqDkNqFXC3w7+HpXUfeCmxobiv22AHr/MBIDNQEl2MS+0MLHCmt
	 vsx1v4EjN5RgGBeEK/fLTaBClkPbU7LWYCPZUGS47Eiv6/PoqONdELPh8AdioAHt4RRIG
	 mEyqkEUPWjISY+OA5OkEU6sUxWhCx5jDd47rGvLW/8AsVZ3uCD4wZ/U9zeEk41I9LMTWl
	 eQMQb6k+VzNRBmkdH06Up97+l7OIagwFs5eADqCLg9gHtRBgxLelDUyClPlE5DqKRhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dyb5RJbM;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95553606A698
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 10:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95553606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dyb5RJbM
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso25589255e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 02:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795776990; x=1796381790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1P9jh/3dNVPHo3/JRb6QOjFyR52ByPWaY+Xbs/2Psnw=;
        b=dyb5RJbMSTNIthJgsi/N2ySzW1R3mcY+ZvZe6M9AuUMbmlx2TUCqkrG2xu3erNO2t+
         Qoj9vIYm2Fdngl22sNhHrSlriisnh2LFEUQqXdYF6mSfhVxPdTknYvcBiynXMFaSR+wG
         WnCOHJTLxU8GWrIjotHjCKr0AWZuFkiFCDMF98GVoeoJyg2WPjK6644T4whLKPa3QPV0
         VFP1nA5/mud1GwPgrX7H1aMp2ftpoQlR1vr3Jj0gbxdP2IX1nO5tLsBKPIcxsGi98L8N
         WBKsN0ILSfkYkl0WsTMR2/rxCZqw4WtQ988KHlu8QZXS6aLMpHItXNprbyyTSPNXrAp4
         6tZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776990; x=1796381790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1P9jh/3dNVPHo3/JRb6QOjFyR52ByPWaY+Xbs/2Psnw=;
        b=nKQ2Z39jrU15jP6IXbaQAZJlyHoc52lo15XzbjUdHoPSTFVxm6vb6vJR80Vu9Hxz8G
         mE4MveF5aDSiMN+W2VeYX5pLQ3bozOCcmuCncdP/eQLffBPO9eJ+xYbFlBL9vQnaJCiF
         vzI3yXZhxODC7Bh+R5AF3eCjkGS/RHBiTXmuYnE0gmmmtWxibitvC8wDaUdOqS2GW624
         BqVk5hFHEzo1V7cbOrKoqCkx9JMw20Nx9O60k50MZuQ/nncCuO4jM26VNzX2HIqD5bLV
         EaMWHT4a52qUo/KBjYUWDl1g4ZBNsspK1scz0yKBYCytPz1MF/IQFU/fxyBuMzy8pO+6
         FR5Q==
X-Forwarded-Encrypted: i=1; AL+hErGb50yQ4yN+fQBMsdnvn4pQLfRmQESc97IyACkEo8VGjiM4rR3C4tNsPwAwhjxQqbe8+d5kiPxzvZ0LUhr1gfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Pv7jUj2tS3bJy7/HcrI/N5lBpdjt33CM4CVmtEHyztOba33sK
	lYoU3kH8XcyUhh7aPm/4AM+D5YIxIGXEMNgz1Xt2gjs/E43rwtNAsNshV++E2IWODRw=
X-Gm-Gg: AZFdTZeFUk1q1PCqUY4U89RGelpMagQCS0h5IU088a5yBcVoCNPMmCC9Sk5O+I9/UaG
	KfmiWnqIqd826efmX5A5ye7QNSKT8X+xnRoxSrx+vcFNSfJvgJ3bFm2js+0UmIcfRSMd+6zLjDS
	Fr6Cnj9lRuqM7oAQ46kYt745eTw4aLpGP8fyJGgsNuAqEYgjkZskqAHz5R9r3YScqUPq+6i94B/
	Fun3/Dqt4fSyoGADh1bi9hhsm61QhlIikmY0koBgQHtD3YoNOXz2Fq9udF/1oPBgWU9gOwIdj9i
	K7cRIyL6bs5622nNgk5Az6QEG3IyjDpdekyn003TyaMu3yGbPSb/qsrJWZwpobNdFOfqqWs5GZ9
	4KvWOgJq1/hkuS0UYidrRz5nxsDZXhD/JWY1VsagvOjRvgehifwBoSGjmXFt7pYJPHerOlgyhBs
	l+ucyJ1LEV1MpJoHKmUDEtN/igLVr5cAX/iaBAIemH24CNLPe5B7uIdPTDY577iKKPQmieI5L+C
	j0+zWePKK/1IizdEq+xq6tb7IyYt5J+jHf1XlHZH1g/8egvuSGER7k2tzMvrV7hLxQ//TgUjYUV
	meSFTn+eJ+Y2YkceBT/DnyR3yf6KpB83gg==
X-Received: by 2002:a05:600c:6744:b0:4bb:afae:150d with SMTP id 5b1f17b1804b1-4bbafae24acmr75249945e9.33.1795776990010;
        Fri, 27 Nov 2026 02:56:30 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm408746585e9.1.2026.11.27.02.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:56:29 -0800 (PST)
Message-ID: <9a471409-04c2-4f6e-aec9-0b23bb9b69f0@linaro.org>
Date: Fri, 27 Nov 2026 10:56:27 +0000
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
Subject: Re: [PATCH v6 0/3] arm64: Add BRBE support for
 bpf_get_branch_snapshot()
To: Leo Yan <leo.yan@arm.com>, Puranjay Mohan <puranjay12@gmail.com>
Cc: vladimir.murzin@arm.com, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, bpf@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Rob Herring <robh@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>,
 Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>,
 Stephane Eranian <eranian@google.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif
 <usama.arif@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Andrii Nakryiko <andrii.nakryiko@gmail.com>
References: <20260810164622.1829843-1-puranjay@kernel.org>
 <CANk7y0ixo5a3Vfzj_HVhVHRNce2Rsit4pP27GCtXd4jHHzmiKg@mail.gmail.com>
 <CAEf4BzapC=7YM2QLMyKKfyOWGgBTfEJmPPN8e9Jf5xT9SutBTQ@mail.gmail.com>
 <dfa8362e-0dad-4f23-9d2e-dde03cb5facc@linaro.org>
 <CAEf4BzZ=ahQNtA-1KdZFRONXMOEkV9Nb1OUY==JRQCarkbMM0Q@mail.gmail.com>
 <5c7f4a5f-fe5e-4367-9c60-86f1818346e8@linaro.org>
 <20261126180214.GB809232@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261126180214.GB809232@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/11/2026 18:02, Leo Yan wrote:
> On Thu, Nov 26, 2026 at 12:39:52PM +0000, James Clark wrote:
> 
> [...]
> 
>>>>> Mark, Will, you guys seems to be designated as maintainers for
>>>>> drivers/perf/arm_brbe.c, can you please take a look and give your
>>>>> feedback as well? This is important and useful feature for newer arm64
>>>>> CPUs, it would be great to get access to this functionality that we
>>>>> had on x86-64 side for a long while now. Please help get this upstream
>>>>> or, if it's not in the right shape, guide Puranjay towards a better
>>>>> implementation. Thank you!
> 
> ...
> 
>> + Vladimir
>>
>> Hi Mark, Will, Vladimir,
>>
>> Any thoughts on this approach where NMIs need to be disabled? Alternatively
>> we could do something like track where the PMU interrupts and BPF snapshots
>> overlap and then discard the BRBE buffer and make sure they don't trample on
>> each other etc, but it looks like it would be significantly more
>> complicated.
> 
> Could we restrict bpf_get_branch_snapshot() on arm64 to a free-running
> BRBE mode? On a given CPU, at least one active event would have to
> request a branch stack, and every such event would have to be a
> counting event.
> 
> This seems to fit in this series. The selftest opens a CPU-cycles event
> with PERF_SAMPLE_BRANCH_STACK and sample_period = 0, then takes the
> snapshot from an fexit program.
> 
> Counting events can still generate overflow interrupts for bookkeeping.
> It requires to refactor the PMU driver to leave BRBCR_ELx.FZP clear so
> an overflow doesn't freeze BRBE. The interrupt handler could service the
> counters without touching BRBE and losing the branch records.
> 
> Thanks,
> Leo

Yeah I think this is a pretty good idea. It looks like it would avoid 
having to disable NMIs. You only need a local_irq_save() to avoid new 
events from reconfiguring BRBE while taking a snapshot, and you don't 
have to disable the PMU counters either.

If any sampling BRBE event gets scheduled then the snapshots just start 
skipping and returning empty.
