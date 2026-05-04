Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5593346A0B
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 21:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777929346; cv=none; b=iiehYGefj7I8rNIcjWoZO0dxZqUFC/00wh4BVm0ApH8IEe/UlCV+G0JCfS0DuLpzwr1851qLZoC+Umu2wEL0tvBNMesWNS2wU3VWIPqQn6cKXpHgyktyqIRNkNKV8JQkTFob5O6W1J28+6MYvdG0he5id0QtNKNpjt/GW9sWxSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777929346; c=relaxed/simple;
	bh=DklPH6/6YJ0p6u4Cf1PUxpd4itLk/dZorR5WDOT5W/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbdAq/Z+O3O56VRwEvhM+2YxAqKIFm75P8b8SimsyMnnIuP/x1Yaz8w3GWZSvY1Y6pB2YtxV193qYIYoeFDGH7f4/78Ub5YsvMgyJJWQVTqtRkTP6JbbBVFq9Q4tm0QAcgsiZj+oZ8Rx9+eJAO6NtqOc2C8iEg7r/bVO7fCJuJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=khNLVBj4; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="khNLVBj4"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-835c98b659eso1018534b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 14:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929343; x=1778534143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JKpE5oRLemYbfg1MRy2f9zZjvjCWWH6F7jRfRxX1jLc=;
        b=khNLVBj4s5KuwBKGO9lJ/eqFzIsaK4KCG4wxZKNMPcAQ+Wn4tSOkIMa7+xeZfkE0IQ
         3wFfDaSM7aKJ7tAOwx6mOBeiBE8WMDL8FG64mRwSytpDDhYTVV9zxqzFnf4qocem4m1A
         Q4+h3WMazXtwwGvMdIgRuCns/ULO/NE5Mm3eZM+xBwLC9RJ/hmNkmXArWF+P2FqRgWpo
         kzPr/bJT6yDka0BgH8kQ15LdJqv5zEe13wipN0AXPaf3EYFO90kmSlHvuu2A7FxuV+TW
         qgI7HBYuOt+q9qGHJvR7VCt2OMa3CA41le3Fc1UEr9pkg1REKRRIeN+65f3hhLviS2Si
         tqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929343; x=1778534143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKpE5oRLemYbfg1MRy2f9zZjvjCWWH6F7jRfRxX1jLc=;
        b=HnAjEn9b2pjCvNJmbAYVobb+v7KvgCH6l9VHsez6v2zjtdCE3n1qVnjpnsXQolK4sO
         F4U/XuHXByjkE/zCD0GUCEOHhWToW1FoR/YB7XCPczry/QPt7qZneC5loLAhKlHvOxTf
         L/7QNLfCwfxVtOlWEcOKC6REPSJldtyTMcVI1XPJjRnuzpKRi3t4GdwYG6YdT3WBwdrR
         41nDFsC2ZKYlhITydYCtrO7rzEQBlsn6UEp0rCCnEKECRJdOvP4u0VB9274I+bJov2Cv
         mOZ/8Nksz+wtJcFpJzEOd2WJBcnBnUkt+ecQNgXd5gUGOwQN7vMt6Ip9JRxz22uu0Z9x
         sfEA==
X-Forwarded-Encrypted: i=1; AFNElJ+SifZSHE7NDG5U/0DsZ62taiRwBHBEWdR88oriCaeI1ArtE/wYW8t8PqeQa/jeM3IZ/PEXSGB1NFHR5aGzyIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAYzF2sNe2MKOAqbjcz4tgwJW03wDolyzMbqMSGht0HUX4CtLw
	2MJK26G1jo6CbKcY5A7qroNnUKUavI+5lCc1y9sjMKZ4uRX1QzmSnVEIynI8qBfcQg==
X-Gm-Gg: AeBDietkmrb5PM3GpO/BXtkq/cxLjsChc9ZjV24WdwDv2NJJEpnKbHiFSiGje9rX+6R
	Kn3TevS5aaQIVuPeB2WHURF3iSPjkUfT1kgWIj+vQBaemZWd1/57NgO3vIydgog/utdyKpcrUUe
	CvnRNNUgPrCYVh1TuNzRajF1xm5jCerL5SWM34BrVqyJMp8wlskbLczbP/NkEApjv2HQCNgWSGn
	MyR8A3osleznSC+lVB5IjMXU8NJRyvBYnH7pVLQXOcXgHtW6ykJC2GOb+KVBPPh2G8dit3F8Vzr
	wVFDg9c0MN7P/bAhX3Os+YKweAu474TUh8BPu5f2XsjkM5jgudMVxLdLc/cEoDEdnGWLMasyIkh
	GAWStuduhkjJf7bpr3I6iMOmwhsWzC7uAI3nBkHYvEv8q5yL61d9aK7TUZERdzZTnyQiGILm2wI
	K7pEEbEs6DHAxY6dtNRMCsSBBOnhWl5eJfEEAl1xCgfI8wGISYZ6hdTV1aas3jBRNjgLswazBrx
	m38sA==
X-Received: by 2002:a05:6a00:428c:b0:829:9a7b:db84 with SMTP id d2e1a72fcca58-8352d2f425bmr10106522b3a.49.1777929342450;
        Mon, 04 May 2026 14:15:42 -0700 (PDT)
Received: from google.com (76.9.127.34.bc.googleusercontent.com. [34.127.9.76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83943dde006sm41031b3a.10.2026.05.04.14.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 14:15:42 -0700 (PDT)
Date: Mon, 4 May 2026 21:15:38 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>,
	netdev@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Shuah Khan <shuah@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	patches@lists.linux.dev
Subject: Re: [PATCH 08/11] vfio: selftests: Add dev_dbg
Message-ID: <afkMenQ_gfmLUJIy@google.com>
References: <0-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com>
 <8-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com>

On 2026-04-30 09:08 PM, Jason Gunthorpe wrote:
> Enable it with a #define DEBUG at the top of the file. Allows leaving
> behind debugging prints that are useful in case future changes are
> required.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  .../selftests/vfio/lib/include/libvfio/vfio_pci_device.h    | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> index bb4525abd01a22..2d587b988c09fa 100644
> --- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> +++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> @@ -38,6 +38,12 @@ struct vfio_pci_device {
>  #define dev_info(_dev, _fmt, ...) printf("%s: " _fmt, (_dev)->bdf, ##__VA_ARGS__)
>  #define dev_err(_dev, _fmt, ...) fprintf(stderr, "%s: " _fmt, (_dev)->bdf, ##__VA_ARGS__)
>  
> +#ifdef DEBUG
> +#define dev_dbg dev_info
> +#else
> +#define dev_dbg(_dev, _fmt, ...) do { } while (0)

Can you add something to make sure the format strings are still
validated by the compiler even if DEBUG is not defined? (since it
will almost never be defined). e.g.

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/assert.h b/tools/testing/selftests/vfio/lib/include/libvfio/assert.h
index f4ebd122d9b6..406c430ef28d 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/assert.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/assert.h
@@ -51,4 +51,9 @@
        VFIO_ASSERT_EQ(__ret, 0, "ioctl(%s, %s, %s) returned %d\n", #_fd, #_op, #_arg, __ret); \
 } while (0)

+ __attribute__((__format__(__printf__, 1, 2)))
+static inline void check_format_string(const char *fmt, ...)
+{
+}
+
 #endif /* SELFTESTS_VFIO_LIB_INCLUDE_LIBVFIO_ASSERT_H */
diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index 2d587b988c09..3abfa6ff481c 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -39,9 +39,9 @@ struct vfio_pci_device {
 #define dev_err(_dev, _fmt, ...) fprintf(stderr, "%s: " _fmt, (_dev)->bdf, ##__VA_ARGS__)

 #ifdef DEBUG
-#define dev_dbg dev_info
+#define dev_dbg(_dev, _fmt, ...) dev_info
 #else
-#define dev_dbg(_dev, _fmt, ...) do { } while (0)
+#define dev_dbg(_dev, _fmt, ...) check_format_string(_fmt, ##__VA_ARGS__)
 #endif

 struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iommu *iommu);
