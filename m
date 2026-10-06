Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0C11BC08F;
	Tue,  6 Oct 2026 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791297633; cv=none; b=Y8hwQy7r7S8YwkPbivBNFelLgl1T2HIyBdme4Nq3ogYVKQ7jB2YxCTshU6q3a7zHgb9RNoPHSWa3cMErqQ4qPJCN0/J+pXXj9Blz6dvmGOnBCfLx9fWb3yPPhoxNHLXraxech5Pauu41oa6wv4tS/TtieT9SwEMmu1UmYLXnfN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791297633; c=relaxed/simple;
	bh=yU78SAbfJlRqMOCIss0Z37pf6Gz3agoTMIRQf9pHTGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUNkjgC82ImyQQnkbhpEOswznvEPiWhfmmRpWksQ+a+//cIyCk1QgzrpUHbQJk8Ta9EWUf+EuRaWwX3xgm97w0XcXsy4Cb0uAUk7ZfwtAcd3guLwzJ8N0Q34quOPwO3X8f2RKBbs+BbkBcq6CEBe49an9Vs3y5IWzx+lcIq09kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NYTWwYvY; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NYTWwYvY"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A92D1516;
	Tue,  6 Oct 2026 07:40:26 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3F6E3F66F;
	Tue,  6 Oct 2026 07:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791297629; bh=yU78SAbfJlRqMOCIss0Z37pf6Gz3agoTMIRQf9pHTGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NYTWwYvYfIsSmzz7Bqt1lsM+9W49mjsFntYVzHXBzeH+Igy14f0OdSkgGa8Hkkxxv
	 owd38Rzp+bk+ptY4ljz9FinMm5HeVwlBvxlQ/824XQsY0/2mCxAWZRhCEdmDLm4mSg
	 08Oav9Xn3IDOhPDYtTScv3YwrI7+ytjapr0qzo0g=
Date: Tue, 6 Oct 2026 15:40:26 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Bill Roberts <bill.roberts@foss.arm.com>
Subject: Re: [PATCH 0/2] arm64: gcs: Return -EPERM when changes are prevented
 by locking
Message-ID: <asUIWgHk3hdaLEu5@arm.com>
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>

On Thu, Sep 10, 2026 at 08:00:39PM +0100, Mark Brown wrote:
> When we refuse to change the GCS configuraiton due to locking we
> currently return -EBUSY which is an odd choice.  The only userspace I
> found that relies on this value at present is the kselftest and other
> architectures are using the more obvious -EPERM here let's switch.

IIUC, riscv is returning -EINVAL. Should we get an overall consistent
value? Personally I find -EBUSY quite descriptive but I don't mind
aligning the architectures (before user space starts making use of the
return value).

-- 
Catalin
