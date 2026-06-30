Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDA131F997
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 22:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857684; cv=none; b=gimUkfCfhL7Kbv9stWDbUoKZ9fxZI2jglfmdmTdPKabdrlI52BkUPFpgXpZJuEZrksSFZdiS2io0WY4rIRE9meQBdBm1cAm4XHq76qbhgzOHvboIt7U1jemQ+i+N54uByddsf30+hKZZG7odqov1x3vQmRE4s12B1ETDk3gK4xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857684; c=relaxed/simple;
	bh=OHho8xisLBkXPsux52lTSAnNEXH9FZ3N849yTj8opFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWfAiGlVTl+rFWGV5/9GwufYV/mSB0Ag5v6Bd98qV9a5ZKSmE9YE4wPegMfFzfh3g1kVTTpUt6HMTkuePLgbEOXvjCtrE2ws9GCo+3Ijqo3tQIzZWnuyH5kcutbWv1WcmOVfqmV+7zdsDS5wnoVCtoil2YLseIhmIkEcUIoAJk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=iJuRD3X5; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="iJuRD3X5"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e6a434cabso326085a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 15:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782857681; x=1783462481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zvvq7XwN+0vU39EaqWqw5+H08MVeyEUcwD3F1pdYD7Y=;
        b=iJuRD3X5LQ9ohMnkNlThLBpo+UQ9qaC0RrFMo9qr3Kmk4KwTm4/WYQOHwCwAJ52nlx
         8tkMbRNtk/jB0fGP7+MMlzX+g22mriw3rAFTh/AR5j3U7aY6Bi2a7EGE5VxoetPTLfU5
         1vhZcPsiMO/cGhW5krAdqO3TN4vs7dmncABS9OI4weB9/202nDHDJ86tF1Njr4sPARQv
         Bf1k6bml2tBVGk/df9rPXOuDywaIk8j7U8/JtX/Ymf8biiCxFBe0KP274D9Su/ZQ9OPF
         8PEA+2gVslEOmg5e1PvmQX3rK9CLX1PSV94fxD5Wg5iA7ze+T4Sn0S0MKssgyTkhJjXf
         irKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857681; x=1783462481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zvvq7XwN+0vU39EaqWqw5+H08MVeyEUcwD3F1pdYD7Y=;
        b=CP7DPWGW7d+5eAYbid1mpL/Bw9PnxrzbnLZhdPxZLd2EFu7+duoh+3zGDRdE4Esfhj
         GZFfBCmi29jz9XsPTFAFajv8Q530UPG+BfDcBcfvC8V5a0Ive0CJxKIasSsPtBKoAjhg
         prgWqams5EkZerXlqCav+eJ4w+qtjC6pFsLpLSrHOa1YyT4YLukIaGPeuS94u1U5LALR
         PDOYuEXOYgY5TNJnUwLEPItyCBMt9nI9QzWVurYtnwz5DIpzJVeGAB0ejzTBDxQq0F4U
         eCsllClFhOMJ3odSqr+N5lCRmYrDZ3PpGQfl5sxbIJ4qD5+exBupISiGbNwDTSb1xQ4n
         8bKw==
X-Forwarded-Encrypted: i=1; AFNElJ9m6izsH35njZ4CuDSD2dDCgutQ8zIk9LMVhvhigy9ktavzAwDiPthvV9dFJfltsDHtW9KfcctZvFCfcZ1FkAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YysMI8k95pNHF53qO1PlkyQ39IEVn6rSvseWgLXPG09fS68emqk
	eVkEGzkkfLlMtMPQGO1C9MdLbUEVCtVovhPZRatyMtf8xkFS8qSV87U8aOY589PaNXg=
X-Gm-Gg: AfdE7cl5TTdOJ/6hSacb21kAKc8qxW6WaskCM2ZmVsH54tgOaFDVJBazlF63zP4Mx+D
	OJnmp25oBAAWzJP9xgt9axfB8WpCJ8o27akP9IoHoHvy1SZ7kchSyVqXPGYQPkLcAeRBymo/UO/
	VZXHjUB/js+PiJtL/MF8CauJ40lz8L7uaAHrjTnVoUcbiLcmtmVdgnlyf2VVD2WL43c5mW4GtJU
	FJKbwUrZ9MJZ4YVee5MctO4bULRvLujQreOjwtsgf04OBXLRM0aGm7q7e6VIJLtOiaB7nepoEAG
	Ohj74boMTZHFvrxz/INSG9lxwTFdhc6iJJnMlWGyXqgh1RhRDnDoeQvGuftggKg3SiWsu3GDJ4P
	4mZUIJJ4E8BGul6qW2pol+kXZ65R++iISGsbH9sb1yCm6tDCMug1E148iSjEk+gfGjiSI/mJbLv
	ixbTTh2Cdda0VO8C9VdFLJEpS833iCp14d/EW91v5odVHhCfc09nflE4VgplxxX1pSg6zbmo4MK
	D8rc3c=
X-Received: by 2002:a05:620a:6cc6:b0:915:b852:4361 with SMTP id af79cd13be357-92e624e3088mr975087285a.20.1782857681333;
        Tue, 30 Jun 2026 15:14:41 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e6213b953sm346810685a.2.2026.06.30.15.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 15:14:40 -0700 (PDT)
Date: Tue, 30 Jun 2026 18:14:30 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com,
	david@kernel.org, osalvador@suse.de, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, djbw@kernel.org,
	vishal.l.verma@intel.com, dave.jiang@intel.com,
	alison.schofield@intel.com, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com, apopple@nvidia.com,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v6 09/10] dax/kmem: add sysfs interface for atomic
 whole-device hotplug
Message-ID: <akQ_xlJtXNgnGUdf@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-10-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Ha7M+e+kLoFbO4pS"
Content-Disposition: inline
In-Reply-To: <20260630211842.2252800-10-gourry@gourry.net>


--Ha7M+e+kLoFbO4pS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2026 at 05:18:41PM -0400, Gregory Price wrote:
> There is no atomic mechanism to offline and remove an entire
> multi-block DAX kmem device.  This is presently done in two steps:

... snip snip snip ...

Sashiko pointed out a false-positive, but adding a fixup patch
here that adds additional consistency.

On total failure - release all resources.  This makes the sysfs
interface consistent with the probe failure path.

Just attaching a fixup here, since technically it's not a bug,
could fold in separately

~Gregory

--Ha7M+e+kLoFbO4pS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename=0001-fixup-dax-kmem-add-sysfs-interface-for-atomic-whole-.patch

From e341860c83fd5d5e8549d8adbf71a484c8990c5f Mon Sep 17 00:00:00 2001
From: Gregory Price <gourry@gourry.net>
Date: Tue, 30 Jun 2026 14:49:06 -0700
Subject: [PATCH] fixup! dax/kmem: add sysfs interface for atomic whole-device
 hotplug

---
 drivers/dax/kmem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
index 19effe0da3dc..f597d8a99c1f 100644
--- a/drivers/dax/kmem.c
+++ b/drivers/dax/kmem.c
@@ -380,8 +380,11 @@ static ssize_t state_store(struct device *dev, struct device_attribute *attr,
 		return rc;
 
 	rc = dax_kmem_do_hotplug(dev_dax, data, online_type);
-	if (rc < 0)
+	if (rc < 0) {
+		/* Total failure, drop the reservations we took. */
+		dax_kmem_cleanup_resources(dev_dax, data);
 		return rc;
+	}
 
 	data->state = online_type;
 	return len;
-- 
2.53.0-Meta


--Ha7M+e+kLoFbO4pS--
