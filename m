Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2646448D18;
	Wed,  9 Sep 2026 18:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979646; cv=none; b=JHhGuIkxOKyDULS2zRfGzgmOqKYQ1PLcmx4GDb8j3R7slGHOswUUuPClTrlj7D7+FD+oDiqw4l30UOgEXp5tf8W+kE3S+5qpBhXyJhpo6pAtHVT/pwMdRwh8NWxvTHpb5Vsfdp5ZNH3T/7IIZ8/zQBfGy3yUEKTOzxacJfBRNkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979646; c=relaxed/simple;
	bh=4hjOOWXKP/Z2RIl4zAUqiVgWHAB4EEVNfl4roXiWLyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCo3ZxrBPe0bSgxy5Bq324bWGTk9R7K28Ujkoxzu04ZmdTIGheXzQDJXNGZmEo3Vq4VaFdJbzRrdrFAaPMNeNFzdvTA2D0lFhZQvh/uaeG45Zxjjk2UHIkjKyXFofYowpr477CAhYaOnzPB0zdoMfcuxukxUXiw9e3z+JQrl/m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=beQ93UYl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ehxgvOYk; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="beQ93UYl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ehxgvOYk"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 9D6CD1D000F7;
	Wed,  9 Sep 2026 14:47:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 09 Sep 2026 14:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1788979643; x=1789066043; bh=/E8EUsi9XW
	AeteeJp/t/J87SvqxmYV+vojsxbJ0Wxgw=; b=beQ93UYlN4l2A5SxQWIxjlKjAM
	m9lwItz71BgA/08i447u2Kq/F6WrmbtOrI75g0ze52RYGXmy8p5agYfG219r4/f3
	gl3gRN8zcaEB+zvxLSoaH4yZGIvwUEd6RPHkZJTpsZBsyco04OUMNhcleRQYuMSz
	DxfIuLS6V5HvRFca2VrjteceXPltaxkK3kAX2TfKLEgurJXH0Kpdo0ZGZzQA8wSQ
	Nhcsv2OTaPlexdCNClLQfCufjMOkiBHeIuvgA5lpZBxRKwxwN6xiUY5noxC8s4Ub
	C7UKnGfJnwFjRALlcXnMzskp7jiorOGIOh6Ck5CvYggFES6V9DCt+7HKDW1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788979643; x=1789066043; bh=/E8EUsi9XWAeteeJp/t/J87SvqxmYV+vojs
	xbJ0Wxgw=; b=ehxgvOYkt8CiR94Lhp2sN3+vpWzVJTuOdVNgtg8tFdwDqerWEb6
	fxZLml6MHXIMFeiMLKUz1QOk9lJJs9Me8O0/YGRgX+y2zdFQSfgK2p6/rcCTAX62
	OpF/k2aeKcARr2wrCXJt8KWCG73oM17lvUO10J+kBzG4m4stmuHBRxfpHA68GUBZ
	W1DVwv7oNK/hSpGaQjn5ECx7bRc6iJkvDbfP9RQWKuG6Ls+eE1LTDiBNSsDimb/1
	yGN+jbCAQIfPCh+kk9/z08ClFKeU7n/kt3tYcMDZsXfhsjqeQf7zSjqdJc6TJPGn
	fbt8jrX8j1CXLDgoS3urqAY8VUJK63PYSsw==
X-ME-Sender: <xms:u6mhahK4HU0HPPn1GG7h_fzsRGki2JODvE0oJBVGH1Hv2plko7RztQ>
    <xme:u6mhao_20JKy45ZSTHfNe64ILMxUvSjPMLrXt53Zbga8UFAs9iEEo__NG3EBL6mNU
    3aKQ1_VTC8w7j7m6TDEltaUvragxIFTfbWiojy61HutH9zbF57voypv>
X-ME-Received: <xmr:u6mhalGuolZ3CO8qDJbcP747jviPHDg2_yqLA8pLEvHSsMcowWtkb3kDnWfWPm6HXg>
X-ME-Proxy-Cause: dmFkZTGt5cwZFEqRaLH3cikRR/hI/9HY9UJ/mJgqZ0vrjqAK0ARTrcB5WKoKL4iOa7nrPR
    m6NPH4498FhZQnWWoEjUvxEqOSB/PxMEmZcvY7Grj8wflVHXapdJid7mhxwJHj8EIrfFfh
    Fy9qfY4QE74B9KasvrvnO29H1mVk05zoXRhNypRI1cMouzjYn+bQov8/KFzWjoUtwWkyMI
    Y69UReNU6HW8rbWDEYuf5+kyKJc6sGyeobZ4lTBEXEUbVJDEo+M80VP36EaxTHfVG2mxhs
    4M03pymazud3loB01a2UA8zb3941tJJ6MDW/q+zEd6a6xDqrGIS0tNgRn9xKDWauqnIsUa
    YZqhB+j0f/O4+iswV5DItjtalT8IsKMRYgJDwotSodn4/4SmRWH0i7cBnuxNXLcF5ygKrn
    2ClJysrZqfbR+njeeHCa+ff0PZXV+P2oyp447cAAfZ/p6jLphOmZvceS6+oaOD6EA1w1S1
    7dnUln/IBmRnk/tnC9lWw9jL/fEOY61B68o83a5Qb8OB3GZ72ZrT2hpdj1rgB7zjzA0Zf3
    oAbfKUamf7/Z4pZLaaZ7IoDZxQTnulf/V3AgliFejh0u+7JC9Q6LU5xYOThdU4VMmqTQwS
    6/m2DYfUIVVbTIEhwhwgj0IttLHMwuwkNl/+PzA43DLvox4QM3d6DJjQNIYg
X-ME-Proxy: <xmx:u6mhar47Oy9kNhR_yPwykbmCyJZDwTNg8sXeTWoMtcOrpoZeT7e55A>
    <xmx:u6mhama6l3GzEEUzpiD_SEVYpYmm67s56XMHtm9Vw5DkXPksVNGelQ>
    <xmx:u6mhahjTGCRC82d20RH2Bn_HIdceqhAafyU1XKApY8z5sdfcmQYcsQ>
    <xmx:u6mhagd_8t93rcdb1NJokKtk0PMtB3fOIv5U8XnazrV3ZK0Th2d-6g>
    <xmx:u6mhav1DF-t142iWY4zLLnq3rFlaQUskhGmrvZVI1Lo4A-ddze0WKfd9>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 14:47:22 -0400 (EDT)
Date: Wed, 9 Sep 2026 13:47:21 -0500
From: Juanlu Herrero <juanlu@fastmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, dw@davidwei.uk, netdev@vger.kernel.org, 
	io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kuba@kernel.org, asml.silence@gmail.com, pabeni@redhat.com, shuah@kernel.org
Subject: Re: [net-next,v6,5/6] selftests: net: add multithread server support
 to iou-zcrx
Message-ID: <aqGpOjOk_XJ-Nzmr@jlhe0197-mac>
References: <20260831-iou-zcrx-v6-5-02d1d012f0fd@fastmail.com>
 <178839229706.3394541.1555608492152892136@kernel.org>
 <aqGGevrEG5+iZosZ@devvm29614.prn0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqGGevrEG5+iZosZ@devvm29614.prn0.facebook.com>

On Wed, Sep 09, 2026 at 09:16:58AM -0600, Bobby Eshleman wrote:
> On Wed, Sep 02, 2026 at 11:38:17PM +0000, netdev-bot+sashiko@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 6 potential
> > issue(s) to consider:
> > 
> 
> [...]
> 
> > > @@ -356,29 +444,68 @@ static void run_server(void)
> > >  	if (ret < 0)
> > >  		error(1, 0, "bind()");
> > >  
> > > -	flags |= IORING_SETUP_COOP_TASKRUN;
> > > -	flags |= IORING_SETUP_SINGLE_ISSUER;
> > > -	flags |= IORING_SETUP_DEFER_TASKRUN;
> > > -	flags |= IORING_SETUP_SUBMIT_ALL;
> > > -	flags |= IORING_SETUP_CQE32;
> > > +	pthread_barrier_init(&setup_done, NULL, cfg_num_threads + 1);
> > > +	pthread_barrier_init(&dispatch_done, NULL, cfg_num_threads + 1);
> > > +
> > > +	for (i = 0; i < cfg_num_threads; i++) {
> > > +		ctxs[i].queue_id = cfg_queue_id + i;
> > > +		ctxs[i].setup_done = &setup_done;
> > > +		ctxs[i].dispatch_done = &dispatch_done;
> > > +	}
> > >  
> > > -	io_uring_queue_init(512, &ctx.ring, flags);
> > > +	for (i = 0; i < cfg_num_threads; i++) {
> > > +		ret = pthread_create(&threads[i], NULL,
> > > +				     server_worker, &ctxs[i]);
> > > +		if (ret)
> > > +			error(1, ret, "pthread_create()");
> > > +	}
> > >  
> > > -	setup_zcrx(&ctx);
> > >  	if (cfg_dry_run)
> > > -		return;
> > > +		goto join;
> > >  
> > >  	if (listen(fd, 1024) < 0)
> > >  		error(1, 0, "listen()");
> > >  
> > > -	add_accept(&ctx, fd);
> > > +	pthread_barrier_wait(&setup_done);
> > 
> > [Severity: High]
> > Is the listen() intentionally moved before the workers have registered
> > their ifqs? The main thread creates the threads, calls listen(), and only
> > then waits on setup_done, while the workers reach that barrier after
> > io_uring_queue_init_params() plus setup_zcrx(), i.e. after
> > io_uring_register_ifq() has restarted the device RX queue.
> > 
> > Before the patch the sequence was serialized in one thread:
> > 
> > 	io_uring_queue_init(512, &ctx.ring, flags);
> > 	setup_zcrx(&ctx);
> > 	...
> > 	listen(fd, 1024);
> > 
> > so the port only became visible once the memory provider was installed.
> > 
> > Two existing tests depend on that ordering. wait_port_listen() in
> > net/lib/py/utils.py polls every 5 ms, so it can now return while
> > registration is still in flight:
> > 
> > iou-zcrx.py:test_zcrx_large_chunks() {
> > 	wait_port_listen(cfg.port, proto="tcp")
> > 
> > 	check_iou_rx_buf_len(cfg, rx_buf_len)
> > }
> > 
> > check_iou_rx_buf_len() raises "Expected 1 io-uring page pool, found 0",
> > and nk_qlease.py:test_destroy() does queue_get() plus
> > ksft_in("io-uring", queue_info) immediately after wait_port_listen() with
> > no sleep.
> > 
> > Beyond the harness races, data delivered into the queue before the
> > provider exists is serviced by the copy fallback rather than zero copy,
> > and the queue restart during registration can drop in-flight frames.
> > 
> > Would moving listen() below pthread_barrier_wait(&setup_done) restore the
> > previous guarantee?
> 
> Just a heads up that I tested this on BRCM and did find this listen()
> ordering issue to cause genuine (but flaky) regression for
> nk_qlease.test_destroy. Moving the listen() to after wait(setup_done)
> indeed fixed it.
> 
> Best,
> Bobby

thanks for testing on BRCM and I will do the same as a venue to validate
any fix I do for the listen() ordering issue in v7!
