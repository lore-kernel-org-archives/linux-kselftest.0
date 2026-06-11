Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4B2378D63
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 21:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781215094; cv=none; b=YLZv5mf9ZOVdHNBJ3Fnsmlv1Ez46kbq7draMbYx5f4/Qo8EP+8Bv9tXMx3mFtVBdballe3oVNTY0QHMA47jAcPjr2tLoE3wzcQqUzYXSqJPMIIce+DxBA/K+x2ZCm1gFrgQr7aagTh4YlSrEqEIeUNbdh91XluC6MVw7pVlA+B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781215094; c=relaxed/simple;
	bh=WTmYiCljJrOBi/BJCgoXELeKtejWqYZNFbSiafJn5Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cq6eAnFv6tzChkG5WBgvk49QfWVfEGfO73vV5avkERfk7x5Yu6fi6YIYCZfzioXWxEKKKufDYAa8S+L9b2zl6Sat2puNDN/8Oe1h/Qz4OHYRBrXcj/+71DN5iYs6Ni+kJB1uG1lJo8qFiQEUpWsnHgCjc1yYYG65DinlKF/7Nik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UacGkicw; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UacGkicw"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36b9033d230so247547a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 14:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781215093; x=1781819893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=058Dub1D8Mo8YvUnluCsrCmQe9OxK3zbzQpkHf2iTGc=;
        b=UacGkicwZdSQADbTsLBpKodZvKCdFBgsXKO/l0t7vKJCs9OTyIcocMZHVznAyh6m77
         fb8XhMjzzVs7KlOJvnIq9abUDg9HL0xEqV0Bh45gqrnyH37jC8d1eekddKFqFxf7Srk5
         bzdXOh5nGJyvcqMIfPuzHOkrLt4Ib8BTHty9A6+ZR+De4db7vLdExO5hhwKL24xjJPJG
         DIQAxO6uo35uuDWkjvYl44hQx7hdCkCQe0F0H4UtLfKQrE6uQvlU13C8DYMF7tmF1+NK
         9tMBzTE6mDu+UBJGiyG0zPEiN8zbU0CMCRcJFUNcWxt2Q8kpQTpFpjs+HrwDd0T8SAcf
         C1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781215093; x=1781819893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=058Dub1D8Mo8YvUnluCsrCmQe9OxK3zbzQpkHf2iTGc=;
        b=erTO7MJFzHgbkw9qm774r5NFIf7cSj/2cO03fwviMwG0UmGJjoGRt0JKL5kCfZpfhQ
         BX9WP7QE/Lgl1gRgIZk5G2yHiInXA7MaycGc4Tz3l98I84uy5VnqMtmDfvUF1e+WptyD
         fCGsxRkt3dj9+3VtQB7Ovy9rE3n4dOGmHd1AgizpTRUvxWDzZlsSVNq9MP0aO1PK4vXq
         n9VMquZAVCityRSREmRBe1+mXvBKzY8kpkpWdOlc+KXyXo/rweOi8DgJ/bZqCb2ACa8g
         hotYxrqytWoZQV+TiBm3pposnh47qqIo8GA4ea3ROBlpVkXDl7aNKgYL3JoGuvz4trLS
         ctYw==
X-Forwarded-Encrypted: i=1; AFNElJ/7fX0qcb9hcDgWUdO7Ng5wWeE35bUrqOmankUXioh/8eicPm1ja6VTgzS6FOjEoSDaO0DFFrwk118paHV84AQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAokCpusLRlTDz7QLzfcI8XfwlbsASR3PHHXcoPpOp7Y28pF1p
	ML3i6WHde1/4QYBWZShAqkJ63ZzbcROild7uj22+PnoOtOzdR1yn9Rnk
X-Gm-Gg: Acq92OGoGwsXTF6EBVvWfsYQGxKf2Vqg9URSwMG/Pa7mIueNj67BeTzG4w0XU2L4RFA
	2PvJ6Lmud33dtGxbVuyy4vLy98pRh/MkLu85iLMUa+a8lzazEkXKYWSQr8z6RYAlu9up1wZi+et
	LTQAMN+g56t9+AwUzteFfE40fHNE4f+tmhIZvlEIKqiMZepVqJr9Ux+F52uxaWsr19Q/t1UZIUo
	6pS7xFKLYcqxelvz52tIt3bSgMfGFdTAPu740Tpv23dfQ/r6iDvt9OMo2x80mxoN6jI/pY43CjB
	TkigrZ0hbSLqNnt3cVU4pT9GwZNMgPzg6TV871SfuImaxsp/31WSNCrAJt5Q+kDUBWtIBGoC32X
	2hFoq9mFFW0QD2mO5l7TN+sAVVj3PgdkQqY3Q8btmQMLIoLrj65F3QAuZuj+pfUjxMb4F8UFrO3
	t3ULvOjcwLrw5c9Awz8aS9eRyaKqYQmZ67ejwvdlZ/9/E=
X-Received: by 2002:a17:90b:2cc3:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-379ef747839mr387023a91.10.1781215092780;
        Thu, 11 Jun 2026 14:58:12 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:8::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379c3240b5esm327367a91.0.2026.06.11.14.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 14:58:12 -0700 (PDT)
Date: Thu, 11 Jun 2026 14:58:10 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com,
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v2 3/4] selftests/net: ncdevmem: add -b option
 to set rx-buf-size on bind
Message-ID: <aisvcqQp37rnfK5d@devvm29614.prn0.facebook.com>
References: <20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com>
 <20260611-tcpdm-large-niovs-v2-3-ee2bf15e7523@meta.com>
 <aislm0fS2MSDMzKf@devvm7509.cco0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aislm0fS2MSDMzKf@devvm7509.cco0.facebook.com>

On Thu, Jun 11, 2026 at 02:22:54PM -0700, Stanislav Fomichev wrote:
> On 06/11, Bobby Eshleman wrote:
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > Add -b <bytes> to request a non-default niov size via
> > NETDEV_A_DMABUF_RX_BUF_SIZE. When the value exceeds PAGE_SIZE,
> > udmabuf_alloc() switches to an MFD_HUGETLB-backed memfd so each 2 MB
> > hugepage produces one naturally-aligned sg entry.
> > 
> > Reject values > 2 MB up front: MFD_HUGETLB + udmabuf can only guarantee
> > 2 MB per sg entry (one hugepage), so a larger rx_buf_size would fail the
> > per-sg length/alignment check.
> > 
> > Add CONFIG_HUGETLBFS=y to drivers/net/hw/config so the new path is
> > reachable in the CI kernels built for these tests.
> > 
> > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> > ---
> >  tools/testing/selftests/drivers/net/hw/config     |  1 +
> >  tools/testing/selftests/drivers/net/hw/ncdevmem.c | 49 +++++++++++++++++++++--
> >  2 files changed, 47 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/drivers/net/hw/config b/tools/testing/selftests/drivers/net/hw/config
> > index cd20024218cd..ed8642b68094 100644
> > --- a/tools/testing/selftests/drivers/net/hw/config
> > +++ b/tools/testing/selftests/drivers/net/hw/config
> > @@ -3,6 +3,7 @@ CONFIG_FAIL_FUNCTION=y
> >  CONFIG_FAULT_INJECTION=y
> >  CONFIG_FAULT_INJECTION_DEBUG_FS=y
> >  CONFIG_FUNCTION_ERROR_INJECTION=y
> > +CONFIG_HUGETLBFS=y
> >  CONFIG_INET6_ESP=y
> >  CONFIG_INET6_ESP_OFFLOAD=y
> >  CONFIG_INET_ESP=y
> > diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> > index d96e8a3b5a65..325c128191e2 100644
> > --- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> > +++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> > @@ -61,6 +61,7 @@
> >  #include <sys/time.h>
> >  
> >  #include <linux/memfd.h>
> > +#include <sys/param.h>
> >  #include <linux/dma-buf.h>
> >  #include <linux/errqueue.h>
> >  #include <linux/udmabuf.h>
> > @@ -79,6 +80,7 @@
> >  #define PAGE_SHIFT 12
> >  #define TEST_PREFIX "ncdevmem"
> >  #define NUM_PAGES 16000
> > +#define MB(x) ((x) << 20)
> >  
> >  #ifndef MSG_SOCK_DEVMEM
> >  #define MSG_SOCK_DEVMEM 0x2000000
> > @@ -100,6 +102,7 @@ static unsigned int dmabuf_id;
> >  static uint32_t tx_dmabuf_id;
> >  static int waittime_ms = 500;
> >  static bool fail_on_linear;
> > +static uint32_t rx_buf_size;
> >  
> >  /* System state loaded by current_config_load() */
> >  #define MAX_FLOWS	8
> > @@ -142,6 +145,7 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
> >  {
> >  	struct udmabuf_create create;
> >  	struct memory_buffer *ctx;
> > +	unsigned int memfd_flags;
> >  	int ret;
> >  
> >  	ctx = malloc(sizeof(*ctx));
> > @@ -156,9 +160,14 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
> >  		goto err_free_ctx;
> >  	}
> >  
> > -	ctx->memfd = memfd_create("udmabuf-test", MFD_ALLOW_SEALING);
> > +	memfd_flags = MFD_ALLOW_SEALING;
> 
> [..]
> 
> > +	if (rx_buf_size > (uint32_t)getpagesize())
> 
> What's the logic behind explicit (uint32_t) cast? uint vs int
> comparisons should promote the int to uint automatically?

Right, it's actually not needed. Avoids -Wsign-compare, but we don't use
it anyway.

> 
> > +		memfd_flags |= MFD_HUGETLB | MFD_HUGE_2MB;
> > +
> > +	ctx->memfd = memfd_create("udmabuf-test", memfd_flags);
> >  	if (ctx->memfd < 0) {
> > -		pr_err("[skip,no-memfd]");
> > +		pr_err("[skip,no-memfd%s]",
> > +		       (memfd_flags & MFD_HUGETLB) ? " (need hugepages)" : "");
> >  		goto err_close_dev;
> >  	}
> >  
> > @@ -168,6 +177,11 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
> >  		goto err_close_memfd;
> >  	}
> >  
> > +	if (memfd_flags & MFD_HUGETLB) {
> > +		size = roundup(size, MB(2));
> > +		ctx->size = size;
> > +	}
> > +
> >  	ret = ftruncate(ctx->memfd, size);
> >  	if (ret == -1) {
> >  		pr_err("[FAIL,memfd-truncate]");
> > @@ -699,6 +713,8 @@ static int bind_rx_queue(unsigned int ifindex, unsigned int dmabuf_fd,
> >  	netdev_bind_rx_req_set_ifindex(req, ifindex);
> >  	netdev_bind_rx_req_set_fd(req, dmabuf_fd);
> >  	__netdev_bind_rx_req_set_queues(req, queues, n_queue_index);
> > +	if (rx_buf_size)
> > +		netdev_bind_rx_req_set_rx_buf_size(req, rx_buf_size);
> >  
> >  	rsp = netdev_bind_rx(*ys, req);
> >  	if (!rsp) {
> > @@ -1411,7 +1427,7 @@ int main(int argc, char *argv[])
> >  	int is_server = 0, opt;
> >  	int ret, err = 1;
> >  
> > -	while ((opt = getopt(argc, argv, "Lls:c:p:v:q:t:f:z:n")) != -1) {
> > +	while ((opt = getopt(argc, argv, "Lls:c:p:v:q:t:f:z:nb:")) != -1) {
> >  		switch (opt) {
> >  		case 'L':
> >  			fail_on_linear = true;
> > @@ -1446,6 +1462,33 @@ int main(int argc, char *argv[])
> >  		case 'n':
> >  			skip_config = 1;
> >  			break;
> > +		case 'b': {
> > +			char *endp;
> > +			unsigned long val;
> 
> Christmas tree here as well?

Ah right, don't know how I missed that. Thank you.

> 
> > +
> > +			errno = 0;
> > +			val = strtoul(optarg, &endp, 0);
> 
> [..]
> 
> > +			if (errno || endp == optarg || *endp || val == 0 ||
> > +			    val > UINT32_MAX) {
> > +				pr_err("invalid rx_buf_size: %s", optarg);
> > +				return 1;
> > +			}
> 
> This is too sophisticated :-/ Just (if val == UINT32_MAX && errno == ERANGE) ?
> (you're looking for an overflow here supposedly?)

yes, sounds good!

> 
> [..]
> 
> > +			if (val & (val - 1)) {
> > +				pr_err("rx_buf_size must be a power of 2");
> > +				return 1;
> > +			}
> > +			if (val < (unsigned long)getpagesize()) {
> > +				pr_err("rx_buf_size must be >= PAGE_SIZE (%d)",
> > +				       getpagesize());
> > +				return 1;
> > +			}
> > +			if (val > MB(2)) {
> > +				pr_err("rx_buf_size > 2 MB not supported");
> > +				return 1;
> > +			}
> 
> We already check these on the kernel size, so should be ok to drop? 

True, that works.

Best,
Bobby
