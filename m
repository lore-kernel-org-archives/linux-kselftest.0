Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472534;
	b=q35XbbA6s/AirWl1ioI3Aufq50x/fIP5VZjRdkMbzAlqQpuMi3RbGoYBQO6CIm/q+eSb
	 LIRUi5GyibW7r3A/nI99SWLSwH4z84EkMOEc5tX09JAjv0x+6bD6w5p7JWcU9i7PvJFWb
	 EFVdTb40bjvxrVO2WHBZjrGmmN0NMP+MggV0scL41Pwfe9RVGrQPtFIYdT2p1DRjVWe5y
	 CfGaI+ddj3WKAo1HONCmP+QNYmWdJ7o3BThVGKShOtidvwArh6EM2sjqHV/zUzpS+8pTT
	 WziZjdpvocVMBLAg7X/2ficyzhJyVZLUWwPBZjfnGv3cu3M9rE7k6ecesPdzKhW0vww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472534;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dKVNtn7bdM3YAW9/cnZrAZT8y8AfxYUcQfl2xiNbvxs=;
	b=GMNjR3Zvu/GQbP4D1Y+nUMe22D9CttYbURWDzpJGEZTyUrHD5J6LTmhbJz4UOwA6TTh0
	 GKftYhD/vCT2KT92mqaLVxa6mEXmXZQBg6D59oTsljjkEZKcWFS9uC16hGYdDxObM0cFN
	 6N2kZcfB5WuB5CL+4pt6z/TT7DxxCowzPNFGKe82vfvvY8S5aNYAJaZ1YEFX9z8z5XV8o
	 IMyEpRAndLqGUBolQFU/YcmOxysf5tMUGm3CSno+EALkSAC9tImfwkRJC9Ayid0GEeZAK
	 Q4sPMF+kHtmu9/wlUdDZAmxUmOUxc18ocMmQZS2NGrDcZL01X6cF1YKrsl6sOPg+Esw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mr/oqIs/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 6128A606C808;
	Thu, 12 Nov 2026 08:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mr/oqIs/
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6FD431F00A05;
	Thu, 12 Nov 2026 08:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472534;
	bh=dKVNtn7bdM3YAW9/cnZrAZT8y8AfxYUcQfl2xiNbvxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mr/oqIs/rJXeTIkb54mgzza1v4W4pxAVZgVmoBrVK2d+o2DmjcgtF5jLTMH9UbGVg
	 JS3DYOV/dsVPO0zWU9/GI+d+f4ipV9u6+Pv2C1he8p6tTTSJ0hWk5zIHOMD/djOCPw
	 JDCCNhhscp472YsTukARh1dEXLVbHkUpaBugbFKDORhr0lKjvKR6jT95Ew557JJ6/e
	 lYDia1f8Qmaed+2xj6TpAE+P2nKiQlIPBJsaWbvJgVRNq8ZCI18oLR8E9mtds17Q0c
	 qYxn++eublnvnr37v5YXubcHRT0LcD6jAIBO2Mqjq+TtNOPCa2E+XWgmofpBFwFjMZ
	 qah4E7SdFf5rA==
Date: Thu, 12 Nov 2026 09:35:24 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kunit: configs: enable power sequencing kunit test cases
 in all_tests.config
Message-ID: <v5nvejf3gibujdxbcwcgbrnlxduwhuee6dhi4bdph5ygkkmvpf@qxb52uuewqz6>
References: <20261023-pwrseq-kunit-all-tests-v1-1-a60f8637527c@oss.qualcomm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-pwrseq-kunit-all-tests-v1-1-a60f8637527c@oss.qualcomm.com>

On Fri, Oct 23, 2026 at 12:07:49PM +0200, Bartosz Golaszewski wrote:
> Enable CONFIG_POWER_SEQUENCING in all_tests.config to ensure the kunit
> test cases for power sequencing core can be built with this config.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  tools/testing/kunit/configs/all_tests.config | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/kunit/configs/all_tests.config b/tools/testing/kunit/configs/all_tests.config
> index 31e930a0fb6912ff1daf20bae8ab007ba3b0e77a..2e95db076a26327f59e87d83bcedd0d7c686c240 100644
> --- a/tools/testing/kunit/configs/all_tests.config
> +++ b/tools/testing/kunit/configs/all_tests.config
> @@ -61,3 +61,5 @@ CONFIG_SND=y
>  CONFIG_SND_SOC=y
>  CONFIG_SND_SOC_TOPOLOGY_BUILD=y
>  CONFIG_SND_SOC_CS35L56_I2C=y
> +
> +CONFIG_POWER_SEQUENCING=y
>

Gentle ping. If nobody wants to pick it up, I can take it via the power
sequencing tree.

Thanks,
Bart
