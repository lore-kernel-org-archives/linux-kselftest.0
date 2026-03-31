Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8D23ED10A
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948594; cv=none; b=YozcRIqqvdmCg5GWDHELJrN0shRmgzn3IjhucJNIagu6SkTqJvrcobyihFveA7dDKlQn+n28jNuScZ1dhvEOkeoYL9bR1YuEVizRBYnXN8lB9NZZJ/qbjaJmi2FeB/2LaWIOpmeqc892C5ywQj7UW18u4wifBeLOd/dlv8N9lak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948594; c=relaxed/simple;
	bh=/8qNCRSA3xWFGi2tA+AaQuz7a35g3bxVg90Ij6HEJKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SybLLiUi5YP/H5/PZb/ma3l98MC6OtPxLlAWjFCq+iYzCgaAkn3+7vNopgF0519DzfhizYWCdabDo6oGzJDe84sa2I/5CdFjpkOgQIcRCiUdR59XCm4yL2WVeK/9JDUD84lH59UYTDt1YjGPmdbcHpYbr5+oupEBX22u2I3CfYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g0afj+Tf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rhv4zFbS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g0afj+Tf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rhv4zFbS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774948591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YW7ru+MxIsYT4TWFYD0hCF8kOfP+CTkDbU7PkOx95xg=;
	b=g0afj+TfE48ibcKkPPvokxk+Mln/mCWRFfQKQF680OtGshvBCOkkMk+2o87Qa71RBPUigJ
	NIzwFq2WF1bR9fwyLE1idzv0JbD/yCMOPORIfrLWd7YXaEfMAzssZSt8yXlPxzDv5RNmsZ
	XCMiy1SlXL1au3T26ZiLJ3Dr6FklhwE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-5duG04baM5mW8B_LZvK3tQ-1; Tue, 31 Mar 2026 05:16:28 -0400
X-MC-Unique: 5duG04baM5mW8B_LZvK3tQ-1
X-Mimecast-MFC-AGG-ID: 5duG04baM5mW8B_LZvK3tQ_1774948587
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3594620fe97so18433032a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 02:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774948587; x=1775553387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YW7ru+MxIsYT4TWFYD0hCF8kOfP+CTkDbU7PkOx95xg=;
        b=rhv4zFbStJMf06uC7LcoNfd6FX9X6YC/W/jhEG5xm9awwoKXkdmy0/XCxEjGl6Hy92
         cNByMBoBs0/CpG5CqpGnoKpaNiamdI55QRCj/PtqSdZGfLJqvWXs5Wa8mEaAt81T19wO
         EyiNwnsNq85OJVg/1RDTP8swrF79uS2Ir7O+mqWFNYtBjMJ7jU0SLHY/MFzu49pmzQFU
         AWgKrq2kwsQKQIMz+iaydChNdfh6cIF8uraR9eLjG4yruQf+0ARJVSG+33JwUyY3zWEf
         GAQjzb32mjfYu+azL4vOq1K+JkdFO1GL/4ezt+wxOHJpnikDUNwiHmpvtcq+vJGU1Fts
         H7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948587; x=1775553387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YW7ru+MxIsYT4TWFYD0hCF8kOfP+CTkDbU7PkOx95xg=;
        b=UTWLPCsKbi1t4FufswyztMPKattM3iOFTqnE2QGs2wQmst3AmU+soEAv1yE8vL7S8T
         eaI8IyBxTuqzWfiW3vJ0gGBItaDO97SIy2y658keifuq2wjiEUq709wcsq78354vKtEj
         biM0gUvQubO+0tpztSQvu9FQUWcmjpQQTYatoijFi0N6WU8mEnRmfAf4bWorufFX72OK
         /WFYjoaBxIm/Im6DofSqxkwVwaQh/kHTW7FiOhK/e3h6dCbipayp2CJ2Zi7V2WARzTDl
         +D3ckZ7++zB3AkjcLVCGrb94nSbGIbk4HnTdbbZ7MpQ6ynL7jA4x0IN8YDViRirz5Zsz
         6Kbw==
X-Forwarded-Encrypted: i=1; AJvYcCUZF4mjdLkdMJDRDCeqs7udMN39YUK5ovWoy+8XGd673Ay9H7zkamLEUBIYMkWulL02npcni/6MX/eM57UpALo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3WOrUZ+zkSRAeZJRCZI7FaroVKI/rtO2pIWK73Fb4c0/k1vA9
	I4R3RwUNQ+i9FQrQGLQp3py2a7uA97UcHNBH+83ZW7geW00Ya9RP2TRL8+YAbiGV/J6+3du2ehY
	t1/c3fXF+nQNOlPBPTqXlmcmiL/9BMkWYpxfBM4rmnSPPJvGxO2ba1jCxPUlYeZTa9W3y5A==
X-Gm-Gg: ATEYQzxg8iqYXUgU586nFrOKAvnyrmfVmceApmYw/Y7GDZak5PLYBhR0Xl/7lHBkefB
	IBh6AaTZieutt3/oQdMiU1FAFCPtWwMEITITT7IVNSj/xWdj0JCgZxmmIpRM9cZnsyF/RpjV82c
	myWQ3osHtpxURoYmfIlJSYGsnShz9TAtxODb0Y4MOIUdgtUSfuxioOwEMNKcvtQuQSdVpHcibMg
	uiJLkpsVnJlWPkWYQ2O75e8Pq0RyWKAIl1XOUBS7w2EeBDDsra0Zx5XPYFtwmh9Qi0umn8/n6tj
	ED2JESDVDxQPyJHGLAMQzO68dbzvCM45TsHh6QWcoIvy2SSyvnUNajYmPiCLtFvGI3GiFkvn0i0
	zPYt3MbOfdQSJrR+l7w==
X-Received: by 2002:a17:90b:1850:b0:35b:b52d:f34d with SMTP id 98e67ed59e1d1-35c2ffaffdcmr15364776a91.5.1774948586980;
        Tue, 31 Mar 2026 02:16:26 -0700 (PDT)
X-Received: by 2002:a17:90b:1850:b0:35b:b52d:f34d with SMTP id 98e67ed59e1d1-35c2ffaffdcmr15364761a91.5.1774948586559;
        Tue, 31 Mar 2026 02:16:26 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe6fcea1sm998457a91.16.2026.03.31.02.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:16:25 -0700 (PDT)
Date: Tue, 31 Mar 2026 17:16:23 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] selftests/mm: serialize local_config generation for
 parallel builds
Message-ID: <acuQ51e_qd6yfa46@redhat.com>
References: <20260331040156.119158-1-liwang@redhat.com>
 <20260331040156.119158-2-liwang@redhat.com>
 <20260330222948.c2cc6544492e68ded355abca@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330222948.c2cc6544492e68ded355abca@linux-foundation.org>

On Mon, Mar 30, 2026 at 10:29:48PM -0700, Andrew Morton wrote:
> On Tue, 31 Mar 2026 12:01:54 +0800 Li Wang <liwang@redhat.com> wrote:
> 
> > The mm selftests generate both local_config.mk and local_config.h from
> > check_config.sh. With high parallelism (-jN), this can race and lead to
> > incomplete target builds (e.g. only a few binaries get built after
> > 'make -j100', while 'make -j1' builds everything).
> > 
> > Switch to a stamp-based dependency:
> > 
> >   local_config.stamp: check_config.sh
> >         ... run check_config.sh ...
> >         touch local_config.stamp
> > 
> > and make local_config.mk/local_config.h depend on the stamp.
> > 
> > This ensures check_config.sh is executed once per update decision and
> > removes the parallel race window. Also hook local_config.stamp into
> > EXTRA_CLEAN.
> > 
> > No functional change intended for non-parallel builds.
> > 
> > Reported-by: Andrew Morton <akpm@linux-foundation.org>
> 
> Well, the wind changed direction.  I saw this race a single time today
> but now I'm trying to produce a reliable before-and-after report, it
> isn't cooperating - everything is now building with -j100 with and
> without this patch.
> 
> So not very helpful, sorry.

No worries, we can hang this one as well.

Let me send to kbuild ML with the two valid fix (1/4, 4/4),
I will reformat them.

-- 
Regards,
Li Wang

