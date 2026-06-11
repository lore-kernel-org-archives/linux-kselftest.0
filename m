Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97B93803D6
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781213019; cv=none; b=mH+5JOzFg4madKb9CLgII9ns80YZmaHBKetl98w3xoYTbFBVlQhCEG8f0CvxFVj78kBCM+6yrTLz1UjTwCbljX0gaSgxtYvBMJ/bpIRF99GycECkavnemE+shWEPqyo7XoskzVTlGXVU7i6hs968C5EweLE0Ddp7ZfTKSYHW5Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781213019; c=relaxed/simple;
	bh=oW4BQVUMFiOSZ6wG+yY+yDEPmzWrRE0msdDCfL+5TSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGv0mjx0kICd+sOm5mCJnt5zIMxlTddXqDICIgHdhFzsi/Vf658Oyg0uI0kNaXyTSNon+aeE/Pj+IzQFkUemeOzYECukgwrCr6w1TF6CyxTbAhEbhIEcfXsxtJAkIy4VUOtu/G8cl2rKQiSr6xdRZu/tQvk7Gi1AH5uQedLXDbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6dG2yl2; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6dG2yl2"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so273346a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781213016; x=1781817816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SYDMbx/NSE1Ez69WzG00jvFaSdDUPkagmOI6dnx+MPA=;
        b=H6dG2yl2zJV/oKbbYQu6GCcipBPkFdU0M68TUvQ+4rx9XybSeI9BJAXpBU2r1Y8Bhx
         JEaawpzprqlLju87kM56ITzt9zRv9vjRL2nXeSY2adcsPsLaTrvLjp7BEuUNzyWRe2sI
         C59Qzk3EUF0uOJ0iseAeGFQYGYnVO9UlF1vpdXsTFTSDeY1L4tArl3CGZGC70uhQHfZ9
         DJmL5kiCn55IVQ3mhMvolHfzns9+IYocS58XvL6dD0znBsMxC6O3qoiu5VexSful6n53
         NrZ0rzuA7lBn3bA9XI1oZDj/rry8cvGrRNlhPW6vv0x57gu8JR5qTbRu8kyRz916ke6k
         I4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781213016; x=1781817816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYDMbx/NSE1Ez69WzG00jvFaSdDUPkagmOI6dnx+MPA=;
        b=N0wicfTvC0yBIQPHtCQRAip9cckenhWlJeDQRC152XFeTGuLr1b93/vEwvk9O2tdcZ
         IEw5DPV6Z2U4zFM9X8OM4BwQ6/VIIMbQN3atEyUzQCd3kMbO5a90LwXdIC++C4uTV5Rz
         9Mabe839gLwIa5+xgbh7NLYMGDSkU3WLss5djKTPmV5kdowyXYijoYHbpGLZ9qa/TleI
         qIGXf3+yy4PZV1yEbl5miXP/WVKuZrxDu05GR16xdMg/cqF+pnA4IwnwkAJKi8dP1MHh
         JAeCPbKEGGrl6LWfvQP5BkSGz64rB9F4kyVO/evQbrbkhbH4kowFCUbXVanlZNvO/WHo
         A8Sg==
X-Forwarded-Encrypted: i=1; AFNElJ9bE4+SclkLouQZ2SSev01XleFhjHCniryJR1ykG6AWkDvVLE4DX90qUKmKu/EpERyJPi1Bv/H+4fZEB7pupu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHOGy2ktUOoQWHnUwHA2nT4NaOegTIU7J8uACM6382TnmjTbod
	fJgX7HpNTknMNltzJ17B1ZyDR3Fkx2OvRHUBDoGRIHGycdYp2hwHMxMJ
X-Gm-Gg: Acq92OGVViqLd9KaKdAamn4eE0F/T6XwmuBs/bXKp6ljPLCVk4IkD9hBd7cuxZqfI1O
	U88CBozz93tbX4CKotHW6etpm2kFvEcMkHcV0H96RSjQQBmQT6zLRP7iWnyoPTJCWiccaJFlg7+
	SWxPiYN1QoPjpAMetafcjne9zPNqbRmToMd979a3ha+FvtO0YTxbwDPU0MA4MK2qsxjByjynf4/
	fVXmmAlPHnEcaRNeLKjR/6XTnAeqYGx4NKO3o17m3Q1achP9sDwR4d+awoCOOma4VSmN/jOWb4c
	/4QgMrr4VqKmWKbGShUVidj7jBzNc65oP1mX4BJWRpwxRr8DQaE4U85XKYsO1nOK/wz5SSlU0tY
	MrSEntpOhGBO6llPdCQi7lU0gIW27vWteHA3BLdet2+yNE5HHxKpG4mi2Feh/6A5tjUFSyAJuBR
	1SZTG1qG1p/yNsZEo=
X-Received: by 2002:a17:90b:2c8d:b0:36b:91a3:6af3 with SMTP id 98e67ed59e1d1-37a01c350c5mr145061a91.7.1781213015970;
        Thu, 11 Jun 2026 14:23:35 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:9::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3774f99cf24sm3481176a91.0.2026.06.11.14.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 14:23:35 -0700 (PDT)
Date: Thu, 11 Jun 2026 14:22:54 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, sdf@fomichev.me, 
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com, matttbe@kernel.org, 
	skhawaja@google.com, dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v2 3/4] selftests/net: ncdevmem: add -b option
 to set rx-buf-size on bind
Message-ID: <aislm0fS2MSDMzKf@devvm7509.cco0.facebook.com>
References: <20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com>
 <20260611-tcpdm-large-niovs-v2-3-ee2bf15e7523@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260611-tcpdm-large-niovs-v2-3-ee2bf15e7523@meta.com>

On 06/11, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Add -b <bytes> to request a non-default niov size via
> NETDEV_A_DMABUF_RX_BUF_SIZE. When the value exceeds PAGE_SIZE,
> udmabuf_alloc() switches to an MFD_HUGETLB-backed memfd so each 2 MB
> hugepage produces one naturally-aligned sg entry.
> 
> Reject values > 2 MB up front: MFD_HUGETLB + udmabuf can only guarantee
> 2 MB per sg entry (one hugepage), so a larger rx_buf_size would fail the
> per-sg length/alignment check.
> 
> Add CONFIG_HUGETLBFS=y to drivers/net/hw/config so the new path is
> reachable in the CI kernels built for these tests.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> ---
>  tools/testing/selftests/drivers/net/hw/config     |  1 +
>  tools/testing/selftests/drivers/net/hw/ncdevmem.c | 49 +++++++++++++++++++++--
>  2 files changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/hw/config b/tools/testing/selftests/drivers/net/hw/config
> index cd20024218cd..ed8642b68094 100644
> --- a/tools/testing/selftests/drivers/net/hw/config
> +++ b/tools/testing/selftests/drivers/net/hw/config
> @@ -3,6 +3,7 @@ CONFIG_FAIL_FUNCTION=y
>  CONFIG_FAULT_INJECTION=y
>  CONFIG_FAULT_INJECTION_DEBUG_FS=y
>  CONFIG_FUNCTION_ERROR_INJECTION=y
> +CONFIG_HUGETLBFS=y
>  CONFIG_INET6_ESP=y
>  CONFIG_INET6_ESP_OFFLOAD=y
>  CONFIG_INET_ESP=y
> diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> index d96e8a3b5a65..325c128191e2 100644
> --- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> +++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> @@ -61,6 +61,7 @@
>  #include <sys/time.h>
>  
>  #include <linux/memfd.h>
> +#include <sys/param.h>
>  #include <linux/dma-buf.h>
>  #include <linux/errqueue.h>
>  #include <linux/udmabuf.h>
> @@ -79,6 +80,7 @@
>  #define PAGE_SHIFT 12
>  #define TEST_PREFIX "ncdevmem"
>  #define NUM_PAGES 16000
> +#define MB(x) ((x) << 20)
>  
>  #ifndef MSG_SOCK_DEVMEM
>  #define MSG_SOCK_DEVMEM 0x2000000
> @@ -100,6 +102,7 @@ static unsigned int dmabuf_id;
>  static uint32_t tx_dmabuf_id;
>  static int waittime_ms = 500;
>  static bool fail_on_linear;
> +static uint32_t rx_buf_size;
>  
>  /* System state loaded by current_config_load() */
>  #define MAX_FLOWS	8
> @@ -142,6 +145,7 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
>  {
>  	struct udmabuf_create create;
>  	struct memory_buffer *ctx;
> +	unsigned int memfd_flags;
>  	int ret;
>  
>  	ctx = malloc(sizeof(*ctx));
> @@ -156,9 +160,14 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
>  		goto err_free_ctx;
>  	}
>  
> -	ctx->memfd = memfd_create("udmabuf-test", MFD_ALLOW_SEALING);
> +	memfd_flags = MFD_ALLOW_SEALING;

[..]

> +	if (rx_buf_size > (uint32_t)getpagesize())

What's the logic behind explicit (uint32_t) cast? uint vs int
comparisons should promote the int to uint automatically?

> +		memfd_flags |= MFD_HUGETLB | MFD_HUGE_2MB;
> +
> +	ctx->memfd = memfd_create("udmabuf-test", memfd_flags);
>  	if (ctx->memfd < 0) {
> -		pr_err("[skip,no-memfd]");
> +		pr_err("[skip,no-memfd%s]",
> +		       (memfd_flags & MFD_HUGETLB) ? " (need hugepages)" : "");
>  		goto err_close_dev;
>  	}
>  
> @@ -168,6 +177,11 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
>  		goto err_close_memfd;
>  	}
>  
> +	if (memfd_flags & MFD_HUGETLB) {
> +		size = roundup(size, MB(2));
> +		ctx->size = size;
> +	}
> +
>  	ret = ftruncate(ctx->memfd, size);
>  	if (ret == -1) {
>  		pr_err("[FAIL,memfd-truncate]");
> @@ -699,6 +713,8 @@ static int bind_rx_queue(unsigned int ifindex, unsigned int dmabuf_fd,
>  	netdev_bind_rx_req_set_ifindex(req, ifindex);
>  	netdev_bind_rx_req_set_fd(req, dmabuf_fd);
>  	__netdev_bind_rx_req_set_queues(req, queues, n_queue_index);
> +	if (rx_buf_size)
> +		netdev_bind_rx_req_set_rx_buf_size(req, rx_buf_size);
>  
>  	rsp = netdev_bind_rx(*ys, req);
>  	if (!rsp) {
> @@ -1411,7 +1427,7 @@ int main(int argc, char *argv[])
>  	int is_server = 0, opt;
>  	int ret, err = 1;
>  
> -	while ((opt = getopt(argc, argv, "Lls:c:p:v:q:t:f:z:n")) != -1) {
> +	while ((opt = getopt(argc, argv, "Lls:c:p:v:q:t:f:z:nb:")) != -1) {
>  		switch (opt) {
>  		case 'L':
>  			fail_on_linear = true;
> @@ -1446,6 +1462,33 @@ int main(int argc, char *argv[])
>  		case 'n':
>  			skip_config = 1;
>  			break;
> +		case 'b': {
> +			char *endp;
> +			unsigned long val;

Christmas tree here as well?

> +
> +			errno = 0;
> +			val = strtoul(optarg, &endp, 0);

[..]

> +			if (errno || endp == optarg || *endp || val == 0 ||
> +			    val > UINT32_MAX) {
> +				pr_err("invalid rx_buf_size: %s", optarg);
> +				return 1;
> +			}

This is too sophisticated :-/ Just (if val == UINT32_MAX && errno == ERANGE) ?
(you're looking for an overflow here supposedly?)

[..]

> +			if (val & (val - 1)) {
> +				pr_err("rx_buf_size must be a power of 2");
> +				return 1;
> +			}
> +			if (val < (unsigned long)getpagesize()) {
> +				pr_err("rx_buf_size must be >= PAGE_SIZE (%d)",
> +				       getpagesize());
> +				return 1;
> +			}
> +			if (val > MB(2)) {
> +				pr_err("rx_buf_size > 2 MB not supported");
> +				return 1;
> +			}

We already check these on the kernel size, so should be ok to drop? 
