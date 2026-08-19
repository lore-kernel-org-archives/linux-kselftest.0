Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528D2220F2A;
	Wed, 19 Aug 2026 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150623; cv=none; b=SZY3HDXBCxxwvnzvFDU6HdexWmbOThwBjexVT/AAO45yI7dWfPu3peOp6XuIMhmNR3MVloznlJIaHFZBaApyPIXhgbJw4IydrYFgxw566kso2eGzoOqgpn41jRFc29J//BwgGFFlaNWTdU32Yk3TZeCsG8K6pb7UeKBYQLXnS0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150623; c=relaxed/simple;
	bh=PUGHFrZyidiO88M5MdSV7cP4PPuJlUlXIcHKPUqpbQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSZywEL/yFJnB3oNu2MutOVH1S9DdzWB5+xJHRAbZiW5jGZkconwTcC7H315yotapo7f0qd6UGZwxqUh+bLmLZLNUFk0xot4nI8E0AKtwll9fa+rH0zRwvEkqOBYBx4hXLjNldo1mZaGWTp3OE8yVbyPHyfE5q1RXrj+TDSN0qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=tyC4IsKK; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="tyC4IsKK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tk5X8IvcrQF7wqe0wB7W8SN6CM872QzkIcdcGmdDliM=; b=tyC4IsKKLfdCZX31ZzIcqL9D/F
	n6IOfdQPUR4/O+LFSr6JSJyqBdNAGuM7fUpfrqjqmY9kGKMJxdKWnxUoNf3lsIWPTzjBVZkOZtlDJ
	4sNFJBFWqsZylEbzM/QmpHMEfRNcAUuFzNn68L8jwxQQ3V7eQCh06kjI03+kcJfZlNLtq1K9Lm8hv
	lkUo3U6xxl3zyR3g9TeUwm8x2lERthBB99QKW0O/fLdaK05y66xYaXcFvUY+uGjMUAJspdvXoz04U
	XxNEfmnUVzna0iGHuOAChS6gg0MmAep7xKMHH0sw6P4dzR2CUipqeqdPkkpwnALM+q0C29aUqLIZo
	cTfRnzbg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wwhVs-009rX7-30;
	Wed, 19 Aug 2026 14:43:33 +0000
Date: Wed, 19 Aug 2026 07:43:28 -0700
From: Breno Leitao <leitao@debian.org>
To: KobaK <kobak@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Fenghua Yu <fenghuay@nvidia.com>, Tushar Dave <tdave@nvidia.com>, 
	Kai-Heng Feng <kaihengf@nvidia.com>, rupakr@nvidia.com, mohammedk@nvidia.com
Subject: Re: [RFC PATCH 1/3] arm64: add CPU prefetch and cache modulation
 sysfs interface
Message-ID: <aoXAdSY_EyPlOOnK@gmail.com>
References: <20260817022335.3-1-kobak@nvidia.com>
 <20260817022335.3-2-kobak@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817022335.3-2-kobak@nvidia.com>
X-Debian-User: leitao

On Mon, Aug 17, 2026 at 10:23:33AM +0800, KobaK wrote:
> +static void cpumod_attr_read_remote(void *info)
> +{
> +	struct cpumod_attr_call *call = info;
> +	u64 *value = cpumod_attr_value_ptr(call->subsys, call->attr);
> +
> +	*value = cpumod_attr_read_reg(call->attr);
> +}

Why do you need value in this case? Also, isn't cpumod_attr_read_reg()
anmd returning to a variable that is never read?
