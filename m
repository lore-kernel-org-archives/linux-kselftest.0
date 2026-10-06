Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B8346AA64;
	Tue,  6 Oct 2026 14:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791297740; cv=none; b=FclgiNK+/fHCw1nuOuFzjO/tOJvIIeJ7VEHkGGqTOug5OvmW43Iay+U0XzR5GUpvsyjHrrSJR/OMIHRnsoHw20NI10T0izYChBN6QfwBED+z0w7lYEvHkP3pnvVOp4rhgWVfCJC1x4SybN0XNEmi+iIKY/h7ZzgIAOXLTtNocX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791297740; c=relaxed/simple;
	bh=udMZNc2rFXHRjE0ZMq9xLrLXkBz9N8T7j5eymUhKYZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rr1le1FNR5uS011BHu+wLbUVSHhUR/IRjsPItox4DEWwJoRfHwwQQs7i/EUbV0usWSIvwWMsbhnieDayR3ZmEB9WJ7dYbE/8IiD1m9HxGfgUHX33OZ4PS0/OHeh490RYLMo+f7kJP+XJfyTbx9nCOZFpvSf+MZnghatmEIFjQWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fXW6LAiw; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fXW6LAiw"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E9221516;
	Tue,  6 Oct 2026 07:42:14 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F17503F66F;
	Tue,  6 Oct 2026 07:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791297737; bh=udMZNc2rFXHRjE0ZMq9xLrLXkBz9N8T7j5eymUhKYZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fXW6LAiw954MpsAgRH1UxdfDyygnEfgf0qkNRQia3YM0uMvWEYfnXpMvRZ2ZOczLR
	 EBykdxQHQMqQ41NSG5q+NRArJ94p7gEK0FPqaKjQtRZL3ujKyCDKQXDvVQ/3Z/LXgW
	 yyHeedbEDcNa/IjCMPkSXI5QthI1gznt5ADjQupg=
Date: Tue, 6 Oct 2026 15:42:14 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/arm64: Check for -EPERM not -EBUSY in the
 locking test
Message-ID: <asUIxt-XzxfWBW4N@arm.com>
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
 <20260910-arm64-gcs-lock-eperm-v1-2-d88e51855c9f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-arm64-gcs-lock-eperm-v1-2-d88e51855c9f@kernel.org>

On Thu, Sep 10, 2026 at 08:00:41PM +0100, Mark Brown wrote:
> The API has been updated to return the more permissive -EPERM rather
					      ^^^^^^^^^^
"descriptive" like in the first patch?

-- 
Catalin
