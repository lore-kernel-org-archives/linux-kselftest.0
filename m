Received: from mta0.migadu.com (out-231.mta0.migadu.com [91.218.175.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628C94FDE63
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794672; cv=none; b=h+L9Dj83wvy5GEgBqZ20CupCaRlxBOj2Fg0f9wcl3dRrEPZXosKStuafKsFnNm/Uh1bd0h8Xpm6ZEhYAVVFv+a4HfsFI/aaV84MWFbEiwZve6ex+fsze/q84BHmR9ckgaqtYRQidIM+hzSGfKcLrfTCT/GqqUvkah0AwRFSecSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794672; c=relaxed/simple;
	bh=53M13uLe2tDWwPpHOljST/aFN6C7iTXS5c1/+w9kOOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S880rxw4YIq4GoyyejSsLMRzSsTP0t/o4vFa5w3GWiEkIwe6SzqpLIMgejWZVT6kjTOPECuSpaRbmvuC2D8qW4FZ+VMsK6BaAAq5dSVX8uS70UzA6v6l1abKX4xNvqCLQ5grYr3OSqyKUSo2Xnj9KtwNZdhkXWcSAyfMkJi0DrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U9ZyVX/f; arc=none smtp.client-ip=91.218.175.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U9ZyVX/f"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=53M13uLe2tDWwPpHOljST/aFN6C7iTXS5c1/+w9kOOk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788794668; v=1; x=1789399468;
 b=U9ZyVX/fClNZMXMyBDBJJxykjDgL83WYuzh1OJMaY35Jftey2ICoXdp2qpE87wpFaMmPrHOZ
 4kAmw/ecr0qF9+/JC3A86ATrGh09whgYY/JYCZDbTsOJYO3c0+vDDXNpdjQ/nfdoatLo5gMDdHy
 7YOUqmJmVulsaDfQKOQK9uqM=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 51765449fb49eae3;
	Mon, 07 Sep 2026 15:24:17 +0000
X-Mizu-Trace-ID: 51765449fb49eae3
X-Migadu-Flow: FLOW_OUT
Message-ID: <534e5a3b-5160-4619-8b2e-27a81783e17f@linux.dev>
Date: Mon, 7 Sep 2026 23:24:10 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 1/2] selftests/bpf: Move verifier failure tests
 out of test_global_percpu_data
To: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>,
 Quentin Monnet <qmo@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Sid Nayyar <sidnayyar@google.com>,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260904031912.2133476-1-tweek@google.com>
 <b965bb62-fcc8-4517-9947-24613650f1f5@linux.dev>
 <CA+zpnLc-WAqE9rA0PsjvOFe_YCZOdVj9YAzuayGXx0nhpqtw7g@mail.gmail.com>
Content-Language: en-US
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <CA+zpnLc-WAqE9rA0PsjvOFe_YCZOdVj9YAzuayGXx0nhpqtw7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2026/9/7 13:46, Thiébaud Weksteen wrote:
> On Fri, Sep 4, 2026 at 4:07 PM Leon Hwang <leon.hwang@linux.dev> wrote:
>>
>> On 4/9/26 11:19, Thiébaud Weksteen wrote:
>>> Commit 4c9241bd731a ("selftests/bpf: Add tests to verify global percpu
>>> data") added test_global_percpu_data.c to LSKELS_EXTRA. Later, in commit
>>> 1ed2294b31fc ("selftests/bpf: Test verifier log for global percpu data")
>>> two verifier failure tests were added (verifier_strncmp and
>>> verifier_snprintf), both marked as non-autoload (SEC("?kprobe")).
>>>
>>> When bpftool generates light skeletons, non-autoloaded programs are
>>> skipped during loading, causing the loader program to store subsequent
>>> program FDs into incorrect skeleton struct fields (e.g. dump_percpu_data's
>>> FD was stored into verifier_strncmp's descriptor).
>>
>> IIUC, patch 2 will fix the issue totally.
>>
>> Better to add a subtest to verify both the issue and the fix?
> 
> Thanks for the review. That's right, patch 2 will fix the issue:
> bpftool will fail to build any program that is set up that way. That's
> why patch 1 is necessary; otherwise, the existing test would fail.
> 
> Just checking your suggestion: what I can do is add a new test to make
> sure that dump_percpu_data is set up as expected (fd > 0). I can write
> a new test_global_percpu_data_iter_lskel, that is similar to
> test_global_percpu_data_iter, but for lskel?
> 
> I can also write a test to ensure that bpftool fails when light
> skeletons are set up with autoload=false?
> 

imo, the rejection of autoload=false prog when generating light skeleton
is not friendly for users. Users should not care about mixing
autoload=false progs with autoload=true progs, even for light skeletons.

The users-friendly way is to skip those autoload=false progs when
generating light skeletons.

So, this is a bpftool issue. A selftest is unnecessary. You can verify
both the issue and the fix manually. Probably, paste the verification
result in the patch message.

Thanks,
Leon

