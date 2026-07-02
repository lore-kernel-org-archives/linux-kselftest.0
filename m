Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5BB33F8CA
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Jul 2026 20:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783025586; cv=none; b=r9DOWuHN9GE4Z99RyDFl5g6P6FLyzhb+NK1S8syiDthwW5Vw9lKCT9nIWfOqCQ4SM7g5Ku01cXyMhG+/8SggVio4ngldJu7EP0JOUGj+jIIoaeph7FHNblnIQ00Fsp+UedKIQWyjjwFdB4ZRt0uOec1xuabQKoH4rjhlHLzrpw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783025586; c=relaxed/simple;
	bh=90X6nwoMcrMyfEKMt542bHgq7hQLvNHeiApFXnkbcls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQv4+pUKDgTDNAOcmbwvzgIcGQh0jSArbV88Drf+6zTlU5tsdpLpREWEeJgvr2N/RBeHi5pbuaSPvQXR9QPlrKhWnr4lJP8mIyGLbk/jJW4sIQnviQUNukcBiHscaIprR0MnUEDVHkXZw93xPLRUb23nAJAgLvEP0g6O398LiDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ej8i8WDa; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ej8i8WDa"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-69dead44101so1537478eaf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Jul 2026 13:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783025584; x=1783630384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OUUT9U/zE34DOVJLI19IRKYtBuKLwinorFscWJ3YAUg=;
        b=Ej8i8WDaiCF8QhuUucg46HRkTgyDFK4XLMMhz07Cm/BDxjqAARpU6kiy4uYGFbePiy
         13fccyYoGUCd8x8B9Wqt/mGFU2Uct7Ziqb3LYsMULCp43t7x9DBk6l8ywKglfw+X5iAh
         ExNFilcHLxiL08I/TXkUyOywfdcsFTKNtzznRLZL7CszwsLf+4mAvZ8yo+hIEEWgQ+n4
         Mj6FbJLqmvsGSR9GDc6klI92qQ45FlTuqUCt3qASMNr6q/W0R78sjlwPa33JYX+LGeT1
         4SEQRqO8RC9oxDFqol6XErRaaNvPaiys0p1oxmpG3C/LlAN1jFrevh38PtuXnK9+S+ay
         a0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783025584; x=1783630384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUUT9U/zE34DOVJLI19IRKYtBuKLwinorFscWJ3YAUg=;
        b=e2ai5f7/+wv6rZlTRlXfI6Ao9Q1mUXFHife4OooOiOYQpi08p5/t7IJA+sPVOkwFj7
         JBa0TdMlkUpNSrCFwTSyV2bK2x5bo/0K+hN7GefGp4I82bg7YHg4z81RJ7y96OjCsF98
         DiVHOEEjrbhm2M4uJzLT27a1h6w85Z5XhdNz3fVwRkxVl+uMW8r9/ckz+91hB5mAnZqV
         KDTEngyaHIIrT7/zSQNxTlEjdTLVQ5sRKcBZu4+jMszMuiWQVnw36H6ZRjGY+NnE3qhf
         hfFhi34ERdOh0XDi77IqUqc+YEpl2a/6albfovXLNos6bfTUHMzN8NRxnzgykBKiBblh
         fOOA==
X-Forwarded-Encrypted: i=1; AFNElJ+//XnoyHsBiPptU+lAd7hZXVeIH9MYuAEzxBzkmKqfesJypWKhlQ17g4QXUYq+64vXfaU/rZ7tNedsR0bEMn0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ExVGwivUhpyGJihwKrZHgeEP6PmeKqRq0ithf6Vjj2GGualq
	SqTckCuf67SBbY2fHMBRUZClTSgBTYFRMVbMRiJpeV12IG1CzKxpVbs8
X-Gm-Gg: AfdE7cmJ5bA33dkroJ4tjmQmlzgwHSHrlqzL8QELo5X9ZWMHyQ4dn3oX4AqtNCrzxRs
	WKUynt7EjaZ67tt03hSvS/sMYc6z0+J/KioYI+xZwZsEGzt8j3dvuc0taiwXU5TUN/FZlGmLkzl
	NLCA5zUd3ePgrZAyQELN929155Nx7STipp/ZkFwvu9UnEFUy6ddH13K4h5+T5bigCXdi+d4Gwvc
	eJgdBsPmd96pRWiPTkfWtldhg0bm/F+vxAQhV/RyFvkav7JES6sXpiALsCVTIVO/90kVjjn+zl8
	VF8dUYKjuVcnOCfdQmFC4u458Zh6EwNg1fETlQpCaYKZFT+ASQQyTQCqksgGIMWk10lrvcNLKr+
	ho9zEUtQcY+hKU2DA4tzQxl5RS7FoOaxeLscYc4C68bgMP8L/NnEGIks5yzw2MbMQZbgjaWncLG
	g2SVGYCgzkIeBIhFto0YDYhYrCuTksftAm
X-Received: by 2002:a05:6820:1512:b0:6a1:50eb:2110 with SMTP id 006d021491bc7-6a309b831e1mr4672517eaf.69.1783025584368;
        Thu, 02 Jul 2026 13:53:04 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:8::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb54534789sm3393061a34.26.2026.07.02.13.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:53:03 -0700 (PDT)
Date: Thu, 2 Jul 2026 13:53:00 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: kraxel@redhat.com, vivek.kasireddy@intel.com, kuba@kernel.org,
	Shuah Khan <shuah@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2] selftests: Open /dev/udmabuf O_RDONLY
Message-ID: <akbPrI67h5btdI44@devvm29614.prn0.facebook.com>
References: <20260701192210.2997769-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701192210.2997769-1-tjmercier@google.com>

On Wed, Jul 01, 2026 at 12:22:08PM -0700, T.J. Mercier wrote:
> Write permissions on the /dev/udmabuf device file are not required to
> issue ioctls and allocate udmabufs. Applications should be opening this
> file as O_RDONLY. The BPF dmabuf_iter selftest already does this. [1]
> 
> Users are pointing to these selftests as examples of how use udmabuf,
> and encountering permission errors on systems where write permissions
> are not available on /dev/udmabuf. Apply the principle of least
> privilege to selftests which use udmabuf by removing the write access
> mode from drivers/dma-buf/udmabuf.c and drivers/net/hw/ncdevmem.c.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c?h=v7.1#n49
> 
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
>  tools/testing/selftests/drivers/dma-buf/udmabuf.c | 2 +-
>  tools/testing/selftests/drivers/net/hw/ncdevmem.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> index d78aec662586..ced0b95c876c 100644
> --- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> +++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> @@ -140,7 +140,7 @@ int main(int argc, char *argv[])
>  	ksft_print_header();
>  	ksft_set_plan(7);
>  
> -	devfd = open("/dev/udmabuf", O_RDWR);
> +	devfd = open("/dev/udmabuf", O_RDONLY);
>  	if (devfd < 0) {
>  		ksft_print_msg(
>  			"%s: [skip,no-udmabuf: Unable to access DMA buffer device file]\n",
> diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> index e098d6534c3c..8114a29692fd 100644
> --- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> +++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> @@ -149,7 +149,7 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
>  
>  	ctx->size = size;
>  
> -	ctx->devfd = open("/dev/udmabuf", O_RDWR);
> +	ctx->devfd = open("/dev/udmabuf", O_RDONLY);
>  	if (ctx->devfd < 0) {
>  		pr_err("[skip,no-udmabuf: Unable to access DMA buffer device file]");
>  		goto err_free_ctx;
> 
> base-commit: fbb7ad31ab376c5101b2ac7205fad0344fd2de60
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog
> 

Reviewed-by: Bobby Eshleman <bobbyeshleman@meta.com>
