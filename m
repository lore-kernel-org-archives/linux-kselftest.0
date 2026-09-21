Received: from mta0.migadu.com (out-106.mta0.migadu.com [91.218.175.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70CB5111AF
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 21:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790025348; cv=none; b=Duvj/TedfvXZb53hJs/QW9VCsKeX7hK/fJ+gLIxvvKJnk87jD1idIBiHLiOyf7X4QYQeq0uLXS1/X/svJy+3HaLxtxu5tEUTyYtr8+3CXezKuUMIwbYbHjmUD+3VUPqIRb+KGIrXIUuv10nzhZE8ATxoEVJ4v96GwFWSK88dd8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790025348; c=relaxed/simple;
	bh=fQCb835gnDw0+W2Onz9aDFQLRn4B/BMH7O+wX3/9Sek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a97xL2fd7cTtANcHtys1A6h1v/U+y1H2UdR+8W896H4uuSB6xnQF7LPJorbVpWoeLtSFkAgavEQBm8O9WFj5TWdJN+d8TZBj7D2KCm7T9erL2sv1GDoY1NFHAldcGAOxkqfp2oJXmvI04UqG65Mutn6BNvA04LgTu0VOM1bGWxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SMOsWtoK; arc=none smtp.client-ip=91.218.175.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SMOsWtoK"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fQCb835gnDw0+W2Onz9aDFQLRn4B/BMH7O+wX3/9Sek=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790025342; v=1; x=1790630142;
 b=SMOsWtoKtL6wIQ28bZwrj/3aG5tfdPDI7EQ8WtoGol12hluJDyDiqg94oWRM6cBDGk7403nW
 TOETamiDI07yBPGK4wq2WrKoh+j4bimDm+hQ2YQ8mYtP80gif4+HKvKtI/9bFz4edMmsGdXVzg0
 Ujo7UBr03OwwgCiFk1CYcARE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 75550e44efdad756;
	Mon, 21 Sep 2026 21:15:19 +0000
X-Mizu-Trace-ID: 75550e44efdad756
X-Migadu-Flow: FLOW_OUT
Message-ID: <9e055710-d607-4a4c-95c8-eb3a0b4aa1a1@linux.dev>
Date: Mon, 21 Sep 2026 15:15:14 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] selftests/bpf: Fixes for out-of-tree builds
To: Eduard Zingerman <eddyz87@gmail.com>,
 =?UTF-8?B?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?= <ricardo@marliere.net>,
 ihor.solodrai@linux.dev, nickolay.lysenko@gmail.com
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Emil Tsalapatis <emil@etsalapatis.com>, Jiri Olsa <jolsa@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Song Liu <song@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>
References: <20260728-selftests-bpf_oot-v1-0-05feb15d94db@marliere.net>
 <6f95ec90-194a-4304-9673-c7bb50065223@linux.dev>
 <d3a251acf5131bea732e23bbd135a5fdebec9ad6.camel@gmail.com>
Content-Language: en-US, en-ZM
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
In-Reply-To: <d3a251acf5131bea732e23bbd135a5fdebec9ad6.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/21/26 3:04 PM, Eduard Zingerman wrote:
> On Mon, 2026-09-21 at 14:40 -0600, Nico Pache (Red Hat) wrote:
> 
> ...
> 
>> Given your series was defferred, and there is a "rewrite" coming, what would
>> be the best approach to working together (between us three) to get these
>> fixes in that series too. 
> 
> The, "rewrite", as you call it, had landed today.

oh thats great news. I checked on Friday and didnt see it. Thanks for the update :)

> So the series in question can be re-spun.
> Regarding your patch on top of it, it appears you can just post is separately.
> However, I am inclined to be confrontational towards changes like this one.
> The purpose of the selftests makefile is to run selftests as appropriate
> for current tip of the kernel tree using a very specific kernel configuration.
> Main users of this makefile are BPF developers and BPF CI.

Yeah we are trying to reincorporate BPF as part of our CI. It has bit rotted in
the Fedora env, and our large amount of build variant is where things are
starting to go wrong. We need to build selftests for multiple variants, and be
able to specify which variant we are building for. Hence the out-of-tree build
with specific vmlinux.

Is there any other approach you'd suggest? I personally dont work on BPF, but am
trying to cleanup/fix our selftests builds for Upstream/Fedora CI.

Thanks,
-- Nico

> Support for distros customizing the makefile is a non-goal.
> The "PERMISSIVE" change done enough damage already.
> 
> ...

