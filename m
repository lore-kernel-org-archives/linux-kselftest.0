Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048A61D8E01
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 00:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775003997; cv=none; b=r638X2/Y9JgXE/TGyIHdb5l1+GAfeZmbUJW5sZTunvfeGzQqjxrQHhquxGdsWlB/AvvYoDGYldGdx2a4C2ELzBWg4JBUeRCBjNSeNqYmPsVWP83nLasB/NWDkU8Izk3Ew8eDbSd3cqXntdrc2xI2h62uIMJpXvNX4KPOdSKHDJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775003997; c=relaxed/simple;
	bh=wmSFvBfh4bZliCkgGsH9ns7uhrjGl8UKSk7zMYjjaMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2a1G0gC6vnZPgPLt7auKxZDfrmS+2jgMWcNG+MMUzy0PJDzXuJ9MPBLzQsNd2NQ9SDtS2dwX+OLGZqo8SMkyqpd2ZflfjM1HUcDK9Ix/0FeTCd0lVYBs7TUsQ+vm5HcIcUuekli3HDFw1a8X2BTVrRBq7AwXpcB2lHDO5ekPJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fwXnNihg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DsUaTbES; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fwXnNihg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DsUaTbES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775003995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlAyR4IsTCd6Wy9tY8fsi0F7XjnqGFSW2B8UQN2ZazM=;
	b=fwXnNihgx1DSAhtOamatFR15FV662OWPCGO6ik+eHZ0cZh7fvhNsP79zfb0EYU+WgLHn3U
	FC0PN8RxISRmbgK5cQChGvL6uLCX1BWQW2dvFzI9CmDjY4ozC+LFU8TNMxA8aKkROkLHYL
	wtIaOO/mx6INWBUfbhG6YpOQ/EpOeLM=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-kfF-Nng5PAO_JspCPNMU9Q-1; Tue, 31 Mar 2026 20:39:53 -0400
X-MC-Unique: kfF-Nng5PAO_JspCPNMU9Q-1
X-Mimecast-MFC-AGG-ID: kfF-Nng5PAO_JspCPNMU9Q_1775003993
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76b0e04285so610236a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 17:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775003992; x=1775608792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlAyR4IsTCd6Wy9tY8fsi0F7XjnqGFSW2B8UQN2ZazM=;
        b=DsUaTbESdyWwWwnOcJxuedkKiT20EeVnZqP1BgvtcRtLEVfF4yipsQRW5BXewgL5Z2
         +SqsmHm8P8TuySf4SU7QifdFu1m5FYujDTfy/+ZMcnTjNNM4Kiwb1SSX+6HFRaG2CUI5
         j6Tl4Ca8S5UiCDFEItGRiod8bCXKdrqpXOOq6DcjB4alrHg6ginQIbl2DJN1qM5bIaHZ
         244kvJsl92LSZqzs+hiE9sN5QXM1QGEES4yufMtZFBGliYrKJRgZElkozjcXUw3oKFEO
         rPkcIlf/sDFLPGmX4OdClGMj/fyqq35JVqmOYQHu7zgdPSSUFxh5zV2v6uG6TkRbx0yl
         B67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775003992; x=1775608792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlAyR4IsTCd6Wy9tY8fsi0F7XjnqGFSW2B8UQN2ZazM=;
        b=jUuZ/bhzeJhIN5aACZosd7LtnQg7p1YVuOa5YDwIdzWZx97Zl5cCLfRGWNh3I41rGj
         Dr8U3D0CsFg3I2sBmkxwLzP+6OcUyWIeV6M9jp0M5LWoH1bJ9XJiAePTd5XpTNJsMq0N
         /8eGykB8IHhTOVNcGWARy0nhEw5BATrZE2u6/WksCkOi1M8b5gAlaO29L3V5xc3+auzS
         DnEvO3XKOLVkVtxWI9Wma3SLrwP/fUJk3L0xKrMIR0T18KdoRkcBIv5F3XhqHUctuMBf
         zegW/E99YAlHFfl6RDGMN/F23dqUMbLTOzRuY6qtZBWc47zTc1sKoifvuVcNGf5ipU8j
         nzsw==
X-Forwarded-Encrypted: i=1; AJvYcCUegGR5svHASlJWgxOA5Y2kr6pkPlnoBFirFCMHmO6S/lBtuFcfXGMOskOjLu0Zt3+tFqRXCcY665lKx7JzSU4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7REvNQ2V21cJbLYoWGHoLPMl4ZPM2QkTA9WilQXK9XewwyYQX
	aaFl/RUW3eKD4JtrAjmW6KUux/6HLEYEQo2Fhx80nNSGJb3S2DBCaB39hZNQ9cMztyQg3Tr3lPF
	F1aq8AHfJLr5UW7r5nxo6RtwQOJt1YGb604JpHJ8JCrL7sBz5iF/oDoDHDY2jfBviTO+2/g==
X-Gm-Gg: ATEYQzyoJnixY93tQGQubhT6I1AbDsAJBcaBoXfkDqgX59g6+KHf2HIG+LRRM/04rde
	qiFF4Lgvt8IJHcXJyKWjzJaKmrY+XztRzQPwXab0Uy+iovFHPldJ3bPR7ZjPHjF9PHE6/0CoTBA
	3Jf5d1INHUJRtDBE+uFyY0W2uS3t3eqwDLU7EvknB4HH8lxbh8DclYyfFkv4WExEjLPhQmdGSiR
	w5hVrzc4hCXO08huGx2O89UWMy3VbW6x+Bz3bZSknmfTBBEzFgk7prLEtewxdRnI+9A6doG4BxQ
	VLBdFCBT98q6cBFNKTJ9dBdhJI+zlUD6oG1rgpeMrFUDkaaA+nIdLlcOmQMrzEX9HKkykFg2M/k
	7sdFZPBo3AM7gaALvBw==
X-Received: by 2002:a05:6a00:94c9:b0:82c:7767:5bb2 with SMTP id d2e1a72fcca58-82ce898c25amr1699807b3a.21.1775003992516;
        Tue, 31 Mar 2026 17:39:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:94c9:b0:82c:7767:5bb2 with SMTP id d2e1a72fcca58-82ce898c25amr1699778b3a.21.1775003992032;
        Tue, 31 Mar 2026 17:39:52 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cd706985esm4659303b3a.34.2026.03.31.17.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:39:51 -0700 (PDT)
Date: Wed, 1 Apr 2026 08:39:49 +0800
From: Li Wang <liwang@redhat.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, rppt@kernel.org, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, aubaker@redhat.com,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v4] selftests/mm: skip hugetlb_dio tests when DIO
 alignment is incompatible
Message-ID: <acxpVd5hQUuGPQCF@redhat.com>
References: <20260330125307.98581-1-liwang@redhat.com>
 <96d14f27-ca0f-413d-8b61-768933ee70ba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96d14f27-ca0f-413d-8b61-768933ee70ba@kernel.org>

> > +static void run_test(int fd, unsigned int start_off,
> > +		     unsigned int end_off, unsigned int align)
> 
> Nit: prefer to-tab alignment in MM land.

Yes, I noticed Andrew (thanks!) corrected it and added to -mm mm-new branch.

> > +{
> > +	if (!check_dio_alignment(start_off, end_off, align))
> > +		return;
> 
> Is there a reason we just perform that at the beginning of
> run_dio_using_hugetlb(), avoiding run_test() entirely?

That will make the run_dio_using_hugetlb() have too many args and
uncomfortable to read, yes, it's more likely personal preference.
 
> In general, LGTM, thanks!
> 
> Feel free to add my
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks a lot!

-- 
Regards,
Li Wang

