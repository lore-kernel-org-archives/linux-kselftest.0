Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655924;
	b=SfBpWFQsGnsySAV+EGj9Q0jzZC0I7bnszY9yuBD/fKz/8iedgDD632v+F1znw8617oJh
	 C9Vk9LFeDhNx/7OB5TfOu3yxpSeb4n2Mx0OloXVNnOaVA6tKSeQq08kY5742/8vrBPMLM
	 PSoK04sna4Io86573cxYZ+8UazOMGEeX+Rw16W7oVZJ07FVcfqVoM735AifYTSTwAhiLA
	 I+JYenyeVw1Gy7XE/LB22NaOVqRGMuc2hjuGyzmbrPJedb+eUOvkKemRdaltUxcOFpQtQ
	 Ix7kQbuYie64QYbbI8KbJuf2aEWTOP+sKTxE0aONiugochAgEXgi8LGBI1bEbgLJzVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=q5JdWOppAER7/sVf+/wRTQ5JltDoWihbM3Khp4hBQTg=;
	b=h347QMSiDC0tgX97tegPa2vVLZWLqESlV6Ni027w3y54Q0zPESZT1dnQE9cH6IuOx3bw
	 ojPTHiRbCAmWEyL20e2X3oD91W46ScMfQEfJMAnnjc7cdKsxKhtgEYjWwHSp3BxmwpTCd
	 XCOqG4iVasaIUctNhzCfjKnHjcfDncsAup3lXIWOb1MqhrAloeBd4Ev6xF2xuBDFIpWeq
	 sWMkcKd0eJ9Z8p9ipQjiTO3N/V6HdiqTSB+LlQrzPbp3LLIoIOSA+NkKDUAc9pg/S0Nsl
	 5vUT+P7isIVa1hkW0gIuUsSRMf9rZrCjSRmymSHAMj3EWb37ErbFlV4xQA7qcBN2QnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ju1dB82V;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FEC606A32F
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 21:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43FEC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ju1dB82V
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e985106c0cso33011725ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 13:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793655924; x=1794260724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q5JdWOppAER7/sVf+/wRTQ5JltDoWihbM3Khp4hBQTg=;
        b=ju1dB82VQQqOsK6FJwUKlROowYAnHc7WAOAKWhSrOELJE48tonFCd3m2ZEjZAkZodI
         qz0wz2tcfJ4S7FFEi29BZe/uWUebVzxGVUMwRiyXtRrs6gQVIGLbgXElfr5KOmpdmjHb
         MejA6pOMJg0tuUT0QVaik2mdI5WI7Ujlh03twErxIH8gwTUxdncGKZy+TiXdckSUu7jw
         fyCqXYxwO9C0j8hNfpPyZjAhDX3uJDLSE9RSnt/7HYsIztMC1fyXY59SmxH6r7xqmnf+
         h4FSPJgxDQSqrYhQSf0gBSkeUowc3TZYpO744Me9aRAn6nQQ5GNmAq4fA/9aV5N2GELH
         Y0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793655924; x=1794260724;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5JdWOppAER7/sVf+/wRTQ5JltDoWihbM3Khp4hBQTg=;
        b=vb4ezjaFONXIcJx19nB0a5zOzVJRQuuMl5Och43ZHaAGayJSgchtOBpIMAAj9kMyVj
         qIo7rTnzFdEO0w7nwF9X2oPn+xuzez3RX5psN4uxlVqhmyokRkcipY5iQKQWn5PHKxku
         zX7NlYFA23GN/RI8MS+ySBy0VRnfr/EYcBmShwtnXA3RoFXjbmC31K4dltEygLjyt08o
         +KTUisvJ1n5ylAkpm4BX+PUkhZcepOdMi64MuO3JnmSfvZRpreDR4blDmYPtK8ydADE2
         U1jWDLafa2/ljNRUcwLm2JqbS39QO8hm3uZYTEPBU/86tXBtUOiCW0KEp4lZ3iYi53kf
         1GNA==
X-Forwarded-Encrypted: i=1; AKwUvBymErR8mdBNNgabxMCs/4cNnUhBx1hOz30+tT1NhJcQcdFKVb7vhrXuy2aTDIRJqxgR2VoCx4Yx1dwrq9ZNUr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CKGz1sjtp/ekQ8ZfZXEAlyBfwlFEj5n1jalW2De5fZJiQJhks
	44tiE8WBgLU/ECx/NNpsxsPs9UBrGo7ndQQie24XPh7kHf9IQoJyVKC8yqkdpnwntA==
X-Gm-Gg: AYBFou2ua/abOFxQUephyNqiy80yIAWz+4WXf4+lPrG09c9XJtELtp7SAYM99NUzZ6W
	Pg6rzom9g7s5v8wwt6bKCNnRQtJvgWrJX9ulTbE4Cud4reo+CZOPYqJ9eLca2UMw2+2NSWI+Q69
	AsI75WgxH0C2Ye15EPhds2WZ4ePlaDp2gHyfdx30kmMNF/Kysu043a2lf+QWAlNfjBGoY+SZttx
	fmNtwkPGuSqb57MC/iT1ssmFWOXEmvZblJkMuh9IKxAiUzVfQD4LlHoaxIo1yncdMP7rScXh8qb
	Jtt0V5MoeFt0BnGv3K1v8sFVcVwND8ElAFdsVdcuGDWsOlrHr7lS+B74yi3+dJKP0x/D8WzW20F
	T8P+FGdqhZwknBpXSrvoEyu1h0LI5WBy1DdVf9bfTnPXLgBp2V/qAfOO7Ck/lHSdrnwNnxt2U4n
	JdvmwplSfYBQt2QRY67hdUqmWJJL9qtAjcHF2oEOFw0R3O5PoXn1aoXWieufqgeZEKq7EGWliBY
	rdWLCWNqZ2eCFOtTu/Jqyc16LmxzxrRSziU9G/ELopoSHjdQtxh4ExbI1xN1U2h6V9oy1KkEiBl
	Urs29469kwevK7Tlu5Nmm+5RLApb7MEUv4wt5/LDFO+wdan2IpSQXW+FxdeCKPjt
X-Received: by 2002:a17:90b:570c:b0:3ac:8897:7ba9 with SMTP id 98e67ed59e1d1-3ae8985d52dmr10189518a91.56.1793655923061;
        Mon, 02 Nov 2026 13:45:23 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c29e619sm1046130a91.0.2026.11.02.13.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:45:22 -0800 (PST)
Date: Mon, 2 Nov 2026 21:45:18 +0000
From: David Matlack <dmatlack@google.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Peter Xu <peterx@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Matt Evans <matt@ozlabs.org>
Subject: Re: [PATCH v2 2/2] vfio: selftests: Test BAR write faults after
 clear_refs
Message-ID: <aukEbs9W2rnjb1jQ@google.com>
References: <20261101062049.998160-1-almasrymina@google.com>
 <20261101062049.998160-3-almasrymina@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101062049.998160-3-almasrymina@google.com>

On 2026-11-01 06:20 AM, Mina Almasry wrote:

> +TEST_F(vfio_pci_device_test, bar_write_fault_after_clear_refs)
> +{
> +	const u32 rw_mmap_flags = VFIO_REGION_INFO_FLAG_MMAP |
> +				  VFIO_REGION_INFO_FLAG_READ |
> +				  VFIO_REGION_INFO_FLAG_WRITE;
> +	struct vfio_pci_bar *bar;
> +	bool tested = false;
> +	int ret, i;
> +	u32 val;
> +
> +	ret = clear_soft_dirty_refs();
> +	if (ret == -ENOENT || ret == -EINVAL)
> +		SKIP(return, "soft-dirty clear_refs unsupported (%d)\n", ret);
> +	ASSERT_EQ(0, ret);
> +
> +	vfio_pci_cmd_set(self->device, PCI_COMMAND_MEMORY);
> +
> +	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
> +		void *vaddr;
> +
> +		bar = &self->device->bars[i];
> +		if ((bar->info.flags & rw_mmap_flags) != rw_mmap_flags)
> +			continue;
> +
> +		ASSERT_NE(NULL, bar->vaddr);
> +
> +		/*
> +		 * clear_soft_dirty_refs() stripped write permissions from
> +		 * vma->vm_page_prot on the unpopulated BAR mapping created by

Sashiko's finding here is right. The BAR mappings may be populated
already at this point. You can reliably zap the BAR mappings by clearing
PCI_COMMAND_MEMORY. e.g.

  static void zap_bar_mappings(struct vfio_pci_device *device)
  {
          vfio_pci_cmd_clear(device, PCI_COMMAND_MEMORY);
          vfio_pci_cmd_set(device, PCI_COMMAND_MEMORY);
  }

Then you can also use this instead of mmap()+madvise() below.

> +		 * vfio_pci_device_init(). Fault it read-only first, then write
> +		 * to exercise in-place write-upgrade (wp_huge_pmd/wp_huge_pud).
> +		 */
> +		val = READ_ONCE(*(u32 *)bar->vaddr);
> +		WRITE_ONCE(*(u32 *)bar->vaddr, val);

Writing to offset 0 of every read/write BAR isn't necessarily safe. It
could be a doorbell, a write-1-to-clear status register, the MSI-X
table, etc.

There's no way to trigger the write fault without actually writing to
the BAR (e.g. MADV_POPULATE_WRITE fails on VM_PFNMAP VMAs), so the test
needs to know where it's safe to write.

To solve this, I propose adding a helper to the VFIO selftests library
that finds a BAR (or range within a BAR) that behaves like memory, i.e.
every location can be read and written with arbitrary values without
side effects. Something like:

  bool vfio_pci_find_mem_bar(struct vfio_pci_device *device, u64 min_size,
                             struct vfio_pci_mem_bar *mem_bar);

Detection would be based on a table of known devices, and tests SKIP()
when no such BAR is found. Your test would then ask for a mem BAR of at
least PMD_SIZE and run both cases on it.

This came up recently with Matt's DMABUF mmap() test as well [1], so I
think it belongs in the library rather than in vfio_pci_device_test.c.
It shouldn't be much more work than a test-local helper (but please add
it in a separate commit).

My suggestion would be for QEMU's pci-testdev (1b36:0005) to be the
first device in the table, since anyone can run it in a VM without any
special hardware. With membar-backed=on, pci-testdev's BAR2 is a 64-bit
prefetchable BAR backed by plain RAM, so it's safe to read and write
anywhere in it. membar-backed requires QEMU 10.1 or newer. For example:

  qemu-system-x86_64 \
    -machine q35,accel=kvm,kernel-irqchip=split \
    -device intel-iommu,intremap=on \
    -device pci-testdev,membar=1G,membar-backed=on \
    ...

Then boot the guest and run the test against the device:

  $ BDF=$(lspci -D -d 1b36:0005 | awk '{print $1}')
  $ ./scripts/setup.sh $BDF
  $ ./vfio_pci_device_test $BDF

membar=1G is large enough to exercise both PMD and PUD mappings, since
vfio_pci_bar_map() aligns the mapping to min(size, 1G). If 1G of host
RAM for the BAR is too much, membar=2M still covers the PMD case.

If you want to also add the device you reproduced on to the table, that
works for me too. More devices can be added later as needed.

This could also be added to the vfio_pci_driver framework, but I'm not
sure that is a good idea. Devices that have large memory-like BARs
aren't necessarily the same devices that can implement memcpy and send
MSIs.

Would you be open to adding vfio_pci_find_mem_bar() as part of this
series?

[1] https://lore.kernel.org/kvm/CALzav=cGtmkBBpfUA8nP7AQ3azB_Hn7_8jJL=J+E+h61CpOFrw@mail.gmail.com/

> +
> +		/*
> +		 * Replace the VMA with a fresh unpopulated mapping at the same
> +		 * hugepage-aligned address, clear soft-dirty again, and fault
> +		 * with an immediate store to exercise initial write insertion
> +		 * (vmf_insert_pfn_pmd/pud with write=true).
> +		 */
> +		vaddr = mmap(bar->vaddr, bar->info.size, PROT_READ | PROT_WRITE,
> +			     MAP_SHARED | MAP_FIXED, self->device->fd,
> +			     bar->info.offset);
> +		ASSERT_EQ(bar->vaddr, vaddr);
> +		madvise(bar->vaddr, bar->info.size, MADV_HUGEPAGE);
> +
> +		ASSERT_EQ(0, clear_soft_dirty_refs());
> +
> +		WRITE_ONCE(*(u32 *)bar->vaddr, val);
> +		(void)READ_ONCE(*(u32 *)bar->vaddr);
> +
> +		tested = true;

Should only BARs >= PMD_SIZE be considered tested?

> +	}
> +
> +	vfio_pci_cmd_clear(self->device, PCI_COMMAND_MEMORY);

This should restore PCI_COMMAND_MEMORY to whatever it was at the start
of the test. Or just leave PCI_COMMAND_MEMORY enabled (that would also
be harmless).

> +
> +	if (!tested)
> +		SKIP(return, "No mappable read/write BAR on %s\n", device_bdf);
> +}
> +
>  FIXTURE(vfio_pci_irq_test) {
>  	struct iommu *iommu;
>  	struct vfio_pci_device *device;
> -- 
> 2.56.0.385.gac671c819a-goog
> 
