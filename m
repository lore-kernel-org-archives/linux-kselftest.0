Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4AC3264EB
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 16:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773677101; cv=none; b=F3tLKGGGgjFut1DSgcSyiR2ca7DE6fOnFegMGC9jDcmAVHva2/dl6+4K7TEHy1lCffGoIoEmYAJV4ayVO7462ZmRml/nYpDWSEGTUatkFAKXRhv4/rRNIqlOuP1D+K417tbRubjMVQyx7+PJ2vit+0bE7LYesBPD0igZXdrl1Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773677101; c=relaxed/simple;
	bh=pnPMIg6QAJhhfdXh1P/12ht0oe+xBK5/i0AcyCLYy1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfHHQxJV6TR5ROiapuwo9FXX938/G2tTvtN+rRzw1+ahAO74SRTDDlZnCq1DSo22zHKRy34jXDm+Fxr930CjZ5IWukKW7X9CoegKq326Xj9DCZmve0IfZcgIb44Hdnf/D7XKMclNJ5eTAYbxN65klNqAAuA55sQwB+KHs9Tag1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BmZHXHcG; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BmZHXHcG"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b052ec7176so94005ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 09:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773677100; x=1774281900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x9RU4Mq6bXwi7763tJq20duY+x4lhVoegGX5yfdZIpA=;
        b=BmZHXHcGJzYaI37c8BNWaiYCMivWtKyuq2oIQA+zrVNsgHcNRJeLBNiGc/b9XMmjox
         REcRfSnIa+BHCwdtM/J7AKMJhmD2nKUcYn4H1Hjv/73RMiOwzjh35UY+YZVPTS59/iSM
         1YPelz89za90uNuVPmnw8be1a4I2fB7rjQyjtuLZVxrHGvcCOmzm/0l1DbnaeiOQfqJR
         SMYfQuFr+0qDrFL/mVHVsdybWPG9Eb30Ty70c2J2BSKDgHATcleAFEjy+g+IVbxgIjeG
         3owJZuNbCyzutxl1wQ3Pu+flC0BLlyvCxBGQg0uf84ye4w1sr1EFdDKZcI1h1/aoyt1e
         FQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773677100; x=1774281900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9RU4Mq6bXwi7763tJq20duY+x4lhVoegGX5yfdZIpA=;
        b=HOlH/7lu+HIkAjukLoZmzGRfi8wWgjnbuiDrmXMlAPzXRYKGUfAIRDaRh7FZWqvsiQ
         J1mvIHxUnkBJYGxx8sYTGr2209fJvDiFcPN8WJybENA0vDl12Jwrk/cbprOE3ZsL08x8
         Diahkq0MXCXAc5hSQJhuXJYPRSCA2OsVwFVgffdjA2xmOknv5cy6AYsPJnAPViYNCKLS
         im2l1HrqWYiav5Tghw6w4hBZ9Ta0hVmb7YqicFC6BUc49bnU990jrqpd6yDe/8pEzjZw
         FKR2vKY4sg/f9ktMFLnGsbhRg2HBFK9t1nmQAya3G+SBKutetYigaLuEyoRtLjKSL3e/
         dMmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4VFWO1MG7aUBWA9t1WJJhjJL2LeqvNhLeZmu+ZmWMEXoB9dYQSl+VBOEhQLyeD7RLrNvhjXSlwjHeqtvQgL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYJ1olhtwxFUiHYKTRzdEwiBuLRZpJ7R9Oz2hegxuc+GZfvPOI
	SBC2xVvmLCsv1IuU0+sr1pOlXxLSUhvHDNEqfTwCZKsRnGEzQxxiJiJkz7K1jWtDJg==
X-Gm-Gg: ATEYQzxU3tyoIxKE25BBg0bA5863MZ9TBxrpS1ZQtrGYelAP1HGMLJTNP2sVQOYs2fS
	TqgD/MXNXEIF7Skx5XgYtimm+Dvjfhzu4dMMlSNvNd6RUREZNHSR0/WdrWDIR6qO3/7Xw4SELdJ
	ZHPkDflxzOpZ11p6IBtaubUMyfGAJsnhUwtYwYA2pH7bNg8QXexWnqzgl0PDTyoYcH6b344ow5W
	7/9EBfWeY9OYAWb72kbNVEyvdWFJqV03DBO52ruWEhdl5c7m+DN6n6ShDlDHptSh3M+218kiqKr
	5OL4AGxFUK9jx9ayp6oTAPOoZ1zItOBdOegLkhpydeSDQjmsF2X9Gg7pf910ESSq0gRF2UW2S+j
	q349Dgbmura8t9ugE7ImqIMMx90i7DON/D/o8iB9lr9W6zYnqaPtDWVu3KKasNy9qMMKXLGlYFJ
	UuxmMQ1bPs72mgbn8rxBEd5JgN1EZ991FR+RmWbc52H/3QRsA8U7FeBUG7TUdN
X-Received: by 2002:a17:902:ce0f:b0:2ae:575f:3755 with SMTP id d9443c01a7336-2b04215e0c7mr4424785ad.20.1773677099288;
        Mon, 16 Mar 2026 09:04:59 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b048527a19sm71890555ad.7.2026.03.16.09.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 09:04:58 -0700 (PDT)
Date: Mon, 16 Mar 2026 09:04:54 -0700
From: Vipin Sharma <vipinsh@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Alex Williamson <alex@shazbot.org>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Alistair Popple <apopple@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Tomita Moeko <tomitamoeko@gmail.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Subject: Re: [PATCH v2 16/22] vfio: selftests: Add
 vfio_pci_liveupdate_uapi_test
Message-ID: <20260314073250.GE4177610.vipinsh@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-17-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129212510.967611-17-dmatlack@google.com>

On Thu, Jan 29, 2026 at 09:25:03PM +0000, David Matlack wrote:
> +
> +TEST_F(vfio_pci_liveupdate_uapi_test, preserve_device)
> +{
> +	int ret;
> +
> +	ret = luo_session_preserve_fd(self->session_fd, self->device->fd, 0);
> +
> +	/* Preservation should only be supported for VFIO cdev files. */
> +	ASSERT_EQ(ret, self->iommu->iommufd ? 0 : -ENOENT);
> +}
> +
> +TEST_F(vfio_pci_liveupdate_uapi_test, preserve_group_fails)
> +{
> +	int ret;
> +
> +	if (self->iommu->iommufd)
> +		return;

for iommufd variant, should we mark test as skipped instead of showing
it as passed?

> +int main(int argc, char *argv[])
> +{
> +	int fd;
> +
> +	fd = luo_open_device();
> +	if (fd < 0) {
> +		printf("open(%s) failed: %s, skipping\n", LUO_DEVICE, strerror(errno));
> +		return KSFT_SKIP;

Both can be combined using ksft_exit_skip()

