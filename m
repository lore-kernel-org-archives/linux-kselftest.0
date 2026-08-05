Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DAC37A854
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 06:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785909783; cv=none; b=aOpfNzB5pHq/K5Su/2ruWpXhGnVtGdkqOIcm/1RAF6LBuWuD5b0PJVDB98asLJBAyn+RBiC3eVu3X8c2jb4JLVhSoH+RPbbd14A59UkuUU9v+SkSe3iBREyGCR718H8dlj1jH4MoTDw3Z+DkSSvaa4QlHf1gqVcq+AkQ75Ytum8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785909783; c=relaxed/simple;
	bh=RdLobgOPFHKM1jabhTYcuWGSUWCJfrHg80slU16JWAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onEegI2OWgMOgIImG2ve1v9CoHUUW1ooibon9D3g13BTfJriVf9mB5GybDHIA0NIpa1CrNLXb8p8IbYrubCbo3A8+qJ3sNHPhkL640x+8e5Jf+DARiAW3DFJ5hZIgw62VrVEjH/6Lp3wnq44x10/2OYacp5J5MOJrfQHayq1d5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wn/JcLW3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wn/JcLW3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cab97c86bdso59665ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 23:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785909781; x=1786514581; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kYGJAHMfaG43a10+DAahsWI+BDlKwBdKnhIOAj6soTQ=;
        b=Wn/JcLW3NTc/Zio6s41Pjeo0FzZOfmMA3cdckoyk2oK0yu15LoDRopazptTaDU0jBT
         iKfaw35tkhoujxN33+c917G3Ex3R1ipUR6hlZnsg8nimNlYzlziJARDl1AH6b1b9ykXS
         dyGQxJ4uoRiY1ZoOubNTJTF46GU8oXdCruBwWpRE9Yc6P9g1TbZvYRqOmpVJuhltQk0s
         8cxSCZalX4kIW4RlHgi9Wqdrv0Ivaaj32tbBAPo5uq2cgHMgqB2H+D9ElH/03StNPbTG
         QWz2YtY1sAvJDj31Zt+71wJqcxIlHfuJgeg6LZI/+0daZmR3bdUPsTzqvUie+pn52bh5
         a4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785909781; x=1786514581;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kYGJAHMfaG43a10+DAahsWI+BDlKwBdKnhIOAj6soTQ=;
        b=jdMDEqaGDb2YImAMhihNSLTvDLFqg/AYFhUnq8KN52B7Tl2JrI0C7FSUS4EpvscCNj
         rJ2JLH/myY08zBahGLOPgwHbYg+BWN1bnpCIYxmZy/rRFByUBUxoN2czY1ok7iOcKgq4
         86VpjLXSIUSZksLzbUu+eesZs4Csz8ucy00wTG0YeOB3d8ILwuw63IjlntYJOgAzUrwf
         QSx+ykFn85jRLPjqO8NYtqzCdmDGKAQkkgpBjF2/kuLuSH8lMUzp7QIPzsIirKXmk90v
         wEz93oqZABODRLT98c+G7xmz+jBBY0gT+OGBrg42PRqO8xyxWPXLwqmHs0RhZ/rsQ8fM
         TPnw==
X-Forwarded-Encrypted: i=1; AHgh+RqNZQHy3dEUYyiIYRxH9wdLBpMesgwYJqaaW7o0bjU1TJvh/o72BaLzsiJ0naXnRg1PTiW66U2U11e9f9mzSpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhFCCnWn+riVCoXGpaNNNCTa6AqEN8YttnuYqPbAb6ak7/E7D3
	/6pqDMBzntiEmojGe7a82VX6bM/TaUSEKozmNlvGVg5h+0Ebkn3augbPIoVhczdeCg==
X-Gm-Gg: AR+sD11CLgtIZHuWjWdbdd1TG6HCzKa9YeRNB0Ic5JQuALDqpQowSDPsLLtd17TC4q/
	gYkidl1rAMMpOkwMYq0MVS5gaNQ2wWqoH74lU0ze+hv4HCW57qdlHZCHVyTC3ld4KOacziw9epA
	aD+wgTJva7vIfWKI2RCR+l4itUlmBwrMqYku/pjRdFUPFvU6zp3w6njMmHmKmq5BpSyc6RxV1TE
	SxezFu5lsF8GIdd3OAj3YR+jpCZJs7J/hpTHwi0s8m28+BBqYTs5hg594FiOLhLe05i30TFtonA
	KjTZ+fzAUQWRJZvxi4weyS0JfcjfE2pNwb/fJP4Ews8lFb1893EBS7r0nvYyoSGJjsaW0m/u7KF
	C0kRNi5SpMuVuRm5KNrrKfxy8usG6jKZiejtLWH/EITxSTvH19TzCkqNfUX9uF2CiKtBYtxANGF
	WP8enM+syaY9zLdDrjnVxtQpFhuxKWlsCsSopiMuOm4Piev+x5X6fwG+2OEvA8lfGrijKD69dwE
	brG+RLyiSNcC5bWjFVt6Pk=
X-Received: by 2002:a17:902:ea0e:b0:2ce:b436:272a with SMTP id d9443c01a7336-2d0d0704d14mr5233675ad.3.1785909780734;
        Tue, 04 Aug 2026 23:03:00 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febfdae85sm3462574a91.3.2026.08.04.23.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:02:59 -0700 (PDT)
Date: Tue, 4 Aug 2026 23:02:55 -0700
From: Vipin Sharma <vipinsh@google.com>
To: "Yanjun.Zhu" <yanjun.zhu@linux.dev>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, graf@amazon.com, 
	jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, jrhilke@google.com, 
	julianr@linux.ibm.com, kees@kernel.org, kevin.tian@intel.com, leon@kernel.org, 
	leonro@nvidia.com, lukas@wunner.de, mattev@meta.com, michal.winiarski@intel.com, 
	parav@nvidia.com, pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, 
	saeedm@nvidia.com, schnelle@linux.ibm.com, skhan@linuxfoundation.org, 
	skhawaja@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, yi.l.liu@intel.com
Subject: Re: [PATCH v5 17/20] vfio: selftests: Add
 vfio_pci_liveupdate_kexec_test
Message-ID: <20260805055042.GA806762.vipinsh@google.com>
References: <20260714151505.3466855-1-vipinsh@google.com>
 <20260714151505.3466855-18-vipinsh@google.com>
 <0556e2fc-3be5-4023-a9a4-8482fa8c88b2@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0556e2fc-3be5-4023-a9a4-8482fa8c88b2@linux.dev>

On Tue, Aug 04, 2026 at 03:19:34PM -0700, Yanjun.Zhu wrote:
> 
> On 7/14/26 8:15 AM, Vipin Sharma wrote:
> > Add a selftest to exercise preserving a vfio-pci device across a Live
> > Update. For now the test is extremely simple and just verifies that the
> > device file can be preserved and retrieved. In the future this test will
> > be extended to verify more parts about device preservation as they are
> > implemented.
> > 
> > This test is added to TEST_GEN_PROGS_EXTENDED since it must be run
> > manually along with a kexec.
> > 
> > To run this test manually:
> > 
> >   $ tools/testing/selftests/vfio/scripts/setup.sh 0000:00:04.0
> >   $ tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test --stage 1 0000:00:04.0
> > 
> >   $ kexec ...   # NOTE: Exact method will be distro-dependent
> > 
> >   $ tools/testing/selftests/vfio/scripts/setup.sh 0000:00:04.0
> >   $ tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test --stage 2 0000:00:04.0
> Hi, Vipin
> 
> Thanks a lot for your help. I followed your suggestion, vfio-pci setup can
> work.

I am glad your setup using virsh is working.

> 
> The followings are the test result. In the step 3, after kexec, there are
> some fails. I am not sure if these are known problem or not.
> 
> 1. Before kexec command
> 
> + modprobe -v vfio-pci
> + tools/testing/selftests/vfio/scripts/setup.sh 0000:00:04.0
> + echo "vfio-pci" > /sys/bus/pci/devices/0000:00:04.0/driver_override
> + echo "0000:00:04.0" > /sys/bus/pci/drivers/vfio-pci/bind
> + tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test --stage 1
> 0000:00:04.0
> Preserving device in session
> Preserving memfd of size 0x40100000 in session
> # [STAGE 1] Forking persistent child to hold sessions...
> # [STAGE 1] Child PID: 1236. Resources are pinned.
> # [STAGE 1] You may now perform kexec reboot.
> + set +x
> 
> 2. Run kexec command
> 
> 3. After kexec command
> 
> + echo "vfio-pci" > /sys/bus/pci/devices/0000:00:04.0/driver_override
> + echo "0000:00:04.0" > /sys/bus/pci/drivers/vfio-pci/bind
> Checking open(/dev/vfio/devices/vfio0) fails  <--- I can confirm that the
> /dev/vfio/devices/vfio0 exists. But open this failed.

This is correct output. Test is verifying that open should fail. If it
didn't fail the ntest would have exited with an error. A preserved VFIO
FD can only be retrived using Live Update session ioctls and not through
usual VFIO dev path.

> Checking ioctl(group_fd, VFIO_GROUP_GET_DEVICE_FD, "0000:00:04.0") fails
> (vfio_type1_iommu)      <--- fails
> Checking ioctl(group_fd, VFIO_GROUP_GET_DEVICE_FD, "0000:00:04.0") fails
> (vfio_type1v2_iommu).  <--- fails
> Checking ioctl(group_fd, VFIO_GROUP_GET_DEVICE_FD, "0000:00:04.0") fails
> (iommufd_compat_type1)  <--- fails
> Checking ioctl(group_fd, VFIO_GROUP_GET_DEVICE_FD, "0000:00:04.0") fails
> (iommufd_compat_type1v2). <--- fails

These are all correct output. Test is verifying that userspace should
not be able to get VFIO device FD only through Live Update session
ioctls and nothing else.

> Retrieving memfd from LUO
> Finishing the session before retrieving the device (should fail)
> Retrieving the device FD from LUO
> Finishing the session before binding to iommufd (should fail)
> Binding the device to an iommufd and setting it up
> Finishing the session
> 

This is shows VFIO FD is successfully retrived by Live Update ioctl.

So, you saw expected output from successful test run. I will change
the message getting printed to avoid confusion. I think current way of
printing ".... fails" is confusing.

Thanks
Vipin
