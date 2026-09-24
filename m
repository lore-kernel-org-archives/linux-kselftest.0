Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACC449C4A3;
	Tue,  6 Oct 2026 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302271; cv=none; b=RzkCwFFjDGZiMUFCpq/jPcsRoC/m6cHEXqPsybC7mRmiKUTSnmsU1Ql7HFxbNLI9nISnvzDeeYRtre72sBtd4YfJW7MetL69mHTofdPRHGxuWlEfJR4mLzMcnJz+0oro5Vbj1ej35QdZ7Sj4VtDipYnkVcuPRP+h4NcYhbUzR18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302271; c=relaxed/simple;
	bh=Pf8EPNhq9IaFtueugyD5BlO9dMOI/Pc1XaecLXQ+tQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLVEy1JYQRqJdkpRayY8E7Bv7jfyQcVNm0Vx5jD3fUPVqkr2HZxfrzPOknq3/XXMpAZ5pYeCZWPvkgZovCiQKd9m/0bcqBc0OY7fvuKTc34xwrUWt4/Kcz89X/mUEDyaX5JwCQTWDC8aqBdRxeRmVVIXZ2v8+6Ze19OIm/jyUDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.arm.com; spf=pass smtp.mailfrom=foss.arm.com; dkim=pass (1024-bit key) header.d=foss.arm.com header.i=@foss.arm.com header.b=OfTYXDfm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foss.arm.com header.i=@foss.arm.com header.b="OfTYXDfm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E58C143D;
	Tue,  6 Oct 2026 08:57:46 -0700 (PDT)
Received: from [10.211.55.7] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49FB73F763;
	Tue,  6 Oct 2026 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=foss.arm.com; s=main;
	t=1791302269; bh=Pf8EPNhq9IaFtueugyD5BlO9dMOI/Pc1XaecLXQ+tQA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OfTYXDfmzBiGrhfZhBz5ssW0iPG9mWbR1eLtqv7qX8rqBIlDxgSv4FtiebdjSuMbP
	 S/USuq7SI9SmGJiB5G05+vtV08D5otClWwBakLiB4zlhLaan2cpXO4N7EZO8x8P+7W
	 4ExllblFVwsIuHyb0gMfWd81yVsoom4Xp5jK7aTY=
Message-ID: <8c425dac-11f0-4267-8745-d23d6391a6b1@foss.arm.com>
Date: Thu, 24 Sep 2026 15:49:14 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: gcs: Return -EPERM when changes are prevented
 by locking
To: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
 <asUIWgHk3hdaLEu5@arm.com> <asUQdaTtMF1X_Hsa@sirena.org.uk>
Content-Language: en-US
From: Bill Roberts <bill.roberts@foss.arm.com>
In-Reply-To: <asUQdaTtMF1X_Hsa@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/6/26 10:15 AM, Mark Brown wrote:
> On Tue, Oct 06, 2026 at 03:40:26PM +0100, Catalin Marinas wrote:
>> On Thu, Sep 10, 2026 at 08:00:39PM +0100, Mark Brown wrote:
>>> When we refuse to change the GCS configuraiton due to locking we
>>> currently return -EBUSY which is an odd choice.  The only userspace I
>>> found that relies on this value at present is the kselftest and other
>>> architectures are using the more obvious -EPERM here let's switch.
>> IIUC, riscv is returning -EINVAL. Should we get an overall consistent
>> value? Personally I find -EBUSY quite descriptive but I don't mind
>> aligning the architectures (before user space starts making use of the
>> return value).
> Yes, it's using -EINVAL though it differs in that it's interface for
> locking only allows locking a single enable bit in the enabled state
> rather than letting you lock unknown bits, or locking things off, so we
> need some changes there too.  I guess we could also go with -EPERM which
> would also distinguish the "I don't understand" from "This is blocked",
> but nobody uses that yet.
>
> I was intending to do something soon to pull more of this code out into
> some shared place since especially for RISC-V and arm64 where they're
> using the prctl() rather than arch_prctl() interface so there's less
> reason for things to be duplicated.
Bear in mind that I do have patches out there, for x86 that enable prctl
for them as well. I looked into doing the lock check in the prctl call 
path before
it gets dispatched to the arch specific backend, it does require a 
common interface
into the threads feature bits that each arch would need to, trivially, 
implement.
