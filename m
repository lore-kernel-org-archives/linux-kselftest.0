Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9221B4B5408;
	Thu,  3 Sep 2026 14:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445536; cv=none; b=ZCg3zDGE1jXxHw3ynC+Rl0pdP8G1NEXD1joM1z7yDk20YyMuxt0/nkn3MFjAOv3LTUj2/95R7B8B0DT9ankV8bZLAAr9/JPyHTq7YBh5CazfapEh0czij8lzuHocg2U1lyg4vwg2YcNOxN0CQeNsoW3vds/O4hzdabrc3RK+9jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445536; c=relaxed/simple;
	bh=FAjoOuGipr40QiwzM2evOA8xAZV5FlCngQRcbypDFLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=jeJ2CRTJX4tN4T771b2MFg2Wk2ReEpgC+/5wUWmJXCc1zkTQSm4eJn4uk90GAbfL20NrVejbSqDUVmG5oF17Kz/177OijK3SYUJJuu4vSqzcNKyXWdRVcY2fZFefCy4S0mQDGoGjrU9OuFnHKgyDziS7JXOQf0yU+SF553svoWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=C0hi7Ch2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="C0hi7Ch2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DD541596;
	Thu,  3 Sep 2026 07:25:13 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCC123F673;
	Thu,  3 Sep 2026 07:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788445517; bh=FAjoOuGipr40QiwzM2evOA8xAZV5FlCngQRcbypDFLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C0hi7Ch2VkJHWm6dS0wldrgEsQ35FIqApi7yGdjic/mCO3EGqZ9dqFwT/BpLpIHQ4
	 CY/+w2G0Eq/CsUvAJqs6oDz28uwhXFR2xWCToD9vWUI5EnKqO8nRSLW1zCkmLkC0Vm
	 9mwQhfyz+w0/XUoR1eAgrrEdwDdwBtbuZ3XxhEfE=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 05/14] KVM: arm64: Set PSTATE.EXLOCK when entering an exception
Date: Thu,  3 Sep 2026 15:25:09 +0100
Message-ID: <apmDRXBvS-XOi1NJ@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-arm64-gcs-v20-5-f31750bdfadb@kernel.org>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org> <20260901-arm64-gcs-v20-5-f31750bdfadb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Sep 01, 2026 at 10:47:03PM +0100, Mark Brown wrote:
[...]
> +	/* When taking an exception to a higher EL EXLOCK is cleared. */
> +	if ((mode | PSR_MODE_THREAD_BIT) != target_mode)
> +		return 0;

"Higher" is mentioned here, but the comparison is a "!=", so I suppose 
here we trust the fact that we always have "mode <= target_mode", and only 
2 possible target exception levels (EL2h and EL1h).

It's a nit, but maybe a "<" here would be more clear?

The rest of the code seems correct based on R_WTXBY.

[...]
>  
> +	// PSTATE.EXLOCK is set to 0 upon any exception to a higher
> +	// EL, or to GCSCR_ELx.EXLOCKEN for an exception to the same
> +	// exception level.  See ARM DDI 0487 R_WTXBY.
> +	new |= compute_exlock(vcpu, mode, target_mode);

Same nit: am I really setting one bit here? or could be 
more stuff depending on the parameters? Having an "if (cond) new |= bit"
seems more clear to what is being done, without needing to read the comment 
above.

In any case, FWIW:

Reviewed-by: Leonardo Bras <leo.bras@arm.com>

Thanks!
Leo
