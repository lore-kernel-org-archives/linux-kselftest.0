Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE9E39DBD0
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 18:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979251; cv=none; b=nu8HtG0LVmTyhVMGPzd2wYBSuR4UeJQr9+nfka+a2/RjZgu2sDioAPqivteBknFYRoroQRPnzNpaKjv9xxtApzhPGzx/P2Vs2saTxzDaci1c+s0CWgg6bnThJZKbmhwrWfdLFKRmgOquyEmTIgBO/xthS+HKGkxpg6bRIiIPUks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979251; c=relaxed/simple;
	bh=DRAwhPSMOzhoJJRRnzoEYIrag3gaYJMbJRaZnzbbwj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4ILHpnTOCs8UpycUOrUKjXh6rsmoX0RwOv4DjyRMXEmTam+rk8YgNv5RfzpHyijvmSX4yRSiGJpSINh8CDKEKNQaWFBtRcItq7muTjzdCRS7H71D9ST80AeODk3RkJruxPvYM/Mt51bkgJcsFcQEAl6iqkzPXxx5HDSR1zxRK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkfHKqRF; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkfHKqRF"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7ee4399c3abso6086449a34.2
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 11:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788979249; x=1789584049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O7UxhbuxqRDbidvsvhsBV/Jg23n9ONgmz8jzAfiURPM=;
        b=EkfHKqRFF/bGYGEuclcigpLXhauYJlwdbj/c2MrvgCeoeFKgRFOAv7jiUf3erJU6Lf
         JGTeDQRQZZr1R17CIyYQoIPORYTxL+6h7X9pNFspBIyBii6Rg9K27EyczrIxgeMUQTB5
         ccXmyROeQFu04NISs0nYQb7q0ip1/+bfLIECxmBfA3n0e9HPaDpcYGQPbntivGdP2lCW
         dEy63KZU5JCsZUCmPYfBRdssh4eV9WpA9jbjURWZAoPZ7CLeUuj2Ymzawh8YBLVGZHBS
         8vmf3SkVmrSZKLUAyc038ImsOwzLzOSSzoi7EEjbIc9Mw8Fe1SaYyqFaDKHx0cI2TpIV
         2jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979249; x=1789584049;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7UxhbuxqRDbidvsvhsBV/Jg23n9ONgmz8jzAfiURPM=;
        b=LIirC5Qbq0cqi05FCehukWuxFelu8dB0iETVGEG0Ay0GYKjjd3cUtsMo2bUXKdX490
         FBtNS8DluORj1acJhBibT2pW3FzVbOJUWRxEsXTCkV6lD7SjeChh3CwyvSSeqBW2Vrxl
         HqEl3IIkQXJzBZV5qby+0ilTLSoDy5uzzgUTscqivIe7EDaUmkEUfiaIYFHZE/s0g893
         SK5UCXHKPtvvyZ2izYcdakYkhH2pF2jKUPoowt+LtW/mGuF2VLeIxk1bPWmbrOHQsdjH
         rKd+DAEEzg9Hcjfkj1tgdzqSuxEO6N0bdPqNqB8A2N/zyJa13nsspPH3cClSzlszC/FP
         Eg2A==
X-Forwarded-Encrypted: i=1; AKwUvBxMh5dSQ20S9bxarFZfuqTTQOPR0IBksqwnhrWlH9ZltoVcpkEPs7WxPPI3XSKceKG4DZFbS9WsAE986TdAyFY=@vger.kernel.org
X-Gm-Message-State: AFuF++lUeEOlOH3ZhXPct1BQLHnUQCI2kc9eX35qUHxOGafWOqyfne4L
	ZuwuVA2LsNfhIGMmNmmb8E7chjEAd7n/2AyynuBeOYaPJtBAhlIbQRHYYgag2w==
X-Gm-Gg: AYBFou2cSpR4CaFhCFPWvCy4br8vM4snoPuE6CcM+Y4fjWNYXLy0oZOoq2kowsRYNnW
	lEpZojsOcOmx5jxBTGfFtBPpJdzHEJX2Tis2NCKJRhBAJgXS2Y+Z0gRlxoJ/4VJigZqQCfjPNmY
	o28uVI3Q8JfODPAcZgEGT9FusiMt/Bv3iXibwTmwJrQ5A1+7oOBV4tQWAg+PfKGE2Y6Nk7DWjzY
	H6FWe1qKwEcXTX4sJCYvj+MWUAKCyggm7USiRePp9waqymoC/HE5BDdJl6ypZRZ7ZdI4N5jg2hm
	RnGsLYFropyTLG0wIpfQmT2bizvFfaWOoBsdZgYToiFktt/beq463XPY+EsUCJ3NCGwHt8msI0F
	m6HttLe919jaRnPVmDdU6E9BxFJcR6krfpjW+8ORLu++YkesEuuW9J1SFV4oI3sS2AfRHY+x/4b
	q9IDlkAJBYwLFg0ft8t4ImrLHHw1nx+VsJ4zkVVYdzfM1e0nXA/2NEMpqxJCTKRUmi472+qnYAs
	BUGUyu/0zEfr/pDMcQA
X-Received: by 2002:a05:6830:3808:b0:800:8151:52d with SMTP id 46e09a7af769-80081510a4cmr6737373a34.28.1788979248654;
        Wed, 09 Sep 2026 11:40:48 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:40::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f72d3d3csm18319790a34.18.2026.09.09.11.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:40:47 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:40:44 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	shuah@kernel.org, bobbyeshleman@meta.com, sdf@fomichev.me,
	leitao@debian.org, razor@blackwall.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: devmem: set reuseaddr on
 the sender's source port
Message-ID: <aqGoLKIOZAkcajKb@devvm29614.prn0.facebook.com>
References: <20260908183420.1369630-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908183420.1369630-1-kuba@kernel.org>

On Tue, Sep 08, 2026 at 11:34:20AM -0700, Jakub Kicinski wrote:
> devmem.py fails on the HW runners with:
> 
>   CMD[remote]: dd if=/dev/zero bs=512 count=1 2>/dev/null | socat -b 512 \
>     -u - TCP6:[fd00:2::1]:50051,bind=[fd00:2::2]:50051,nodelay
>     STDERR: socat[41018] W bind(5, {AF=10 [fd00:2::2]:50051}, 28): \
>             Address already in use
> 
> ncdevmem installs a 5-tuple flow rule which matches the source port, so
> socat has to bind it explicitly. The port comes from rand_port(), which
> checks availability on the DUT - but we bind on the remote...
> That said the failure rate seems to high to be random collisions
> (~2% per sub-test). It's probably TIME_WAIT sockets on the remote,
> run_rx_hds() alone creates 12 of them.
> 
> Set reuseaddr so a TIME_WAIT socket does not fail the bind. Collisions
> with a live socket are still possible, we'll see if they are frequent
> enough to care.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: shuah@kernel.org
> CC: bobbyeshleman@meta.com
> CC: sdf@fomichev.me
> CC: leitao@debian.org
> CC: razor@blackwall.org
> CC: linux-kselftest@vger.kernel.org
> ---
>  tools/testing/selftests/drivers/net/hw/devmem_lib.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/hw/devmem_lib.py b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> index 3554954a6691..b6e52fa9dda5 100644
> --- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> +++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> @@ -201,7 +201,7 @@ def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False,
>      else:
>          addr = cfg.baddr
>  
> -    suffix = f",bind={cfg.remote_baddr}:{port}"
> +    suffix = f",bind={cfg.remote_baddr}:{port},reuseaddr"
>  
>      buf = ""
>      if buf_size:
> -- 
> 2.55.0
> 

Reviewed-by: Bobby Eshleman <bobbyeshleman@meta.com>
