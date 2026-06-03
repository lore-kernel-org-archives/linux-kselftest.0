Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019B43859D4
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496318; cv=none; b=GaMWpc0t6M96FfRx5qGCsH1GXJqspJyxbN6jK4G9DquXawCsjjCGFA2B00CEsbb5Tv51V5VA53xZmXf3YA08bhsphg68ZqIckLQaE/m64fJHJAau4yWGIhtuL/aS9VwQIgepOz6m81jplf5cI2luUpHtBbQbpfYA8ktUvOQlQEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496318; c=relaxed/simple;
	bh=19HSiq87LQ5M3NDNUhZpMcP4JTO4FZyLAEClzLpHxTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=no94j09H2zBSB4kWfmf9gXxbtG9s4Odt53RUrfFji3j6Y5FaFDSYQQI2eVm6hjwPdss3a8QkSTl7iwk6UhQNpj5/dNEa32yR70cMVShiI9xGOjndkNYVXIhLP9U7gctQRZ9L5Kurr7RIRmytFFAB7lopwqXdC9DTAXrjU7csmH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GnJT7s5M; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GnJT7s5M"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf22c18ad3so95505ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 07:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780496316; x=1781101116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kwsof3FOeGGtvC3UKgDM6z5+2/dyQFjpckHaTXqEVm8=;
        b=GnJT7s5Mz7X7bapo4nqJKOB4MdMh0zTK1JD5O14y099ke8RNGUx6ahnNMeEjf7+4S/
         H8IYUBQBAy37GEDuA0+H1AlTHgy9P+H+u7iYNOkQIy6YFIjQ5kuNxjxpIEPLSIcerJP2
         dZRB1SAWOf+8pLyVMu1R3aRYWeMBjOA21mq3lx2mYopEuRONkuajCD4z2HP2+ZaPJL8B
         ECMNpwWH+uK6pYWhIu8yEDlwYATqg7lWpJMQAYliwB3HAumSp5+DGB9w5U+ZaWigqVXI
         dSyZg75uc2wtCRauEGrHO6LnXwiHVNq8d+phna1fUdxitmVx0x+5fg0PAweA5keot2TB
         mvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496316; x=1781101116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwsof3FOeGGtvC3UKgDM6z5+2/dyQFjpckHaTXqEVm8=;
        b=SU43jOq86rwEeVSaTBtIwsrfg5Pg6BEjG/8vqfKgO+/NG9cPL1jNKD7WxHUEoryEjG
         shy0hy5bwramDZfN5vQH/+vY1Wir3NOLANdxmGSy9aJTxHKXYWcJbxCH+LyMmY7NYcgy
         rHcEOM8O0WLxWoiofvwCT0yXIVGbrUWFT3RNtX3sFHyu1jNcjDWfIBCpr1T+1co17doN
         kNOOxBrzDGzEEdis5uyaRSf/BjrZnRDUeVUxldOwVY+dvK1b0nXdCLDT+kNy5NbJOkVi
         Dcik1n30x4nRa0axxokVkHDHc1IjHPNyMZ1iuCHkrA5ZGMI1JeNSwwh1BVqQ0OqjWQPO
         fscA==
X-Forwarded-Encrypted: i=1; AFNElJ9u7/60MOJ3pcQ5TUl7qPddrartsL6ztqUIrw1QCaY/o1nl3vv/ErqR6aEzgEy07K8wXC5O90H7XudAgGJqoPw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztz1t+quLhBN9pu+3OZe0IrS4p8U5A+itwRXD3Tzwj7Dwp55ng
	YB4DvP9OHx1YDoCrS3Bmj2kDKgGnoM6G5ECL8fxh1eK8vQ+oDPne/OXvjIkZS/cZkA==
X-Gm-Gg: Acq92OFtVJpBGxvhoE39icHFx+iNKC82fFVeuj9DqnsI3KrS+5IcIg8nr5CMGyW1hQF
	UvyC4p+ONJyB3qAHVE6ggGxMSB1Ymh4z35JapDSZIxaAICVnaLCsaC+uTubDLLJYpzlwPHXHbsZ
	Xe99Xc7v9Vb5RB/EERYt4SZoTty2yQXNOy6caLPcMjfD9vVEStFss4cz+VbsSfHBGdUzBOkkgP8
	X9VNfFPPNaqV1NXsSvTefRKTe6rRfWqBsjn+daWubP08JCfQz0/ssEmN9OpyHNEN+/PgvjdM0LS
	eAyM8L4C4WRCxR7disVLZcWFkEfWQFcqNRoApzDt40EYq/+DNVCNxdr07Q6nOYlVaowUgFE+m/M
	epb7+RFge638xTZQmfHJdQtV3/RehrVR201KX+aeSINyFyLyULycIA1gJ3W7C8Uc6FIKk7FwrTt
	UGolp+yNIUVJEUHHj9GKsNHEAQBLddfjEvBB1s0/q9Yyq+OVzjkZO78OrbzAmH1+xbJjzZEP4=
X-Received: by 2002:a17:903:1206:b0:2bf:3741:5b76 with SMTP id d9443c01a7336-2c16fa5ec8cmr1523385ad.3.1780496315741;
        Wed, 03 Jun 2026 07:18:35 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e0a186741sm3188055a91.8.2026.06.03.07.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:18:34 -0700 (PDT)
Date: Wed, 3 Jun 2026 14:18:29 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, joro@8bytes.org,
	baolu.lu@linux.intel.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v1 5/7] iommufd: Break the loop on failure in
 iommufd_fault_fops_read()
Message-ID: <aiA3teBn2FajzwzJ@google.com>
References: <cover.1780343944.git.nicolinc@nvidia.com>
 <336a9b6e44fe66a24199d3be777c405c85c98622.1780343944.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <336a9b6e44fe66a24199d3be777c405c85c98622.1780343944.git.nicolinc@nvidia.com>

On Mon, Jun 01, 2026 at 01:42:36PM -0700, Nicolin Chen wrote:
> On a copy_to_user() failure inside the inner list_for_each_entry, only the
> inner loop breaks; the outer while re-fetches the just-restored fault group
> and retries the failing copy_to_user() forever, spinning the reader at 100%
> CPU with fault->mutex held.
> 
> Check rc after the inner loop and break the outer while as well.
> 
> Fixes: 07838f7fd529 ("iommufd: Add iommufd fault object")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/eventq.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/iommufd/eventq.c b/drivers/iommu/iommufd/eventq.c
> index 613024ca8f1ff..1c010e691f972 100644
> --- a/drivers/iommu/iommufd/eventq.c
> +++ b/drivers/iommu/iommufd/eventq.c
> @@ -168,6 +168,8 @@ static ssize_t iommufd_fault_fops_read(struct file *filep, char __user *buf,
>  			}
>  			done += fault_size;
>  		}
> +		if (rc)
> +			break;
>  	}
>  	mutex_unlock(&fault->mutex);
>  

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
