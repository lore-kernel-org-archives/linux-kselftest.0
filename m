Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9E778F4A;
	Mon,  7 Sep 2026 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773821; cv=none; b=trnlcHAT1HSEp/TabDh+a925JkIrbFb+Bnyyp9nBT6sIayhzd9Vll81LbIxGIoQLv37KNWp4epjeDfdEfld4A+26CWNmg32/zGqTfS5i19lO/wM3a5ZGWCxKRoymI7n7l/GLKfvhwFcBVjO+p9KWH1xXqyA4WUDKIRSCdDbCN8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773821; c=relaxed/simple;
	bh=pocvtLvVAA3KCKWrQpdsbyTH4eJeGTnLbzDEaWWybkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhZJFCa7YSOfhn+aXdAW9MV5knLCI8NMVstiVW6h87cVEFnlQNYHTgACGf/WTpFM9h1f6PZTGYkW27kWfILUK4Cn4H84k8whIZdPuFC/+iNy+iqUeUabVLnhG9mesJGZFh1ywhC8PO6pwZwIkS4lzH9bMyoZY7gG6B90+2Lex2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPjB/p46; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPjB/p46"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F01F1F00A3A;
	Mon,  7 Sep 2026 09:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788773819;
	bh=ytKsqBo5/2HLVu6fIuVVD3BDl61BPKw3UXH/G57rWfs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NPjB/p46ZY4uuoYs4ZsbTiCzvkCIg/PMEEQ77KFNKzpEyLuSEQYPTcfLwyY++OlRw
	 aHuGDcVYFqq30PWwk8S7oAkmT5xY2W/Qzxae7mwzsnGdynWdtdQArlC4N7KjBi0bmc
	 Hv/YHoAM5fU7YLYZ05a0dBnjxNFd+1WQMgk45koQ5SZq6ZwwbqA/HOT66bhVnp8GSK
	 808w2MUDwIusK+gG/lfUg69HItV/4rYjO4XC33TYQoevfdxPMmMPXt2mkESZhqbmAN
	 TNmO5hd9CMx5omdC6Pc3oy7llr/jtNVpdeG/BajoqhfBgACMNeurGQTXNqoktM82NX
	 KztrDZXbsLqlg==
Message-ID: <23359076-eae2-4fdb-a8ee-23968b84869c@kernel.org>
Date: Mon, 7 Sep 2026 11:36:53 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net-next v2 1/2] tools: ynl: Allow cross-compiling ynl and
 associated tools
Content-Language: fr
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, donald.hunter@gmail.com,
 horms@kernel.org, shuah@kernel.org, sdf@fomichev.me, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-kselftest@vger.kernel.org
References: <20260903155524.2241065-2-maxime.chevallier@bootlin.com>
 <178870681916.219967.14635919564673520317@kernel.org>
 <d1928f33-23ca-46cd-af71-1f3cdc55bf96@bootlin.com>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <d1928f33-23ca-46cd-af71-1f3cdc55bf96@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maxime,

On 07/09/2026 10:22, Maxime Chevallier wrote:
> Hi,
> 
> On 9/6/26 17:00, netdev-bot+sashiko@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential
>> issue(s) to consider:
>>
>> Critical: 0 · High: 0 · Medium: 2 · Low: 1
> 
> [...]
> 
>> [Severity: Medium]
>> Should the new include come before Makefile.arch rather than after it?
> 
> This looks like a legit point
> 
> [...]
> 
>> [Severity: Medium]
>> The commit message says the change accounts for "the cross-compiling options
>> such as CROSS_COMPILE or the LLVM-specific variables". Does this also cover
>> the documented LLVM form described in Documentation/kbuild/llvm.rst, that is
>> make LLVM=1 ARCH=<arch> with no CROSS_COMPILE?
> 
> I'll update the commit log to document the limitation
> 
> [...]
> 
>> [Severity: Low]
>> This isn't a bug, but now that Makefile.include is pulled in here, the
>> existing Q assignment later in this same file disagrees with it:
> 
> Also legit as well.
> 
> So, I'll swap the Makefile.arch and Makefile.include inclusions, document in
> the commit log that we don't deal with LLVM + no CROSS_COMPILE, and drop the
> 
> Q = @
> 
> line in ynltool/Makefile.
> 
> Matthieu, are you OK with me keeping your review tag with the above changes,
> or do I drop it and resend for you to re-review ?

Thank you for asking. I agree with the above changes, (and TBH, I didn't
check for such issues in my review :) ), so you can keep my RvB tag.

Cheers,
Matt
