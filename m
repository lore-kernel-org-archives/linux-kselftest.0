Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B975A339705
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 14:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495281; cv=none; b=LpWdwJbIzjaI+72gzjbSPnLukbSZra/FKPBtSl5ZcuhfLhFsB1uINW2Eia7ShtsRuBCFrl4pf9a9XFnp59Hww0ws5bGd52HSenhGbWRcxWgWyJNtM/4WU69dTj6md8ExmlsMj5hQ2ONvaHWrPCvIy/nn+6uF6NEh5HEoB1npXug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495281; c=relaxed/simple;
	bh=0SPmCaZS/EgZ0V0kI9JhDAG319HQSuZSW2ZRzTouxwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HX7Hb1omNcB8I/JsH3NS1R3Gzhfgm4TVdnlctiOkeXwE57uJmcvyneVdYg0mSm2F7XuAHEpcgw07VBDRQ55/UTTXrIE3wnBVvXU1T/YIOidWlPz8RaLACW+Iqk9Yg7IfHa85bl6gHifhh2/KPGtv93asUbs3AGD3nprAoJ083as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UHhMuuOJ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UHhMuuOJ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf2d865383so69295ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 07:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780495273; x=1781100073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aIQgZlVSwyLoihF2al8NLtNtB2ubHrdRhrWZHSeU/cs=;
        b=UHhMuuOJfBN6k7kGD5Qob55FKJWSHnHgeyYyfsCd9XGEuepU7T26LpyDyMyUfEAPQ+
         q+VsJZ5ijLFcfUXF8qkHDEBLm82K9vFRYsBlASUbrGvO0HLRXAaiCAwmeOHgU+0k2wK4
         HpLR14ynHN4avwEMh/ubgkB2ol5nR4Dya/gzBnVHeM236KOQsUxzTL+EnHU23T4hSr1W
         n7V7Xx3d88wdaui3w3J0vrEe6KTUBJz+3A0RkKTlhWG8+flohMY9xlduEE8Ti8bZJBXL
         VlN16y4jQqUjXOfY8u5GsujzOwZfQBKJ1qCDN+Wb3corBKlszhEuuTA9HPQNYWHFQFeh
         bQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495273; x=1781100073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIQgZlVSwyLoihF2al8NLtNtB2ubHrdRhrWZHSeU/cs=;
        b=iuGS8XiNKM8BT89VJfoOdd8WNvnqW5KOQDS3WmsdugXXZHOK/YU3ApOZBB66ehv2Qa
         rCgaocX0PPF4qkBUphII1/l/jlAx8Hv0hjFEd/MMMHeFcOZiYw2GqxIJB/J1KvMQbAT1
         w20RecUw5vJ8kdbKNYahgyCgBn1dCFhZnkv8iHpCcY0AKXjU3pZtKNIUAD+iIE0VZ6d6
         pGd+VyGzvC3H2rkUi9Ijoii2AEVshBAaj8hqu98MRbxbY7iB8UPPKgokLbnhxLYLhsnB
         nRw3V6TsolL2I6LgIudoiU8UjKD3IMYK/Cdd7kJ9phufYuhA/sjujluHsh9zmh5doASu
         6CCQ==
X-Forwarded-Encrypted: i=1; AFNElJ88zi8w7V5mhtHvrwnqOlBMRqF2HdFPmwaa80tPotByLHlKCL0OzrHowTl53km8lNk5OW9EnAHRqR6J6K5fE88=@vger.kernel.org
X-Gm-Message-State: AOJu0YztyMH1BogBro4wqAazqp1Oaeen8Ih3RPy6G7bRR3jAAlcRPGOp
	dD9TK5TcCY4Z1g1fquvvn5fszVjEVawzMU7qZiii7MpWLia8vM1y+Co2y56KqjiCIQ==
X-Gm-Gg: Acq92OEFHGS5TQjl5rqFe7oAhWCtS97JMCGYqHjrxzNhANLFW7hlmQ0PSZ3qQt7NxQn
	b2JTRbWm/eClM2/8ZIlTfQN5COv3jfxNX4OWYH53Txbzx66QkcID+Hh8AKwVrTBFBiXpDlLaBwK
	f2kXlsz4+6oaDHVQDo+/GImUnj5bRUzzoUkmp+LMURLKtJy5r9EdpUCqxhNetVrbVk+CMhUbDtk
	pc6sm+vLJOlwQqJIUr+t4uiVK6WDIHrQvPH36X2ErMi37zgvdhN3INmssf+CSGz4zXR2Yupu0kg
	i2xxNTrAkYT+Z0U1AKuTCcqn7+y39YCmuMd+dLqDE+378KzQC9a13ldfR+3dr2bBIOzeI/wNM6r
	X810vX4Lfbuty3FYwDeSQMsHGdyTOqzVy4AYaDU36xlxaP/rI7VHqx5mr0KaSWD0d0F7pgOlFL7
	H4zKpZ+fPZspEtVtyoIIUzMLvBIv2r2ejeqmIvn2/i7ps312MR5SjwK4GlRdJRAa6kWkIe+QD4X
	EWh+PqwNA==
X-Received: by 2002:a17:902:ea03:b0:2b7:b03d:9dce with SMTP id d9443c01a7336-2c16c13fc72mr1885615ad.18.1780495271752;
        Wed, 03 Jun 2026 07:01:11 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd9877d85sm6188825a91.14.2026.06.03.07.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:01:10 -0700 (PDT)
Date: Wed, 3 Jun 2026 14:01:04 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, joro@8bytes.org,
	baolu.lu@linux.intel.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v1 1/7] iommufd: Rewind header length in done if
 iommufd_veventq_fops_read() fails
Message-ID: <aiAzoKRCgF6Ddbm8@google.com>
References: <cover.1780343944.git.nicolinc@nvidia.com>
 <78f8caeb6a5d667a26b870e3068cec47dd4b5be1.1780343944.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78f8caeb6a5d667a26b870e3068cec47dd4b5be1.1780343944.git.nicolinc@nvidia.com>

On Mon, Jun 01, 2026 at 01:42:32PM -0700, Nicolin Chen wrote:
> When the first event copy fails, rc = -EFAULT will not be reported as done
> is set to the length of the copied header.
> 
> Rewind it to report rc correctly.
> 
> Fixes: e36ba5ab808e ("iommufd: Add IOMMUFD_OBJ_VEVENTQ and IOMMUFD_CMD_VEVENTQ_ALLOC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/eventq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/iommufd/eventq.c b/drivers/iommu/iommufd/eventq.c
> index 1f1e415285b1a..896f45be0d2ee 100644
> --- a/drivers/iommu/iommufd/eventq.c
> +++ b/drivers/iommu/iommufd/eventq.c
> @@ -336,6 +336,7 @@ static ssize_t iommufd_veventq_fops_read(struct file *filep, char __user *buf,
>  		if (cur->data_len &&
>  		    copy_to_user(buf + done, cur->event_data, cur->data_len)) {
>  			iommufd_veventq_deliver_restore(veventq, cur);
> +			done -= sizeof(*hdr);
>  			rc = -EFAULT;
>  			break;
>  		}

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
