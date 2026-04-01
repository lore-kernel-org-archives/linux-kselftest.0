Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9A439C00C
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 08:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033083; cv=none; b=Y+JZ+oOYkYnRmRZoJMigwNaPAL3hilF1+MoOeLvGLeG1U1AeiviI25hGjAU+/7Nnrd1xfp/PDIAJZ0Szx3YE0qceRQb+nLCI0+ejENJ6GLR7/uEU0y7lt4LPW50HD8vrk2dHBtZNRkPaaFz9nKKoGc4s6BFrvZqfIKz2rWYzVVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033083; c=relaxed/simple;
	bh=2D38ere3Grccf2yg0w7Pk1KMScDLLh+TTvPAiTTHJX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVEN0SiM0vVDPrvZ3xVTp4qN5Bz0XBZAurFWztxCl82x1g2oQSVv4zmv04quWKUODheNBB6J6gvZW1hTXhseb696mm++5NplvrGpkpZN1KBFExItZNVdzpuz2yDStxQ+g5LOqpTH4KVAsudwpwjoFsExgMZrw4UM7J1ap/itzkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JZur8EuL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qN6Q+t7v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JZur8EuL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qN6Q+t7v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775033081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7VTKemEY4CMnXuTlNCjNoZ777F7zIOeMz1S1dcBfefw=;
	b=JZur8EuLvHhcuyLkI7hemvjjvg3p1zHgOu9ILH+d9fZ49STCUpjR1BTFFyzeyVkDZHAcEe
	NUxrQkZCjnVq4DLqOKDRNSyWqxKL/Rq7nP6Ih2KXgu9wYxk3wFCsR6YQDoJ/v+WKsakYvw
	/pd2k8mgHen5dmPNxE56kN0pRPYAZoI=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-jN7ts32iPT-5AnbRbDH55Q-1; Wed, 01 Apr 2026 04:44:38 -0400
X-MC-Unique: jN7ts32iPT-5AnbRbDH55Q-1
X-Mimecast-MFC-AGG-ID: jN7ts32iPT-5AnbRbDH55Q_1775033077
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82ca8323edbso6928255b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 01:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775033077; x=1775637877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7VTKemEY4CMnXuTlNCjNoZ777F7zIOeMz1S1dcBfefw=;
        b=qN6Q+t7vhg73ZbhdC/GgnDkWs0SVh2rUirPKmpAxDYLGrN/SXrxkC6ZvykSIvpPc0x
         FxvflGb2H2MfxriFmYdc1fJ+iIpE5pjsQb2wllwLpKf0ZdFwMn68oglw0HTLnaLdVS7Q
         jUTbW/WixpNoQmn+R13m+ijs9iCV5GhobIuAsEP2am8+CgWGKYythnosQQaj4yZMixrJ
         z4jYFbBEsKl7/kBKEKpC+ZY8xOmxWSw2fzedz1UWoU660TTm4Azs0fMDKt5SCDGGYyqP
         1OIoVE2Gwlx39CttOdmFK3IlJ5rO0Ism7nbVmfvdCvG7YiXe2B06f6H0P/IIK6a/ak2G
         HuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033077; x=1775637877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VTKemEY4CMnXuTlNCjNoZ777F7zIOeMz1S1dcBfefw=;
        b=j4MKUujmEmbRMY9jSz409/rsTHF1WN65h3v9Fe65OADaC8qNkewh+jDGDZfOijwWjc
         dqGC9EidXpt0DcRDmrjEyfGdgvAK+LrVN9QxsK6E8ylnK4kZYoK6nW80W4a3TaSqCWu+
         Idclv98sT0324weoCpxe+Hm7DrBVn4TzOHVPEYs6Oy9g8+VqUeouhJtjUYYZbOoaJqP4
         MP35PdmDAPEsYqcjv9XG1PFi4sE6RiGo6urOPdVLTq4zpK1+c7aFxSv/QX9E98uiZk7R
         ZvqXDY+ytNGgk2qJbcbZwP+EdZbVoijj30Eb1TwjMkZDDmzJ+xk7XchAa52zYhSo8aoM
         2/Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWii3SDoYe6goBHpwUpbTMkx/sXkyAg2Q7t99jp0MMZHXpzDpObaKCAI1m/qEfj/pD/+Dzim5Dsglani6EEikQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBtUste8pEQHNa+Xy6vH8XOqaYPMljm38rNZ242L9QjTHYBe75
	MI1jrBhIqPS8kX2pc0WdFSaXfNRzImmdKBFHWjDDu0BiUiVwxqnnz2xiejXMoeA3nDb4e0WZUje
	IC3ceJ8AXPG00ue/0ozqEzOGjeOTN0BC3WAmwacShU3xTPxXE0CbxiOIs4mN6yTDoreXUMQ==
X-Gm-Gg: ATEYQzz0sJxybD84+qjNngtrVoQafznKh3YOvIFOixIf7dYiv6dQMf3BFRRGMB/PXJy
	rBxGyaLwzUuNxui5deQoLEWPwkpKJyfxoqV5BYMtEAyBchIHoZV1pOw9MmBHFaJC06PYWLCrFai
	vxWASbZ3N/4UOUbhgOzgDNJ3GlVK3fv26AxGzag7Qhx3XYP4eSy5gmY/jRejLlqlZQZ4E3Eyz9e
	txQESe4DSRXXaNL6XkIIof8sCEqqgl0hJIKGowYQKscEL7PviYCvaf/SV6dMBWxZ4u2QXDXXnNN
	JvLLMVHp4vQMY4WW3FjhK1jHTHWxeSVoDr7NRW7q5qNAjEXmyma7TKK+5A36rj9xfUVDhO+sFiE
	xPi/bcleRkcGftzoz4Q==
X-Received: by 2002:a05:6a00:3d47:b0:82c:217c:98ca with SMTP id d2e1a72fcca58-82ce88f50ecmr2952032b3a.12.1775033077477;
        Wed, 01 Apr 2026 01:44:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d47:b0:82c:217c:98ca with SMTP id d2e1a72fcca58-82ce88f50ecmr2952007b3a.12.1775033076966;
        Wed, 01 Apr 2026 01:44:36 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8465746sm14068621b3a.21.2026.04.01.01.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 01:44:35 -0700 (PDT)
Date: Wed, 1 Apr 2026 16:44:32 +0800
From: Li Wang <liwang@redhat.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, rppt@kernel.org, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, aubaker@redhat.com,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v4] selftests/mm: skip hugetlb_dio tests when DIO
 alignment is incompatible
Message-ID: <acza8JhtGD6sE3N9@redhat.com>
References: <20260330125307.98581-1-liwang@redhat.com>
 <96d14f27-ca0f-413d-8b61-768933ee70ba@kernel.org>
 <acxpVd5hQUuGPQCF@redhat.com>
 <b9625c60-2b1a-4890-a703-49e31aaaa168@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9625c60-2b1a-4890-a703-49e31aaaa168@kernel.org>

On Wed, Apr 01, 2026 at 10:34:40AM +0200, David Hildenbrand (Arm) wrote:
> On 4/1/26 02:39, Li Wang wrote:
> >>> +static void run_test(int fd, unsigned int start_off,
> >>> +		     unsigned int end_off, unsigned int align)
> >>
> >> Nit: prefer to-tab alignment in MM land.
> > 
> > Yes, I noticed Andrew (thanks!) corrected it and added to -mm mm-new branch.
> > 
> >>> +{
> >>> +	if (!check_dio_alignment(start_off, end_off, align))
> >>> +		return;
> >>
> >> Is there a reason we just perform that at the beginning of
> >> run_dio_using_hugetlb(), avoiding run_test() entirely?
> > 
> > That will make the run_dio_using_hugetlb() have too many args and
> > uncomfortable to read, yes, it's more likely personal preference.
> 
> Nah, just squash it. There is no need for this separate function, really.

Okay, let me do it in patch v5.

-- 
Regards,
Li Wang

