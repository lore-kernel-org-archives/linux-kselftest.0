Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74740224D6;
	Thu, 12 Feb 2026 17:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770916926; cv=none; b=a+CSAreywYBfEWPfLrs3rDSsDPMfL4Fmli1rmMuOEMCJNfCf8wL38LKxZBvkzMt+fLzWlJOICzSF/VGvX2w0G5nCOI02Ko+TYe6jDj+N6S1iysP0pAlCwn/H3lafv5I2PAY1oTV8yiU0AkhPe0P4u9i2fhmXAMv0eCEaxCNkcHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770916926; c=relaxed/simple;
	bh=DNPLSoLlzhM3i52fucIsFAhHJjWqw0gwKKTJMXpiVvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qinoyGgmuUuPn6r8bEu8DxDltRPqHJ3MxXoSJYp8c/qlvGfFgEjH0AEltFMMI1dzyuZE1dvNkjk/GcoyO0wsVMn/V7coJlLzyeiI5sgrAQUP5JEhNED5Gzqt88t+/YW8aPlJNwkEGlks+UG0VTSSSCe4FrR1ieMwoPe25WWhZGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJzFExcE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJzFExcE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE810C4CEF7;
	Thu, 12 Feb 2026 17:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770916926;
	bh=DNPLSoLlzhM3i52fucIsFAhHJjWqw0gwKKTJMXpiVvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJzFExcEBuO03Pq3jNGTSDinF4zcqiib63XmPtnx5hSQvNIcKp/4WAjRkqFXjCho+
	 JlzZKk8r55bJdyEuWneqEicDvF0uHShU/pJAliFu9zvbn7KjyPSKy6cHipwyckSgfC
	 uesLcarGkoXM+jtx7fMieBFJjLxGpBUhYuw+8L9LxmspctgnRe/k1BSnwGUMZ/7bNM
	 b3USAv0fd4kkFG8O1jz2Or0K1sW7C66ZU7xJ9ZFjU5e+0iMHBvhP3oHf0XXJ4FHacz
	 uYmr40xp8cBth6RpVEdw3D5J5BmXlkIXKGudTQsFogf8ZN/+kTjAsplPfRX2Dw6kGp
	 Qw0lVuDC6nchg==
Date: Thu, 12 Feb 2026 17:22:01 +0000
From: Simon Horman <horms@kernel.org>
To: Gal Pressman <gal@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Petr Machata <petrm@nvidia.com>, linux-kselftest@vger.kernel.org,
	Nimrod Oren <noren@nvidia.com>
Subject: Re: [PATCH net] selftests: drv-net: limit RPS test CPUs to supported
 range
Message-ID: <aY4MOYkyn_VHgjCr@horms.kernel.org>
References: <20260210093110.1935149-1-gal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210093110.1935149-1-gal@nvidia.com>

On Tue, Feb 10, 2026 at 11:31:10AM +0200, Gal Pressman wrote:
> The _get_unused_cpus() function can return CPU numbers >= 16, which
> exceeds RPS_MAX_CPUS in toeplitz.c. When this happens, the test fails
> with a cryptic message:
> 
>   # Exception| Traceback (most recent call last):
>   # Exception|   File "/tmp/cur/linux/tools/testing/selftests/net/lib/py/ksft.py", line 319, in ksft_run
>   # Exception|     func(*args)
>   # Exception|   File "/tmp/cur/linux/tools/testing/selftests/drivers/net/hw/toeplitz.py", line 189, in test
>   # Exception|     with bkg(" ".join(rx_cmd), ksft_ready=True, exit_wait=True) as rx_proc:
>   # Exception|          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   # Exception|   File "/tmp/cur/linux/tools/testing/selftests/net/lib/py/utils.py", line 124, in __init__
>   # Exception|     super().__init__(comm, background=True,
>   # Exception|   File "/tmp/cur/linux/tools/testing/selftests/net/lib/py/utils.py", line 77, in __init__
>   # Exception|     raise Exception("Did not receive ready message")
>   # Exception| Exception: Did not receive ready message
> 
> Rename _get_unused_cpus() to _get_unused_rps_cpus() and cap the CPU
> search range to RPS_MAX_CPUS.
> 
> Fixes: 9cf9aa77a1f6 ("selftests: drv-net: hw: convert the Toeplitz test to Python")
> Reviewed-by: Nimrod Oren <noren@nvidia.com>
> Signed-off-by: Gal Pressman <gal@nvidia.com>

Reviewed-by: Simon Horman <horms@kernel.org>

