Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872EB28CF5F
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 13:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603598; cv=none; b=o/qRpXNl83pB6W0A9YtLjHTaai26TPRxnZuV83VitmxTbdMUiT4ouQNq0fZsEJYJS3DyEdzhGIkEBF4DcBhWUxFHDUOcwuAiBictOf90zkhCVaCsYclXijvoT/ubSFH5T5oXb0LXO6SeeZuVc62GbZansgxhapoQcA8RqHGfv7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603598; c=relaxed/simple;
	bh=Zs/irjYjK3litAucTY9Kex/Xw0tTQqlwKd/rWtSGOuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwYiEe9+SFfif3DParWVWU3cL2HvcKzkFnMQTw1IzsSdSwvNYJwtKKpPCP8KkH40DiXoVpV0k1/g8GAwVyeiJq+aPeL7CpgjiQhpfsCf1+zRaKBEFJIonyxJYDynr3ZaPei2VnraR2uU3JSnrbK66C3zBXLe8iIzw7G5wrNPKs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fhzdox6l; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CC+2S7RO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fhzdox6l";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CC+2S7RO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783603596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=umaix0cxC+rT6m1GnvXK/gqOVWmu6r2MZofHtjJ4yFY=;
	b=Fhzdox6lFU+uXDIsCfcCIjzyq31UrwC8D+aDeQsu9/0SRq23l5nVC0/n/fRMiJkM/01auj
	T6kVzRNgmZg6OO21fMdS4gdEI2WBpX4N5ee/TwR2ZFCrQ+ITr/GOAf6BxpLmrE9XhfYiou
	5G49ZlvV5YzKuv91LfdrYP0x/RLseG4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-bbalZk3GN_29hiPkjjJSKg-1; Thu, 09 Jul 2026 09:26:35 -0400
X-MC-Unique: bbalZk3GN_29hiPkjjJSKg-1
X-Mimecast-MFC-AGG-ID: bbalZk3GN_29hiPkjjJSKg_1783603594
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c1288e572c9so76660066b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783603594; x=1784208394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=umaix0cxC+rT6m1GnvXK/gqOVWmu6r2MZofHtjJ4yFY=;
        b=CC+2S7ROrEi/J5ID3hOd29uKioyVbBrYLDL0naZaiUMijCrGw+E6u0d2OshDXnFVwA
         j2JjroU0wPteLHvAkwqMJxmJc0Pk8SeOFNhoybSdz8KiCen9eDQsvWyOF1GANsuylxCG
         38An/FRfdqW8419aR6b4STO0jqjkQmt3M4dKeH7z1YFFfPDFSeRKXTJz0UY2kWQ1ee41
         yusRGbLnEG2zwxsh09hdxc+PS+OrqX7TUuGbRfDH4f5FVTOzQenIG4F80SI0seEmrjz0
         LpdtXgdfE95d3nysYDYrHndAW8NW0qp317h8Leu8hEy405l1i7Mdt7yr3SuT5pzLm4Yp
         ssdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603594; x=1784208394;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=umaix0cxC+rT6m1GnvXK/gqOVWmu6r2MZofHtjJ4yFY=;
        b=Ww6hBSMp8OfjKidchR5CcuFOSZkI+rLcuzYwcHcpCYky6ixkj/uwrkZbSvWADjKtuN
         8DgM08PtqiBH77qGfjZxOQHivV4ZQRpT+i0UpYLlhrW4Ms8LkLSl2Gwu4HiUff53A3HE
         uOkPayQb0cD3Jz8IgFxewIbZHD5FuMUTT2o1+cmqzPd3chFqA7Citwq5C5wP32N/qP16
         7ldZOTDOFlAWpwXxNj/c93FXzwo5ae5m0R2wnAqMlLlLSjyf37eO/xrX3WafVFcsNLLV
         Axr2lRVLrqn36eWkKfVuA4/teNPjPx6PdNFqwB1H6HTBwp2/GN4nAzXLcE0FWLTzjdoz
         FMQA==
X-Forwarded-Encrypted: i=1; AHgh+RpWRT0qhXW56FjaWVaLGGnfZs+MjXlq57hLkdUXirqGmJfrWLuXFtsGEbsEZzEd1uqTkB9Q9ua32mxA7nwTyIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVOPkHM33TtsOG0Ed7gJSS0tm7pN41x9GqfM3k6nsU2buXqxUh
	+XWTn4QE+SCdf4Hj6iMcUIaolqFyvcU50Kk8IY4dOOixzGpbra4Z5mjHSD5I5oF6UqQ0xX78IPS
	E+MQDL3oJ7CsVskmCwyeAXaWSJwnl/j+6guosD6DueeqA0rtXdBatmif9+2zxp1KjDWRCfQNMQE
	y/6Q==
X-Gm-Gg: AfdE7cn+1axiXdjFfkHJFcbxLQdbtTujL99p1TWsJjL8Zv0n08SNjE3lwkYQZaGRh40
	8xA/BpHEO8TIEdxLKMBzZYv7Of6byfO+vpTKgJLLkoXE48whMSYofrz1khmtQKEQjjA5lc8uesS
	eVnwpxWji+7C1ET2qlMZ/SPzyFVUbPcgtepEhX1lhQPFHXMc87A33B4yw6kNHUPDs3MoiXwD8rl
	Lnz+5pjjffkq3Ojb94GUzpTYmn2gSbabUXdQsUd+32zEEB3Kfhhrqlytn25c1+VQzKtUUDO7+ea
	x9/MRNsbBO/EjwSAvuaMl4DVWsiuwsBmekkzIMG9djF4u7HHm9S+/U7+YaZ6UxEsjivjNTsH9fz
	ykYa0Vw4I9y+OBHJeJSKjM+WcSiY8dGq52OhF5C71cKMLYRHmKN3LcWY=
X-Received: by 2002:a17:907:3f15:b0:beb:8c28:254 with SMTP id a640c23a62f3a-c15cdc62f3emr427044266b.0.1783603593945;
        Thu, 09 Jul 2026 06:26:33 -0700 (PDT)
X-Received: by 2002:a17:907:3f15:b0:beb:8c28:254 with SMTP id a640c23a62f3a-c15cdc62f3emr427041766b.0.1783603593387;
        Thu, 09 Jul 2026 06:26:33 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d5739621sm232862166b.32.2026.07.09.06.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:26:32 -0700 (PDT)
Date: Thu, 9 Jul 2026 09:26:31 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 1/4] cgroup: Add dmem_selftest module
Message-ID: <ak-dELEAmo0szZZi@x1nano>
References: <20260706-kunit_cgroups-v5-0-6c42c8753468@redhat.com>
 <20260706-kunit_cgroups-v5-1-6c42c8753468@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-kunit_cgroups-v5-1-6c42c8753468@redhat.com>

On Mon, Jul 06, 2026 at 02:06:40PM +0200, Albert Esteve wrote:
> Currently, dmem charging is driver-driven through direct
> calls to dmem_cgroup_try_charge(), so cgroup selftests
> do not have a generic way to trigger charge and uncharge
> paths from userspace.
> 
> This limits any selftest coverage to configuration/readout
> checks unless a specific driver exposing charge hooks is
> present in the test environment.
> 
> Add kernel/cgroup/dmem_selftest.c as a helper module
> (CONFIG_DMEM_SELFTEST) that registers a synthetic dmem region
> (dmem_selftest) and exposes debugfs control files:
> /sys/kernel/debug/dmem_selftest/charge
> /sys/kernel/debug/dmem_selftest/uncharge
> 
> Writing a size to charge triggers dmem_cgroup_try_charge() for
> the calling task's cgroup (the module calls kstrtou64()).
> Writing to uncharge releases the outstanding charge via
> dmem_cgroup_uncharge(). Only a single outstanding charge
> is supported.
> 
> This provides a deterministic, driver-independent mechanism
> for exercising dmem accounting paths in selftests.
> 
> Signed-off-by: Albert Esteve <aesteve@redhat.com>

Reviewed-by: Eric Chanudet <echanude@redhat.com>

-- 
Eric Chanudet

