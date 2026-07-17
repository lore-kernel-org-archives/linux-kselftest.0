Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577683E121D;
	Mon, 20 Jul 2026 10:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544387; cv=none; b=Il4lhVBaJ9BV3KYJlg/nvgJkOlAsN1Fy+gRi3VRlROlq1r9NI8+y5kOaz3m8z/x7mNiPq9sELm2muFv9GodGiHB5d0bWQ/TlInd4fMG114Edb3HhOVldNVyS94dh1Vp6QiSGDC99SgBnIL6yVogC5N0k28BtO8sfBBJEJhDy/LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544387; c=relaxed/simple;
	bh=uvs1jIY/hulS8y87+KpdYmIwqST9kbpMwe4WWecx5lM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VW4VkpzfB8ULn5ahm4hkNU8s6x5FbK76zRE7jVlHm5M7ACr6oBbgdKTWMDLDOVP2j/s06AUXNm9mpNtDxRQUxTWgtK/VqKcLWjkge7G3b/3eu5PWE/hgdmzJ+s2lrkDbis1HxDrlsknI/L//qsYzFUFcVKxe3465cq3sSe22saY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gapQOTwD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gapQOTwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB651F000E9;
	Mon, 20 Jul 2026 10:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784544378;
	bh=XymAmg0N4pSB5swuo92XyNDtRE/ioa6H0i0Ng5FvJl4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gapQOTwDY9vRFIOMKbCRXOEHXReMlde+AhOr4GZbb4f6h+dl8NdbWQlT3repA0+SD
	 qQdg1h0/wPUx/V6R7kME9KcwUAZKvJPKOMH6aRA88PcoTcsyqvLMnhzzf8PVEo07Ol
	 CjCpguinWt3F/xlrD7SeiC+tBVPa/hzQo7RdHCGUU3p9fKtiXbS7inWHxD6dQro0Mo
	 BHrDrJP996Clsl3/TFfsdeuUpCR22UHTiHUYW36coSeD4GYdgAi7r0Abpm9jiwH9F0
	 5S7z2hi2Mvurv0V75OlmXJmQqpITysejDXZdvzaYuQG7cfc8DgM5TEjXNF7rx/Y/14
	 4aLKc3Hv8Kd4Q==
Message-ID: <13a0db90-d498-4d1d-845d-f3fc0d5437b2@kernel.org>
Date: Fri, 17 Jul 2026 11:39:40 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net 2/7] selftests: openvswitch: add config file
To: Eelco Chaudron <echaudro@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aaron Conole <aconole@redhat.com>, Ilya Maximets <i.maximets@ovn.org>,
 dev@openvswitch.org
References: <20260710-net-sft-fix-containers-v1-0-a2915c294ef5@kernel.org>
 <20260710-net-sft-fix-containers-v1-2-a2915c294ef5@kernel.org>
 <454FC9EC-8F3C-4999-BE7B-91EADC392EF7@redhat.com>
From: Matthieu Baerts <matttbe@kernel.org>
Content-Language: fr
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <454FC9EC-8F3C-4999-BE7B-91EADC392EF7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Eelco,

Thank you for the review!

On 16/07/2026 10:15, Eelco Chaudron wrote:
> On 10 Jul 2026, at 20:04, Matthieu Baerts (NGI0) wrote:
> 
>> The kselftests doc mentions that a config file should be present "if a
>> test needs specific kernel config options enabled". This selftest
>> requires some kernel config, but no config file was provided.
>>
>> We could say that a sub-target could use the parent's config file, but
>> the kselftests doc doesn't mention anything about that. Plus the
>> net/openvswitch target is the only net target without a config file.
>>
>> Here is a new config file, which is a trimmed version of the net one,
>> with hopefully the minimal required kconfig on top of 'make defconfig'.
>>
>> The Fixes tag points to the introduction of the net/openvswitch target,
>> just to help validating this target on stable kernels.
>>
>> Fixes: 25f16c873fb1 ("selftests: add openvswitch selftest suite")
>> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
> 
> Thanks for adding this Matthieu.
> 
> The changes look good to me, and I've tested the configuration and
> it works fine. Note that the config cannot be used for the OVS
> make-kernel test as it's missing some modules. But that's fine for
> the purpose of this kselftest suite.
> 
> Do note that when adding new tests to the openvswitch kselftest
> suite, they should be validated against this config, as the upstream
> CI uses the net config, which has more modules enabled.

Indeed. I'm currently doing some modifications for this CI, and this
behaviour might change in the future to use new config file for this
net/openvswitch target.

Cheers,
Matt
