Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF62C28725B
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668919; cv=none; b=IWMAtquXwArKVEP6NikeWIR4PctA8uvC9npz1PPu1iqtoh1SiuUfEnGmvN9j5QmNfiGG29B1721QRi2fYApvwoL9nOLJcZRMwd1qWTzx7yNEf1Hy+G+9PBh7ljWcOkYz5aDQWE7J9RH0oDU+WvmI13as4XMmRt616S3YBdcgTQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668919; c=relaxed/simple;
	bh=ar7PNNwubFmz/KFNVROu+Mptdoo1p3LJaovsqO4uKIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=goN60k5LSyWlBBhJ7jzKREAWi3qPwCiohqdqcj2EHftF86Jm7Z6sVv1yqb6Rto1dg1VGXtmERZAWBxw+pSh87aLy69x45WsAQdGOM1bgXL6V5gZ9CCzs2zk2E9XxZzMGxP8eVBsBhijrBl9WgPt7evPZadhysyay8Ql6VlheSbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ObFdUo8H; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ObFdUo8H"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-46015dc517aso1662936f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 07:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780668912; x=1781273712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k14EL7aYp7IEaeb25debKuZ2KvULiegeh2pxlfcnkdQ=;
        b=ObFdUo8H5NyEpcNT/UDQugmzuiQFtvLTADV6X2GmhUUj7oG307GSPePwmdqffW+ly0
         qnvx18mvY5WmEJADv6mjD/6hLuNDcz2ZC5ke5EYW3xclfKUdVmXa959KSwepRxTMB4pE
         tRM76jTgmHcIS/cpuQBpVLEhIWqkoVihFApqWSHsZaIl/iDm5AGeIAY1nQddmSp7ccny
         vukbWW7D9XhNm3R+Msu52RzX3f9dyqVU02btey9JggYMUiSYMFWe/aaoO3FOW/1UbwoF
         M72SzY+aKy/d3UNWaJ3kxoSaL+bcp2Ns5FO73QTRkLrA3/MIL4zL0AqkmZojZCXjVzn2
         x9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780668912; x=1781273712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k14EL7aYp7IEaeb25debKuZ2KvULiegeh2pxlfcnkdQ=;
        b=bNtVRqUNTfEYpthc3P2KepBxdoOEcFKhBQEXHkiKa0pxStIT5x8uQU2/F9+EYiAwKs
         kNXYe+G0IRie+IHCmnmrzlsvfXuWNem40r5IOkdjyc+4UpAlHx9y3qJp1tsGi6N9Fgjt
         TURpiFEqV9jAkrCUNd9EvjTyWqL62DONhps/N9LKdwe+UXjJgDOEFHxMDvYIChNtKd8e
         3PO5bJHnpXu/4S+UNHGnRFHUiY03+m3XWROawgiReJ057zoz9zaZyVVRnSB7W5/a0xg+
         YLJZUF1RcdCpL62JwPn9nzPZUgOjTYAH1bwwOYChNZFe0SrUg7VMJhVolQeDn38TCqie
         Z0oA==
X-Forwarded-Encrypted: i=1; AFNElJ+OO78KUa+bK1+hWyKZ1QoxkzzANLKoEixJMWm+Ub6QcUcXwVOGrAOrmC03hzMwujGuKBM5J2hlNEzlK9Xuvac=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdzBlSUHFEJKZvOl0LHLbotdso4jwIcZe04ZYT7MicVtf4oiuN
	7WQecPEHAzca/VVam+IHEZGEmtpZueejtRUtbON7Vw5bwf+ONpUTrUsUS3yniFKOPIw=
X-Gm-Gg: Acq92OHBne+S/WKgi6Lqe5pyIr/6n0gp02tjQLHL2JHU9RmBdqxWl+B52ES1PuMxEeq
	orPjqeyFydxf5k5iF6N8GC8JOal8nVWafd8UN3U37/WAeK2FgFMnzmAeUy2qrU5W7xpu6Dri3Pf
	1OcZAVRv+uEU/i3pmh7wgiRTFr1bdwnPfhIoka0oYBp/v3eSujHnoInzVRj+BQ4ktJf88yrOtfR
	Qty6IX+vTXbjk9bnbCp663AdHgDytzfdupwM1bZlPO4HBUrVDiQbmMSTXyyhi7i8f8Hi/ZNoqY/
	R9QsMvkNU5Vt2rqA3qlWhDHk1riaYVvnEMPnWm4AryigT5kEAGa+6AgxXsxM7MGdcZtChhUyH1i
	rR2kTw1ShWdfpS/hdP63zH00hyEpTtX2YaWlHc7cbcjTt0xhYOgpzNJqTZvjJnpSPoY9/xC7XQn
	PoSIkCAlcGHthltMFV2ph1KmkwEDWfImDZUpsO
X-Received: by 2002:a5d:44c8:0:b0:45d:41e0:467b with SMTP id ffacd0b85a97d-460304edd03mr4778392f8f.3.1780668911802;
        Fri, 05 Jun 2026 07:15:11 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm25521409f8f.37.2026.06.05.07.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 07:15:11 -0700 (PDT)
Date: Fri, 5 Jun 2026 16:15:08 +0200
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Shuah Khan <shuah@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	linux-kselftest@vger.kernel.org, marcos@mpdesouza.com,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] selftests: livepatch: Remove leftover modules when a
 testcase fails
Message-ID: <aiLZ7BjO6mu7eydP@pathway.suse.cz>
References: <20260524-livepatch-unload-on-fail-v1-2-7465de7f741d@suse.com>
 <20260525000622.3D4551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525000622.3D4551F000E9@smtp.kernel.org>

On Mon 2026-05-25 00:06:21, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The cleanup loop iterates over the TEST_MODS array in forward order, violating dependency requirements and causing rmmod to fail.
> - [Medium] Functions invoked during cleanup call die() on failure, prematurely aborting the EXIT trap and skipping pop_config().
> --
> 
> commit aafb48b2a54fe2209742378f31fb96583598557a
> Author: Marcos Paulo de Souza <mpdesouza@suse.com>
> 
> selftests: livepatch: Remove leftover modules when a testcase fails
> 
> This commit introduces a cleanup mechanism for livepatch selftests that
> tracks loaded modules and attempts to remove them if a test fails or exits
> prematurely. It uses a TEST_MODS array to keep track of dependencies and
> unloads the remaining modules during an EXIT trap.
> 
> > diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
> > index 3ec0b7962fc5c..25f1370038654 100644
> > --- a/tools/testing/selftests/livepatch/functions.sh
> > +++ b/tools/testing/selftests/livepatch/functions.sh
> [ ... ]
> > @@ -125,6 +127,14 @@ function set_ftrace_enabled() {
> >  }
> >  
> >  function cleanup() {
> > +	# Remove leftover modules in reverse order to handle dependencies
> > +	for mod_item in "${TEST_MODS[@]}"; do
> 
> [Severity: Medium]
> Does this loop actually iterate in reverse order?
> 
> The comment states the modules will be removed in reverse order to handle
> dependencies, but ${TEST_MODS[@]} expands the array in ascending index
> order.
> 
> Because dependent modules (like livepatches) are loaded after their base
> modules, iterating in forward order will attempt to unload the base modules
> first. This would likely cause rmmod to fail with a module in use error.

The ordering should not be important. It does not matter whether the
livepatch or livepatched module is removed first. And only one
livepatch is enabled when atomic replace is used.

I believe that the ordering does not matter even when more livepatches
are enabled and the atomic replace is not used. Anyway, there is
an idea to make the no-replace livepatches trully independent,
see
https://lore.kernel.org/r/20260529034542.68766-1-laoar.shao@gmail.com

I would personally ignore the ordering here.

Best Regards,
Petr
