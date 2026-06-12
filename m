Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8378B2147E5
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 23:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781307950; cv=none; b=Z2osZvSwrbqsDXgVY41m8BmR+eU4ML/mj1xYk5ho09NVMifUPTwh2Lx9vMm6gd8pYdaWr2v6dzIDndV2O00kNgIlF5ed7JUMoUUZVXGGWuioiniNw2nEYiv1QIoieWZ8IyvNmwZfAhP99SX3p4Fn53Oo3zT0rL/QKJITi+er9/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781307950; c=relaxed/simple;
	bh=ZpzJ+DT+CutZOfbYSkxts9QirdeLvJOFApvLfehusbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcAidukPFu/X5k2rMVRDvC+8wchfxmelBdlxYA6CGNpG9I4arejp7OV1osqqbdb/uXJntnVgwSFQNY2ix9K+4eR7O5Z5woz2GxXWzb6+zITmBUIjXVMan69qZOulr/iHeUpTuqHMzx0Qw3Y+LsIDWmZJVNWIFjDpdwY1y9ehdvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mj+gsEni; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mj+gsEni"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf2d865383so17535ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 16:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781307949; x=1781912749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lAHtPY+/xBPLLk/0YauTqG4szlUQHGM83CP7gLoGpLo=;
        b=mj+gsEni8ooOLbvT3oRPgoHBmhedPo2yOg5TLWaZ3qcLI4PFfqR6uotjetTCKCiuNn
         glsazqwmQdDTJghe6laCpvUDEAvyupS+SGe91dprMk9Q1ulgRG2/f2P4irMz775FYPcn
         UfWH2wE1lY9iCuwTYwYy8lavCq2CPVb6LiAIvKpn7Nb+XBg8zY5QyxG90Lt8536WLcTV
         w08JYhi3dlyyit13K6Wl9zu/npsJhNXH1iqrAN/8JRzXdxwwH858drnpVt/jVJJEwBpb
         o8DvK+D1KGB5IQ2lPyktvUq8GJkmGInihRc80VOy+IeA+/mCtN2XqYz8L67ulaTj8w1b
         ggwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781307949; x=1781912749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAHtPY+/xBPLLk/0YauTqG4szlUQHGM83CP7gLoGpLo=;
        b=lzzvS2VJ6lZhotf/Uk9TFHtmvig61/rK9eI4G2ChV2CffeYabd9jOlmkdJlr/r/6iR
         CDnRGz73G7mvTn2gxavqfG2fq/fZyy6JZE2uoIt88PLjsvmVPruDXvGMfBQdfFwcJSVI
         A29XwTtBYLDQg3mKJi5zcqtsJaixTb4AM3FsyPO84f/Hab6DKAiyppnsAdckIOtjwXaE
         HZw5xpSqy+7wPzQAdnXfpyvaa+x301avvSuPyDUYeNVos3zwlP+DDsBYOxobV1pztIH+
         UcVer46IPjxIAZk501i1koWL4mRJl04//D6HLxsP7EIORQHMkTu52UkANM5I4dJIkcTX
         kLtg==
X-Forwarded-Encrypted: i=1; AFNElJ+j35GX47KxckgYi0Q4dvE/ndhSNXjNeHUNF5ebR1CdxK2vMihXcJOkGh+kpeKebYAM5g2T7maRn9Csc3qxNTg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6jh5xvxemcN4BUninOhFnFc3T2vFM3lrseOI8IOcMgzIZII0L
	5lOjHIG3Xn8igTaIf//bbR9q+rWxnrHcRSB2F99JDff/dzc1KBqDDBR5W/W7Fdv44A==
X-Gm-Gg: Acq92OEdnEeGxstxNs0ZTRvyRbGh0lB4Fs1iRYf778rFdVVUwWOZRJBTHKEWK9yzcQW
	2xCzVuXE4n38WIDKN6dEY0cQmUiSUhU8bEI4IZfltBo1Ztp22ENNmDOFkAUvDQSnnyAiMB2DZdS
	zyRjIKbMVibhyv/zWtF2vvwFjxIzcT4fEo3FQJt7rrYzrHFGgS2gQ9VOoml8R9yCWzIkQFRGFNY
	rJozPJeCMizrMAabyJeXYIZ3l0HOn4+KrJD+6JhU0X76mWtF1FZxdmHGIG4dv8oyk9g/tPjWcCn
	7Dl4TutQZkgP0qPzToWPr3LIzTSaWAalI0GmBw1LKmJD+boLYmYSixLWLRby5QJkRTRtBrIEFF3
	SL1wWcONRadchC25bkki/vkkO7xgadJBgWL2sAx/OftaoEmvxlVlVjIaDu3TF9KSjdTO1hQBfng
	yyTjVFxUvoxFHhO2a3uIXHc0TNGWGpKAagMyaU+LfbMSm0c+0+LErRq0kqflM/
X-Received: by 2002:a17:902:e845:b0:2bd:6dad:7ccd with SMTP id d9443c01a7336-2c665ec6b7cmr458895ad.25.1781307948223;
        Fri, 12 Jun 2026 16:45:48 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm35963325ad.14.2026.06.12.16.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 16:45:47 -0700 (PDT)
Date: Fri, 12 Jun 2026 16:45:43 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Alex Mastro <amastro@fb.com>
Cc: David Matlack <dmatlack@google.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] selftests/vfio: avoid VLAs
Message-ID: <20260612234154.GA667942.vipinsh@google.com>
References: <20260612-scratch-amastro-vfio-selftests-avoid-vlas-v1-1-ba3acb635f0a@fb.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-scratch-amastro-vfio-selftests-avoid-vlas-v1-1-ba3acb635f0a@fb.com>

On Fri, Jun 12, 2026 at 02:58:18PM -0700, Alex Mastro wrote:
> Allocate VFIO ioctl requests dynamically instead of using VLAs. GCC 11.5.0
> rejects initialized VLAs with:
> 
>   error: variable-sized object may not be initialized
> 
> The replaced stack u8 arrays also do not guarantee native struct alignment
> for the aliased pointers.
> 
> Fixes: 19faf6fd969c ("vfio: selftests: Add a helper library for VFIO selftests")
> Fixes: 20face8c75ff ("vfio: selftests: Add helper to set/override a vf_token")
> Signed-off-by: Alex Mastro <amastro@fb.com>
> Assisted-by: Codex:gpt-5.5-high
> ---
>  tools/testing/selftests/vfio/lib/vfio_pci_device.c | 28 +++++++++++++---------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> index 94dc5fcecbeb..0b437435cce1 100644
> --- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> +++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> @@ -30,13 +30,12 @@
>  static void vfio_pci_irq_set(struct vfio_pci_device *device,
>  			     u32 index, u32 vector, u32 count, int *fds)
>  {
> -	u8 buf[sizeof(struct vfio_irq_set) + sizeof(int) * count];
> -	struct vfio_irq_set *irq = (void *)&buf;
> -	int *irq_fds = (void *)&irq->data;
> +	struct vfio_irq_set *irq;
> +	size_t irq_size = sizeof(*irq) + sizeof(int) * count;

Nit: Can you change it to Reverse Fir Tree style? Same for the other
change.

Other than that this looks good. Thanks!

Tested-by: Vipin Sharma <vipinsh@google.com>
Reviewed-by: Vipin Sharma <vipinsh@google.com>

index 0b437435cce1..c70636c214bc 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -31,8 +31,9 @@ static void vfio_pci_irq_set(struct vfio_pci_device *device,
                             u32 index, u32 vector, u32 count, int *fds)
 {
        struct vfio_irq_set *irq;
-       size_t irq_size = sizeof(*irq) + sizeof(int) * count;
+       size_t irq_size;

+       irq_size = sizeof(*irq) + sizeof(int) * count;
        irq = calloc(1, irq_size);
        VFIO_ASSERT_NOT_NULL(irq);
        irq->argsz = irq_size;
@@ -119,9 +120,10 @@ static int vfio_device_feature_ioctl(int fd, u32 flags, void *data,
                                     size_t data_size)
 {
        struct vfio_device_feature *feature;
-       size_t feature_size = sizeof(*feature) + data_size;
+       size_t feature_size;
        int ret;

+       feature_size = sizeof(*feature) + data_size;
        feature = calloc(1, feature_size);
        VFIO_ASSERT_NOT_NULL(feature);
        memcpy(feature->data, data, data_size);

