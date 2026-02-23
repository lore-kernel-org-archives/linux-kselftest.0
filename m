Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B6537F8DA
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 23:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771890229; cv=none; b=oXocL7diLbDCEzyZeiw+KOVVwQNpFi4jXSFshK7EfjE6oN3BzLVgHQPVmxjRpKpW4hrtyKMDD55Kzesz5UDEON9H5T/Ua6Ac+XzouNDYwTx/xnGbOTwgMpcYR/1E1rDhzH68BOQ0LzRFXDb2PKRFnlxwByKbMlSLWj4ojGCmoMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771890229; c=relaxed/simple;
	bh=ixq3EXVD+9YovL/Dhlm10KQAl6fwXAJ2uZkBL4dtJrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsJiaxvQ9J3WSeCghTygyDUTP9jIOJMkCTVvRiuNLYrEpo/87DZnVOf/1mDgxrHuP2yAxQJy/HP/DcyUiV4GvqI8C+FC0pgDyKWf92Y5GppzgZXB5njBQWnPQ7IVhRmmZJnjLqlGg2qeKl8QHBNpLiAGHE3eJ8a5MBNKhCA3wgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2veE+8f4; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2veE+8f4"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a964077671so33235ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 15:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771890227; x=1772495027; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Nz0fZa7S09a21wJlX7cSiDYFAmJR+w6WbxCWC6v114=;
        b=2veE+8f42mkrsLFlgFazW1/bxr9ic3+E09dCe7+j7j70c452Zazxr1PbNf25jEiCwy
         OyH/NxseCRKAFH/ncPPcQKzZybdZ0k17OpIo0BG9INQH4uGMdLnN7vKu70iuv7H3Op2Y
         aXvbKJPjmvW2qngVHqa9GP8Nnha10zD5bbIo9Q2OzN26D5MvMrZMurbPqkAwXRzn6v4Y
         OEvFY7AbpsH1jy5G5OGShB+1qvk/XNiVwN23vP44YtyUGVlInt8mvU3UXa9PeD1ptimA
         IycEk/fUgP35GQCUJNk/mqF4GKjk9Iiw6mteOoh0JC4MJ52P/jrkFz/Lfl3wmtAFl6h5
         6JfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771890227; x=1772495027;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Nz0fZa7S09a21wJlX7cSiDYFAmJR+w6WbxCWC6v114=;
        b=t2j8v811D4FMy8R20hP1IS56x08r7EpYADqgtLZZz+Gr6lCuqIGOU0gVfzCYO1xkgr
         42J0FuXHE3vB69ac6Fdo9179UrlxTg+HhoupL5AlNPAA57zK0bKa9Dmc8tXR6GizaTu5
         MyL8GmL6sSVAVw4h8P4cniyk/tLJJG/aDJsGlTnFIdu7ZXMav7PjcoGrqe2n+bH6lrFO
         hJzHCSH2yka2PJlm5dszJH90IXqbEUQJcVBP5OtwwjHX8Z2TtJbBYu+O4jmCtjX5J6Z2
         /+p7UNU0YfCRSeEPIHziNxXLlDRUdVsxCaACnBEw6v4df+NoDk0yPTRrR1n6M0nBTXQK
         Bm2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUErZw8UAOr/CE13MJfaHhTTIS8d4iJLVeXkNda4lBA5UWwsx2lj/wPdNRPFXHI+YyZbmmo/zKFcbVZtfgPC+k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+PgDYZnNxZERH4euJBIpgQdUq+13eAwJvLREuWjD/DppwQJgE
	txHurFrUYr8N5IYcdoMNH9oQTDUXMBh/++qca6YJLfmzfqmSsI1EWTKc2G5f5FBj/g==
X-Gm-Gg: ATEYQzwCjDZLH7hlyE1nMdGObwSAvu01fqac4kWGov2Q7otN3nYpxLsPfpnRRPOveOs
	ibnkbzXzyrW3OpJPd2NmuEIPBnQo27FK90xYrBIVDyP7PDnW6KEsOM2vSwGD/TkFdQwskPTmQ8o
	t2FI1MJKdX01GM7DmaMuw3YhElzdRzz1U112wRx+od2gkUs3dIAbeRiVuWpv/PBTY5/6p2/dzcX
	b8vBXHmZNMe7fzqKbalGwukYtErJtNC500GfWZ+4WPhzzlNKymZQ7fhN1WmuxC8xrAclbZ42l2i
	UdXFM8UtTyHrYf7QLM0+oCFIRvNGRm4bSP0Ba72AI2/+iRkjqqK9LleBjKw4pTpnzqYwzb9dPGj
	xPphb9TZ3NI6Y7xJn4YGgG4eSrUw7N8VRL9I+pPKPSN84U5zkuSPFcfPCfhsnZ4POomiQKFfwbR
	p4xub8hRwmvtVSRH72ogDNWwUtO8BBpOP2uMO1lVDOKnkZfqeQdtVURFrzFn+Z9A==
X-Received: by 2002:a17:903:41c3:b0:271:9873:80d9 with SMTP id d9443c01a7336-2ada3483c30mr271955ad.7.1771890226940;
        Mon, 23 Feb 2026 15:43:46 -0800 (PST)
Received: from google.com (168.136.83.34.bc.googleusercontent.com. [34.83.136.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e1c0sm90833575ad.45.2026.02.23.15.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 15:43:46 -0800 (PST)
Date: Mon, 23 Feb 2026 23:43:42 +0000
From: Samiullah Khawaja <skhawaja@google.com>
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
	Shuah Khan <skhan@linuxfoundation.org>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Tomita Moeko <tomitamoeko@gmail.com>, 
	Vipin Sharma <vipinsh@google.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, Zhu Yanjun <yanjun.zhu@linux.dev>
Subject: Re: [PATCH v2 02/22] PCI: Add API to track PCI devices preserved
 across Live Update
Message-ID: <574e4wq43zm5tyfvvtjfvzqlhoyijcgvvk7gptghrx3ofq5ck2@l2q7xbmtibbq>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-3-dmatlack@google.com>
 <4mbhcmimhin2ulz57mbzpe5p5dkhfziiyep5k3vgls4zmom3sb@g6jlouyvmpuz>
 <CALzav=eXY=ZBshmpi9axt+_0SxaAm0Xbo7w==nCWJwKK3xcThw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALzav=eXY=ZBshmpi9axt+_0SxaAm0Xbo7w==nCWJwKK3xcThw@mail.gmail.com>

On Mon, Feb 23, 2026 at 03:08:19PM -0800, David Matlack wrote:
>On Mon, Feb 23, 2026 at 2:04 PM Samiullah Khawaja <skhawaja@google.com> wrote:
>> On Thu, Jan 29, 2026 at 09:24:49PM +0000, David Matlack wrote:
>
>> >Drivers can notify the PCI subsystem whenever a device is preserved and
>> >unpreserved with the following APIs:
>> >
>> >  pci_liveupdate_outgoing_preserve(pci_dev)
>> >  pci_liveupdate_outgoing_unpreserve(pci_dev)
>>
>> nit: Preserve and Unpreserve can only be done from outgoing kernel, maybe
>> remove the "outgoing" from the function name.
>
>That's reasonable, I can make that change in v3.

I should have added it earlier, but the same applies to the
pci_liveupdate_incoming_finish() as it can only be done with incoming
kernel. Maybe we can remove incoming from it also for consistency?
>
>> >+static int pci_flb_preserve(struct liveupdate_flb_op_args *args)
>> >+{
>> >+      struct pci_dev *dev = NULL;
>> >+      int max_nr_devices = 0;
>> >+      struct pci_ser *ser;
>> >+      unsigned long size;
>> >+
>> >+      for_each_pci_dev(dev)
>> >+              max_nr_devices++;
>>
>> This will not work for SRIOV as new devices will be registered when
>> sriov is enabled and the max will increase. As we are not handling VFs
>> with this patch series, this can be fine?
>
>That's right. Since this series does not support VFs
>(pci_liveupdate_outgoing_preserve(VF) will return -EINVAL), I dropped
>the logic from v1 that included the maximum possible number of VFs in
>max_nr_devices.
>
>Once we add support for preserving VFs, we can update this logic.
>
>Another way that pci_liveupdate_outgoing_preserve() could fail due to
>running out of room is if hot-plugged devices are preserved. But I
>don't think that's an important problem to solve right now.
