Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E76147ECF7
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 10:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950340; cv=none; b=k98Gmrqp4sGhWbdSq3tk7JAxYgIlgDtqM9yHgHzFQ2LFL/g6nAR7Ojz8hECwIV+i8PJOumAWaxz8PnWXfGOnf29DitvHLJEX0a8kAlb9eysNk9H6RcKQLfDXWTF8u+v7IvZZwImig4OrkGg9ndmBCBsMQ7HCzPMtM64sOVvuAh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950340; c=relaxed/simple;
	bh=YkloEnC0ZLgVBAr9ognXw8nBjhZnbuHMLQa1IYu83xI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Dmz28XP2jdUchn0jqrMWcH9xH97ORwTRPfKh6ezWGU+VL77qMlBGwJkLySNh7UMODk247fzfiHFeYLtwBd5Jb6a55FSuyF3e46gG7LqsMDRt0Mc/CokghYzuDSvE+nLTZZdiJDhFb6Q494TCEL8sP+tAFrohvd2Nkow6UI3Q+KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfOHhuTZ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfOHhuTZ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2544ff970dso836007766b.2
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788950336; x=1789555136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acKyLSiBa5vUJd8dKJMdIgaytIHA9Ytzui4Ses8+1M4=;
        b=IfOHhuTZiRYEWXjzvqJCapBUZJDZtV/zjwE2dCxhbfI8n9lK9OB+a5RbXBC9Q5ZWTn
         Y6HR3KStigsLaES2gqa5ft+pt71vy6HcTprGwRlnanq3WNYWPLm9Rs2jZs5Ldt81untD
         vTiooe53IuqkchjzDVgVe7u6fGu8wr5oI6tSKJIHE5Z6TjbWTbAGdQmrQx6VjOR6INtH
         kKrtTpAbAKC3jKVwAwDm1ErjGGyK9xlR/0CD0LA9RQtH9h+2lhB7x+phCDhd+J8REv2w
         PmPHVkYw9pxtZKdc9YcNBOQpc8R6HSmQE5uPtLzjp4H5CIqENFmBUNjMBunWEjmrDQAT
         sXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788950336; x=1789555136;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=acKyLSiBa5vUJd8dKJMdIgaytIHA9Ytzui4Ses8+1M4=;
        b=Bjiikc8qgCzQd4H6vhvaqXvOWDskrHfEVAwbN3e/uLtnuBDQp/m4ThEnAWjBhcPsS5
         AynWoOblU7JUBunMcpl9bNdm7RqctXj3Dy/eVzRuWRitps2WASMYL+1icrfnCVR+Za25
         Bapa/fL5ei7s/RpMwSgkFr5UQOLLvMoMjBl1FCK1sLi5jo3PoB6JzipcDaaxVHZ+UlRS
         6I2DDmtlVVfEDt2eef7vRJvGjJucOAMtLSqGOpKqurq+WAW4pWvs5I+Gmouxx4V3KNJ1
         360fsfSwGylE/oB3VDW7smPE0fsFwKBoUfYcVYY79mFBC1z4zs3QlaCrlpQ9e80UdnZB
         ZG4w==
X-Forwarded-Encrypted: i=1; AKwUvBxLt7Hn0b0IX0NDdwAFfw5Dx7hI6Vxw2vQsfoI9t9e9B8fKQpenoG3f7aDjSoYqPig8BtVRaUWztLZkx27APCo=@vger.kernel.org
X-Gm-Message-State: AFuF++mI3WFI8pXZ4Vobsrec1vw3dY+lrQAw9oiQaxQL3gk7TJgLvW84
	bhpEEoOoctlvoZbPC0f3JmIC2TImj9uyNjZQDvhCdxSfY30g0QzF6z8P
X-Gm-Gg: AYBFou2aXsSp8QTTifzu1sygDHYTGeX2+6rwO/MPTEIqC0m8q5ywqpKW24eG5H4lcpQ
	qUpQpd4XzTNz5jiJdS28TyDLfUIW0dm5or9NPbvj1VLSAAGNSoPUyMBnrU/TftfGfO2ndI9ExyX
	4ffKgaI54keYdElAxDSAKu1qTIo2y/zQM8VDsHinnugkbJ6mQYcdIt9/8jBX9S6U8jCg7FFtIFB
	hq84E0ixMM/f/I3DT4HHfWDRUW+XMsIEe41PqFH3gv+BLRiXZlUEsfPuaSm8wp3BGI+VNdxee+1
	h+YkRquypn3bu6g09qJ+yZ+1IJhFH+VxsqLgq+xPsHxEA9mpZXKp5/X1Vzmcj9njb4GlJJlALW/
	7YUXEoh9tzGtX6AS0MVlD2tD1+Q2QEO6MUid3BCAfS+RXSGy6oGVhAmn3zRxkvoRbByW0TcRwEX
	XLdju9abPDO7bDhZzMjuHezOeWDj/O0vxCopCuSXLzuMa3tlu5I22ggGn0ROBJ+2qyWozFi5+IY
	+6V4Q==
X-Received: by 2002:a17:907:9485:b0:c25:541:fd3a with SMTP id a640c23a62f3a-c260c7b5cfemr1361234266b.7.1788950335902;
        Wed, 09 Sep 2026 03:38:55 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c93sm744470666b.63.2026.09.09.03.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:38:55 -0700 (PDT)
Date: Wed, 9 Sep 2026 13:38:51 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Priyank Rathod <rathodpriyank@google.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v6] PCI/pcie: Add PCIe Lane Margining at Receiver (LMR)
 support
Message-ID: <202608260405.gHL6gOJf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-pcie-lmt-v6-1-bab4ce233fa5@google.com>

Hi Priyank,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Priyank-Rathod/PCI-pcie-Add-PCIe-Lane-Margining-at-Receiver-LMR-support/20260824-223812
base:   0f23d56f17fdfc7db69d51f64c8b91bbab947aa9
patch link:    https://lore.kernel.org/r/20260824-pcie-lmt-v6-1-bab4ce233fa5%40google.com
patch subject: [PATCH v6] PCI/pcie: Add PCIe Lane Margining at Receiver (LMR) support
config: powerpc64-randconfig-r073-20260826 (https://download.01.org/0day-ci/archive/20260826/202608260405.gHL6gOJf-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608260405.gHL6gOJf-lkp@intel.com/

smatch warnings:
drivers/pci/pcie/margin.c:1005 pci_lmr_exit() warn: variable dereferenced before check 'dev' (see line 1003)
drivers/pci/pcie/margin.c:1020 pci_suspend_lmr() warn: variable dereferenced before check 'dev' (see line 1018)
drivers/pci/pcie/margin.c:1056 pci_reset_lmr() warn: variable dereferenced before check 'dev' (see line 1054)

vim +/dev +1005 drivers/pci/pcie/margin.c

ecb76f560cf217 Priyank Rathod 2026-08-24  1001  void pci_lmr_exit(struct pci_dev *dev)
ecb76f560cf217 Priyank Rathod 2026-08-24  1002  {
ecb76f560cf217 Priyank Rathod 2026-08-24 @1003  	struct pci_margin_dev *mdev = dev->lmr;
                                                                                      ^^^^^
Dereference

ecb76f560cf217 Priyank Rathod 2026-08-24  1004  
ecb76f560cf217 Priyank Rathod 2026-08-24 @1005  	if (!dev || !mdev)
                                                            ^^^^
This check is too late.  It can likely be removed.  The other warnings
are the same.

ecb76f560cf217 Priyank Rathod 2026-08-24  1006  		return;
ecb76f560cf217 Priyank Rathod 2026-08-24  1007  
ecb76f560cf217 Priyank Rathod 2026-08-24  1008  	pci_suspend_lmr(dev);
ecb76f560cf217 Priyank Rathod 2026-08-24  1009  
ecb76f560cf217 Priyank Rathod 2026-08-24  1010  	pci_margin_debugfs_remove(mdev);
ecb76f560cf217 Priyank Rathod 2026-08-24  1011  	mutex_destroy(&mdev->lock);
ecb76f560cf217 Priyank Rathod 2026-08-24  1012  	kfree(mdev);
ecb76f560cf217 Priyank Rathod 2026-08-24  1013  	dev->lmr = NULL;
ecb76f560cf217 Priyank Rathod 2026-08-24  1014  }
ecb76f560cf217 Priyank Rathod 2026-08-24  1015  
ecb76f560cf217 Priyank Rathod 2026-08-24  1016  void pci_suspend_lmr(struct pci_dev *dev)
ecb76f560cf217 Priyank Rathod 2026-08-24  1017  {
ecb76f560cf217 Priyank Rathod 2026-08-24 @1018  	struct pci_margin_dev *mdev = dev->lmr;
ecb76f560cf217 Priyank Rathod 2026-08-24  1019  
ecb76f560cf217 Priyank Rathod 2026-08-24 @1020  	if (!dev || !mdev)
ecb76f560cf217 Priyank Rathod 2026-08-24  1021  		return;
ecb76f560cf217 Priyank Rathod 2026-08-24  1022  
ecb76f560cf217 Priyank Rathod 2026-08-24  1023  	guard(mutex)(&mdev->lock);
ecb76f560cf217 Priyank Rathod 2026-08-24  1024  	pci_lmr_disable_locked(mdev);
ecb76f560cf217 Priyank Rathod 2026-08-24  1025  }
ecb76f560cf217 Priyank Rathod 2026-08-24  1026  
ecb76f560cf217 Priyank Rathod 2026-08-24  1027  static void pci_lmr_reset_software_state_locked(struct pci_margin_dev *mdev)
ecb76f560cf217 Priyank Rathod 2026-08-24  1028  {
ecb76f560cf217 Priyank Rathod 2026-08-24  1029  	struct pci_dev *dev;
ecb76f560cf217 Priyank Rathod 2026-08-24  1030  	int i;
ecb76f560cf217 Priyank Rathod 2026-08-24  1031  
ecb76f560cf217 Priyank Rathod 2026-08-24  1032  	if (!mdev)
ecb76f560cf217 Priyank Rathod 2026-08-24  1033  		return;
ecb76f560cf217 Priyank Rathod 2026-08-24  1034  
ecb76f560cf217 Priyank Rathod 2026-08-24  1035  	lockdep_assert_held(&mdev->lock);
ecb76f560cf217 Priyank Rathod 2026-08-24  1036  
ecb76f560cf217 Priyank Rathod 2026-08-24  1037  	if (!mdev->enabled)
ecb76f560cf217 Priyank Rathod 2026-08-24  1038  		return;
ecb76f560cf217 Priyank Rathod 2026-08-24  1039  
ecb76f560cf217 Priyank Rathod 2026-08-24  1040  	dev = mdev->dev;
ecb76f560cf217 Priyank Rathod 2026-08-24  1041  
ecb76f560cf217 Priyank Rathod 2026-08-24  1042  	for (i = 0; i < mdev->num_lanes; i++) {
ecb76f560cf217 Priyank Rathod 2026-08-24  1043  		mdev->lanes[i].timing_val = 0;
ecb76f560cf217 Priyank Rathod 2026-08-24  1044  		mdev->lanes[i].voltage_val = 0;
ecb76f560cf217 Priyank Rathod 2026-08-24  1045  	}
ecb76f560cf217 Priyank Rathod 2026-08-24  1046  
ecb76f560cf217 Priyank Rathod 2026-08-24  1047  	pci_lmr_restore_aspm(mdev);
ecb76f560cf217 Priyank Rathod 2026-08-24  1048  	pm_runtime_put_sync(&dev->dev);
ecb76f560cf217 Priyank Rathod 2026-08-24  1049  	mdev->enabled = false;
ecb76f560cf217 Priyank Rathod 2026-08-24  1050  }
ecb76f560cf217 Priyank Rathod 2026-08-24  1051  
ecb76f560cf217 Priyank Rathod 2026-08-24  1052  void pci_reset_lmr(struct pci_dev *dev)
ecb76f560cf217 Priyank Rathod 2026-08-24  1053  {
ecb76f560cf217 Priyank Rathod 2026-08-24 @1054  	struct pci_margin_dev *mdev = dev->lmr;
ecb76f560cf217 Priyank Rathod 2026-08-24  1055  
ecb76f560cf217 Priyank Rathod 2026-08-24 @1056  	if (!dev || !mdev)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

