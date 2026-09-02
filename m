Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48F23438A9;
	Wed,  2 Sep 2026 18:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788373613; cv=none; b=CqQabIBhZVwS7bwsB0rg9B19XiXPj2VEW9Dxcga+O0ZI5U+EFsL1CExrwprpEbBaT0yipxiL5YYzxxTTa3vAU626wKAAR/IHpemHiyN99rQ9wEvOovXl7XR7kzTyY6jvp6wq+Dfai7/DvwnCz/P8sqpcLscxiadBvf2huzU0v1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788373613; c=relaxed/simple;
	bh=zPZF5OWQOBQSD+z6kPd+7v5KM/arA94IPYNp5wna/x8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=tvDfSnCiO7q4FEWQssWEi1A6PGkvUcE6+irG/PT0eBs+KA96ZLvVCZt2vOCjZpvREU5R72s+X/QgfCjIKehqnC8ydBccGKu4w6o+uc8DJ3WnRES4fJeZ3qUbRwo04Si2Oaf1Gtu10aetJOVK4uZpvnwqkBCVP6ZoKFUKMeTwDRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=90/+8Yvu; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=Y5kkxnDX; arc=none smtp.client-ip=160.80.4.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="90/+8Yvu";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="Y5kkxnDX"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth-2019-1.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 682IQ63c032636;
	Wed, 2 Sep 2026 20:26:11 +0200
Received: from lubuntu-18.04 (host-80-183-189-234.business.telecomitalia.it [80.183.189.234])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 386801212CA;
	Wed,  2 Sep 2026 20:26:01 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1788373562; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YOq0h22DfRYPk8FdBe8yOEEVPyPE7ep/CmbMED3Kvlc=;
	b=90/+8YvuAcYixkxA+hkDSjRtoVBYmaqYm18fSzVWbetGEQjOMRfeAMc0kawlPO8Qo0NzPV
	Pik5FGJoajv2kfCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1788373562; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YOq0h22DfRYPk8FdBe8yOEEVPyPE7ep/CmbMED3Kvlc=;
	b=Y5kkxnDXCLVj8sKlLKPDJ4xR4586gtbwB8IuCm7dGyda9ffIYrQQKN2rA3PrZ8PRtEvqce
	/W2Fn2hp7xYUNvk4bv2eiBfDa5L2VEsjiT0Ejlbgw2x2DZCJdLv/GDMXF07+IQDpzhtlDT
	UB4AsrlthtzDtY/UGvBi4Z+22JzOTpuIZ1nqXFPRo8xs/xPx9gYrsqlM4uUqZj4r6lgGUZ
	HAGmnbwkqFy3z6+ScFoD4C8WDu1FDQhLr6HTQFveehiUAu27K+lm7WCNQ/Fz5/EvAUxiLD
	Tbd4DgSZBK8Gblkg3iI4l7Hl/mYoLUV/A2CwkeKnAL9IEUdpG2rO93/nA2RXOQ==
Date: Wed, 2 Sep 2026 20:25:59 +0200
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Alessio Faina <alessio.faina@canonical.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
        netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, hangbin.liu@linux.dev,
        stefano.salsano@uniroma2.it, Andrea Mayer <andrea.mayer@uniroma2.it>
Subject: Re: [PATCH net] selftest/net: skip srv6_end_d[t/x][4/6]_*_test.sh
 if iproute2 too old
Message-Id: <20260902202559.6c2b693bc2a6e697855e1b54@uniroma2.it>
In-Reply-To: <apbe0PAvaes977l-@cicciput>
References: <20260824091537.2305107-1-alessio.faina@canonical.com>
	<20260826000156.bdaa71db68dbdc9c13907205@uniroma2.it>
	<ao7S04LkWVXAQpgq@cicciput>
	<20260827030701.bfaf6eea6dea1aef24c353cf@uniroma2.it>
	<apAJuZzDOvjkVx60@cicciput>
	<20260828042357.1d6e802448752a8fdff5a485@uniroma2.it>
	<apGxmfjQs247lHX-@cicciput>
	<20260829231150.8180c09f6874606eb49d0243@uniroma2.it>
	<apbe0PAvaes977l-@cicciput>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

On Tue, 1 Sep 2026 16:18:56 +0200
Alessio Faina <alessio.faina@canonical.com> wrote:

> [snip]
> 

Hi Alessio,

Thanks. Some comments below.

> I tried this
> 
> +test_iproute2_vrftable_supp_or_ksft_skip()
> +{
> +	ip netns add __vrftable_test 2>/dev/null

The netns name is fixed, and if a netns with that name exists, the
check runs in it and deletes it at the end. It would be better to use
setup_ns with a local variable. setup_ns picks a random name, fills
the variable and checks the add. cleanup_ns then removes the namespace.

> +	ip netns exec __vrftable_test sh -c "echo 1 > /proc/sys/net/vrf/strict_mode"
> +	ip -netns __vrftable_test link add vrf-100 type vrf table 100
> +	ip -netns __vrftable_test link set vrf-100 up
> +	if ! ip -netns __vrftable_test -6 route add fc00::1/128 \
> +			encap seg6local action End.DT4 vrftable 100 dev vrf-100 2>/dev/null; then
> +		ip netns del __vrftable_test 2>/dev/null
> +		echo "SKIP: SRv6 vrftable not supported in iproute2"

The srv6 tests that name iproute2 grep the ip help text, while this one
installs a route. IMO the message should say what is missing:
"SKIP: SRv6 End.DT4 vrftable not supported", and the same for the function
name, without iproute2 in it.

> +		exit "${ksft_skip}"
> +	fi
> +	ip netns del __vrftable_test 2>/dev/null
> +}
> +
> +test_iproute2_vrftable_supp_or_ksft_skip
> +

The call goes after the vrf block and before setup(), because the check
writes the vrf sysctl and that file is not there without the module.

The commit message and the subject should be updated as well.

Ciao,
Andrea
