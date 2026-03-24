Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF583C5DA3
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 22:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774392570; cv=none; b=I3nxKxFm6ZAo6t45t98sgUOaS2pe3zVex5sVQ4eUTsSfED+7d1EbfeEQ2iowtC5BbOo+F73HuNDTlA3nPWoypSCsNlUr8ZDezr8V08odYvcUAt1RbA7fm4qjOY2dfhFrfe5xEaBMTbwxZHB09sKkavXXoZuSti4EAkU7GoTBmBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774392570; c=relaxed/simple;
	bh=x66sLBkPM9N4hLXn1DtA+Tsks0CxriXlzYTWpFI/SYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhKYIUR4zN0/RY7uUDcJm5jrzgsXAiC5xTnWqlH2oEFoXHJ9C/aLgdzpSN5QYgiLUqmUWCAmo8CiTCMbFHI6XRb8EZAPUJ7PKnQ1fZjJxnEI0KDuJG26QTaMoshJ7xdoX4ydTuBw+5wDU8yHIDQR1fB/vFg0lHyXe89aZgpeXMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goFNEleL; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goFNEleL"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c0ea57fea7so7372245eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 15:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774392569; x=1774997369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNx1VzVQBg2bGT4I9Bs+XmhXlek+bgkFq6Ick2G8sfw=;
        b=goFNEleL/6OQLHn+J+oosYrN144Gvq3n9PxHX01b3AOoBSzMntlYyfDBUev1IPmigZ
         PJNtk4Puil6DsOG08u2pCFDFISC0hZRWi1B9SPmvozkwDXnq7KMGHUMsTG48keNg0TzD
         4ux7C9aM+cSk5nll4X0cKKMzWfJza7Ui2/qr02Y9axCLE+5UeHxyAg+zw5hr5ZMGy+s2
         Wr13RXhhNNJkgmTqx7vNdoQdlkz6i4BFXe5JyxWiA7mIuFsP21vN0NKAed52WPvzDxz3
         ClVP44k1pNh21rMwxWJ+CfYqfExhhx0OcvYywKMsYisw5flN0b4YHgQc14etyGiDFJ7r
         1NCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774392569; x=1774997369;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gNx1VzVQBg2bGT4I9Bs+XmhXlek+bgkFq6Ick2G8sfw=;
        b=ZxVHid9fUEV7LeF3ue0/FRlW+L4w26RKEORWrA9xCx0kFrMJ2NvBp3TatzWhj33Iua
         aXKzbJQ7l/NsP8git2SD4+IK5Xyy+ewKYmLW1kfeubZZO+dQm6n0lYXiXw4PaeaEep5v
         Rk9iirTaRM0VJGb8AP0xrV+JfB8By/MpDlfG15I7OlPvreQl8WIIx+IY3sLa9NnhFikg
         RPFWmhjPAl0zdhcguOZFS3wn8wbCSRJEszZPOCJZvfV20yM22VBk5f44Um9Rj6zWd7ke
         u8quNAfbosIZdjJj1CWWQ7GfCfR6c81hEjzlemtEmOaSLjUfNC2ilWnGa93YdM55RRYJ
         DJRg==
X-Forwarded-Encrypted: i=1; AJvYcCUoBhl7cfmD1hD1XOHjnRMlyCf6xeP/qv3mnl9XtW8igzLHkIE3aiH5hRz3dGB+lkoxFTbFYk6xze9kkunYxpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHBfNgOqPK1RzePScJZjn5EfVOhuJFrB3PcTASRhcB44aIPGoS
	RPOddKcvRar2njCp/WvEI4+DSw7+55jNXOLFtUVPJEyLrxgELcU+tHM=
X-Gm-Gg: ATEYQzyCIXNTtplktZrlue5uLKJtF6NbS3ndNLt5up8FBJqEI3SHhrEq+7qevcxd9SS
	CVu6+PpAwsJmnBfEhmFKQWHSkGH5N+OqENAS2q7t4BeP15Vh/RpeKF/i+wT/KrQSrb68ZGGz/HL
	uqwJqjPRar2aafVzSgc80DypNz+A9hh0oNRuww0BGI1Q4QE28RuVGDAIE/2kvYd4Is9BoZXb4vF
	MWZj1OGylsgEEjYRwG860Zc2Fl0XNDc1UNgddI/190li5RD59y/3eAaDfzlWKwMgpqu6mzilqeL
	2QBhO7fe3nbjynq/o2lrNzSGiOugJLTKnX1+ipHqclSZ+U/9ki0keWqXg9qqgvVB0SoUi1y4W6x
	zXCsEeVMzYC+DS9HDjlp1i68XCJff4iNWHe01AJfQPhBRYafm++O2T8ONcsb14XERH0akjmd0nz
	sh35ap0t2Lzikw48pLvNA6cexrts96GyEGlRvUxeCl9zpXxUU6ComTC9iWe+chbIBY9n3WUO8Gh
	7qjfLnruSUoXZXEH4/ewls/Z/Gi
X-Received: by 2002:a05:7301:6582:b0:2c1:2999:498e with SMTP id 5a478bee46e88-2c15d3a1176mr717588eec.18.1774392568523;
        Tue, 24 Mar 2026 15:49:28 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b1961a2sm16796758eec.12.2026.03.24.15.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:49:28 -0700 (PDT)
Date: Tue, 24 Mar 2026 15:49:27 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, saeedm@nvidia.com, tariqt@nvidia.com,
	mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
	johannes@sipsolutions.net, sd@queasysnail.net, jianbol@nvidia.com,
	dtatulea@nvidia.com, mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com, willemb@google.com, skhawaja@google.com,
	bestswngs@gmail.com, aleksandr.loktionov@intel.com, kees@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: Re: [PATCH net-next v3 03/13] net: introduce ndo_set_rx_mode_async
 and dev_rx_mode_work
Message-ID: <acMU93XN02PHmAGi@mini-arch>
Mail-Followup-To: Stanislav Fomichev <stfomichev@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, saeedm@nvidia.com, tariqt@nvidia.com,
	mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
	johannes@sipsolutions.net, sd@queasysnail.net, jianbol@nvidia.com,
	dtatulea@nvidia.com, mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com, willemb@google.com, skhawaja@google.com,
	bestswngs@gmail.com, aleksandr.loktionov@intel.com, kees@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-kselftest@vger.kernel.org,
	leon@kernel.org
References: <20260320012501.2033548-1-sdf@fomichev.me>
 <20260320012501.2033548-4-sdf@fomichev.me>
 <20260323162003.0d155055@kernel.org>
 <acLUMN1BYkIVyOk8@mini-arch>
 <20260324142114.216fcb01@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324142114.216fcb01@kernel.org>

On 03/24, Jakub Kicinski wrote:
> On Tue, 24 Mar 2026 11:13:04 -0700 Stanislav Fomichev wrote:
> > > > +		netif_addr_lock_bh(dev);
> > > > +
> > > > +		err = __hw_addr_list_snapshot(&uc_snap, &dev->uc,
> > > > +					      dev->addr_len);
> > > > +		if (!err)
> > > > +			err = __hw_addr_list_snapshot(&uc_ref, &dev->uc,
> > > > +						      dev->addr_len);
> > > > +		if (!err)
> > > > +			err = __hw_addr_list_snapshot(&mc_snap, &dev->mc,
> > > > +						      dev->addr_len);
> > > > +		if (!err)
> > > > +			err = __hw_addr_list_snapshot(&mc_ref, &dev->mc,
> > > > +						      dev->addr_len);  
> > > 
> > > This doesn't get slow with a few thousands of addresses?  
> > 
> > I can add kunit benchmark and attach the output? Although not sure where
> > to go from that. The alternative to this is allocating an array of entries.
> > I started with that initially but __hw_addr_sync_dev wants to kfree the
> > individual entries and I decided not to have a separate helpers to
> > manage the snapshots.
> 
> Let's see what the benchmark says. Hopefully it's fast enough and 
> we don't have to worry. Is keeping these lists around between the
> invocations of the work tricky?

Yeah, that sounds doable, don't think it's too tricky, just extra
list_head on net_device + change the alloc/free to use it.
And then we keep this cache around until unregister? I will try to add it as
a separate patch to cache these entries to keep it simple for review..
 
> > > Can we give the work a reference on the netdev (at init time) and
> > > cancel + release it here instead of flushing / waiting?  
> > 
> > Not sure why cancel+release, maybe you're thinking about the unregister
> > path? This is rtnl_unlock -> netdev_run_todo -> __rtnl_unlock + some
> > extras.
> > 
> > And the flush is here to plumb the addresses to the real devices
> > before we return to the callers. Mostly because of the following
> > things we have in the tests:
> > 
> > # TEST: team cleanup mode lacp                                        [FAIL]
> > #       macvlan unicast address not found on a slave
> > 
> > Can you explain a bit more on the suggestion?
> 
> Oh, I thought it's here for unregister! Feels like it'd be cleaner to
> add the flush in dev_*c_add() and friends? How hard would it be to
> identify the callers in atomic context?

Not sure we can do it in dev_xc_add because it runs under rtnl :-(
I currently do flush in netdev_run_todo because that's the place that
doesn't hold rtnl. Otherwise flush will get stuck because the work
handler grabs it...
