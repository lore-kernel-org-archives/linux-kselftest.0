Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E2B23E358;
	Sun, 17 May 2026 17:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039493; cv=none; b=sHa5EAay1Y+GemBh5W5K8uvr/OIg/zTNigAlUmioWNiHj40uxhj9spWkrdfOCIIckvem0ay26dkndcV1jFUmkyVtIF+D2HHKXTyDpXH10psGAwHob1+iRtBPtG90DEcs8OsFMOsly11qEok3Mk/C58unkPKIj/4ULqxoP5/iQEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039493; c=relaxed/simple;
	bh=hUXEIurEBWkC2u5wz4FjIdplyJXliJSJqkf1ECw3UDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tqu9N/TJluMsJTBmkbXcNCUVpg0xxyRjTGKSi960ImJe5pxpbyFE3vnGJz0pzVpVe0RMqtrdHNZIxPfsxZGk3+splRfDtFUOggLbZFkUiH2jg4mWc2v5fm6t5BCPqwmLOk6ZBx68ScOHoOAI60D4OEdET2K12jwGAn7G9Z/L88A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFLx6ZNf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFLx6ZNf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624B7C2BCB0;
	Sun, 17 May 2026 17:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779039492;
	bh=hUXEIurEBWkC2u5wz4FjIdplyJXliJSJqkf1ECw3UDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LFLx6ZNf3rrbva2M3m65Nd4aTUKBDskBTAyJvCjKxOWOWO2U+uXm55P1kFR6D3V5B
	 2MghIV+hpD7aSSqQ9qjxY1v9NiV5EuhzuF/tpzGOtf2xJcKApaPaMkRt9vT+D6xMtB
	 WhKI/ZquiUJE/91W4Vl3vVJ+nvSp2GiVE7A9FqNJij3E0FbOQvX8MhfzQ0dCaQ0Vcc
	 weiEdPQRSeTvrepjQbsJ76kfFv8m/cSg6Au6rflUxL7NuXB0MaLp5OTzaFNN0AoVkC
	 TbqxfzIevYlrwaGMBK68BNqj5UMzmD7DONdBpD56DqyFVugzLDSZ9nU7Ror2x0iwRz
	 3xS5LjIPteA5g==
Date: Sun, 17 May 2026 20:38:04 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com,
	kexec@lists.infradead.org, pratyush@kernel.org, skhawaja@google.com,
	graf@amazon.com
Subject: Re: [PATCH v2 10/10] selftests/liveupdate: Add stress-files kexec
 test
Message-ID: <agn8_FAtMdc8B5c9@kernel.org>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-11-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514222628.931312-11-pasha.tatashin@soleen.com>

On Thu, May 14, 2026 at 10:26:28PM +0000, Pasha Tatashin wrote:
> Add a new luo_stress_files kexec test that verifies preserving and
> retrieving 500 files across a kexec reboot.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  tools/testing/selftests/liveupdate/Makefile   |   1 +
>  .../selftests/liveupdate/luo_stress_files.c   | 101 ++++++++++++++++++
>  2 files changed, 102 insertions(+)
>  create mode 100644 tools/testing/selftests/liveupdate/luo_stress_files.c

-- 
Sincerely yours,
Mike.
